"""check-design (design leg): design authority is referenced, never orphaned.

(1) design-token contract record exists, versioned, with supersedes. (2) every
module MANIFEST carries a Links section naming at least one capability, feature,
or design-token reference (C<number>, F<number>, V10, or design-token). Design
content itself lives in planning truth; this check gates the reference, not the art.
"""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fence_yaml, parse_simple, fail

code = 0
tok = APP_ROOT / "vault" / "CONTRACTS" / "design-token.md"
if not tok.exists():
    code = fail("design-token contract record missing") or 1
else:
    d = parse_simple(fence_yaml(read(tok)))
    if not d.get("version") or "supersedes" not in d:
        code = fail("design-token record unversioned or supersedes-less") or 1
for m in sorted((APP_ROOT / "modules").iterdir()):
    man = m / "MANIFEST.md"
    if not man.exists() or not m.is_dir():
        continue
    text = read(man)
    if "## Links" not in text:
        code = fail(f"{m.name}: Links section missing") or 1
        continue
    links = text.split("## Links", 1)[1]
    if not re.search(r"C\d+\.\d+|F\d+\.\d+|V10|design-token", links):
        code = fail(f"{m.name}: Links name no capability/feature/design reference") or 1
print("check-design: done")
sys.exit(code)
