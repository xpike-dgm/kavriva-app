---
profile_of: domain-authority-registry
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-001 Decision 1; T-E3-009; C3.2
supersedes: ~
record_id: D-APP-DOC-017
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/domain-authority-registry.md.snapshot"
metadata_origin_digest: "4df526865cf615d4db66f2d8e4c809f736f8b65bed1d6b82daa8a8b9107264c0"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "`vault/REGISTRY/domain-authorities.json` is the reviewed, versioned logical assignment of one authority per domain. `modules/e03-server/public/domain_authority.py` validates and resolves this metadata; it does not query canonical product state, grant access, or activate a physical database. Product reads and mutations still use the current E3/E5 authorization boundary. A returned binding is metadata, never an ALLOW decision."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by: [D-APP-DOC-013, D-APP-DOC-018, D-APP-DOC-019, D-APP-DOC-021, E-DEV-013, I-E10-REGISTRATION-BASELINE, M-E3-001, P-E3-009, T-E3-009, I-E10-PATHS-001, V-E10-TOPO-001, P-E10-006, E-DEV-033]
implements:
  - "ADR-001 Decision 1; T-E3-009; C3.2"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks: [T-E10-001, T-E10-006]
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

# Logical domain authority registry

`vault/REGISTRY/domain-authorities.json` is the reviewed, versioned logical assignment of one authority per domain. `modules/e03-server/public/domain_authority.py` validates and resolves this metadata; it does not query canonical product state, grant access, or activate a physical database. Product reads and mutations still use the current E3/E5 authorization boundary. A returned binding is metadata, never an ALLOW decision.

| Domain | Stable authority identity | Decision/content owner | Meaning |
| --- | --- | --- | --- |
| approved_facts | kavriva.authority.approved_facts | E3 | Current approved facts and relationships; publication eligibility is separate |
| user_records | kavriva.authority.user_records | E3 | Current user records, including motorcycles and maintenance; corrections do not erase history |
| permissions | kavriva.authority.permissions | E5 | Current identity, session, grant and policy authority, served through E3 |
| domain_history | kavriva.authority.domain_history | E3 | Provenance, superseded/disputed revisions and supporting sources; not current permission truth |
| protected_audit | kavriva.authority.protected_audit | E5 | Protected event custody; neither provider logs nor domain history substitute |
| publishing_control | kavriva.authority.publishing_control | E6 | Exact reviewed release eligibility, suspension and recall generations, served through E3 |
| objects | kavriva.authority.objects | E3 | Object identity/metadata boundary; bytes enter quarantine and do not authorize publication |
| phone_packages | kavriva.authority.phone_packages | E3 | Canonical package identity/manifest source; E4 composes, verifies and stores bounded client copies |

This is an initial taxonomy derived from ADR-001 and existing E3/E4/E5/E6 manifests, not a claim of implemented data stores. Distinct logical authorities may share a physical database; splitting databases is not required. The ACTIVE state means the logical assignment is registered. Every physical_activation value is HELD: no hosted source, release gate, audit custody or package issuer is activated by this registry. Existing narrow maintenance/auth code is not proof of complete domain implementation.

## Version and change rules

- Each domain and authority keeps its stable identity. The registry version starts at 1; authority revisions start at 1. These are schema sequence identifiers, not time or cost policy thresholds.
- Create: introduce an initial reviewed domain assignment from the approved architecture. This snapshot contains all eight domains; an unknown/additional domain, changed owner or identity requires a controlled contract revision and independent boundary review.
- Read: resolve an exact domain with the expected registry version and authority revision. Unknown, held, ambiguous, stale or malformed records return a stable failure reason; there is no fallback to cache or UI state.
- Update: publish a successor snapshot through PR, green CI and review. Its version must be the predecessor plus one, supersedes_digest must equal the predecessor's byte SHA-256, and only changed entries advance one revision. Run validate_successor against the reviewed predecessor. Preserve predecessor snapshots in Git history; do not rewrite them.
- Delete/retire: hold the logical domain with a new revision; do not remove its identity or erase prior versions. Held domains cannot resolve as active. Reactivation is another reviewed successor, not restoration of an old snapshot.
- This registry supports logical registration and hold changes. Physical source binding, source switch-over, data migrations, runtime deployment and security floors remain later implementation work; physical activation is rejected by this v1 loader.

`validate_successor` is a metadata validation function. It does not provide a database transaction, concurrent registry publication, runtime freshness, non-restorable floor, or product authorization. A later runtime integration must pin a reviewed snapshot and verify its current version rather than trust caller-supplied registry bytes.

## Copies and planes

Search, analytics, caches, notifications, package builders and client copies have no authority identity here. They may reference a canonical domain identity and revision but cannot resolve as the canonical source. A payload labeling itself canonical is still untrusted: this metadata check does not authenticate data or its origin. History, protected audit, current records, release eligibility, object metadata and package manifests keep distinct meanings. T-E3-010 handles their detailed provenance/convenience-copy rules; T-E3-011 handles derivative classification.

## Evidence

`[[vault/EVIDENCE/E-DEV-013.md]]` records the registry digest and executable validation. `[[vault/PACKS/P-E3-009.md]]` bounds this task. `[[vault/REGISTRY/T-E3-009.md]]` carries its review state. The E3 public contract is listed in `[[modules/e03-server/MANIFEST.md]]`; E5/E6 decide within existing seams and E4 consumes E3 package sources.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
