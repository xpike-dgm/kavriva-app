---
test_id: E-DEV-002
contract_id_version: authorization-tuple v1 + ADR-006 Decision 2; T-E3-001-R1 remediation
subject_digest: FEF471475D2B5D3EE8D444943AE605D71CDEC6B453F469A2C6C61B7B6464BE00
subject_file: vault/EVIDENCE/SNAPSHOTS/E-DEV-002-postgres_commit_authorization.py
gate_code_digest: C369E37035BDA35D08AC209DF6328F915824BE4B7635C8495CBD53ABBE8D47CE
gate_code_snapshot: vault/EVIDENCE/SNAPSHOTS/E-DEV-002-commit_authorization.py
result: "RECORDED (14 local tests passed; 7 unit plus 7 native PostgreSQL integration tests)"
evidence_links:
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "[[vault/PACKS/P-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/tests/test_commit_authorization.py"
  - "modules/e03-server/tests/test_postgres_commit_authorization.py"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-002-postgres_commit_authorization.py"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-002-commit_authorization.py"
  - ".github/workflows/e3-tests.yml"
gate_verdict: "BLOCKED (PR #3 remediation approved; production canonical-source binding required for T-E3-001)"
reviewer: "owner-supplied independent review of PR #3 head 7bc0d15d88f8ec10e93cf2063d12b71c37391ba2; approval limited to PR #2 rejection findings"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-002.md.snapshot"
metadata_origin_digest: "a5fb922ec7956e209eab1f49c1131b0018b4965e11df9de5dc39441dc968cfe1"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/EVIDENCE/SNAPSHOTS/E-DEV-002-postgres_commit_authorization.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-004"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R1"
  - "P-E3-001-R2"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-001.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-001-R1.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-001-R1.md.snapshot"
---

# E-DEV-002 — Review remediation evidence

The independent review rejected PR #2. This remediation adds `workload_id` and `delegation_chain` to required tuple fields and confirms that null values hold without an effect. It adds a psycopg adapter that reads the current tuple with `SELECT ... FOR UPDATE` and invokes a database effect writer on the same connection before commit.

Local integration tests use a temporary native PostgreSQL 17.9 server with a private-schema fixture. They verify that a concurrent authority update is observed after lock wait, a competing update cannot pass the held row lock, a writer error rolls back the effect, a successful effect commits, missing authority denies despite cached ALLOW, and missing workload/delegation holds. This proves the transaction mechanism on a real engine. The fixture does not prove that production E5 policy/session/grant/epoch sources or a product-domain mutation are wired; that remains a release-blocking integration requirement.

The prior PR #2 code and its original digest remain preserved by `[[vault/EVIDENCE/E-DEV-001.md]]` and its subject snapshot. On 2026-09-24, the owner supplied an independent review verdict for PR #3 head `43afb8cd9c4353d7e142295a871b173adf6065b7`: **approved for the corrections to PR #2's rejection findings only**. The review confirmed the two required tuple fields, the `FOR UPDATE` transaction adapter, the 7 unit and 7 native PostgreSQL tests, green architecture/T3 automation, and matching evidence digests. The reviewer explicitly withheld T-E3-001 DONE because the temporary test table is not connected to production E5 authorization sources or a real product mutation. This is a review verdict supplied in the task conversation, not a submitted GitHub PR review.

For the reviewed PR head, [architecture checks including the T3 automation](https://github.com/xpike-dgm/kavriva-app/actions/runs/35984766955) and [E3 PostgreSQL tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/35984766869) completed successfully on GitHub. CI and remediation approval do not prove production canonical-source binding. The implementation record remains CHANGES_REQUESTED; no DONE claim follows. The two original code files are preserved as snapshots because the later maintenance slice changes their live copies.

The owner supplied a second scoped independent verdict for PR #3 head `7bc0d15d88f8ec10e93cf2063d12b71c37391ba2` on 2026-09-24. It approved the three PR #2 rejection fixes after checking required tuple fields, the locked PostgreSQL read and same-transaction write, concurrency/rollback/commit tests, code digests and green CI. It again withheld T-E3-001 DONE because production E5 sources and a real product mutation are not bound. This verdict was supplied in the task conversation; it is not a submitted GitHub PR review. PR #3 subsequently merged as `d4e674a6c6101aedc5d1459e39d99e8fba0844e7`; that merge does not change the task verdict.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
