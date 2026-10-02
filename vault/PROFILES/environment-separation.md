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
depends_on: [P-E3-032, T-E3-013, M-E3-001, I-E10-PATHS-001, D-APP-DOC-025]
used_by: [P-E3-032, T-E3-032, E-DEV-045]
evidence: [E-DEV-045]
supersedes: []
status: REVIEW
---

# Server environment separation

The process must select `KAVRIVA_ENVIRONMENT` explicitly. The controlled catalog binds exact project/Auth issuer, database host/port/name/login, and distinct realm-scoped credential references. The WSGI request cannot override this choice. Generic legacy secret variables are never a fallback. Invalid catalog or missing/HELD selected environment prevents Auth and database effects. Only the selected realm secrets are read; no production secret inspection in tests.

A read-only database preflight validates the actual current login and database, privilege flags, exact transitive membership (login plus bounded `kavriva_consumer_api` only), and absence of owned schemas/tables/databases before Auth or command construction. An expected account name alone does not pass. Owner, superuser, create-role/create-database, replication, bypass-RLS, unexpected membership, missing/ineligible bounded parent, unavailable metadata or connection holds. This configuration check is re-run per request and is separate from the existing commit-time E3/E5 authority transaction; it never supplies a product ALLOW. Deployment custody/rotation and protected evidence remain physical requirements, not established by this preflight.

Development uses isolated local Supabase and a fresh limited login. The existing hosted project tmcitwyzoahtvysxblty is reserved for staging, currently HELD until its actual scoped credential/provisioning evidence is recorded. Production has no project or credential binding and remains HELD; it never aliases staging. Different labels alone do not prove physical custody separation. No signer/promoter/root/recovery authority is provided.

T032 remains IN_PROGRESS until configured-environment separation is actually proved and independently reviewed. R1/E5/product activation and all release/promotion holds persist.

Task `vault/REGISTRY/T-E3-032.md`; context `vault/PACKS/P-E3-032.md`; proof `vault/EVIDENCE/E-DEV-045.md`; source [ADR-007](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-007__SUPPLY_CHAIN_AND_RELEASE_GOVERNANCE.md).


## Concrete nonproduction operation plan (scope amendment v2)

Target only existing project tmcitwyzoahtvysxblty. No paid plan/project or product deployment. Before any effect obtain an actual independent T3 verdict for this source/operation scope and all8 exact-head CI. Source-reviewed negative-only RLS migration 20261001170755 is applied to this staging target after validating prior three migration identities and actual client ACL denial; no reinterpretation of T016 local proof as hosted proof. Apply new CLI-generated reserved NOLOGIN role 20261002054900; verify exact role flags/membership and parent bounds before credential issuance. Generate independent high-entropy staging-only credential, store DSN exclusively in Windows Credential Manager under Kavriva:staging:database:v1, then enable only kavriva_staging_api with a SCRAM verifier transported internally without model-visible value, arguments or plaintext file. No password, SCRAM verifier, root/PAT, DSN or signing key is recorded in evidence. Existing CLI administrator credential is separate and never becomes API input. Actor/store/version/scope/consumer/nonsecret retrieval receipt is recorded; this is preparation custody only, not deployed workload or production custody proof.

Exact administrative action template: ALTER ROLE kavriva_staging_api LOGIN PASSWORD <internally transported SCRAM verifier>. Only this newly reserved role may change; no extra grant, owner, superuser/create-role/create-db/replication/bypass-RLS. Administrative effects use provider DDL/migration interface with a separately recorded operation name and sanitized input digest, not a schema change disguised as a read. The secret parameter is generated outside model visibility, is not part of source/artifact output, and cannot alter the static action/identity.

Actual read-only official Management API pooler metadata binds aws-1-eu-west-1.pooler.supabase.com to this project. Explicit session port5432 and user kavriva_staging_api.tmcitwyzoahtvysxblty; TLS verify-full and system root trust required. No automatic fallback to direct/transaction endpoint, weak TLS or another project. Retrieve existing public publishable key only; no service-role/private signer. Inject selected values only into a controlled read-only connection and role/identity proof, verify privileges and client ACL denial, then erase process values. No Auth test customer/user, maintenance mutation, GitHub secret/workflow injection or API deployment. Local isolated CI remains independent and reads no hosted secrets.

If any step fails, selected hosted environment stays HELD; disable only the new login and record/verify cleanup without weakening retained negative RLS. Reconcile uncertain role/migration effects before retry. Credential retrieval events are recorded without material; credential target version is distinct from local ephemeral development identities. Production remains without project/credential binding and HELD, including signing/promotion/deployment/rotation staffing. T032 actual canonical acceptance remains unresolved until independently judged against physical evidence; a successfully generated credential alone never closes it.
