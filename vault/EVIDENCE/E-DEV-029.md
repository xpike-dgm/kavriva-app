---
test_id: E-DEV-029
contract_id_version: "ADR-015 Decision3; structural specification v1"
subject_file: modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md
subject_digest: c0e5edfcd8812ca48b1eb5b3da7dcb2ecd2f595b9f54ba521eaf283d16d41a64
result: "UNVERIFIED: independent task review and exact-head CI outstanding"
evidence_links:
  - "[[modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md]]"
  - "[[vault/PACKS/P-E10-003a.md]]"
  - "[[vault/REGISTRY/T-E10-003a.md]]"
  - "[[vault/EVIDENCE/E-DEV-028.md]]"
  - "[[modules/e10-graph/checks/ARCHITECTURE_TEST_SUITE.md]]"
  - "[[modules/e10-graph/checks/VALIDATION_COMMANDS.md]]"
gate_verdict: "BLOCKED (independent review and exact-head CI outstanding)"
reviewer: none
timestamp: 2026-10-02
purpose: Record bounded structural specification source and countercase verification
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: structural-detector-specification
tasks: [T-E10-003a]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_edges.py, modules/e10-graph/checks/check_orphans.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-STRUCT-001]
used_by: [V-E10-STRUCT-001, P-E10-003a, T-E10-003a]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-029 — four structural detector specifications

Author comparison: canonical TASK_INDEX acceptance is Orphan/broken/cycle/forbidden specified. ADR015 Decisions2–4 and Phase7 architecture/dependency/module sources map to four operational specifications: inventory/meaningful anchors; typed/qualified target resolution and proof binding; separate task/runtime DAGs with witnesses; observed uses versus allowed public/classification/authority boundaries. Each has pass/fail/gap countercases. Existing suite old orphan conjunctive shorthand is explicitly qualified against binding ADR topology. T003b governance families and identity admission retain separate scope.

Actual implementation limitations are listed from inspected check_orphans/check_links/check_edges/check_registration/check_conformance code. No complete semantic detector run, product/release activation, all-source audit or simulation claimed. Existing check success will prove only artifact admission/regression preservation. Exact T002 approved convention blob is preserved before documentary consumer updates; EDEV028 retains original digest/head/verdict, new task trace records custody only. Frozen126-origin corpus untouched.

Actual local commands/results, exact-head CI and independent reviewer/model/context/head/findings/re-review will be recorded after validation. REVIEW remains nonpassing until actual independent acceptance.

Initial local run: 11 checks/20 tests passed, check_links failed because the existing CI planning-reference allowlist excludes DEPENDENCY_RULES.md. Corrected the source address to its fully qualified canonical GitHub link; no allowlist/check-code change or assertion that URL verification is automated. Canonical source content is compared manually from pinned origin/main; external-link semantic coverage remains explicit.

Actual local validation2026-10-02: run_all.py exit0, all12checks plus20preservation/identity/freshness regression tests; 139Markdown records registered, 963document links, 10manifests with12runtime/8provision edges. Existing frozen P-PROOF-001 own-task freshness remains explicit WARN. build_index.py rebuilt25rows; routing_run.py retained T003a REVIEW and E3R1 REVIEW/E5 IN_PROGRESS; git diff --check clean. Prior EDEV028 snapshot equals the base Git blob byte-for-byte and retains normalized fbdce4e967de3d6ee10f9651b11c8351de45e9829fa3deaa180b34e16a9915b5. Planning comparison pin fa914f013fdcd032faed876689092da245989459, application base f81ddfd736a3dde9747b32f1794530cf3277967d. No semantic-all-source or production test inferred.
