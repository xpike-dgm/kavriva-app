"""Historical proof survives metadata framing; tampering cannot refresh approval."""
import hashlib
import sys
import tempfile
import unittest
from pathlib import Path

CHECKS = Path(__file__).resolve().parents[1] / "checks"
sys.path.insert(0, str(CHECKS))
from _lib import APP_ROOT, read, frontmatter_yaml, parse_simple
from _record_preservation import (
    ARCHIVED_PACK, LEGACY_PACK, FROZEN_PACK_DIGEST, ORIGIN_ROOT,
    verify_frozen_pack, verify_origin, verify_origin_catalog,
    verify_origin_binding, verify_origin_coverage,
)


class PreservationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.original = (APP_ROOT / ARCHIVED_PACK).read_bytes()

    def write(self, path, raw):
        p = self.root / path
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_bytes(raw)

    def test_original_call_site_and_archived_payload_both_verify(self):
        for path, data in (
            (LEGACY_PACK, {"pack_digest": FROZEN_PACK_DIGEST}),
            (ARCHIVED_PACK, {"pack_file": ARCHIVED_PACK, "pack_digest": FROZEN_PACK_DIGEST}),
        ):
            with self.subTest(path=path):
                self.write(path, self.original)
                self.assertEqual([], verify_frozen_pack(self.root, data))

    def test_modified_frozen_payload_is_not_the_old_proof(self):
        self.write(ARCHIVED_PACK, self.original + b"\nchanged proof\n")
        self.assertTrue(verify_frozen_pack(self.root, {
            "pack_file": ARCHIVED_PACK, "pack_digest": FROZEN_PACK_DIGEST,
        }))

    def test_recomputed_digest_cannot_replace_pinned_original(self):
        raw = self.original + b"\nnew payload\n"
        self.write(ARCHIVED_PACK, raw)
        self.assertTrue(verify_frozen_pack(self.root, {
            "pack_file": ARCHIVED_PACK, "pack_digest": hashlib.sha256(raw).hexdigest(),
        }))

    def test_same_bytes_at_an_unapproved_address_are_rejected(self):
        self.write("elsewhere.snapshot", self.original)
        self.assertTrue(verify_frozen_pack(self.root, {
            "pack_file": "elsewhere.snapshot", "pack_digest": FROZEN_PACK_DIGEST,
        }))

    def test_missing_preserved_payload_is_rejected(self):
        self.assertTrue(verify_frozen_pack(self.root, {
            "pack_file": ARCHIVED_PACK, "pack_digest": FROZEN_PACK_DIGEST,
        }))

    def test_pinned_full_catalog_rejects_missing_or_changed_archive(self):
        self.assertEqual([], verify_origin_catalog(APP_ROOT))
        self.write(ARCHIVED_PACK, self.original)
        self.assertTrue(verify_origin_catalog(self.root))

    def test_rehashed_changed_blob_cannot_replace_original_catalog(self):
        for p in (APP_ROOT / ORIGIN_ROOT).rglob("*.snapshot"):
            self.write(p.relative_to(APP_ROOT).as_posix(), p.read_bytes())
        self.assertEqual([], verify_origin_catalog(self.root))
        self.write(ARCHIVED_PACK, self.original + b"\nrehashed forged origin\n")
        self.assertTrue(verify_origin_catalog(self.root))

    def test_historical_verdict_cannot_be_promoted_in_new_metadata(self):
        text = read(APP_ROOT / "vault/EVIDENCE/E-DEV-001.md")
        data = parse_simple(frontmatter_yaml(text))
        self.assertEqual([], verify_origin(APP_ROOT, data, text))
        forged = dict(data, gate_verdict="PASS: newly granted authority")
        self.assertTrue(verify_origin(APP_ROOT, forged, text))

    def test_original_semantic_body_cannot_be_rewritten(self):
        text = read(APP_ROOT / "vault/EVIDENCE/E-DEV-001.md")
        data = parse_simple(frontmatter_yaml(text))
        marker = "# E-DEV-001"
        self.assertIn(marker, text)
        self.assertTrue(verify_origin(APP_ROOT, data, text.replace(marker, "# Altered proof", 1)))

    def test_baseline_custody_link_cannot_be_removed_or_replaced(self):
        path = APP_ROOT / "vault/EVIDENCE/E-DEV-001.md"
        data = parse_simple(frontmatter_yaml(read(path)))
        self.assertEqual([], verify_origin_binding(APP_ROOT, path, data))
        self.assertTrue(verify_origin_binding(APP_ROOT, path, {}))
        self.assertTrue(verify_origin_binding(APP_ROOT, path,
                        dict(data, metadata_origin_file=ARCHIVED_PACK)))

    def test_new_node_cannot_borrow_another_nodes_original_payload(self):
        self.assertTrue(verify_origin_binding(APP_ROOT, APP_ROOT / "new-node.md",
                        {"metadata_origin_file": ARCHIVED_PACK}))

    def test_baseline_record_cannot_disappear_from_current_corpus(self):
        self.write(ARCHIVED_PACK, self.original)
        self.assertEqual([], verify_origin_coverage(self.root, [self.root / LEGACY_PACK]))
        self.assertTrue(verify_origin_coverage(self.root, []))


if __name__ == "__main__":
    unittest.main()
