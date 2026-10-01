---
test_id: E-DEV-003
contract_id_version: ADR-004 Decision 1; C5.2/F5.2.1/FL5.2.1; T-E5-003
subject_digest: AE025B2F86BB2A3A746E55C2EAA0765F9C0BAE9A57C863955D1E782AA7020FA3
subject_file: modules/e05-identity/internal/postgres_decision.py
decision_digest: BF34EE43375DD41B6CCFFAA6EFE2C4BC16B02D2376D371015C28FCCFF414159B
schema_digest: 26E1602F2702B66C65DFC7943D528399978D301F97D2A6C8EA06CE6B2A49518E
result: "RECORDED (9 native PostgreSQL tests passed locally and on PR #4 CI)"
evidence_links:
  - "[[vault/PACKS/P-E5-003.md]]"
  - "[[vault/REGISTRY/T-E5-003.md]]"
  - "modules/e05-identity/public/decision.py"
  - "modules/e05-identity/tests/test_postgres_decision.py"
  - "supabase/migrations/20260924102337_e5_current_authority.sql"
  - ".github/workflows/e5-tests.yml"
gate_verdict: "BLOCKED (PR #4 scoped T3 review approved; production source writers/E3 binding not yet proved)"
reviewer: "owner-supplied independent T3 review of PR #4 head a85a353c55e043773d98dcddef2bc9e46402ecd0; approval limited to E5 decision source"
timestamp: 2026-09-24
status: RECORDED
last_verified: 2026-09-24
---

# E-DEV-003 — E5 current authority source

The Supabase CLI generated the additive migration name. The migration creates private, separate actor-epoch, session, grant, policy-head and policy-rule tables. It stores no precomputed ALLOW verdict. API roles cannot access the private schema. The PostgreSQL reader locks the current rows with `FOR SHARE` in a non-autocommit transaction. The E5 decision evaluates exact actor/workload/tenant/scope/classification/action, current epoch, expiration/revocation, current policy version and rule, assurance, competence, independence and operation-bound step-up. Missing authority denies by default; unavailable authority holds.

Nine tests applied the actual migration to an isolated native PostgreSQL server and passed locally on 2026-09-24. They cover an ALLOW from separate current rows, absent/cross-tenant authority, session and grant revocation/expiry, epoch change, current policy change, policy DENY/HELD, policy narrowing, missing transaction, source outage, API-role privilege denial, and row-lock ordering in both concurrent revocation directions. No Supabase account, remote database, production credential or product mutation was used.

For PR #4 code head `04968cf17956bbf5305e330a3d1df61fe5134434`, [E5 native PostgreSQL CI](https://github.com/xpike-dgm/kavriva-app/actions/runs/35987929237), [architecture checks and the automatic T3 gate](https://github.com/xpike-dgm/kavriva-app/actions/runs/35987950891) passed. These checks are reproducibility and test evidence; they do not substitute for a human independent review.

On 2026-09-24 the owner supplied an independent T3 second-eye verdict for PR #4 head `a85a353c55e043773d98dcddef2bc9e46402ecd0`: **approved for the E5 current decision source only**. The review confirmed locked current rows, reason-coded ALLOW/DENY/HELD, nine native PostgreSQL tests, green CI, and matching code/schema digests. It explicitly kept T-E5-003 IN_PROGRESS and T-E3-001 not DONE because live identity writers and the E3 integration are absent. This verdict was supplied in the task conversation; it is not a submitted GitHub PR review. The reviewed E5 code and migration were unchanged when PR #3's merged branch was integrated into PR #4; the generated task indexes were refreshed from the registry. CI passed again on PR #4 head `10f0884401eba6e372464de9cca926ca05d0fdfe`.

The current session/grant/epoch/policy writers and identity provider adapter do not yet exist. E3 has not bound this public decision to a trusted current resource read and a real product-domain write in the same transaction. Protected audit, negative floors, privileged activation and a deployed runtime role also remain separate gates. Therefore this evidence proves a PostgreSQL-backed decision mechanism, not production-current authority or T-E3-001 DONE. The task remains IN_PROGRESS pending the missing bindings.
