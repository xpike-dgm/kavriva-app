"""Deterministic processing policy; receipts are fixtures, not real scanner proof."""

import sys
import unittest
from dataclasses import FrozenInstanceError, replace
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "internal"))
from quarantine_pipeline import (  # noqa: E402
    Observation, PipelineError, Record, State, Subject, Transition,
    advance, fail, receive, reevaluate,
)


SUBJECT = Subject("object-A", 1, "a" * 64, "b" * 64, "private", "policy-A")
STAGES = ("quarantine", "identify", "validate", "scan", "isolated_preview",
          "human_classification", "review_readiness")


def proof(subject, kind, receipt=None):
    return Observation(subject, receipt or "fixture-" + kind, "fixture-producer-" + kind,
                       kind, "observed fixture result only")


def at_stage(count):
    result = receive(SUBJECT)
    for kind in STAGES[:count]:
        result = advance(result, proof(result.subject, kind))
    return result


class QuarantinePolicyTests(unittest.TestCase):
    def assert_reason(self, reason, function, *args):
        with self.assertRaises(PipelineError) as error:
            function(*args)
        self.assertEqual(reason, error.exception.reason)

    def test_complete_processing_chain_preserves_untrusted_source_and_history(self):
        record = at_stage(7)
        self.assertEqual(State.SAFE_FOR_HUMAN_REVIEW, record.state)
        self.assertEqual(SUBJECT, record.subject)
        self.assertEqual(7, len(record.history))
        self.assertEqual(State.RECEIVED_UNTRUSTED, record.history[0].previous)
        self.assertEqual(State.HUMAN_CLASSIFIED, record.history[-1].previous)
        self.assertFalse(hasattr(record, "authorized"))
        self.assertFalse(hasattr(record, "approved"))
        self.assert_reason("PROCESSING_BLOCKED", advance, record, proof(SUBJECT, "publish"))

    def test_no_stage_skipping_or_unknown_scan_as_success(self):
        for count, wrong in ((0, "validate"), (1, "scan"), (3, "scan_unknown"),
                             (4, "human_classification"), (5, "ai_classification")):
            with self.subTest(count=count):
                self.assert_reason("STAGE_OBSERVATION_MISMATCH", advance,
                                   at_stage(count), proof(SUBJECT, wrong))

    def test_all_failure_and_lifecycle_branches_are_explicit_and_block_progress(self):
        for state, count in ((State.REJECTED, 0), (State.SCAN_FAILED, 3),
                             (State.SCAN_UNKNOWN, 3), (State.PARSING_FAILED, 2),
                             (State.MALICIOUS, 4), (State.SUSPICIOUS, 4),
                             (State.EXPIRED, 7), (State.DELETED_BY_POLICY, 7)):
            with self.subTest(state=state):
                prior = at_stage(count)
                record = fail(prior, state, proof(SUBJECT, state.value.lower()))
                self.assertEqual(state, record.state)
                self.assertEqual(prior.history, record.history[:-1])
                self.assert_reason("PROCESSING_BLOCKED", advance, record, proof(SUBJECT, "scan"))

    def test_scanner_cannot_claim_clean_by_failure_or_illegal_branch(self):
        self.assert_reason("FAILURE_STATE_REQUIRED", fail, at_stage(3), State.SCANNED,
                           proof(SUBJECT, "scan"))
        self.assert_reason("FAILURE_STAGE_MISMATCH", fail, at_stage(1), State.SCAN_UNKNOWN,
                           proof(SUBJECT, "scan_unknown"))
        self.assert_reason("FAILURE_OBSERVATION_MISMATCH", fail, at_stage(3), State.SCAN_FAILED,
                           proof(SUBJECT, "scan"))

    def test_same_bytes_different_subject_or_policy_cannot_borrow_receipt(self):
        for changes in ({"object_id": "object-B"}, {"generation": 2}, {"digest": "c" * 64},
                        {"manifest_fingerprint": "d" * 64}, {"classification": "official"},
                        {"policy_version": "policy-B"}):
            with self.subTest(changes=changes):
                self.assert_reason("OBSERVATION_CONTEXT_MISMATCH", advance, at_stage(3),
                                   proof(replace(SUBJECT, **changes), "scan"))

    def test_absent_blank_and_replayed_receipts_fail(self):
        record = at_stage(3)
        self.assert_reason("OBSERVATION_REQUIRED", advance, record, None)
        for name in ("receipt_ref", "producer_ref", "kind", "reason"):
            self.assert_reason("OBSERVATION_CONTEXT_MISSING", advance, record,
                               replace(proof(SUBJECT, "scan"), **{name: " "}))
        self.assert_reason("RECEIPT_REPLAY", advance, record,
                           proof(SUBJECT, "scan", record.history[0].observation.receipt_ref))

    def test_reevaluation_restarts_quarantine_preserving_prior_failure(self):
        old = fail(at_stage(3), State.SCAN_UNKNOWN, proof(SUBJECT, "scan_unknown"))
        new_subject = replace(SUBJECT, policy_version="policy-B")
        new = reevaluate(old, new_subject, proof(new_subject, "policy_reevaluation"))
        self.assertEqual(State.QUARANTINED, new.state)
        self.assertEqual(old.history, new.history[:-1])
        self.assertEqual(State.SCAN_UNKNOWN, new.history[-1].previous)
        self.assert_reason("STAGE_OBSERVATION_MISMATCH", advance, new, proof(new_subject, "scan"))
        self.assert_reason("OBSERVATION_CONTEXT_MISMATCH", advance, new, proof(SUBJECT, "identify"))
        for kind in STAGES[1:]:
            new = advance(new, proof(new_subject, kind, "second-pass-" + kind))
        self.assertEqual(State.SAFE_FOR_HUMAN_REVIEW, new.state)

    def test_reclassification_replacement_or_same_policy_is_not_reevaluation(self):
        record = at_stage(7)
        self.assert_reason("POLICY_CHANGE_REQUIRED", reevaluate, record, SUBJECT,
                           proof(SUBJECT, "policy_reevaluation"))
        for changes in ({"digest": "c" * 64}, {"classification": "official"},
                        {"manifest_fingerprint": "d" * 64}, {"generation": 2}):
            subject = replace(SUBJECT, policy_version="policy-B", **changes)
            self.assert_reason("IMMUTABLE_SOURCE_CHANGED", reevaluate, record, subject,
                               proof(subject, "policy_reevaluation"))

    def test_expiry_and_deletion_keep_meaning_without_resurrection(self):
        old = at_stage(7)
        expired = fail(old, State.EXPIRED, proof(SUBJECT, "expired"))
        deleted = fail(expired, State.DELETED_BY_POLICY, proof(SUBJECT, "deleted_by_policy"))
        self.assertEqual(expired.history, deleted.history[:-1])
        for record in (expired, deleted):
            subject = replace(SUBJECT, policy_version="policy-B")
            self.assert_reason("REEVALUATION_BLOCKED", reevaluate, record, subject,
                               proof(subject, "policy_reevaluation"))
        self.assert_reason("LIFECYCLE_CLOSED", fail, deleted, State.REJECTED,
                           proof(SUBJECT, "rejected"))

    def test_invalid_records_and_fabricated_history_are_rejected(self):
        self.assert_reason("INITIAL_STATE_REQUIRED", advance, Record(SUBJECT, State.SCANNED),
                           proof(SUBJECT, "isolated_preview"))
        illegal = Transition(State.RECEIVED_UNTRUSTED, State.SCANNED, SUBJECT, SUBJECT,
                             proof(SUBJECT, "scan"))
        self.assert_reason("INVALID_HISTORY", advance, Record(SUBJECT, State.SCANNED, (illegal,)),
                           proof(SUBJECT, "isolated_preview"))
        missing = replace(at_stage(3), history=at_stage(3).history[1:])
        self.assert_reason("INVALID_HISTORY", advance, missing, proof(SUBJECT, "scan"))
        malformed = replace(at_stage(1).history[0], observation=None)
        self.assert_reason("INVALID_HISTORY", advance,
                           Record(SUBJECT, State.QUARANTINED, (malformed,)), proof(SUBJECT, "identify"))

    def test_bad_subjects_fail_and_records_are_immutable(self):
        for changes in ({"generation": True}, {"generation": 0}, {"digest": "bad"},
                        {"classification": "unknown"}, {"policy_version": ""}, {"object_id": ""}):
            with self.subTest(changes=changes), self.assertRaises(PipelineError):
                receive(replace(SUBJECT, **changes))
        record = at_stage(1)
        with self.assertRaises(FrozenInstanceError):
            record.state = State.SAFE_FOR_HUMAN_REVIEW


if __name__ == "__main__":
    unittest.main()
