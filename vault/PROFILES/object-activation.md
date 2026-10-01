---
profile_of: object-activation
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-001 Decision 4; ADR-006 Decisions 2 through 9; T-E3-012
supersedes: ~
record_id: D-APP-DOC-020
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/object-activation.md.snapshot"
metadata_origin_digest: "576eef2187e78812565ffd0fe2be30fea0d954eeca6b5ad6941384e965e1e014"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "`[[vault/PROFILES/object-boundary.md]]` remains the immutable quarantine intake/lineage contract. This profile adds an executable PostgreSQL gate that records an exact-version activation eligibility receipt. It does not serve the original, change its intake manifest into a publication state, publish a release, issue a URL or grant future access. An activation receipt is a past canonical gate decision; its existence never clears current revocation, deletion or release floors."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-011"
  - "D-APP-DOC-013"
  - "E-DEV-016"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-012"
  - "T-E3-012"
implements:
  - "ADR-001 Decision 4; ADR-006 Decisions 2 through 9; T-E3-012"
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

# Quarantine activation gate

`[[vault/PROFILES/object-boundary.md]]` remains the immutable quarantine intake/lineage contract. This profile adds an executable PostgreSQL gate that records an exact-version activation eligibility receipt. It does not serve the original, change its intake manifest into a publication state, publish a release, issue a URL or grant future access. An activation receipt is a past canonical gate decision; its existence never clears current revocation, deletion or release floors.

## Required checks and intent

- The server-written current validation policy requires integrity, source_provenance, content_safety, classification, retention and purpose_eligibility. Additional checks can be required; none of these baseline meanings can be omitted. Official-class objects also require separate technical_correctness evidence: official classification, a scanner, AI/OCR output or a matching digest is not correctness proof.
- Every required check has a named PASS and a nonempty receipt reference. Missing, duplicate, failed, held or unknown evidence stops activation. Receipt references are identities, not authenticated evidence by themselves. Trusted producers must resolve their issuer, actual check meaning, custody and continued validity before writing the canonical current-validation row. Policy/receipt producers are not implemented here and must not use client claims as their source.
- Evidence binds the complete immutable manifest fingerprint, including object identity/generation, own digest, classification, owner, retention reference, direct parents, full lineage, derivative kind and quarantine intake state. It also binds the current validation policy version. Changing metadata without changing bytes invalidates old evidence.
- The activation operation fingerprint binds actor/session/tenant/scope, exact object generation and manifest, action, immutable operation ID, purpose/reason, intended effect and both authorization and validation policy versions. Cached ALLOW is ignored. The current tuple must separately authorize that exact activation effect; a caller cannot mint authority by computing a fingerprint.

## Transaction and outcomes

`modules/e03-server/internal/postgres_object_activation.py` takes no validation evidence from the request. It locks and reads the tenant-scoped current object and all canonical current ancestors, verifies bytes/metadata/lineage against those sources, invokes a required same-connection current-authority reader, and locks the canonical validation policy/evidence row. The reader must retain current E3/E5/operation/floor/audit/runtime locks through commit. Bare ALLOW or an absent reader is HELD. Unknown or changed sources, mismatched classification, stale policy, negative floors, unavailable audit and incompatible runtime cannot record activation.

Derivatives additionally require a same-connection source authority/floor reader for every transitive ancestor. Each typed SourceFence binds the tenant, operation and exact source reference to current permission and a clear negative floor with policy/floor references. Missing, unbound, revoked or negative source context is HELD even when source bytes are unchanged. This reader must retain those source authority/floor locks through commit. No default source ALLOW or source reader is installed; production producer/floor validity remains an integration duty.

Only after all gates pass does the same database transaction append the activation eligibility receipt with the exact manifest/policy, validation receipts and audit reference. These receipts reject UPDATE and DELETE; they are not the independent protected audit store. Stable operation locking serializes retries: the same fingerprint returns the existing receipt read-only after current authorization/source checks; a conflicting fingerprint is rejected. A replay does not run a new activation or claim that old validation remains current. Every later byte use requires fresh source/version/floor/authorization and applicable release validation.

The receipt also binds the exact checked source fences; it is still historical evidence, never a future source permission grant.

Failure before the write yields HELD or a reason-coded DENY. Failure after a write attempt yields OUTCOME_UNKNOWN; use canonical tenant/operation lookup before any retry. The tests prove rollback for a rejected insert. Connection loss at commit cannot be assumed to mean rollback. This module does not expose a status HTTP API; any future lookup must have current authorization and tenant/actor-safe disclosure. Scanner/transformer/HTTP work runs outside this short transaction through later bounded job protocols. No numeric timeout/lease or retention policy is invented.

## Storage and activation limits

`modules/e03-server/internal/object_activation_store.sql` is an unapplied adapter schema exercised in isolated native PostgreSQL tests. PUBLIC has no schema/table/function access. No existing Supabase migration, role, credential, hosted bucket, signed URL or production database is changed. Production privilege provisioning and bypass inventory remain required before deployment; a PostgreSQL owner/superuser can bypass ordinary application controls and must never be a client/runtime credential.

The current-authority reader, validation policy/evidence writers, provenance/correctness/retention/scanner producers and protected audit/floor/runtime sources are fixture-bound in this proof, not production-connected. No upload, isolated human preview, malware engine, asynchronous worker, serving API or publication path is introduced. The logical domain registry stays physically HELD and T-E3-001-R1 remains REVIEW. T-E3-012 acceptance here is the executable fail-closed activation gate and real transactional adapter proof; it does not prove live file activation or independently valid evidence producers.

## Trace

`[[vault/PACKS/P-E3-012.md]]`, `[[vault/REGISTRY/T-E3-012.md]]` and `[[vault/EVIDENCE/E-DEV-016.md]]` bound and prove this task; `[[modules/e03-server/MANIFEST.md]]` declares its public policy contract. Existing object-boundary code and evidence remain unchanged.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
