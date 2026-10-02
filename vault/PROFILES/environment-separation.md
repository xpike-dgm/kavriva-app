---
record_id: V-E3-ENV-001
version: 1
purpose: Enforce distinct server identities and credential references per configured environment
domain: backend-environments
module: e03-server
owner: E3
implements: [ADR-007, C3.8, F3.8.1]
public_contracts: []
internal_scope: server-environment-binding
tasks: [T-E3-032]
tests: [modules/e03-server/tests/test_environment_binding.py, modules/e03-server/tests/verify_local_supabase_auth.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [P-E3-032, T-E3-013, M-E3-001, I-E10-PATHS-001]
used_by: [P-E3-032, T-E3-032, E-DEV-045]
evidence: [E-DEV-045]
supersedes: []
status: REVIEW
---

# Server environment separation

The process must select `KAVRIVA_ENVIRONMENT` explicitly. The controlled catalog binds exact project/Auth issuer, database host/port/name/login, and distinct realm-scoped credential references. The WSGI request cannot override this choice. Generic legacy secret variables are never a fallback. Invalid catalog or missing/HELD selected environment prevents Auth and database effects. Only the selected realm secrets are read; no production secret inspection in tests.

Development uses isolated local Supabase and a fresh limited login. The existing hosted project tmcitwyzoahtvysxblty is reserved for staging, currently HELD until its actual scoped credential/provisioning evidence is recorded. Production has no project or credential binding and remains HELD; it never aliases staging. Different labels alone do not prove physical custody separation. No signer/promoter/root/recovery authority is provided.

T032 remains IN_PROGRESS until configured-environment separation is actually proved and independently reviewed. R1/E5/product activation and all release/promotion holds persist.

Task `vault/REGISTRY/T-E3-032.md`; context `vault/PACKS/P-E3-032.md`; proof `vault/EVIDENCE/E-DEV-045.md`; source [ADR-007](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md).
