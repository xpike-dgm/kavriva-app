---
record_id: D-APP-DOC-003
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/templates/MANIFEST_TEMPLATE.md.snapshot"
metadata_origin_digest: "3cc44940f43fb78c125c417ce6fc275a76062ca9dad1297d44c278c7fded91eb"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Defined-by-reference: planning `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md` (capsule anatomy, 7 mandatory fields) + `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md` (conformance-test form). Full authoring belongs to the owning step; this stub reserves the address. Instantiated 10× in Step 2 (`modules/eXX-*/MANIFEST.md`)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
implements:
  - "ADR-015 Decision3 record registration"
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
supersedes: []
superseded_by: []
status: "RECORDED"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# Template stub — Module manifest

Defined-by-reference: planning `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md` (capsule anatomy, 7 mandatory fields)
+ `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md` (conformance-test form).
Full authoring belongs to the owning step; this stub reserves the address. Instantiated 10× in Step 2
(`modules/eXX-*/MANIFEST.md`).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
