---
test_id: E-DEV-009
contract_id_version: "ADR-006 Decision 9; T-E3-006a hosted database installation and direct-path verification"
subject_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md.snapshot"
subject_digest: D7DC8A9690E0E888F40EA26734240655D42AA1FD818FE7FF44018C7A041E688B
result: "RECORDED (three migrations installed; hosted catalog and client-denial checks passed; independent review PASS; runtime activation unproved)"
evidence_links:
  - "[[vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md]]"
  - "[[vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/EVIDENCE/E-DEV-008.md]]"
  - "[[vault/PACKS/P-E3-006a.md]]"
  - "[[vault/REGISTRY/T-E3-006a.md]]"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
gate_verdict: "PASS (T-E3-006a inventory and hosted installation scope only; owner accepted delegated review; no product activation)"
reviewer: "independent gpt-6-luna max sub-agent /root/pr11_independent_review; reviewed head a0ec6ae PASS; owner accepted 2026-10-01"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-009.md.snapshot"
metadata_origin_digest: "094422dcd23bf8fa27fc078de63b375ef49ccda3e346afadb5009df3e417f33e"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-006a"
  - "T-E3-006a"
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
subject_original_path: "vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-008.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-006a.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-006a.md.snapshot"
---

# E-DEV-009 — Hosted Kavriva database installation

On 2026-10-01, after the owner accepted PR #10's separate T3 preflight verdict and exact hosted target, [PR #10](https://github.com/xpike-dgm/kavriva-app/pull/10) merged as `df95e8a3386f415e8927c93f4f697d62641c19cf`. Its [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804223681), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804223687), [architecture](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804223592), and [local Supabase Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804223586) post-merge checks passed. Git blobs of the three migrations still matched the reviewed preflight hashes. A fresh remote `db push --dry-run --skip-vault` listed exactly the three migrations in their committed order and `list_migrations` was empty.

Supabase CLI 2.117.0 then applied those three files once to the active `Kavriva` project `tmcitwyzoahtvysxblty` with `db push --project-ref ... --skip-vault`; exit code was zero. Afterward the hosted migration list contained those three exact versions, and a second dry run reported the remote database up to date. No migration repair, MCP `apply_migration`, seed, API key, database password or customer data was written to the repository.

Read-only post-install catalog checks found three Kavriva schemas, 14 private tables, no Kavriva views/foreign tables, five private functions, zero relations in `public` or `graphql_public`, a `NOLOGIN` private server role, and one `maintenance` runtime seed. `anon`, `authenticated`, and `service_role` had zero schema usage, table DML and function execution privileges on the three private schemas. The private provider-session function was callable by the server role but not the two client roles; that server role could not directly read the Auth tables. The only server-role membership was the `postgres` administrator, not an application login. Zero maintenance records, audit events or Storage buckets existed.

Read-only Data API requests using the publishable key and each private schema profile all returned HTTP 406 / `PGRST106`. Supabase's security advisor returned zero lints. The table-listing tool warned generically about 14 tables without RLS; the private schema privilege and HTTP checks contradict its claim that an anon key alone reaches those tables. No RLS toggle was applied because it would block the restricted server role without suitable policies. The performance advisor reported four informational missing-foreign-key-index findings, recorded for later work without an unreviewed schema change. The exact catalog scope, caveats and reproduction steps are in the subject file.

This proves hosted installation and the tested client-denial boundary at one point in time, not a deployed E3 server or live maintenance effect. The owner accepted the independent task-level verdict recorded below on 2026-10-01, completing T-E3-006a's inventory and installation scope. T-E3-001-R1 remains REVIEW because product runtime login, deployed service, external audit/floor custody and live protected mutation are unproved.

The independent Luna Max sub-agent `/root/pr11_independent_review` reviewed [PR #11](https://github.com/xpike-dgm/kavriva-app/pull/11) head `a0ec6aeb6ecbeaa286d762a228a0337f5e82ff70` and returned **PASS for the T-E3-006a inventory and hosted installation scope** with no open finding. It recalculated this record's subject digest, repeated the read-only migration, catalog, privilege, restricted-role and advisor checks, and confirmed the provider GraphQL routine's separate scope. It did not independently repeat the three HTTP 406/PGRST106 calls; those are implementer-run direct client tests documented in the subject file. On the reviewed head [architecture/T3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804923235), [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804912017), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804912044), and [local Supabase Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36804912082) checks all passed. This evidence-only update does not change the installed schema or reviewed result. On 2026-10-01 the owner explicitly accepted this delegated task verdict and authorized PR #11's merger. T-E3-006a is DONE only for inventory and hosted installation proof; T-E3-001-R1 remains REVIEW for separate runtime/authority proof.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
