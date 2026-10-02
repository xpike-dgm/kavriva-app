---
test_id: E-DEV-045
contract_id_version: ADR-007 environment control; T-E3-032
subject_file: vault/PROFILES/environment-separation.md
subject_digest: 048c4c54f0ace41d74516e6958edbad19bfdf5bae0e630a9da57afb8b1abb7b6
result: "RECORDED native E3 120 tests and E10 12 checks/42 tests passed; hosted physical separation unverified"
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
