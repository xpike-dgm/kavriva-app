---
contract: task-pack
owner: E10
version: 1
status: PROPOSED
content_defined_by: planning CONTRACT_CATALOG.md row 8 (PACK_STANDARD.md 14 fields + F10.3.1, single truth — not copied here)
supersedes: ~
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/CONTRACTS/task-pack.md.snapshot"
metadata_origin_digest: "111c1e8ac59a17a3dd1574e10c87f1c7bbd4163b5b30119b123deb4365bc5ad5"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Minimum pack + registry states; manual-carry compatible. Contents live in the binding source above. used_by: [[modules/e10-graph/MANIFEST.md]] (enforced by the owner capsule per its manifest)"
domain: "project-records"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by: [I-E10-REGISTRATION-BASELINE, M-E10-001, D-APP-DOC-004, P-E10-007, E-DEV-034, V-E10-LIFE-001, P-E10-008, E-DEV-035, P-E10-009, E-DEV-036, P-E10-010, E-DEV-037, V-E10-SIM-001, P-E10-011a, E-DEV-038, V-E10-SIM-002, P-E10-011b, E-DEV-039, V-E10-EXCESS-001, P-E10-012, E-DEV-040, V-E10-DESIGN-001, P-E10-013, E-DEV-041, V-E10-DESIGN-EVID-001, P-E10-014, E-DEV-042, V-E10-REVIEW-001, P-E10-015, E-DEV-043, V-E10-PARALLEL-001, P-E10-016, E-DEV-044]
implements:
  - "planning CONTRACT_CATALOG.md row 8 (PACK_STANDARD.md 14 fields + F10.3.1, single truth — not copied here)"
public_contracts:
  - "task-pack"
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks: [T-E10-001, T-E10-007, T-E10-008, T-E10-009, T-E10-010, T-E10-011a, T-E10-011b, T-E10-012, T-E10-013, T-E10-014, T-E10-015, T-E10-016]
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

# Contract record — Task pack

Minimum pack + registry states; manual-carry compatible. Contents live in the binding source above.
used_by: [[modules/e10-graph/MANIFEST.md]] (enforced by the owner capsule per its manifest)

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
