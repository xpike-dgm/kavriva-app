"""build-index: generate vault/INDEX/registry.json from REGISTRY records (generated only)."""
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
out = APP_ROOT / "vault" / "INDEX" / "registry.json"
out.write_text(json.dumps({"generated_by": "build-index (proof tooling, e10)",
                           "rows": rows}, indent=1, ensure_ascii=False), encoding="utf-8")
print(f"build-index: {len(rows)} rows -> {out.name}")
