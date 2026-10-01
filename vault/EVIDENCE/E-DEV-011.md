---
test_id: E-DEV-011
contract_id_version: "ADR-006 Decision 9; T-E3-007 direct-path bypass negatives"
subject_file: modules/e03-server/tests/verify_local_direct_paths.py
subject_digest: E907E1B376F6F729D3B350390ADFBED50331090626DB3CD171E71150763AFD6F
native_test_digest: 7122DC9321681C75B3F475022F31C8875F8FC1F0721D783B57028A53AB5F6BE9
result: "RECORDED (42 local E3 tests; PR-head CI green; independent PASS for generic-client negatives only)"
evidence_links:
  - "[[vault/PACKS/P-E3-007.md]]"
  - "[[vault/REGISTRY/T-E3-007.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]"
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
gate_verdict: "PASS (owner accepted T-E3-007 client-path negative suite only; no production activation)"
reviewer: "independent gpt-5.6-luna max sub-agent /root/pr13_independent_review; code head 355e6bd306079f2be9a60993d6c7ef5d425be98e and evidence head 3f7675a919d5141ddc0ec0626b70d1f384b976bb PASS; owner accepted 2026-10-01"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-011.md.snapshot"
metadata_origin_digest: "35cbd00730a26c5c2e59afe7568b902970ecd9399c06f18823270deac860ace7"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for modules/e03-server/tests/verify_local_direct_paths.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-010"
  - "E-DEV-020"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-007"
  - "T-E3-007"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-007.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/authorization-tuple-browser.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-007.md.snapshot"
---

# E-DEV-011 — Direct-path bypass negatives

The native PostgreSQL suite adds a second actor's motorcycle and operation-lookup probes. An actual committed operation is indistinguishable to the other actor from an unknown operation ID. SQL sessions restricted to `anon` and `authenticated` fail when reading E3/E5/audit data or inserting an E3 maintenance row. The full local 42-test E3 suite passed on Python 3.12 and embedded PostgreSQL on 2026-10-01.

The CI-only Supabase probe uses two real local Auth users and a server-created private bucket containing actual bytes. It proves the server can read the object, then checks anonymous and both ordinary users on direct private/public downloads, image transformation, signed-URL issuance, upload and delete. List results may be denied or empty, but must not reveal an object path. Direct Data API requests with a client-selected private schema fail. Its fixture service key is read only from the CLI's temporary status JSON and never printed or committed. The first [local-stack CI run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36850975306) found that an unauthorized Storage delete may return HTTP 200 with an empty result. The test was corrected to assert an empty result and re-read the original bytes after each attempt; the [corrected run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851209154) passed. E3, E5 and architecture checks also passed on that code head.

On PR #13 code head `355e6bd306079f2be9a60993d6c7ef5d425be98e`, [architecture/T3 checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851673600), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659450), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659359), and both [push](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851629706) and [PR](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659590) isolated Supabase checks passed. Independent Luna Max reviewer `/root/pr13_independent_review` returned PASS only for generic-client Storage/Data API bypass negatives, embedded PostgreSQL client-role denial and command-layer cross-tenant lookup. It verified that the private object exists, DELETE's HTTP 200 empty result causes no effect, and private Data API profile probes are rejected. The reviewer recommended keeping privileged administration separate from this client-path PASS. It rechecked evidence-only head `3f7675a919d5141ddc0ec0626b70d1f384b976bb` and returned PASS; all PR-head CI checks were green. On 2026-10-01 the owner explicitly accepted this identified, limited verdict and authorized T-E3-007 DONE plus PR #13 merger. The DONE claim covers the tested negative suite only.

**PASS boundary:** ordinary anonymous/authenticated clients cannot use the tested private E3/E5/audit SQL, Data API or file paths; one actor cannot claim the other's motorcycle or learn its operation result. **HELD activation boundary:** actual Studio/Dashboard memberships and MFA, `postgres`/`service_role` custody and hosted privileged bypass, hosted S3/vector/analytics Storage, a future hosted private bucket, and a deployed Kavriva API are not proven by these tests. The positive server fixture does not grant client file authority. Hosted ordinary file Storage still has no Kavriva bucket. Studio/SQL editor sessions run with privileged database authority; client-role SQL denial is deliberately narrower and cannot be called a Studio-admin denial. T-E3-001-R1 remains REVIEW.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
