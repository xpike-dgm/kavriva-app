"""check-packs (R-005): every vault pack carries the 14 numbered fields."""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fail, warn

pdir = APP_ROOT / "vault" / "PACKS"
packs = sorted(pdir.glob("*.md")) if pdir.exists() else []
code = 0
for p in packs:
    nums = set(re.findall(r"^(\d+)\.\s", read(p), re.M))
    missing = [str(i) for i in range(1, 15) if str(i) not in nums]
    if missing:
        code = fail(f"{p.name}: pack fields missing: {','.join(missing)}") or 1
print(f"check-packs: {len(packs)} packs scanned")
sys.exit(code)
