---
profile_of: durable-state-categories
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-006 Decision 1 with Decisions 2, 3, 6 and 7; T-E3-034; C3.1
supersedes: ~
record_id: D-APP-DOC-018
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/durable-state-categories.md.snapshot"
metadata_origin_digest: "cec10dec70ba1fdfb8efe4f82e4feb4ad91cee56253c4f9a503671a6e5924e62"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-034 lists durable categories, not physical stores or implementation. Runtime instances/functions/containers may disappear; their memory, health, HTTP result, queue delivery/emptiness and worker success are never canonical product truth. This list selects no schema, technology, account, retention duration, provider or credential and provisions no service. Completeness of the list is not completeness of live state, independent custody, restore or production authorization. T-E3-001-R1 remains REVIEW; physical activation and operational durability/recovery proof remain HELD."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-025"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-034"
  - "T-E3-034"
implements:
  - "ADR-006 Decision 1 with Decisions 2, 3, 6 and 7; T-E3-034; C3.1"
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

# Durable product-state categories

## Scope and present proof

T-E3-034 lists durable categories, not physical stores or implementation. Runtime instances/functions/containers may disappear; their memory, health, HTTP result, queue delivery/emptiness and worker success are never canonical product truth. This list selects no schema, technology, account, retention duration, provider or credential and provisions no service. Completeness of the list is not completeness of live state, independent custody, restore or production authorization. T-E3-001-R1 remains REVIEW; physical activation and operational durability/recovery proof remain HELD.

E3 serves/verifies and owns end-to-end runtime-edge correctness. E5 retains identity/policy/grant/competence/session authority through its public contracts; E6 retains release/promotion/suspension gates through existing references. A stored reference, snapshot, receipt or old positive result does not grant current permission. This document introduces no cross-epic seam or formal contract catalog entry.

## Category list (ADR-006 Decision 1)

| Durable category | Meaning that must survive instance loss/restart | Authority and recovery boundary |
|---|---|---|
| Canonical domain identities and versions | Stable tenant/domain/object identity, relationships and canonical generation/version; immutable history/provenance is distinct from the current snapshot | One declared domain authority; cache/convenience copy/history is not current authority. Restore needs coherent manifests and current negatives. |
| Operation identity and immutable request fingerprint | Stable semantic operation/effect identity and tenant/actor/scope/payload binding across retry, lost response and replay | Same semantic retry reads the matching result; different payload/actor/scope is CONFLICT/HELD, never a new effect under the old key. |
| Operation acceptance, status and reconciliation | Accepted versus queued/submitted versus proven effect, canonical result and OUTCOME_UNKNOWN/PARTIAL/RECONCILING with retained work | Lost response/lease does not prove failure or success. Authorized canonical lookup resolves uncertainty; queue state cannot substitute. |
| Authorization/policy/grant/competence references | Current actor/workload/issuer/session/assurance/step-up, role/grant/delegation/competence/independence/policy scope and versions bound to the intended action/object | E5 remains decision authority; durable references/old claims never replace commit-time current reads. Do not turn an export or restored session into reusable access. |
| Epoch and runtime/generation compatibility references | Current epoch plus object/release/schema/config/package/client/message/runtime generations and applicable compatibility references | Recheck every applicable consumer edge; old runtimes, cached clients or restored configurations cannot clear newer revocations or holds. |
| Protected audit precondition/receipts and ordered floor | Stable link between operation/intended effect, required protected audit readiness/receipt, integrity and ordered audit/floor evidence | Audit receipt is not an effect receipt or future authority. Ordinary DB copy is not independent protected custody; unavailable audit holds affected positive effects. |
| Deterministic outbox/effect and queue intent | Canonical acceptance-bound intended effect, deterministic effect key, operation binding and durable pending dispatch/reconciliation state | Narrow DB core differs from object/notification/queue/scanner/AI/external effect. Commit or delivery cannot prove external completion; idempotent protocols and current checks remain required. |
| Worker lease/heartbeat/checkpoint and retained backlog references | Durable job/effect identity, fenced lease generation, checkpoint/progress, retry/cancel/drain/quarantine/reconciliation references needed to resume or contain accepted work | These are long-job protocol requirements by ADR-006 Decision 5, not selected limits/products or implemented stores. Expiry yields uncertainty/partial reconciliation, never blind success/replay. |
| Object/package manifest, lineage and classification | Exact byte/version/digest identity; parent/transitive lineage, owner/classification, retention meaning, generation and current negative-floor references | Manifest does not substitute for available verified bytes. Scanner/derivative/export output never auto-activates. Missing/mixed/tampered objects remain quarantined or partial. |
| Release and suspension floors | Ordered constraints on allowed release/activation and emergency/current suspension | Current applicable E6 authority remains; an older release/positive configuration cannot override equal/newer negatives. |
| Recall, revoke, deletion and eligibility floors | Ordered negative constraints across user/session/grant/object/package/runtime/recovery scopes | Equal-or-newer negative wins; unknown/missing/tie holds effects. Downloaded copies cannot honestly be guaranteed retracted. |
| Accepted-operation and migration floors | Durable bounds preventing replay of already accepted operations, incompatible migration/data resurrection or rollback of current negative history | Old queues, accepted-operation snapshots, restored DB or binary rollback cannot reopen an already fenced effect or lower a migration floor. |

The rows preserve every Decision-1 category and spell out related compatibility/long-job/negative duties; they do not claim each logical item is a distinct physical table or service. Protection scope covers canonical versions, stable operation/fingerprint/status, authorization/policy/grant/competence/epoch references, audit receipts and ordered floor, deterministic outbox/queue/effect intent, object/package manifests and all release/suspension/recall/deletion/accepted-operation/migration floors. Decision-6 revocation and eligibility floors are explicitly retained.

## Required evidence fields for later stores

Later implementation records each category's exact logical authority/public contract, scoped physical binding, stable identity/version/digest where applicable, current negative/epoch ordering, tenant/privacy/classification, immutable links to accepted operations and effect/audit/manifests, technical resolver, independent custody/recovery plane, coherent export/import/restore impact, actual tests and remaining HELD reasons. References contain no credentials or reusable session tokens. Retention/legal deletion rules and numeric schedules require their own authority; this list invents none.

Do not combine distinct authority planes merely because one database can store convenience copies. Canonical DB, object bytes, protected audit and current negative floors need their own actual recovery/custody proof; a DB backup alone cannot close it. Coherent cross-plane and identity/policy/config/schema/package manifests must reconcile accepted/uncertain work before quarantined recovery can reopen. Missing authoritative state is uncertainty, not an invented default ALLOW or completed result.

## Related tasks and document rejection cases

T-E3-001-R1 covers current commit authorization; T-E3-003/004 operation identity/result lookup; T-E3-005/005b states; T-E3-009/010 domain/history; T-E3-011/012 object lineage/quarantine; T-E3-019..022 long jobs; T-E3-023/024a/024b/025 negative floors/epoch/non-retraction; T-E3-026..029 quarantine recovery/logical export; T-E3-035 core-versus-effect intent. These are contextual task references only, not dependencies or proof of completion. T-E3-032 environment/secret separation still lacks actual environment evidence; T-E3-033 cannot close before it. Neither is completed here.

Acceptance checks the category list only, without implementation. Reject omission of any Decision-1 category/floor, ephemeral memory as truth, receipt/queue success as an effect, copied identity as authority, restored negatives moving backward, mismatched manifests called complete, plaintext credential/token inventory, invented physical bindings or a green-CI claim of live durability/recovery. Existing runtime tests are regression evidence only; this document adds no test or implementation.

Related authority: `[[vault/PROFILES/domain-authority-registry.md]]`, `[[vault/PROFILES/history-provenance.md]]`, `[[vault/PROFILES/object-boundary.md]]`, `[[vault/PROFILES/backend-reversibility.md]]`. Pack: `[[vault/PACKS/P-E3-034.md]]`; task: `[[vault/REGISTRY/T-E3-034.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-025.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
