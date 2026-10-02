"""Unapproved code-update probes; no provider/channel/device execution."""
from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from ota_denial import FUTURE_REQUIREMENTS, OtaDenial, deny_ota
from release_authority_registry import load_registry, resolve_metadata


class OtaDenialTests(unittest.TestCase):
    def assert_denied(self, request=None):
        result = deny_ota(request)
        self.assertEqual((result.verdict, result.reason, result.domain, result.authority),
                         ("DENY", "OTA_NOT_APPROVED", "future_ota", "NONE"))
        return result

    def test_claimed_approval_signature_or_current_authority_cannot_enable(self):
        for request in (None, "ALLOW", {"approved": True}, {"signature_valid": True},
                        {"current_authority": "ALLOW", "scope": "future_ota"}):
            self.assert_denied(request)

    def test_all_future_requirement_claims_still_do_not_enable(self):
        request = {item.key: True for item in FUTURE_REQUIREMENTS}
        request.update(approved=True, policy="future-approved", verdict="ALLOW")
        self.assert_denied(request)

    def test_callback_code_cannot_be_invoked_as_request_or_effect(self):
        def forbidden():
            self.fail("CALLER_EFFECT_EXECUTED")
        self.assert_denied(forbidden)
        self.assert_denied({"activate": forbidden, "download": forbidden, "evaluate": forbidden})

    def test_untrusted_attributes_repr_truth_iteration_never_evaluated(self):
        class Trap:
            def __getattribute__(self, name):
                raise AssertionError("ATTRIBUTE_CALLBACK")
            def __repr__(self):
                raise AssertionError("REPR_CALLBACK")
            def __bool__(self):
                raise AssertionError("TRUTH_CALLBACK")
            def __iter__(self):
                raise AssertionError("ITERATION_CALLBACK")
        self.assert_denied(Trap())

    def test_code_bytes_and_urls_are_not_parsed_or_loaded(self):
        for request in (b"exec(untrusted_fixture_code)", bytearray(b"fixture_code"),
                        "https://invalid.example/fixture-code", "file:///fixture-code",
                        {"payload": b"fixture_code", "native_replacement": True},
                        {"permissions": ["new-privilege"], "content_approval": "ALLOW"}):
            self.assert_denied(request)

    def test_denial_cannot_accept_forged_verdict_or_be_mutated(self):
        result = self.assert_denied()
        for key in ("verdict", "reason", "domain", "authority"):
            with self.assertRaises(TypeError):
                OtaDenial(**{key: "ALLOW"})
            with self.assertRaises(FrozenInstanceError):
                setattr(result, key, "ALLOW")
            with self.assertRaises(TypeError):
                replace(result, **{key: "ALLOW"})

    def test_requirement_catalog_is_immutable_and_not_a_readiness_result(self):
        self.assertIs(type(FUTURE_REQUIREMENTS), tuple)
        self.assertEqual(len({item.key for item in FUTURE_REQUIREMENTS}), len(FUTURE_REQUIREMENTS))
        for item in FUTURE_REQUIREMENTS:
            self.assertTrue(item.key and item.requirement)
            with self.assertRaises(FrozenInstanceError):
                item.requirement = "approved"
        self.assert_denied(FUTURE_REQUIREMENTS)

    def test_denial_matches_accepted_logical_authority_without_opening_it(self):
        path = Path(__file__).resolve().parents[3] / "vault" / "REGISTRY" / "release-authorities.json"
        raw = path.read_bytes()
        import hashlib
        registry = load_registry(raw, expected_version=1,
                                 expected_digest=hashlib.sha256(raw).hexdigest())
        authority = resolve_metadata(registry, "future_ota")
        self.assertEqual(authority.policy_status, "NOT_APPROVED")
        self.assertEqual(authority.physical_activation, "HELD")
        self.assert_denied(authority)


if __name__ == "__main__":
    unittest.main()
