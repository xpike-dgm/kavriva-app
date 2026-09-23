"""check-identity (R-004/R-010): no duplicate IDs; records carry identity metadata."""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, repo_files, read, fence_yaml, parse_simple, reject, fail

ID_KEYS = ("task_id", "test_id", "contract", "pack_id")
seen, code = {}, 0
for p in repo_files():
    text = read(p)
    data = parse_simple(fence_yaml(text))
    m = re.search(r"^Record:\s*`([^`]+)`", text, re.M)
    ids = [f"{k}:{data[k]}" for k in ID_KEYS if data.get(k)]
    if m:
        ids.append(f"record:{m.group(1)}")
    for i in ids:
        if i in seen:
            code = reject(f"collision: {i} in {p.name} + {seen[i]} (never merged)") or 2
        else:
            seen[i] = p.name
    if data and not data.get("status"):
        code = fail(f"{p.name}: metadata status missing") or 1
print(f"check-identity: {len(seen)} IDs indexed, {len(repo_files())} files scanned")
sys.exit(code)
