---
test_id: E-DEV-005
contract_id_version: authorization-tuple v1 + ADR-004 Decision 1 + ADR-006 Decisions 2-4 and 6; T-E3-001-R1 consumer maintenance binding
subject_file: modules/e03-server/internal/maintenance_command.py
subject_digest: 3FDF8EB338B656EB2AC77105AE6B5F4F4208273A302FD8C6B10A417B75A3767C
api_digest: 3A8D77539F7890A0D096A5957E8EB50CC1011C55BCC405A1CE4E7DA7A7E13CE4
e5_public_digest: FF4CD544EABC5FF915B60B1C37CC4B7C609C3C1DCAED9A0E435EA9DCEA2FE41E
auth_digest: 8EFC207384B2E4B01B4C11E56A19360AA898F62910DEF80304F463A9A81FD960
writer_digest: A4E76F89AFF064414FF42D522C17C78FE15273E3FCF166B909C878E894CE2FED
schema_digest: C050923E2EBDA97F66F3B39A2DBB4B70298EF907FCD411D73C3965CA8B10E9D4
test_script_digest: E9AED62DC1E7452B5D3FDA2FEEF97273D7EC26808BA63C1A31C2BCCB46E67506
result: "RECORDED (38 E3 and 14 E5 tests; PR #7 code-head checks passed)"
evidence_links:
  - "[[vault/PACKS/P-E3-001-R3.md]]"
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/public/maintenance_api.py"
  - "modules/e03-server/internal/maintenance_command.py"
  - "modules/e05-identity/public/consumer_authority.py"
  - "modules/e05-identity/internal/supabase_auth.py"
  - "modules/e05-identity/internal/postgres_identity_writer.py"
  - "modules/e03-server/tests/test_live_maintenance.py"
  - "modules/e03-server/tests/verify_local_supabase_auth.py"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
  - ".github/workflows/e3-live-auth.yml"
gate_verdict: "BLOCKED (final PR CI and independent task-level T3 review required; no DONE claim)"
reviewer: none
timestamp: 2026-09-30
status: RECORDED
last_verified: 2026-09-30
---

# E-DEV-005 — Consumer maintenance login and authority binding

The bearer-only E3 API validates a consumer access token with Supabase Auth `/user`, derives the actor and session from that verified token, and never accepts a client-selected tenant, cached ALLOW, grant, policy or audit status. In a single PostgreSQL transaction it locks the provider's `auth.sessions`/`auth.users` rows through a private function, checks current E5 session, epoch, grants and policy, locks the E3 motorcycle or record and negative floor, checks the current runtime row, records an operation identity and linked audit intent, then appends a `USER_REPORTED` maintenance revision and committed audit receipt. A missing or changed source denies or holds; uncertain commit results have a canonical operation lookup. One-time enrollment cannot recreate revoked grants or reset an epoch. E3 uses E5's declared public facade.

The SQL migration was generated with Supabase CLI v2.117.0 and applied only to isolated test databases. Its `kavriva_consumer_api` role has no login and no direct Auth-table access; the local CI test creates a temporary login with that role. The provider-session function takes row locks on the real Auth tables without returning personal profile data. Direct client roles have no access to the private command tables.

Local native PostgreSQL suites on 2026-09-30 passed 38 E3 and 14 E5 tests. They cover create/edit and semantic retry, transaction rollback, provider logout racing a commit, E5 revocation, missing or changed policy/floor/runtime/audit sources, cross-tenant attempts, rejected client-selected authority, restricted-role privileges, and lookup after an uncertain outcome. On [PR #7](https://github.com/xpike-dgm/kavriva-app/pull/7) code head `a476f8b0e868c993ff27fd40d61bf735cb5fb634`, CI also ran real local Supabase Auth signup, token verification, restricted-role maintenance write and logout/session deletion. The [live Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548660), [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548691), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548343), [architecture and automatic T3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548699) checks passed. The [PR checks page](https://github.com/xpike-dgm/kavriva-app/pull/7/checks) tracks the latest head, including the evidence-only follow-up. The automatic T3 check does not replace the independent reviewer.

This is a runnable consumer maintenance boundary, not a hosted production activation. No hosted Supabase project, production database login, deployment, live customer or paid resource was created or changed. The runtime's future login and DB role binding, real deployment configuration, external audit/floor custody, and all privileged Internal Operations paths need separate activation and review. These local tests do not prove production-current authority. T-E3-001-R1 is awaiting independent task-level T3 review under DEC-0068; T-E5-003 remains IN_PROGRESS. Neither is DONE from this evidence alone.
