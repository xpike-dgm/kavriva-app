"""T-E3-011: byte integrity, exact classification and lineage on derivatives."""

import hashlib
import sys
import unittest
from dataclasses import FrozenInstanceError, replace
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "public"))
from object_boundary import (
    CLASSIFICATIONS, DERIVATIVE_KINDS, QUARANTINE, ObjectBoundaryError,
    create_original, derive_object, verify_object, verify_derivative,
)


def original(**changes):
    fields = dict(object_id="source-1", generation=1, payload=b"source bytes",
                  classification="private", owner_id="owner-1", retention_policy_ref="policy-1")
    fields.update(changes)
    return create_original(**fields)


class ObjectBoundaryTests(unittest.TestCase):
    def assert_reason(self, reason, fn):
        with self.assertRaises(ObjectBoundaryError) as caught:
            fn()
        self.assertEqual(caught.exception.reason, reason)

    def derive(self, parents=None, **changes):
        fields = dict(object_id="child-1", generation=1, payload=b"derived bytes",
                      parents=parents if parents is not None else (original(),), kind="thumbnail")
        fields.update(changes)
        return derive_object(**fields)

    def test_original_computes_byte_digest_and_quarantines_every_class(self):
        for classification in CLASSIFICATIONS:
            version = original(classification=classification)
            self.assertEqual(version.manifest.digest, hashlib.sha256(version.payload).hexdigest())
            self.assertEqual(version.manifest.state, QUARANTINE)
            self.assertEqual(version.manifest.lineage, ())

    def test_every_derivative_kind_inherits_class_owner_retention_and_source(self):
        for kind in DERIVATIVE_KINDS:
            for classification in CLASSIFICATIONS:
                parent = original(classification=classification)
                child = self.derive(parents=(parent,), kind=kind)
                self.assertEqual(child.manifest.classification, classification)
                self.assertEqual(child.manifest.owner_id, parent.manifest.owner_id)
                self.assertEqual(child.manifest.retention_policy_ref, "policy-1")
                self.assertEqual(child.manifest.lineage[0].digest, parent.manifest.digest)
                self.assertNotEqual(child.manifest.digest, parent.manifest.digest)
                verify_derivative(child, parents=(parent,))

    def test_multigeneration_lineage_keeps_original_and_direct_parent(self):
        root = original()
        preview = self.derive(parents=(root,), object_id="preview")
        exported = self.derive(parents=(preview,), object_id="export", kind="export")
        self.assertEqual({r.object_id for r in exported.manifest.lineage}, {"source-1", "preview"})
        self.assertEqual([r.object_id for r in exported.manifest.parent_refs], ["preview"])
        verify_derivative(exported, parents=(preview,))

    def test_common_ancestor_is_deduplicated_without_losing_direct_parents(self):
        root = original()
        left = self.derive(parents=(root,), object_id="left")
        right = self.derive(parents=(root,), object_id="right")
        child = self.derive(parents=(left, right))
        self.assertEqual(len(child.manifest.lineage), 3)
        self.assertEqual(len(child.manifest.parent_refs), 2)
        verify_derivative(child, parents=(right, left))

    def test_changed_bytes_are_rejected_in_parent_and_child(self):
        parent = original()
        self.assert_reason("OBJECT_DIGEST_MISMATCH", lambda:
                           self.derive(parents=(replace(parent, payload=b"tampered"),)))
        child = self.derive(parents=(parent,))
        self.assert_reason("OBJECT_DIGEST_MISMATCH", lambda:
                           verify_object(replace(child, payload=b"tampered")))

    def test_classification_owner_and_retention_downgrade_are_rejected(self):
        child = self.derive()
        for field, value, reason in (
            ("classification", "community", "CLASSIFICATION_PROPAGATION_MISMATCH"),
            ("owner_id", "other", "OWNER_PROPAGATION_MISMATCH"),
            ("retention_policy_ref", "shorter", "RETENTION_PROPAGATION_MISMATCH"),
        ):
            changed = replace(child, manifest=replace(child.manifest, **{field: value}))
            self.assert_reason(reason, lambda: verify_object(changed))

    def test_relabeling_entire_lineage_still_fails_against_real_parent_bytes(self):
        parent = original()
        child = self.derive(parents=(parent,))
        fake_refs = tuple(replace(ref, classification="official") for ref in child.manifest.lineage)
        fake = replace(child, manifest=replace(child.manifest, classification="official",
                                               lineage=fake_refs, parent_refs=fake_refs))
        self.assert_reason("DERIVATIVE_PROVENANCE_MISMATCH", lambda:
                           verify_derivative(fake, parents=(parent,)))

    def test_missing_parent_lineage_and_substituted_source_are_rejected(self):
        parent = original()
        child = self.derive(parents=(parent,))
        self.assert_reason("DERIVATIVE_SOURCE_MISSING", lambda: self.derive(parents=()))
        self.assert_reason("DERIVATIVE_LINEAGE_MISSING", lambda:
                           verify_object(replace(child, manifest=replace(child.manifest, lineage=()))))
        other = original(object_id="other-source", payload=b"other source")
        self.assert_reason("DERIVATIVE_PROVENANCE_MISMATCH", lambda:
                           verify_derivative(child, parents=(other,)))

    def test_mixed_source_policies_hold_without_inventing_class_hierarchy(self):
        for changes, reason in (
            ({"classification": "security"}, "CLASSIFICATION_POLICY_HELD"),
            ({"owner_id": "other"}, "OWNER_POLICY_HELD"),
            ({"retention_policy_ref": "policy-2"}, "RETENTION_POLICY_HELD"),
        ):
            self.assert_reason(reason, lambda: self.derive(parents=(original(),
                original(object_id="source-2", **changes))))

    def test_conflicting_ancestor_versions_duplicate_parent_and_cycles_fail(self):
        root = original()
        left = self.derive(parents=(root,), object_id="left")
        newer = original(generation=2, payload=b"new source")
        right = self.derive(parents=(newer,), object_id="right")
        self.assert_reason("SOURCE_VERSION_CONFLICT", lambda: self.derive(parents=(left, right)))
        self.assert_reason("DUPLICATE_PARENT", lambda: self.derive(parents=(root, root)))
        self.assert_reason("LINEAGE_CYCLE", lambda: self.derive(object_id="source-1"))

    def test_metadata_bytes_and_unknown_classes_are_required(self):
        for fields, reason in (
            ({"owner_id": ""}, "OBJECT_METADATA_MISSING"),
            ({"retention_policy_ref": ""}, "OBJECT_METADATA_MISSING"),
            ({"generation": True}, "OBJECT_GENERATION_INVALID"),
            ({"classification": "public"}, "CLASSIFICATION_UNKNOWN"),
            ({"payload": bytearray(b"mutable")}, "OBJECT_BYTES_REQUIRED"),
        ):
            self.assert_reason(reason, lambda: original(**fields))

    def test_integrity_check_cannot_activate_or_mutate_object(self):
        version = original()
        self.assert_reason("OBJECT_ACTIVATION_HELD", lambda:
            verify_object(replace(version, manifest=replace(version.manifest, state="ACTIVE"))))
        with self.assertRaises(FrozenInstanceError):
            version.manifest.classification = "official"


if __name__ == "__main__":
    unittest.main()
