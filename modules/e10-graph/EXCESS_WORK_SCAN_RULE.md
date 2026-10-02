---
record_id: V-E10-EXCESS-001
version: 1
purpose: Specify excess-work detection without automatic deletion or scope expansion
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.5, F10.5.1, R-006, R-007, R-009, R-010, R-014]
public_contracts: []
internal_scope: excess-work-detection-specification
tasks: [T-E10-012]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-SIM-001, V-E10-CLOSE-001, V-E10-LIFE-001, D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-012, T-E10-012, E-DEV-040]
evidence: [E-DEV-040]
supersedes: []
status: REVIEW
---

# Excess-work scan specification v1

Record V-E10-EXCESS-001; planpin fa914f013fdcd032faed876689092da245989459; appbase 7cbc0fa67be95d6925d2a6b3719ffdf3688a2f6d.

Exactly T-E10-012: excess-work detection specified; ADR-015 Decision7 and addendum sections5–6. This manual specification creates no automatic detector, priority engine or deletion rule. Canonical dependency T-E10-011a; completed preceding T011b follows owner index order, not an invented hard dependency. No whole-product closure or full semantic audit is claimed.

## Inputs and bounded scan

1. Bind actual approved need/rule/screen/state/ADR source pins, canonical task/flow/feature/capability/epic catalogs, current physical task+claim+pack, real module/contract/test/evidence identities and exact pre/post change surface. List the records searched and what remains outside the scan; never treat historical catalog coverage or a generated index as source content verification.
2. Trace each changed or proposed work item back through Test/Evidence → Contract/Module → Task → Flow → Feature → Capability → Epic → approved Requirement/Rule/Screen/State, and trace that need forward. Include a real necessary architecture/governance/design/data/migration/security/release/validation obligation where applicable, with exact approved source and expected outcome. A physical evidence-custody or tooling task may be necessary without itself changing a product screen; do not classify it as excess merely for that reason.
3. Compare pack objective/acceptance/per-file verbs and actual dependency/ownership/seam/version boundaries to the proposed effect. Follow supersedes history, prior accepted implementations, unresolved acceptance, tests and consumer overlap. Frozen PROPOSED or catalog links alone are not proof of implemented work; bootstrap documentary DONE does not close product R1.
4. Record one bounded finding per candidate with actual item/path/ID/version, source chain, owner, expected user or governed outcome, precise reason, existing overlapping output, exact gap/affected consumer, searched/unsearched scope, verdict and next permitted action. Preserve previous findings; do not silently collapse distinct needs into one count.

## Detection predicates and dispositions

| Candidate signal | Required semantic comparison | Allowed bounded verdict / response |
|---|---|---|
| No resolved approved need or necessary governed obligation | Check actual source contents, reverse chain, module/owner, history and source completeness | MISSING/UNOWNED/UNVERIFIED when unresolved; excess candidate only when review can substantiate absence within named scope; no invented PASS or deletion |
| Duplicate or redundant output | Compare exact identity/subject/version, actual consumers, intended acceptance and new required behavior with already accepted output | CONFLICT/excess candidate if same purpose/outcome is already evidenced and no distinct need; a separate scenario/negative test/custody repair or unresolved runtime acceptance may justify necessary work |
| Outside task pack or unauthorized meaning change | Compare real effect to allowed paths/verbs, boundaries, source authority and actor mandate | BLOCKED/change-request before affected action, even if useful; authorized context revision/review or withdrawal, never silent expansion |
| Wrong dependency or ownership/service layer | Compare real seam/contract/authority and acceptance dependency, distinguish tooling/invoke/reference edges from runtime | CONFLICT/UNVERIFIED with exact source and owner; do not mutate planning DAG to hide it or declare architecture redesign automatically |
| File-count bureaucracy or fragmented tasks | Compare actual guarantee, accepted custody/history and minimal change surface; stable identities/requirements/evidence stay intact | Bounded consolidation proposal only when authority/history/consumer/proof preservation can be shown; no automatic merge/rename/delete of IDs or old proof |
| Gold-plating/optional behavior/window/provider not approved | Resolve exact approved scope and real user outcome, pending questions, costs and source-held controls | BLOCKED/UNVERIFIED or reviewed excess candidate; owner standing repository mandate does not manufacture requirement, numeric proof or external legal/release authority |
| Dead/stale-looking work or contradictory DONE | Inspect supersedes/consumers/current acceptance and subject-specific proof, including historical snapshots and unfinished product record | Preserve historical custody; classify actual stale context/unsupported DONE/gap visibly, not auto-excess. Documentation and tests needed to prove acceptance remain necessary |

The rule is a detection specification, not a mandatory deletion gate. Review must distinguish **confirmed unnecessary work within the reviewed scope** from **necessary work**, **missing requirement coverage**, and **insufficient information**. Labels MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED remain visible; neither silence nor all-task DONE creates PASS. No new task lifecycle state is introduced.

## Required negative cases

- A valid node with an `implements` label but no semantic approved need is not accepted by metadata alone.
- An unresolved source is UNVERIFIED/MISSING, not a confirmed unnecessary item eligible for removal.
- A purposeful evidence snapshot, governed path admission or negative regression is not excess solely because it has no user screen or resembles another file.
- An existing fixture/documentary acceptance or bootstrap DONE does not prove real product implementation is duplicate or unnecessary.
- Different task IDs and branches do not make semantically duplicated outputs distinct; matching titles do not prove duplication.
- A change that is necessary but outside the current pack stops for governed context revision; useful intent does not authorize scope expansion.
- Deleting a task cannot claim the need is covered merely because task counts fall; actual affected forward/reverse needs and consumers remain visible via the separately governed gap/removal audit.
- Optional provider/windows/cost choices and new authority are not inferred from standing owner permission for existing approved work.

These are specified source-based comparison cases, not an executed runtime detector or new removal drill. Actual T010 historical pinned observation and gap findings remain unchanged; no broad corpus PASS borrowed from it.

## Review and controlled outcome

Reviewer receives actual candidate record/heads/source/context and independent initial judgment. Any disagreement is preserved; implementer and checker agreement is not approval. Necessary work continues only under the valid task/pack; unknown or unauthorized affected work holds; substantiated excess enters canonical decision/change control with exact impact, keep-old/apply/options, owner authority where applicable, old text/IDs/supersedes/evidence retention, independent revalidation and normal PR+green CI. This specification authorizes no immediate delete, rewrite, automatic actuation, provider or release operation.

Shared blind spots: complete metadata and passing heuristics do not establish semantic need, absence of unseen requirements or product readiness. The named scan scope and unsearched sources must remain visible. Actual independent source review of this rule is distinct from future use of the rule and from product/closure verification.


## Governed sources and addresses

Actual core rules `modules/e10-graph/CORE_SIMULATION_CHECKLISTS.md`; ten-layer template `templates/CLOSURE_MATRIX_TEMPLATE.md`; lifecycle `modules/e10-graph/TASK_REGISTRY_LIFECYCLE.md`; task `vault/REGISTRY/T-E10-012.md`; pack `vault/PACKS/P-E10-012.md`; evidence `vault/EVIDENCE/E-DEV-040.md`; admission `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Exact governing source links: [MODULE_BOUNDARIES.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md), [PUBLIC_CONTRACTS.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/PUBLIC_CONTRACTS.md), [DECISION_CHANGE_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/DECISION_CHANGE_PROTOCOL.md), [AI_CODING_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/AI_CODING_PROTOCOL.md), [ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md). Existing controlled change/sharedblindspot/impersonation/independentrole rules remain. Empty runtime/lineage arrays declare no new productcontract or identityreplacement.
