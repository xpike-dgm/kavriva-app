"""T-E3-010: lineage does not promote copies/history into current authority."""

import sys
import unittest
from dataclasses import FrozenInstanceError, replace
from datetime import date, datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "public"))
from domain_authority import COPY_KINDS
from maintenance_provenance import (
    HistorySnapshot, MaintenanceRevision, ProvenanceError,
    current_revision, make_convenience_copy, validate_history,
)

REVISION = MaintenanceRevision(1, "operation-1", "actor-1",
    datetime(2026, 10, 1, tzinfo=timezone.utc), date(2026, 9, 30),
    12000, "Oil changed", "Owner-reported", None, "USER_REPORTED")
SNAPSHOT = HistorySnapshot("tenant-1", "record-1", "bike-1", 1, (REVISION,))


class MaintenanceProvenanceTests(unittest.TestCase):
    def assert_reason(self, reason, fn):
        with self.assertRaises(ProvenanceError) as caught:
            fn()
        self.assertEqual(caught.exception.reason, reason)

    def test_head_and_prior_revision_keep_distinct_meaning(self):
        correction = replace(REVISION, generation=2, operation_id="operation-2",
                             outcome="Oil and filter changed", correction_reason="Filter omitted")
        snapshot = replace(SNAPSHOT, current_generation=2, revisions=(REVISION, correction))
        self.assertEqual(current_revision(snapshot), correction)
        self.assertEqual(snapshot.revisions[0], REVISION)
        self.assertEqual(current_revision(snapshot).evidence_level, "USER_REPORTED")

    def test_all_copy_kinds_retain_lineage_but_are_never_current(self):
        for kind in COPY_KINDS:
            copy = make_convenience_copy(SNAPSHOT, kind=kind)
            self.assertEqual((copy.source_record_id, copy.source_generation), ("record-1", 1))
            self.assertEqual(copy.revisions, SNAPSHOT.revisions)
            self.assert_reason("NON_CANONICAL_SOURCE", lambda: current_revision(copy))

    def test_history_row_and_audit_payload_are_not_current_snapshots(self):
        for value in (REVISION, {"kind": "canonical", "verdict": "ALLOW"}, None):
            self.assert_reason("NON_CANONICAL_SOURCE", lambda: current_revision(value))

    def test_no_fake_copy_kind_or_current_copy_is_accepted(self):
        for kind in ("canonical", "current", "protected_audit", "unknown"):
            self.assert_reason("UNKNOWN_COPY_KIND", lambda: make_convenience_copy(SNAPSHOT, kind=kind))

    def test_missing_or_mixed_history_is_rejected(self):
        for snapshot in (replace(SNAPSHOT, current_generation=2),
                         replace(SNAPSHOT, revisions=()),
                         replace(SNAPSHOT, revisions=(replace(REVISION, generation=2),))):
            reason = "HISTORY_GENERATION_MISMATCH" if snapshot.revisions and snapshot.revisions[0].generation == 2 else "HISTORY_INCOMPLETE"
            self.assert_reason(reason, lambda: current_revision(snapshot))

    def test_correction_and_operation_provenance_are_required(self):
        for revision, reason in (
            (replace(REVISION, generation=2, operation_id="operation-2"), "CORRECTION_REASON_MISSING"),
            (replace(REVISION, generation=2, correction_reason="Corrected"), "PROVENANCE_OPERATION_REUSED"),
        ):
            snapshot = replace(SNAPSHOT, current_generation=2, revisions=(REVISION, revision))
            self.assert_reason(reason, lambda: validate_history(snapshot))

    def test_missing_actor_identity_or_time_is_rejected(self):
        for revision, reason in (
            (replace(REVISION, actor_id=""), "PROVENANCE_MISSING"),
            (replace(REVISION, recorded_at=datetime(2026, 10, 1)), "PROVENANCE_TIME_INVALID"),
            (replace(REVISION, odometer_km=True), "PROVENANCE_ODOMETER_INVALID"),
        ):
            self.assert_reason(reason, lambda: validate_history(replace(SNAPSHOT, revisions=(revision,))))
        self.assert_reason("HISTORY_IDENTITY_MISSING", lambda: validate_history(replace(SNAPSHOT, tenant_id="")))

    def test_history_cannot_upgrade_user_report_into_verification(self):
        self.assert_reason("UNPROVEN_VERIFICATION", lambda: current_revision(replace(
            SNAPSHOT, revisions=(replace(REVISION, evidence_level="VERIFIED"),))))

    def test_copy_cannot_mutate_or_replace_source_revision(self):
        copy = make_convenience_copy(SNAPSHOT, kind="cache")
        with self.assertRaises(FrozenInstanceError):
            copy.source_generation = 2
        with self.assertRaises(FrozenInstanceError):
            copy.revisions[0].outcome = "Overwritten"
        self.assertEqual(current_revision(SNAPSHOT).outcome, "Oil changed")


if __name__ == "__main__":
    unittest.main()
