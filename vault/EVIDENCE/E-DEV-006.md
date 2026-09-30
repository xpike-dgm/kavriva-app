---
test_id: E-DEV-006
contract_id_version: "ADR-006 Decision 9; T-E3-006a DB/RPC direct-path inventory"
subject_file: vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md
subject_digest: B2EBA71A3710D61D7AC45422866793BC7193FC5127A6FE759D2AC480F28FF426
result: "RECORDED (41 E3 tests, 14 E5 tests and E10 run_all.py passed locally; PR CI and independent review pending)"
evidence_links:
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006a.md]]"
  - "[[vault/REGISTRY/T-E3-006a.md]]"
  - "modules/e03-server/tests/test_live_maintenance.py"
  - "supabase/config.toml"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
gate_verdict: "RECORDED (local inventory proven; hosted project and independent review unverified)"
reviewer: "none; independent Luna Max task-level review pending"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-006 — DB/RPC direct-path inventory

The inventory enumerates every repository-owned table and function from the three committed migrations, the configured Data API schemas, the server's SQL connection and four maintenance HTTP routes. It explicitly identifies Supabase-owned Auth tables, test-only legacy tables, unexposed schemas, server-role grants and hosted-project limits.

The new PostgreSQL catalog test uses `pg_class`, `pg_proc`, and effective privilege checks after applying the migrations in an isolated database. It also checks the local Data API schema configuration and automatic-grant setting. It passed as part of 41 E3 and 14 E5 local tests on 2026-10-01; E10 `run_all.py` passed. A new relation, view, routine or `anon`/`authenticated` grant in the inventoried schemas fails the check. It is a repository/local proof; no hosted project was queried. Storage, signed URLs and Studio are T-E3-006b; browser rules are T-E3-006c; bypass negative cases are T-E3-007. These later tasks have not been claimed complete.
