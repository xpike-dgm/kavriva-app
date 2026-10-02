---
record_id: V-E10-LIFE-001
version: 1
purpose: Define source-bound manual registry lifecycle and scope-blocking receipts
domain: project-execution
module: e10-graph
owner: E10
depends_on: [D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-008, T-E10-008, E-DEV-035, P-E10-009, E-DEV-036, P-E10-010, E-DEV-037, V-E10-SIM-001, P-E10-011a, E-DEV-038, V-E10-SIM-002, P-E10-011b, E-DEV-039]
implements: [ADR-015, C10.3, F10.3.1, R-006, R-007, R-009, R-010]
public_contracts: []
internal_scope: manual-registry-lifecycle
tasks: [T-E10-008, T-E10-009, T-E10-010, T-E10-011a, T-E10-011b]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
evidence: [E-DEV-035]
supersedes: []
superseded_by: []
status: ACTIVE
last_verified: 2026-10-02
---

# Task registry states and transitions v1

Record: `V-E10-LIFE-001`

Pinned planningfa914f013fdcd032faed876689092da245989459/appbase4c4a2c49c090601dda7d892295f275b061205ec3; canonical T008 acceptance READY->...->DONE/BLOCKED plus out-of-scope->BLOCKED after T007DONE. Sources are source-defined manual R006, not newly automated lifecycle authority.

Binding: TASK_EXECUTION_PROTOCOL, PACK_STANDARD, metadata registry section, ADR015Decision5/addendum4, R006manual/R007/R009/R010. Logical decisions are source-defined; existing physical records and generated views are execution truth. Canonical frozen planning rows remain PROPOSED with exact physical supersedes mapping. This document supplies manual lifecycle governance; existing builder/router are not a transition-verification engine or execution permission.

## States and actual entry/exit receipts

| State | Entry/continued-work condition | Required recorded exit condition |
|---|---|---|
| READY | Actual mapped physical task, current sufficient versioned pack, all real dependencies accepted DONE for the needed scope, no unresolved blocker | Explicit implementer claim recorded with claimed_by/claimed_at before work |
| CLAIMED | Same task and pack, identified implementer/claim receipt; no duplicate concurrent claim or silently changed scope | Start bounded work with preconditions still valid and claim intact |
| IN_PROGRESS | Claimed bounded work and actual expected artifact/negative-case checks; no outside-pack actuation | Submit one complete task PR at REVIEW with exact source head, checks/proof and unresolved limits; out-of-pack/unresolved blocker branches before dependent work |
| REVIEW | Exact candidate task/pack/source head, actual proof/checks, independent separated reviewer context/model/scope; current findings recorded | DONE only after scoped actual independent PASS, corrected-head re-review of every fix, applicable exact-head green CI, accepted owner authority and truthful evidence/registry/view receipts |
| DONE | Acceptance actually proved within named task scope with review/check/owner receipts; original historical proof immutable | Governs only that acceptance. Later consumer metadata is a separately reviewed change; broader product/release closure remains separate |
| BLOCKED | Scope breach/required missing or conflicting source/unmet dependency/external condition: reason, affected outcome/path, actual stopped work and owner options recorded | Resolve blocker/re-scope under actual authority and current pack, record the explicit approved re-entry decision; no invented automatic exit/READY/DONE edge |
| CHANGES_REQUESTED | Actual independent actionable findings with exact head/scope, disputed evidence preserved | Narrow remediation, corrected exact head, different-context independent re-review, REVIEW; fixes are not self-acceptance |
| CANCELLED | Actual owner cancellation or governed supersession of task scope, reason/history retained | Preserve/archive records and re-plan dependents as canonical protocol requires; no silent resurrection/deletion/retroactive DONE |

Normal chain is exactly READY -> CLAIMED -> IN_PROGRESS -> REVIEW -> DONE. BLOCKED/CANCELLED branches and CHANGES_REQUESTED loop are source-defined. VALIDATING is a REVIEW activity, not a ninth state. Owner standing authority avoids repetitive permission requests for already authorized work; it does not fabricate source validity, review, CI, specialist/human account authority or task/product acceptance. Unspecified automatic transitions remain UNVERIFIED/BLOCKED until controlled source/re-scope decisions; do not invent machine privileges.

## Scope and evidence gate

The current pack explicitly lists files/modules and verbs. If an action requires a path/source/seam/authority outside that pack, stop dependent work, record BLOCKED/change-request and capture actual impact/options via OWNER_STATUS_AND_ESCALATION. A bounded correction may update the concrete pack before implementation under already-authorized owner mandate; preserve the initial scope/finding/re-scope/re-review. Whole-project permission is not hidden task-context expansion. No new runtime/operator automation here.

Review's source PASS and exact source-head CI precede scoped closure receipts/status updates. Status/evidence/index-only changes get a narrow final independent audit and exact-new-head CI before normal main-gates merge. A finding survives into every affected version until corrected and re-reviewed; prior review does not accept later source semantics. One task PR under DEC0068; actual owner-accepted independent delegated reviewer under DEC0069. No author self-PASS, CI substitution or admin gate bypass.

## Physical record and generated-view boundary

Keep stable task_id and exact planning-row supersedes pointer, flow_feature/objective/dependency/acceptance/context_pack/evidence/status and meaningful graph16keys. Claim/review/finding/sourcehead/re-scope/acceptance/merge receipts are chronological and actor-bound; never rename an ID to lose history. Registry.json/routing.json reproduce current authoritative records; never edit them to force eligibility. Actual builder parses rows; router filters READY+allDONE/excludedstates and uses dependency-count/ID ordering, not proven DAG-depth/scheduling/semantic product closure. Owner-approved TASK_INDEX sequence selects current eligible work; no unrelated router algorithm change claimed by this lifecycle task.

Bootstrap documentary T-E3-001 DONE is not product authorization completion; actual T-E3-001-R1 REVIEW and T-E5-003 IN_PROGRESS/production activation/release holds remain. A dependency receipt must match the required product/feature slice, not borrow a registration/metadata/archive acceptance. All-DONE cannot bypass ten closure layers.

## Negative-case source walkthroughs (specified/manual, no fabricated executed test)

READY -> DONE; reviewer none or implementer self-PASS; passing heuristics without scoped product proof; unsupported dependency borrowed from bootstrapDONE; out-of-pack work continued under generic permission; added VALIDATING state; missing blocker reason/re-entry source; CANCELLED task erased/restored without dependent replan; duplicate concurrent claim; stale context/sourcehead accepted by old review; generated index forced eligible; later consumer source rehash represented as original acceptance; every taskDONE represented as productready. Each is nonpassing under the specific state/source/receipt rule above. Record concrete manual walkthrough inputs/result under EDEV035 and independent review; no general automated semantic/lifecycle checker claim from current12checks.


## Actual sources, admission and scoped impact

Source pointers: `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`, `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md`, `planning 07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md`, `planning 07_AI_ARCHITECTURE/RULES/README.md`, `planning 07_AI_ARCHITECTURE/CONTEXT_ROUTING.md`, [owner options format](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/OWNER_STATUS_AND_ESCALATION.md). Actual sources: `templates/PACK_TEMPLATE.md`, `vault/CONTRACTS/task-pack.md`, `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`, `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`, `modules/e10-graph/MANIFEST.md`, `modules/e10-graph/REPOSITORY_TOPOLOGY.md`, `vault/INVENTORIES/E10-GOVERNED-PATHS.md`, `vault/REGISTRY/T-E10-007.md`, `vault/EVIDENCE/E-DEV-034.md`, `modules/e10-graph/checks/build_index.py`, `modules/e10-graph/checks/routing_run.py`, `modules/e10-graph/checks/check_trace.py`. Actual code source reads are observations, not changes or private cross-capsule use.

Four new governed records plus3acceptedsubjectpayloads admitted in existing folders through inventoryv3; actual sources gain consumer/task traces only, generated views reproduced. Original immutable401base/79folder/rawcatalog and frozen126history/oldsubjectverdicts retain their respective scopes. No newstate/mechanism/provider/schema/runtime/test/check/workflow/owner/seam/actuation or source movement. Rollback must retain state/finding/source/custody history and dependent implications; no silent cancellation or authority resurrection. Empty public/lineage lists reflect no new runtime contract or identity replacement.

Task: `vault/REGISTRY/T-E10-008.md`; pack: `vault/PACKS/P-E10-008.md`; proof: `vault/EVIDENCE/E-DEV-035.md`. E3R1 REVIEW/E5 IN_PROGRESS/production-release-activation holds remain. Completion here is manual state/transition/scope-blocking governance and actual bounded receipt verification, not complete automated lifecycle or product enforcement.
