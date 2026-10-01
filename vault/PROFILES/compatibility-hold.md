---
profile_of: compatibility-hold
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Decision 7; ADR-006 runtime compatibility rules; T-E3-018
supersedes: ~
record_id: D-APP-DOC-015
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/compatibility-hold.md.snapshot"
metadata_origin_digest: "2026af03133163820875b3a85e81896174cdcd170d05434099c78a6cca6d1421"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-018 defines how E3 records changes and holds affected capabilities before changed defaults reach production. It provides a dated journal and a review/closure procedure; it implements no watcher, automated runtime fence, upgrade, migration, deployment or production monitoring. All operational compatibility closure is currently HELD. T-E3-001-R1 remains REVIEW and physical activation remains HELD."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-016"
  - "D-APP-DOC-024"
  - "E-DEV-022"
  - "E3-COMPATIBILITY-CHANGELOG"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-018"
  - "T-E3-018"
implements:
  - "ADR-002 Decision 7; ADR-006 runtime compatibility rules; T-E3-018"
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

# Dated changelog and compatibility hold procedure

## Scope and present proof

T-E3-018 defines how E3 records changes and holds affected capabilities before changed defaults reach production. It provides a dated journal and a review/closure procedure; it implements no watcher, automated runtime fence, upgrade, migration, deployment or production monitoring. All operational compatibility closure is currently HELD. T-E3-001-R1 remains REVIEW and physical activation remains HELD.

E3 owns technical compatibility assessment and runtime enforcement requirements; E5 remains the identity decision authority and E6 retains release/promotion/suspension gates through existing references. A changelog entry, local CI green or provider health check never grants product authority or bypasses those gates. ADR-007 provenance/typed-release rules apply to later changes; this document creates no new seam, release authority or staging/production proof.

## Trigger and source coverage

Review changes to provider release notes/defaults, API behavior, grants/RLS/Storage ownership, Auth/key/session/cache behavior, database versions/extensions/poolers, runtime/SDK/toolchain/dependencies, build/actions, schemas/migrations/config/flags, objects/backup/audit/floor/recovery formats, workers/messages and external integrations. Include unannounced observed drift and policy/billing/account changes that affect safe operation. No numeric polling interval is selected and no automated monitoring is claimed.

The technical implementer checks official provider/dependency advisories and actual environment inventory before a planned version/config/schema change, release or activation, and on a discovered incident/drift. Scheduled monitoring, if later implemented, needs an explicit owner, coverage and failure evidence; this procedure does not establish it. Failure to fetch a source, missing actual versions or incomplete scope is uncertainty, not 'no change'.

## Changelog record schema

Each journal entry carries: local entry ID; observed/rechecked date; publisher date or explicitly unknown; exact primary URL or internal commit; change type and summary; declared vs actually measured versions/defaults; exact environment/component/capability and all consuming edges; classification/impact rationale; technical resolver; affected current tuple/schema/config/runtime/message/client generations and floors/audit/custody; operational hold with reason; retained work and owner-readable outcome; intended action and reversible limits; required positive/negative/recovery evidence; exact candidate artifact/head/version and check links; independent verdict and owner/E6 gate references as applicable; closure date/scope or remaining HELD reasons. Record references/digests, never credentials, user tokens, private payloads or raw startup logs.

Retain earlier entries and source dates. A changed assessment is a dated linked follow-up, not silent replacement of historical proof. No relevance or 'unaffected' conclusion is accepted from a headline alone: it needs a versioned inventory and an explicit capability/edge explanation with independent review. `[[vault/INVENTORIES/E3-COMPATIBILITY-CHANGELOG.md]]` contains the initial dated records and their honest limits.

## Procedure from detection to closure

| Stage | Required technical action and evidence | Operational rule |
|---|---|---|
| Detect and record | Fetch official source, preserve publication/observation dates and current declared/measured inventory; create a journal entry and identify resolver. | Unknown source/version/default or observed drift keeps affected activation/change HELD. No silent latest-version adoption. |
| Bound impact and hold | Enumerate consuming API/identity/object/worker/client/recovery paths and required safety properties. Identify retained work and exact generation/operation fences. Before changed behavior is used, request/apply the existing controlled capability/release hold through declared gates. | No positive effect or disclosure based on unverified compatibility; no automatic new runtime/flag/product selection. Future runtime enforcement still needs implementation proof. |
| Prepare candidate | Separate task/PR with exact inputs/artifact/head/config/schema/provider references, change-specific tests, dry run, migration and safe recovery plan. Verify custody, cost and independent support where affected. | Do not edit approved contracts silently, disable RLS/audit/floors or loosen scope to make the candidate pass. |
| Test same scope | Exercise positive guarded behavior and negative stale/cached/changed-authority, cross-tenant/direct-path, unavailable audit/floor, runtime mismatch and old message/client cases as applicable. Cover migration/partial failure and recovery, not just process startup. | Unchanged local CI gives regression evidence only; provider version/default coverage and excluded services must be explicit. |
| Independently review | Review exact candidate and evidence, close findings and record model/context/head/verdict. Owner accepts the identified verdict where DEC-0069 applies; E6 retains applicable release gates. | Implementer self-review, automatic T3 or owner acceptance without matching evidence cannot release the hold. |
| Controlled transition | Promote only the exact verified artifact/config through the existing environment/release protocol; re-read current floors/epochs/compatibility, fence old consumers and reconcile uncertain operations. | PR merge is not deployment; old health/receipt/queue success is not transition proof. |
| Close or retain hold | Verify actual target versions/defaults, every applicable consuming edge, operation outcomes and safe recovery; append dated closure evidence with exact scope. | Only proven affected scope can close. Partial, stale, conflicting or missing proof remains HELD; unrelated scope needs its own assessment. |

## In-flight changes, forced provider updates and recovery

If provider-controlled defaults change before verification, identify the last proven scope and contain affected positive effects/disclosures through authorized technical controls. Re-read current authority/floors and retain queued or pending work with its stable operation identity. A possible effect with lost response is OUTCOME_UNKNOWN until canonical lookup; do not blindly replay with a new identity. Old workers, cached processes, signing-key caches, object handles, migration runners and restored configurations cannot clear a current hold or newer negative floor. Downloaded copies remain honestly non-retractable.

For a security update, assess both the vulnerable current version and the candidate. 'Hold' must not mean silently keeping a known unsafe capability live. Use the existing controlled safe stop, isolate/disable affected access and escalate the recorded technical/support actor; do not invent a bypass or postpone mandatory safety to fit cost. Provider outage or unavailable version evidence preserves applicable HELD/OUTCOME_UNKNOWN/SERVICE_UNAVAILABLE status.

Rollback may restore only an independently verified compatible artifact/config within current epoch/floor/schema/message windows; never lower a floor, resurrect revoked credentials/grants or rewrite audit/history. A binary rollback does not reverse committed data migrations or external effects. Those require reviewed corrective/reconciliation protocols, cross-plane manifests and quarantined recovery. If safe rollback cannot be proven, hold the affected capability and keep current valid data; E6 decides applicable promotion/suspension, E3 verifies runtime edges.

The owner receives the affected feature, what stopped, retained work/data, risk/cost, technical resolver and approve/hold/stop/support choices in plain language. No SQL/SSH, manual secret changes or log/debug diagnosis is assigned to the owner.

## Closure checklist and rejection cases

Later operational closure requires all of: current dated source and measured target inventory; exact capability/edge/generation impact map; retained work and canonical reconciliation; immutable candidate references; applicable positive/negative/migration/recovery proof; protected audit/floor/custody and safe-cost/support evidence; independent verdict with findings closed; explicit owner acceptance and applicable E6 gate; target deployment/consumer verification and dated scope-specific closure. Missing items preserve HELD. This task supplies the checklist, not those live proofs.

Reject an assessment that calls a provider announcement deployed truth, calls 'latest' compatible, infers hosted minor versions from local config, ignores excluded services, promotes on green CI alone, silently treats a security hold as permission to use vulnerable software, rolls back negatives or asks the owner to debug. Document acceptance requires dated records and the hold-on-change procedure; no new executable tests are added for this document-only task.

Related rules: `[[vault/PROFILES/backend-reversibility.md]]`, `[[vault/PROFILES/rls-storage-defense.md]]`, `[[vault/PROFILES/secret-custody-rotation.md]]`. Pack: `[[vault/PACKS/P-E3-018.md]]`; task: `[[vault/REGISTRY/T-E3-018.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-022.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
