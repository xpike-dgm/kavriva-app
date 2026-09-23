"""check-links (R-014): backticked .md references resolve; open-link labels visible.

--plan-root enables strict resolution of planning-truth refs; without it, refs
matching the planning allowlist are EXTERNAL-OK. Smoothing (claiming a label
resolved without evidence) is out of scope for automation: FAIL only on dangling.
"""
import argparse
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, PLAN_ALLOW, repo_files, read, fail

ap = argparse.ArgumentParser()
ap.add_argument("--plan-root", default="")
args = ap.parse_args()
code = 0
for p in repo_files():
    for ref in re.findall(r"`([^`]*\.md)`", read(p)):
        if "://" in ref or ref.startswith("http") or "*" in ref:
            continue
        ok = False
        for cand in ((p.parent / ref).resolve(), (APP_ROOT / ref).resolve()):
            try:
                cand.relative_to(APP_ROOT)
                if cand.exists():
                    ok = True
                    break
            except ValueError:
                continue
        if not ok:
            base = ref.split("/")[-1]
            if base != ref:
                ok = any(True for _ in APP_ROOT.rglob(base))
        if not ok and ref.startswith("kavriva-app/"):
            ok = (APP_ROOT.parent / ref).exists()
        if not ok and args.plan_root:
            import pathlib
            proot = pathlib.Path(args.plan_root)
            if (proot / ref).exists():
                ok = True
            else:
                base = ref.split("/")[-1]
                ok = any(True for _ in proot.rglob(base))
        if not ok and not args.plan_root:
            ok = ref.split("/")[0] in PLAN_ALLOW or any(a in ref for a in PLAN_ALLOW)
        if not ok:
            code = fail(f"{p.name}: dangling reference: {ref}") or 1
print("check-links: done")
sys.exit(code)
