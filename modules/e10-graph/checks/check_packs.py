"""check-packs (R-005): every vault pack carries the 14 numbered fields + freshness.

Freshness is relative to the pack's own task_ref, never an unrelated task's
date. An older pack for its own IN_PROGRESS task is FAIL; otherwise WARN.
Missing dates or task_ref remain explicit warnings, not guessed freshness.
"""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, meta_yaml, parse_simple, fail, warn

def freshness_findings(pack, tasks):
    lv = pack.get("last_verified", "")
    if not lv:
        return [(0, "no last_verified field")]
    task = tasks.get(pack.get("task_ref"))
    if task is None:
        return [(0, "no resolvable task_ref for freshness comparison")]
    verified = task.get("last_verified", "")
    if not verified:
        return [(0, "linked task has no verification date")]
    if lv < verified:
        return [(1 if task.get("status") == "IN_PROGRESS" else 0,
                 "stale vs linked task " + str(pack["task_ref"]) + " " + verified)]
    return []


if __name__ == "__main__":
    pdir = APP_ROOT / "vault" / "PACKS"
    packs = sorted(pdir.glob("*.md")) if pdir.exists() else []
    tasks = {}
    for p in sorted((APP_ROOT / "vault" / "REGISTRY").glob("*.md")):
        data = parse_simple(meta_yaml(read(p)))
        if data.get("task_id"):
            tasks[data["task_id"]] = data
    code = 0
    for p in packs:
        text = read(p)
        nums = set(re.findall(r"^(\d+)\.\s", text, re.M))
        missing = [str(i) for i in range(1, 15) if str(i) not in nums]
        if missing:
            code = max(code, fail(f"{p.name}: pack fields missing: {','.join(missing)}"))
        for level, message in freshness_findings(parse_simple(meta_yaml(text)), tasks):
            code = max(code, fail(f"{p.name}: {message}") if level else warn(f"{p.name}: {message}"))
    print(f"check-packs: {len(packs)} packs scanned")
    sys.exit(code)
