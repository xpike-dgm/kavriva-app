"""check-trace (R-014 closure leg): every registry row's trace segment is complete.

Each REGISTRY row must: name an evidence record that exists; name an owner module
that owns a MANIFEST.md. Each CONTRACT record must name an owner capsule owning a
module directory. (Full bidirectional closure — every requirement owning a task —
arrives with the full-row migration in Development; the Gate-8 criterion demands validation
by an EXAMPLE task (singular), which the migrated proof row satisfies. This check gates the
segment, not the whole chain.)
"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, meta_yaml, parse_simple, fail

code = 0
ids = set()
edir = APP_ROOT / "vault" / "EVIDENCE"
for x in sorted(edir.glob("*.md")) if edir.exists() else []:
    t = parse_simple(meta_yaml(read(x))).get("test_id")
    if t:
        ids.add(t)
rdir = APP_ROOT / "vault" / "REGISTRY"
for p in sorted(rdir.glob("*.md")) if rdir.exists() else []:
    d = parse_simple(meta_yaml(read(p)))
    if not d.get("task_id"):
        continue
    ev = (d.get("evidence") or "").split()[0].strip("`[]")
    if not ev:
        code = fail(f"{p.name}: no evidence record named") or 1
    elif ev not in ids:
        code = fail(f"{p.name}: evidence name matches no test_id: {ev}") or 1
    owner = (d.get("owner") or "").strip()
    mod = {"E1": "e01-app", "E2": "e02-panel", "E3": "e03-server", "E4": "e04-offline",
           "E5": "e05-identity", "E6": "e06-release", "E7": "e07-build-lane",
           "E8": "e08-content", "E9": "e09-ai", "E10": "e10-graph"}.get(owner)
    if not mod or not (APP_ROOT / "modules" / mod / "MANIFEST.md").exists():
        code = fail(f"{p.name}: owner module manifest missing: {owner}") or 1
cdir = APP_ROOT / "vault" / "CONTRACTS"
for p in sorted(cdir.glob("*.md")) if cdir.exists() else []:
    d = parse_simple(meta_yaml(read(p)))
    if not d.get("contract"):
        continue
    owner = (d.get("owner") or "").strip()
    mod = {"E1": "e01-app", "E2": "e02-panel", "E3": "e03-server", "E4": "e04-offline",
           "E5": "e05-identity", "E6": "e06-release", "E7": "e07-build-lane",
           "E8": "e08-content", "E9": "e09-ai", "E10": "e10-graph"}.get(owner)
    if not mod or not (APP_ROOT / "modules" / mod).is_dir():
        code = fail(f"{p.name}: owner capsule module missing: {owner}") or 1
print("check-trace: done")
sys.exit(code)
