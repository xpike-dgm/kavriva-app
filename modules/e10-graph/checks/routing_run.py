"""routing-run: compute eligible tasks from registry states (rules, not software).

Eligible = status READY + Depends-On all DONE (empty counts as DONE).
EXCLUDED states (never eligible, written to output as evidence): CLAIMED
(locked by claimed_by/claimed_at below), IN_PROGRESS, REVIEW, DONE, BLOCKED,
CANCELLED. A VERIFIED proof row advances per protocol instead of re-listing.
Order = topological depth (here: dependency count), then task ID. Writes
vault/INDEX/routing.json as run evidence. Manual-carry default unchanged.
"""
import json
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fence_yaml, parse_simple

rdir = APP_ROOT / "vault" / "REGISTRY"
rows = []
for p in sorted(rdir.glob("*.md")):
    data = parse_simple(fence_yaml(read(p)))
    if data.get("task_id"):
        rows.append(data)
by_id = {r["task_id"]: r for r in rows}
EXCLUDED = ("CLAIMED", "IN_PROGRESS", "REVIEW", "DONE", "BLOCKED", "CANCELLED")
eligible, excluded = [], {}
for r in rows:
    st = r.get("status")
    if st != "READY":
        if st in EXCLUDED:
            excluded[r["task_id"]] = st
        continue
    deps = r.get("depends_on") or []
    if all(by_id.get(d, {}).get("status") == "DONE" for d in deps):
        eligible.append(r["task_id"])
eligible.sort(key=lambda t: (len(by_id[t].get("depends_on") or []), t))
out = APP_ROOT / "vault" / "INDEX" / "routing.json"
out.write_text(json.dumps({"generated_by": "routing-run (proof tooling, e10)",
                           "eligible": eligible,
                           "excluded_by_status": excluded}, indent=1, ensure_ascii=False), encoding="utf-8")
print(f"routing-run: eligible = {eligible}; excluded = {excluded}")
