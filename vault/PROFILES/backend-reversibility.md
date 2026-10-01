---
profile_of: backend-reversibility
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Decisions 1 and 2 with mandatory safeguards and revisit triggers; T-E3-013; C3.3
supersedes: ~
record_id: D-APP-DOC-013
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/backend-reversibility.md.snapshot"
metadata_origin_digest: "d00d2050abbe3b3ad3db4167355467aef6c822e8192f3c05081e5a19099cf916"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-013 lists the evidence needed before a backend capability can be treated as safely reversible. It makes no new provider, runtime, account, region, plan, purchase, deployment or migration selection. ADR-002's approved reversible Supabase-centered direction and documented modular first fallback remain the decision authority. The fallback is not automatically selected or provisioned; its coordination and recovery burden must also be proven."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-011"
  - "D-APP-DOC-015"
  - "D-APP-DOC-016"
  - "D-APP-DOC-018"
  - "D-APP-DOC-022"
  - "D-APP-DOC-024"
  - "D-APP-DOC-025"
  - "E-DEV-017"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-013"
  - "T-E3-013"
implements:
  - "ADR-002 Decisions 1 and 2 with mandatory safeguards and revisit triggers; T-E3-013; C3.3"
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

# Backend reversibility preconditions

## Purpose and decision boundary

T-E3-013 lists the evidence needed before a backend capability can be treated as safely reversible. It makes no new provider, runtime, account, region, plan, purchase, deployment or migration selection. ADR-002's approved reversible Supabase-centered direction and documented modular first fallback remain the decision authority. The fallback is not automatically selected or provisioned; its coordination and recovery burden must also be proven.

This checklist is document scope. Every operational precondition below is currently HELD in this record: no live recovery, independent custody, clean-room exit, current cost or production authorization proof is supplied by writing the list. Existing narrow object/auth/maintenance code and isolated CI tests are inputs, not closure of these operational gates. T-E3-001-R1 remains REVIEW and physical domain activation remains HELD.

## Evidence rules

A later closure record must identify the exact capability, source/target manifests and generations, tool/runtime/provider versions, date, evidence links, technical resolver, independent verdict and applicable owner authorization. Evidence must include the negative/failure cases, not only a successful export or green check. Evidence and manifests carry references, never credentials, user tokens or raw private objects. Missing, stale, contradictory or partial evidence leaves the capability HELD; it does not lower a safeguard. This document contains no commands to execute and no production numeric limits.

## Preconditions checklist

| Item | Required condition | Evidence needed before operational closure | Technical resolver / controlled follow-up | Current operational status |
|---|---|---|---|---|
| 1. API authority | Sensitive reads and all high-consequence effects retain server mediation before and after exit; UI/JWT/cache/RLS/Studio state cannot replace current authority. | Equivalent source/target request and commit tests for actor/session/scope/classification, operation fingerprint, generations, floors, audit and runtime; stale/cached/changed-authority and direct-path negatives. | E3 runtime implementer; E5 public authorization surface only; T-E3-014 specifies enforcement needs. | HELD |
| 2. Object protection | Originals enter quarantine; derivative lineage, own-byte integrity, owner, classification and retention meaning survive movement. A scan/AI output/official label cannot activate or publish by itself. | Object-byte and metadata reconciliation; missing/tampered/mixed-source negatives; exact-version validation, current source/target permission and floor tests; quarantine/isolated-preview/public-path inventory before live use. | E3 object implementer; T-E3-011/T-E3-012 contracts are prerequisites, not live producer proof. | HELD |
| 3. Four independent recovery planes | Canonical database, object bytes, protected audit and negative floors have explicit recovery duties and custody sufficiently independent of the ordinary project/account. A DB backup alone proves none of the other planes. | Plane inventory; custody/access/recovery map; restore and normal-account outage/loss drills showing object/audit/floor availability and current authoritative floors cannot be overwritten by an old project snapshot. Independence must be tested, not inferred from four buckets under one credential. | E3 recovery implementer; E5 audit custodian through declared contracts; T-E3-026/T-E5-013 and floor work T-E3-023. | HELD |
| 4. Stable logical export | IDs, relationships, versions/generations, classification, lineage, history/provenance, pending work and accepted operation identity/fingerprints survive a logical export suitable for another account/provider. | Versioned export/import specification and reconciliation negatives for missing relationships, metadata, bytes, histories, operation IDs or accepted outcomes; no retry may duplicate an already accepted effect. Authentication identities/mappings and policy/config/schema/package compatibility are accounted for without exporting old live session authority or secrets as reusable grants. | E3 export implementer; identity mapping through E5 public contract; T-E3-028 specifies the format. | HELD |
| 5. Cross-plane coherent manifest | Recovery uses an explicit consistency manifest across DB, objects, audit and trusted floor plus identity/policy/config/schema/package references; gaps remain PARTIAL/RECONCILING or quarantine. | Exact manifest/generation/digest and relationship reconciliation; missing-plane, mixed-generation, orphan-object, unavailable-audit and uncertain-operation tests; no convenience copy silently fills authoritative gaps. Import remains quarantined until every applicable gate is proven. | E3 recovery implementer; T-E3-026/T-E3-027 and T-E3-029. | HELD |
| 6. Clean-room exit | Rebuild/import works outside the ordinary provider account with bounded automation and least-privilege access. Target assurance is measured against the same product negatives as the source. | Reproducible bootstrap and export/import drill in an independently accessible target; retained data, current authorization and anti-resurrection negatives; credential replacement and recovery/support handoff; source outage cannot remove the only usable recovery instructions or custody. | E3 exit implementer; T-E3-028 and later controlled transition package T-E3-036. | HELD |
| 7. Monotonic negatives and residual copies | Recall, suspension, revoke, deletion, eligibility and accepted-operation/migration floors survive restore/exit; equal-or-newer negatives win. Old sessions, queues, handles, releases or runtimes cannot revive authority. | Trusted current floor/epoch re-read and edge sweep across API, workers, handles, caches, packages, exports and migration. Restored data starts quarantined; valid newer data is preserved. Downloaded copies are explicitly non-retractable and residual disclosure is documented, never claimed remotely erased. | E3 end-to-end runtime owner; E4/E5/E6 through declared seams; T-E3-023/T-E3-024a/T-E3-024b/T-E3-025. | HELD |
| 8. Credentials and bypass control | Client roles have no general DB/object authority; provider administration is not product approval/audit/publication. AI access is scoped and carries no owner/billing/service-role/unrestricted SQL/global-object authority. | Role/credential custody and rotation/recovery inventory, per-environment separation, all table/view/function/RPC/Storage/URL/console bypass negatives, privileged-path containment and independent review; evidence never prints secrets. | E3 defense/runtime implementer; E5 identity authority; T-E3-016/T-E3-017/T-E3-032. | HELD |
| 9. Provider/account/billing outage | Outage or ambiguous response stops positive writes/publication safely and retains work for canonical reconciliation. Retry uses stable identity; loss of a response never proves failure. | Failure drills with owner-readable HELD/OUTCOME_UNKNOWN/SERVICE_UNAVAILABLE or applicable billing/account state, retained-data description, detection, resolver/support path and canonical lookup; no blind repeat or silent successful status. | E3 technical recovery operator; E6 gates by existing reference only; T-E3-031 and later job/recovery tasks. | HELD |
| 10. Compatibility hold | Provider defaults, dependencies, schemas, policy/config and runtime changes cannot silently weaken the boundary or exit protocol. | Dated changelog/version record, compatibility assessment, negative regression evidence and hold/resolution before affected changes reach production; recovery preserves current floors/newer valid data. | E3 compatibility implementer; T-E3-018; rollout authority remains E6. | HELD |
| 11. Safe total cost and support | Reversibility remains possible inside an explicitly owner-approved safe cost envelope, including mandatory independent recovery/custody and incident/exit work. A headline subscription/free tier is not the safe total. | Later normalized cost inputs for minimum-safe closed test, minimum-safe Android production, scale, incident month, restore drill and exit drill; API, objects/independent backups, protected audit/floors, scanning, monitoring, notifications, support and recovery duties included. Current prices/tax/FX and explicit budget approval must be obtained by that later task. | E3 cost/operator responsibility; T-E3-015/T-E3-030/T-E3-031. No prices, thresholds or cost-template implementation here. | HELD |
| 12. Coupling and fallback comparison | Provider-specific Auth/Storage/runtime dependencies have an explicit replaceable contract and exit mapping; fallback safety and billing/outage/key/support coordination are demonstrated. Source failure alone is not target success. | Coupling inventory, identical source/target capability classes, workloads, fault injection, object/audit/floor/recovery tests and normalized BOM; both mandatory assurance and no-owner-debug operation proven before any transition proposal. | E3 transition implementer; T-E3-036 evidence package under ADR-006 Decision 10. No automatic migration. | HELD |
| 13. No owner debugging | Operations/recovery does not require the product owner to run SQL/SSH, diagnose logs or repair infrastructure. Named technical resolver remains responsible even during account/provider failure. | Bounded AI runbook, independently reviewable execution/support/custody handoff and failure drill. Owner receives plain-language outcome, risk, cost, retained data, reversibility and approve/hold/stop/external-support choices; unavoidable legal/account ownership duties are explicit. | E3 technical operator; appropriate external account/legal/support actor named by the later scoped drill. | HELD |

## ADR-002 reversal triggers — complete coverage

These triggers require a controlled revisit of Option A and reopening the documented fallback through the same evidence gate. They do not themselves authorize a purchase, provider switch or migration. If neither candidate passes mandatory assurance, the affected capability stays HELD.

| Binding trigger | Covered items | Required response |
|---|---|---|
| 1. Sensitive/high-consequence flows cannot remain behind API. | 1, 8 | Hold affected effects; record failed boundary evidence and revisit. |
| 2. Minimum-safe recurring total exceeds approved envelope. | 11 | Hold unaffordable capability; prepare current cost/effect choices without weakening safeguards. |
| 3. Service-role/RLS/Storage/console bypass cannot be bounded/tested. | 8 | Hold affected path; independently review the bypass finding and alternative evidence. |
| 4. Old restore revives recall/revoke/delete/suspension/accepted operations. | 3, 7 | Quarantine recovery; reconcile with trusted current negative floors, not an old positive snapshot. |
| 5. Cross-plane restore manifest cannot pass. | 3, 5 | Retain explicit partial/quarantine state; name resolver and missing evidence. |
| 6. Stable export and outside-account clean-room import lose required negatives. | 4, 6, 7 | Hold exit/activation and fix or revisit on equivalent evidence. |
| 7. Outage/billing/incident recovery requires owner SQL/SSH/debug. | 9, 13 | Transfer diagnosis/recovery to a named technical resolver; revisit operability. |
| 8. Supabase-specific coupling makes exit materially less safe than fallback. | 4, 6, 12 | Compare same-scope safety/exit/coordination evidence; no automatic fallback win. |

## Closing a later operational item

The future evidence record carries: item and capability; source/target IDs and exact manifest/generation/version references; date and current-evidence limits; successful and negative drill links; custody/access/floor preservation; failed or partial effects and canonical reconciliation; technical resolver and support; actual cost/budget authorization where relevant; independent findings/closure and owner decision where required. Record status separately for each item. A checklist tick, document-level DONE, fixture PASS or all tasks DONE is never operational closure.

## Trace and handoff

`[[vault/PACKS/P-E3-013.md]]`, `[[vault/REGISTRY/T-E3-013.md]]` and `[[vault/EVIDENCE/E-DEV-017.md]]` track this document-only task. `[[modules/e03-server/MANIFEST.md]]` links the readiness rules; `[[vault/PROFILES/domain-authority-registry.md]]`, `[[vault/PROFILES/object-activation.md]]` and `[[vault/PROFILES/ai-task-scope.md]]` retain their narrower contracts. T-E3-014 owns detailed enforcement needs, T-E3-015 the BOM inputs template, T-E3-026 the actual import procedure and T-E3-036 the held transition package. This checklist does not pre-complete those tasks or introduce a new cross-epic runtime seam.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
