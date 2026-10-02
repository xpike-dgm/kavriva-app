---
record_id: V-E10-TOPO-001
version: 1
purpose: Define governed implementation addresses, record linkage and capsule path coverage
domain: project-execution
module: e10-graph
owner: E10
depends_on: [D-APP-DOC-003, V-E10-REL-001, V-E10-STRUCT-001, I-E10-PATHS-001]
used_by: [P-E10-006, T-E10-006, E-DEV-033]
implements: [ADR-015, C10.2, F10.2.1, R-001, R-002, R-004, R-010]
public_contracts: []
internal_scope: repository-topology-and-record-custody
tasks: [T-E10-006]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_orphans.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
evidence: [E-DEV-033]
supersedes: []
superseded_by: []
status: REVIEW
last_verified: 2026-10-02
---

# Repository topology and governed addresses v1

Record: `V-E10-TOPO-001`

## Binding source and scope

T-E10-006 acceptance is **Linkage, addresses, no-orphan rule, manifest coverage**, after T-E10-004 DONE/PR33 merge422235b. Sources: [ADR-015 Decision2](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), [reviewed bootstrap directory blueprint](https://github.com/xpike-dgm/motobakim-plan/blob/main/08_REPOSITORY_BOOTSTRAP/DIRECTORY_BLUEPRINT.md), `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`, `planning 07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md`, `planning 07_AI_ARCHITECTURE/RULES/README.md`; current template: `templates/MANIFEST_TEMPLATE.md`; relationship meanings: `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`; orphan oracle: `modules/e10-graph/STRUCTURAL_DETECTOR_SPEC.md`. Comparison pin: planningfa914f013fdcd032faed876689092da245989459, appbasef382812b32497f145076072b928202d031c82e56. URLs are navigation, not immutable proof.

One planning repository owns decisions/design/requirements. One application repository owns implementation/vault, linked by stable identities/qualified sources. The blueprint's reserved/HELD statements remain its historical bootstrap scope; current installed files and evidence govern actual present addresses. Neither an address nor a metadata frame is deployment/authority proof. No provider/runtime selection, new capsule/seam or physical move in this task.

## Governed address map

| Address | Actual custody/purpose and admission boundary |
|---|---|
| root README, .gitignore, .gitattributes | E10 repository landing/source-handling policy; root controls are implementation tooling, not product authority |
| .github/workflows | Installed CI definitions/specification, E10 delivery tooling; workflows do not replace independent review |
| modules/e01-app through modules/e10-graph | Exactly one governed capsule per epic, each actual MANIFEST and public/internal/tests addresses; empty reserved directories prove existence only |
| templates | Reusable authoring sources; manifest template is current complete form after preserved stub, contract/pack stubs retain their own actual scope |
| vault/REGISTRY | Physical task IDs explicitly supersede their frozen planning row; execution state is here, planning PROPOSED rows stay frozen |
| vault/PACKS | Versioned fourteen-field task context, mandatory sources/allowed paths/negative cases; a pack grants no runtime authority |
| vault/CONTRACTS | Stable typed contract records and provider/source/version references; consumed surface does not transfer ownership |
| vault/PROFILES | Scoped operating/security/recovery policy records, not evidence of live activation |
| vault/INVENTORIES | Source-address/custody inventories and pinned observations; no complete production claim from a path list |
| vault/EVIDENCE | Subject-bound execution/review proof; exact snapshots are historical payloads, not second active records or renamed IDs |
| vault/INDEX | Generated JSON views only, reproduce from authoritative records; no independent state/identity/permission source |
| supabase | Existing implementation configuration/migration addresses outside modules, linked to actual E3 manifest internal scope and recorded inventories; E5 authority migration retains its E5 subject ownership. Physical provider directory is not a new capsule or general client authority |

Root/platform/extra inventory/profile/snapshot addresses extend the installed blueprint through actual recorded Development artifacts. Their explicit mapping does not rewrite the original blueprint or assume they existed at bootstrap.

## Capsule coverage and constituent paths

Actual coverage receipt: `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. It enumerates every tracked base file and all implied parent directories, exact base bytes/catalog and each resolved documentary/module anchor. Ten actual capsule manifests retain seven anatomy headings and public/internal/tests directories. E3 manifest explicitly owns configuration/migrations/policies as internal implementation scope; an E5 migration under the shared platform directory is linked through its existing subject/source evidence rather than guessing ownership from its filename.

Small source files/folders resolve through their owning manifest, scoped path inventory and task evidence: no per-file bureaucratic identity required. Markdown record ownership/ID comes from its actual metadata and original product declarations, not its directory alone. Evidence archives receive E10 **payload custody**, not transfer of their subject's product owner. A private helper path cannot be used across capsules because it appears in this inventory; public contract permission remains separate. Generated files and placeholder directories carry explicit reasons, not an orphan exemption disguised as semantic proof.

## No-orphan admission and linkage

Every new/changed file or folder must resolve to at least one meaningful purpose/ownership/module/task anchor. Resolve its anchor to the governing source, not merely a basename/prefix/reference string. Missing/unresolvable/ambiguous ownership or source is MISSING/UNOWNED/CONFLICT/UNVERIFIED and nonpassing, never inferred from filenames. Private-only rooted capsule or a legitimately purpose-anchored root policy need not invent a dependency to avoid zero degree. Public ownerless contracts and tests/authority gaps still fail their applicable detector/gate even if paths are anchored.

The inventory supplies specific source pointers for this revision, not all semantic closure or a replacement ownership source. Require raw catalog equality/base pin, no missing file/directory rows, resolved anchors and truthful scope. Then validate applicable record metadata/identity, source links, capsule anatomy, subject-bound evidence and independent review. Existing check_orphans examines Markdown/prefix/reference heuristics only; its passing cannot establish all-file coverage. This task adds the actual tracked-path inventory/manual resolution receipt, without claiming a complete future automated semantic detector. Excluded untracked workstation output (.git state, caches, local virtualenv, credentials) is not committed truth; it is not proof that remote/runtime artifacts were inspected. No deployment/database/browser/provider query here.

## Identity, address changes and history

Addresses are locations; IDs are stable identities. A path move retains ID and updates inbound references/module/task/evidence under review. A true ID replacement uses reviewed supersedes/superseded_by and preserves both histories; routine version changes retain ID. New physical task rows explicitly map their exact planning row; do not copy or mutate planning state. Rebuild JSON views after registry changes rather than editing them by hand.

Evidence must still bind exact originally accepted bytes. Preserve the reviewed subject before source/consumer changes, retain old digests/verdict/head/date, and distinguish current custody metadata from old product verification. A fresh path inventory does not refresh old authorization/deployment/recovery evidence. No deletion/relabel/rehash of frozen126origin payloads or their catalog. Moving a private file to public is a surface/authority change requiring its own controlled scope, not mere address maintenance.

## Countercases and scoped change impact

| Countercase | Required result |
|---|---|
| New file added outside listed governed addresses without source/purpose/module/task anchor | Nonpassing orphan/address gap; declare source/impact before use |
| New nested folder excluded from inventory because parent is known | Reject incomplete coverage; enumerate implied folder and its real anchor |
| Platform migration treated as E10 product-owned because E10 stores its proof | Reject custody/subject ownership conflation |
| All ten manifests exist but a capsule lacks public/internal/tests or anatomy | FAIL coverage; template or filename is not instantiation proof |
| A filename moved/renamed and assigned an unrelated duplicate ID | Reject identity drift; preserve governed address change or actual reviewed lineage |
| Old evidence rehashed to new subject to claim unchanged approval | Reject; preserve original payload or obtain new scoped proof |
| Complete path table or all task DONE used to claim production/ten-layer closure | UNVERIFIED broader scope; actual runtime/release/product gates remain |

Topology/inventory v1: full registry impact is explicit new records and actual documentary consumers/task traces plus regenerated views. No source movement, bulk ownership rewrite, runtime/seam change or auto execution. Later topology changes need version/source/consumer impact, actual path/anchor verification, preserved history, independent review and applicable exact-head CI. Rollback preserves identities and earlier path/subject receipts, not discard history. No new owned runtime contract/ID replacement, hence empty public/lineage collections.

Task: `vault/REGISTRY/T-E10-006.md`; pack: `vault/PACKS/P-E10-006.md`; proof: `vault/EVIDENCE/E-DEV-033.md`. E3R1 REVIEW/E5 IN_PROGRESS/production-release-activation gates unchanged. Completion is bounded linkage/address/no-orphan/manifest coverage, not semantic product readiness.
