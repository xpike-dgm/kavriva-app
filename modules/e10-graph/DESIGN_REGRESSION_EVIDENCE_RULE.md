---
record_id: V-E10-DESIGN-EVID-001
version: 1
purpose: Require subject-bound design regression evidence across screens states and accessibility
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.6, F10.6.1, R-007, R-009, R-010, R-013, R-014]
public_contracts: []
internal_scope: design-regression-evidence-specification
tasks: [T-E10-014]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-DESIGN-001, design-token, V-E10-CLOSE-001, V-E10-LIFE-001, D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-014, T-E10-014, E-DEV-042]
evidence: [E-DEV-042]
supersedes: []
status: ACTIVE
---

# Design regression evidence rule v1

Record V-E10-DESIGN-EVID-001; planpin fa914f013fdcd032faed876689092da245989459; appbase 6f20714a3574b6bc6e7e3985063888bef63c704a.

T-E10-014: Full/cross-screen/state/accessibility evidence required, ADR-015 Decision8; canonical prerequisite T-E10-013. Source addendum7 requires full-screen, cross-screen, cross-state, responsive, accessibility, visual regression and canonical-reference comparisons at actual feature/release acceptance. This rule specifies evidence obligations; it creates no runner, screenshot suite, UI implementation, numeric tolerance or vendor choice.

## Evidence coverage required

For every affected feature and release candidate, bind the actual approved need/screen/state/flow/task, exact reference IDs/source versions, build/subject/environment and consequence-appropriate check obligations. The valid task pack must already select the exact approved design elements to use and permitted/preserved constraints in its existing design-reference and allowed/forbidden fields before implementation, as required by T013; evidence cannot retroactively authorize a missing source or forbidden design change. Carry the actual applicable whole screen, related screens, state branches and supported responsive/accessibility contexts in a named coverage table. A nonapplicable cell requires a reviewed source-based reason; missing scope or unperformed validation stays MISSING/UNVERIFIED/BLOCKED.

| Required comparison | Minimum subject-bound record |
|---|---|
| Full-screen | Actual whole affected screen/context and expected hierarchy/actions/safety/provenance, reference and candidate identities; isolated component crop cannot substitute |
| Cross-screen | Related flow/family/shell screens and shared tokens/components/terms/interaction semantics; name pair/set and actual comparison, no inference from each screen independently passing |
| Cross-state | Approved normal/loading/empty/error/stale/offline/permission/held/unknown/recovery/destructive states applicable to source; distinguish product state from invented task state, preserve safe re-entry/uncertainty/history |
| Responsive and Turkish-content | Actual approved device/layout/context and source constraints, real long/short Turkish/unit text cases and re-layout/overflow/interaction outcome; missing device/window or final numerical rules remain held, no invented pixel threshold |
| Accessibility | Actual roles/labels/focus/reading/navigation/scaling/contrast/assistive semantics applicable to supported scope; record performed method/context/result/proof, not assertion from semantic markup or pretty screenshot alone |
| Visual regression | Actual prior accepted subject/reference and candidate, changed versus protected regions/semantics, comparison result and accepted/rejected differences; no rehashed changed bytes reusing old approval |
| Canonical-reference | Exact approved REF/screen/version and allowed variation plus actual candidate; working V10/U04 constraints and nonfinal tokens remain, no universal layout/false shield trust |

Evidence must remain attributable to the exact test ID, contract/source ID+version, subject digest, actual result, evidence links, gate verdict, independent reviewer and timestamp using ARCHITECTURE_TESTS shape. Name performed versus specified/manual comparison, tested inputs/context, expected versus actual outcome, finding/repair/next action and unresolved coverage. Raw pictures alone are insufficient without current subject/context/verdict, while metadata presence alone does not verify pictured behavior or accessibility. Review must inspect actual scope and subject, not accept an artifact name or generated link as execution proof.

## Ownership and gate use

Implementer performs applicable validations and captures proof; separated reviewer verifies actual evidence, findings and corrected head; applicable gate uses the recorded verdict under VALIDATION_STRATEGY/R013/R014. Invocation does not redefine the rule-to-gate mapping or add an automatic release gate. Independent delegated review follows actual owner-accepted DEC0069 role/context/head/closure rules; it cannot substitute legal/store/qualified external attestation. Shared-blindspot/unknown scope stays explicit.

No task or single screenshot success closes the whole feature/release. Use V-E10-CLOSE-001 ten-layer forward/reverse chain and source-based residual gaps. Product UI tasks later must run appropriate actual checks; this specification's structural CI/manual source acceptance proves only the evidence rule publication, not current product visual/regression/accessibility readiness. Existing check_design tests references only; no automatic semantic evidence validator is implied.

## Negative evidence cases

Reject cropped-only proof claimed as full screen; one screen pass claimed as cross-screen consistency; only normal state hiding held/unknown/recovery; default device plus short English claimed as responsive/Turkish coverage; markup or static art claimed as actual assistive behavior; old digest/window/reference or changed screenshot relabeled accepted; blank N/A without reason; fixture state claimed as production identity; source-held token/numerical/device proof overwritten; green structural CI or all tasks DONE claimed as full feature/release design closure.

A finding retains exact old subject/result/reviewer/date and source history. Narrow repair gets new subject-bound execution evidence and corrected-head separated review, with current pack/source changes governed through T013 canonical change entry. Out-of-pack or missing required source/proof stops affected acceptance; authorized bounded remainder can continue with visible gaps. No benchmark, test counts, vendor/device selections, automatic actuation, screenshot generation, provider/account/spend or production release operation is authorized by this rule.


## Governed sources and addresses

Accepted design checklist `modules/e10-graph/DESIGN_GATE_CHECKLIST.md`; ten-layer template `templates/CLOSURE_MATRIX_TEMPLATE.md`; lifecycle `modules/e10-graph/TASK_REGISTRY_LIFECYCLE.md`; task `vault/REGISTRY/T-E10-014.md`; pack `vault/PACKS/P-E10-014.md`; evidence `vault/EVIDENCE/E-DEV-042.md`; admission `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Exact governing source links: [DESIGN_CONSISTENCY_AND_CHANGE.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/DESIGN_CONSISTENCY_AND_CHANGE.md), [SCREEN_CATALOG.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/SCREEN_CATALOG.md), [REFERENCE_INDEX.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/REFERENCE_INDEX.md), [DESIGN_PRINCIPLES.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/DESIGN_PRINCIPLES.md), [GLOBAL_NAVIGATION.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/GLOBAL_NAVIGATION.md), [STATE_MATRIX.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/STATE_MATRIX.md), [DECISION_CHANGE_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/DECISION_CHANGE_PROTOCOL.md), [AI_CODING_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/AI_CODING_PROTOCOL.md), [VALIDATION_STRATEGY.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md), [ARCHITECTURE_TESTS.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md), [README.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/RULES/README.md). Existing controlled change/sharedblindspot/impersonation/independentrole rules remain. Empty runtime/lineage arrays declare no new productcontract or identityreplacement.
