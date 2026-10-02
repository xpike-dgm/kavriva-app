---
test_id: E-DEV-033
contract_id_version: "ADR-015 Decision2; repository topology v1"
subject_file: modules/e10-graph/REPOSITORY_TOPOLOGY.md
subject_digest: a18df31192b1342d074a1424790e7650273aa2f10abd09c01aeabc4ca9a72eaf
result: "BLOCKED: independent task-end assessment outstanding"
evidence_links:
  - "[[modules/e10-graph/REPOSITORY_TOPOLOGY.md]]"
  - "[[vault/INVENTORIES/E10-GOVERNED-PATHS.md]]"
  - "[[vault/PACKS/P-E10-006.md]]"
  - "[[vault/REGISTRY/T-E10-006.md]]"
gate_verdict: "BLOCKED (review/CI receipts outstanding; production unproved)"
reviewer: none
timestamp: 2026-10-02
purpose: Establish governed repository addresses and capsule linkage coverage
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.2, F10.2.1]
public_contracts: []
internal_scope: repository-topology-and-record-custody
tasks: [T-E10-006]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_orphans.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-TOPO-001, I-E10-PATHS-001]
used_by: [V-E10-TOPO-001, I-E10-PATHS-001, P-E10-006, T-E10-006]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-033 â€” repository topology and governed addresses

Pinned planfa914f013fdcd032faed876689092da245989459/appbasef382812b32497f145076072b928202d031c82e56. Canonical T006 acceptance is linkage/addresses/no-orphan rule/manifest coverage after T004. Source comparison retains one plan/one app/one vault/one capsule per epic, small-file manifesto anchors, exact existing E3 internal platform scope/E5 authority subject, frozen planning-vs-physical task distinction and seven actual capsule anatomy headings.

Actual raw Git tree/blob inventory:401files,79impliedfolders,10capsules; sorted path TAB raw blob SHA256 LF catalog2b0b00d09742b54e71a40253c24901ae126b6bd0761e79d78246d49e6baeeee6. Each base address has a resolved declared record/module/custody anchor; reserved paths remain reservations, address coverage does not confer product permission or semantic acceptance. Current five-record delta/metadata/index changes separately declared, no folders/source moves/runtime/db/production operations. Existing Markdown orphan heuristics are not all-file semantic proof. All historical proof subjects and frozen126origin bytes/catalog unchanged.

Initial inventory authoring attempts rejected missing typed inventory/contract identity keys and unmapped reserved/archive/registry addresses; corrected address inventory generator rather than relaxing any committed gate. All enumeration must be independently recomputed. Source reviewer none; review/CI outstanding, no author self-PASS.


Actual local validation2026-10-02: run_all exit0, all12checks/20unittest regressions;155Markdown records/128indexedIDs/1973resolveddocument links/36evidence/31packs. All10manifests/12runtime+8provision declared edges checked;29row index/routing rebuilt. git diff --check clean; four new non-task IDs have zero pinned canonical collisions, exact task row supersession. Frozen P-PROOF-001 freshness WARN retains historical scope. Inventory normalized subject digest c5e6a407f80bddd76e18d61a807309ab6fffc547ea29d2e330d8f92b23142b7f; raw base catalog distinction retained. Actual source consumer/task traces retained, old accepted template/relationship/structural proof subjects still archived unchanged. Independent final review and exact-head CI still required.


Independent first-round verdict at8f35a75e1acfbeab8460126c9d709038451a704a: /root/pr35_independent_review, gpt-6-luna max/separate bounded context, CHANGES_REQUESTED: domain-authorities.json was wrongly grouped as generated/tooling and omitted in REGISTRY address map. Reviewer independently recomputed all401files/79folders/catalog/anchors/tencapsule anatomy, no other actionable issues. Narrow remediation binds existing D-APP-DOC-017 profile, preserves E3/E5/E6 logical owners/all physical_activation HELD, states not generated/task-record/runtime permission in both placements, and adds real source consumer/task traces. No JSON/runtime/product semantics changed. Corrected inventory normalized digest 32d1fb3ffa3fd7b79a67dade87e1b52c3fb03f96fe8269352e2fb0f87a38589a; immutable base file/hash/catalog unchanged. Exact new-head independent re-review required; no source acceptance yet.
