"""check-conformance (R-013): EVIDENCE records carry all 8 fields WITH values.

Field presence alone is insufficient (empty-value forgery): every field must have
a non-empty value. gate_verdict is drawn from a closed set {PASS, FAIL, VERIFIED,
RECORDED, BLOCKED}; subject_digest must be 64 hex chars (sha256 of the subject).
PENDING is forbidden everywhere (workflow states live in reviewer notes, not fields).
Files in EVIDENCE without test_id are supporting notes: each must be referenced from
some record's evidence_links, else FAIL (orphan non-record). Registry rows with status
IN_PROGRESS/REVIEW/DONE and no resolvable evidence record FAIL (T3 coverage).
Metadata source: YAML frontmatter preferred, legacy ```yaml fence accepted.
"""
from pathlib import Path
import re
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, meta_yaml, parse_simple, fail

FIELDS = ["test_id", "contract_id_version", "subject_digest", "result",
          "evidence_links", "gate_verdict", "reviewer", "timestamp"]
VERDICTS = ("PASS", "FAIL", "VERIFIED", "RECORDED", "BLOCKED")
edir = APP_ROOT / "vault" / "EVIDENCE"
recs = sorted(edir.glob("*.md")) if edir.exists() else []
code = 0
n = 0
for r in recs:
    text = read(r)
    data = parse_simple(meta_yaml(text))
    if not data.get("test_id"):
        continue
    n += 1
    for f in FIELDS:
        v = data.get(f)
        if not v:
            code = fail(f"{r.name}: conformance field missing or empty: {f}") or 1
        elif "PENDING" in str(v):
            code = fail(f"{r.name}: PENDING forbidden in field: {f}") or 1
    if str(data.get("gate_verdict", "")).split()[0] not in VERDICTS:
        code = fail(f"{r.name}: verdict outside closed set: {data.get('gate_verdict')}") or 1
    dg = str(data.get("subject_digest", ""))
    if not re.match(r"^[0-9a-fA-F]{64}\b", dg) or re.match(r"^0{64}\b", dg):
        code = fail(f"{r.name}: subject_digest is not a real sha256: {dg[:40]}") or 1
    ts = str(data.get("timestamp", ""))
    if not re.match(r"^20\d\d-\d\d-\d\d$", ts):
        code = fail(f"{r.name}: timestamp is not YYYY-MM-DD: {ts[:40]}") or 1
    for link in (data.get("evidence_links") or []):
        if not isinstance(link, str):
            continue
        link = link.strip().strip("`")
        if link.startswith("[[") and link.endswith("]]"):
            link = link[2:-2]
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
linked = set()
for r in recs:
    data = parse_simple(meta_yaml(read(r)))
    for link in (data.get("evidence_links") or []):
        if isinstance(link, str):
            linked.add(link.strip().strip("`").replace("[[", "").replace("]]", ""))
for r in recs:
    text = read(r)
    data = parse_simple(meta_yaml(text))
    if data.get("test_id"):
        continue
    stem = r.stem
    if not any(stem in (l.split("/")[-1].split(".")[0]) for l in linked):
        code = fail(f"{r.name}: supporting note referenced by no record") or 1
rdir = APP_ROOT / "vault" / "REGISTRY"
for p in sorted(rdir.glob("*.md")) if rdir.exists() else []:
    d = parse_simple(meta_yaml(read(p)))
    if d.get("status") in ("IN_PROGRESS", "REVIEW", "DONE") and not d.get("evidence"):
        code = fail(f"{p.name}: active row without evidence record") or 1
print(f"check-conformance: {n} evidence records scanned")
sys.exit(code)
