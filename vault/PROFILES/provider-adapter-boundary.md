---
record_id: V-E9-ADAPTER-001
version: 1
purpose: Record replaceable provider adapter boundaries without selecting an integration
domain: assistant-adapter-boundary
module: e09-ai
owner: E9
implements: [ADR-014, ADR-001, C9.3, F9.3.1, R-001, R-003, R-004, R-007, R-009, R-013]
public_contracts: []
internal_scope: provider-adapter-boundary
tasks: [T-E9-004]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E9-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E9-004, T-E9-004, E-DEV-080]
evidence: [E-DEV-080]
supersedes: []
status: ACTIVE
---

# Provider/model adapter boundary rule

Canonical T-E9-004 acceptance is "Specifics behind adapters; change re-evaluates" under ADR014 Decision3/C9.3/F9.3.1/FL9.3.1. This complete static rule assigns every approved provider-specific behavior to the adapter boundary and keeps Kavriva product rules outside it. It selects no provider, model, integration, schema, account, configuration, evaluation algorithm or rollout. Actual adapter/runtime implementation and observed provider change remain MISSING/HELD. Actual independent FULL and source CI acceptance are recorded in E-DEV-080; separate final metadata audit/final-head CI still required before merge. Documentary acceptance does not establish actual provider readiness.

## Specific behavior belongs behind adapters

| ADR014 Decision3 behavior | Adapter responsibility boundary | Missing/conflicting behavior proof |
|---|---|---|
| Structured outputs | Encapsulate provider-specific output capabilities/representation and their differences | Shape compatibility alone is not semantic equivalence, canonical source authenticity or permission; affected assistance held without owning validation |
| Function calling | Encapsulate provider-specific call representation/capability; a proposed call is untrusted data | A model call or confidence cannot execute a tool or approve its own authority; trusted action authority stays outside output |
| Context limits | Encapsulate differing context limits and limitations | Truncation or unavailable context cannot silently drop required source/fit/safety/authority gates; insufficient current evidence holds affected result |
| Errors/rate limits | Encapsulate provider errors and rate-limit behavior without scattering special cases through product logic | Failure cannot create an approval, unlimited retries, automatic paid escalation or unverified substitute; retries/cost continuation belong to separately governed ADR014R4 work |
| Privacy/retention | Keep provider-specific privacy/retention behavior and differences explicit at the boundary | Unknown or changed practices are not legal/privacy approval or authorized retention/deletion; affected use requires owning evidence/re-evaluation, not an equivalence assertion |
| Files/vision/search | Encapsulate provider capabilities and input/output differences | Retrieved/web/community/document/media/tool contents remain untrusted data, never policy; model interpretation does not verify source or prescribe physical progression |
| Lifecycle/versioning | Keep provider/model/version identity and lifecycle/behavior changes observable | Same label/version or stable shape does not excuse actual behavior change; missing identity or change/revalidation evidence leaves affected use held |

## Product logic remains Kavriva-owned

Product taxonomy, allowed routes, safety rules, guide eligibility and authorization remain outside provider-specific calls. Provider adapters cannot define or weaken them. E9 proposes the existing bounded category; E3 performs current deterministic/canonical verification; E1 renders the owning outcome. No E1-E9 cycle, private E3/E1 import, new public contract, receipt issuer, role or action authority follows from this static rule.

Replacement is an adapter/configuration plus revalidation exercise, not a product-rule rewrite. Different structured outputs, tools, context, privacy and lifecycle are acknowledged rather than assumed interchangeable. Observable provider/model/version identity AND behavior changes require re-evaluation. A changed identity, changed version, changed behavior under the same version, shape-compatible output, high confidence or cheaper/faster substitution never bypasses current owning checks. Unknown identity/behavior or absent revalidation evidence holds affected assistance; no automatic replacement, fallback, rollout or positive readiness inferred. Trigger implementation/eval/change-detection design is not created here; T-E9-005 separately tracks the detailed re-evaluation trigger.

Confidence, stronger reasoning or cost savings never grant canonical truth, final fit/readiness, source authenticity, publication/recall, privileged role/policy, protected audit, release/deployment, legal/privacy, billing/purchase, retention/deletion or high-impact self-review authority. ADR014 Decision6 never-list remains controlling. Deterministic reliable rules win; cheaper is usable only if adequate for the allowed task and approved boundaries. No selected model, prompt/tool schema, account/key/plan/credit/purchase/vector/fine-tune/provider-native stack/Jev dependency, benchmark/threshold/version comparison algorithm/cost log or invocation added.

## Scope and actual proof limits

The seven behavior categories and five protected product areas above are a complete documentary mapping of ADR014R3, not proof a real adapter exists or a provider swap succeeded. Product T-E3-001-R1 REVIEW/T-E5-003 IN_PROGRESS and heldPR47/57/59 unchanged. Actual provider identity/capabilities/behavior/evaluation/contract/privacy/cost/runtime/source verification/E1 UI/device/physical proof and universal operational handoff remain MISSING/HELD. Nothing selected/logged/budgeted or executed. No runtime/code/tests/workflow change or mirrored constant tests.

Root manual immutable-source/negative comparisons, raw accepted inventory and current digest/view/architecture checks are separate from actual independent review and actual GitHub CI. Green record checks never establish semantic/provider/product readiness. Bounded P-E9-004v1 uses approved D-APP-DOC-004v1/P-E10-007 review handoff; missing universal operational handoff ID remains MISSING/BLOCKED for affected real operational handoff. Rollback reverts documentary rule only; no live provider state changed.

## Sources and trace

[ADR014 Decision3](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-014__AI_LLM_ASSISTANCE_AND_DECISION_LAYER.md), [F9.3.1](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/FEATURE_CATALOG.md), [FL9.3.1](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/USER_FLOW_CATALOG.md), [task index](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and adapter review row in ACCEPTANCE_MATRIX govern. C9.3 -> F9.3.1 -> FL9.3.1 -> T-E9-004 -> M-E9-001 -> E-DEV-080; E9proposes/E3verifies/E1renders preserved. Profile `vault/PROFILES/provider-adapter-boundary.md`; pack `vault/PACKS/P-E9-004.md`; task `vault/REGISTRY/T-E9-004.md`; proof `vault/EVIDENCE/E-DEV-080.md`.

## Actual complete adapter boundary FULL acceptance and source CI / bounded closure

Independent /root/e9004_adapter_boundary_full_review (owner-selected gpt-6-luna/max) returned FULL PASS static complete task review at 2a6c57f1e7eec9adb5e4a92ef112b124dd67db6e versus accepted PR81 main21ed2c3945c584484fbb8ffb1d11b7100814812a and planfa914f013fdcd032faed876689092da245989459. No findings. Exact eleven paths match fourteen-field P-E9-004v1, mandatory source pins/noharddeps/profile/rawv47 custody match. All seven ADR014R3 behavior boundaries/five protected Kavriva product areas/identity-version-behavior re-evaluation/unknown-same-version-shape-confidence negatives covered; T005 detailed trigger stays separate. Reviewer made no edits and ran no tests/checks/CI/network. No independent rejection invented.

Actual source2a6 all15 runs SUCCESS: PRarch37123120522/37123137424/E337123120532/live37123120485/E437123120492/E537123120504/E637123120530/E937123120540; pusharch37123110527/E337123110548/live37123110525/E437123110532/E537123110523/E637123110629/E937123110582. OpenedarchitectureT3skip0steps preserved; labeledactualPRT3job111203031972five executedstepsSUCCESS/checks111203032073sevenSUCCESS. Actual E4PR170PASS0.179s/E9PR9PASS0.001s. Root actual manual immutable7/5boundary/negative comparisons/currenthash/sourcepins/rawv47byteequal/exact11/priorprimary/code-tests-workflows unchanged/build73/routingREVIEW/run_all12+42PASS0.608s/worst0/diffPASS separately recorded; no local/other-head substitute or reviewer-executed tests claimed.

Standingowner/acceptedDEC0069 accepts complete canonical static adapter boundary: profile REVIEW -> ACTIVE/pack IN_PROGRESS -> DONE/task REVIEW -> DONE solely for rule Specifics behind adapters; change re-evaluates. Six-file closure only profile/pack/task/proof/two views; substantive table/boundaries/negative guards/source refs/code-tests-workflows/rawsnapshot/inventory/manifest/CIplan/priorproof unchanged. Actual source FULL and source CI satisfied; separate final six-file metadata audit and final exact-head all current runs/executedPRT3/E9-E4 logs still required before normal matched PR82 merge. No admin or directmainpush.

Actual provider/model/version/config/schema/selection/integration/observations/revalidation algorithm/threshold/privacy approval/cost/log/budget/runtime/identity/currentcanonical verification/E1 UI/native/device/physical/universal operational handoff remain MISSING/HELD. T005 actual harddep can use accepted004 after realmerge, but no provider swap or automatic rollout authorized. ProductE3R1 REVIEW/E5-003IN_PROGRESS/heldPR47/57/59 unchanged. Complete static rule acceptance is not full feature/flow/product/provider readiness.
