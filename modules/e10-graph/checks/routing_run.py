"""routing-run: compute eligible tasks from registry states (rules, not software).

Eligible = Depends-On all DONE (empty counts as DONE) + status READY (BLOCKED excluded).
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
eligible = []
for r in rows:
    if r.get("status") != "READY":
        continue
    deps = r.get("depends_on") or []
    if all(by_id.get(d, {}).get("status") == "DONE" for d in deps):
        eligible.append(r["task_id"])
eligible.sort(key=lambda t: (len(by_id[t].get("depends_on") or []), t))
out = APP_ROOT / "vault" / "INDEX" / "routing.json"
out.write_text(json.dumps({"generated_by": "routing-run (proof tooling, e10)",
                           "eligible": eligible}, indent=1, ensure_ascii=False), encoding="utf-8")
print(f"routing-run: eligible = {eligible}")
