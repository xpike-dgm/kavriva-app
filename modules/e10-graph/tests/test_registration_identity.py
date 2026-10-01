"""Duplicate ownership/type claims cannot become a valid graph identity."""
import re
import sys
import tempfile
import unittest
from pathlib import Path

CHECKS = Path(__file__).resolve().parents[1] / "checks"
sys.path.insert(0, str(CHECKS))
from _lib import APP_ROOT, read, frontmatter_yaml
from check_registration import inspect_records


class RegistrationIdentityTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        module = self.root / "modules/e10-graph"
        module.mkdir(parents=True)
        (module / "MANIFEST.md").write_text("# Capsule fixture\n", encoding="utf-8")
        self.schema = frontmatter_yaml(read(APP_ROOT / "modules/e10-graph/GRAPH_NODE_REGISTRATION.md"))

    def record(self, name, identity_key, extra=""):
        block = re.sub(r"^record_id:.*$", identity_key + ": COLLISION-NODE", self.schema, flags=re.M)
        p = self.root / name
        p.write_text("---\n" + block + "\n" + extra + "\n---\n\n# Fixture\n", encoding="utf-8")
        return p

    def test_same_slug_in_two_record_types_is_rejected(self):
        paths = [self.record("task.md", "task_id"), self.record("contract.md", "contract")]
        issues = inspect_records(self.root, paths)
        self.assertTrue(any(level == 2 and "collision" in message for level, _, message in issues))

    def test_two_owned_types_in_one_file_are_not_merged(self):
        p = self.record("ambiguous.md", "task_id", "contract: COLLISION-NODE")
        self.assertTrue(any(level == 2 and "identities" in message
                            for level, _, message in inspect_records(self.root, [p])))

    def test_duplicate_status_key_cannot_override_by_last_value(self):
        p = self.record("duplicate.md", "record_id", "status: DONE")
        self.assertTrue(any(level == 2 and "duplicate frontmatter" in message
                            for level, _, message in inspect_records(self.root, [p])))

    def test_body_cannot_claim_a_different_immutable_identity(self):
        p = self.record("changed.md", "record_id")
        p.write_text(p.read_text(encoding="utf-8") + "\nRecord: `OTHER-NODE`\n", encoding="utf-8")
        self.assertTrue(any(level == 2 and "identity disagree" in message
                            for level, _, message in inspect_records(self.root, [p])))


if __name__ == "__main__":
    unittest.main()
