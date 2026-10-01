---
record_id: D-APP-DOC-008
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-HOSTED-SUPABASE-RESULT.md.snapshot"
metadata_origin_digest: "d7dc8a9690e0e888f40ea26734240655d42aa1fd818fe7ff44018c7a041e688b"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "The owner explicitly accepted PR #10's independent Luna Max preflight verdict and this exact target on 2026-10-01. [PR #10](https://github.com/xpike-dgm/kavriva-app/pull/10) merged into `main` as `df95e8a3386f415e8927c93f4f697d62641c19cf`; its PR and post-merge CI passed. After the merge, `main`'s three migration Git blobs still matched the reviewed SHA-256 values in `[[vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md]]`. A second read-only CLI dry run listed exactly those three files. Supabase CLI 2.117.0 then applied them once with `db push --project-ref tmcitwyzoahtvysxblty --skip-vault`. It reported all three migration names and `Finished supabase db push` with exit code zero. No seed import, Storage bucket, customer record or manual SQL migration was added."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-009"
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
evidence:
  - "E-DEV-027"
supersedes: []
superseded_by: []
status: "REVIEW"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# T-E3-006a — Hosted Kavriva database installation result

Status: REVIEW. Observed 2026-10-01 on Supabase project `tmcitwyzoahtvysxblty` (`Kavriva`, `eu-west-1`, PostgreSQL 17.11). This is an installed-schema and direct-path inventory, not a deployed product or a live maintenance-write proof.

## Change and migration history

The owner explicitly accepted PR #10's independent Luna Max preflight verdict and this exact target on 2026-10-01. [PR #10](https://github.com/xpike-dgm/kavriva-app/pull/10) merged into `main` as `df95e8a3386f415e8927c93f4f697d62641c19cf`; its PR and post-merge CI passed. After the merge, `main`'s three migration Git blobs still matched the reviewed SHA-256 values in `[[vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md]]`. A second read-only CLI dry run listed exactly those three files. Supabase CLI 2.117.0 then applied them once with `db push --project-ref tmcitwyzoahtvysxblty --skip-vault`. It reported all three migration names and `Finished supabase db push` with exit code zero. No seed import, Storage bucket, customer record or manual SQL migration was added.

Hosted `list_migrations` then returned exactly:

| Version | Name |
| --- | --- |
| `20260924102337` | `e5_current_authority` |
| `20260924131747` | `e3_maintenance_records` |
| `20260930151252` | `e3_live_authorization` |

A post-install `db push --dry-run --skip-vault` reported `Remote database is up to date`, so the committed files and hosted migration history agree. The CLI authenticated through its browser verification flow; no token, verification code, database password or connection string was committed or recorded here.

## Read-only hosted catalog and access checks

| Check | Observed result |
| --- | --- |
| Kavriva private schemas | 3: `kavriva_e3`, `kavriva_e5`, `kavriva_audit` |
| Kavriva tables / views or foreign tables / functions | 14 / 0 / 5, matching `[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]` |
| Relations in `public` and `graphql_public` | 0 |
| `anon`, `authenticated`, `service_role` access to Kavriva private schemas, table DML or function execution | 0 for each role and each tested privilege class |
| `kavriva_consumer_api` | Exists with `NOLOGIN`; its only membership is the `postgres` administrator, with `INHERIT=false` and `SET=false`. No application login is attached. |
| Private provider-session function | `SECURITY DEFINER`, owner `postgres`; callable by the private server role but not `anon` or `authenticated`; server role cannot directly SELECT `auth.users` or `auth.sessions` |
| `maintenance` runtime seed | 1 row |
| Maintenance records / audit events / Storage buckets | 0 / 0 / 0 |

The hosted Data API was also queried with the project's **publishable** key and an `Accept-Profile` for each Kavriva private schema. All three requests returned HTTP 406 / `PGRST106` (`Invalid schema`); no rows were returned. This is direct negative evidence that these schemas were not exposed through that client API at check time. No secret or customer data was sent. `graphql_public.graphql` remains a Supabase-owned routine with client `EXECUTE`, as in the preflight; there are no Kavriva relations in its exposed schemas. It is not one of the five Kavriva private functions.

Supabase `get_advisors(type=security)` returned no lints. The table-listing tool separately emitted a generic critical warning because RLS is off on all 14 private tables; that warning's statement that the tables are fully accessible with the anon key conflicts with the observed zero schema/table grants and the HTTP 406 responses. Supabase's [API security guide](https://supabase.com/docs/guides/api/securing-your-api) explains that object grants and schema exposure gate Data API access, and RLS governs rows once an object is reachable. No RLS toggle or client grant was applied: enabling RLS without policies would block the intended restricted server role. The absence of RLS is a defense-in-depth decision for later review if the exposure model changes, not proof that privileged administrator access is safe.

The performance advisor reported four `INFO` findings for foreign keys without covering indexes (two on `kavriva_e3.maintenance_records`, one each on `kavriva_e5.current_grants` and `current_sessions`). They are recorded for later performance work; no unreviewed index migration was applied. [Supabase's database linter](https://supabase.com/docs/guides/database/database-linter?lint=0001_unindexed_foreign_keys) describes this advisory.

Reproduction: compare the exact three versions with `list_migrations`; enumerate `pg_namespace`, `pg_class` (`relkind` `r/p/v/m/f`) and `pg_proc` for `public`, `graphql_public` and the three Kavriva schemas; use `has_schema_privilege`, `has_table_privilege`, and `has_function_privilege` for `anon`, `authenticated`, and `service_role`; query `pg_roles`/`pg_auth_members` for the private server role; issue a read-only Data API request with `Accept-Profile` for each private schema. No product mutation is needed for this inventory.

## Remaining activation limits

There is still no separate login or deployed E3 server bound to `kavriva_consumer_api`; the CLI/admin account is not the intended product runtime. The hosted environment has no enrolled consumer or maintenance record. External audit/floor custody, deployment secrets, active runtime health and a real hosted maintenance-write test remain unproved. This installation does not make T-E3-001-R1 DONE or the product ready for users. T-E3-006a remains REVIEW until this hosted result passes independent task-level T3 review and the owner accepts that verdict.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
