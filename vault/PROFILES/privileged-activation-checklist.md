---
record_id: V-E5-ACTIVATION-001
version: 1
purpose: Build the eleven-item privileged activation evaluation skeleton
domain: privileged-identity
module: e05-identity
owner: E5
implements: [ADR-004, C5.7, F5.7.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: privileged-activation-evaluation-skeleton
tasks: [T-E5-021]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-021, T-E5-021, E-DEV-049]
evidence: [E-DEV-049]
supersedes: []
status: REVIEW
---

# Privileged activation evaluation skeleton

This is the T-E5-021 **skeleton only**: eleven evaluable items, HELD default, evidence HELD as required by the Phase7 planning boundary. F5.7.1 evaluates only; FL5.7.1 returns HELD with attributed gaps and provides **no open verdict**. This source artifact does not run an activation evaluation, create evidence, appoint a custodian, select a provider or authorize privileged production. Consumer/local maintenance authorization remains a separate scope.

## Source and evaluation record

Approved ADR004 Decision10 is governing authority; its eleven semicolon-delimited requirements are reconciled below to DEBATE010 JUDGE_SYNTHESIS section8's numbered decomposition. Historical debate does not override the ADR. Pin planmainfa914f013fdcd032faed876689092da245989459, accepted appbase4347d3ce80a88b1e35accbeafc65f5e4757ad388. Canonical T-E5-021 has no hard task prerequisites, acceptance exactly eleven items evaluable/HELD default/evidence HELD Phase7. Prior completed source tasks are documentary inputs, never physical activation proof.

Before any later evaluation, supply: exact capability and permitted effects; consequence/data classification and tenant/resource scope; candidate composition and actual identities/issuer boundaries; immutable code/configuration/policy/epoch/object-generation subject; evaluator and independent reviewer; dated evidence subject/digest/provenance/observed result; gaps, technical resolver and correction/re-evaluation receipt. Each cited proof must match that exact subject and declared scenario. Empty, stale, mismatched, marketing-only or synthetic evidence is UNKNOWN, never PASS. Do not put tokens, secret keys, raw credential responses or customer data into this checklist.

## Eleven evaluable items — all evidence slots unfilled

Each current entry is **UNKNOWN → HELD / evidence unfilled**. The criteria say what later proof must establish; they are not executed tests or affirmative verdicts. Resolver tasks below are canonical references, not claims that those rows have been implemented or hard dependencies on this skeleton.

| Item | Required proof and disqualifying gap | Evidence slot / current gap | Technical resolver / source handoff |
|---|---|---|---|
| 1. Stable principal, adapter and current tuple | Exact operator/issuer binding, adapter boundary and server current authorization for each effect; reject cached browser/provider-role substitution or cross-account authority | UNKNOWN → HELD; privileged adapter/current production tuple unproved | E5 T-E5-003; E3 T-E3-001 product follow-up T-E3-001-R1; ADR004 R1/R10 |
| 2. Passkey, step-up, factor loss, stolen token, logout-all | Real method/transaction-bound fresh verification and loss/theft/logout scenarios for actual composition; weaker recovery/fallback cannot gain authority | UNKNOWN → HELD; specification T007a is not authenticator/provider evidence | E5 T-E5-007a/007b/008/011/012; ADR004 R3/R5/R10 |
| 3. Revoke, stale tab, direct API, cross-tenant, in-flight negatives | Actual exact-target commit checks deny stale/revoked/cross-scope effects, including in-flight work; positive unit/CI results alone insufficient | UNKNOWN → HELD; product and production negative coverage unfilled | E5 T-E5-003/009; E3 T-E3-001-R1/007/023/024b; ADR004 R1/R4/R10 |
| 4. Recovery versus negative authority tabletop | Recovery revokes/re-authenticates only, cannot approve/publish/grant; emergency scope only suspends/recalls/quarantines/denies; independently observed loss/help-desk/last-admin paths | UNKNOWN → HELD; recovery tabletop and custody unperformed | E5 T-E5-011/012; ADR004 R5/R10 |
| 5. Protected audit, fallback, floor and restore reconciliation | Durable pre-effect linkage; independently protected append-only/tamper-evident audit/fallback/floor; outage/overflow/restore cannot erase negative authority or publisher evidence | UNKNOWN → HELD; fixture values/provider logs cannot substitute independent actual custody and reconciliation | E5 T-E5-013/014/015; E3 T-E3-023/027; ADR004 R6/R10 and ADR005 |
| 6. End-to-end object, local package and queue revoke | Actual server handles, pending/in-flight work/retries, browser/local package/key edges obey changed epoch; downloaded residual copies are honestly non-retractable | UNKNOWN → HELD; no edge-wide execution proof | E5 T-E5-009/010; E3 T-E3-019/024b/025 with E4/E6 declared call-outs; ADR004 R4/R10 |
| 7. Last-admin and provider/outage runbooks | Tested owner-readable recovery/support/outage steps and named technical resolver; provider/SMTP/DNS/billing contingencies; real independent recovery custodian; no owner debugging | UNKNOWN → HELD; no second human/organization recovery custody or tested runbook | E5 T-E5-012; E3 T-E3-017/031/032; ADR004 R5/R10 |
| 8. Android-first real-device identity/recovery fixtures | Actual Android identity/recovery/deep-link composition evidence; simulator or desktop browser not real-device proof; iOS parity separate and explicitly unproved | UNKNOWN → HELD; no device identity/loss/recovery proof | E5 owns identity proof, E1/E2 rendering and E3 serving per declared seams; ADR004 R10 |
| 9. Normalized safe-minimum BOM and owner cost stop | Actual mandatory safety/custody/support/recovery/exit costs and assumptions with cost-stop owner decision; unknown is not zero/free; do not remove safeguards to fit cost | UNKNOWN → HELD; empty classified templates are not prices or budget acceptance | E3 T-E3-015/030/031; E5 composition proof; ADR004 R10 |
| 10. Clean-room exit with factor re-enrollment | Actual independent identity/audit/object/session exit/import/reconciliation, source preserved and stale grants/epochs rejected; factor re-enrollment governed, not credential/role resurrection | UNKNOWN → HELD; no clean-room exit experiment | E3 T-E3-026/027/028/029; E5 T-E5-009/011/012/013/014; ADR004 R4/R5/R6/R10 |
| 11. Independent security and owner/TCO reviews | Separate identified security findings/closure on exact candidate plus intelligible owner total-cost/outage/exit acceptance; consensus, self-review or automated T3 cannot substitute | UNKNOWN → HELD; skeleton's delegated review is not actual security/ownerTCO candidate review | E5 gate evaluator with independent security reviewer and owner cost decision; ADR004 R10 |

## Interpretation and non-opening result

- Evaluate all eleven rows separately; retain observed gaps and contradictory findings, evidence identity, subject and stale receipts. Never count a neighbouring row or generic CI as missing evidence.
- Unknown critical evidence returns attributed **HELD** with resolver and missing proof. A mandatory negative/recovery/audit/no-owner-debug violation returns **REJECT-IF-UNMITIGATED** for the affected capability until independently evidenced mitigation; other candidates do not automatically win.
- No real independent second human/organization for recovery custody means privileged production **HELD**. Owner standing task acceptance, an independent AI reviewer and GitHub approval do not supply human/organization recovery custody.
- Even if a future evaluator reports all rows supported, this evaluation-only feature issues no OPEN, deployment or access grant. Any later activation uses its separately authorized full operational/release process; this skeleton cannot change that authority.
- Show plain affected outcome, missing proof, technical resolver, cost/delay/reversible next action; never hand debugging, credentials or architectural repair to the nontechnical owner. No threshold/budget/session duration/provider selection is defined here.

## Manual negative walkthroughs — not product tests

| Countercase | Required interpretation |
|---|---|
| All documents and CI green, no actual method/loss/restore/device test | Physical evidence UNKNOWN, affected capability HELD |
| Owner accepts delegated AI security review as second eye | Task review may proceed; absent real second recovery custodian still HELD |
| Stale proof from another issuer/tenant/epoch/build | Mismatched proof UNKNOWN; re-evaluate exact candidate |
| Recovery quietly grants role or approves publication | Mandatory violation REJECT-IF-UNMITIGATED |
| Audit unavailable or restored older negative floor | Hold positive effects; preserve violation and reconciliation gap |
| Android fixture used to claim iOS parity, downloaded file remotely erased | Reject unsupported claims; keep separate parity/residual disclosure gaps |
| Cheapest/free option drops custody or requires owner to repair logs | Mandatory protection/no-owner-debug violation; no automatic winner |
| Eleven rows filled used as deployment permission | Reject authority substitution; evaluation-only result cannot open production |

No actual candidate, provider, account, device, credentials, recovery, cost or activation experiment was performed.

## Ten-layer closure and bidirectional trace

ADR004 Decision10 → C5.7 → F5.7.1 → FL5.7.1 → T-E5-021 → M-E5-001 / this skeleton → E-DEV-049 source/review evidence. Each table item returns to ADR004 R10 and the named implementing resolver; referenced earlier source-DONE does not prove runtime closure. Composite acceptance matrix is **HELD-acceptance** for this evaluation-only feature.

| Layer | Actual boundary |
|---|---|
| task | Eleven-item skeleton prepared; independent review/current CI needed for bounded DONE |
| feature | Activation evaluation only; real evidence unfilled, no open verdict |
| flow | Evaluation request returns HELD and gaps; actual serving/rendering unperformed |
| requirement | ADR004 R10 source decomposition, second-human custody remains HELD |
| design | API surface; no UI/product pattern selected, accessibility rendering UNVERIFIED |
| architecture | E5 evaluates/E3 serves/E1 renders through existing declared seams; no new runtime contract |
| data/migration | No actual evidence/customer/account/schema mutation; proof subject and identity slots empty |
| release | Production/activation/recovery custody HELD; no deployment authority |
| product-scenario | Listed walkthroughs source-only, device/provider/loss/restore/cost tests MISSING |
| gap-audit | Every row attributed to technical resolver; no borrowed proof, owner debugging or synthetic completion |

Context `vault/PACKS/P-E5-021.md`; task `vault/REGISTRY/T-E5-021.md`; proof `vault/EVIDENCE/E-DEV-049.md`; capsule `modules/e05-identity/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Pinned authority

- [Approved ADR004](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [Numbered historical decomposition, section8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-010__JUDGE_SYNTHESIS.md)
- [Canonical task](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md), [feature](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/FEATURE_CATALOG.md), [flow](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/USER_FLOW_CATALOG.md) and [HELD acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
