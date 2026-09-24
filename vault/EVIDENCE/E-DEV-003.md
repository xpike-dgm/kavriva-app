---
test_id: E-DEV-003
contract_id_version: ADR-004 Decision 1; C5.2/F5.2.1/FL5.2.1; T-E5-003
subject_digest: AE025B2F86BB2A3A746E55C2EAA0765F9C0BAE9A57C863955D1E782AA7020FA3
subject_file: modules/e05-identity/internal/postgres_decision.py
decision_digest: BF34EE43375DD41B6CCFFAA6EFE2C4BC16B02D2376D371015C28FCCFF414159B
schema_digest: 26E1602F2702B66C65DFC7943D528399978D301F97D2A6C8EA06CE6B2A49518E
result: "RECORDED (9 native PostgreSQL tests passed locally)"
evidence_links:
  - "[[vault/PACKS/P-E5-003.md]]"
  - "[[vault/REGISTRY/T-E5-003.md]]"
  - "modules/e05-identity/public/decision.py"
  - "modules/e05-identity/tests/test_postgres_decision.py"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - ".github/workflows/e5-tests.yml"
gate_verdict: "BLOCKED (independent review and production source writers/E3 binding not yet proved)"
reviewer: "implementer self-check only; independent high-impact review pending"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
---

# E-DEV-003 — E5 current authority source

The Supabase CLI generated the additive migration name. The migration creates private, separate actor-epoch, session, grant, policy-head and policy-rule tables. It stores no precomputed ALLOW verdict. API roles cannot access the private schema. The PostgreSQL reader locks the current rows with `FOR SHARE` in a non-autocommit transaction. The E5 decision evaluates exact actor/workload/tenant/scope/classification/action, current epoch, expiration/revocation, current policy version and rule, assurance, competence, independence and operation-bound step-up. Missing authority denies by default; unavailable authority holds.

Nine tests applied the actual migration to an isolated native PostgreSQL server and passed locally on 2026-09-24. They cover an ALLOW from separate current rows, absent/cross-tenant authority, session and grant revocation/expiry, epoch change, current policy change, policy DENY/HELD, policy narrowing, missing transaction, source outage, API-role privilege denial, and row-lock ordering in both concurrent revocation directions. No Supabase account, remote database, production credential or product mutation was used.

The current session/grant/epoch/policy writers and identity provider adapter do not yet exist. E3 has not bound this public decision to a trusted current resource read and a real product-domain write in the same transaction. Protected audit, negative floors, privileged activation and a deployed runtime role also remain separate gates. Therefore this evidence proves a PostgreSQL-backed decision mechanism, not production-current authority or T-E3-001 DONE. The task remains IN_PROGRESS pending an independent review and the missing bindings.
