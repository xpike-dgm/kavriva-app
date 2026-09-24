"""T-E3-001-R1 negative-path contract tests for the E3 transaction gate."""

import sys
import unittest
from dataclasses import replace
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "public"))
from commit_authorization import (  # noqa: E402
    CommitRequest, CurrentTuple, Verdict, authorize_and_commit,
)


REQUEST = CommitRequest(
    actor_id="actor-1", session_id="session-1", tenant_id="tenant-1",
    object_id="object-1", scope="object:write", action="update",
    operation_id="operation-1", fingerprint="fingerprint-1",
    reason="correct-record", intended_effect="version-2",
    expected_policy_version="policy-4", expected_object_generation="generation-1",
)
CURRENT = CurrentTuple(
    actor_id="actor-1", workload_id="", issuer_id="issuer-1",
    session_id="session-1", assurance="current", step_up="bound",
    security_epoch="epoch-1", tenant_id="tenant-1", object_id="object-1",
    scope="object:write", classification="private", action="update",
    role="editor", grant_id="grant-1", delegation_chain="",
    competence="confirmed", independence="confirmed", policy_version="policy-4",
    object_generation="generation-1", release_generation="release-1",
    schema_generation="schema-1", config_generation="config-1",
    package_generation="package-1", client_generation="client-1",
    negative_floor="floor-0", operation_id="operation-1",
    fingerprint="fingerprint-1", reason="correct-record",
    intended_effect="version-2", audit_receipt="receipt-1",
    runtime_compatibility="compatible-1", policy_verdict=Verdict.ALLOW,
    session_current=True, floor_clear=True, audit_ready=True,
    runtime_compatible=True,
)


class FakeTransaction:
    def __init__(self, current=CURRENT, fail_read=False, fail_apply=False, fail_exit=False):
        self.current = current
        self.fail_read = fail_read
        self.fail_apply = fail_apply
        self.fail_exit = fail_exit
        self.events = []

    def __enter__(self):
        self.events.append("begin")
        return self

    def __exit__(self, *_):
        self.events.append("exit")
        if self.fail_exit:
            raise RuntimeError("commit uncertain")

    def read_current(self, request):
        self.events.append("read_current")
        if self.fail_read:
            raise RuntimeError("canonical store unavailable")
        return self.current

    def apply_effect(self, request):
        self.events.append("apply_effect")
        if self.fail_apply:
            raise RuntimeError("write uncertain")
        return "canonical-transition-1"


class CommitAuthorizationTests(unittest.TestCase):
    def run_gate(self, current=CURRENT, **failures):
        tx = FakeTransaction(current, **failures)
        return authorize_and_commit(REQUEST, lambda: tx), tx.events

    def test_allowed_effect_is_inside_transaction_after_current_read(self):
        result, events = self.run_gate()
        self.assertEqual((result.verdict, result.reason_code), (Verdict.ALLOW, "COMMITTED"))
        self.assertEqual(events, ["begin", "read_current", "apply_effect", "exit"])

    def test_missing_canonical_authority_denies_even_with_cached_allow(self):
        tx = FakeTransaction(None)
        result = authorize_and_commit(replace(REQUEST, cached_decision="ALLOW"), lambda: tx)
        self.assertEqual((result.verdict, result.reason_code), (Verdict.DENY, "CURRENT_AUTHORITY_MISSING"))
        self.assertNotIn("apply_effect", tx.events)
        tx = FakeTransaction(replace(CURRENT, policy_verdict=Verdict.DENY))
        result = authorize_and_commit(replace(REQUEST, cached_decision="ALLOW"), lambda: tx)
        self.assertEqual((result.verdict, result.reason_code), (Verdict.DENY, "POLICY_DENIED"))
        self.assertNotIn("apply_effect", tx.events)

    def test_session_and_scope_changes_deny(self):
        for stale, reason in (
            (replace(CURRENT, session_current=False), "SESSION_NOT_CURRENT"),
            (replace(CURRENT, actor_id="other-actor"), "ACTOR_SESSION_MISMATCH"),
            (replace(CURRENT, tenant_id="other-tenant"), "OBJECT_SCOPE_MISMATCH"),
        ):
            with self.subTest(reason=reason):
                result, events = self.run_gate(stale)
                self.assertEqual((result.verdict, result.reason_code), (Verdict.DENY, reason))
                self.assertNotIn("apply_effect", events)

    def test_changed_generation_or_policy_holds(self):
        for stale in (
            replace(CURRENT, object_generation="generation-2"),
            replace(CURRENT, policy_version="policy-5"),
        ):
            result, events = self.run_gate(stale)
            self.assertEqual((result.verdict, result.reason_code), (Verdict.HELD, "AUTHORITY_CHANGED"))
            self.assertNotIn("apply_effect", events)

    def test_floor_audit_runtime_and_policy_block_effect(self):
        for state, verdict, reason in (
            (replace(CURRENT, floor_clear=False), Verdict.HELD, "NEGATIVE_FLOOR"),
            (replace(CURRENT, audit_ready=False), Verdict.HELD, "AUDIT_HELD"),
            (replace(CURRENT, runtime_compatible=False), Verdict.HELD, "RUNTIME_INCOMPATIBLE"),
            (replace(CURRENT, policy_verdict=Verdict.DENY), Verdict.DENY, "POLICY_DENIED"),
            (replace(CURRENT, policy_verdict=Verdict.HELD), Verdict.HELD, "POLICY_HELD"),
        ):
            with self.subTest(reason=reason):
                result, events = self.run_gate(state)
                self.assertEqual((result.verdict, result.reason_code), (verdict, reason))
                self.assertNotIn("apply_effect", events)

    def test_incomplete_tuple_holds_and_incomplete_request_denies(self):
        result, events = self.run_gate(replace(CURRENT, grant_id=""))
        self.assertEqual(result.reason_code, "CURRENT_TUPLE_INCOMPLETE")
        self.assertNotIn("apply_effect", events)
        tx = FakeTransaction()
        result = authorize_and_commit(replace(REQUEST, object_id=""), lambda: tx)
        self.assertEqual((result.verdict, result.reason_code), (Verdict.DENY, "REQUEST_INCOMPLETE"))
        self.assertEqual(tx.events, [])
        result, events = self.run_gate(replace(CURRENT, audit_receipt=None))
        self.assertEqual((result.verdict, result.reason_code), (Verdict.HELD, "CURRENT_TUPLE_INCOMPLETE"))
        self.assertNotIn("apply_effect", events)
        result, events = self.run_gate(replace(CURRENT, floor_clear="False"))
        self.assertEqual((result.verdict, result.reason_code), (Verdict.HELD, "NEGATIVE_FLOOR"))
        self.assertNotIn("apply_effect", events)

    def test_store_failure_holds_and_uncertain_write_requires_lookup(self):
        result, events = self.run_gate(fail_read=True)
        self.assertEqual((result.verdict, result.reason_code), (Verdict.HELD, "CURRENT_AUTHORITY_UNAVAILABLE"))
        self.assertNotIn("apply_effect", events)
        for failures in ({"fail_apply": True}, {"fail_exit": True}):
            result, events = self.run_gate(**failures)
            self.assertEqual((result.verdict, result.reason_code),
                             (Verdict.OUTCOME_UNKNOWN, "COMMIT_OUTCOME_UNKNOWN"))
            self.assertIn("apply_effect", events)


if __name__ == "__main__":
    unittest.main()
