---
profile_of: api-enforcement-needs
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Decisions 1 and 2; ADR-006 Decisions 2 through 9; T-E3-014; C3.3
supersedes: ~
record_id: D-APP-DOC-011
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/api-enforcement-needs.md.snapshot"
metadata_origin_digest: "afc3e3c0c2682daeac63b0eb5184894edc60c6f51ba4be1a44a0a4d5833b4a6b"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-014 specifies enforcement requirements for the reversible backend direction under `[[vault/PROFILES/backend-reversibility.md]]`. It provisions nothing and selects no provider, runtime, framework, account, region, plan, credential or production threshold. E3 serves and verifies; E5 authorizes through declared public contracts; E6 retains release/rollout authority. No new runtime seam or direct access to another module's internals is introduced. The existing `[[vault/CONTRACTS/authorization-tuple.md]]`, `[[vault/CONTRACTS/operation-identity.md]]` and `[[vault/CONTRACTS/state-epoch.md]]` remain authority; this is their requirements profile, not a replacement contract."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-023"
  - "E-DEV-018"
  - "E3-COMPATIBILITY-CHANGELOG"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-014"
  - "T-E3-014"
implements:
  - "ADR-002 Decisions 1 and 2; ADR-006 Decisions 2 through 9; T-E3-014; C3.3"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
superseded_by: []
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# API-boundary enforcement needs

## Scope and authority

T-E3-014 specifies enforcement requirements for the reversible backend direction under `[[vault/PROFILES/backend-reversibility.md]]`. It provisions nothing and selects no provider, runtime, framework, account, region, plan, credential or production threshold. E3 serves and verifies; E5 authorizes through declared public contracts; E6 retains release/rollout authority. No new runtime seam or direct access to another module's internals is introduced. The existing `[[vault/CONTRACTS/authorization-tuple.md]]`, `[[vault/CONTRACTS/operation-identity.md]]` and `[[vault/CONTRACTS/state-epoch.md]]` remain authority; this is their requirements profile, not a replacement contract.

For future capability activation, list every sensitive read and high-consequence mutation with its action, target/tenant/scope/classification, current source, authorization/negative-floor/audit requirements, effect boundary, operation/lookup behavior, exposed alternate paths, technical resolver and negative test evidence. An unlisted path is not implicitly safe. The table below covers path classes, not a claim that concrete endpoints have already been built or inventoried.

## Required enforcement and later proof

| Path class | Required enforcement | Negative evidence before activation | Responsibility / present proof limit |
|---|---|---|---|
| Sensitive read, history, search and status lookup | Authenticate the current requester; authorize current tenant/object/scope/classification before disclosure. Rebuildable search/cache/history copies do not authorize reads. Return only authorized minimal data; lookup is read-only, not a mutation. | Cross-tenant/guessed IDs, stale session/grant, unauthorized history/source and cache substitution disclose no private existence/payload/actor/audit/URL details. Unknown-for-caller and inaccessible responses have consistent generic disclosure; logs do not reveal the hidden result. | E3 read boundary with E5 public decisions; existing private history reader requires prior authorization and is not a public API. Future rate-limit values remain unselected. |
| Authoritative mutation and correction | Re-read the full current authorization tuple immediately before the canonical effect: actor/workload, issuer/session/assurance/step-up/epoch, action and exact object/tenant/scope/classification, role/grant/delegation/competence/independence/policy, relevant object/release/schema/config/package/client generations, current floors, operation ID/fingerprint/reason/intended effect, audit and runtime compatibility. Lock current sources through same-transaction canonical transition; unknown/stale inputs fail closed. | Cached/JWT/UI/RLS ALLOW, wrong workload/delegation/action/version, changed intent, concurrent revoke/floor, audit outage and incompatible runtime cannot commit. Native lock/rollback/commit evidence is required, not only fake transaction tests. | E3 canonical effect owner; E5 authorization owns policy semantics. Narrow maintenance/object tests do not prove every production source or mutation. |
| Retry, status and uncertain outcome | Stable operation identity binds immutable actor/scope/payload/purpose. Same semantic retry resolves the existing result; changed intent conflicts. Timeout/lost response remains OUTCOME_UNKNOWN until authorized canonical lookup resolves it; HTTP 2xx or worker success is not product completion. | Lost response after commit, duplicate delivery, concurrent retry, changed payload/actor/tenant, guessed operation ID and stale authority never create a second effect or leak another user's result. | E3 operation store/lookup; no general lookup API or numerical retry budget selected here. |
| Upload, quarantine original and preview | Issue only server-scoped single-purpose quarantine intake authority after current checks. Originals stay private and quarantined; successful upload, scan, signature or AI output cannot publish/activate. Human previews require an isolated surface; never serve quarantine originals from the operations origin. | Generic upload/list/overwrite, another tenant's path, unvalidated/tampered object, mixed lineage, expired/revoked handle and preview-origin escape cannot disclose or activate bytes. | E3 object boundary; existing object contracts/adapters are bounded proof, not hosted upload/preview/scanner deployment. |
| Derivative, download, export and package | Bind exact object/source versions, own digest, full lineage, owner/classification/retention, current source/target permissions and negative floors before positive effect/disclosure. Eligibility receipts are historical, never current authority. High-consequence private material remains server-mediated. Any later allowed low-consequence signed handle is purpose/audience/object/version scoped with a reviewed expiry; transferable URLs cannot enforce audience or prove revocation. | Revoked sources with unchanged bytes, old receipts, changed policy/generation, dropped lineage, export downgrade, replayed handle and partial/mixed package cannot bypass current gates. Already downloaded copies remain honestly non-retractable. | E3 verifies/serves with declared E4/E5/E6 interfaces as applicable; no export/download/package endpoints or handle issuer are provisioned by this task. |
| Browser/mobile transport | Transport checks supplement current authority. Browser rules follow `[[vault/PROFILES/authorization-tuple-browser.md]]`: exact origins/redirects, CSRF for cookie mutation, PKCE correlation, bound step-up, no private response caching and no secret exposure. Offline/local proposals and client clocks/roles cannot authorize server effects; pending work retains stable identity. | Unlisted/reflected/null origin, missing CSRF, stale tab, forged callback, reused code/step-up, logout cache and changed offline submission fail safely. A non-browser direct call still faces the same server authority even when CORS is irrelevant. | E3 boundary, E1/E2 rendering only; session/framework choices and privileged browser activation remain separately gated. |
| Worker, job and external effect | Re-authorize actual positive effects, not only queue acceptance; bind lease/operation/effect/version/epoch and re-read floors/audit/runtime. Canonical DB acceptance and deterministic intent do not prove object/queue/provider completion. Use explicit partial/reconciling/unknown states across planes. | Stale lease/job/runtime, duplicate delivery, revoke after enqueue, audit loss and partial object/provider failure cannot publish success or clear a negative floor. No slow external scanner/provider call is held inside a DB transaction. | E3 job/runtime owner through existing seams; T-E3-019 and later job tasks own concrete protocols. No queue/worker selected here. |
| Direct DB, Data API, view/function/RPC, Storage/URL/Realtime and provider console | Inventory every exposed path and effective role/privilege, including server/service-role/administrative bypass. Deny generic client authoritative mutations or sensitive disclosure outside the mediated contract. RLS/Storage are mandatory defense in depth, never sole authority. Studio is provider administration, not product approval/publication/recall/audit truth. | Direct role/query/RPC/view/function/Storage/list/URL/subscription attempts and privileged-path containment tests prove no alternate product authority; new exposures must fail inventory review. A successful RLS filter is not an API authorization verdict. | E3 defense/path owner; T-E3-006a/006b supply narrow inventories and T-E3-016 specifies defenses. This document is not a current hosted inventory or new SQL grants/policies. |
| Credential, workload and environment boundary | Privileged keys/DB logins/signing/recovery secrets remain in trusted server custody, absent from clients/repos/logs and ordinary AI context. AI tasks have bounded access, no owner/billing/service-role/unrestricted SQL/global storage authority. Separate environment identities and current runtime/config policy references; revoke/rotate safely without reviving old authority. | Secret leakage, wrong environment, overbroad AI token, revoked workload, old key/session/runtime and generic administrative access fail the relevant gate; credential custody must be independently proved. | E3 custody/runtime owner with E5 identity; T-E3-017/T-E3-032 and AI task profile retain detailed rules. No keys or accounts are created. |
| Outage, recovery and compatibility | Provider/account/billing/audit/floor unavailability holds affected positive effects and retains durable user work for reconciliation. Restore starts quarantined and reads trusted current negative floors; newer valid data is preserved. Dated provider changes undergo compatibility hold before changed defaults reach production. | Old restore, missing floor/audit plane, billing lock, timeout/ambiguous effect and incompatible schema/config/client cannot become success, revive revoked authority or require owner SQL/SSH/log repair. | E3 technical resolver; E6 release/rollout decisions stay within declared gates. T-E3-018/023/026 and recovery tasks prove activation separately. |

## Required capability closure record

For each future path record exact request/action semantics, actor/workload and source provenance, tenant/object/version/classification, current authority/floor/operation/audit/runtime source references, permitted disclosure/effect, lock/transaction or cross-plane reconciliation boundary, all alternate paths/roles and negative cases, environment/provider/runtime version, technical resolver, evidence date and independent verdict. Record missing sources or unknown results explicitly; no field may be silently filled with a cached positive or client claim. Deployed reads require current authorization as well as integrity; deployed writes require current authorization and the canonical commit/reconciliation proof.

Credential details and private payloads never enter closure records. Output shapes preserve the shared state dictionary and stable reason semantics without leaking provider errors, private tuples or credentials. Numerical expiry/rate/retry/cost limits, provider product choices and privileged activation remain later scoped decisions. Owners receive outcome/risk/cost/retained-data/approve-hold-stop choices; technical diagnosis and recovery stay with the named operator.

## Task-level limits and handoff

All operational requirements here remain HELD until capability-specific implementation/evidence closes them. Document DONE would mean only that needs are specified, not that direct paths are secured or live APIs/objects/identity are fully connected. T-E3-001-R1 remains REVIEW and physical domains remain HELD. No provisioning, migration, purchase or new runtime dependency occurs.

`[[vault/PACKS/P-E3-014.md]]`, `[[vault/REGISTRY/T-E3-014.md]]`, `[[vault/EVIDENCE/E-DEV-018.md]]` and `[[modules/e03-server/MANIFEST.md]]` trace this task. `[[vault/PROFILES/object-activation.md]]`, `[[vault/PROFILES/ai-task-scope.md]]` and the browser profile keep their existing narrower limits. Detailed defense policies, secret custody, workers, costs and recovery procedures remain their separately planned tasks; this profile does not pre-complete them.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
