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


def repo_files(suffix=".md"):
    out = []
    for skip in (".git",):
        for p in APP_ROOT.rglob(f"*{suffix}"):
            if skip not in p.parts:
                out.append(p)
    return sorted(out)


def read(p):
    return pathlib.Path(p).read_text(encoding="utf-8")


def fence_yaml(text):
    m = re.search(r"```yaml\n(.*?)\n```", text, re.S)
    return m.group(1) if m else ""


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
