---
profile_of: platform-bom-inputs
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 cost paragraph; ADR-006 Decision 11; T-E3-015
supersedes: ~
record_id: D-APP-DOC-022
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/platform-bom-inputs.md.snapshot"
metadata_origin_digest: "609c36f5ebdd03516603eec218950d69871bfd60c6f039d2fda1bef3af834721"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "T-E3-015 supplies empty input slots for a later normalized bill of materials (BOM). It specifies what must be collected before comparing safe platform costs. It supplies no prices, quantities, monetary totals, budget thresholds, measured usage, classification decisions or spend approval. All financial and operational readiness in this template is HELD. Unknown cost is not zero or free."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-014"
  - "D-APP-DOC-024"
  - "E-DEV-019"
  - "E-DEV-023"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-015"
  - "T-E3-015"
implements:
  - "ADR-002 cost paragraph; ADR-006 Decision 11; T-E3-015"
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

# Platform cost inputs template

## Scope and present state

T-E3-015 supplies empty input slots for a later normalized bill of materials (BOM). It specifies what must be collected before comparing safe platform costs. It supplies no prices, quantities, monetary totals, budget thresholds, measured usage, classification decisions or spend approval. All financial and operational readiness in this template is HELD. Unknown cost is not zero or free.

ADR-002 remains the approved reversible working direction; this template selects no provider, account, region, plan, runtime or subscription and does not provision anything. Old headline prices and free-tier claims cannot fill these slots without current evidence. T-E3-030 owns the later classified cost skeleton and T-E3-031 the detailed hold/owner-visible behavior. Neither task is completed here. T-E3-001-R1 remains REVIEW and physical activation remains HELD.

## Scenario sheets to fill later

Create a separate sheet using the same fields and cost rows for each scenario below. Compare any candidate on the same capability scope, workload assumptions, assurance, support and recovery duties. Scale bands remain symbolic until separately authorized evidence supplies quantities. Keep recurring, one-off, incident and drill costs distinct; scenario totals cannot be silently combined into a normal-month total.

| Required scenario | Scope inputs to collect | Current inputs / readiness |
|---|---|---|
| Minimum-safe closed test | Participants and data sensitivity; test capabilities; required independent audit/floor/object custody, support and recovery even during a trial. | UNFILLED / HELD |
| Minimum-safe Android production | Enabled capabilities, retention, workloads, owner support and full mandatory assurance. | UNFILLED / HELD |
| Later scale bands | Named band, comparable workload drivers, growth assumptions and evidence for a scale trigger. | UNFILLED / HELD |
| Incident month | Failure scope, continued safe storage, extra compute/egress, reconciliation, external support and retained data. | UNFILLED / HELD |
| Restore drill | Cross-plane DB/object/audit/floor restore, isolated target, validation, support and cleanup obligations. | UNFILLED / HELD |
| Exit drill | Export, transfer, clean-room import, overlap of source/target, custody, compatibility validation and technical handoff. | UNFILLED / HELD |

### Blank scenario header

| Field | Slot |
|---|---|
| Scenario name; capability and candidate references | UNFILLED |
| Environment; data classes; retention and generation scope | UNFILLED |
| Comparable workload assumptions and their source/date | UNFILLED |
| Recurring / one-off / incident / drill treatment | UNFILLED |
| Technical preparer; external support/custody actor | UNFILLED |
| Collection date; evidence validity/recheck condition | UNFILLED |
| Complete mandatory assurance and recovery references | UNFILLED |
| Owner-readable risk, retained data and reversibility summary | UNFILLED |
| Independent verdict and owner budget authorization reference | UNFILLED |
| Scenario readiness | HELD |

## Repeated row template

Repeat this row structure for every applicable cost family in every scenario. Unused rows need an evidence-backed applicability explanation; silence is not exclusion. Shared charges require allocation references so costs are neither omitted nor counted twice.

| Field | Slot / collection rule |
|---|---|
| Cost family; capability served; scenario reference | UNFILLED |
| Service/account/region/plan candidate reference | UNFILLED; reference only, no selection or credentials |
| Charge type and billing unit | UNFILLED; recurring, one-off, usage, support or human work |
| Usage driver and estimation source/date | UNFILLED; no measured or assumed quantities supplied here |
| Current official price source, effective date and exclusions | UNFILLED; later collection must verify current terms |
| Currency; taxes; exchange-rate source/date and treatment | UNFILLED |
| Included quota/free allowance, expiry, overage and billing failure conditions | UNFILLED; an allowance never proves mandatory assurance |
| Independent custody/account, egress and recovery dependencies | UNFILLED |
| Technical labor, external support, account/legal duties | UNFILLED; do not assume the owner performs debugging |
| Classification and reason/evidence | UNFILLED; later choose mandatory / deferrable / optional / scale-triggered |
| Deferral or scale trigger; affected capability; assurance impact | UNFILLED; absence of a price cannot justify deferring a safeguard |
| Allocation/shared-cost references and uncertainty | UNFILLED |
| Recurring amount; one-off amount; incident/drill amount | UNFILLED; not zero, not an estimate |
| Budget envelope, spend cap and explicit owner authorization reference | UNFILLED; this document grants none |
| Stop/hold response and technical resolver | UNFILLED; required assurance cannot be weakened to fit budget |
| Independent verification reference; closure state | UNFILLED / HELD |

## Cost-family coverage slots

The classification column is deliberately empty. The later classification must explain capability dependence and preserve ADR safeguards; calling a row optional or deferrable cannot remove mandatory API authority, protected audit/floors, independent object recovery or safe recovery/support. A scale-triggered row must identify its trigger without inventing thresholds in this task.

| Family | Required coverage when collecting inputs | Classification slot | Input state |
|---|---|---|---|
| API compute and canonical database | Ingress/decision/effect compute, database, connections, transfer and equivalent authority needs. | UNFILLED | HELD |
| Durable queue and workers | Long jobs, retries, reconciliation, retained work and outage handling. | UNFILLED | HELD |
| Protected audit, trusted floor and fallback | Independent custody, access, retention, reconciliation and outage fallback. | UNFILLED | HELD |
| Objects and independent backup | Originals/derivatives, retention, separate object custody, transfer and restore. DB backup does not cover these planes. | UNFILLED | HELD |
| Scanning and object safety | Quarantine, scanning/derivative work, failures, rechecks and disposal. | UNFILLED | HELD |
| Monitoring and observability | Detection, useful retained diagnostics and safe-stop visibility. | UNFILLED | HELD |
| Deployment, secrets and compatibility | Environments, rotation, version/policy/schema compatibility and controlled recovery. | UNFILLED | HELD |
| Accounts and provider support | Account/billing outage, independent access and necessary support obligations. | UNFILLED | HELD |
| DNS and notifications | Routing, delivery, failure handling and retained/reconciled notifications. | UNFILLED | HELD |
| Incident usage and response | Burst compute/storage/transfer, reconciliation and external technical response. | UNFILLED | HELD |
| Restore and exit drills | Cross-plane restoration, clean-room exit, overlapping services, verification and cleanup. | UNFILLED | HELD |
| External people and technical handoff | Operations/support/legal/account duties, availability and no-owner-debug recovery. | UNFILLED | HELD |
| AI operations | Bounded scope/credentials, dry runs, independent review, hard stops and support. | UNFILLED | HELD |

## Completeness and hold rules

Before a later paid decision, the technical preparer must account for every applicable family in all required scenarios, current evidence, taxes/FX/extras, recurring and exceptional totals, uncertainty, independent review and explicit owner-approved safe envelope. The owner receives plain-language outcomes, risks, costs, retained data and reversibility choices. No SQL, SSH, credential administration or log diagnosis is assigned to the owner.

Missing/stale price evidence, unexplained exclusions, unknown mandatory assurance/support, unsupported classifications or an absent budget decision leave readiness HELD. If minimum-safe recurring cost exceeds the approved envelope, hold the affected capability and revisit the ADR-002 direction through its existing gate. A cheaper headline or exhausted free allowance never authorizes removal of protection. No billing automation, metering, thresholds, purchase or runtime drain/hold implementation is added here.

## Document acceptance and negative checks

Acceptance of this task checks only the empty template: all required scenarios and families exist, classification/evidence/authorization slots exist, no prices or amounts are populated and scope limits are explicit. Reject a template that treats unknown as zero, substitutes DB backup for object/audit/floor recovery, omits incident/exit/support work, assumes owner debugging, selects a provider/paid plan or claims a budget/operational gate passed. Runtime CI is regression evidence only; it does not fill financial inputs.

Related preconditions: `[[vault/PROFILES/backend-reversibility.md]]`. Task pack: `[[vault/PACKS/P-E3-015.md]]`. State: `[[vault/REGISTRY/T-E3-015.md]]`. Evidence: `[[vault/EVIDENCE/E-DEV-019.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
