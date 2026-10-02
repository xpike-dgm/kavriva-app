"""Publication fixture checks, never an actual canonical commit proof."""

from dataclasses import FrozenInstanceError, replace
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from guarded_transition import (Assessment, FatalAuthorityError, FixtureCurrent,
                                FixtureReceipt, PublicationRequest, TransitionError,
                                assess_fixture_transition, production_gate,
                                request_fingerprint)
from snapshot_binding import bind_review
from test_snapshot_binding import fixture


def setup():
    snapshot, review, now = fixture()
    binding = bind_review(snapshot, review, server_time=now)
    request = PublicationRequest("fixture-scope", "fixture-operation", 4, 7, 5,
                                 binding.binding_fingerprint)
    current = FixtureCurrent(request.scope_id, 4, 7, False, False)
    return request, current, binding, now


class GuardedTransitionTests(unittest.TestCase):
    def test_structure_never_grants_publication_authority_or_mutates_current(self):
        request, current, binding, now = setup()
        result = assess_fixture_transition(request, current, binding, server_time=now)
        self.assertEqual(result.reason, "FIXTURE_STRUCTURE_MATCH")
        self.assertEqual(result.authority, "NONE")
        self.assertEqual(current.release_generation, 4)
        with self.assertRaises(FrozenInstanceError):
            result.reason = "ALLOW"

    def test_changed_current_scope_release_and_newer_negative_fence_hold(self):
        request, current, binding, now = setup()
        for changes, reason in (({"scope_id": "other"}, "SCOPE_CHANGED"),
                                ({"release_generation": 5}, "CURRENT_RELEASE_CHANGED"),
                                ({"floor_generation": 8}, "NEGATIVE_FENCE_CHANGED")):
            result = assess_fixture_transition(request, replace(current, **changes), binding,
                                               server_time=now)
            self.assertEqual(result.reason, reason)
            self.assertIsNone(result.request_fingerprint)

    def test_equal_fence_suspension_and_restore_quarantine_override_publish(self):
        request, current, binding, now = setup()
        for changes, reason in (({"suspended": True}, "SUSPENDED"),
                                ({"restore_quarantined": True}, "RESTORE_QUARANTINED")):
            self.assertEqual(assess_fixture_transition(request, replace(current, **changes),
                                                     binding, server_time=now).reason, reason)

    def test_backward_or_equal_target_is_fatal_not_rollback(self):
        request, _, _, _ = setup()
        for target in (3, 4):
            with self.assertRaisesRegex(FatalAuthorityError, "BACKWARD_OR_EQUAL"):
                request_fingerprint(replace(request, target_release_generation=target))

    def test_backward_current_release_or_floor_is_fatal(self):
        request, current, binding, now = setup()
        for changes, reason in (({"release_generation": 3}, "RELEASE_GENERATION_BACKWARD"),
                                ({"floor_generation": 6}, "FLOOR_GENERATION_BACKWARD")):
            with self.assertRaisesRegex(FatalAuthorityError, reason):
                assess_fixture_transition(request, replace(current, **changes), binding,
                                          server_time=now)

    def test_all_intent_fields_bind_operation_identity(self):
        request, _, _, _ = setup()
        original = request_fingerprint(request)
        for delta in ({"scope_id": "other"}, {"operation_id": "other"},
                      {"expected_release_generation": 3}, {"expected_floor_generation": 8},
                      {"target_release_generation": 6}, {"binding_fingerprint": "f" * 64}):
            self.assertNotEqual(request_fingerprint(replace(request, **delta)), original)

    def test_changed_review_binding_and_expired_review_reject(self):
        request, current, binding, now = setup()
        self.assertEqual(assess_fixture_transition(replace(request, binding_fingerprint="f" * 64),
                                                 current, binding, server_time=now).reason,
                         "REVIEW_BINDING_CHANGED")
        with self.assertRaisesRegex(ValueError, "STALE"):
            assess_fixture_transition(request, current, binding,
                                      server_time=binding.review.expires_at)
        with self.assertRaisesRegex(TransitionError, "EXACT_REVIEW_BINDING_REQUIRED"):
            assess_fixture_transition(request, current, "ALLOW", server_time=now)

    def test_identical_retry_metadata_is_structural_only_and_rechecks_fence(self):
        request, current, binding, now = setup()
        receipt = FixtureReceipt(request.scope_id, request.operation_id,
                                 request_fingerprint(request), 5, 7)
        committed = replace(current, release_generation=5)
        result = assess_fixture_transition(request, committed, binding,
                                           server_time=now, previous=receipt)
        self.assertEqual(result.reason, "FIXTURE_RETRY_STRUCTURE_MATCH")
        self.assertEqual(result.authority, "NONE")
        self.assertEqual(assess_fixture_transition(request, replace(committed, floor_generation=8),
                                                 binding, server_time=now, previous=receipt).reason,
                         "NEGATIVE_FENCE_CHANGED")
        self.assertEqual(assess_fixture_transition(request, replace(committed, suspended=True),
                                                 binding, server_time=now, previous=receipt).reason,
                         "SUSPENDED")

    def test_retry_identity_and_result_conflicts_cannot_replay(self):
        request, current, binding, now = setup()
        receipt = FixtureReceipt(request.scope_id, request.operation_id,
                                 request_fingerprint(request), 5, 7)
        for delta, reason in (({"operation_id": "other"}, "OPERATION_IDENTITY_CONFLICT"),
                              ({"request_fingerprint": "f" * 64}, "OPERATION_IDENTITY_CONFLICT"),
                              ({"resulting_release_generation": 6}, "PRIOR_FIXTURE_MISMATCH"),
                              ({"floor_generation": 8}, "PRIOR_FIXTURE_MISMATCH")):
            self.assertEqual(assess_fixture_transition(request, replace(current, release_generation=5),
                                                     binding, server_time=now,
                                                     previous=replace(receipt, **delta)).reason, reason)

    def test_plain_types_and_nonnegative_generations_before_comparison(self):
        request, current, binding, now = setup()
        class Trap:
            def __eq__(self, other):
                raise AssertionError("CALLBACK")
        for delta in ({"expected_floor_generation": True}, {"expected_release_generation": -1},
                      {"scope_id": Trap()}, {"binding_fingerprint": "ALLOW"}):
            with self.assertRaisesRegex(TransitionError, "REQUEST_INVALID"):
                request_fingerprint(replace(request, **delta))
        with self.assertRaisesRegex(TransitionError, "CURRENT_FIXTURE_INVALID"):
            assess_fixture_transition(request, replace(current, suspended=1), binding, server_time=now)

    def test_production_gate_always_holds_even_with_matching_or_hostile_fixtures(self):
        request, current, binding, now = setup()
        for values in ((), (request, current, binding), ("ALLOW",), (object(),)):
            result = production_gate(*values, server_time=now)
            self.assertEqual(result.reason, "HELD_CANONICAL_RELEASE_TRANSACTION_MISSING")
            self.assertEqual(result.authority, "NONE")
            self.assertIsNone(result.request_fingerprint)


if __name__ == "__main__":
    unittest.main()
