import dataclasses
import hashlib
import json
import pathlib
import sys
import unittest

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parents[1] / "internal"))
from preview_isolation import Boundary, Derivative, IsolationError, preview_requirements
from quarantine_pipeline import Observation, State, Subject, advance, receive


def fixture():
    subject = Subject("original-fixture", 1, "a" * 64, "b" * 64, "private", "policy-v1")
    record = receive(subject)
    for state, kind in ((State.QUARANTINED, "quarantine"), (State.IDENTIFIED, "identify"),
                        (State.VALIDATED, "validate"), (State.SCANNED, "scan")):
        record = advance(record, Observation(subject, "receipt-" + kind,
                                              "fixture-producer", kind, "fixture"))
    derivative = Derivative(subject, "receipt-scan", "derived-fixture",
                            hashlib.sha256(b"passive fixture").hexdigest(),
                            "transformation-fixture", "private", True)
    boundary = Boundary("https://operations.example", "https://preview.example.net",
                        "fixture-not-production-proof", *([True] * 8))
    return record, derivative, boundary


class PreviewIsolationTests(unittest.TestCase):
    def test_constraints_have_no_credentials_cors_or_authority(self):
        rules = preview_requirements(*fixture())
        self.assertEqual(rules.authority, "NONE")
        self.assertEqual(rules.content_status, "UNTRUSTED_PREVIEW")
        self.assertEqual(rules.iframe_sandbox_tokens, ())
        self.assertEqual(rules.request_credentials, "omit")
        headers = dict(rules.response_headers)
        self.assertNotIn("Set-Cookie", headers)
        self.assertNotIn("Access-Control-Allow-Origin", headers)
        self.assertEqual(headers["Cache-Control"], "no-store")
        self.assertEqual(headers["Referrer-Policy"], "no-referrer")
        csp = headers["Content-Security-Policy"]
        for directive in ("script-src", "connect-src", "img-src", "object-src", "frame-src",
                          "form-action", "base-uri", "default-src", "worker-src"):
            self.assertIn(directive + " 'none'", csp)
        self.assertTrue(csp.endswith("; sandbox"))
        self.assertNotIn("allow-", csp)

    def test_every_unverified_control_holds_even_truthy_strings(self):
        record, derivative, boundary = fixture()
        for item in dataclasses.fields(Boundary):
            if item.name.endswith("_verified"):
                for value in (False, None, "true", 1):
                    with self.subTest(control=item.name, value=value):
                        with self.assertRaisesRegex(IsolationError, "ISOLATION_UNVERIFIED"):
                            preview_requirements(record, derivative,
                                                 dataclasses.replace(boundary, **{item.name: value}))

    def test_origin_difference_does_not_replace_cookie_site_proof(self):
        record, derivative, boundary = fixture()
        sibling = dataclasses.replace(boundary, preview_origin="https://preview.operations.example",
                                      cookie_site_separation_verified=False)
        with self.assertRaisesRegex(IsolationError, "ISOLATION_UNVERIFIED"):
            preview_requirements(record, derivative, sibling)

    def test_same_origin_including_default_port_is_forbidden(self):
        record, derivative, boundary = fixture()
        for value in (boundary.operations_origin, boundary.operations_origin + ":443"):
            with self.assertRaisesRegex(IsolationError, "OPERATIONS_ORIGIN_FORBIDDEN"):
                preview_requirements(record, derivative,
                                     dataclasses.replace(boundary, preview_origin=value))

    def test_invalid_or_credential_bearing_origin_is_not_echoed(self):
        record, derivative, boundary = fixture()
        for value in ("http://preview.example", "https://secret@preview.example",
                      "https://preview.example/path", "https://preview.example?secret=1",
                      "https://preview.example#fragment", "https://preview.example\r\nX: secret",
                      "https://preview.example:bad", "https://PREVIEW.example", None):
            with self.assertRaisesRegex(IsolationError, "ORIGIN_INVALID") as error:
                preview_requirements(record, derivative,
                                     dataclasses.replace(boundary, preview_origin=value))
            self.assertNotIn("secret", str(error.exception))

    def test_missing_boundary_receipt_and_non_passive_content_hold(self):
        record, derivative, boundary = fixture()
        for value in (None, dataclasses.replace(boundary, verification_ref="")):
            with self.assertRaisesRegex(IsolationError, "ISOLATION_UNVERIFIED"):
                preview_requirements(record, derivative, value)
        for value in (False, None, "true", 1):
            with self.assertRaisesRegex(IsolationError, "ACTIVE_OR_UNKNOWN_CONTENT_HELD"):
                preview_requirements(record, dataclasses.replace(derivative, passive_text_only=value), boundary)

    def test_original_or_missing_derivation_cannot_be_preview(self):
        record, derivative, boundary = fixture()
        for change in ({"derived_object_id": record.subject.object_id},
                       {"derived_object_id": ""}, {"transformation_receipt_ref": ""},
                       {"transformation_receipt_ref": derivative.source_receipt_ref}):
            with self.assertRaisesRegex(IsolationError, "DERIVATIVE_PROVENANCE_MISSING"):
                preview_requirements(record, dataclasses.replace(derivative, **change), boundary)
        with self.assertRaisesRegex(IsolationError, "DERIVATIVE_DIGEST_INVALID"):
            preview_requirements(record, dataclasses.replace(derivative, derived_digest="unknown"), boundary)

    def test_stale_source_receipt_classification_or_generation_rejected(self):
        record, derivative, boundary = fixture()
        for change in ({"source_subject": dataclasses.replace(record.subject, generation=2)},
                       {"source_receipt_ref": "stale"}, {"classification": "OFFICIAL"}):
            with self.assertRaisesRegex(IsolationError, "DERIVATIVE_PROVENANCE_MISMATCH"):
                preview_requirements(record, dataclasses.replace(derivative, **change), boundary)

    def test_unprocessed_source_cannot_mint_preview_requirements(self):
        record, derivative, boundary = fixture()
        with self.assertRaisesRegex(IsolationError, "SOURCE_PROCESSING_HELD"):
            preview_requirements(receive(record.subject), derivative, boundary)

    def test_policy_is_immutable_and_never_advances_processing(self):
        record, derivative, boundary = fixture()
        rules = preview_requirements(record, derivative, boundary)
        self.assertEqual(record.state, State.SCANNED)
        with self.assertRaises(dataclasses.FrozenInstanceError):
            rules.authority = "ALLOW"
        with self.assertRaises(TypeError):
            dataclasses.replace(rules, authority="ALLOW")
        self.assertNotIn("transformation-fixture", repr(rules))
        self.assertNotIn("original-fixture", repr(rules))


if __name__ == "__main__":
    if sys.argv[1:] == ["--browser-fixture-policy"]:
        print(json.dumps(dict(preview_requirements(*fixture()).response_headers)))
    else:
        unittest.main()
