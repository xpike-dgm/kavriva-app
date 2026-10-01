---
test_id: E-DEV-020
contract_id_version: "ADR-002 Option A and Decision 1; T-E3-016 defense v1"
subject_file: supabase/migrations/20261001170755_e3_rls_storage_defense.sql
subject_digest: 99aa82a022ce639809fc45c48c1eb84744af7be938536be3205e8b0d3cc2c384
result: "PASS for isolated defense scope at 1705fcdf: 107 E3 tests, E10, exact-head CI and independent T3 review passed"
evidence_links:
  - "[[vault/PROFILES/rls-storage-defense.md]]"
  - "[[vault/PACKS/P-E3-016.md]]"
  - "[[vault/REGISTRY/T-E3-016.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (isolated defense scope only; owner accepted identified independent verdict)"
reviewer: "independent gpt-6-luna max subagent, PR #22 implementation head 1705fcdf8b2a712d7a7a946be4356fb5b79aa428"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/EVIDENCE/E-DEV-020.md.snapshot"
metadata_origin_digest: "06f91e64ac024c25057dc76e7b9bf5c5cdf10e678772016f55ff55a6bda55ed9"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Preserve scoped conformance and verification evidence for supabase/migrations/20261001170755_e3_rls_storage_defense.sql"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-023"
  - "E3-COMPATIBILITY-CHANGELOG"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-016"
  - "T-E3-016"
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
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PACKS/P-E3-016.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/rls-storage-defense.md.snapshot"
  - "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/REGISTRY/T-E3-016.md.snapshot"
---

# E-DEV-020 — Additional RLS/Storage defenses

The additive migration enables RLS on current private E3/E5/audit tables, permits the existing bounded server grants through a defense policy and restrictively denies anonymous/authenticated clients. It revokes client schema/table/sequence/function access, removes migration-creator defaults and installs restrictive deny policies on existing Supabase Storage objects/buckets. The server's current API/E5 decision remains authority; no client or provider key becomes a product approval.

Five new native PostgreSQL tests passed: full current-table RLS/client policy inventory; read/update/delete/insert denial despite intentionally accidental client grants and permissive policy; no schema/RPC/server membership; migration-creator future table/function default closure; guarded server success and current-floor denial. All 107 E3 tests passed locally. A new local Supabase HTTP runner reuses the byte-preserved earlier direct-path probes and tests restrictive policy presence plus accidental permissive Storage policies, direct replacement/upsert and public-bucket conversion alongside download/transforms/list/upload/delete/sign/Data API negatives. Positive server controls verify route/payload validity. These actual Storage HTTP probes passed in isolated Supabase CI; native fixtures have no Storage service.

Normalized CRLF-to-LF raw-byte digests:

- Migration (subject): 99aa82a022ce639809fc45c48c1eb84744af7be938536be3205e8b0d3cc2c384
- Defense profile: 4d841238721e98ea635488e02e05fa1901f440e4ddd2a8c10e623db359b6f4ea
- Native defense tests: 2ed35d29b42880b80c8d314d4e3926448e7b33a58fadbce3198f15b59c88848a
- New local HTTP runner: 86c0e07ff0c1076f580dbce3c588247ea81950944bf8699eccdffa4f8475239a

Official Supabase RLS/Storage documentation and changelog were checked on 2026-10-01, as linked in the profile. CLI 2.117.0 generated the additive migration; no package/provider upgrade. Isolated PostgreSQL verification uses pinned existing test dependencies. No hosted SQL, advisor, migration, account, bucket, key or deployment action was performed; production inventory/compatibility/privileged custody remains separately gated. RLS cannot contain table owners/BYPASSRLS; existing signed URLs/downloaded copies are not revoked, future tables/creators need explicit controls and isolated HTTP probes are not all-path production proof. T-E3-001-R1 remains REVIEW and physical activation HELD. T-E3-017/018 remain separate tasks.

Baseline and final local all 11 E10 checks passed, generated indexes were rebuilt and git diff --check passed. The first post-change check correctly rejected altering the earlier E-DEV-011 subject probe. That probe was restored byte-for-byte and the new runner reuses it, preserving prior evidence. Exact implementation head 1705fcdf8b2a712d7a7a946be4356fb5b79aa428 passed architecture/T3/E3/E5 CI and both isolated Supabase Auth/Storage runs 36898803901 and 36898798024. The PR is labelled t3-privileged; the PR-event T3 automation passed while push-event T3 was skipped by its label condition. Automated T3 is bookkeeping evidence, not independent approval.

Initial local Supabase CI at adb3dc40 failed during startup/migration before any HTTP probe. The original runner withheld detailed startup logs, so a specific SQL error was not captured. Official Storage schema guidance and the CLI ownership issue motivated replacing provider-table ALTER with a provider-enabled RLS prerequisite check; no ownership bypass is introduced. Startup diagnostics now emit only closed SQLSTATE/known-error tokens, never the credential-bearing log. Corrected-head actual Storage CI passed as recorded above.

Independent delegated gpt-6-luna max reviewer /root/pr22_independent_review returned T3 PASS with no findings for exact implementation head 1705fcdf8b2a712d7a7a946be4356fb5b79aa428. The reviewer independently verified 107 local E3 tests, all 11 E10 checks, diff --check, raw-byte normalized digests, frozen probe integrity and exact-head green CI with actual local Auth/Storage HTTP probes under accidental permissive policies. It confirmed bounded existing server permissions, current API authority, provider-RLS prerequisite, defense-only scope and explicit privileged/hosted limits. It performed no edits or GitHub review/approval/merge. The same reviewer returned PASS for metadata head 030bad6e2f1e4c074ec3efad2fe0f88b31ff4262 and its applicable exact-head green CI, including isolated Supabase runs 36899528820 and 36899534606. On 2026-10-01 the owner explicitly accepted this identified independent verdict under DEC-0069. T-E3-016 is DONE for the tested isolated defense implementation only; hosted deployment, production inventory and privileged paths remain HELD. All four subject digests are unchanged by this acceptance record.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
