"""check-presence (structural leg): installed spec addresses exist (OUT-3 B-04).

Reference validation alone cannot see a deleted file nothing points at by path.
This check holds the closed inventory of Step-3/4/5/6 installed addresses; any
missing address FAILs. The inventory changes only through reviewed install steps.
"""
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, fail

EXPECTED = [
 "modules/e10-graph/checks/_lib.py",
 "modules/e10-graph/checks/run_all.py",
 "modules/e10-graph/checks/build_index.py",
 "modules/e10-graph/checks/routing_run.py",
 "modules/e10-graph/checks/check_manifests.py",
 "modules/e10-graph/checks/check_contracts.py",
 "modules/e10-graph/checks/check_packs.py",
 "modules/e10-graph/checks/check_identity.py",
 "modules/e10-graph/checks/check_orphans.py",
 "modules/e10-graph/checks/check_links.py",
 "modules/e10-graph/checks/check_edges.py",
 "modules/e10-graph/checks/check_conformance.py",
 "modules/e10-graph/checks/check_trace.py",
 "modules/e10-graph/checks/check_design.py",
 "modules/e10-graph/checks/check_presence.py",
 "modules/e10-graph/checks/VALIDATION_COMMANDS.md",
 "modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md",
 "modules/e10-graph/TASK_REGISTRY.md",
 "modules/e10-graph/ROUTING_AND_TRACEABILITY.md",
 "modules/e10-graph/MIGRATION_ROLLBACK_APPLICABILITY.md",
 ".github/workflows/checks.yml",
 ".github/workflows/CI_PLAN.md",
 "templates/CONTRACT_TEMPLATE.md",
 "templates/MANIFEST_TEMPLATE.md",
 "templates/PACK_TEMPLATE.md",
]
code = 0
for rel in EXPECTED:
    if not (APP_ROOT / rel).exists():
        code = fail(f"installed address missing: {rel}") or 1
print(f"check-presence: {len(EXPECTED)} addresses scanned")
sys.exit(code)
