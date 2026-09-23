"""check-conformance (R-013): EVIDENCE records carry all 8 conformance fields."""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fail

FIELDS = ["test_id", "contract_id_version", "subject_digest", "result",
          "evidence_links", "gate_verdict", "reviewer", "timestamp"]
edir = APP_ROOT / "vault" / "EVIDENCE"
recs = sorted(edir.glob("*.md")) if edir.exists() else []
code = 0
for r in recs:
    text = read(r)
    for f in FIELDS:
        if f not in text:
            code = fail(f"{r.name}: conformance field missing: {f}") or 1
print(f"check-conformance: {len(recs)} evidence records scanned")
sys.exit(code)
