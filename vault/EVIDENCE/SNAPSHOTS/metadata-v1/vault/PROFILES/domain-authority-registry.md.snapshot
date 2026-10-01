---
profile_of: domain-authority-registry
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-001 Decision 1; T-E3-009; C3.2
supersedes: ~
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
