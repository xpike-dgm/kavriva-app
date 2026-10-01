"""T-E3-009: ambiguous authority and stale versions fail closed."""

import copy
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "public"))
from domain_authority import COPY_KINDS, RegistryError, load_registry, validate_successor

SUBJECT = ROOT / "vault/REGISTRY/domain-authorities.json"


class DomainAuthorityTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "registry.json"
        self.data = json.loads(SUBJECT.read_text())
        self.registry = load_registry(SUBJECT)

    def load(self, data):
        self.path.write_text(json.dumps(data), encoding="utf-8")
        return load_registry(self.path)

    def assert_reason(self, reason, fn):
        with self.assertRaises(RegistryError) as context:
            fn()
        self.assertEqual(context.exception.reason, reason)

    def test_committed_registry_has_one_stable_authority_per_domain(self):
        self.assertEqual(len(self.registry.authorities), 8)
        for a in self.registry.authorities:
            self.assertEqual(self.registry.resolve(a.domain_id, expected_version=1,
                                                  expected_revision=1), a)
            self.assertEqual(a.physical_activation, "HELD")

    def test_snapshot_succession_against_preserved_git_history(self):
        relative = SUBJECT.relative_to(ROOT).as_posix()
        commits = subprocess.run(["git", "log", "-2", "--format=%H", "--", relative],
                                 cwd=ROOT, check=True, capture_output=True, text=True).stdout.splitlines()
        if len(commits) < 2:
            self.assertEqual(self.registry.version, 1)
            return
        predecessor = subprocess.run(["git", "show", commits[1] + ":" + relative],
                                     cwd=ROOT, check=True, capture_output=True).stdout
        self.path.write_bytes(predecessor)
        validate_successor(load_registry(self.path), self.registry)

    def test_duplicate_authority_is_rejected(self):
        self.data["authorities"].append(copy.deepcopy(self.data["authorities"][0]))
        self.assert_reason("MULTIPLE_DOMAIN_AUTHORITIES", lambda: self.load(self.data))

    def test_missing_domain_is_rejected(self):
        self.data["authorities"].pop()
        self.assert_reason("MISSING_DOMAIN", lambda: self.load(self.data))

    def test_identity_and_owner_substitution_are_rejected(self):
        for key, value, reason in [("authority_id", "cache.user_records", "UNSTABLE_AUTHORITY_ID"),
                                   ("owner", "E1", "DOMAIN_OWNER_MISMATCH")]:
            with self.subTest(key=key):
                data = copy.deepcopy(self.data)
                data["authorities"][0][key] = value
                self.assert_reason(reason, lambda: self.load(data))

    def test_no_convenience_copy_is_an_authority(self):
        for kind in COPY_KINDS:
            with self.subTest(kind=kind):
                self.assert_reason("NON_AUTHORITATIVE_SOURCE", lambda:
                    self.registry.resolve("user_records", expected_version=1,
                                          expected_revision=1, source_kind=kind))

    def test_unknown_domain_and_stale_versions_have_no_fallback(self):
        for domain, version, revision, reason in [
            ("unknown", 1, 1, "UNKNOWN_DOMAIN"),
            ("user_records", 2, 1, "REGISTRY_VERSION_MISMATCH"),
            ("user_records", True, 1, "REGISTRY_VERSION_MISMATCH"),
            ("user_records", 1, 2, "AUTHORITY_REVISION_MISMATCH"),
        ]:
            with self.subTest(reason=reason):
                self.assert_reason(reason, lambda: self.registry.resolve(
                    domain, expected_version=version, expected_revision=revision))

    def test_unproven_activation_cannot_be_smuggled_in(self):
        self.data["authorities"][0]["physical_activation"] = "ACTIVE"
        self.assert_reason("UNPROVEN_PHYSICAL_ACTIVATION", lambda: self.load(self.data))

    def test_duplicate_json_keys_are_rejected(self):
        self.path.write_text('{"version":1,"version":2}', encoding="utf-8")
        self.assert_reason("DUPLICATE_JSON_KEY", lambda: load_registry(self.path))

    def test_hold_successor_keeps_identity_and_fences_resolution(self):
        self.data["version"] = 2
        self.data["supersedes_digest"] = self.registry.digest
        self.data["authorities"][0]["state"] = "HELD"
        self.data["authorities"][0]["revision"] = 2
        successor = self.load(self.data)
        validate_successor(self.registry, successor)
        self.assertEqual(successor.authorities[0].authority_id, self.registry.authorities[0].authority_id)
        self.assert_reason("DOMAIN_HELD", lambda: successor.resolve(
            successor.authorities[0].domain_id, expected_version=2, expected_revision=2))

    def test_successor_rejects_stale_predecessor_and_revision(self):
        self.data["version"] = 2
        self.data["supersedes_digest"] = "0" * 64
        self.assert_reason("PREDECESSOR_DIGEST_MISMATCH", lambda:
                           validate_successor(self.registry, self.load(self.data)))
        self.data["supersedes_digest"] = self.registry.digest
        self.data["authorities"][0]["state"] = "HELD"
        self.assert_reason("INVALID_REVISION_STEP", lambda:
                           validate_successor(self.registry, self.load(self.data)))

    def test_version_skip_and_rollback_are_rejected(self):
        for version in (1, 3):
            data = copy.deepcopy(self.data)
            data["version"] = version
            data["supersedes_digest"] = self.registry.digest if version > 1 else None
            self.assert_reason("INVALID_VERSION_STEP", lambda:
                               validate_successor(self.registry, self.load(data)))

    def test_invalid_revision_and_unexpected_fields_are_rejected(self):
        for revision in (0, -1, True, "1"):
            data = copy.deepcopy(self.data)
            data["authorities"][0]["revision"] = revision
            self.assert_reason("INVALID_AUTHORITY_REVISION", lambda: self.load(data))
        self.data["authorities"][0]["fallback"] = "cache"
        self.assert_reason("INVALID_AUTHORITY_SHAPE", lambda: self.load(self.data))


if __name__ == "__main__":
    unittest.main()
