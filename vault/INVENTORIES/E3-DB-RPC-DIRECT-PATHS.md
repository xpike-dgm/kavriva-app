---
record_id: D-APP-DOC-006
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md.snapshot"
metadata_origin_digest: "a58c187c80c9ef440073998be59ba65c66e46516ba4189b645bddc69e16c778e"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Verified against the three committed Supabase migrations and the isolated PostgreSQL catalog on 2026-10-01. Scope is repository-owned database objects and the maintenance server's database paths. This is the database/RPC part of ADR-006 Decision 9; Storage, signed URLs, and Studio belong to T-E3-006b, browser rules to T-E3-006c, and bypass negative tests to T-E3-007."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-007"
  - "D-APP-DOC-008"
  - "D-APP-DOC-010"
  - "E-DEV-006"
  - "E-DEV-008"
  - "E-DEV-009"
  - "E-DEV-010"
  - "E-DEV-011"
  - "E-DEV-012"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-006a"
  - "P-E3-006b"
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
status: "RECORDED"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# T-E3-006a — Database and RPC direct-path inventory

Verified against the three committed Supabase migrations and the isolated PostgreSQL catalog on 2026-10-01. Scope is repository-owned database objects and the maintenance server's database paths. This is the database/RPC part of ADR-006 Decision 9; Storage, signed URLs, and Studio belong to T-E3-006b, browser rules to T-E3-006c, and bypass negative tests to T-E3-007.

## Exposed surface and entry routes

`supabase/config.toml` lists `public` and `graphql_public` as Data API schemas. The committed migrations create **zero** Kavriva relations, views, or routines in either exposed schema. They create no GraphQL/RPC endpoint. The code search found no client-side Supabase Data API, REST `/rest/v1`, GraphQL, or `.rpc()` invocation. Supabase Auth `/auth/v1/user` is a provider-managed identity endpoint, not a Kavriva database RPC; E3 verifies the bearer there and checks the current provider session in the database.

The only repository-defined HTTP product entrypoint is `modules/e03-server/public/maintenance_api.py`: `POST /v1/consumer/enroll`, `POST /v1/maintenance/records`, `POST /v1/maintenance/records/{id}/corrections`, and `GET /v1/operations/{id}`. It uses a server-only PostgreSQL connection configured with `KAVRIVA_DATABASE_DSN`. The intended member role is `kavriva_consumer_api` (NOLOGIN), granted to a separate server login at deployment. The role itself is not a client credential. Those four routes are application endpoints, not database RPCs.

## All repository-owned tables and views

| Schema and tables | Owner / server use | Direct `anon` / `authenticated` path |
| --- | --- | --- |
| `kavriva_e3.motorcycles`, `maintenance_records`, `maintenance_revisions` | E3 product target and append-only user-reported maintenance history; E3 server reads/writes | No schema usage or table privileges |
| `kavriva_e3.negative_floors`, `runtime_versions`, `operation_records` | E3 negative floor, runtime gate, durable operation identity; E3 server reads/writes as granted | No schema usage or table privileges |
| `kavriva_e5.actor_epochs`, `current_sessions`, `current_grants`, `policy_heads`, `policy_rules`, `consumer_enrollments` | E5 canonical consumer authorization and enrollment; server reads/locks and uses bounded writers | No schema usage or table privileges |
| `kavriva_audit.heads`, `events` | E3 transaction-linked audit sequence and receipts | No schema usage or table privileges |

**Total: 14 tables; 0 views, materialized views, or foreign tables.** The migrations explicitly revoke schema access from `PUBLIC`, `anon`, and `authenticated` for these private schemas and grant only the server role the listed work. `auth.users` and `auth.sessions` are Supabase-managed, not Kavriva-created. A restricted, private E5 function reads and locks those two Auth tables; the server role has no direct read grant. The `auth` tables made in `test_live_maintenance.py` are isolated test stand-ins. `kavriva_e3.current_authorization` and `canonical_effect` in `test_postgres_commit_authorization.py` are legacy test fixtures; neither exists in the product migrations.

## All repository-owned database functions / RPC candidates

| Function | Purpose | Direct client EXECUTE |
| --- | --- | --- |
| `kavriva_e3.reject_maintenance_revision_change()` | Trigger prevents revision update/delete | No |
| `kavriva_e3.reject_floor_regression()` | Trigger prevents negative-floor regression | No |
| `kavriva_e5.reject_lock_marker_change()` | Trigger blocks writes to lock-only columns | No |
| `kavriva_e5.provider_session_current(uuid, uuid)` | `SECURITY DEFINER` function locks current provider session and user; returns a boolean only | No; explicit EXECUTE only for `kavriva_consumer_api` |
| `kavriva_audit.reject_event_change()` | Trigger prevents audit event update/delete | No |

**Total: 5 functions; 0 exposed RPCs.** All five are in unexposed private schemas and the migrations revoke the default `PUBLIC` EXECUTE grant. The provider-session function has a fixed empty search path and does not return profile fields. It is called through E5's public Python facade by the E3 server. There are no repository-owned SQL procedures.

## Server SQL routes and residual boundaries

- `maintenance_command.py` starts the transaction, verifies the provider session through E5, reads the enrollment and operation record, locks the floor/runtime inputs, calls E5's current decision, writes the maintenance effect and audit receipt, then commits. `maintenance_store.py` locks the motorcycle or existing record and appends the revision. `postgres_decision.py` reads E5 epoch, session, grant, policy head and rule rows.
- `postgres_identity_writer.py` creates the first personal enrollment, motorcycle, floor, E5 grant and policy, and current session after verified Auth. It can revoke a consumer. These are server-internal writers; `anon` and `authenticated` have no direct SQL access.
- The server role has INSERT on some E5 authority and audit tables for enrollment and receipts, plus narrow UPDATE grants. A holder of its database login could attempt direct SQL outside the Python guard. Credential custody and deployment role binding therefore remain activation controls; the role must never be given to a browser, generic Data API client or AI task. This inventory does not prove that every arbitrary server-role SQL statement is authorization-safe.
- A database owner, SQL console, `service_role`, external migration or hosted-project setting can change the effective surface. No hosted Supabase project was available for inspection; hosted schema exposure, inherited/default grants and any objects created outside this repository remain **unverified**. Re-run the catalog/grant check against the exact target database before activation. Do not infer hosted isolation from the local test.

## Reproduction and drift check

The `test_migrated_database_surface_matches_direct_path_inventory` test in `modules/e03-server/tests/test_live_maintenance.py` applies all three migrations to isolated PostgreSQL, enumerates `pg_class` and `pg_proc` in both configured exposed schemas (`public`, `graphql_public`) and the three Kavriva private schemas, checks the exact 14/0/5 set, and checks effective schema/table/function privileges for `anon` and `authenticated`. A newly migrated table, view or routine, or a client grant makes that test fail until this inventory and its expected set are reviewed together. Supabase's Data API has two separate controls: schema exposure plus SQL grants, with RLS governing rows once access exists. Its defaults have changed, so this inventory relies on explicit committed grants and tested catalog state rather than a presumed platform default.

Sources: `supabase/config.toml`, `supabase/migrations/*.sql`, `modules/e03-server/public/maintenance_api.py`, E3/E5 internal adapters, and [Supabase's API security guide](https://supabase.com/docs/guides/api/securing-your-api) and [2026 Data API default-grants change](https://supabase.com/changelog/45329-breaking-change-tables-not-exposed-to-data-and-graphql-api-automatically).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
