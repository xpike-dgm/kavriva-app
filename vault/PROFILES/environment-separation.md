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

## Current execution boundary — v3/v4 remediation (2026-10-02)

The v2 operation plan above is historical preparation, withdrawn for credential issuance after independent review. No hosted operation has been executed. SCRAM/password material must not be serialized into durable provider migration statements. There is no acceptable reviewed issuance channel at present; issuing/activating a staging credential remains HELD. The operator now contains only selected-target Credential Manager reads and read-only database inspection; no provider administrator credential retrieval, account mutation, credential create/delete, password generator or administrative HTTP route. Its `issue` entrypoint holds before any secret retrieval/network. Process termination cannot leave an account activated by an inspector that has no activation path. Concurrent inspection cannot overwrite custody. The previous cleanup/mutex cases described in intermediate evidence are superseded implementation history, not current guarantees.

Mandatory hosted trust now uses the exact repository-owned public CA `supabase/certs/prod-ca-2021.crt`, raw SHA256700723581420dd1ac98fd7e9ac529f0ef210eadcaf87fc868a3ad7d114c2f3b7, verified before binding, together with verify-full and exact controlled hostname. Official Studio source publishes its HTTPS download location; credential-free PostgreSQL SSLRequest/TLS diagnostic failed with system roots and passed TLS1.3 with this CA. The earlier system-only plan is superseded. Arbitrary CA paths, modified CA bytes, ambient PG/OpenSSL/key-log overrides, weak TLS and trust-store mutations remain forbidden.

Read-only inspection reports role flags/membership/ownership only. It explicitly does not prove complete effective schema/table/column/function grants, deployed custody or task acceptance. These remain physical requirements before any future credential provisioning plan; root privileges on a correctly named parent cannot be inferred from role flags alone. The reserved NOLOGIN and negative-defense migrations remain unexecuted and require a new explicit operational verdict. The prior v2 operation PASS cannot be inferred from source CI. Task `vault/REGISTRY/T-E3-032.md` remains IN_PROGRESS; staging/production and deployment remain HELD under `vault/PACKS/P-E3-032.md`.

Effective access remediation: the runtime preflight compares inherited plus PUBLIC ACLs with the canonical consumer's schema/table/column/function grant surface and rejects unexpected sequence access or delegation/grant options. Non-system accessible functions and relations are included; denied schema access does not conceal an explicit role grant. Missing expected grants hold as well. Ownership uses pg_shdepend rather than relation-only catalogs, covering function/procedure and other ownership. Real PostgreSQL negative cases exercise these changes. The old statement that effective ACL is unverified describes the withdrawn c9 operator, not an accepted current physical credential: an inspector can validate ACL configuration, but deployed custody and task acceptance remain UNVERIFIED.
