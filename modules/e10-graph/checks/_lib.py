"""Shared helpers for e10 architecture checks (stdlib only, no third-party deps).

Conventions: exit 0 = pass (warnings allowed), exit 1 = FAIL, exit 2 = REJECT.
APP_ROOT = repo root (three levels above this file). --plan-root enables strict
cross-repo reference resolution; without it, planning-truth refs are EXTERNAL-OK
iff they match the known-prefix allowlist (00_/05_/06_/07_/08_/DEC-/ADR-/TSQ-,
motobakim-plan, Kavriva-plan).
"""
import argparse
import pathlib
import re
import sys

APP_ROOT = pathlib.Path(__file__).resolve().parents[3]
PLAN_ALLOW = ("00_", "05_", "06_", "07_", "08_", "DEC-", "ADR-", "TSQ-",
              "motobakim-plan", "Kavriva-plan")

# Closed set of planning-truth addresses trusted in CI mode (no planning checkout:
# the planning repo is private). Every entry is verified by strict --plan-root runs
# before push; any ref outside this set must resolve inside the app repo. Additions
# here require the same review as a code change.
KNOWN_PLANNING = frozenset({
    "06_DELIVERY_PLANNING/EPIC_CATALOG.md",
    "06_DELIVERY_PLANNING/TASK_INDEX.md",
    "07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md",
    "07_AI_ARCHITECTURE/CHANGE_CONTROL.md",
    "07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md",
    "07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md",
    "07_AI_ARCHITECTURE/CONTEXT_ROUTING.md",
    "07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_CATALOG.md",
    "07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md",
    "07_AI_ARCHITECTURE/DESIGN_CONSISTENCY_AND_CHANGE.md",
    "07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md",
    "07_AI_ARCHITECTURE/MIGRATION_POLICY.md",
    "07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md",
    "07_AI_ARCHITECTURE/ROLLBACK_STRATEGY.md",
    "07_AI_ARCHITECTURE/RULES/README.md",
    "07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md",
    "07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md",
    "08_REPOSITORY_BOOTSTRAP/CI_DRAFT/CI_PLAN.md",
    "08_REPOSITORY_BOOTSTRAP/PROOF_DRAFT/PROOF_PACK.md",
    "08_REPOSITORY_BOOTSTRAP/REGISTRY_DRAFT/ROUTING_AND_TRACEABILITY.md",
    "08_REPOSITORY_BOOTSTRAP/REGISTRY_DRAFT/TASK_REGISTRY.md",
    "08_REPOSITORY_BOOTSTRAP/VALIDATION_DRAFT/ARCHITECTURE_TEST_SUITE.md",
    "08_REPOSITORY_BOOTSTRAP/VALIDATION_DRAFT/VALIDATION_COMMANDS.md",
})


FROZEN = ("vault/PACKS/P-PROOF-001.md",)


FROZEN_BARE = frozenset({
    "PACK_STANDARD.md",
    "ROUTING_AND_TRACEABILITY.md",
    "TASK_REGISTRY.md",
})



SKIP_DIRS = (".git", "__pycache__")


def repo_files(suffix=".md"):
    out = []
    for p in APP_ROOT.rglob(f"*{suffix}"):
        if not any(s in p.parts for s in SKIP_DIRS):
            out.append(p)
    return sorted(out)


def read(p):
    return pathlib.Path(p).read_text(encoding="utf-8")


def fence_yaml(text):
    m = re.search(r"```yaml\n(.*?)\n```", text, re.S)
    return m.group(1) if m else ""


def frontmatter_yaml(text):
    m = re.search(r"^---\n(.*?)\n---\s*$", text, re.S | re.M)
    return m.group(1) if m else ""


def meta_yaml(text):
    """Record metadata: YAML frontmatter (Obsidian-native, preferred) else legacy ```yaml fence."""
    return frontmatter_yaml(text) or fence_yaml(text)


def parse_simple(block):
    """Minimal mapping parse: top-level `key: value`, `[a, b]` lists, `  - item` lists."""
    data, cur = {}, None
    for raw in block.splitlines():
        if re.match(r"\s+-\s+", raw):
            item = re.sub(r"^\s+-\s+", "", raw)
            if cur:
                data[cur].append(item)
            continue
        m = re.match(r"^([A-Za-z0-9_]+):\s*(.*)$", raw)
        if not m:
            cur = None
            continue
        k, v = m.group(1), m.group(2).strip()
        if v.startswith("[") and v.endswith("]"):
            data[k] = [x.strip() for x in v[1:-1].split(",") if x.strip()]
            cur = None
        elif v == "":
            data[k] = []
            cur = k
        else:
            data[k] = v
            cur = None
    return data


def fail(msg):
    print(f"FAIL: {msg}")
    return 1


def reject(msg):
    print(f"REJECT: {msg}")
    return 2


def warn(msg):
    print(f"WARN: {msg}")
    return 0
