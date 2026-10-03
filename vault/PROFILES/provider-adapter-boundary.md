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
status: REVIEW
---

# Provider/model adapter boundary rule

Canonical T-E9-004 acceptance is "Specifics behind adapters; change re-evaluates" under ADR014 Decision3/C9.3/F9.3.1/FL9.3.1. This complete static rule assigns every approved provider-specific behavior to the adapter boundary and keeps Kavriva product rules outside it. It selects no provider, model, integration, schema, account, configuration, evaluation algorithm or rollout. Actual adapter/runtime implementation and observed provider change remain MISSING/HELD. Fresh independent FULL review/current CI are required for documentary task acceptance, not actual provider readiness.

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
