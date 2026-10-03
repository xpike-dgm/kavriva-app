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
status: ACTIVE
---

# Exactly five bounded proposal categories

Current context: canonical T-E9-001/ADR014 Decision1/C9.1/F9.1.1/FL9.1.1 requires one of exactly five bounded route categories, not five fabricated recommendations. No harddeps. Actual accepted PR78 6ac75ad5e47851426080b6d3430b14317cc4548c/inventoryv44 archived raw, workingv45 new bounded rule admission; allacceptedT014..T017 preserved. Planfa914f/standingowner/acceptedDEC0069 govern, unmergedplanPR4 separate. Historical de26/de0/559 review/audit PASS remains tied to oldf04 source, Actual fresh FULL acceptance/sourceCI recorded in E-DEV-077; finalmetadata/final-headCI required before merge. No provider/model/prompt/tool schema/public contract/new cross-epic seam.

| Canonical alternative | Internal category | Local boundary |
|---|---|---|
| Known task | KNOWN_TASK | Plain nonempty opaque task reference proposed, never proof it is known/current/approved/fit |
| Symptom/diagnostic flow | SYMPTOM_DIAGNOSTIC_FLOW | Plain nonempty opaque flow reference proposed, never a definitive diagnosis or physical instruction |
| More clarification needed | MORE_CLARIFICATION_NEEDED | No invented target; observable evidence still needed |
| Unsupported/unknown | UNSUPPORTED_UNKNOWN | No target or invented certainty; remains held |
| Safety hold/escalation | SAFETY_HOLD_ESCALATION | Safe bounded alternative; does not invent safe-stop instruction or qualified escalation actor |

Internal frozen Proposal rejects unknown category, non-plain/subclass/coercible category, missing/malformed target for task/flow or unexpected target for other routes. propose converts these finite local failures into the existing safety-hold category, never a sixth route or arbitrary model echo. Reference shape guards are internal hygiene only: no identifier format, production taxonomy, prompt/tool schema, API serialization, timing/length/quota threshold chosen. A reference can still be false/stale/hostile content; it remains an opaque unverified proposal, never interpreted as instruction or executed.

Every proposal has intrinsic NONE authority, false physical_progression and HELD_E3_SIX_DIMENSION_VERIFICATION_MISSING. Model confidence, ALLOW/approval claims, callbacks or coherent caller-created proposals cannot open the constant production gate. No network, provider, database, tool or callback invocation. This helper neither emits an E3 verification receipt nor renders a recommendation. E9 proposes, E3 verifies and E1 renders, as already declared; no private E3/E1 import or runtime call implemented.

Separate T-E9-002 owns six-dimension verification: correct motorcycle/variant, guide applicability, approved/current status, prerequisites, safety/readiness, source/provenance. None implemented or proven by local proposal validity. Actual authenticated/current canonical source/fit/readiness/authority/release/guide verification/E1 display/safe deterministic continuation/provider-adapter operation remain MISSING/HELD. Existing E3R1 REVIEW/E5-003 IN_PROGRESS/heldPR47/57/59 unchanged; actualPR75..78 accepted within their bounded scopes. Proposal safety-hold is not permission to move physically or actual complete recovery proof.

Implementation `modules/e09-ai/internal/proposal_options.py`; meaningful nine tests `modules/e09-ai/tests/test_proposal_options.py`; pinned read-only discovery workflow `.github/workflows/e9-tests.yml`. Tests cover alternatives, false/stale/instruction-like opaque target references without authority, unknown/malformed/sixth category, missing/unexpected targets, hostile subclasses without hooks, frozen/extra-authority field rejection and constant production closure despite confidence/callback claims. Local9PASS0.002s/compile. These are fixture/internal rule tests, not a live assistant conversation or canonical verification.

Pack `vault/PACKS/P-E9-001.md` saved with fourteen fields/fourteen paths before code edits. Proof `vault/EVIDENCE/E-DEV-077.md`; task `vault/REGISTRY/T-E9-001.md`. Historical source-freeze observation at de26c0d1c3c096ec83f1f9f021a27afbe3c739fb: independent FULL review and current-head CI were missing. Current actual verdicts/reviewed heads/finding closure are recorded in E-DEV-077; source review alone never supplies missing current CI or actual canonical verification/runtime proof, no author PASS; actual bounded closure recorded in E-DEV-077. Seven workflow families with this added E9 workflow require fourteen applicable push/PR runs and actual PR T3 as applicable before merge, plus final metadata review. Historical account startup block owner-resolved with actual executed PR75..78 CI; Actual sourceCI recorded in E-DEV-077; final-head E9 CI required before merge, no local/historical substitute.

Current inventoryv45 extends actualacceptedv44; trueacceptedrawv44 archived byte-equal, historicalv40 retained. AllacceptedT014..T017/original401/79/catalog/pendingv13v23v25 retained. Actual sourceFULL/sourceCI recorded in E-DEV-077; finalmetadata/final-headCI gates required before merge. No durable state/authority/provider/financial/key/storage/device/runtime action. Missing universal operational handoff remains MISSING/BLOCKED under bounded P-E9-001v2/D-APP-DOC-004v1 review handoff.

Source: [ADR014 Decision1](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md). Trace C9.1 -> F9.1.1 -> FL9.1.1 -> T-E9-001 -> M-E9-001 -> E-DEV-077. Rollback disables this internal helper/AI path without replacing deterministic authority; no deployed path or safe continuation implementation claimed.

## Actual reconciled FULL acceptance and source CI / bounded closure

Independent /root/e9001_reconciled_full_review (owner-selected gpt-6-luna/max) returned FULL PASS at a902ead93522b15b94b29bd27bf48b52ac4ae0a4 against accepted PR78 main6ac75ad5e47851426080b6d3430b14317cc4548c and planfa914f013fdcd032faed876689092da245989459. Five bounded categories, opaque references, strict malformed-input holds, intrinsic no authority/physical progression/verification and constant production HELD with no callback effects, meaningful tests/new pinned read-only E9 CI and E3verify/E1render separation reviewed. Exact16 paths/current mandatory sources/rawv40-v44 custody/primary digest/historical proof preservation pass; no remaining findings. Reviewer made no edits and ran no tests/CI. Old de26/de0/559 reviews remain historical source/audit PASSes; no independent rejection invented.

Actual sourcea902 all15 CI SUCCESS (extra opened/labeled architecture event): PRarchitecture37096352318/37096360772/E337096352246/live37096352317/E437096352223/E537096352319/E637096352300/E937096352352; pusharchitecture37096336826/E337096336821/live37096336852/E437096336842/E537096336825/E637096336854/E937096337094. Opened architecture T3skipped0steps is preserved, labeled architecture actualT3job111127002442 five executedstepsSUCCESS/checks111127002577 sevenSUCCESS. E4PR170PASS0.167s/E9PR9PASS0.001s. Root source9unitsPASS0.001/compile/E4170PASS0.296/build70/routingREVIEW/12checks+42regressionsPASS0.413/worst0/exact16/diff/rawarchives/code-test-workflow-category invariants PASS. No earlier-head/local substitute.

Standing owner/accepted DEC0069 accepts full canonical T-E9-001 five-option proposal rule: exactly five bounded options/categories, not a live assistant or canonical verification. Profile REVIEW -> ACTIVE/pack IN_PROGRESS -> DONE/task REVIEW -> DONE. Six-file bounded closure only: profile/pack/task/proof/two regenerated views; helper/test/workflow/criteria/rawarchives/inventory/manifest/CIplan/prior proofs unchanged. Source FULL plus source CI accepted; separate finalmetadata audit/final-head all14nominal CI (everyactualevent)/executedPRT3/E9-E4 tests then normalmatchedPR79merge required before actualmain acceptance. No admin/mainpush/bypass.

E3 six-dimensional correct motorcycle/variant, guide applicability, approved/current status, prerequisites, safety/readiness and source/provenance verification remains separate T-E9-002. Actual canonical identity/authority/guide/source/runtime/E1render/live provider/physical/device/safe continuation and universal operational handoff MISSING/HELD. No model/provider/price/schema/action permission selected. Held product tasks/PR47/57/59 unchanged.
