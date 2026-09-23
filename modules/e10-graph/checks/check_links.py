"""check-links (R-014): backticked .md references resolve; open-link labels visible.

Resolution order: parent-relative, APP-relative, kavriva-app/-prefixed, plan-tree
(strict --plan-root) or KNOWN_PLANNING closed set (CI mode). Basename shortcut is
allowed ONLY on unique match (exactly one file with that name in the searched tree);
zero or multiple matches FAIL. Smoothing: a file carrying open-link labels
(MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED/PENDING/HELD/TBD) with no backticked
reference at all FAILs (unsourced claim).
"""
import argparse
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, repo_files, read, fail

OPEN_LABELS = ("MISSING", "UNOWNED", "BLOCKED", "CONFLICT", "UNVERIFIED",
               "PENDING", "HELD", "TBD")

ap = argparse.ArgumentParser()
ap.add_argument("--plan-root", default="")
args = ap.parse_args()
code = 0
edges = 0
for p in repo_files():
    text = read(p)
    refs = re.findall(r"`([^`]*\.md)`", text)
    refs += re.findall(r"\[\[([^\]]*\.md)\]\]", text)
    for ref in refs:
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
        if not ok and ref.startswith("kavriva-app/"):
            ok = (APP_ROOT / ref[len("kavriva-app/"):]).exists() or \
                (APP_ROOT.parent / ref).exists()
        if not ok:
            base = ref.split("/")[-1]
            pool = list(APP_ROOT.rglob(base))
            pool = [x for x in pool if ".git" not in x.parts]
            if len(pool) == 1:
                ok = True
        if not ok and args.plan_root:
            import pathlib
            proot = pathlib.Path(args.plan_root)
            if (proot / ref).exists():
                ok = True
            else:
                base = ref.split("/")[-1]
                pool = list(proot.rglob(base))
                if len(pool) == 1:
                    ok = True
        if not ok and not args.plan_root:
            from _lib import KNOWN_PLANNING
            norm = ref[len("planning "):] if ref.startswith("planning ") else ref
            ok = ref in KNOWN_PLANNING or norm in KNOWN_PLANNING
        if not ok:
            code = fail(f"{p.name}: dangling reference: {ref}") or 1
        else:
            edges += 1
    labels = []
    for m in re.finditer(r"(?<![A-Za-z/])(" + "|".join(OPEN_LABELS) + r")(?![A-Za-z/])", text):
        start = max(0, m.start() - 25)
        before = text[start:m.start()]
        if re.search(r"(no|never|without|forbidden|not|non-)\s+\S*$", before, re.I):
            continue
        labels.append(m.group(1))
    if labels and not refs:
        code = fail(f"{p.name}: open-link labels without any reference: {','.join(sorted(set(labels)))}") or 1
if edges == 0:
    code = fail("graph has zero resolved edges (Obsidian view would be empty)") or 1
print(f"check-links: done, edges = {edges}")
sys.exit(code)
