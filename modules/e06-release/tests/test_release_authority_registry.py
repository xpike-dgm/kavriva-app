"""Logical registration tests; no actual release, credentials or staffing."""

from dataclasses import FrozenInstanceError, replace
import hashlib
import json
from pathlib import Path
import sys
import unittest
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from release_authority_registry import (DOMAINS, RegistryError, load_registry,
                                       resolve_metadata)

ROOT = Path(__file__).resolve().parents[3]


def snapshot():
    return (ROOT / "vault/REGISTRY/release-authorities.json").read_bytes()


def load(raw):
    # Computed fixture expectation is not proof of authenticated source.
    return load_registry(raw, expected_digest=hashlib.sha256(raw).hexdigest(), expected_version=1)


def changed(edit):
    data = json.loads(snapshot())
    edit(data)
    return json.dumps(data).encode()


class ReleaseAuthorityRegistryTests(unittest.TestCase):
    def test_actual_snapshot_registers_eight_distinct_metadata_domains(self):
        registry = load(snapshot())
        self.assertEqual(tuple(entry.domain for entry in registry.entries), DOMAINS)
        for attribute in ("authority_id", "action_kind", "credential_domain",
                          "audit_event_kind", "consequence_check"):
            self.assertEqual(len({getattr(entry, attribute) for entry in registry.entries}), 8)
        self.assertEqual(registry.authority, "NONE")
        for domain in DOMAINS:
            self.assertEqual(resolve_metadata(registry, domain).authority, "NONE")

    def test_all_physical_activation_held_and_ota_explicitly_unapproved(self):
        registry = load(snapshot())
        self.assertEqual({entry.physical_activation for entry in registry.entries}, {"HELD"})
        self.assertEqual(resolve_metadata(registry, "future_ota").policy_status, "NOT_APPROVED")
        for index, field, value in ((0, "physical_activation", "ACTIVE"),
                                    (7, "policy_status", "REGISTERED")):
            with self.assertRaisesRegex(RegistryError, "AUTHORITY_BINDING_OR_HOLD_INVALID"):
                load(changed(lambda data: data["authorities"][index].update({field: value})))

    def test_mutated_bytes_reject_even_if_taxonomy_unchanged(self):
        raw = snapshot()
        with self.assertRaisesRegex(RegistryError, "REGISTRY_DIGEST_MISMATCH"):
            load_registry(raw + b" ", expected_digest=hashlib.sha256(raw).hexdigest(), expected_version=1)

    def test_wrong_stale_and_boolean_versions_rejected(self):
        for version in (0, 2, True, "1"):
            with self.assertRaises(RegistryError):
                load(changed(lambda data: data.update(registry_version=version)))
            with self.assertRaises(RegistryError):
                load_registry(snapshot(), expected_digest=hashlib.sha256(snapshot()).hexdigest(),
                              expected_version=version)

    def test_missing_extra_and_duplicate_domains_rejected(self):
        edits = (lambda data: data["authorities"].pop(),
                 lambda data: data["authorities"].append(data["authorities"][0]),
                 lambda data: data["authorities"][1].update(domain="consumer_binary"),
                 lambda data: data["authorities"][0].update(domain="release_admin"))
        for edit in edits:
            with self.assertRaises(RegistryError):
                load(changed(edit))

    def test_shared_identity_action_audit_or_credential_category_rejected(self):
        for field in ("authority_id", "action_kind", "credential_domain",
                      "audit_event_kind", "consequence_check"):
            with self.subTest(field=field):
                def edit(data):
                    data["authorities"][1][field] = data["authorities"][0][field]
                with self.assertRaisesRegex(RegistryError, "AUTHORITY_BINDING_OR_HOLD_INVALID"):
                    load(changed(edit))

    def test_actual_holder_credential_or_audit_binding_cannot_be_invented(self):
        for field in ("custodian_ref", "credential_ref", "audit_custody_ref"):
            with self.assertRaisesRegex(RegistryError, "PHYSICAL_BINDING_NOT_IMPLEMENTED"):
                load(changed(lambda data: data["authorities"][0].update({field: "claimed-proof"})))

    def test_unknown_extra_keys_duplicate_json_and_invalid_payloads_rejected(self):
        for raw in (b'{"schema_version":1,"schema_version":1}', b"[]", b"NaN", b"\xff", b"{broken"):
            with self.assertRaises(RegistryError):
                load(raw)
        with self.assertRaises(RegistryError):
            load(changed(lambda data: data.update(allow=True)))

    def test_excessive_json_nesting_returns_bounded_parser_reason(self):
        raw = b"[" * 10000 + b"]" * 10000
        # Runtime parsers vary: an iterative parser may parse this invalid root
        # array, while a recursive parser raises before schema validation.
        with self.assertRaisesRegex(RegistryError,
                                    "^REGISTRY_(FORMAT|VERSION_OR_SHAPE)_INVALID$"):
            load(raw)

    def test_parser_recursion_failure_translates_to_stable_registry_error(self):
        with patch("release_authority_registry.json.loads", side_effect=RecursionError()):
            with self.assertRaisesRegex(RegistryError, "^REGISTRY_FORMAT_INVALID$"):
                load(snapshot())

    def test_unknown_domain_has_no_shared_fallback(self):
        registry = load(snapshot())
        for domain in ("release_admin", "", None, 1):
            with self.assertRaisesRegex(RegistryError, "UNKNOWN_RELEASE_DOMAIN"):
                resolve_metadata(registry, domain)

    def test_immutable_metadata_and_constructed_tampering_rejected(self):
        registry = load(snapshot())
        with self.assertRaises(FrozenInstanceError):
            registry.version = 2
        modified = replace(registry.entries[0], physical_activation="ACTIVE")
        with self.assertRaises(RegistryError):
            resolve_metadata(replace(registry, entries=(modified,) + registry.entries[1:]), "consumer_binary")

    def test_equality_callbacks_and_lookalike_types_never_run(self):
        class Trap:
            def __eq__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
            def __ne__(self, other):
                raise AssertionError("UNTRUSTED_COMPARISON")
        registry = load(snapshot())
        modified = replace(registry.entries[0], physical_activation=Trap())
        with self.assertRaises(RegistryError):
            resolve_metadata(replace(registry, entries=(modified,) + registry.entries[1:]), "consumer_binary")
        with self.assertRaises(RegistryError):
            resolve_metadata(registry, Trap())

    def test_entry_order_is_reviewed_and_cannot_silently_change(self):
        def edit(data):
            data["authorities"].reverse()
        with self.assertRaisesRegex(RegistryError, "AUTHORITY_ORDER_INVALID"):
            load(changed(edit))


if __name__ == "__main__":
    unittest.main()
