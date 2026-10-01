---
test_id: E-DEV-008
contract_id_version: "ADR-006 Decision 9; T-E3-006a hosted Supabase baseline and installation preflight"
subject_file: vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md
subject_digest: C6D872CBD07B6E209F9FD689BB1B37670E77E06191151F46B0E71E471EFB409D
result: "RECORDED (read-only hosted baseline; installation and post-install proof outstanding)"
evidence_links:
  - "[[vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006a.md]]"
  - "[[vault/REGISTRY/T-E3-006a.md]]"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
gate_verdict: "RECORDED (preflight only; separate T3 review required; no hosted write)"
reviewer: "none; independent task-scope review requested before any hosted installation"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-008 — Hosted Supabase baseline and installation preflight

The parameterized Supabase project tools returned `Kavriva` (`tmcitwyzoahtvysxblty`, `ACTIVE_HEALTHY`, PostgreSQL 17.11). The older project-scoped connection still pointed to inactive `MotoBakim` (`kcqjsrjthqzuesybntwa`), which caused earlier database timeouts; the local Codex MCP configuration was corrected, while its already-open session can retain the old target until reloaded. The read-only checks here used explicit `project_id=tmcitwyzoahtvysxblty` and succeeded. No credential was recorded.

On the target, `list_migrations` returned `[]`; `list_tables` for `public` and `storage` returned only provider Storage tables, with `storage.buckets` row count zero. A direct catalog count returned zero Kavriva schemas, zero relations in `public`, `graphql_public` or Kavriva private schemas, zero `kavriva_consumer_api` roles, and both provider Auth tables. `list_edge_functions` returned `[]`. One provider-owned `graphql_public.graphql` routine has effective `EXECUTE` for `anon` and `authenticated`; the preflight names it explicitly and does not count it as a Kavriva function.

The pinned CLI `2.117.0` reported `db push` support for `--project-ref`, `--dry-run` and `--skip-vault`. The three committed migration hashes and the review-before-write sequence are in the subject file. The dry run and actual push were not run because CLI deployment authentication and the independent T3 gate have not been completed. No hosted schema, role, user or data was changed. Local migration tests and PR #8's review remain historical proof only; this baseline must be repeated before deployment and followed by a fresh hosted catalog/grant check.
