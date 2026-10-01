---
profile_of: history-provenance
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-001 Decisions 2 and 6; T-E3-010; C3.2
supersedes: ~
record_id: D-APP-DOC-019
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/history-provenance.md.snapshot"
metadata_origin_digest: "129e56685c70f8e95db3bec1257c1838b47dce00bc2a530037e1e6f2fa2913de"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "`[[vault/PROFILES/domain-authority-registry.md]]` names logical authorities. This profile defines the distinct meanings of current state, domain history, protected audit and convenience copies. Their identities and version links may connect them; their meanings cannot be substituted."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-018"
  - "D-APP-DOC-021"
  - "E-DEV-014"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-010"
  - "T-E3-010"
implements:
  - "ADR-001 Decisions 2 and 6; T-E3-010; C3.2"
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

# History, provenance and convenience-copy separation

`[[vault/PROFILES/domain-authority-registry.md]]` names logical authorities. This profile defines the distinct meanings of current state, domain history, protected audit and convenience copies. Their identities and version links may connect them; their meanings cannot be substituted.

| Representation | Meaning | Allowed use | Forbidden substitution |
| --- | --- | --- | --- |
| Canonical current record | Current generation selected from its canonical parent | Read after current E3/E5 authorization; use current generation in guarded changes | UI/cache/history cannot choose the head or grant permission |
| Domain history/provenance | Who changed what, when, by which operation and why; supporting source/revision references and superseded/disputed meaning | Explain changes and preserve previous assertions with their evidence level | Not current permissions, verified completion, approval, release eligibility or protected audit |
| Protected audit | E5-owned event custody and investigation chain under ADR-005 | Authorized audit/investigation through E5 contract | Domain history, provider logs, analytics and copies cannot supply an audit receipt |
| Convenience copy | Rebuildable search, analytics, cache, notification, package-builder or client representation | Bounded display/search with explicit source identity and source generation | Never current authority, grant, approval, publication, recall, audit or correctness proof |

The rule applies to all ADR-001 domains. Official fact/source/dispute semantics remain governed by their authoring and review contracts; no generic history token upgrades an assertion into an official fact. Corrections append a new revision rather than overwriting an old one. A disagreement is retained for its resolver; timestamp, search rank or copy freshness cannot silently choose a winner. A revision's evidence level must remain truthful. Classification, digest and derivative propagation implementation belongs to T-E3-011, not this task.

## Executable maintenance scope

`modules/e03-server/public/maintenance_provenance.py` exposes immutable maintenance revision, history snapshot and convenience-copy representations. The current selection function accepts only the history snapshot representation and verifies its head and complete ordered revision sequence. History rows, copies and arbitrary dictionaries are rejected with NON_CANONICAL_SOURCE. A copy retains source tenant/record/motorcycle/generation and source authority lineage; that pointer is not the copy's own authority. Copies cannot be promoted by the factory into a current or protected-audit representation.

`modules/e03-server/internal/maintenance_history.py` reads the private canonical maintenance tables only, using the same transaction for the head and ordered revisions. A SHARE lock on the current parent prevents concurrent correction from mixing an old head with newer revisions. It scopes both queries by trusted tenant and record, requires a transaction and has no cache fallback. Missing or mixed/incomplete history fails rather than returning a guessed current value. Existing append-only PostgreSQL triggers reject revision UPDATE/DELETE; existing guarded corrections retain old outcomes and USER_REPORTED meaning.

The private reader is not an API entry point. A future consumer must authorize the sensitive read with current E3/E5 context before calling it and derive tenant from that context. This task exposes no new HTTP route, grants no database privilege and does not ship a production history service. No new cross-epic seam is introduced; E1 rendering and E5 authorization remain the declared boundaries.

Python dataclass type checks prevent accidental representation substitution; they are not cryptographic source authentication. A trusted process can directly construct or rewrap these types. Product use must consume the canonical reader, never deserialize a caller-selected HistorySnapshot. Even a canonical snapshot is a transaction-time data observation, not standing authority or proof of freshness after its transaction. Copies remain non-authoritative even when their payload matches canonical bytes; copying again cannot renew their source generation.

## Copy lifecycle and stop rules

- Build a copy only from a permitted canonical read. Minimize payload and preserve source reference/version, evidence meaning and applicable disclosure rules. This factory demonstrates lineage, not permission or full derivative classification.
- Rebuild or invalidate after a source change. An old copy can be shown only with honest stale/version meaning where the domain policy permits it; sensitive decisions always re-read canonical current authority. Copy deletion is not domain/history/audit deletion.
- A cache miss, outage, missing revision, unknown source or conflicting head never falls back to cached ALLOW, a history row, provider log or AI assertion. Hold the sensitive action with its reason and canonical reconciliation path.
- Protected audit and source/domain history have separate retention and rights duties. No pruning, account-deletion, legal retention or audit-custody activation is introduced. Those tasks must preserve their controlled evidence and superseding rules.

## Evidence and future boundaries

`[[vault/EVIDENCE/E-DEV-014.md]]` records representation negatives and real PostgreSQL maintenance read/history tests in CI. `[[vault/PACKS/P-E3-010.md]]` bounds the changes; `[[vault/REGISTRY/T-E3-010.md]]` records review. Cross-domain production stores, independent audit custody, source authenticity, classification propagation, bounded history pagination and client cache/rebuild services are not proved here. All logical registry physical activations remain HELD; T-E3-001-R1 remains REVIEW.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
