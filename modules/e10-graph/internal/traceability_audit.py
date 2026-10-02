"""Read-only declared-document audit; not a product or automatic release gate.

Compound/range need labels stay verbatim. Catalog address coverage is not semantic
source verification. Product closure still requires manual R014 evidence review.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

LAYERS = ("task", "feature", "flow", "requirement", "design", "architecture",
          "data/migration", "release", "product-scenario", "gap-audit")
TASK = r"T-E\d+-\d+[a-z]*"
FEATURE = r"F\d+\.\d+\.\d+"
FLOW = r"FL\d+\.\d+\.\d+"
SOURCES = ("TASK_INDEX", "ACCEPTANCE_MATRIX", "FEATURE_CATALOG",
           "USER_FLOW_CATALOG", "CAPABILITY_CATALOG", "EPIC_CATALOG")


def refs(pattern, text):
    return set(re.findall(r"\b(?:" + pattern + r")\b", text))


def table_rows(text):
    for line, raw in enumerate(text.splitlines(), 1):
        if raw.startswith("|"):
            yield line, [c.strip() for c in raw.split("|")[1:-1]]


def catalog(text, pattern):
    result = {}
    for line, cells in table_rows(text):
        if cells and re.fullmatch(pattern, cells[0]):
            if cells[0] in result:
                raise ValueError("CONFLICT duplicate source identity " + cells[0])
            result[cells[0]] = {"cells": cells, "line": line}
    return result


def model_from_sources(sources):
    return {
        "tasks": catalog(sources["TASK_INDEX"], TASK),
        "features": catalog(sources["FEATURE_CATALOG"], FEATURE),
        "flows": catalog(sources["USER_FLOW_CATALOG"], FLOW),
        "capabilities": catalog(sources["CAPABILITY_CATALOG"], r"C\d+\.\d+"),
        "epics": catalog(sources["EPIC_CATALOG"], r"E\d+"),
        "needs": [{"line": line, "label": c[0], "features": refs(FEATURE, c[1]),
                   "flows": refs(FLOW, c[2]), "tasks": refs(TASK, c[3]),
                   "validation_assignment": c[4], "source_cells": list(c)}
                  for line, c in table_rows(sources["ACCEPTANCE_MATRIX"])
                  if len(c) == 5 and c[0] != "Requirement / Rule"
                  and any(c) and not all(re.fullmatch(r"[-: ]+", cell) for cell in c)],
    }


def audit_declared(model):
    """Find address/declared-chain gaps only; never a full requirement PASS."""
    findings = []
    tasks = model["tasks"]
    covered = set()

    def gap(label, subject, reason):
        findings.append({"label": label, "subject": subject, "reason": reason})

    for need in model["needs"]:
        addr = "ACCEPTANCE_MATRIX.md:" + str(need["line"])
        covered.update(need["tasks"])
        for tid in sorted(need["tasks"] - tasks.keys()):
            gap("MISSING", tid, addr + " forward need-to-task reference missing")
        if not need["tasks"] & tasks.keys():
            held = not need["tasks"] and need["validation_assignment"].startswith("HELD")
            gap("BLOCKED" if held else "MISSING", addr,
                ("canonical source NONE/" + need["validation_assignment"] +
                 " remains visible: " + need["label"] + "; no task/acceptance inferred")
                if held else "approved-need row has no remaining declared task")
        for kind in ("features", "flows"):
            for identity in sorted(need[kind] - model[kind].keys()):
                gap("MISSING", identity, addr + " declared " + kind + " source absent")
    for tid, row in sorted(tasks.items()):
        if tid not in covered:
            gap("MISSING", tid, "reverse task-to-approved-need row missing (orphan work)")
        c = row["cells"]
        if len(c) != 7:
            gap("CONFLICT", tid, "ambiguous task row; expected seven canonical columns")
            continue
        fs, fls = refs(FEATURE, c[1]), refs(FLOW, c[1])
        if not fs or not fls:
            gap("MISSING", tid, "declared feature/flow link absent")
        for dep in sorted(refs(TASK, c[3]) - tasks.keys()):
            gap("MISSING", tid, "declared prerequisite " + dep + " absent")
        for fl in sorted(fls):
            if fl not in model["flows"]:
                gap("MISSING", tid, "flow " + fl + " absent")
            elif model["flows"][fl]["cells"][1] not in fs:
                gap("CONFLICT", tid, "flow " + fl + " names another feature")
        for f in sorted(fs):
            if f not in model["features"]:
                gap("MISSING", tid, "feature " + f + " absent")
                continue
            cap = model["features"][f]["cells"][1]
            if cap not in model["capabilities"]:
                gap("MISSING", tid, "feature capability " + cap + " absent")
                continue
            epic = model["capabilities"][cap]["cells"][1]
            if epic not in model["epics"]:
                gap("MISSING", tid, "capability epic " + epic + " absent")
    return findings


def assess_closure_shape(layers):
    """Validate declared ten-layer receipts; a complete shape is not real proof."""
    findings = []
    for layer in LAYERS:
        row = layers.get(layer)
        if row is None:
            findings.append({"label": "MISSING", "subject": layer,
                             "reason": "required closure layer absent"})
            continue
        for field, label in (("owner", "UNOWNED"), ("evidence", "MISSING")):
            if not row.get(field) or row[field] in {"UNOWNED", "MISSING"}:
                findings.append({"label": label, "subject": layer,
                                 "reason": "actual " + field + " unresolved"})
        verdict = row.get("verdict", "UNVERIFIED")
        if verdict != "PASS":
            findings.append({"label": verdict if verdict in
                             {"MISSING", "UNOWNED", "BLOCKED", "CONFLICT"}
                             else "UNVERIFIED", "subject": layer,
                             "reason": "actual layer acceptance is nonpassing"})
    return {"findings": findings, "declared_shape_complete": not findings,
            "semantic_acceptance": "UNVERIFIED: manual subject/current-context review required"}


def effective_product_state(tid, physical):
    if tid == "T-E3-001" and physical.get(tid, {}).get("status") == "DONE":
        return physical.get("T-E3-001-R1", {}).get("status", "UNVERIFIED")
    return physical.get(tid, {}).get("status", "MISSING")


def re_evaluate_task_and_layer_states(task_states, layers):
    """All-DONE is a task-state assumption, not a substitute for layer evidence."""
    assessment = assess_closure_shape(layers)
    findings = list(assessment["findings"])
    if not task_states:
        findings.append({"label": "MISSING", "subject": "task",
                         "reason": "no scoped task-state observation"})
    for tid, status in sorted(task_states.items()):
        if status != "DONE":
            findings.append({"label": "BLOCKED", "subject": tid,
                             "reason": "task state " + status + " is nonpassing"})
    return dict(assessment, findings=findings, declared_shape_complete=not findings,
                assumed_done_count=sum(s == "DONE" for s in task_states.values()))


def git_bytes(root, ref, path):
    return subprocess.check_output(["git", "show", ref + ":" + path], cwd=root)


def scalar(text, key):
    parts = text.split("---", 2)
    if len(parts) < 3 or not text.startswith("---"):
        return ""
    m = re.search(r"^" + re.escape(key) + r":\s*(.*)$", parts[1], re.M)
    return m[1].strip().strip('"') if m else ""


def subject_digest_matches(raw, declaration):
    """Existing conformance accepts case-insensitive 64hex plus custody annotation."""
    match = re.match(r"^[a-fA-F0-9]{64}\b", declaration)
    return bool(match and hashlib.sha256(raw.replace(b"\r\n", b"\n")).hexdigest()
                == match[0].lower())


def observe(plan_root, plan_ref, app_root, app_ref):
    if not all(re.fullmatch(r"[a-f0-9]{40}", ref) for ref in (plan_ref, app_ref)):
        raise ValueError("Immutable full commit SHA required for both inputs")
    sources, hashes = {}, {}
    for name in SOURCES:
        path = "06_DELIVERY_PLANNING/" + name + ".md"
        raw = git_bytes(plan_root, plan_ref, path)
        hashes[path] = hashlib.sha256(raw).hexdigest()
        sources[name] = raw.decode("utf-8")
    model = model_from_sources(sources)
    all_paths = set(subprocess.check_output(["git", "ls-tree", "-r", "--name-only", app_ref],
                                           cwd=app_root).decode().splitlines())
    paths = sorted(p for p in all_paths if p.startswith("vault/REGISTRY/"))
    physical = {}
    for path in paths:
        if not path.endswith(".md"):
            continue
        raw = git_bytes(app_root, app_ref, path)
        text = raw.decode("utf-8")
        tid = scalar(text, "task_id")
        if tid:
            if tid in physical:
                raise ValueError("CONFLICT duplicate physical task " + tid)
            physical[tid] = {"path": path, "status": scalar(text, "status"),
                             "owner": scalar(text, "owner"),
                             "module": scalar(text, "module"),
                             "evidence": scalar(text, "evidence"),
                             "digest": hashlib.sha256(raw).hexdigest()}
            record = physical[tid]
            manifest = "modules/" + record["module"] + "/MANIFEST.md"
            record["owner_manifest_resolves"] = (manifest in all_paths and
                scalar(git_bytes(app_root, app_ref, manifest).decode("utf-8"), "owner") == record["owner"])
            match = re.search(r"\bE-[A-Z]+-\d+\b", record["evidence"])
            ep = "vault/EVIDENCE/" + match[0] + ".md" if match else ""
            record["evidence_file_resolves"] = ep in all_paths
            if ep in all_paths:
                evraw = git_bytes(app_root, app_ref, ep)
                ev = evraw.decode("utf-8")
                subject = scalar(ev, "subject_file")
                expected = scalar(ev, "subject_digest")
                matches = None
                if subject in all_paths:
                    matches = subject_digest_matches(git_bytes(app_root, app_ref, subject), expected)
                record["evidence_observation"] = {"path": ep,
                    "raw_digest": hashlib.sha256(evraw).hexdigest(), "subject": subject,
                    "subject_digest": expected, "subject_digest_matches": matches,
                    "verdict": scalar(ev, "gate_verdict"), "reviewer": scalar(ev, "reviewer"),
                    "scope": "serialized historical receipt only; product semantic acceptance unverified"}
    findings = audit_declared(model)
    missing = sorted(model["tasks"].keys() - physical.keys())
    drills = {}
    for removed in ("T-E10-010", "T-E10-006"):
        mutated = dict(model, tasks={k: v for k, v in model["tasks"].items() if k != removed})
        drills["remove " + removed] = audit_declared(mutated)
    # Actual executed in-memory all-DONE drill never changes physical source truth.
    all_done = {tid: "DONE" for tid in model["tasks"]}
    layers = {layer: {"owner": "UNOWNED", "evidence": "MISSING", "verdict": "UNVERIFIED"}
              for layer in LAYERS}
    assessment = re_evaluate_task_and_layer_states(all_done, layers)
    drills["all-DONE"] = {"assumed_done_count": assessment["assumed_done_count"],
                          "closure_assessment": assessment}
    return {"plan_ref": plan_ref, "app_ref": app_ref, "source_digests": hashes,
            "catalog_counts": {k: len(v) for k, v in model.items()},
            "declared_findings": findings, "missing_physical_records": missing,
            "physical": physical, "tasks": model["tasks"], "needs": [
                dict(n, features=sorted(n["features"]), flows=sorted(n["flows"]),
                     tasks=sorted(n["tasks"])) for n in model["needs"]],
            "drills": drills,
            "product_verdict": "UNVERIFIED: declared coverage is not product completion"}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    for arg in ("plan-root", "plan-ref", "app-root", "app-ref"):
        parser.add_argument("--" + arg, required=True)
    args = parser.parse_args()
    sys.stdout.reconfigure(encoding="utf-8")
    print(json.dumps(observe(args.plan_root, args.plan_ref, args.app_root, args.app_ref),
                     ensure_ascii=False, indent=2))
