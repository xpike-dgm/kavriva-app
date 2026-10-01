---
test_id: E-DEV-001
contract_id_version: authorization-tuple v1 + ADR-006 Decision 2
subject_digest: F7E46CB38F7026BC00A582300398AF64E1810996E3EA277AB9C599C2AAA29FB1
subject_file: vault/EVIDENCE/SNAPSHOTS/E-DEV-001-commit_authorization.py
result: "RECORDED (7 local unit tests passed; canonical database integration and production adapter unverified)"
evidence_links:
  - "[[vault/PACKS/P-E3-001-R1.md]]"
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "modules/e03-server/tests/test_commit_authorization.py"
  - ".github/workflows/e3-tests.yml"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-001-commit_authorization.py"
gate_verdict: "BLOCKED (real canonical transaction proof and different-chat T3 review required)"
reviewer: "none (different-chat T3 reviewer not yet assigned)"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-001.md.snapshot"
metadata_origin_digest: "24868ad4e09d1b505fe86442ad24d7033991dcccaaf543ec29dabc9a454398dd"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/EVIDENCE/SNAPSHOTS/E-DEV-001-commit_authorization.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-002"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R1"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-PR-001.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-001-R1.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-001-R1.md.snapshot"
---

# E-DEV-001 — T-E3-001-R1 implementation evidence

The E3 gate reads an authority tuple through a transaction interface and applies a canonical effect only after an ALLOW from that read. Unit tests cover a cached ALLOW with no canonical authority, stale session and scope, changed policy/object generation, negative floor, unavailable audit/runtime, denial/hold, missing fields and uncertain writes. They use a fake transaction and do not prove that a real database adapter performs the read, lock, decision and write atomically.

The result is a reviewable first implementation slice. Production authorization and task DONE remain BLOCKED until the canonical-store adapter, live transaction negative tests, and independent T3 review are evidenced. The old `[[vault/EVIDENCE/E-PR-001.md]]` remains the untouched bootstrap proof.

After PR #2 merged, the reviewed code was frozen at the subject path above. This preserves the original digest while the live module receives narrow remediation; the current implementation is evaluated by a separate evidence record.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
