---
profile_of: object-boundary
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-001 Decision 4; T-E3-011; C3.2
supersedes: ~
record_id: D-APP-DOC-021
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/object-boundary.md.snapshot"
metadata_origin_digest: "adc684957b2a6f57ae0ef22f167dab1518f10a44fe8dd19acd3c3732da0f6e19"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "`modules/e03-server/public/object_boundary.py` defines a provider-neutral in-memory object envelope and byte/metadata verification. `[[vault/PROFILES/domain-authority-registry.md]]` assigns the logical object authority to E3. An envelope contains stable object identity, positive generation, SHA-256 of its own bytes, classification, owner, state, retention-policy reference, derivative kind, exact direct-parent references and full transitive lineage. It has no storage URL or credentials."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-018"
  - "D-APP-DOC-020"
  - "E-DEV-015"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-011"
  - "T-E3-011"
implements:
  - "ADR-001 Decision 4; T-E3-011; C3.2"
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

# Object boundary and derivative classification

`modules/e03-server/public/object_boundary.py` defines a provider-neutral in-memory object envelope and byte/metadata verification. `[[vault/PROFILES/domain-authority-registry.md]]` assigns the logical object authority to E3. An envelope contains stable object identity, positive generation, SHA-256 of its own bytes, classification, owner, state, retention-policy reference, derivative kind, exact direct-parent references and full transitive lineage. It has no storage URL or credentials.

All originals and derivatives enter OBJECT_QUARANTINE. This task offers no activation function; even official classification or a passing digest does not approve, publish or authorize a file. T-E3-012 owns the next activation gate. Object integrity, semantic correctness, source authentication, malware safety, permissions and release eligibility are separate checks.

## Propagation contract

- A derivative has its own object identity/generation and recomputed byte digest, even when it is a byte-identical copy. Each source reference retains source identity, exact generation/digest, classification, owner and retention-policy reference. Direct-parent references preserve immediate edges; flattened lineage preserves every ancestor. Shared ancestors are deduplicated only when all source metadata matches exactly.
- Supported derivative categories are thumbnail, transcode, extraction, copy, export, backup, cache, search, analytics, notification and package. The contract does not implement the corresponding transformer, cache, export, backup or package service.
- Each derivative inherits its parents' exact classification, owner and retention-policy reference. The locked classification vocabulary is private/shared/community/official/security. These labels are not a rank; mixed source classifications, owners or retention policies are HELD until a separately approved merge/disclosure policy exists. This initial contract invents no hierarchy, declassification rule or numeric retention value.
- A changed payload fails the stored digest. Dropped, cyclic, duplicated or conflicting-version lineage fails validation. Re-verifying a derivative against the supplied verified parent bytes recomputes expected metadata rather than trusting child claims. Child-only structural verification is insufficient to prove the source relation.
- Copy/export/backup/cache descriptors retain the same protection meaning. A copy's source reference is provenance, never authority. Classification alone grants no access, and official classification is not correctness or approval proof. `[[vault/PROFILES/history-provenance.md]]` continues to govern domain history and rebuildable-copy meaning.

## Trusted integration boundary and limits

This is executable contract coverage, not a deployed object store. A future E3 adapter must obtain authorized canonical source bytes/metadata, verify current source generation and floors, validate both object and derivative against those parents, and persist the envelope with its bytes before an effect. Source freshness and source identity ownership cannot be established from caller-supplied dataclasses or matching hashes. Rewrapping bytes as a new original does not authorize disclosure or prove source origin. Object ID uniqueness across a store, generation transition history and cryptographic custody also remain external integration duties.

No HTTP upload, Storage policy, signed URL, credential, physical database, backup destination, transformation runner or cross-epic seam is introduced. Existing maintenance history convenience-copy representations are lineage/display metadata; they do not become object storage artifacts or authorized disclosures through this module. A future pipeline materializing them into files must use this envelope and current E3/E5 authorization. E5 protected audit and E6 release decisions are not implemented here.

Retention-policy references are opaque required identities: passing a reference does not prove the policy exists, is current, or permits an export. The caller must resolve that current policy before any live use. All registry physical activations remain HELD, and T-E3-001-R1 remains REVIEW. T-E3-012 must not treat structural/hash success as complete activation evidence.

## Evidence

`[[vault/PACKS/P-E3-011.md]]` bounds the implementation. `[[vault/EVIDENCE/E-DEV-015.md]]` records the module digest and actual byte/metadata negative tests. `[[vault/REGISTRY/T-E3-011.md]]` tracks review; `[[modules/e03-server/MANIFEST.md]]` declares the public contract.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
