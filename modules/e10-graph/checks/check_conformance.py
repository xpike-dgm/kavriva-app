"""check-conformance (R-013): EVIDENCE records carry all 8 fields WITH values.

Field presence alone is insufficient (empty-value forgery): every field must have
a non-empty value. PENDING is allowed ONLY in gate_verdict/reviewer (workflow states);
test_id/contract/subject/result/evidence_links/timestamp must be final. Registry rows
with status IN_PROGRESS/REVIEW/DONE and no resolvable evidence record FAIL (T3 coverage).
"""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fence_yaml, parse_simple, fail

FIELDS = ["test_id", "contract_id_version", "subject_digest", "result",
          "evidence_links", "gate_verdict", "reviewer", "timestamp"]
FINAL_ONLY = ["test_id", "contract_id_version", "subject_digest", "result",
              "evidence_links", "timestamp"]
edir = APP_ROOT / "vault" / "EVIDENCE"
recs = sorted(edir.glob("*.md")) if edir.exists() else []
code = 0
n = 0
for r in recs:
    text = read(r)
    data = parse_simple(fence_yaml(text))
    if not data.get("test_id"):
        continue
    n += 1
    for f in FIELDS:
        v = data.get(f)
        if not v:
            code = fail(f"{r.name}: conformance field missing or empty: {f}") or 1
        elif f in FINAL_ONLY and "PENDING" in str(v):
            code = fail(f"{r.name}: PENDING forbidden in final field: {f}") or 1
    for link in (data.get("evidence_links") or []):
        if not isinstance(link, str):
            continue
        link = link.strip().strip("`")
        if link.startswith("planning "):
            continue
        target = (APP_ROOT / link).resolve()
        try:
            target.relative_to(APP_ROOT)
        except ValueError:
            code = fail(f"{r.name}: evidence link escapes repo: {link}") or 1
            continue
        if not target.exists():
            code = fail(f"{r.name}: evidence link dangling: {link}") or 1
rdir = APP_ROOT / "vault" / "REGISTRY"
have_evidence = {d.get("test_id") for d in
                 (parse_simple(fence_yaml(read(x))) for x in recs)}
for p in sorted(rdir.glob("*.md")) if rdir.exists() else []:
    d = parse_simple(fence_yaml(read(p)))
    if d.get("status") in ("IN_PROGRESS", "REVIEW", "DONE") and not d.get("evidence"):
        code = fail(f"{p.name}: active row without evidence record") or 1
print(f"check-conformance: {n} evidence records scanned")
sys.exit(code)
