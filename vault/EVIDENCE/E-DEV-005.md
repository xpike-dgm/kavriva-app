---
test_id: E-DEV-005
contract_id_version: authorization-tuple v1 + ADR-004 Decision 1 + ADR-006 Decisions 2-4 and 6; T-E3-001-R1 consumer maintenance binding
subject_file: modules/e03-server/internal/maintenance_command.py
subject_digest: EDAC38A8953980B675CE5B7F606C8C3D22DDED5B8FEA1BD921F08DB76B945902
target_reader_digest: 677EC7361E55F140529C476C9417E7912706055F0C884B9D9D9515EFBBDA0C22
native_test_digest: 1B7E418EF6DFF7F36A460C694DB6A45A042CB8C2D992071E5EB4F65DDCBEEFF0
api_digest: 3A8D77539F7890A0D096A5957E8EB50CC1011C55BCC405A1CE4E7DA7A7E13CE4
e5_public_digest: FF4CD544EABC5FF915B60B1C37CC4B7C609C3C1DCAED9A0E435EA9DCEA2FE41E
auth_digest: 8EFC207384B2E4B01B4C11E56A19360AA898F62910DEF80304F463A9A81FD960
writer_digest: A4E76F89AFF064414FF42D522C17C78FE15273E3FCF166B909C878E894CE2FED
schema_digest: FF693F9B6B216BD930175EF25726ADD7B128B7C47CD539155F177A968878CD52
test_script_digest: E9AED62DC1E7452B5D3FDA2FEEF97273D7EC26808BA63C1A31C2BCCB46E67506
result: "RECORDED (40 E3 and 14 E5 local tests passed after negative-floor remediation; current PR-head CI at linked checks page)"
evidence_links:
  - "[[vault/PACKS/P-E3-001-R3.md]]"
  - "[[vault/REGISTRY/T-E3-001-R1.md]]"
  - "modules/e03-server/public/commit_authorization.py"
  - "modules/e03-server/public/maintenance_api.py"
  - "modules/e03-server/internal/maintenance_command.py"
  - "modules/e03-server/internal/maintenance_store.py"
  - "modules/e05-identity/public/consumer_authority.py"
  - "modules/e05-identity/internal/supabase_auth.py"
  - "modules/e05-identity/internal/postgres_identity_writer.py"
  - "modules/e03-server/tests/test_live_maintenance.py"
  - "modules/e03-server/tests/verify_local_supabase_auth.py"
  - "supabase/migrations/20260930151252_e3_live_authorization.sql"
  - ".github/workflows/e3-live-auth.yml"
gate_verdict: "PASS (PR #7 scope only; owner accepted delegated T3 second-eye; task DONE and production activation withheld)"
reviewer: "gpt-6-luna max sub-agent /root/pr7_independent_review; owner explicitly accepted its corrected-head verdict on 2026-10-01 under DEC-0069"
timestamp: 2026-09-30
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-005.md.snapshot"
metadata_origin_digest: "09ddd3d78d88adf13b83a984a9bf71e6a5c3f260e20318e1ec4c6637c6fed976"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for modules/e03-server/internal/maintenance_command.py"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-DEV-004"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R3"
  - "T-E3-001-R1"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence: []
supersedes: []
superseded_by: []
metadata_verified_at: "2026-10-01"
historical_source_payloads:
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-001-R3.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-001-R1.md.snapshot"
---

# E-DEV-005 — Consumer maintenance login and authority binding

All SHA-256 file digests above use LF-normalized bytes, matching the E10 conformance check and Git's committed text representation.

The bearer-only E3 API validates a consumer access token with Supabase Auth `/user`, derives the actor and session from that verified token, and never accepts a client-selected tenant, cached ALLOW, grant, policy or audit status. In a single PostgreSQL transaction it locks the provider's `auth.sessions`/`auth.users` rows through a private function, checks current E5 session, epoch, grants and policy, locks the E3 motorcycle or record and negative floor, checks the current runtime row, records an operation identity and linked audit intent, then appends a `USER_REPORTED` maintenance revision and committed audit receipt. A missing or changed source denies or holds; uncertain commit results have a canonical operation lookup. One-time enrollment cannot recreate revoked grants or reset an epoch. E3 uses E5's declared public facade.

The SQL migration was generated with Supabase CLI v2.117.0 and applied only to isolated test databases. Its `kavriva_consumer_api` role has no login and no direct Auth-table access; the local CI test creates a temporary login with that role. The provider-session function takes row locks on the real Auth tables without returning personal profile data. Direct client roles have no access to the private command tables.

Local native PostgreSQL suites on 2026-09-30 passed 40 E3 and 14 E5 tests. They cover create/edit and semantic retry, transaction rollback, provider logout racing a commit, E5 revocation, missing or changed policy/floor/runtime/audit sources, cross-tenant attempts, rejected client-selected authority, restricted-role privileges, and lookup after an uncertain outcome. On [PR #7](https://github.com/xpike-dgm/kavriva-app/pull/7) earlier code head `a476f8b0e868c993ff27fd40d61bf735cb5fb634`, CI also ran real local Supabase Auth signup, token verification, restricted-role maintenance write and logout/session deletion. The [live Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548660), [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548691), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548343), [architecture and automatic T3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36744548699) checks passed for that earlier head. The [PR checks page](https://github.com/xpike-dgm/kavriva-app/pull/7/checks) tracks the latest head. The automatic T3 check does not replace the independent reviewer.

A read-only Luna Max sub-agent independently reviewed PR #7 head `04bbbf13f3de95bc84da5b7e73b1d47e47a49b64` and requested changes: an equal or newer `floor_generation` with `blocked=false` could still commit. The correction compares the locked floor to the motorcycle's locked canonical generation for both CREATE and EDIT, with equal/newer floors held, and the migration prevents floor-generation regression. Native tests now cover CREATE at equal/newer floors, EDIT at an older floor and at equal/newer floors, no effect on denial, and rejected regression. The finding was real; the earlier green CI did not exercise it. The correction was sent through CI and re-review. This sub-agent assessment is supplemental and does not replace the project's different-chat task-level T3 review.

The same read-only sub-agent re-reviewed corrected code head `687246ee3f6a865f86914743e3a5a5c2c423879d` and returned PASS for the PR scope. It verified the floor comparison, regression trigger, negative tests and historical snapshot. On that head the [real local Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36748724021), [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36748724017), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36748724006) and [architecture plus automatic T3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36748724009) checks passed. The following `66dd175` commit changed evidence text only; [its PR-head checks](https://github.com/xpike-dgm/kavriva-app/pull/7/checks) also passed.

On 2026-10-01 the sole project owner explicitly accepted this named sub-agent verdict as the T3 second eye for PR #7. [Plan PR #2](https://github.com/xpike-dgm/motobakim-plan/pull/2), merged as `7338818`, records DEC-0069 and the reviewer context. This owner instruction supersedes the earlier DEC-0064 sub-agent exclusion for an owner-accepted, recorded independent review; it does not turn the review into a GitHub account approval. The review is PASS for the PR's tested consumer maintenance scope. The task and production limits below remain.

This is a runnable consumer maintenance boundary, not a hosted production activation. No hosted Supabase project, production database login, deployment, live customer or paid resource was created or changed. The runtime's future login and DB role binding, real deployment configuration, external audit/floor custody, and all privileged Internal Operations paths need separate activation and review. These local tests do not prove production-current authority. T-E3-001-R1 remains REVIEW and T-E5-003 remains IN_PROGRESS. Neither is DONE from this evidence alone.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
