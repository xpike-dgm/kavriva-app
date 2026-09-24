---
test_id: E-DEV-004
contract_id_version: authorization-tuple v1 + ADR-004 Decision 1 + ADR-006 Decisions 2 and 3; T-E3-001-R1 maintenance slice
subject_digest: 73E6DA06B8384C417CE7223E99BDA768901FC704B30B7D68A3840E711D319372
subject_file: modules/e03-server/internal/maintenance_store.py
adapter_digest: 9150EABDC24B5D47C72A3BCDFA4A0563C8D7F12FAB3DDB511CFD909E142646D1
gate_digest: 41DB48BBEDAEE594B922050AC13EB5A39AE2EB2EDD7BDE61A1E017DE8EB84EC7
schema_digest: 66BFAA43A7322FD24E906AAEEA1355A956910C6FC931A3D93190512898EBA509
result: "RECORDED (27 E3 and 9 E5 tests passed locally; 11 maintenance PostgreSQL tests)"
evidence_links:
  - "[[vault/PACKS/P-E3-001-R2.md]]"
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/internal/postgres_commit_authorization.py"
  - "modules/e03-server/internal/maintenance_store.py"
  - "modules/e03-server/tests/test_maintenance_store.py"
  - "supabase/migrations/20260924131747_e3_maintenance_records.sql"
  - "[[vault/EVIDENCE/E-DEV-002.md]]"
gate_verdict: "BLOCKED (independent T3 review and production identity, intent, audit, floor and runtime binding absent)"
reviewer: "none; separate T3 review requested for this maintenance integration slice"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
---

# E-DEV-004 — Maintenance integration slice

The owner selected maintenance record create/edit as the first effect to protect. This slice adds private motorcycle and versioned maintenance record tables. A write appends a new revision while retaining prior values, actor, time, operation and correction reason. A user-entered entry is fixed to `USER_REPORTED`; it does not claim that work was verified or reset a maintenance schedule.

The PostgreSQL adapter now accepts a caller-supplied current reader on its own transaction connection. Without that reader it returns HELD; the old precomputed authorization row can be read only with an explicit test-fixture flag. A bare ALLOW result from a reader is also held. The maintenance test composes a locked E3 motorcycle or record read with E5's real locked session, grant, epoch and policy reader, then performs an actual maintenance record create or edit on that same connection. The test denies a revoked session despite cached ALLOW, denies a changed resource classification, and proves an in-flight E5 revocation waits for the record transaction. It also verifies append-only correction history, stale generation rejection, rollback, and denied client-role access. The migration was created with Supabase CLI v2.117.0 and applied only to an isolated native PostgreSQL test server.

The integration's remaining tuple fields for operation intent, protected audit, negative floors and runtime compatibility are explicit **test fixtures**. The test also supplies identity lookup hints; there is no production authentication ingress or E5 session/grant writer. These facts prevent a production ALLOW claim. No account, remote database, live user, deployed API or privileged capability was touched. T-E3-001-R1 stays CHANGES_REQUESTED and T-E5-003 stays IN_PROGRESS. A separate T3 reviewer must inspect this slice before it can be merged or any task verdict can advance.

For PR #6 code head `951d45f`, [E3 native PostgreSQL tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471381), [E5 native PostgreSQL tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471327), and [architecture checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36006471362) passed. The automatic T3 job was skipped on this PR; no human second-eye verdict is recorded yet.
