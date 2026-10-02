import sys
from dataclasses import FrozenInstanceError, replace
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import (Reference, Scope, Entry, Declaration, Part,
                              InvalidComposition, declaration_digest, production_gate)
from safety_media_nesting import check_nesting


class SafetyNestingTests(unittest.TestCase):
    def setUp(self):
        self.scope = Scope("motorcycle-1", "task-1", "release-1", 1)
        self.parts = tuple(Part(self.scope, role, role.encode()) for role in
                           ("text", "steps", "warnings", "checks", "safe_stop", "recovery"))
        self.parts += (Part(self.scope, "required-visual", b"safe understanding visual"),
                       Part(self.scope, "required-video", b"safe recovery video"))
        self.declaration = Declaration(self.scope, Reference("applicability", "1", "a" * 64),
                                       Reference("compatibility", "1", "b" * 64), (),
                                       tuple(Entry(p.part_id, p.part_id if i < 6 else "safety_media",
                                                   sha256(p.payload).hexdigest()) for i, p in enumerate(self.parts)))
        self.pin = declaration_digest(self.declaration)

    def check(self, parts=None, refs=(), declaration=None):
        return check_nesting(self.declaration if declaration is None else declaration,
                             self.scope, self.pin, self.parts if parts is None else parts, refs)

    def test_safety_bytes_are_nested_once_not_an_additive_budget(self):
        result = self.check()
        self.assertEqual(result.required_core_bytes, sum(len(p.payload) for p in self.parts))
        self.assertEqual(result.safety_subset_bytes, sum(len(p.payload) for p in self.parts[6:]))
        self.assertEqual(result.safety_media_ids, ("required-visual", "required-video"))
        self.assertLess(result.safety_subset_bytes, result.required_core_bytes)
        self.assertEqual(result.authority, "NONE")

    def test_moving_safety_to_on_demand_cannot_complete_core(self):
        for p in self.parts[6:]:
            with self.subTest(part=p.part_id), self.assertRaisesRegex(InvalidComposition, "^INCOMPLETE_CORE$"):
                self.check(parts=tuple(x for x in self.parts if x != p),
                           refs=(Reference(p.part_id, "1", sha256(p.payload).hexdigest()),))

    def test_every_core_essential_forbidden_on_demand_even_if_present(self):
        for p in self.parts:
            with self.subTest(part=p.part_id), self.assertRaisesRegex(InvalidComposition, "^CORE_ESSENTIAL_ON_DEMAND$"):
                self.check(refs=(Reference(p.part_id, "other-revision", "f" * 64),))

    def test_duplicate_separate_safety_lane_and_corrupt_bytes_rejected(self):
        with self.assertRaisesRegex(InvalidComposition, "^DUPLICATE_PART$"):
            self.check(parts=self.parts + self.parts[-1:])
        with self.assertRaisesRegex(InvalidComposition, "^PAYLOAD_DIGEST_MISMATCH$"):
            self.check(parts=self.parts[:-1] + (replace(self.parts[-1], payload=b"smaller"),))

    def test_reclassifying_safety_against_expected_manifest_is_rejected(self):
        entries = self.declaration.entries[:-1] + (replace(self.declaration.entries[-1], role="text"),)
        with self.assertRaisesRegex(InvalidComposition, "^MANIFEST_PIN_MISMATCH$"):
            self.check(declaration=replace(self.declaration, entries=entries))

    def test_arbitrary_large_media_is_not_trimmed_or_moved(self):
        # Fixture lengths only, not candidate or production size limits.
        for length in (1, 8192):
            parts = self.parts[:-1] + (replace(self.parts[-1], payload=b"x" * length),)
            declaration = replace(self.declaration, entries=self.declaration.entries[:-1] +
                                  (replace(self.declaration.entries[-1], digest=sha256(parts[-1].payload).hexdigest()),))
            result = check_nesting(declaration, self.scope, declaration_digest(declaration), parts)
            self.assertEqual(result.required_core_bytes, sum(len(p.payload) for p in parts))
            self.assertEqual(result.safety_subset_bytes, len(parts[-2].payload) + length)

    def test_empty_declared_safety_subset_not_synthesized(self):
        declaration = replace(self.declaration, entries=self.declaration.entries[:6])
        result = check_nesting(declaration, self.scope, declaration_digest(declaration), self.parts[:6])
        self.assertEqual(result.safety_subset_bytes, 0)
        self.assertEqual(result.safety_media_ids, ())
        self.assertEqual(result.authority, "NONE")  # Not proof real media is unnecessary.

    def test_unrelated_on_demand_declaration_does_not_change_required_size(self):
        result = self.check(refs=(Reference("expanded-photo", "1", "d" * 64),))
        self.assertEqual(result.required_core_bytes, self.check().required_core_bytes)
        self.assertEqual(result.authority, "NONE")  # Not permission to download it.

    def test_mutable_hostile_invalid_and_duplicate_optional_plan_rejected(self):
        class Hostile:
            def __getattribute__(self, name):
                raise AssertionError("untrusted callback")
        ref = Reference("expanded", "1", "d" * 64)
        for refs, reason in (([ref], "MUTABLE_ON_DEMAND_PLAN"), ((Hostile(),), "INVALID_ON_DEMAND_REFERENCE"),
                             ((replace(ref, digest="ALLOW"),), "INVALID_ON_DEMAND_REFERENCE"),
                             ((ref, replace(ref, revision="2")), "DUPLICATE_ON_DEMAND_REFERENCE")):
            with self.subTest(reason=reason), self.assertRaisesRegex(InvalidComposition, "^" + reason + "$"):
                self.check(refs=refs)

    def test_immutable_result_never_opens_real_source_gate(self):
        result = self.check()
        with self.assertRaises(FrozenInstanceError):
            result.safety_subset_bytes = 0
        self.assertEqual(production_gate(result).reason, "HELD_CANONICAL_PACKAGE_SOURCE_MISSING")
        self.assertEqual(production_gate(result).authority, "NONE")


if __name__ == "__main__":
    unittest.main()
