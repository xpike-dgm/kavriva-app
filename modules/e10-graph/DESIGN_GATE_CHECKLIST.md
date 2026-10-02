---
record_id: V-E10-DESIGN-001
version: 1
purpose: Specify full design consistency checklist and controlled pattern change entry
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.6, F10.6.1, R-007, R-009, R-010, R-013, R-014]
public_contracts: []
internal_scope: design-checklist-and-change-entry
tasks: [T-E10-013]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [design-token, V-E10-CLOSE-001, V-E10-LIFE-001, D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-013, T-E10-013, E-DEV-041]
evidence: [E-DEV-041]
supersedes: []
status: REVIEW
---

# Design gate checklist and controlled-change entry v1

Record V-E10-DESIGN-001; planpin fa914f013fdcd032faed876689092da245989459; appbase 8a77699269e2250eff71852c7e509174e75cd83c.

T-E10-013 only: full addendum section7 set and controlled entry for new patterns, under ADR-015 Decision8. Canonical task dependency T-E10-002. This is a source-bound manual design checklist and entry protocol, not UI implementation, final design tokens, a new component catalog, screenshot generation or automatic gate. T-E10-014 separately owns regression evidence enforcement.

## Required design source bindings

Each affected task pack must name exact approved screen/state/feature/flow, canonical design source versions, allowed/forbidden paths/verbs and intended user outcome. Use SCREEN_CATALOG, REFERENCE_INDEX and DESIGN_PRINCIPLES plus the applicable screen-family/state/navigation/working-reference records; approved working references remain constrained, not universal final production specifications. Source absence or non-final decision stays MISSING/UNVERIFIED/HELD; do not infer pixel thresholds, breakpoint numbers, color/type/icon tokens, new modal behavior or provider choices from illustrations.

## Full design checklist

| Addendum section7 source set | Required bounded comparison before acceptance |
|---|---|
| Canonical design tokens | Resolve exact authoritative token/version for every affected semantic value; distinguish approved working DNA from non-final token choices, no local invention |
| Component and pattern catalog | Cite actual existing component/pattern ID/version and allowed usage; unknown/new pattern enters controlled change, not an independent AI style |
| Layout/spacing/type/icon/motion rules | Compare source hierarchy, spacing, readable type, meaningful icon/animation use and actual constraints; shield/check never fabricates trust/safety/certification |
| Responsive breakpoint/re-layout rules | Name source/device/context and required rearrangements, long-content overflow and interaction behavior; missing numerical device/window proof stays held |
| Screen/state contracts | Resolve screen ID and every affected normal/error/empty/loading/stale/offline/held/unknown/recovery state actually required; expected action and safety/provenance meaning stay truthful |
| Turkish content and terminology | Apply canonical approved labels/terms and natural understandable Turkish, realistic long content/units without invented legal/safety/probability copy; language/unit support must not require profile |
| Accessibility semantics | Carry actual labels/roles/focus/reading order/navigation/contrast/scaling/assistive semantics from source; readable type and clear hierarchy beat decorative minimalism, no unsupported accessibility PASS |
| Reference screens and variation bounds | Name exact REF/screen/version and bounded allowed differences; U04 direct only for active-guide anchor and V10 DNA not universal layout/tokens; compare actual source constraint, no copied universal layout |
| Shared shell/navigation rules | Resolve approved Garaj/Bakım/AI Usta/Geçmiş/Topluluk shell and affected root/deep/active-work navigation policy; proposed bottom-bar reductions remain proposed, no invention |

For each applicable row record source/subject/version, affected screen/state, expected scoped artifact, actual comparison result, remaining gap/owner/action and evidence pointer. Nonapplicability must have an actual source-based reason, not empty PASS. Full-screen, cross-screen, cross-state, responsive, accessibility, canonical-reference and regression proof belongs to the actual feature/release acceptance and T014 rule; this checklist publication itself is not that executed UI proof.

## Source constraints that survive visual changes

Family-specific authorities govern applicability: no continue-anyway for safety/fit/readiness; saved UI progress is not physical verification; reminder/snooze is not completion or invented interval; service/role/photo/publication is not technical verification; revoke/withdraw does not erase attribution/provenance; archive/inactive/transfer/delete keep distinct meanings and preserved access; profile remains optional for local/core value. Root-only shell/critical deep-flow differences are sourced, not arbitrary new patterns. A visual reference never authorizes runtime identity/entitlement/technical truth or a new backend/model choice.

## Controlled design-change entry

1. Identify the real unknown/new component/pattern/token/state/layout or requested variation, exact existing source and frozen task/pack/head. Stop the affected out-of-pack implementation under BLOCKED/change-request; keep legitimate bounded remainder only where its context is valid.
2. Enter canonical DECISION_CHANGE_PROTOCOL/CHANGE_CONTROL by reference: verbatim request/date/history and PROPOSED candidate, impact outputs including actual consumers/UNVERIFIED needs/design vocabulary/term+split/manual carry, plain keep-old/apply/options and applicable actual owner authority. Owner standing repository mandate does not invent approval of an otherwise absent design source.
3. E10 owns controlled catalog update per DESIGN_CONSISTENCY_AND_CHANGE. The separately governed authoring task declares exact catalog/source/consumer/pack paths and expected changes before mutation. Preserve full old text/stable IDs/supersedes chain; no second per-task allow/forbid list or undeclared live catalog edit in this task.
4. Require independent separated review of the actual change/head and affected source/consumer/pack revisions, applicable feature/release proof and normal PR+green CI before usage. Missing source/window/device/evidence remains visible; do not clear source-held meaning or product release by checklist agreement. Remediation re-reviews corrected heads with old finding retained.

## Negative cases and shared blind spots

Reject a local attractive pattern lacking controlled catalog entry; copied working reference promoted to final numerical tokens; V10/U04 used universally; shield icon treated as verification; omitted unknown/held/recovery state; long Turkish/assistive/variable-layout cases hidden by one screenshot; proposed deep-flow shell behavior called approved; empty source row passed; all tasks DONE or green metadata used as full design/feature/release proof.

These are specified source-based manual comparisons, not executed screen tests or new design images. Existing structural check_design presence tests are not semantic visual/accessibility/regression validation. The actual scan scope, applicable sources and unresolved constraints remain explicit; independent source review of this checklist does not prove future implementation. No code, automatic gate, design-source mutation, vendor/account/spend or product/release operation is authorized here.


## Governed sources and addresses

Source-owned non-final design contract `vault/CONTRACTS/design-token.md`; ten-layer template `templates/CLOSURE_MATRIX_TEMPLATE.md`; lifecycle `modules/e10-graph/TASK_REGISTRY_LIFECYCLE.md`; task `vault/REGISTRY/T-E10-013.md`; pack `vault/PACKS/P-E10-013.md`; evidence `vault/EVIDENCE/E-DEV-041.md`; admission `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Exact governing source links: [DESIGN_CONSISTENCY_AND_CHANGE.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/DESIGN_CONSISTENCY_AND_CHANGE.md), [SCREEN_CATALOG.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/SCREEN_CATALOG.md), [REFERENCE_INDEX.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/REFERENCE_INDEX.md), [DESIGN_PRINCIPLES.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/DESIGN_PRINCIPLES.md), [GLOBAL_NAVIGATION.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/GLOBAL_NAVIGATION.md), [STATE_MATRIX.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/STATE_MATRIX.md), [DECISION_CHANGE_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/DECISION_CHANGE_PROTOCOL.md), [AI_CODING_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/AI_CODING_PROTOCOL.md). Existing controlled change/sharedblindspot/impersonation/independentrole rules remain. Empty runtime/lineage arrays declare no new productcontract or identityreplacement.
