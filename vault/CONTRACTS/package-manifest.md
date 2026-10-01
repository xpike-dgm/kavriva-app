---
contract: package-manifest
owner: E4
version: 1
status: PROPOSED
content_defined_by: planning CONTRACT_CATALOG.md row 4 (ADR-009 R1/R2 + F4.1.1/F4.2.1, single truth — not copied here)
supersedes: ~
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/CONTRACTS/package-manifest.md.snapshot"
metadata_origin_digest: "5c3d261f1a9d43e3d0420efa448c9eaf1b39806cafaa158ec048cb89117c7ee1"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Verified compact core + nested safety media; size shown upfront. Contents live in the binding source above. used_by: [[modules/e01-app/MANIFEST.md]] (declared consumption; single truth in that manifest)"
domain: "project-records"
module: "e04-offline"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E1-001"
implements:
  - "planning CONTRACT_CATALOG.md row 4 (ADR-009 R1/R2 + F4.1.1/F4.2.1, single truth — not copied here)"
public_contracts:
  - "package-manifest"
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

# Contract record — Package manifest

Verified compact core + nested safety media; size shown upfront. Contents live in the binding source above.
used_by: [[modules/e01-app/MANIFEST.md]] (declared consumption; single truth in that manifest)

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
