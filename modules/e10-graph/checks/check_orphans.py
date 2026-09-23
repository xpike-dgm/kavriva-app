"""check-orphans (R-002): every file is owned-by-construction or referenced.

Owned-by-construction: vault/{REGISTRY,PACKS,CONTRACTS,EVIDENCE} records,
modules/*/MANIFEST.md, modules/e10-graph/checks/*, templates/*,
.github/workflows/*, root README.md, vault/INDEX/* (generated). All else must be
referenced by a backticked path in some .md file. .gitkeep exempt.
"""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, repo_files, read, fail

OWNED_DIRS = ("vault/REGISTRY", "vault/PACKS", "vault/CONTRACTS", "vault/EVIDENCE",
              "modules/e10-graph/checks", "templates", ".github/workflows", "vault/INDEX")
refs = set()
for p in repo_files():
    refs.update(re.findall(r"`([^`]*\.md)`", read(p)))
code = 0
for p in repo_files():
    rel = p.relative_to(APP_ROOT).as_posix()
    if p.name in (".gitkeep", "README.md", "MANIFEST.md"):
        continue
    if any(rel.startswith(d) for d in OWNED_DIRS):
        continue
    if rel in refs or p.name in refs:
        continue
    code = fail(f"orphan: {rel} (no owner, no reference)") or 1
print("check-orphans: done")
sys.exit(code)
