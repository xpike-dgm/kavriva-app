"""check-packs (R-005): every vault pack carries the 14 numbered fields + freshness.

Stale rule: a pack carrying `last_verified:` older than the newest registry
record's `last_verified:` is WARN; if any IN_PROGRESS task exists while a pack
is stale, FAIL (active work on stale context). Missing last_verified: WARN.
"""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fence_yaml, parse_simple, fail, warn

pdir = APP_ROOT / "vault" / "PACKS"
packs = sorted(pdir.glob("*.md")) if pdir.exists() else []
code = 0
for p in packs:
    nums = set(re.findall(r"^(\d+)\.\s", read(p), re.M))
    missing = [str(i) for i in range(1, 15) if str(i) not in nums]
    if missing:
        code = fail(f"{p.name}: pack fields missing: {','.join(missing)}") or 1
dates = []
active = False
for p in sorted((APP_ROOT / "vault" / "REGISTRY").glob("*.md")):
    d = parse_simple(fence_yaml(read(p)))
    if d.get("last_verified"):
        dates.append(d["last_verified"])
    if d.get("status") == "IN_PROGRESS":
        active = True
newest = max(dates) if dates else ""
for p in packs:
    d = parse_simple(fence_yaml(read(p)))
    lv = d.get("last_verified", "")
    if not lv:
        warn(f"{p.name}: no last_verified field")
    elif newest and lv < newest:
        if active:
            code = fail(f"{p.name}: stale pack with active task present") or 1
        else:
            warn(f"{p.name}: stale vs registry {newest}")
print(f"check-packs: {len(packs)} packs scanned")
sys.exit(code)
