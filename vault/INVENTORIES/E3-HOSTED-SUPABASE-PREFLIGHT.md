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

These are reviewed future commands, not a report that they ran. The first is read-only; the second changes the hosted database. The migrations are additive but create private authority, maintenance and audit tables plus a `NOLOGIN` server role. Neither command creates the separate application login, deploys the E3 API, creates a Storage bucket, or makes the product ready for users.

## Required post-install checks

1. `list_migrations` must show the three committed versions and no unexpected version. Re-run the catalog check from the repository inventory: exactly 14 Kavriva tables, five Kavriva functions, zero Kavriva views or exposed RPCs, and `kavriva_consumer_api` remains `NOLOGIN`.
2. Verify effective `anon` and `authenticated` access to each private schema, table and function is false. Inspect the hosted Data API schema setting and any `public`/`graphql_public` objects and grants, including the provider GraphQL routine. A generic client path to a Kavriva object fails the gate.
3. Verify the `maintenance` runtime version seed exists and the provider Auth tables remain provider-owned. Do not enroll a customer or create a production maintenance record as a schema smoke test.
4. Run security and performance advisors, retain their exact output, and record the live catalog and migration results in a new evidence update. Any discrepancy holds activation for correction and independent review.

Rollback is not an automatic `DROP`: after any hosted write, preserve Auth identities, maintenance history, operations and audit receipts. If installation partially succeeds, stop and inspect migration history before any retry. A data-preserving repair needs its own reviewed migration.

Even a successful database install leaves T-E3-001-R1 at REVIEW until the separate server login, secret custody, deployed E3 runtime, current authority writers and external audit/floor custody are proven. T-E3-006a also stays REVIEW until the hosted post-install catalog and exposure checks are independently accepted.

Sources: [Supabase database migration workflow](https://supabase.com/docs/guides/deployment/database-migrations), [Supabase Data API security](https://supabase.com/docs/guides/api/securing-your-api), committed migration files, and the 2026-10-01 read-only project/tool results recorded above.
