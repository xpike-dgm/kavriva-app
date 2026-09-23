"""check-manifests (R-001): every module owns a MANIFEST.md with all 7 anatomy fields."""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fail

FIELDS = ["## Purpose", "## Public contract surface", "## Internal scope",
          "## Allowed / forbidden dependencies", "## Tests",
          "## Change / rollback rules", "## Links"]
mods = sorted(p for p in (APP_ROOT / "modules").iterdir() if p.is_dir())
code = 0
if not mods:
    sys.exit(fail("no module directories"))
for m in mods:
    man = m / "MANIFEST.md"
    if not man.exists():
        code = fail(f"{m.name}: MANIFEST.md missing") or 1
        continue
    text = read(man)
    for f in FIELDS:
        if f not in text:
            code = fail(f"{m.name}: anatomy field missing: {f}") or 1
print(f"check-manifests: {len(mods)} modules scanned")
sys.exit(code)
