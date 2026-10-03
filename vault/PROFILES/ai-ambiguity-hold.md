---
record_id: V-E9-HOLD-001
version: 1
purpose: Preserve HOLD when AI assistance lacks unambiguous current evidence or authority
domain: assistant-ambiguity-hold
module: e09-ai
owner: E9
implements: [ADR-014, ADR-001, C9.6, F9.6.1, R-001, R-003, R-004, R-007, R-009, R-013]
public_contracts: []
internal_scope: ambiguity-hold-rule
tasks: [T-E9-010]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E9-001, M-E3-001, M-E1-001, V-E9-NEVER-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E9-010, T-E9-010, E-DEV-084]
evidence: [E-DEV-084]
supersedes: []
status: REVIEW
---

# HOLD on ambiguity — no invented certainty or fallback answer

Canonical T-E9-010/C9.6/F9.6.1/FL9.6.1; prerequisite T-E9-009 is DONE in actual accepted PR85, not merely local author state. This is the complete bounded rule artifact, not an implemented production classifier or current verification receipt. Independent FULL/current CI pending; no author DONE.

## Binding rule

When category, technical truth, source, motorcycle/variant fit, guide applicability/approval/currentness, prerequisites, safety/readiness, provenance or permission is unknown, conflicting, ambiguous or unproved, HOLD the affected decision/effect. State the known missing evidence or conflict truthfully. Do not turn uncertainty into a plausible numeric value, diagnosis, compatibility claim, guide, instruction, approval or fallback answer. Do not hide uncertainty behind confident language or imply the held effect already happened.

Confidence, valid output shape, previous approval, agreement between models, urgency, cheapness, outage or a caller ALLOW cannot replace current owning verification. Absence of a reason classification is itself unresolved: preserve HOLD rather than inventing a reason or silently continuing. This policy selects no reason-code schema, classifier/evaluation design or timeout/score threshold.

| Ambiguous or missing condition | Required state / truthful explanation | Forbidden fallback |
|---|---|---|
| Technical value or source truth | HOLD; value/source not established | Typical torque/spec/value asserted as true |
| Motorcycle/variant or guide applicability | HOLD; correct fit/applicability not established | Generic guide presented as bike-specific |
| Approved/current guide or publication status | HOLD; current approved status missing/conflicting | Older, cached or AI-written guide treated as approved |
| Prerequisite, readiness or safety evidence | HOLD; prerequisite/readiness/safety unresolved | Assumed safe progression or invented physical safe-stop step |
| Provenance or source verification | HOLD; supporting lineage/source verification missing | Retrieved text or model citation treated as verification |
| Privileged/tool/action authority | HOLD; owning permission not established | Model/caller ALLOW or proposal becomes execution permission |
| Request/category or contradictory evidence | HOLD; question or conflict unresolved | Guess which request was meant, choose a silent winner |

These rows are policy cases, not machine reason codes or seven new categories. E9's five proposal alternatives remain unchanged. Non-authoritative clarification may ask for observable evidence; drafting or approved-content explanation may remain assistance where independently permitted. Such output must retain its tentative scope and cannot clear the affected HOLD, supply a missing value, diagnose definitively, propose unverified physical progression or impersonate a qualified escalation actor. Never-sole authority does not mean all approved help is banned.

## Resolution and ownership

Only the affected owning current authority and required evidence can resolve a hold. A new photograph, clarification or model revision is an input for that evaluation, not permission by itself. If evidence remains missing, contradictory or stale, HOLD persists; do not retry guesses until one looks acceptable. E3 verifies the canonical current motorcycle/variant, guide applicability, approved/current state, prerequisites, readiness/safety and source/provenance. E1 renders E3's owning outcome. E9 proposes without physical or authorization authority. This document neither claims all-six PASS nor emits a verified-candidate receipt, release permission or physical instruction.

All fifteen qualified Decision6 never-sole-authority categories in `vault/PROFILES/never-sole-ai-authority.md` remain controlling; unsupported/final/definitive high-risk/outside approved guide-state/high-impact qualifications stay intact. Decision5's ten allowed assistance directions in `vault/PROFILES/allowed-ai-help.md` remain limited to their approved scope. Decision4 keeps external content untrusted and authority outside model output. Decision7/DEC-0028/DEC-0029 require separate implementer/reviewer/validator, evidence, independent review, no impersonated legal identity/store ownership/qualified attestation. T011's nontechnical external notice remains separate.

## Existing implementation and evidence limits

Accepted `modules/e09-ai/internal/proposal_options.py` already rejects unknown/malformed local inputs into safety-hold, returns intrinsic NONE authority/HELD verification and false physical progression. References remain opaque and unverified. That local shape guard does not detect semantic ambiguity or prove real source/current authority; no new constant helper or mirror tests are introduced here. No provider/model/prompt/tool schema/API/config/threshold/cost/retry/runtime/consumer UI/native/device action selected, no new public contract/private import/E1–E9 cycle. Live E3/E5 sources, semantic evaluation, physical/device/operational handoff proof remain MISSING/HELD.

T006 actual tool authority/binding/bounded retry configuration/trustworthy cost source remains absent/unselected; T007 dependency006DONE unmet. No false advancement of either task. T-E3-001-R1 REVIEW/T-E5-003 IN_PROGRESS and held PR47/57/59 unchanged. Bounded P-E9-010v1 under D-APP-DOC-004v1/P-E10-007; universal operational handoff ID stays MISSING/BLOCKED where applicable. Rule acceptance is not product/feature/flow/runtime completion. No live state changed; revert own documentary reference preserving evidence.

## Source authority and trace

[ADR014 Decision6](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md#L82-L86); [canonical task and acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md); accepted F9.6.1/FL9.6.1 and ACCEPTANCE_MATRIX never15/HOLD/CON001-003. C9.6 -> F9.6.1 -> FL9.6.1 -> T-E9-010 -> M-E9-001 -> E-DEV-084. Profile `vault/PROFILES/ai-ambiguity-hold.md`; pack `vault/PACKS/P-E9-010.md`; task `vault/REGISTRY/T-E9-010.md`; proof `vault/EVIDENCE/E-DEV-084.md`.
