"""check-edges (R-003): manifests declare allowed+forbidden; DAG enforced in-repo.

(1) Structural: declaration section present. (2) Denylist with same-clause
negation handling: service_role / signing custody (owning capsules exempt) +
OTA enablement phrases (hot-update, hot update, code-push, code push — forbidden
everywhere; OUT-3 B-32). ADR-014 never-list code patterns arrive with product code
(recorded deferral: no product code exists yet to match against; manual gates
T-E9-009/T-E6-017 hold until then). (3) Edge graph over explicit fragments inside the manifests:
`A <- B,C` means B->A, C->A; `A -> B` means A->B; `A consumes B` means B->A;
`consumed by B` (in module A's manifest) means A->B; `serves X, Y` (in module A's
manifest) means A->X, A->Y on the PROVISION plane; `R renders, S serves, A
authorizes` means A->R and S->R on the runtime plane. Provision edges model
client-server layering and never cycle with runtime edges; cycle detection runs
on the runtime plane only. Declared `no A<->B` pairs are absolute across planes
(critical: E1<->E9). (4) Every Allowed epic token must be E1..E10 and must
participate in either plane or be the module's own epic.
Binding-table conformance itself was review-gated at manifest approval.
"""
import re
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from _lib import APP_ROOT, read, fail

DENY = [("service_role", ("e03-server", "e05-identity")),
        ("signing custody", ("e06-release", "e07-build-lane")),
        ("hot-update", ()),
        ("hot update", ()),
        ("code-push", ()),
        ("code push", ())]
NEG = ("no ", "never", "without", "forbidden", "not ")
EPICS = {f"E{i}" for i in range(1, 11)}
mods = sorted(p for p in (APP_ROOT / "modules").iterdir() if p.is_dir())
code = 0
edges, prov, nopair = set(), set(), set()
allowed_of = {}


def epic_of(modname):
    m = re.match(r"e0*(\d+)-", modname)
    return f"E{m.group(1)}" if m else None


for m in mods:
    man = m / "MANIFEST.md"
    if not man.exists():
        continue
    me = epic_of(m.name)
    text = read(man)
    if "## Allowed / forbidden dependencies" not in text:
        code = fail(f"{m.name}: edge declaration section missing") or 1
    for line in text.splitlines():
        low = line.lower()
        for pat, allow in DENY:
            if pat in low and m.name not in allow:
                hit = False
                for cl in re.split(r"[;:.]", low):
                    if pat in cl and not any(n in cl.split(pat)[0][-40:] for n in NEG):
                        hit = True
                if hit:
                    code = fail(f"{m.name}: forbidden pattern outside owning capsule: {pat}") or 1
    toks = set()
    in_allowed = False
    for line in text.splitlines():
        if line.startswith("## "):
            in_allowed = "Allowed / forbidden" in line
            continue
        if in_allowed and re.match(r"\s*-\s*Allowed\b", line):
            if re.search(r"\bnone\b|\bnot claimed\b|\bmust be declared\b", line, flags=re.I):
                continue
            toks.update(t.upper() for t in re.findall(r"E\d+", line, flags=re.I) if t.upper() in EPICS)
    allowed_of[m.name] = toks
    for a, bs in re.findall(r"(E\d+)\s*(?:<-|←)\s*((?:E\d+\s*,?\s*)+)", text):
        for b in re.findall(r"E\d+", bs):
            edges.add((b.upper(), a.upper()))
    for a, b in re.findall(r"(E\d+)\s*(?:->|→)\s*(E\d+)", text):
        edges.add((a.upper(), b.upper()))
    for a, b in re.findall(r"(E\d+)\s+consumes\s+(E\d+)", text, flags=re.I):
        edges.add((b.upper(), a.upper()))
    for mobj in re.finditer(r"consumed by\s+(E\d+)", text, flags=re.I):
        before = text[max(0, mobj.start() - 60):mobj.start()]
        subj = re.findall(r"E\d+", before, flags=re.I)
        if subj:
            edges.add((subj[-1].upper(), mobj.group(1).upper()))
        elif me:
            edges.add((me, mobj.group(1).upper()))
    if re.search(r"\bserves\b", text, flags=re.I) and me:
        for b in re.findall(r"serves\s+((?:E\d+\s*,?\s*(?:and\s+)?)+)", text, flags=re.I):
            for t in re.findall(r"E\d+", b):
                prov.add((me, t.upper()))
    for r, s, a in re.findall(r"(E\d+)\s+renders,\s*(E\d+)\s+serves,\s*(E\d+)\s+authorizes", text, flags=re.I):
        edges.add((a.upper(), r.upper()))
        edges.add((s.upper(), r.upper()))
    for a, b in re.findall(r"no\s+(E\d+)\s*(?:<->|↔)\s*(E\d+)", text):
        nopair.add((a.upper(), b.upper()))


def has_cycle(graph):
    WHITE, GRAY, BLACK = 0, 1, 2
    color = {}

    def visit(n, stack):
        color[n] = GRAY
        for s, t in graph:
            if s != n:
                continue
            if color.get(t, WHITE) == GRAY:
                return True
            if color.get(t, WHITE) == WHITE and visit(t, stack):
                return True
        color[n] = BLACK
        return False

    nodes = {n for e in graph for n in e}
    return any(color.get(n, WHITE) == WHITE and visit(n, []) for n in nodes)


if has_cycle(edges):
    code = fail("dependency cycle detected in declared runtime edges") or 1
for a, b in nopair:
    if ((a, b) in edges or (a, b) in prov) and ((b, a) in edges or (b, a) in prov):
        code = fail(f"forbidden bidirectional seam used: {a}<->{b}") or 1
for mname, toks in allowed_of.items():
    me = epic_of(mname)
    for t in toks:
        if t == me:
            continue
        if (t, me) not in edges and (me, t) not in edges and (t, me) not in prov and (me, t) not in prov:
            code = fail(f"{mname}: allowed {t} participates in no declared edge") or 1
print(f"check-edges: {len(mods)} manifests, {len(edges)} runtime + {len(prov)} provision edges scanned")
sys.exit(code)
