"""Pure policy tests; all decisions, previews and event receipts are fixtures."""

from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from export_disclosure import (Context, ExportError, ExportField, Inclusion,
                               Observation, Source, minimize_manifest, record_disclosure)


def fixture():
    source = Source("fixture-source", 1, "a" * 64, "b" * 64, "private", "policy-v1")
    fields = (ExportField("maintenance", "private", False),
              ExportField("private-note", "private", True),
              ExportField("sensitive-photo", "private", True))
    manifest = minimize_manifest(source, fields, (Inclusion("maintenance", "inclusion-fixture"),))
    context = Context("generation-fixture", source, manifest.included_fields,
                      "actor-fixture", "maintenance-copy", "recipient-fixture",
                      "destination-policy-fixture", "export", "export-decision-fixture",
                      "preview-fixture")
    observation = Observation(context, "c" * 64, "disclosure-event-fixture")
    return manifest, context, observation


class ExportDisclosureTests(unittest.TestCase):
    def test_default_manifest_omits_every_field_including_sensitive_fields(self):
        manifest, _, _ = fixture()
        minimized = minimize_manifest(manifest.source, manifest.fields)
        self.assertEqual(minimized.included_fields, ())
        self.assertEqual(minimized.omitted_fields,
                         ("maintenance", "private-note", "sensitive-photo"))

    def test_explicit_inclusions_preserve_included_and_omitted_preview(self):
        manifest, _, _ = fixture()
        self.assertEqual(manifest.included_fields, ("maintenance",))
        self.assertEqual(manifest.omitted_fields, ("private-note", "sensitive-photo"))
        reviewed = minimize_manifest(manifest.source, manifest.fields,
                                     (Inclusion("private-note", "reviewed-inclusion-fixture"),))
        self.assertEqual(reviewed.included_fields, ("private-note",))
        self.assertEqual(reviewed.omitted_fields, ("maintenance", "sensitive-photo"))

    def test_missing_duplicate_or_undeclared_inclusion_rejected(self):
        manifest, _, _ = fixture()
        cases = ((Inclusion("maintenance", ""),),
                 (Inclusion("undeclared", "receipt-fixture"),),
                 (Inclusion("maintenance", "first"), Inclusion("maintenance", "second")))
        for inclusions in cases:
            with self.subTest(inclusions=inclusions):
                with self.assertRaises(ExportError):
                    minimize_manifest(manifest.source, manifest.fields, inclusions)

    def test_unknown_or_mixed_classification_cannot_be_downgraded(self):
        manifest, _, _ = fixture()
        for classification in ("unknown", "mixed", None):
            with self.assertRaisesRegex(ExportError, "CLASSIFICATION_HELD"):
                minimize_manifest(replace(manifest.source, classification=classification), manifest.fields)
        with self.assertRaisesRegex(ExportError, "CLASSIFICATION_HELD"):
            minimize_manifest(manifest.source, (replace(manifest.fields[0], classification="official"),))

    def test_ordinary_view_or_preview_receipt_cannot_be_export_decision(self):
        manifest, context, observation = fixture()
        for action in ("view", "read", "download", "ALLOW"):
            changed = replace(context, authorization_action=action)
            with self.assertRaisesRegex(ExportError, "EXPORT_CAPABILITY_REQUIRED"):
                record_disclosure(manifest, changed, replace(observation, context=changed))
        changed = replace(context, authorization_receipt_ref=context.preview_receipt_ref)
        with self.assertRaisesRegex(ExportError, "EXPORT_AND_PREVIEW_RECEIPTS_DISTINCT"):
            record_disclosure(manifest, changed, replace(observation, context=changed))

    def test_empty_stale_or_unreviewed_manifest_selection_rejected(self):
        manifest, context, observation = fixture()
        for selection in ((), ("maintenance", "maintenance"), ("private-note",)):
            changed = replace(context, selected_fields=selection)
            with self.assertRaises(ExportError):
                record_disclosure(manifest, changed, replace(observation, context=changed))
        changed = replace(context, source=replace(context.source, generation=2))
        with self.assertRaisesRegex(ExportError, "EXPORT_MANIFEST_MISMATCH"):
            record_disclosure(manifest, changed, replace(observation, context=changed))

    def test_observation_must_bind_exact_generation_actor_recipient_purpose(self):
        manifest, context, observation = fixture()
        for field in ("generation_id", "actor_ref", "purpose", "recipient_ref",
                      "destination_policy_ref", "authorization_receipt_ref", "preview_receipt_ref"):
            with self.subTest(field=field):
                changed = replace(context, **{field: "different-fixture"})
                with self.assertRaisesRegex(ExportError, "DISCLOSURE_CONTEXT_MISMATCH"):
                    record_disclosure(manifest, context, replace(observation, context=changed))

    def test_output_digest_and_distinct_event_receipt_required(self):
        manifest, context, observation = fixture()
        for change in ({"output_digest": "unknown"}, {"event_receipt_ref": ""},
                       {"event_receipt_ref": context.preview_receipt_ref},
                       {"event_receipt_ref": context.authorization_receipt_ref}):
            with self.assertRaisesRegex(ExportError, "DISCLOSURE_OBSERVATION_INVALID"):
                record_disclosure(manifest, context, replace(observation, **change))

    def test_warning_non_retraction_and_no_authority_are_intrinsic(self):
        manifest, context, observation = fixture()
        record = record_disclosure(manifest, context, observation)
        self.assertFalse(record.external_copies_retractable)
        self.assertEqual(record.link_revocation_scope, "FUTURE_SYSTEM_ACCESS_ONLY")
        self.assertEqual(record.authority, "NONE")
        self.assertIn("cannot be retracted", record.residual_copy_warning)
        self.assertIn("Downloaded, printed, copied, forwarded or captured", record.residual_copy_warning)
        with self.assertRaises(FrozenInstanceError):
            record.output_digest = "d" * 64
        for property in ("authority", "external_copies_retractable", "residual_copy_warning"):
            with self.assertRaises(TypeError):
                replace(record, **{property: "unsafe"})
        self.assertNotIn(context.purpose, repr(record))
        self.assertNotIn("private-note", repr(record))

    def test_invalid_types_and_equality_callbacks_are_rejected(self):
        class EqualityTrap:
            def __eq__(self, other):
                raise AssertionError("CALLER_COMPARISON_INVOKED")

            def __ne__(self, other):
                raise AssertionError("CALLER_COMPARISON_INVOKED")

        manifest, context, observation = fixture()
        for field in ("source", "actor_ref", "authorization_action", "selected_fields"):
            with self.subTest(field=field):
                with self.assertRaises(ExportError):
                    record_disclosure(manifest, replace(context, **{field: EqualityTrap()}), observation)
        with self.assertRaisesRegex(ExportError, "FIELD_CONTEXT_INVALID"):
            minimize_manifest(manifest.source, (replace(manifest.fields[0], sensitive="true"),))
        with self.assertRaisesRegex(ExportError, "FIELD_DUPLICATE"):
            minimize_manifest(manifest.source, (manifest.fields[0], manifest.fields[0]))


if __name__ == "__main__":
    unittest.main()
