---
record_id: V-E10-PARALLEL-001
version: 1
purpose: Specify five independent parallel-output safeguards and source-bound synthesis
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.7, F10.7.1, R-006, R-007, R-008, R-009, R-010, R-013, R-014]
public_contracts: []
internal_scope: parallel-output-guards
tasks: [T-E10-016]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-REVIEW-001, V-E10-CLOSE-001, V-E10-LIFE-001, D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-016, T-E10-016, E-DEV-044]
evidence: [E-DEV-044]
supersedes: []
status: ACTIVE
---

# Parallel independent-output guards v1

Record V-E10-PARALLEL-001; planpin fa914f013fdcd032faed876689092da245989459; appbase 1380d47da9232cd952ce313fc0865b5922b9ebd2.

T-E10-016: Separate outputs, no overwrite, no consensus-PASS; ADR-015 Decision9/DEC0041 and canonical prerequisiteT015. These are manual source-bound guards for independent outputs and synthesis, not file-lock software, provider messages, an automatic voting system or a new numeric quorum.

## Five source guards

| Source guard | Required bounded record and behavior | Nonpassing example |
|---|---|---|
| Same frozen canonical brief/context | Each reviewer receives identical canonical task acceptance/source and candidate head/base versions, with role/output assignment explicitly identified. If context changes, preserve old brief and re-review affected output under the corrected version; do not compare mismatched versions as independent agreement | One reviewer receives repairedhead while another reviewsoldhead, manager silently counts both as sameheadPASS |
| Separately identified outputs | Assign distinct reviewer/output identity, role/context/model, actual subject/head/time/scope/action/results/findings/verdict and address before parallel work. Same model permitted, same role context or duplicated/copied output is not independent evidence | Two aliases or copied review text treated as two independent votes |
| No concurrent overwrite | Each worker owns its separate output path/document; no shared mutable Drive document/GitHub path edits. For real overlapping implementation scope, frozenpacks/distinctoutputs or serialize affected work under the governed collision checklist; preserve all originals before manager-owned integration | Last writer wins, reviewer replaces another's rejection, manager loses prior raw output |
| Disagreement/unique findings/shared blind spots preserved | Synthesis lists each original finding/reason/source/exacthead, agreement and disagreement plus actual missing coverage; retain each separately versioned output and corrective reply. Narrow repair gets correctedheadreview and explicit finding closure, not deletion or a fabricated common verdict | Minority valid safety/source finding disappears behind a summary of majority approval |
| Agreement is not approval | No count, majority, same-model agreement or automatic check substitutes for actual acceptance/proof/reviewauthority/ownerpermission where applicable. Current directstandingmandate permits approvedrepositorywork, not missingexternalattestation/productreleaseevidence. Check exactscope/subject/testresults/all8applicableCI/finalstate and residualholds before bounded accepted closure | Multiple reviewers agree on an untested fixture and task becomes productready |

## Manager synthesis and controlled outcome

Prepare a synthesis record pointing to immutable original output IDs/addresses/heads, source brief, actual reviewer actions, distinct findings and shared-blindspot statement. Keep disagreements and actual counterevidence, decide each finding against current controlling source; unverifiable claims stay MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED with owner/action. A reviewer result is scoped evidence, not an automatic vote. Avoid needless per-file bureaucracy: one bounded task synthesis may retain multiple separate outputs and close findings, without repeated ownerapproval already granted.

Once a finding is repaired within valid pack scope, independent correctedheadassessment records actual closure, while originalrejection survives. Required validator/adversarial role and actual legal/store/qualified external authority remain consequence-specific. Sourcepriority, task-end batching, DEC0069accepteddelegatedreview, ownerstandingmandate, metadata+CIproof and normalPRmerge remain under T015/currentcanonicalprotocol, not redefined here.

No automaticchat/API dispatch, paidprovider, externalperson messages, actual parallelprovider run or runtimecollision detector is authorized by this specification. Examples are manual comparison cases; real output separation/overwrite prevention is proved by actual scoped task execution evidence when used. Emptyagreement cannot smooth missingproof or close ten-layerproduct/release gaps.


## Governed sources and actual task addresses

Actual schema `templates/PACK_TEMPLATE.md`; lifecycle `modules/e10-graph/TASK_REGISTRY_LIFECYCLE.md`; closure `templates/CLOSURE_MATRIX_TEMPLATE.md`; task `vault/REGISTRY/T-E10-016.md`; pack `vault/PACKS/P-E10-016.md`; evidence `vault/EVIDENCE/E-DEV-044.md`; admission `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Exact pinned controlling sources: [TASK_EXECUTION_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md), [AI_CODING_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/AI_CODING_PROTOCOL.md), [OWNER_STATUS_AND_ESCALATION.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/OWNER_STATUS_AND_ESCALATION.md), [DECISION_LOG.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/DECISION_LOG.md), [PROJECT_SCOPE_ADDENDUM_AI_NATIVE_EXECUTION_SYSTEM.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/PROJECT_SCOPE_ADDENDUM_AI_NATIVE_EXECUTION_SYSTEM.md). Original rules/amendments remain, no impersonatedexternal authority. Emptyruntime/lineagearrays mean no new publiccontract or identityreplacement.
