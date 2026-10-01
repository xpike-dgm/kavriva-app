---
profile_of: runtime-transition-gates
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-006 Decision 10 and DEBATE-011 judge synthesis sections 6 and 10; T-E3-036
supersedes: ~
record_id: D-APP-DOC-024
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/runtime-transition-gates.md.snapshot"
metadata_origin_digest: "facc078ff6d1984c8c35129a921e7222af833bb841a7f087a5e2efc5c2697a5b"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-036 supplies a gate package; all actual candidate and migration gates remain HELD. It chooses no runtime, language, framework, queue/worker, provider, region, plan, account, credentials, purchase or deployment. ADR-002 remains the approved reversible platform direction; ADR-006 keeps short DB-near Supabase Edge Functions (A) and managed container API plus bounded worker (B) as equal-evidence hypotheses, without a production winner. A failure does not auto-promote B. Current local maintenance/Auth/Storage regression proof is not a complete operational fixture for either candidate or a comparison of them. T-E3-001-R1 remains REVIEW and physical activation HELD."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-026"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-036"
  - "T-E3-036"
implements:
  - "ADR-006 Decision 10 and DEBATE-011 judge synthesis sections 6 and 10; T-E3-036"
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

# Equal-evidence runtime transition gate package

## Document versus operational decision

T-E3-036 supplies a gate package; all actual candidate and migration gates remain HELD. It chooses no runtime, language, framework, queue/worker, provider, region, plan, account, credentials, purchase or deployment. ADR-002 remains the approved reversible platform direction; ADR-006 keeps short DB-near Supabase Edge Functions (A) and managed container API plus bounded worker (B) as equal-evidence hypotheses, without a production winner. A failure does not auto-promote B. Current local maintenance/Auth/Storage regression proof is not a complete operational fixture for either candidate or a comparison of them. T-E3-001-R1 remains REVIEW and physical activation HELD.

An A-to-B proposal requires A failing a mandatory gate on real fixtures AND B passing the same complete applicable gate package with proof. B-to-A or a challenger proposal uses the same scope and proof discipline; no intuition, headline price, runtime health or new provider feature can crown a candidate. If neither passes or comparison is incomplete, hold the affected capability and reopen challengers on equal terms. Existing ADR/change and E6 release/promotion/suspension authority retain the actual decision; this profile invents no new seam, release authority or permission to migrate.

## Freeze an equal comparison before execution

Each later candidate worksheet must freeze exact artifact/source/dependency/tool/provider/runtime/schema/config/message versions and dates; route/capability and tenant/classification scope; workload/scale and retained-data assumptions; initial canonical/identity/policy/audit/object/floor/operation manifests; support/account/custody failure domains; environment/trust-root references; matched fault injection and expected states/effects; comparable positive/negative/recovery/exit assertions; normalized cost scenarios and allocations; independently authorized credential scope and dry-run/hard stops; technical implementer/resolver and verifier; candidate-independent pass/reject criteria; independent verdict, findings/closure and owner/E6 gate references. All actual worksheet fields are currently UNFILLED/HELD.

Use identical consumer paths, workload inputs, fault sequences and assurance budgets for both candidates. Provider-specific adaptation is recorded, not hidden; inability to execute the same semantic gate remains HELD or evidenced failure, never an easier substitute test. Missing inventory, unmeasured limits or excluded services must be explicit. Numeric limits, fault durations, budgets and thresholds stay HELD until separately evidenced; this document supplies no invented values.

For every fixture, record expected semantic state, attempted and actual side effects, protected audit evidence/receipt, retained canonical/uncertain work, recovery owner and owner-readable next action, and cost/exit impact. Bind evidence to exact candidate/artifact/head/environment/date and current manifestations/generations. An effect receipt is distinct from audit/DB/queue/worker receipts. Proof must show current tuple, identity/floors/epochs/audit/runtime and all consuming edges, not merely a successful startup or happy request. Use references/digests; no secrets, raw private data or reusable tokens in evidence.

## Mandatory package: all sixteen judge-synthesis gates

These rows preserve the sixteen-item acceptance package in the [planning judge synthesis](https://github.com/xpike-dgm/motobakim-plan/blob/main/04_TECH_STRATEGY/DEBATES/DEBATE-011__JUDGE_SYNTHESIS.md) section 10, referenced by ADR-006. They are not a replacement for API-AC-001..024 in the requirements synthesis or the eighteen failure classes in the failure/TCO research: later worksheets must map every applicable criterion and failure class into these rows with an evidence-backed scope explanation. Current operational verdict is HELD for A and B on every row.

| Gate | Required matching positive/negative/failure/recovery coverage | A | B |
|---|---|---|---|
| 1. Direct-path/cross-tenant/provider-console bypass | All exposed tables/views/functions/RPC/Storage/handles/Studio and leaked/overbroad material paths; only current mediated authority permits sensitive effects/read/export | HELD | HELD |
| 2. Current session/role/epoch and two-issuer/privileged step-up | Stale/revoked/expired actors, grants/delegation/competence/independence/policy; in-flight current commit and issuer/assurance mismatch, no cached ALLOW | HELD | HELD |
| 3. Timeout/retry/fingerprint/status disclosure | Before/after commit response loss, same semantic replay read-only, different actor/scope/payload CONFLICT/HELD, current authorized cross-tenant-safe lookup | HELD | HELD |
| 4. DB/outbox/object/notification partial failure | Deterministic core acceptance/intent versus separate idempotent effects, interrupted dispatch, canonical uncertainty and coherent reconciliation | HELD | HELD |
| 5. Queue lease/worker kill/poison/retry/DLQ/backpressure/drain | Durable job families, lease expiry OUTCOME_UNKNOWN/PARTIAL/RECONCILING, bounded replay budgets/resolver, cancel and generation-fenced deploy drain | HELD | HELD |
| 6. Protected audit primary/fallback outage and gap/fork/replay | Effect-before-audit rejected; independent protected readiness/receipt, outage hold, replay/gap integrity and audit recovery continuity | HELD | HELD |
| 7. Publish versus recall/suspension and invalid rollback | New/equal negative dominates positive generation, exact manifests/release gate, old binary/config/backup cannot reopen suspended or recalled scope | HELD | HELD |
| 8. Object quarantine/SSRF/archive/digest/lineage/classification/handle revoke | Exact bytes/versions/parents, transitive negatives/classification, unsafe inputs and all disclosure paths, downloaded-copy limits honest | HELD | HELD |
| 9. Offline package/ledger/device restore/tombstone/conflict/account migration | Interrupted/mixed/wrong-digest packages, process death/storage pressure, local-versus-canonical acceptance, conflict/reconciliation, no resurrected deletes | HELD | HELD |
| 10. End-to-end epoch | Current revocation across in-flight operation, worker lease, object handle, cache/service-worker, package/export, retry and restored state | HELD | HELD |
| 11. Cross-plane restore/anti-resurrection/source preservation | Coherent DB/object/audit/current-floor and identity/config/schema/package/operation manifests; quarantine; no negative rollback or silent valid-data loss; source intact until proven acceptance | HELD | HELD |
| 12. Provider/DNS/account/billing/quota partial outage and negative availability | Partial/common-mode failures, independent negative availability, safe funded stop/retention/recovery and explicit technical account/support actors | HELD | HELD |
| 13. Deploy/schema/message/secret compatibility and forward recovery | Exact verified artifact promotion, consumer/lease drain, mixed generations/key consumers, data-preserving correction and no simplistic DB rollback | HELD | HELD |
| 14. No-owner-debug/AI forbidden credentials/support handoff | Owner-readable outcomes/support, narrow task/credential audience/expiry/dry-run/hard stop, denied owner/billing/unrestricted/service-role authority | HELD | HELD |
| 15. Normal/incident/restore/exit normalized BOM and spend stop | Same minimum-safe capabilities and workload, mandatory/conditional classification, current price/tax/FX/overage evidence, verified authorized envelope, funded drain versus hold | HELD | HELD |
| 16. Clean-room runtime/provider replacement | Logical identities/versions/relationships/history/objects/audit/operations/floors preserved in isolated replacement; independent verifier, custody/recovery/support and no assumed portability | HELD | HELD |

No row is a live PASS or executable test result. Actual fixtures for two-issuer/privileged paths, offline clients, workers/queues, independent custody/restore and actual target environments are not supplied by this document. Existing CI exclusions and isolated local test boundaries must not be hidden when filling later rows.

## Explicit criterion and failure crosswalk (documentary, not proof)

The identifiers below are the canonical IDs in the [API requirements synthesis](https://github.com/xpike-dgm/motobakim-plan/blob/main/04_TECH_STRATEGY/DEBATES/DEBATE-011__API_RUNTIME_REQUIREMENTS_SYNTHESIS.md) and [failure/TCO research](https://github.com/xpike-dgm/motobakim-plan/blob/main/04_TECH_STRATEGY/DEBATES/DEBATE-011__API_RUNTIME_FAILURE_TCO_RESEARCH.md). Gate numbers refer to the sixteen rows above. The crosswalk maps obligations, not tests that ran or passing results. Every gate remains independently mandatory and every A/B operational cell remains HELD. Later fixtures need evidence for each listed obligation and its exact consumer scope; this crosswalk cannot merge away, downgrade or silently exclude a gate.

| Criterion | Gates | Scope to preserve in later matched fixtures |
|---|---|---|
| API-AC-001 | 1, 2, 8 | Sensitive read/export/mutation and private-object paths require current API mediation, not direct clients or provider console. |
| API-AC-002 | 4, 6, 8, 11, 16 | Canonical owner/identity/version/classification/history/provenance and audit links survive partial effects, restore and exit. |
| API-AC-003 | 8, 9, 10, 13 | Motorcycle/task package closure, safety/recovery contents, generation/digest and client compatibility; incomplete/mixed packages stay unusable. |
| API-AC-004 | 3, 4, 5, 9 | Local writes, HTTP/Realtime/push, DB transaction and queue status are not canonical acceptance/freshness/recall; reconcile explicitly. |
| API-AC-005 | 1, 2, 6, 7, 12, 14 | Browser Internal Operations remains online-authoritative for approval/publication/role/policy/recovery/audit; Studio and offline state do not authorize. |
| API-AC-006 | 2, 7, 10, 13 | Full current tuple immediately before effect, including actor/issuer/assurance/action/scope/policy/independence/competence and dependency generations. |
| API-AC-007 | 1, 2, 14 | Self-approval, hidden admin bypass, unavailable competence and cached claims cannot produce consequential effects. |
| API-AC-008 | 3, 4, 5 | Stable operation/fingerprint and expected version; same semantic retry reads result, different payload never mutates the old operation. |
| API-AC-009 | 3, 4, 6, 12, 14 | Authorized canonical lookup returns effect/audit/generation/reason/resolver meaning while timeout or unavailable provider can leave uncertainty. |
| API-AC-010 | 3, 4, 5, 9, 12, 14 | Accepted/current/delivered/reconciled and incomplete/held/uncertain outcomes stay distinct; preserve canonical state semantics, no false success. |
| API-AC-011 | 4, 6, 11 | Protected audit-before-effect or equivalent transaction assurance, independent custody/fallback and recovery continuity; unavailable assurance holds positives. |
| API-AC-012 | 1, 4, 8, 10 | Quarantine-first bytes/lineage/classification/digest/version and scoped handle; scan/render/OCR/AI or upload completion grants no activation. |
| API-AC-013 | 3, 9, 10, 11, 16 | Durable offline ledger identity/fingerprint/version/status/conflict/hold/tombstone/resolver across process death, restore, migration and export. |
| API-AC-014 | 2, 9, 11, 16 | Local-to-profile preview, verified possession/reauth, immutable mapping, conflict hold and safe split/rollback; no silent loss/overwrite. |
| API-AC-015 | 7, 9, 10, 13 | Exact approved release meaning and closed dependencies, client/API/schema/config/migration/package compatibility and current suspension generation. |
| API-AC-016 | 2, 7, 10, 11, 13 | Newer recall/suspension fences older/in-flight publication; rollback is a newly guarded valid compatible event, not negative erasure. |
| API-AC-017 | 2, 3, 8, 9, 10, 13 | Revoke current sessions/grants/policy/competence, pending work, handles/browser caches/packages/key consumers and retries/status lookup end to end. |
| API-AC-018 | 2, 7, 10, 12, 14 | Privileged recovery and emergency-negative state machines remain distinct; recovery never grants approval/publication/role authority. |
| API-AC-019 | 3, 5, 12, 14, 15 | Understandable held/unavailable/uncertain/recovery outcome and named technical support/resolver; no owner SQL/SSH/log/queue debugging. |
| API-AC-020 | 2, 4, 14, 15 | Minimum bounded AI context/allowed-forbidden scope, scoped credentials, independent evidence review and partial-task reconciliation. |
| API-AC-021 | 5, 12, 14, 15, 16 | Equal safe BOM for normal/incident/restore/exit, authorized caps/stops, hidden-cost coverage and funded controlled drain or hold. |
| API-AC-022 | 4, 8, 9, 10, 11, 13, 16 | Clean-room migration preserves current/history/audit/object/package/ledger/identity/floor meaning and compatibility, not just code/image portability. |
| API-AC-023 | 3, 7, 9, 10, 11, 13, 16 | Old restore/failover/migration cannot revive revoke/recall/delete/suspension/accepted operation or silently lose newer valid data. |
| API-AC-024 | 1, 2, 13, 14, 16 | API contract independent of provider adapter/presentation, versioned replacement and no provider secrets in client or AI context. |

| Failure class | Gates | Scope to preserve in later matched injection and recovery |
|---|---|---|
| F01 | 3, 4, 6, 11 | Commit succeeded but response lost: canonical operation/audit/queue/object reconciliation, no false failure or duplicate replay. |
| F02 | 3, 4, 5, 11 | Duplicate retry retains immutable operation/fingerprint result across workers and recovery; different payload conflicts. |
| F03 | 2, 7, 10, 11 | Approval races revoke/recall/suspension: current transaction fence and ordered audit, newer/equal negative wins. |
| F04 | 2, 10, 13 | Stale JWT/role/grant, session/issuer/epoch/competence/policy and key/consumer rotation; gateway claims never substitute. |
| F05 | 3, 4, 6, 11 | Atomic narrow DB core versus partial external effects and audit/object/queue mismatch, same identity and coherent forward reconcile. |
| F06 | 4, 6, 11, 12 | Audit sink/fallback loss, gap/fork/replay, integrity and independent recovery; no positive effect without assurance. |
| F07 | 4, 8, 11, 16 | Incomplete/orphan/wrong-digest upload, classification/lineage/quarantine and controlled cleanup, DB/object generation coherence. |
| F08 | 3, 6, 11, 12, 14, 15 | Provider/region/DNS partial outage, independent negative/audit availability, safe history/lookup/support and cost-aware recovery. |
| F09 | 5, 12, 14, 15 | Billing/quota/throttle/account restriction: funded safe stop/drain, retained accepted/history/pending work and explicit support. |
| F10 | 1, 2, 8, 10, 13, 14 | Leaked credential contained, scoped retirement/rotation and current epoch/session/handle/in-flight checks, no secrets in evidence. |
| F11 | 5, 7, 11, 13 | Deployment rollback/schema/message/config mismatch, pinned artifacts, old-consumer drain and data-preserving forward recovery. |
| F12 | 3, 5, 13, 15 | Cold start/long-job kill/restart, durable queued versus effect status, same operation, lease/checkpoint and bounded runtime/cost. |
| F13 | 5, 12, 14, 15 | Queue/backpressure/retry storm: bounded concurrency/retry/DLQ/quarantine/poison, readable backlog and safe funded drain/hold. |
| F14 | 3, 6, 11, 12, 14 | Log/sampling/retention/correlation gaps: protected audit distinct from logs, retained incident digests and uncertainty until reconciliation. |
| F15 | 1, 2, 3, 8 | Cross-tenant direct call/BOLA/IDOR across DB/functions/status/private objects; client IDs are request data, not current authority. |
| F16 | 2, 4, 14, 15 | AI overprivilege/half-finished work: exact scope/credential/audience/dry-run/hard-stop/review and retained PARTIAL/RECONCILING. |
| F17 | 3, 7, 9, 10, 11, 13 | Quarantined cross-plane restore/failover with current security/release/delete/operation/migration floors and no premature positive cutover. |
| F18 | 8, 9, 10, 11, 13, 14, 15, 16 | Partial logical export, independent clean-room import and secret reissue; complete meaning/custody/support/cost, source unchanged until acceptance. |

A future narrow capability may document why a consumer-specific fixture is not yet enabled; this never turns that gate into operational PASS or supports a whole-runtime winner. Full transition still needs the complete applicable evidence package and all shared mandatory invariants on both candidates.

## Failure disposition and transition/recovery gates

Missing/stale/conflicting evidence preserves HELD. An actual violated mandatory invariant is rejected until mitigated; record attempted/actual scope and retained work rather than broadening a narrow failure to the whole provider or treating an untested alternate as passing. Remediate the exact candidate and independently re-review the same gates. A convenience callback or `waitUntil` cannot replace durable long-job execution; container uptime or queue “exactly once” cannot prove product effect.

Before any later authorized transition, close the equal gate package and current support/custody/safe-cost boundaries; identify compatible source/target manifests, exact verified artifact and data migration/forward recovery, current negative/epoch rechecks, retained operation identities, bounded old-consumer drain, quarantined restore, reconciliation and independent actual-target verification. Retain source valid data and custody until accepted verified replacement; no premature deletion/cutover or rollback of current negatives. Release/activation still needs its applicable E6/owner authority; a merged document PR is not deployment. If a service/security incident forces containment first, use authorized safe stop and current negative paths, never automatic positive promotion to an unproved candidate.

The owner receives the affected feature, proven failure and candidate result, what is retained/uncertain, risk/cost/reversibility, technical resolver/support and approve/hold/stop/payment/legal-support choices. The technical actor performs investigation, SQL/SSH/queue recovery/cutover/secret work within reviewed scope; the owner is not the debugger. Standing acceptance of reviewed documents does not fund a new service or close operational migration.

## Dated source and evidence limits

Supabase skill guidance, changelog index and official background-task documentation were checked on 2026-10-01. [Current background-task guidance](https://supabase.com/docs/guides/functions/background-tasks) describes request-adjacent tasks subject to runtime shutdown limits; that capability does not satisfy Kavriva's durable long-job gate by itself. [Changelog index](https://supabase.com/changelog.md) is a drift input, not measured target inventory or candidate PASS. No current prices, fixed runtime limits, newest-version claim, provider recommendation, hosted query or change is supplied. Candidate evidence needs current official guidance and measured exact targets when actually executed.

Task acceptance checks the evidence-gated package and preserved operational HELD status, no migration. Reject automatic fallback, unequal tests/workload/BOM, missing gates/criteria, unmeasured defaults called safe, health/CI-only activation, weakened standards, unsafe source deletion/negative resurrection or owner debugging.

Inputs: `[[vault/PROFILES/backend-reversibility.md]]`, `[[vault/PROFILES/platform-bom-inputs.md]]`, `[[vault/PROFILES/classified-cost-bom.md]]`, `[[vault/PROFILES/cost-hold-behavior.md]]`, `[[vault/PROFILES/compatibility-hold.md]]`. Pack: `[[vault/PACKS/P-E3-036.md]]`; task: `[[vault/REGISTRY/T-E3-036.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-026.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
