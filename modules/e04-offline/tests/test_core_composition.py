import sys
from dataclasses import FrozenInstanceError, replace
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import (Reference, Scope, Entry, Declaration, Part,
                              InvalidComposition, check_composition,
                              declaration_digest, production_gate)


class CoreCompositionTests(unittest.TestCase):
    def setUp(self):
        self.scope = Scope("motorcycle-1", "task-1", "release-1", 1)
        self.parts = tuple(Part(self.scope, role, (role + " fixture only").encode())
                           for role in ("text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"))
        self.declaration = Declaration(self.scope, Reference("applicability", "1", "a" * 64),
                                       Reference("compatibility", "1", "b" * 64),
                                       (Reference("dependency", "1", "c" * 64),),
                                       tuple(Entry(p.part_id, p.part_id, sha256(p.payload).hexdigest()) for p in self.parts))
        self.pin = declaration_digest(self.declaration)

    def check(self, declaration=None, parts=None, scope=None, pin=None):
        return check_composition(self.declaration if declaration is None else declaration,
                                 self.scope if scope is None else scope,
                                 self.pin if pin is None else pin,
                                 self.parts if parts is None else parts)

    def reject(self, reason, **kwargs):
        with self.assertRaisesRegex(InvalidComposition, "^" + reason + "$"):
            self.check(**kwargs)

    def test_exact_complete_fixture_has_no_authority(self):
        result = self.check()
        self.assertEqual(result.reason, "STRUCTURE_MATCH")
        self.assertEqual(result.authority, "NONE")

    def test_every_declared_essential_is_irremovable(self):
        for part in self.parts:
            with self.subTest(part=part.part_id):
                self.reject("INCOMPLETE_CORE", parts=tuple(p for p in self.parts if p != part))

    def test_required_media_cannot_be_separate_on_demand(self):
        self.reject("INCOMPLETE_CORE", parts=self.parts[:-1])

    def test_rehashed_manifest_cannot_drop_essential_against_existing_pin(self):
        self.reject("MANIFEST_PIN_MISMATCH", declaration=replace(self.declaration, entries=self.declaration.entries[:-1]), parts=self.parts[:-1])

    def test_required_roles_cannot_be_omitted_even_with_new_pin(self):
        for role in ("text", "steps", "warnings", "checks", "safe_stop", "recovery"):
            with self.subTest(role=role):
                declaration = replace(self.declaration, entries=tuple(e for e in self.declaration.entries if e.role != role))
                with self.assertRaisesRegex(InvalidComposition, "MISSING_REQUIRED_ROLE"):
                    declaration_digest(declaration)

    def test_corrupt_and_substituted_bytes_rejected(self):
        self.reject("PAYLOAD_DIGEST_MISMATCH", parts=(replace(self.parts[0], payload=b"substitution"),) + self.parts[1:])
        self.reject("INVALID_PAYLOAD", parts=(replace(self.parts[0], payload=b""),) + self.parts[1:])

    def test_no_other_motorcycle_task_or_mixed_generation(self):
        for scope in (replace(self.scope, motorcycle_id="other"), replace(self.scope, task_id="other"),
                      replace(self.scope, release_id="other"), replace(self.scope, generation=2)):
            with self.subTest(scope=scope):
                self.reject("SELECTED_SCOPE_MISMATCH", scope=scope)
                self.reject("MIXED_SCOPE_OR_GENERATION", parts=(replace(self.parts[0], scope=scope),) + self.parts[1:])

    def test_unrelated_full_library_and_duplicates_rejected(self):
        self.reject("UNDECLARED_PART", parts=self.parts + (Part(self.scope, "extra-library", b"x"),))
        self.reject("DUPLICATE_PART", parts=self.parts + self.parts[:1])
        self.reject("DUPLICATE_ENTRY", declaration=replace(self.declaration, entries=self.declaration.entries * 2))

    def test_context_and_dependencies_are_bound(self):
        for changed in (replace(self.declaration, applicability=Reference("other", "1", "a" * 64)),
                        replace(self.declaration, compatibility=Reference("compatibility", "2", "b" * 64)),
                        replace(self.declaration, dependencies=()),
                        replace(self.declaration, entries=tuple(reversed(self.declaration.entries)))):
            self.reject("MANIFEST_PIN_MISMATCH", declaration=changed)
        self.reject("DUPLICATE_DEPENDENCY", declaration=replace(self.declaration, dependencies=self.declaration.dependencies * 2))

    def test_invalid_types_and_mutable_payloads_rejected(self):
        self.reject("INVALID_SCOPE", scope=replace(self.scope, generation=True))
        self.reject("MUTABLE_CORE", parts=list(self.parts))
        self.reject("INVALID_PAYLOAD", parts=(replace(self.parts[0], payload=bytearray(b"x")),) + self.parts[1:])
        self.reject("MUTABLE_DECLARATION", declaration=replace(self.declaration, entries=list(self.declaration.entries)))
        self.reject("INVALID_REFERENCE", declaration=replace(self.declaration, applicability=None))
        self.reject("INVALID_ENTRY", declaration=replace(self.declaration, entries=(replace(self.declaration.entries[0], role="optional_media"),) + self.declaration.entries[1:]))
        self.reject("INVALID_MANIFEST_PIN", pin="ALLOW")

    def test_immutable_assessment_and_declaration(self):
        with self.assertRaises(FrozenInstanceError):
            self.declaration.entries = ()
        with self.assertRaises(FrozenInstanceError):
            self.check().authority = "ALLOW"

    def test_coherent_forgery_and_ready_markers_never_open_production(self):
        touched = []
        for request in (self.check(), {"verified": True, "approved": True, "encrypted": True},
                        lambda: touched.append(True)):
            result = production_gate(request)
            self.assertEqual(result.reason, "HELD_CANONICAL_PACKAGE_SOURCE_MISSING")
            self.assertEqual(result.authority, "NONE")
        self.assertEqual(touched, [])


if __name__ == "__main__":
    unittest.main()
