import sys
from dataclasses import replace, FrozenInstanceError
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import Scope, Reference, Entry, Declaration, Part, InvalidComposition, declaration_digest
from stage_verify_promote import stage_package, VerificationContext, verify_stage
from full_package_fallback import PackageTarget, DeltaHint, plan_fetch, production_gate


class FullPackageFallbackTests(unittest.TestCase):
    def package(self, generation):
        scope=Scope("motorcycle-1", "task-1", "release-" + str(generation), generation)
        parts=tuple(Part(scope, role, (role + str(generation)).encode()) for role in
                    ("text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"))
        declaration=Declaration(scope, Reference("applicability", "1", "a" * 64),
                                Reference("compatibility", "1", "b" * 64),
                                (Reference("dependency", "2", "c" * 64),),
                                tuple(Entry(p.part_id, p.part_id, sha256(p.payload).hexdigest()) for p in parts))
        target=PackageTarget(declaration, scope, declaration_digest(declaration))
        stage=stage_package(declaration, scope, target.expected_digest, parts)
        context=VerificationContext(declaration.applicability, declaration.compatibility, declaration.dependencies)
        return target, parts, verify_stage(stage, context)

    def setUp(self):
        self.old, self.old_parts, self.current=self.package(1)
        self.target, self.parts, self.candidate=self.package(2)
        self.hint=DeltaHint(self.old.expected_scope, self.old.expected_digest,
                            self.target.expected_scope, self.target.expected_digest)

    def assert_complete(self, plan):
        self.assertEqual(plan.mode, "COMPLETE_PACKAGE")
        self.assertEqual(plan.target, self.target)
        self.assertEqual(plan.required_part_ids, tuple(p.part_id for p in self.parts))
        self.assertEqual(plan.authority, "NONE")

    def test_missing_delta_requests_every_required_target_part(self):
        plan=plan_fetch(self.current, self.target)
        self.assert_complete(plan)
        self.assertEqual(plan.reason, "MISSING_DELTA_COMPLETE_PACKAGE")
        self.assertIn("safety_media", plan.required_part_ids)

    def test_stale_mixed_base_or_target_digest_scope_and_generation_fallback(self):
        for hint in (replace(self.hint, base_digest="f" * 64),
                     replace(self.hint, base_scope=replace(self.hint.base_scope, generation=3)),
                     replace(self.hint, base_scope=replace(self.hint.base_scope, motorcycle_id="other")),
                     replace(self.hint, target_digest="e" * 64),
                     replace(self.hint, target_scope=replace(self.hint.target_scope, release_id="old"))):
            plan=plan_fetch(self.current, self.target, hint)
            self.assert_complete(plan)
            self.assertEqual(plan.reason, "STALE_OR_INVALID_DELTA_COMPLETE_PACKAGE")

    def test_exact_hint_does_not_select_unproved_delta_optimization(self):
        plan=plan_fetch(self.current, self.target, self.hint)
        self.assert_complete(plan)
        self.assertEqual(plan.reason, "DELTA_DEFERRED_COMPLETE_PACKAGE")

    def test_missing_base_and_corrupt_base_use_complete_target_without_local_acceptance(self):
        corrupt=replace(self.current, stage=replace(self.current.stage, parts=self.old_parts[:-1]))
        for current in (None, corrupt, True):
            for hint in (None, self.hint):
                plan=plan_fetch(current, self.target, hint)
                self.assert_complete(plan)
                self.assertIn(plan.reason, {"MISSING_DELTA_COMPLETE_PACKAGE", "UNUSABLE_BASE_COMPLETE_PACKAGE",
                                           "MISSING_OR_UNUSABLE_BASE_COMPLETE_PACKAGE"})

    def test_old_same_generation_or_foreign_selected_target_rejected(self):
        with self.assertRaisesRegex(InvalidComposition, "^STALE_FETCH_TARGET$"):
            plan_fetch(self.current, self.old)
        with self.assertRaisesRegex(InvalidComposition, "^STALE_FETCH_TARGET$"):
            plan_fetch(self.candidate, self.old)
        for field in ("motorcycle_id", "task_id"):
            scope=replace(self.target.expected_scope, **{field: "other"})
            declaration=replace(self.target.declaration, scope=scope)
            target=PackageTarget(declaration, scope, declaration_digest(declaration))
            with self.assertRaisesRegex(InvalidComposition, "^FALLBACK_SELECTED_SCOPE_MISMATCH$"):
                plan_fetch(self.current, target)

    def test_unknown_mutable_incomplete_or_changed_target_metadata_rejected(self):
        for target in (None, True, {"complete": True},
                       replace(self.target, expected_digest="f" * 64),
                       replace(self.target, declaration=replace(self.target.declaration, entries=[])),
                       replace(self.target, declaration=replace(self.target.declaration, entries=self.target.declaration.entries[:-2]))):
            with self.assertRaises(InvalidComposition):
                plan_fetch(self.current, target, self.hint)

    def test_hostile_or_malformed_hints_cannot_force_delta_or_callbacks(self):
        class Hostile:
            def __getattribute__(self, name): raise AssertionError("untrusted callback")
        touched=[]
        for hint in (Hostile(), True, {"delta_available": True}, lambda: touched.append(True),
                     replace(self.hint, base_digest=[]), replace(self.hint, base_scope=Hostile())):
            plan=plan_fetch(self.current, self.target, hint)
            self.assert_complete(plan)
            self.assertEqual(plan.reason, "STALE_OR_INVALID_DELTA_COMPLETE_PACKAGE")
        self.assertEqual(touched, [])
        with self.assertRaises(InvalidComposition):
            plan_fetch(self.current, Hostile(), self.hint)

    def test_complete_fetch_plan_is_not_bytes_or_verification_bypass(self):
        plan=plan_fetch(self.current, self.target)
        self.assert_complete(plan)
        partial=stage_package(plan.target.declaration, plan.target.expected_scope,
                              plan.target.expected_digest, self.parts[:-1])
        with self.assertRaisesRegex(InvalidComposition, "^INCOMPLETE_CORE$"):
            verify_stage(partial, self.candidate.context)
        corrupt=replace(self.candidate.stage, parts=(replace(self.parts[0], payload=b"corrupt"),) + self.parts[1:])
        with self.assertRaisesRegex(InvalidComposition, "^PAYLOAD_DIGEST_MISMATCH$"):
            verify_stage(corrupt, self.candidate.context)

    def test_immutable_plan_retains_old_and_no_catalog_expansion(self):
        before=(self.current, self.target, self.parts, self.old_parts)
        plan=plan_fetch(self.current, self.target, self.hint)
        with self.assertRaises(FrozenInstanceError):
            plan.mode="DELTA"
        self.assertEqual(before, (self.current, self.target, self.parts, self.old_parts))
        self.assertEqual(len(plan.required_part_ids), len(self.target.declaration.entries))

    def test_coherent_forgery_cannot_open_actual_fetch_authority(self):
        plan=plan_fetch(None, self.target, self.hint)
        touched=[]
        for supplied in (plan, self.hint, {"canonical": True, "delta_verified": True},
                         lambda: touched.append(True)):
            self.assertEqual(production_gate(supplied).reason, "HELD_CANONICAL_PACKAGE_FETCH_AND_RUNTIME_MISSING")
            self.assertEqual(production_gate(supplied).authority, "NONE")
        self.assertEqual(touched, [])

    def test_extreme_target_context_has_finite_failure(self):
        scope=replace(self.target.expected_scope, generation=10 ** 5000)
        target=replace(self.target, expected_scope=scope, declaration=replace(self.target.declaration, scope=scope))
        with self.assertRaisesRegex(InvalidComposition, "^STAGE_CONTEXT_ENCODING_FAILED$"):
            plan_fetch(self.current, target)


if __name__ == "__main__":
    unittest.main()
