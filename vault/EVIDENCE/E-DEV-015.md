---
test_id: E-DEV-015
contract_id_version: "ADR-001 Decision 4; T-E3-011 object boundary v1"
subject_file: modules/e03-server/public/object_boundary.py
subject_digest: e00eb2f8e67624b1c7eb8ba1a096ccee6a5f9c9cd4cf7632233c83a1cb96e091
result: "PASS for in-memory object contract at b9697b9: 80 E3 tests, 11 E10 checks, PR CI and independent review passed"
evidence_links:
  - "[[vault/PROFILES/object-boundary.md]]"
  - "[[vault/PACKS/P-E3-011.md]]"
  - "[[vault/REGISTRY/T-E3-011.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (in-memory object contract only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #17 code head b9697b94c7c193bdf5f13cd1169858f9bd985eae"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-015.md.snapshot"
metadata_origin_digest: "39ec202d614ae6fd16ca2ab644d31daeb42cba9dbec47db83f9626e633d1aef7"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for modules/e03-server/public/object_boundary.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-021"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-011"
  - "T-E3-011"
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
evidence: []
supersedes: []
superseded_by: []
metadata_verified_at: "2026-10-01"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-011.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/object-boundary.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-011.md.snapshot"
---

# E-DEV-015 — Object boundary and classification propagation

Twelve local unit tests passed using unittest discovery for test_object_boundary.py. They cover all five classifications and eleven derivative kinds; original and derivative byte digests; direct and transitive lineage; shared ancestor deduplication; altered bytes, labels, owner and retention metadata; substituted sources and missing lineage; conflicting source versions, cycles and duplicate parents; mixed-policy holds; invalid metadata and immutable quarantined outputs. Verification against actual supplied parent bytes rejects consistent relabeling of a child's entire lineage. Child-only structural verification cannot authenticate its sources.

This is an executable in-memory envelope and integration contract. It does not implement source authentication, canonical current-source lookup, access/disclosure authority, physical object storage, transformations, global identity/version uniqueness, cryptographic custody or retention-policy resolution. Existing maintenance history convenience-copy dataclasses remain display metadata; materializing their bytes later requires this envelope and current E3/E5 authorization. All outputs remain OBJECT_QUARANTINE; activation is the separate T-E3-012 task. Physical domain activation remains HELD and T-E3-001-R1 remains REVIEW.

All 11 local E10 checks and git diff --check passed. PR #17 code head b9697b94c7c193bdf5f13cd1169858f9bd985eae passed all 80 E3 tests in GitHub run 36870130573, including native PostgreSQL cases, and all applicable E5, architecture, live Auth and T3 checks. The label-triggered T3 run passed; the initial unlabeled run was skipped. Green automatic checks do not constitute the independent review.

An independent gpt-5.6-luna max subagent reviewed exact code head b9697b94c7c193bdf5f13cd1169858f9bd985eae and returned PASS with no blocking or substantive findings. It independently ran all twelve focused object tests, E10, py_compile and git diff --check, checked the normalized subject digest and verified exact-head GitHub CI. It confirmed the bounded acceptance and proof limits. Future integration must also bind child identity, generation and derivative kind to the canonical operation context; supplied manifests cannot establish those facts. Initial pending-results/reviewer-none bookkeeping is replaced by this record. The same reviewer returned PASS for metadata head 19da72ec0115b99438ac8333e5981c122659bbc0 and verified its final-head CI. On 2026-10-01 the owner explicitly accepted this identified independent verdict under DEC-0069. T-E3-011 is DONE for the in-memory object boundary and propagation contract only.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
