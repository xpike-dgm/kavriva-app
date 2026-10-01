"""Exact-version activation policy negatives; no scanner or client authority."""

import sys
import unittest
from dataclasses import replace
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "public"))
from object_activation import (ACTION, BASE_CHECKS, ActivationRequest, ObjectValidation,
    ValidationCheck, activation_fingerprint, manifest_fingerprint, validation_reason)
from object_boundary import create_original
from test_commit_authorization import REQUEST


def object_version(**changes):
    fields = dict(object_id="object-1", generation=1, payload=b"quarantined bytes",
                  classification="private", owner_id="actor-1", retention_policy_ref="retention-1")
    fields.update(changes)
    return create_original(**fields)


def request_for(version=None, **changes):
    version = version or object_version()
    digest = manifest_fingerprint(version)
    command = replace(REQUEST, action=ACTION, expected_object_generation=str(version.manifest.generation),
        intended_effect=f"{ACTION}:{digest}", cached_decision="ALLOW", **changes)
    request = ActivationRequest(command, digest, "validation-policy-1")
    return replace(request, commit=replace(command, fingerprint=activation_fingerprint(request)))


def validation_for(version=None):
    version = version or object_version()
    names = tuple(sorted(BASE_CHECKS | ({"technical_correctness"}
        if version.manifest.classification == "official" else set())))
    return ObjectValidation(manifest_fingerprint(version), "validation-policy-1", names,
                            tuple(ValidationCheck(name, "PASS", f"receipt-{name}") for name in names))


class ObjectActivationTests(unittest.TestCase):
    def reason(self, validation, version=None, request=None):
        version = version or object_version()
        return validation_reason(version, request or request_for(version), validation)

    def test_all_checks_required_and_scan_alone_insufficient(self):
        evidence = validation_for()
        self.assertIsNone(self.reason(evidence))
        self.assertEqual(self.reason(replace(evidence, checks=(evidence.checks[0],))),
                         "OBJECT_VALIDATION_INCOMPLETE")
        for name in BASE_CHECKS:
            self.assertEqual(self.reason(replace(evidence,
                required_checks=tuple(n for n in evidence.required_checks if n != name))),
                "OBJECT_VALIDATION_POLICY_INCOMPLETE")

    def test_receipts_bind_full_manifest_not_only_payload(self):
        for change in ({"owner_id": "other"}, {"classification": "shared"},
                       {"retention_policy_ref": "other"}, {"generation": 2}):
            changed = object_version(**change)
            self.assertEqual(changed.manifest.digest, object_version().manifest.digest)
            self.assertEqual(self.reason(validation_for(), changed), "OBJECT_VALIDATION_STALE")

    def test_missing_failed_held_or_unknown_evidence_does_not_pass(self):
        self.assertEqual(self.reason(None), "OBJECT_VALIDATION_MISSING")
        for verdict in ("FAIL", "HELD", "ALLOW", "", None, True):
            evidence = validation_for()
            self.assertEqual(self.reason(replace(evidence, checks=(replace(evidence.checks[0],
                verdict=verdict),) + evidence.checks[1:])), "OBJECT_VALIDATION_NOT_PASSED")

    def test_duplicate_or_missing_receipts_and_required_checks_reject(self):
        evidence = validation_for()
        for checks in (evidence.checks + (evidence.checks[0],),
                       (replace(evidence.checks[0], receipt=" "),) + evidence.checks[1:]):
            self.assertEqual(self.reason(replace(evidence, checks=checks)), "OBJECT_VALIDATION_INCOMPLETE")
        self.assertEqual(self.reason(replace(evidence, required_checks=evidence.required_checks * 2)),
                         "OBJECT_VALIDATION_POLICY_INCOMPLETE")

    def test_official_class_is_not_technical_correctness_proof(self):
        version = object_version(classification="official")
        evidence = validation_for(version)
        self.assertIsNone(self.reason(evidence, version))
        self.assertEqual(self.reason(replace(evidence,
            required_checks=tuple(sorted(BASE_CHECKS))), version), "OBJECT_VALIDATION_POLICY_INCOMPLETE")

    def test_changed_policy_or_requested_version_holds(self):
        self.assertEqual(self.reason(replace(validation_for(), policy_version="old")), "OBJECT_VALIDATION_STALE")
        request = replace(request_for(), manifest_fingerprint="a" * 64)
        self.assertEqual(self.reason(validation_for(), request=request), "OBJECT_VERSION_CHANGED")

    def test_operation_fingerprint_binds_actor_scope_and_all_effect_metadata(self):
        request = request_for()
        for field in ("actor_id", "session_id", "tenant_id", "object_id", "scope", "operation_id",
                      "reason", "intended_effect", "expected_policy_version", "expected_object_generation"):
            self.assertNotEqual(activation_fingerprint(replace(request,
                commit=replace(request.commit, **{field: "other"}))), request.commit.fingerprint)
        self.assertNotEqual(activation_fingerprint(replace(request, validation_policy_version="other")),
                            request.commit.fingerprint)
        self.assertEqual(activation_fingerprint(replace(request, commit=replace(request.commit,
            cached_decision="DENY"))), request.commit.fingerprint)
