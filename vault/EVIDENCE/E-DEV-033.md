---
test_id: E-DEV-033
contract_id_version: "ADR-015 Decision2; repository topology v1"
subject_file: vault/EVIDENCE/SNAPSHOTS/E-DEV-033-REPOSITORY_TOPOLOGY.md.snapshot
subject_digest: 313fc532fedd478248e69d6dfbbe45c6abd2ae835a8915158471c3467953be6c
result: "PASS: independent task-end review accepted bounded repository topology and path coverage"
evidence_links:
  - "[[modules/e10-graph/REPOSITORY_TOPOLOGY.md]]"
  - "[[vault/INVENTORIES/E10-GOVERNED-PATHS.md]]"
  - "[[vault/PACKS/P-E10-006.md]]"
  - "[[vault/REGISTRY/T-E10-006.md]]"
gate_verdict: "PASS (linkage/addresses/no-orphan admission/manifest coverage only; semantic product/production unproved)"
reviewer: "independent gpt-6-luna max; /root/pr35_independent_review"
timestamp: 2026-10-02
purpose: Establish governed repository addresses and capsule linkage coverage
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.2, F10.2.1]
public_contracts: []
internal_scope: repository-topology-and-record-custody
tasks: [T-E10-006, T-E10-007]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_orphans.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-TOPO-001, I-E10-PATHS-001]
used_by: [V-E10-TOPO-001, I-E10-PATHS-001, P-E10-006, T-E10-006, P-E10-007, E-DEV-034]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-033 - repository topology and governed addresses

Pinned planfa914f013fdcd032faed876689092da245989459/appbasef382812b32497f145076072b928202d031c82e56. Canonical T006 acceptance is linkage/addresses/no-orphan rule/manifest coverage after T004. Source comparison retains one plan/one app/one vault/one capsule per epic, small-file manifesto anchors, exact existing E3 internal platform scope/E5 authority subject, frozen planning-vs-physical task distinction and seven actual capsule anatomy headings.

Actual raw Git tree/blob inventory:401files,79impliedfolders,10capsules; sorted path TAB raw blob SHA256 LF catalog2b0b00d09742b54e71a40253c24901ae126b6bd0761e79d78246d49e6baeeee6. Each base address has a resolved declared record/module/custody anchor; reserved paths remain reservations, address coverage does not confer product permission or semantic acceptance. Current five-record delta/metadata/index changes separately declared, no folders/source moves/runtime/db/production operations. Existing Markdown orphan heuristics are not all-file semantic proof. All historical proof subjects and frozen126origin bytes/catalog unchanged.

Initial inventory authoring attempts rejected missing typed inventory/contract identity keys and unmapped reserved/archive/registry addresses; corrected address inventory generator rather than relaxing any committed gate. All enumeration must be independently recomputed. Source reviewer none; review/CI outstanding, no author self-PASS.


Actual local validation2026-10-02: run_all exit0, all12checks/20unittest regressions;155Markdown records/128indexedIDs/1973resolveddocument links/36evidence/31packs. All10manifests/12runtime+8provision declared edges checked;29row index/routing rebuilt. git diff --check clean; four new non-task IDs have zero pinned canonical collisions, exact task row supersession. Frozen P-PROOF-001 freshness WARN retains historical scope. Inventory normalized subject digest c5e6a407f80bddd76e18d61a807309ab6fffc547ea29d2e330d8f92b23142b7f; raw base catalog distinction retained. Actual source consumer/task traces retained, old accepted template/relationship/structural proof subjects still archived unchanged. Independent final review and exact-head CI still required.


Independent first-round verdict at8f35a75e1acfbeab8460126c9d709038451a704a: /root/pr35_independent_review, gpt-6-luna max/separate bounded context, CHANGES_REQUESTED: domain-authorities.json was wrongly grouped as generated/tooling and omitted in REGISTRY address map. Reviewer independently recomputed all401files/79folders/catalog/anchors/tencapsule anatomy, no other actionable issues. Narrow remediation binds existing D-APP-DOC-017 profile, preserves E3/E5/E6 logical owners/all physical_activation HELD, states not generated/task-record/runtime permission in both placements, and adds real source consumer/task traces. No JSON/runtime/product semantics changed. Corrected inventory normalized digest 32d1fb3ffa3fd7b79a67dade87e1b52c3fb03f96fe8269352e2fb0f87a38589a; immutable base file/hash/catalog unchanged. Exact new-head independent re-review required; no source acceptance yet.


Second narrow-review finding at3879a678c9f3b8acf48357ffbe2a37c82c26535a: reviewer confirmed logical-registry correction, found unintended mojibake in pack escalation arrow. Restored ASCII direction marker and initial proof-title punctuation using explicit UTF8 IO; no semantic/status/digest change. Exact corrected-head re-review required.


Actual independent acceptance2026-10-02: /root/pr35_independent_review, gpt-6-luna max/forknone/separate bounded context, PASS at 16a2e17ac78253ea10b363c9f0a07f8200ef4749 against basef382812b32497f145076072b928202d031c82e56. First finding at8f35a75 (logical-registry mapping/source) fixed and independently re-reviewed; second finding at3879a67 (encoding) fixed and independently re-reviewed at16a2e17. No remaining actionable findings. Reviewer recomputed all401file hashes/79folder rows/rawcatalog/anchors and10capsule anatomy/public/internal/tests; actual E3/E5 platform subjects and archived custody retained. Source topology digest a18df31192b1342d074a1424790e7650273aa2f10abd09c01aeabc4ca9a72eaf; accepted inventory32d1fb3ffa3fd7b79a67dade87e1b52c3fb03f96fe8269352e2fb0f87a38589a. Final status-only topology digest 313fc532fedd478248e69d6dfbbe45c6abd2ae835a8915158471c3467953be6c; final status-only inventory digest 2613a1b572af74cd3ce8ed0eb54d1033893936443040ed3644ae204394f7e939. Old proof/core/catalog history unchanged.

Exact source-head CI all8SUCCESS: pull_request architecture-checks 36949449721, pull_request e5-current-authority-tests 36949449635, pull_request e3-commit-authorization-tests 36949449671, pull_request e3-live-auth-tests 36949449642, push architecture-checks 36949446905, push e5-current-authority-tests 36949446882, push e3-commit-authorization-tests 36949446887, push e3-live-auth-tests 36949446891. Expected label-gated T3 skips for documentary E10 T2/no privileged runtime; actual independent review obtained. Direct standing owner mandate accepts actual bounded PASS/greenCI before normal merge. Task DONE/rule ACTIVE/inventory RECORDED/pack ACTIVE for this acceptance only. Final metadata/index/evidence audit and exact new-head CI required before merge; immutable final-head audit/CI goes in PR35 body without recursive proof commits. E3R1 REVIEW/E5 IN_PROGRESS/production activation/release holds remain.


T-E10-007 custody receipt: exact PR35accepted raw topology subject preserved at `vault/EVIDENCE/SNAPSHOTS/E-DEV-033-REPOSITORY_TOPOLOGY.md.snapshot`; exact inventory secondary subject preserved at `vault/EVIDENCE/SNAPSHOTS/E-DEV-033-E10-GOVERNED-PATHS.md.snapshot` before current consumer/admission version updates. Original digest/verdict/reviewer/sourcehead/date and 401/79rawcatalog unchanged. Current live sources are later documentary revisions, not this old acceptance subject; no production verification refreshed.
