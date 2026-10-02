import sys
from dataclasses import replace, FrozenInstanceError
from hashlib import sha256
from pathlib import Path
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from core_composition import Scope, Reference, Entry, Declaration, Part, InvalidComposition, declaration_digest
from optional_media import UserRequest, prepare_optional, cancel_optional, complete_optional, evict_optional, spec_digest
from size_shown import SizePreview, SizeShownReceipt, preview_size, preview_digest, request_after_size, production_gate


class SizeShownTests(unittest.TestCase):
    def setUp(self):
        self.scope = Scope("motorcycle-1", "task-1", "release-1", 1)
        self.parts = tuple(Part(self.scope, role, role.encode()) for role in
                           ("text", "steps", "warnings", "checks", "safe_stop", "recovery", "safety_media"))
        self.core = Declaration(self.scope, Reference("applicability", "1", "a" * 64),
                                Reference("compatibility", "1", "b" * 64), (),
                                tuple(Entry(p.part_id, p.part_id, sha256(p.payload).hexdigest()) for p in self.parts))
        self.pin = declaration_digest(self.core)
        self.payload = b"optional fixture"
        self.ref = Reference("expanded-photo", "1", sha256(self.payload).hexdigest())
        self.record = prepare_optional(self.core, self.scope, self.pin, self.parts,
                                       self.ref, len(self.payload), "NONESSENTIAL")
        self.preview = preview_size(self.record)
        self.request = UserRequest("request-1", spec_digest(self.record.spec), "USER_FETCH")
        self.receipt = self.receipt_for(self.request)

    def receipt_for(self, request):
        return SizeShownReceipt(preview_digest(self.preview), request.request_id,
                                self.preview.declared_bytes, self.preview.label)

    def active(self):
        return request_after_size(self.record, self.request, self.receipt)

    def test_exact_size_text_before_modeled_request_and_no_core_change(self):
        before = (self.core, self.parts, self.pin, self.record)
        self.assertEqual(self.preview.label, "16 bayt")
        self.assertEqual(self.record.state, "ABSENT")
        self.assertEqual(self.active().state, "REQUESTED")
        self.assertEqual(before, (self.core, self.parts, self.pin, self.record))

    def test_no_rounding_or_unit_thresholds(self):
        # Arbitrary examples, not chosen byte policy limits.
        for size in (1, 1023, 1024, 1048577):
            record = replace(self.record, spec=replace(self.record.spec, declared_bytes=size))
            self.assertEqual(preview_size(record).label, str(size) + " bayt")

    def test_missing_bare_flag_dictionary_and_callback_receipts_rejected(self):
        touched = []
        for receipt in (None, True, {"displayed": True}, lambda: touched.append(True)):
            with self.assertRaisesRegex(InvalidComposition, "^SIZE_SHOWN_RECEIPT_REQUIRED$"):
                request_after_size(self.record, self.request, receipt)
        self.assertEqual(touched, [])
        self.assertEqual(self.record.state, "ABSENT")

    def test_wrong_size_label_digest_and_request_binding_rejected(self):
        for receipt in (replace(self.receipt, displayed_bytes=17),
                        replace(self.receipt, displayed_label="1 KB"),
                        replace(self.receipt, displayed_label="15 bayt"),
                        replace(self.receipt, preview_digest="f" * 64),
                        replace(self.receipt, request_id="request-2")):
            with self.assertRaisesRegex(InvalidComposition, "^SIZE_SHOWN_CONTEXT_MISMATCH$"):
                request_after_size(self.record, self.request, receipt)

    def test_changed_size_revision_digest_media_and_core_context_invalidate_receipt(self):
        scope = replace(self.scope, generation=2)
        core = replace(self.core, scope=scope)
        changed = (replace(self.record.spec, declared_bytes=17),
                   replace(self.record.spec, media_ref=replace(self.ref, revision="2")),
                   replace(self.record.spec, media_ref=replace(self.ref, digest="e" * 64)),
                   replace(self.record.spec, media_ref=replace(self.ref, object_id="other")),
                   replace(self.record.spec, core_scope=scope, core_declaration=core,
                           core_digest=declaration_digest(core)))
        for spec in changed:
            request = replace(self.request, spec_digest=spec_digest(spec))
            with self.assertRaisesRegex(InvalidComposition, "^SIZE_SHOWN_CONTEXT_MISMATCH$"):
                request_after_size(replace(self.record, spec=spec), request, self.receipt)

    def test_stale_intent_and_automatic_fetch_rejected_even_with_size_receipt(self):
        for request, reason in ((replace(self.request, spec_digest="f" * 64), "REQUEST_CONTEXT_MISMATCH"),
                                (replace(self.request, action="AUTO_FETCH"), "EXPLICIT_USER_REQUEST_REQUIRED"),
                                (None, "EXPLICIT_USER_REQUEST_REQUIRED")):
            with self.assertRaisesRegex(InvalidComposition, "^" + reason + "$"):
                request_after_size(self.record, request, self.receipt)

    def test_active_retry_remains_idempotent_but_needs_matching_receipt(self):
        active = self.active()
        self.assertEqual(request_after_size(active, self.request, self.receipt), active)
        with self.assertRaisesRegex(InvalidComposition, "^SIZE_SHOWN_RECEIPT_REQUIRED$"):
            request_after_size(active, self.request, None)

    def test_cancel_and_evict_require_new_receipt_for_new_refetch_identity(self):
        cancelled = cancel_optional(self.active(), "request-1")
        available = complete_optional(self.active(), "request-1", self.payload)
        for record in (cancelled, evict_optional(available)):
            request = replace(self.request, request_id="request-2")
            with self.assertRaisesRegex(InvalidComposition, "^SIZE_SHOWN_CONTEXT_MISMATCH$"):
                request_after_size(record, request, self.receipt)
            self.assertEqual(request_after_size(record, request, self.receipt_for(request)).state, "REQUESTED")
            with self.assertRaisesRegex(InvalidComposition, "^REQUEST_REPLAY_AFTER_TERMINAL_STATE$"):
                request_after_size(record, self.request, self.receipt)

    def test_plain_immutable_types_and_exact_int_counts(self):
        class Hostile:
            def __getattribute__(self, name):
                raise AssertionError("untrusted callback")
        for receipt in (Hostile(), replace(self.receipt, displayed_bytes=True),
                        replace(self.receipt, displayed_label=[]), replace(self.receipt, request_id=[])):
            with self.assertRaises(InvalidComposition):
                request_after_size(self.record, self.request, receipt)
        for preview in (Hostile(), replace(self.preview, declared_bytes=True),
                        replace(self.preview, declared_bytes=0), replace(self.preview, declared_bytes=-1),
                        replace(self.preview, label=[]), replace(self.preview, label="1 KB")):
            with self.assertRaises(InvalidComposition):
                preview_digest(preview)
        with self.assertRaises(FrozenInstanceError):
            self.receipt.displayed_bytes = 100
        with self.assertRaises(FrozenInstanceError):
            self.preview.label = "changed"

    def test_unknown_invalid_records_cannot_generate_size_presentation(self):
        for record in (None, replace(self.record, state="UNKNOWN"),
                       replace(self.record, request_ids=[]),
                       replace(self.record, spec=replace(self.record.spec, classification="UNKNOWN"))):
            with self.assertRaises(InvalidComposition):
                preview_size(record)

    def test_extreme_serialization_failures_are_finite_no_policy_limit(self):
        giant = 10 ** 5000
        with self.assertRaisesRegex(InvalidComposition, "^OPTIONAL_SPEC_ENCODING_FAILED$"):
            preview_size(replace(self.record, spec=replace(self.record.spec, declared_bytes=giant)))
        with self.assertRaisesRegex(InvalidComposition, "^SIZE_PREVIEW_ENCODING_FAILED$"):
            preview_digest(SizePreview("a" * 64, giant, "irrelevant"))
        scope = replace(self.scope, generation=giant)
        core = replace(self.core, scope=scope)
        with self.assertRaisesRegex(InvalidComposition, "^SIZE_CONTEXT_ENCODING_FAILED$"):
            preview_size(replace(self.record, spec=replace(self.record.spec,
                                                          core_scope=scope, core_declaration=core)))

    def test_coherent_forgery_is_not_actual_shown_or_authorized_evidence(self):
        # Even internally coherent declarations cannot open the runtime gate.
        forged_active = self.active()
        touched = []
        for supplied in (self.preview, self.receipt, forged_active, {"displayed": True},
                         lambda: touched.append(True)):
            self.assertEqual(production_gate(supplied).reason, "HELD_CANONICAL_SIZE_PRESENTATION_AND_RUNTIME_MISSING")
            self.assertEqual(production_gate(supplied).authority, "NONE")
        self.assertEqual(touched, [])
        self.assertEqual(self.preview.authority, "NONE")
        self.assertEqual(self.receipt.authority, "NONE")
        self.assertEqual(forged_active.authority, "NONE")


if __name__ == "__main__":
    unittest.main()
