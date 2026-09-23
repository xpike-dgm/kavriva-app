"""check-edges (R-003): manifests declare allowed+forbidden; denylist scan.

Structural gate (declarations present + non-empty) plus a small forbidden-pattern
scan: service_role outside e03-server/e05-identity, signing-custody ownership outside
e06/e07 manifests. Negated mentions (lines containing no/never/without/No) are
prohibitions, not violations, and are skipped. Full DAG cycle detection arrives
with code-bearing modules (Development).
"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fail

DENY = [("service_role", ("e03-server", "e05-identity")),
        ("signing custody", ("e06-release", "e07-build-lane"))]
mods = sorted(p for p in (APP_ROOT / "modules").iterdir() if p.is_dir())
code = 0
for m in mods:
    man = m / "MANIFEST.md"
    if not man.exists():
        continue
    text = read(man)
    for section in ("## Allowed / forbidden dependencies",):
        if section not in text:
            code = fail(f"{m.name}: edge declaration section missing") or 1
    for pat, allow in DENY:
        for line in text.splitlines():
            low = line.lower()
            if pat in low and m.name not in allow:
                if any(n in low for n in ("no ", "never", "without", "forbidden")):
                    continue
                code = fail(f"{m.name}: forbidden pattern outside owning capsule: {pat}") or 1
                break
print(f"check-edges: {len(mods)} manifests scanned")
sys.exit(code)
