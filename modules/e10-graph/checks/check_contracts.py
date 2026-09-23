"""check-contracts (R-011/R-012): 9 catalog contracts own a record with complete fields."""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fence_yaml, parse_simple, fail

EXPECTED = ["authorization-tuple", "operation-identity", "state-epoch",
            "package-manifest", "ledger-operation", "audit-event",
            "release-promotion", "task-pack", "design-token"]
REQUIRED = ["contract", "owner", "version", "status", "content_defined_by"]
cdir = APP_ROOT / "vault" / "CONTRACTS"
have = {p.stem for p in cdir.glob("*.md")} if cdir.exists() else set()
code = 0
for name in EXPECTED:
    if name not in have:
        code = fail(f"contract record missing: {name}") or 1
        continue
    data = parse_simple(fence_yaml(read(cdir / f"{name}.md")))
    for k in REQUIRED:
        if not data.get(k):
            code = fail(f"{name}: field missing: {k}") or 1
    if data.get("status") not in ("PROPOSED", "APPROVED", "LOCKED"):
        code = fail(f"{name}: bad status: {data.get('status')}") or 1
print(f"check-contracts: {len(EXPECTED)} contracts expected, {len(have)} records found")
sys.exit(code)
