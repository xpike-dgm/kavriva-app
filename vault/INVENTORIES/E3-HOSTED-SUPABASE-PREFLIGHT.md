---
record_id: D-APP-DOC-007
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md.snapshot"
metadata_origin_digest: "fb1255fd11fd6b1976249aba4163307d65a5adf30cc363919d94fc58cbdfa17d"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "The project-scoped Supabase management tools were called with the target ID. `list_migrations` returned zero entries. A catalog query found zero `kavriva_e3`, `kavriva_e5` or `kavriva_audit` schemas, zero relations across those schemas plus `public` and `graphql_public`, no `kavriva_consumer_api` role, both provider-owned `auth.users` and `auth.sessions`, and zero Storage buckets. `list_edge_functions` returned zero functions. This proves that the three committed application migrations have not been installed on this target at inspection time; it does not prove that the project's Auth or API settings are ready for product traffic."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-008"
  - "E-DEV-008"
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

# Kavriva hosted Supabase database preflight

Status: REVIEW — read-only hosted inspection and deployment preparation, not a database installation.
Observed: 2026-10-01. Target: Supabase project `tmcitwyzoahtvysxblty`, name `Kavriva`, region `eu-west-1`, reported `ACTIVE_HEALTHY`, PostgreSQL 17.11. The older project `kcqjsrjthqzuesybntwa` is named `MotoBakim` and reported `INACTIVE`; it is not the target. The owner asked to resume Supabase work and then approved preparing the database setup for independent review. The exact target must be confirmed again immediately before any write.

## Read-only baseline

The project-scoped Supabase management tools were called with the target ID. `list_migrations` returned zero entries. A catalog query found zero `kavriva_e3`, `kavriva_e5` or `kavriva_audit` schemas, zero relations across those schemas plus `public` and `graphql_public`, no `kavriva_consumer_api` role, both provider-owned `auth.users` and `auth.sessions`, and zero Storage buckets. `list_edge_functions` returned zero functions. This proves that the three committed application migrations have not been installed on this target at inspection time; it does not prove that the project's Auth or API settings are ready for product traffic.

The catalog did find one routine in the checked schemas: provider-owned `graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb)`, owned by `supabase_admin`. Effective `EXECUTE` for `anon` and `authenticated` was true. It is a Supabase-managed GraphQL entrypoint, not one of the five Kavriva functions in `[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]`. No Kavriva relations currently exist for it to reach. Its effective access to future objects and the hosted Data API schema settings require a fresh post-install check; the local `supabase/config.toml` is not evidence of hosted settings.

Read-only baseline query (counts avoid customer or credential data):

```sql
select
  (select count(*) from pg_namespace where nspname in
    ('kavriva_e3','kavriva_e5','kavriva_audit')) as kavriva_schemas,
  (select count(*) from pg_class c join pg_namespace n on n.oid=c.relnamespace
    where n.nspname in ('public','graphql_public','kavriva_e3','kavriva_e5','kavriva_audit')
      and c.relkind in ('r','p','v','m','f')) as checked_relations,
  (select count(*) from pg_roles where rolname='kavriva_consumer_api') as server_roles,
  (select count(*) from storage.buckets) as storage_buckets;
```

Observed result: `kavriva_schemas=0`, `checked_relations=0`, `server_roles=0`, `storage_buckets=0`. Separate routine query returned the one provider-owned GraphQL function above. Re-run the baseline immediately before installation because the hosted state can change.

## Installation candidate and order

The existing, reviewed files on `main` are the complete candidate. No new schema SQL is proposed in this preflight PR. SHA-256 values below are for Git's committed file bytes (the exact bytes CI receives) on 2026-10-01; verify again against the exact merge head before deployment. A Windows checkout may use CRLF line endings and therefore have different working-tree hashes.

| Order | Committed migration | SHA-256 |
| --- | --- | --- |
| 1 | `supabase/migrations/20260924102337_e5_current_authority.sql` | `26E1602F2702B66C65DFC7943D528399978D301F97D2A6C8EA06CE6B2A49518E` |
| 2 | `supabase/migrations/20260924131747_e3_maintenance_records.sql` | `66BFAA43A7322FD24E906AAEEA1355A956910C6FC931A3D93190512898EBA509` |
| 3 | `supabase/migrations/20260930151252_e3_live_authorization.sql` | `FF693F9B6B216BD930175EF25726ADD7B128B7C47CD539155F177A968878CD52` |

Use the pinned Supabase CLI `2.117.0` from the repository's local Auth CI. Its `db push --help` confirms `--project-ref`, `--dry-run`, and `--skip-vault`. After this PR's independent T3 review and explicit owner acceptance of the target and write, authenticate the CLI without putting a token or password in the repository or chat. Run a dry run against the exact project, with `--skip-vault`; it must list exactly these three filenames in this order. Stop if the baseline, target, hashes or dry-run list differs. Only then run the same `db push` without `--dry-run` once, serially, with no seed import. Supabase records the local filenames in migration history. Do not use MCP `apply_migration` for these existing files: its server-generated versions may diverge from the committed migration timestamps.

```text
npx --yes supabase@2.117.0 db push --project-ref tmcitwyzoahtvysxblty --skip-vault --dry-run
npx --yes supabase@2.117.0 db push --project-ref tmcitwyzoahtvysxblty --skip-vault
```

These commands define the reviewed sequence; their execution status is recorded in `[[vault/EVIDENCE/E-DEV-008.md]]`. The first is read-only; the second changes the hosted database. The migrations are additive but create private authority, maintenance and audit tables plus a `NOLOGIN` server role. Neither command creates the separate application login, deploys the E3 API, creates a Storage bucket, or makes the product ready for users.

## Required post-install checks

1. `list_migrations` must show the three committed versions and no unexpected version. Re-run the catalog check from the repository inventory: exactly 14 Kavriva tables, five Kavriva functions, zero Kavriva views or exposed RPCs, and `kavriva_consumer_api` remains `NOLOGIN`.
2. Verify effective `anon` and `authenticated` access to each private schema, table and function is false. Inspect the hosted Data API schema setting and any `public`/`graphql_public` objects and grants, including the provider GraphQL routine. A generic client path to a Kavriva object fails the gate.
3. Verify the `maintenance` runtime version seed exists and the provider Auth tables remain provider-owned. Do not enroll a customer or create a production maintenance record as a schema smoke test.
4. Run security and performance advisors, retain their exact output, and record the live catalog and migration results in a new evidence update. Any discrepancy holds activation for correction and independent review.

Rollback is not an automatic `DROP`: after any hosted write, preserve Auth identities, maintenance history, operations and audit receipts. If installation partially succeeds, stop and inspect migration history before any retry. A data-preserving repair needs its own reviewed migration.

Even a successful database install leaves T-E3-001-R1 at REVIEW until the separate server login, secret custody, deployed E3 runtime, current authority writers and external audit/floor custody are proven. T-E3-006a also stays REVIEW until the hosted post-install catalog and exposure checks are independently accepted.

Sources: [Supabase database migration workflow](https://supabase.com/docs/guides/deployment/database-migrations), [Supabase Data API security](https://supabase.com/docs/guides/api/securing-your-api), committed migration files, and the 2026-10-01 read-only project/tool results recorded above.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
