---
record_id: V-E9-PROPOSAL-001
version: 1
purpose: Bound assistant proposals to five approved route categories without granting authority
domain: assistant-proposals
module: e09-ai
owner: E9
implements: [ADR-014, ADR-001, C9.1, F9.1.1, R-001, R-003, R-004, R-007, R-009, R-013]
public_contracts: []
internal_scope: five-option-proposals
tasks: [T-E9-001]
tests: [modules/e09-ai/tests/test_proposal_options.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E9-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E9-001, T-E9-001, E-DEV-077]
evidence: [E-DEV-077]
supersedes: []
status: REVIEW
---

# Exactly five bounded proposal categories

Canonical T-E9-001/ADR014 Decision1/C9.1/F9.1.1/FL9.1.1 requires exactly five bounded alternatives. These are five route categories, not five recommended tasks or fabricated alternatives for every question. One internal proposal can name one category. No hard task dependency; actual accepted base f04a10e after PR74, planning pin fa914f. Pending PR75/T015/T016/T017 not consumed. No provider or model selected/called and no prompt/tool schema, public runtime contract or new cross-epic seam.

| Canonical alternative | Internal category | Local boundary |
|---|---|---|
| Known task | KNOWN_TASK | Plain nonempty opaque task reference proposed, never proof it is known/current/approved/fit |
| Symptom/diagnostic flow | SYMPTOM_DIAGNOSTIC_FLOW | Plain nonempty opaque flow reference proposed, never a definitive diagnosis or physical instruction |
| More clarification needed | MORE_CLARIFICATION_NEEDED | No invented target; observable evidence still needed |
| Unsupported/unknown | UNSUPPORTED_UNKNOWN | No target or invented certainty; remains held |
| Safety hold/escalation | SAFETY_HOLD_ESCALATION | Safe bounded alternative; does not invent safe-stop instruction or qualified escalation actor |

Internal frozen Proposal rejects unknown category, non-plain/subclass/coercible category, missing/malformed target for task/flow or unexpected target for other routes. propose converts these finite local failures into the existing safety-hold category, never a sixth route or arbitrary model echo. Reference shape guards are internal hygiene only: no identifier format, production taxonomy, prompt/tool schema, API serialization, timing/length/quota threshold chosen. A reference can still be false/stale/hostile content; it remains an opaque unverified proposal, never interpreted as instruction or executed.

Every proposal has intrinsic NONE authority, false physical_progression and HELD_E3_SIX_DIMENSION_VERIFICATION_MISSING. Model confidence, ALLOW/approval claims, callbacks or coherent caller-created proposals cannot open the constant production gate. No network, provider, database, tool or callback invocation. This helper neither emits an E3 verification receipt nor renders a recommendation. E9 proposes, E3 verifies and E1 renders, as already declared; no private E3/E1 import or runtime call implemented.

Separate T-E9-002 owns six-dimension verification: correct motorcycle/variant, guide applicability, approved/current status, prerequisites, safety/readiness, source/provenance. None implemented or proven by local proposal validity. Actual authenticated/current canonical source/fit/readiness/authority/release/guide verification/E1 display/safe deterministic continuation/provider-adapter operation remain MISSING/HELD. Existing E3R1 REVIEW/E5-003 IN_PROGRESS/openPR47/57/59/75 unchanged. Proposal safety-hold is not permission to move physically or actual complete recovery proof.

Implementation `modules/e09-ai/internal/proposal_options.py`; meaningful nine tests `modules/e09-ai/tests/test_proposal_options.py`; pinned read-only discovery workflow `.github/workflows/e9-tests.yml`. Tests cover alternatives, false/stale/instruction-like opaque target references without authority, unknown/malformed/sixth category, missing/unexpected targets, hostile subclasses without hooks, frozen/extra-authority field rejection and constant production closure despite confidence/callback claims. Local9PASS0.002s/compile. These are fixture/internal rule tests, not a live assistant conversation or canonical verification.

Pack `vault/PACKS/P-E9-001.md` saved with fourteen fields/fourteen paths before code edits. Proof `vault/EVIDENCE/E-DEV-077.md`; task `vault/REGISTRY/T-E9-001.md`. Historical source-freeze observation at de26c0d1c3c096ec83f1f9f021a27afbe3c739fb: independent FULL review and current-head CI were missing. Current actual verdicts/reviewed heads/finding closure are recorded in E-DEV-077; source review alone never supplies missing current CI or actual canonical verification/runtime proof, no author DONE. Seven workflow families with this added E9 workflow require fourteen applicable push/PR runs and actual PR T3 as applicable before merge, plus final metadata review. GitHub account payment-or-spend startup block remains; local checks/historical other-head greens not substitute.

Local inventory v45 is a pending reservation against true accepted v40 and archives its raw Git blob byte-equal; pending v41..44 admissions are not copied or treated accepted. Original401/79 catalog/all accepted admissions/pendingv13/v23/v25 retained. Shared custody must reconcile fresh accepted main/new freeze/review/checks before publication. No durable/state/authority/provider/financial/key/storage/device/runtime action. Missing separately approved universal handoff ID remains MISSING/BLOCKED for affected operational/production handoff.

Source: [ADR014 Decision1](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md). Trace C9.1 -> F9.1.1 -> FL9.1.1 -> T-E9-001 -> M-E9-001 -> E-DEV-077. Rollback disables this internal helper/AI path without replacing deterministic authority; no deployed path or safe continuation implementation claimed.
