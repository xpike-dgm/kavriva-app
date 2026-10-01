---
test_id: E-DEV-014
contract_id_version: "ADR-001 Decisions 2 and 6; T-E3-010 maintenance history/copy representation v1"
subject_file: modules/e03-server/public/maintenance_provenance.py
subject_digest: d63c169d557d16ce3050702c2784936eb549d142bce2c888e12c5433c875a6b3
result: "PASS for separation/private-reader scope at fc3639b; E3 68 tests, E10 11 checks, PR CI and independent review passed"
evidence_links:
  - "[[vault/PROFILES/history-provenance.md]]"
  - "[[vault/PACKS/P-E3-010.md]]"
  - "[[vault/REGISTRY/T-E3-010.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
  - "[[vault/CONTRACTS/audit-event.md]]"
gate_verdict: "PASS (separation/private-reader scope only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #16 head fc3639b20966226c3ee6bbf4a1eac9cf0f0b2b21"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-014.md.snapshot"
metadata_origin_digest: "8af2750fb22188460cd2e7aae816779d042e8fd57c1661b869e6a9b6b4f8a4be"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for modules/e03-server/public/maintenance_provenance.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-019"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-010"
  - "T-E3-010"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/CONTRACTS/audit-event.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-010.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/history-provenance.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-010.md.snapshot"
---

# E-DEV-014 — History and convenience copies

Nine local unit tests verify head/history separation, all six copy kinds, no history/audit/copy substitution, missing/mixed generation rejection, required correction/operation/actor/time provenance, truthful USER_REPORTED evidence and immutable copies. Four new native PostgreSQL cases in the existing E3 suite verify real current/prior revision provenance, tenant scope/transaction requirement, stale-copy rejection after correction and parent locking against a mixed head. Existing tests prove append-only UPDATE/DELETE rejection. PR #16 head fc3639b20966226c3ee6bbf4a1eac9cf0f0b2b21 passed all 68 E3 tests in GitHub CI, including these native database cases, and all applicable E5, live-auth, architecture and T3 checks. All 11 local E10 checks and git diff --check pass.

An independent gpt-5.6-luna max subagent reviewed that exact head and returned PASS with no blocking or substantive findings. It independently ran all 68 E3 tests, including native PostgreSQL cases, in a temporary pinned-dependency environment and confirmed E10 and PR checks. Its bookkeeping request to replace the initial pending-results/reviewer-none text is closed by this record update. The same reviewer returned PASS for final metadata head 4da64e456ff5b6704bda19ed52466e166d202b83. On 2026-10-01 the owner explicitly accepted that identified verdict under DEC-0069. T-E3-010 is DONE for the separation contract and private maintenance reader scope only.

The profile covers all domain meanings; executable data-store coverage is maintenance only. The private reader requires already authorized trusted tenant context and is not exposed as an HTTP route. It does not authorize the caller, implement history pagination, authenticate a client-supplied snapshot, prove independent E5 audit custody, implement cross-domain source/dispute stores or activate hosted sources. Dataclass checks do not prevent trusted code from constructing new instances; future API consumers must obtain history through the canonical reader after current authorization. Registry physical activations remain HELD and T-E3-001-R1 remains REVIEW.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
