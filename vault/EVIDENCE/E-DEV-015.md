---
test_id: E-DEV-015
contract_id_version: "ADR-001 Decision 4; T-E3-011 object boundary v1"
subject_file: modules/e03-server/public/object_boundary.py
subject_digest: e00eb2f8e67624b1c7eb8ba1a096ccee6a5f9c9cd4cf7632233c83a1cb96e091
result: "RECORDED: 12 local object boundary tests passed; full checks, PR CI and independent review pending"
evidence_links:
  - "[[vault/PROFILES/object-boundary.md]]"
  - "[[vault/PACKS/P-E3-011.md]]"
  - "[[vault/REGISTRY/T-E3-011.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "RECORDED (independent review and owner acceptance pending)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-015 — Object boundary and classification propagation

Twelve local unit tests passed using unittest discovery for test_object_boundary.py. They cover all five classifications and eleven derivative kinds; original and derivative byte digests; direct and transitive lineage; shared ancestor deduplication; altered bytes, labels, owner and retention metadata; substituted sources and missing lineage; conflicting source versions, cycles and duplicate parents; mixed-policy holds; invalid metadata and immutable quarantined outputs. Verification against actual supplied parent bytes rejects consistent relabeling of a child's entire lineage. Child-only structural verification cannot authenticate its sources.

This is an executable in-memory envelope and integration contract. It does not implement source authentication, canonical current-source lookup, access/disclosure authority, physical object storage, transformations, global identity/version uniqueness, cryptographic custody or retention-policy resolution. Existing maintenance history convenience-copy dataclasses remain display metadata; materializing their bytes later requires this envelope and current E3/E5 authorization. All outputs remain OBJECT_QUARANTINE; activation is the separate T-E3-012 task. Physical domain activation remains HELD and T-E3-001-R1 remains REVIEW.

Full repository checks, final-head PR CI and independent gpt-5.6-luna max review will be recorded after execution. T-E3-011 remains REVIEW until the owner accepts the identified independent verdict under DEC-0069.
