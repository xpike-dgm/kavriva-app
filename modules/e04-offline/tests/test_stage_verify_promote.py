import sys
from dataclasses import replace, FrozenInstanceError
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import Scope, Reference, Entry, Declaration, Part, InvalidComposition, declaration_digest
from stage_verify_promote import (Stage, VerificationContext, VerifiedCandidate, Disposable, SpaceDeclaration,
                                  PromotionProposal, stage_package, verify_stage, propose_promotion,
                                  production_gate, PROTECTED)


class StageVerifyPromoteTests(unittest.TestCase):
    def package(self, generation, dependency=True):
        scope = Scope("motorcycle-1", "task-1", "release-" + str(generation), generation)
        parts = tuple(Part(scope, role, (role + str(generation)).encode()) for role in
                      ("text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"))
        deps = (Reference("dependency", "2", "c" * 64),) if dependency else ()
        declaration = Declaration(scope, Reference("applicability", "1", "a" * 64),
                                  Reference("compatibility", "1", "b" * 64), deps,
                                  tuple(Entry(p.part_id, p.part_id, sha256(p.payload).hexdigest()) for p in parts))
        stage = stage_package(declaration, scope, declaration_digest(declaration), parts)
        context = VerificationContext(declaration.applicability, declaration.compatibility, declaration.dependencies)
        return stage, context

    def setUp(self):
        self.old_stage, self.old_context = self.package(1)
        self.stage, self.context = self.package(2)
        self.current = verify_stage(self.old_stage, self.old_context)
        self.candidate = verify_stage(self.stage, self.context)
        self.old_size = sum(len(p.payload) for p in self.old_stage.parts)
        self.new_size = sum(len(p.payload) for p in self.stage.parts)
        self.pin = self.old_stage.expected_digest
        self.space = SpaceDeclaration(self.new_size + 3, 3, ())

    def propose(self, candidate=None, space=None, pin=None):
        return propose_promotion(self.current, self.candidate if candidate is None else candidate,
                                 self.pin if pin is None else pin, self.space if space is None else space)

    def test_stage_is_separate_and_incomplete_cannot_be_verified(self):
        partial = stage_package(self.stage.declaration, self.stage.expected_scope,
                                self.stage.expected_digest, self.stage.parts[:-1])
        self.assertEqual(partial.authority, "NONE")
        with self.assertRaisesRegex(InvalidComposition, "^INCOMPLETE_CORE$"):
            verify_stage(partial, self.context)
        self.assertEqual(self.current, verify_stage(self.old_stage, self.old_context))

    def test_whole_replacement_proposal_retains_old_and_peak_counts_all(self):
        before = (self.current, self.candidate, self.space)
        proposal = self.propose()
        self.assertIsInstance(proposal, PromotionProposal)
        self.assertEqual(proposal.replacement, self.candidate)
        self.assertEqual(proposal.retained_previous, self.current)
        self.assertEqual(proposal.expected_current_digest, self.pin)
        self.assertEqual(proposal.peak_package_bytes, self.old_size + self.new_size + 3)
        self.assertEqual(proposal.proposed_cleanup_ids, ())
        self.assertEqual(before, (self.current, self.candidate, self.space))

    def test_first_install_proposal_has_no_old_current(self):
        proposal = propose_promotion(None, self.candidate, None, self.space)
        self.assertIsNone(proposal.retained_previous)
        self.assertEqual(proposal.peak_package_bytes, self.new_size + 3)
        with self.assertRaisesRegex(InvalidComposition, "^CURRENT_PIN_MISMATCH$"):
            propose_promotion(None, self.candidate, self.pin, self.space)

    def test_corrupt_mixed_duplicate_and_missing_parts_never_replace_current(self):
        bad_parts = (self.stage.parts[:-1], self.stage.parts + (self.stage.parts[0],),
                     (replace(self.stage.parts[0], payload=b"corrupt"),) + self.stage.parts[1:],
                     (self.old_stage.parts[0],) + self.stage.parts[1:])
        before = self.current
        for parts in bad_parts:
            forged = replace(self.candidate, stage=replace(self.stage, parts=parts))
            with self.assertRaises(InvalidComposition):
                self.propose(candidate=forged)
            self.assertEqual(self.current, before)

    def test_compatibility_applicability_and_dependency_current_reference_match_required(self):
        for context, reason in (
                (replace(self.context, compatibility=replace(self.context.compatibility, revision="old")),
                 "COMPATIBILITY_CONTEXT_MISMATCH"),
                (replace(self.context, applicability=replace(self.context.applicability, digest="e" * 64)),
                 "APPLICABILITY_CONTEXT_MISMATCH"),
                (replace(self.context, dependencies=()), "DEPENDENCY_CONTEXT_MISMATCH"),
                (replace(self.context, dependencies=(replace(self.context.dependencies[0], digest="f" * 64),)),
                 "DEPENDENCY_CONTEXT_MISMATCH")):
            with self.assertRaisesRegex(InvalidComposition, "^" + reason + "$"):
                self.propose(candidate=replace(self.candidate, context=context))

    def test_changed_declaration_against_old_pin_rejected(self):
        declaration = replace(self.stage.declaration, dependencies=())
        with self.assertRaisesRegex(InvalidComposition, "^STAGE_CONTEXT_MISMATCH$"):
            self.propose(candidate=replace(self.candidate, stage=replace(self.stage, declaration=declaration)))

    def test_old_same_generation_wrong_selection_and_concurrent_current_pin_rejected(self):
        for generation in (1,):
            stage, context = self.package(generation)
            with self.assertRaisesRegex(InvalidComposition, "^STALE_PACKAGE_GENERATION$"):
                self.propose(candidate=verify_stage(stage, context))
        newer, context = self.package(3)
        changed_current = verify_stage(newer, context)
        with self.assertRaisesRegex(InvalidComposition, "^CURRENT_PIN_MISMATCH$"):
            propose_promotion(changed_current, self.candidate, self.pin, self.space)
        current_newer = verify_stage(self.stage, self.context)
        with self.assertRaisesRegex(InvalidComposition, "^STALE_PACKAGE_GENERATION$"):
            propose_promotion(current_newer, self.current, self.stage.expected_digest, self.space)
        scope = replace(self.stage.expected_scope, motorcycle_id="other")
        parts = tuple(replace(p, scope=scope) for p in self.stage.parts)
        declaration = replace(self.stage.declaration, scope=scope)
        stage = stage_package(declaration, scope, declaration_digest(declaration), parts)
        with self.assertRaisesRegex(InvalidComposition, "^TRANSITION_SELECTED_SCOPE_MISMATCH$"):
            self.propose(candidate=verify_stage(stage, self.context))

    def test_insufficient_space_holds_and_never_subtracts_old_truth(self):
        space = SpaceDeclaration(self.new_size + 2, 3, ())
        held = self.propose(space=space)
        self.assertEqual(held.reason, "HELD_INSUFFICIENT_STAGING_SPACE")
        self.assertEqual(held.authority, "NONE")
        self.assertEqual(self.current.stage.parts, self.old_stage.parts)

    def test_disposable_only_cleanup_is_ordered_and_stops_when_sufficient(self):
        items = (Disposable("cache", "OLD_INACTIVE_REFETCHABLE_CACHE", 100),
                 Disposable("optional", "NONESSENTIAL_MEDIA", 2),
                 Disposable("temp", "INVALID_OR_ORPHAN_TEMP", 1),
                 Disposable("projection", "REBUILDABLE_PROJECTION", 100))
        space = SpaceDeclaration(self.new_size, 3, items)
        proposal = self.propose(space=space)
        self.assertEqual(proposal.proposed_cleanup_ids, ("temp", "optional"))
        self.assertEqual(proposal.peak_package_bytes, self.old_size + self.new_size + 3)
        self.assertEqual(space.disposable, items)

    def test_every_protected_class_and_relabelled_active_part_rejected(self):
        for label in PROTECTED:
            with self.assertRaisesRegex(InvalidComposition, "^PROTECTED_EVICTION_FORBIDDEN$"):
                self.propose(space=SpaceDeclaration(0, 3, (Disposable("truth", label, 1000),)))
        for part in self.old_stage.parts:
            with self.assertRaisesRegex(InvalidComposition, "^PROTECTED_EVICTION_FORBIDDEN$"):
                self.propose(space=SpaceDeclaration(0, 3, (Disposable(part.part_id, "NONESSENTIAL_MEDIA", 1000),)))

    def test_unknown_duplicate_and_malformed_cleanup_or_space_rejected(self):
        item = Disposable("temp", "INVALID_OR_ORPHAN_TEMP", 1)
        for space in (None, SpaceDeclaration(True, 0, ()), SpaceDeclaration(0, -1, ()),
                      SpaceDeclaration(0, 0, []), SpaceDeclaration(0, 0, (replace(item, byte_count=True),)),
                      SpaceDeclaration(0, 0, (replace(item, data_class="UNKNOWN"),)),
                      SpaceDeclaration(0, 0, (item, item))):
            with self.assertRaises(InvalidComposition):
                propose_promotion(self.current, self.candidate, self.pin, space)

    def test_hostile_mutable_and_bare_verified_markers_rejected_without_callbacks(self):
        class Hostile:
            def __getattribute__(self, name): raise AssertionError("untrusted callback")
        for candidate in (Hostile(), True, {"verified": True}, self.stage,
                          replace(self.candidate, context=Hostile()),
                          replace(self.candidate, stage=replace(self.stage, parts=[])),
                          replace(self.candidate, context=replace(self.context, dependencies=[]))):
            with self.assertRaises(InvalidComposition):
                self.propose(candidate=candidate)
        with self.assertRaises(InvalidComposition):
            stage_package(self.stage.declaration, self.stage.expected_scope, self.stage.expected_digest,
                          (replace(self.stage.parts[0], payload=bytearray(b"mutable")),))

    def test_immutable_proposal_and_coherent_forgery_never_open_production(self):
        proposal = self.propose()
        with self.assertRaises(FrozenInstanceError):
            proposal.retained_previous = None
        touched = []
        for supplied in (proposal, self.candidate, {"atomic": True, "encrypted": True},
                         lambda: touched.append(True)):
            self.assertEqual(production_gate(supplied).reason,
                             "HELD_CANONICAL_PACKAGE_SOURCE_AND_ATOMIC_ENCRYPTED_STORE_MISSING")
            self.assertEqual(production_gate(supplied).authority, "NONE")
        self.assertEqual(touched, [])
        self.assertEqual(proposal.authority, "NONE")
        self.assertEqual(self.candidate.authority, "NONE")

    def test_extreme_context_encoding_has_finite_rejection(self):
        scope = replace(self.stage.expected_scope, generation=10 ** 5000)
        declaration = replace(self.stage.declaration, scope=scope)
        with self.assertRaisesRegex(InvalidComposition, "^STAGE_CONTEXT_ENCODING_FAILED$"):
            stage_package(declaration, scope, self.stage.expected_digest, self.stage.parts)


if __name__ == "__main__":
    unittest.main()
