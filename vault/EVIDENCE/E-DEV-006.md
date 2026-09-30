---
test_id: E-DEV-006
contract_id_version: "ADR-006 Decision 9; T-E3-006a DB/RPC direct-path inventory"
subject_file: vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md
subject_digest: A58C187C80C9EF440073998BE59BA65C66E46516BA4189B645BDDC69E16C778E
result: "RECORDED (41 E3 tests, 14 E5 tests and E10 run_all.py passed locally; PR #8 CI green; independent review pending)"
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

On [PR #8](https://github.com/xpike-dgm/kavriva-app/pull/8) code head `2466ce40267de51ad61d22b333fd1e91e849f9b9`, [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530697/job/110132418335), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530779/job/110132418443), [architecture](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530676/job/110132418381), and [local Supabase Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36787530738/job/110132418222) checks passed. The automatic T3 step was skipped; it is not the independent second-eye verdict. The [PR checks page](https://github.com/xpike-dgm/kavriva-app/pull/8/checks) tracks the final head after the correction.

The independent reviewer found that the first drift test enumerated `public` but omitted the configured `graphql_public` schema. The correction added `graphql_public` to the catalog query and updated this inventory. The focused 14-test PostgreSQL suite passed again after the correction; final-head CI and re-review are required before a verdict is recorded.
