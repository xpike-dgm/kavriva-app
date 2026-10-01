---
test_id: E-DEV-008
contract_id_version: "ADR-006 Decision 9; T-E3-006a hosted Supabase baseline and installation preflight"
subject_file: vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md
subject_digest: 0CE8942A50F394AE79FC2122E2F2D09A8015D5FE8DBF75EA77DDB0E3E8495C75
result: "RECORDED (read-only hosted baseline; independent preflight review PASS; installation and post-install proof outstanding)"
evidence_links:
  - "[[vault/INVENTORIES/E3-HOSTED-SUPABASE-PREFLIGHT.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006a.md]]"
  - "[[vault/REGISTRY/T-E3-006a.md]]"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
gate_verdict: "RECORDED (preflight review PASS; owner acceptance and hosted installation outstanding)"
reviewer: "independent gpt-6-luna max sub-agent /root/pr10_independent_review; corrected head f0132ef PASS; owner acceptance awaited"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-008 — Hosted Supabase baseline and installation preflight

The parameterized Supabase project tools returned `Kavriva` (`tmcitwyzoahtvysxblty`, `ACTIVE_HEALTHY`, PostgreSQL 17.11). The older project-scoped connection still pointed to inactive `MotoBakim` (`kcqjsrjthqzuesybntwa`), which caused earlier database timeouts; the local Codex MCP configuration was corrected, while its already-open session can retain the old target until reloaded. The read-only checks here used explicit `project_id=tmcitwyzoahtvysxblty` and succeeded. No credential was recorded.

On the target, `list_migrations` returned `[]`; `list_tables` for `public` and `storage` returned only provider Storage tables, with `storage.buckets` row count zero. A direct catalog count returned zero Kavriva schemas, zero relations in `public`, `graphql_public` or Kavriva private schemas, zero `kavriva_consumer_api` roles, and both provider Auth tables. `list_edge_functions` returned `[]`. One provider-owned `graphql_public.graphql` routine has effective `EXECUTE` for `anon` and `authenticated`; the preflight names it explicitly and does not count it as a Kavriva function.

The pinned CLI `2.117.0` reported `db push` support for `--project-ref`, `--dry-run` and `--skip-vault`. The three committed migration hashes and the review-before-write sequence are in the subject file. The dry run and actual push were not run because CLI deployment authentication and the independent T3 gate have not been completed. No hosted schema, role, user or data was changed. Local migration tests and PR #8's review remain historical proof only; this baseline must be repeated before deployment and followed by a fresh hosted catalog/grant check.

The independent PR #10 reviewer found that the first two initially reported SHA-256 values were Windows working-tree CRLF hashes, not Git's committed bytes. The table was corrected to Git blob/LF hashes on the same PR and re-reviewed on the corrected head below. It did not change migration SQL or the hosted project.

The same independent reviewer rechecked corrected PR #10 code head `f0132efc537f748e55f8fe83e96170b4bf9737c0`, verified all three migration hashes and this record's subject digest, repeated the read-only target check, and returned **PASS for the preflight and read-only baseline only**, with no open content finding. On that head the [architecture and T3 checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36803054861), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36803054860), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36803054883), and [local Supabase Auth check](https://github.com/xpike-dgm/kavriva-app/actions/runs/36803054945) all completed successfully. The reviewer issued the verdict before the local Auth jobs completed; the implementer checked their later green result. This evidence-only edit does not change the reviewed preflight, migration files, or live project. The owner has not yet accepted this particular delegated verdict or the exact hosted write target. PR #10 remains draft and neither task is DONE.
