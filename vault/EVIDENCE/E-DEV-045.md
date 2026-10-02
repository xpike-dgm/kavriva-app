---
test_id: E-DEV-045
contract_id_version: ADR-007 environment control; T-E3-032
subject_file: vault/PROFILES/environment-separation.md
subject_digest: 832fd783b7edfbbe035d8f813c7694612b0cabd2efd85850173af53252e6c74d
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
depends_on: [P-E3-032, T-E3-032, V-E3-ENV-001]
used_by: [P-E3-032, T-E3-032, V-E3-ENV-001]
evidence: []
supersedes: []
status: RECORDED
---

# Environment binding evidence

No implementation/physical acceptance yet. Read-only provider catalog observation: sole existing hosted project tmcitwyzoahtvysxblty; 14 private tables RLS disabled but actual anon/authenticated schema and table privileges absent. Fourth local negative-defense migration not applied remotely. No exposure inferred from RLS flag alone. No provider write/key read/user record inspection/deployment during observation. No GitHub environment or secrets configured. Initial scope does not authorize provider actuation.


## Actual implementation subjects and local verification

- `modules/e03-server/internal/environment_binding.py`: e7c4f95dbf42378a80c9d26f789425508f146bbb880d469e9bd90f0365da2c78
- `modules/e03-server/public/maintenance_api.py`: 4de877bfd45bd5aad325e071da415b5a166da49f5c695dad7a92aefc6ebe46c1
- `modules/e03-server/tests/test_environment_binding.py`: 384ff15c7954df57b452d2137a483b032ef7042d6d22dbbf01b4e965422c2861
- `modules/e03-server/tests/verify_local_supabase_auth.py`: a2f35395b00bd25e6f88a5d788676a364b5c6043fd20ba1b9cc409540599f402
- `supabase/environment-bindings.json`: d80749372bfa4f9f09d6abb799375e6976900ca47171a710988a53d6caf1f5b2

Root ran full native E3 unittest discovery: 120 tests passed in 54.974s. New environment tests: 13 passed. E10 run_all.py: 12 checks and 42 preservation/graph tests passed. git diff --check passed. Real isolated Supabase Auth is delegated to CI and has not yet run for this head. No hosted credentials, roles, keys or deployment created; staging/production remain HELD. Actual task acceptance not met by fixture-only identity separation; IN_PROGRESS retained. Independent reviewer not yet assigned.

## Initial exact-head CI and correction

Historical local E10 run above preceded the final evidence append. At source `14537c14dd2410a9cd6e4ba312a7f8f03340fdaf`, architecture CI rejected this evidence's unreferenced HELD statement; both PR/push runs failed (36969038970 / 36969009228). A resolvable task/profile reference is supplied below; the failed head remains recorded. E3 native (36969038963 / 36969009221), E5 (36969038852 / 36969009257) and real isolated Auth (36969038843 / 36969009226) succeeded at this initial head. The isolated Auth workflow now exercises the validated WSGI entrypoint for enrollment, guarded effect and logout. These successes do not prove hosted separation or production readiness.

Task `vault/REGISTRY/T-E3-032.md`; profile `vault/PROFILES/environment-separation.md`; context `vault/PACKS/P-E3-032.md`. Read-only hosted role catalog found `kavriva_consumer_api` NOLOGIN with no superuser/create-role/create-db/replication/bypass-RLS flags, and no `kavriva_staging_api` or `kavriva_ci_api` login. Direct database IPv6 TCP probe from this workstation was unavailable without any credentials. No provider mutation or key retrieval occurred. A confirmed usable hosted connection plus scoped credential provisioning and custody evidence remain necessary before hosted binding can be BOUND or task DONE.
