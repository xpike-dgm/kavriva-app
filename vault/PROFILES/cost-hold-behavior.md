---
profile_of: cost-hold-behavior
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-006 Decisions 6, 8 and 11; T-E3-031; C3.7
supersedes: ~
record_id: D-APP-DOC-016
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/cost-hold-behavior.md.snapshot"
metadata_origin_digest: "025115ebb487c1a4e821e269680c84be10edcce939d7f33465a1b3783139ad78"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-031 specifies hold-not-weaken behavior and plain-language outcomes. It installs no meter, budget watcher, invoice reader, numeric threshold, UI, alert, worker, deployment or billing control. All financial readiness and operational enforcement remain HELD; T-E3-001-R1 remains REVIEW and physical activation HELD. T-E3-030's classified skeleton and T-E3-015's scenario/evidence slots remain authoritative inputs; this document does not price them or authorize spend."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-024"
  - "E-DEV-024"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-031"
  - "T-E3-031"
implements:
  - "ADR-006 Decisions 6, 8 and 11; T-E3-031; C3.7"
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

# Cost hold and owner-readable retained-work behavior

## Scope and current limits

T-E3-031 specifies hold-not-weaken behavior and plain-language outcomes. It installs no meter, budget watcher, invoice reader, numeric threshold, UI, alert, worker, deployment or billing control. All financial readiness and operational enforcement remain HELD; T-E3-001-R1 remains REVIEW and physical activation HELD. T-E3-030's classified skeleton and T-E3-015's scenario/evidence slots remain authoritative inputs; this document does not price them or authorize spend.

E3 owns technical detection, containment, retained work and reconciliation. E5 remains current identity authority through its public seam; E6 retains applicable release/promotion/suspension gates by existing reference. Budget approval cannot grant product authority, clear a floor or release an unproved capability. A paid invoice, replenished balance, healthy provider or restored account is not safe product recovery proof.

## Triggers and distinctions

Hold affected new positive effects when a mandatory safe-cost obligation is unknown, stale, unfunded or outside its later verified owner-authorized envelope; when a declared hard-stop condition is met; or when account/billing/support/custody evidence is unavailable. Trigger evidence names source/date, exact scope/environment/generation, retained operations and technical resolver. This task supplies no numeric envelope or automated detection. Missing measurement is not permission to continue unlimited effects.

Use existing verbatim state words with stable reason references: HELD for unproved safe-cost coverage; BILLING_HELD for affected billing constraints; ACCOUNT_HELD for provider-account constraints; AUDIT_HELD for unavailable protected audit; SERVICE_UNAVAILABLE for affected service absence; OUTCOME_UNKNOWN for uncertain effect; PARTIAL/RECONCILING for incomplete canonical reconciliation; RECOVERY_REQUIRED when safe recovery needs its separate protocol. Relevant states can coexist on distinct scopes; do not invent successful completion to hide them. Do not convert all billing incidents to an authorization DENIED or say all data disappeared.

Each state/operation response needs a stable reason category, affected feature/capability, allowed and blocked effects, retained data/work, current retry/reconciliation rules, cost stop, technical resolver/support, protected audit reference and restore/exit impact. No new state dictionary or public API is implemented here; T-E3-005/005b/002 and later queue/rollout work own those surfaces.

## Hold-not-weaken requirements

- Fence new affected intake and positive effects before using unverified assurance or budget. No UI/cache/provider role or old worker can clear the hold.
- Preserve current authority, audit preconditions, negative floors/epochs, independent object/audit/floor custody, privacy, recovery and support. A free tier or cost saving never removes a mandatory obligation.
- Protect already retained data, stable operation/effect identities, immutable fingerprints, outbox intents, manifests, checkpoints, pending work and audit/history. Hold is not cancellation, deletion or abandonment of custody/retention duties. Do not erase an accepted operation to make totals or backlog look smaller.
- No guaranteed unlimited storage/support promise: if safe retention itself lacks funding or availability, contain access/effects, record the actual risk and use named technical custody/recovery/support actors and existing policy. Do not silently delete, transfer or weaken protection, or require the owner to debug it.
- Already exposed/downloaded copies cannot be remotely recalled as a billing remedy. Cancellation cannot reverse committed external effects. Restore/rollback never lowers newer negatives or revives revoked access.
- A read/status/reconciliation path can remain available only with its own current authorization, privacy, audit and safe funded operation proof. Billing hold never authorizes a direct provider bypass or cross-tenant disclosure.

## Controlled drain versus safe hold

T-E3-019/020/020b/021/022 own queue contract/families/gates, poison/backpressure/cancel/drain and readable backlog/resolver. T-E3-032/033 and E6 own environment/promotion gates; T-E3-038 owns later invoice/budget watch. These are non-runtime task/gate references, not new dependencies, job families, worker policy or implementation. Numeric lease/retry/cost/drain limits remain HELD pending their own evidence.

| Situation | Required behavior | Evidence before any affected positive effect |
|---|---|---|
| New work while coverage is held | Block affected acceptance/positive effects with reason and retained state; do not turn the request into silently accepted work | Current scope, authority/audit/floors/runtime plus safe authorized envelope and applicable gates |
| Accepted work with safe current coverage | Drain only the already accepted, fenced scope through bounded controls; no expansion or new operation identity | Current operation/effect key and fingerprint, lease/generations, tuple/audit/floors, remaining funded execution/retention/recovery budget and applicable E6 gate |
| Accepted work without safe coverage | Stop positive effects, retain checkpoints/intents/backlog and protect current data; surface HELD or recovery status honestly | Named technical resolver and verified containment/retention/recovery plan; drain remains unavailable |
| Effect may have happened but response/lease is lost | Preserve OUTCOME_UNKNOWN; use authorized canonical lookup and reconcile, not blind new-identity replay | Matching effect/operation identity and canonical outcome/manifest plus current privacy gates |
| Partial multi-plane effect | Preserve PARTIAL/RECONCILING, quarantine applicable objects and prevent new disclosure | Coherent DB/object/audit/floor and identity/generation reconciliation; queue or worker success alone is insufficient |
| Account/billing restored or budget approved | Reassess actual current target and every affected consumer; keep old messages/processes fenced | Current tuple, floors/epochs, audit/custody, compatibility, authorized cost and scope-specific recovery evidence; no automatic restart from payment alone |

The resolver cannot drain unlimited work because stop would be inconvenient. Missing funded limits or current controls select safe hold and reconciliation. Neither deployment drain nor billing recovery grants release authority. Accepted work stays separately identifiable from queued status, proved effect and uncertain outcome; empty queue/HTTP 2xx/worker exit is not final product truth.

## Plain-language owner surface specification

Later surfaces must state the affected feature, what stopped, what is actually retained or uncertain, the technical resolver and next update/support path, and which decision is needed. Use ordinary language, do not show raw keys, SQL, stack traces, tokens or private records. Avoid making the owner diagnose logs, restart a worker, change secrets or administer accounts through technical instructions.

| Outcome | Example wording for later implementation | Allowed owner choices |
|---|---|---|
| Mandatory cost not yet proved | “Bu özellik şu anda beklemede. Güvenli çalışması için gereken giderler henüz doğrulanmadı. Teknik ekip kontrol ediyor.” | Beklet / durdur / kanıtlı maliyet teklifini değerlendir |
| Billing restriction | “Ödeme sorunu nedeniyle bu özellikte yeni işlem başlatılmıyor. Bekleyen işlerin durumunu teknik ekip kontrol ediyor.” | Beklet / durdur / açıkça belirtilen ödeme teklifini değerlendir / destek |
| Accepted work retained with verified custody | “Yeni işler durduruldu. Önceden kabul edilen işler kayıtlı; güvenli biçimde tamamlanabilecek olanlar ayrıca kontrol ediliyor.” | Beklet / durdur / kapsamlı destek veya maliyet teklifini değerlendir |
| Outcome uncertain | “Bu işlemin sonucu henüz doğrulanamadı. Yeniden göndererek ikinci bir işlem başlatmayın; kayıtlar kontrol ediliyor.” | Durumu görüntüle (yalnız yetkili güvenli yol) / destek / beklet |
| Retention/recovery at risk | “Bu özellik durduruldu. Verilerin korunmasıyla ilgili bir sorun var; teknik sorumlu kurtarma ve destek adımlarını yürütüyor.” | Risk ve kanıtlı kurtarma/maliyet teklifini değerlendir / destek / beklet |

These are examples, not shipped UI or guaranteed retention messages. Render only facts supported by current canonical evidence; never display “kayıtlı/korunuyor” if custody/retention cannot be verified. Give supported details for stopped, drained, cancelled, uncertain and completed work without leaking another tenant's status. No owner payment choice automatically enables a feature or discards pending work. Technical actors execute approved support/recovery; legal/payment decisions remain understandable owner decisions.

## Recovery and closure evidence

Closing a hold needs dated trigger/resolution evidence, measured current target and consumer scope, retained operation/effect manifest with canonical outcomes, current E5 authorization/audit/floors/runtime, funded safe baseline/incident/recovery envelope, technical support/custody actor, bounded drain or safe-stop proof, negative/failure tests and exact independent review plus applicable owner/E6 gates. Re-test old consumers, renewed accounts, expired leases, stale receipts and cross-tenant lookup; payment/healthy dashboards alone cannot close it.

Document acceptance checks hold-not-weaken, no numerics/live metering, readable reason/retained-work/resolver choices and explicit queue/rollout drain-versus-hold references. Reject erased backlog, stale authority, weakened audit/custody, unlimited drain, promised unverified retention, silent automatic restart or owner debugging. Live controls and full state/API/queue tasks remain separate and unproved by this specification.

Related classification: `[[vault/PROFILES/classified-cost-bom.md]]`; recovery: `[[vault/PROFILES/backend-reversibility.md]]`; compatibility: `[[vault/PROFILES/compatibility-hold.md]]`. Pack: `[[vault/PACKS/P-E3-031.md]]`; task: `[[vault/REGISTRY/T-E3-031.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-024.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
