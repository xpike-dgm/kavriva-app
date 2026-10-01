---
test_id: E-DEV-006
contract_id_version: "ADR-006 Decision 9; T-E3-006a DB/RPC direct-path inventory"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
subject_digest: A58C187C80C9EF440073998BE59BA65C66E46516BA4189B645BDDC69E16C778E
result: "RECORDED (41 E3 and 14 E5 local tests; final code-head PR #8 CI green; independent review PASS for inventory scope)"
evidence_links:
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006a.md]]"
  - "[[vault/REGISTRY/T-E3-006a.md]]"
  - "modules/e03-server/tests/test_live_maintenance.py"
  - "supabase/config.toml"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
gate_verdict: "PASS (T-E3-006a repository inventory scope only; owner accepted independent review; hosted-project inspection unverified)"
reviewer: "independent gpt-6-luna max sub-agent /root/pr8_independent_review; corrected code head f74c42d53a506dae7a9d3f299d0bd8c6281bb66d; owner accepted on 2026-10-01"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-006.md.snapshot"
metadata_origin_digest: "9cfafd5a9f775844d2030c40a266b073d1159ea2d0481121d3b819ad840766ae"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-006a"
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
subject_original_path: "vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-006a.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-006a.md.snapshot"
---

# E-DEV-006 — DB/RPC direct-path inventory

The inventory enumerates every repository-owned table and function from the three committed migrations, the configured Data API schemas, the server's SQL connection and four maintenance HTTP routes. It explicitly identifies Supabase-owned Auth tables, test-only legacy tables, unexposed schemas, server-role grants and hosted-project limits.

The new PostgreSQL catalog test uses `pg_class`, `pg_proc`, and effective privilege checks after applying the migrations in an isolated database. It also checks the local Data API schema configuration and automatic-grant setting. It passed as part of 41 E3 and 14 E5 local tests on 2026-10-01; E10 `run_all.py` passed. A new relation, view, routine or `anon`/`authenticated` grant in the inventoried schemas fails the check. It is a repository/local proof; no hosted project was queried. Storage, signed URLs and Studio are T-E3-006b; browser rules are T-E3-006c; bypass negative cases are T-E3-007. These later tasks have not been claimed complete.

On [PR #8](https://github.com/xpike-dgm/kavriva-app/pull/8) code head `2466ce40267de51ad61d22b333fd1e91e849f9b9`, [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530697/job/110132418335), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530779/job/110132418443), [architecture](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530676/job/110132418381), and [local Supabase Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530738/job/110132418222) checks passed. The automatic T3 step was skipped; it is not the independent second-eye verdict. The [PR checks page](https://github.com/xpike-dgm/kavriva-app/pull/8/checks) tracks the final head after the correction.

The independent reviewer found that the first drift test enumerated `public` but omitted the configured `graphql_public` schema. The correction added `graphql_public` to the catalog query and updated this inventory. The focused 14-test PostgreSQL suite passed again after the correction.

The same read-only Luna Max sub-agent `/root/pr8_independent_review` re-reviewed corrected code head `f74c42d53a506dae7a9d3f299d0bd8c6281bb66d` and returned **PASS** for the repository DB/RPC inventory. It confirmed the `graphql_public` closure, 14-table/0-view/5-function set, digest and hosted limitation; no open code findings remain. On that head [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36788018620/job/110133988811), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36788018586/job/110133988499), [architecture](https://github.com/xpike-dgm/kavriva-app/actions/runs/36788018581/job/110133988525), and [local Supabase Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36788018574/job/110133988374) checks passed. The reviewer reported before those final checks completed and did not personally run tests. Evidence-only commits after the reviewed code head did not change executable code or inventory; their checks are tracked on the PR page. On 2026-10-01 the owner explicitly replied “evet kabul ediyorum” to accepting this identified review and merging PR #8 after final green CI. This satisfies the delegated second-eye acceptance under DEC-0069 for the repository inventory scope. Hosted Supabase is still uninspected, so T-E3-006a remains REVIEW rather than DONE.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
