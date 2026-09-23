"""run-all: execute the Step-3 command suite; exit nonzero on any FAIL/REJECT."""
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
CHECKS = ["check_manifests.py", "check_contracts.py", "check_packs.py",
          "check_identity.py", "check_orphans.py", "check_links.py",
          "check_edges.py", "check_conformance.py"]
worst = 0
for c in CHECKS:
    r = subprocess.run([sys.executable, str(HERE / c)] + sys.argv[1:],
                       capture_output=True, text=True)
    print(f"### {c} -> exit {r.returncode}")
    out = (r.stdout + r.stderr).strip()
    if out:
        print(out)
    worst = max(worst, r.returncode)
print(f"run-all: worst exit = {worst}")
sys.exit(worst)
