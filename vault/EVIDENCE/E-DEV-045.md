---
test_id: E-DEV-045
contract_id_version: ADR-007 environment control; T-E3-032
subject_file: vault/PROFILES/environment-separation.md
subject_digest: ed7b442cf0f0c304a2f7348515fdad95adda0c46a23481c0dd86e874282b0fee
result: "RECORDED source remediation targeted28 tests pass; current independent review pending; hosted issuance and task acceptance HELD"
evidence_links:
  - "vault/PACKS/P-E3-032.md"
  - "vault/REGISTRY/T-E3-032.md"
  - "vault/PROFILES/environment-separation.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-044-E10-GOVERNED-PATHS.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-005-maintenance_api.py.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-005-verify_local_supabase_auth.py.snapshot"
gate_verdict: RECORDED
reviewer: none
timestamp: 2026-10-02
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
depends_on: [P-E3-032, T-E3-032, V-E3-ENV-001, D-APP-DOC-025]
used_by: [P-E3-032, T-E3-032, V-E3-ENV-001]
evidence: []
supersedes: []
status: RECORDED
---

# Environment binding evidence

Implementation acceptance and physical hosted acceptance not yet established. Read-only provider catalog observation: sole existing hosted project tmcitwyzoahtvysxblty; 14 private tables RLS disabled but actual anon/authenticated schema and table privileges absent. Fourth local negative-defense migration not applied remotely. No exposure inferred from RLS flag alone. No provider write/key read/user record inspection/deployment during observation. No GitHub environment or secrets configured. Initial scope does not authorize provider actuation.


## Historical initial implementation subjects and local verification (14537c14)

- `modules/e03-server/internal/environment_binding.py`: e7c4f95dbf42378a80c9d26f789425508f146bbb880d469e9bd90f0365da2c78
- `modules/e03-server/public/maintenance_api.py`: 4de877bfd45bd5aad325e071da415b5a166da49f5c695dad7a92aefc6ebe46c1
- `modules/e03-server/tests/test_environment_binding.py`: 384ff15c7954df57b452d2137a483b032ef7042d6d22dbbf01b4e965422c2861
- `modules/e03-server/tests/verify_local_supabase_auth.py`: a2f35395b00bd25e6f88a5d788676a364b5c6043fd20ba1b9cc409540599f402
- `supabase/environment-bindings.json`: d80749372bfa4f9f09d6abb799375e6976900ca47171a710988a53d6caf1f5b2

Historical pre-review source verification: root ran full native E3 unittest discovery: 120 tests passed in 54.974s. New environment tests: 13 passed. E10 run_all.py: 12 checks and 42 preservation/graph tests passed before the final proof append described below. git diff --check passed. At that time real isolated Auth CI and independent review had not yet completed; their later actual results and corrective review are separately recorded below. No hosted credentials, roles, keys or deployment created; staging/production remain HELD. Actual task acceptance not met by fixture-only identity separation; IN_PROGRESS retained.

## Initial exact-head CI and correction

Historical local E10 run above preceded the final evidence append. At source `14537c14dd2410a9cd6e4ba312a7f8f03340fdaf`, architecture CI rejected this evidence's unreferenced HELD statement; both PR/push runs failed (36969038970 / 36969009228). A resolvable task/profile reference is supplied below; the failed head remains recorded. E3 native (36969038963 / 36969009221), E5 (36969038852 / 36969009257) and real isolated Auth (36969038843 / 36969009226) succeeded at this initial head. The isolated Auth workflow now exercises the validated WSGI entrypoint for enrollment, guarded effect and logout. These successes do not prove hosted separation or production readiness.

Task `vault/REGISTRY/T-E3-032.md`; profile `vault/PROFILES/environment-separation.md`; context `vault/PACKS/P-E3-032.md`. Read-only hosted role catalog found `kavriva_consumer_api` NOLOGIN with no superuser/create-role/create-db/replication/bypass-RLS flags, and no `kavriva_staging_api` or `kavriva_ci_api` login. Direct database IPv6 TCP probe from this workstation was unavailable without any credentials. No provider mutation or key retrieval occurred. A confirmed usable hosted connection plus scoped credential provisioning and custody evidence remain necessary before hosted binding can be BOUND or task DONE.


## Independent source finding and remediation

Actual independent /root/pr47_independent_review, gpt-6-luna max, reviewed 14537c14dd2410a9cd6e4ba312a7f8f03340fdaf and one-file proof correction 442fcd28dc1cb8dace4485f05468e03f93768080, verdict CHANGES_REQUESTED. Actual actions: manually inspected full19file scope, code/API/tests/verifier, raw three archives, digests, reciprocal prerequisite and generated state; reviewer ran no tests or provider calls. Finding: matching DSN login name did not prove actual flags/memberships, so a correctly named elevated/owner login could bind. Also corrected stale evidence wording and historical Auth-review timing. Original failed head/verdict/finding retained; no source PASS reuse. Root added actual read-only preflight and real PostgreSQL negative tests before Auth/command construction. Re-review required; implementation acceptance and physical hosted acceptance remain unestablished.


## Corrected implementation and prepared operation subjects

- `modules/e03-server/internal/environment_binding.py`: b4b5ba7492118267a5cee2ef110c2a602f448d1deaf681f599c934e0ae489bb6
- `modules/e03-server/public/maintenance_api.py`: ae92ddfc4656ee925098ab3a5ebca210c6ed85324bc69fb49c0cec32febf4e1c
- `modules/e03-server/tests/test_environment_binding.py`: b444b1ca7a1ac6e88a66d9cd7079169e1b0548cc456712fa394e7815c1973fe9
- `modules/e03-server/tests/verify_local_supabase_auth.py`: a2f35395b00bd25e6f88a5d788676a364b5c6043fd20ba1b9cc409540599f402
- `supabase/environment-bindings.json`: f62b64c90b5154aeda22444ed749fda749096844c4d59f7f79a61208b6a1cb49
- `supabase/migrations/20261002054900_e3_environment_role.sql`: 357203cc72f5971cfaac872877973cab2cb9e21be18700fa3a6023920c94d928

Root remediation verification: actual isolated PostgreSQL role tests included; 18 environment tests passed. Intermediate full E3 suite passed125 tests in98.855s before the reserved-role migration and session binding amendment. Final-scope suite and CI/re-review still required. The role migration was generated by CLI2.117.0 in a temporary project with resolved filename20261002054900 and implemented after the pack v2 amendment. Existing negative RLS migration payload is unchanged. Operation plan in `vault/PROFILES/environment-separation.md` and context `vault/PACKS/P-E3-032.md`; only prepared, no provider mutation/credential issuance/role activation/public API key retrieval has occurred. Root used an existing CLI credential internally for read-only actual pooler metadata, not a new provider API secret retrieval, never a model-visible value or application identity. Windows Credential Manager staging target is planned, not created. Staging and production remain HELD, taskIN_PROGRESS. This task source now has21 paths: original19 plus generated migration and append-only existing custody profile provenance/currency note. No new runtime seam.


## Final prepared source subjects before re-review

- `modules/e03-server/internal/environment_binding.py`: b4b5ba7492118267a5cee2ef110c2a602f448d1deaf681f599c934e0ae489bb6
- `modules/e03-server/internal/staging_credential.py`: 9ec132edcb0b1e24758b829454ebfe6ca3e5cd8eef4e5e4565290fbe95974a61
- `modules/e03-server/public/maintenance_api.py`: ae92ddfc4656ee925098ab3a5ebca210c6ed85324bc69fb49c0cec32febf4e1c
- `modules/e03-server/tests/test_environment_binding.py`: 44137614c398aa28e740ee26ff07008ea4c29fc1c105a6239df90b851fd1727c
- `modules/e03-server/tests/verify_local_supabase_auth.py`: a2f35395b00bd25e6f88a5d788676a364b5c6043fd20ba1b9cc409540599f402
- `supabase/environment-bindings.json`: f62b64c90b5154aeda22444ed749fda749096844c4d59f7f79a61208b6a1cb49
- `supabase/migrations/20261002054900_e3_environment_role.sql`: 357203cc72f5971cfaac872877973cab2cb9e21be18700fa3a6023920c94d928

Prior corrected full-scope native E3 run passed125 tests in54.680s with the reserved-role migration/session binding; operator added subsequently with real PostgreSQL SCRAM authentication and guarded-failure/cleanup tests. New prepared scope22paths includes explicit reviewed Windows nonproduction operator, no provider execution yet. Actual source/operation re-review and latest all8 CI required before any external effect. Historic CHANGES_REQUESTED finding and architecture failure are preserved. Candidate hosted binding remains HELD; selected local integration does not prove real hosted custody. Full active-record/catalog preservation and actual graph tests are rerun on this prepared source.

## Resume and completed local verification — 2026-10-02

Owner resumed work after safe stop. The outstanding native E3 suite finished normally before shutdown: 129 tests passed in69.796s, exit0. Targeted environment/operator suite:22 tests passed in10.665s; E10 run_all.py:12 checks and42 tests passed. No provider operation, credential issuance, deployment or merge occurred during shutdown or resume. These local checks do not establish hosted acceptance. Source/operation re-review and applicable latest-head CI remain required under `vault/PACKS/P-E3-032.md`; task `vault/REGISTRY/T-E3-032.md` stays IN_PROGRESS and staging/production HELD.

## Independent finding closure in prepared source (no operational acceptance)

Actual independent /root/pr47_environment_rereview, gpt-6-luna max, frozen source c9bde015ac3173bc66e8780de7976c3cef12a76a against f75f6cb2297a78be9c1722eca5af368050828936, verdict CHANGES_REQUESTED. Reviewer inspected source diff and official provider migration-history schema, existing RLS migration scope, proof digests/raw snapshots/reciprocity; ran no tests/CI, provider operations or secret access. Root confirmed all8 source workflows green at c9 plus labelled T3 gate; CI did not close the findings.

Findings retained: persisted SCRAM verifier in provider migration history; exact effective parent grants unproved; interruption/concurrent issuance/orphan store outcomes; unsupported system CA and ambient SSL overrides; global default-privilege scope in existing RLS migration; missing function/procedure ownership; stale evidence summary. Remediation source, not self-PASS: remove every issuance/credential write/delete/account activation/admin API path; `issue` holds before secret/network and inspector is read only. Exact effective non-system usable schema/table/column/sequence/function ACLs, PUBLIC/inherited grants and grant options must match canonical consumer surface; missing/extra privilege holds. pg_shdepend ownership check covers function/procedure and other owned objects. Real isolated PG tests exercise excess table/column/schema/sequence/function/grant-option access, missing grant and hidden function ownership. Public CA bundled with official provenance and exact raw hash; verified hostname/chain with TLS-only diagnostic and no auth/startup/SQL; arbitrary/mutated root and ambient OpenSSL/key-log overrides hold. Task still IN_PROGRESS, operational issuance/deployment/production HELD; context `vault/PACKS/P-E3-032.md` governs v3/v4 withdrawal and re-review.

Existing RLS migration's all-row policy for the bounded consumer and its global ALTER DEFAULT PRIVILEGES revoke on future functions are broader administrative effects than a narrow denial label. It has not been applied remotely. Any future execution review must assess these exact effects and parent grants before applying either schema-defense or NOLOGIN-role migration. No remote operations inherit acceptance from old T016/source CI.

Most recent targeted remediation suite before final scenario-restoration assertions:26 tests passed in14.430s. Full native verification is running; re-review/current-head CI pending. Historical intermediate custody/mutex/SCRAM tests describe superseded unexecuted source only. No hosted role/key/password/provisioning/deployment, publication or merge has occurred.


## Current prepared subjects for independent re-review

- `modules/e03-server/internal/environment_binding.py`: b2b1d9a31d2e5c399836f5fdee61e46f307afbc15893bd42f16773eb7b17def1
- `modules/e03-server/internal/staging_credential.py`: a54b3a971ca1a04cb5b90bf57cf324292d2878ec85e20eba47d9c6f9b705a791
- `modules/e03-server/public/maintenance_api.py`: ae92ddfc4656ee925098ab3a5ebca210c6ed85324bc69fb49c0cec32febf4e1c
- `modules/e03-server/tests/test_environment_binding.py`: 6b82711665ef07480cf7f99614dc60d09bbf27a0db8fdac576775c05898670ec
- `modules/e03-server/tests/verify_local_supabase_auth.py`: a2f35395b00bd25e6f88a5d788676a364b5c6043fd20ba1b9cc409540599f402
- `supabase/environment-bindings.json`: f62b64c90b5154aeda22444ed749fda749096844c4d59f7f79a61208b6a1cb49
- `supabase/migrations/20261002054900_e3_environment_role.sql`: 357203cc72f5971cfaac872877973cab2cb9e21be18700fa3a6023920c94d928
- `supabase/certs/prod-ca-2021.crt`: 700723581420dd1ac98fd7e9ac529f0ef210eadcaf87fc868a3ad7d114c2f3b7

Provider CA comparison permits CRLF/LF serialization equivalence only; all other public payload changes hold. Download raw SHA/provenance remains recorded above. Full diff23 paths, per `vault/PACKS/P-E3-032.md`; role/password issuance remains disabled, not fixed by substituting a secret-bearing query endpoint.

## Verification before source re-review

Native E3 suite:133 tests passed in74.767s, exit0, before the final per-negative-case restoration assertions/CA newline guard. Current E10 suite:12 checks and42 tests passed in0.705s. No external execution. Final source targeted cases and exact-head CI are checked separately; no physical/task PASS implied. `vault/REGISTRY/T-E3-032.md` remains IN_PROGRESS.


## Exact 7b8 review findings and narrow closure preparation

Independent /root/pr47_environment_rereview (gpt-6-luna max) reviewed frozen7b8e7d7f47e2089234c15c94a966648520c284f4: CHANGES_REQUESTED. Actual manual source/digest/snapshot/CA inspection, no tests/CI/provider/secret calls. Prior issuance findings closed for removed activation/write paths, not operational acceptance. Remaining findings: database CREATE/ACL rights and membership ADMIN OPTION omitted; conflicting profile description; latest targeted/CI receipt pending. All8 actual7b8 sourceCI succeeded (PR architecture36982681633/E336982681594/E536982681624/Auth36982681626; push architecture36982674995/E336982674764/E536982674773/Auth36982674768). E3 CI at7b8 ran133 tests in15.526s; final targeted26passed11.149s. No hosted effects.

Root added database ACL allowlist and membership admin/inherit option rejection. Baseline diagnostic on a temporary isolated PostgreSQL showed templates grant CONNECT only, not TEMPORARY; the first28-case run failed due the incorrect template TEMP expectation and is preserved here. Corrected expected baseline:postgres CONNECT/TEMPORARY, templatesCONNECT, noCREATE/delegation. Corrected28 meaningful tests passed in20.004s, including CREATE via login/parent/PUBLIC and admin-option negative/restored-positive. Existing object/schema/sequence/function/column/grant-option and hidden ownership cases pass. Profile inconsistency corrected; root does not self-PASS. Scope remains the same23paths in `vault/PACKS/P-E3-032.md`; task `vault/REGISTRY/T-E3-032.md` stays IN_PROGRESS and issuer/operator HELD. New exact-head re-review/CI required.

Current changed subject digests:
- `modules/e03-server/internal/environment_binding.py`: 8c8eff69042d4c7994861b12cc31aca37765983f933d18c58c43a4e2bedff274
- `modules/e03-server/tests/test_environment_binding.py`: 988d67ba1584faf4a8b6661b69331f6adfd1959cb5fca3ccacac2ca6cb620d57
- `vault/PROFILES/environment-separation.md`: ed7b442cf0f0c304a2f7348515fdad95adda0c46a23481c0dd86e874282b0fee


## Latest CI failure retained — 2026-10-02

At 6e4ec789911d1afebd2641884e78b5915adffb58, E3/E5/architecture and labelled T3 checks passed, but both real local Supabase Auth workflows failed before enrollment with CURRENT_AUTHORITY_UNAVAILABLE (PR run36984557313; push36984553379). No green-all-CI claim or task acceptance. The existing local verifier now calls the unchanged preflight explicitly and prints only disposable local database ACL names/privilege/grant-option metadata on failure; no credentials, DSN, token, provider user, raw exception or hosted operation. This prepares an actual fixture-difference diagnosis, not a relaxed authorization rule. Independent source review remains pending; physical staging/production HELD.

Current verifier SHA256: 185964b413eb683849c38964c9a9e0aa99f530231a81dc3b30a02be47e058fb2.


## Actual local provider ACL diagnosis and fixture correction

At 831eef9ac4c8e65463b67c6d521117224f9a090e, live-auth PR36985338477 failed explicit role preflight. Safe local metadata showed PUBLIC CONNECT/TEMPORARY on additional _supabase and storage_vectors databases; postgres/template privileges matched the canonical expected baseline. The production preflight correctly rejects those extra capabilities and is unchanged. The existing disposable local verifier now revokes only those two PUBLIC capabilities on those two named extra local provider databases before creating the bounded CI role. No other database, grant or hosted provider operation, no broad baseline exception or ACL-check bypass. The test remains an actual isolated Supabase/Auth run with a deliberately narrowed database fixture; hosted custody still requires separate real bounded provisioning. Latest verifier normalized SHA256: cb26bf20913c1e16182ce0ff13f3366d652aa0d27778bf7ea31072c2bc3efc75. Corrected CI and independent exact-head review required; task IN_PROGRESS, staging/production HELD.
