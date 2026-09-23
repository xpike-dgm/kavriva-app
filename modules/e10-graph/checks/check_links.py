"""check-links (R-014): backticked/wikilink .md references resolve; open-link labels visible.

Rules (exact, no leniency layers):
- In-app refs (relative, APP-relative, kavriva-app/-prefixed, or bare with a UNIQUE
  in-app match) must resolve inside the repo, else FAIL.
- Planning refs use the `planning <full-path>` form: strict mode resolves against the
  plan tree; CI mode against the KNOWN_PLANNING full-path set. Anything else FAILs.
- Frozen proof copy vault/PACKS/P-PROOF-001.md is exempt from ref validation
  (byte-frozen at proof time with legacy ref forms, verified then; deleted-file attacks
  are caught independently by check-presence).
- A file carrying open-link labels with no reference at all FAILs (unsourced claim).
- Zero resolved edges FAILs.
"""
import argparse
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, repo_files, read, fail, KNOWN_PLANNING, FROZEN

OPEN_LABELS = ("MISSING", "UNOWNED", "BLOCKED", "CONFLICT", "UNVERIFIED",
               "PENDING", "HELD", "TBD")

ap = argparse.ArgumentParser()
ap.add_argument("--plan-root", default="")
args = ap.parse_args()
code = 0
edges = 0
wiki_edges = 0
for p in repo_files():
    rel = p.relative_to(APP_ROOT).as_posix()
    legacy = rel in FROZEN
    text = read(p)
    refs = [(m, False) for m in re.findall(r"`([^`]*\.md)`", text)]
    refs += [(m, True) for m in re.findall(r"\[\[([^\]]*\.md)\]\]", text)]
    check_refs = refs if rel not in FROZEN else []
    for ref, is_wiki in check_refs:
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
            ok = (APP_ROOT / ref[len("kavriva-app/"):]).exists()
        if not ok and "/" not in ref:
            pool = [x for x in APP_ROOT.rglob(ref) if ".git" not in x.parts]
            if len(pool) == 1:
                ok = True
        if not ok and ref.startswith("planning "):
            norm = ref[len("planning "):]
            if args.plan_root:
                import pathlib
                ok = (pathlib.Path(args.plan_root) / norm).exists()
            else:
                ok = norm in KNOWN_PLANNING
        if not ok:
            code = fail(f"{p.name}: dangling reference: {ref}") or 1
        else:
            edges += 1
            if is_wiki:
                wiki_edges += 1
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
print(f"check-links: done, edges = {edges} (wikilink = {wiki_edges}, backticked = {edges - wiki_edges})")
sys.exit(code)
