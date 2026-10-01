"""Registration dates must not mask stale work or expire unrelated contexts."""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "checks"))
from check_packs import freshness_findings


class PackFreshnessTests(unittest.TestCase):
    def test_unrelated_newer_task_does_not_expire_current_active_pack(self):
        tasks = {
            "OWN": {"status": "IN_PROGRESS", "last_verified": "2026-10-01"},
            "OTHER": {"status": "IN_PROGRESS", "last_verified": "2026-10-02"},
        }
        self.assertEqual([], freshness_findings(
            {"task_ref": "OWN", "last_verified": "2026-10-01"}, tasks))

    def test_actual_older_pack_for_its_active_task_still_fails(self):
        findings = freshness_findings(
            {"task_ref": "OWN", "last_verified": "2026-10-01"},
            {"OWN": {"status": "IN_PROGRESS", "last_verified": "2026-10-02"}})
        self.assertTrue(any(level == 1 for level, _ in findings))

    def test_completed_history_warns_without_becoming_active_work(self):
        findings = freshness_findings(
            {"task_ref": "DONE", "last_verified": "2026-10-01"},
            {"DONE": {"status": "DONE", "last_verified": "2026-10-02"}})
        self.assertTrue(findings)
        self.assertTrue(all(level == 0 for level, _ in findings))

    def test_unresolved_task_is_explicit_not_falsely_verified(self):
        self.assertTrue(freshness_findings(
            {"task_ref": "MISSING", "last_verified": "2026-10-01"}, {}))


if __name__ == "__main__":
    unittest.main()
