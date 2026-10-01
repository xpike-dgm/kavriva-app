---
test_id: E-DEV-020
contract_id_version: "ADR-002 Option A and Decision 1; T-E3-016 defense v1"
subject_file: supabase/migrations/20261001170755_e3_rls_storage_defense.sql
subject_digest: f3bf54d6234a5d5e9751359d0e41880a59898ef6578806f6d16225f25f3ec735
result: "RECORDED: 107 E3 tests and architecture checks passed; local Storage CI and independent review pending"
evidence_links:
  - "[[vault/PROFILES/rls-storage-defense.md]]"
  - "[[vault/PACKS/P-E3-016.md]]"
  - "[[vault/REGISTRY/T-E3-016.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "RECORDED (isolated defense scope; independent review and owner acceptance pending)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-020 — Additional RLS/Storage defenses

The additive migration enables RLS on current private E3/E5/audit tables, permits the existing bounded server grants through a defense policy and restrictively denies anonymous/authenticated clients. It revokes client schema/table/sequence/function access, removes migration-creator defaults and installs restrictive deny policies on existing Supabase Storage objects/buckets. The server's current API/E5 decision remains authority; no client or provider key becomes a product approval.

Five new native PostgreSQL tests passed: full current-table RLS/client policy inventory; read/update/delete/insert denial despite intentionally accidental client grants and permissive policy; no schema/RPC/server membership; migration-creator future table/function default closure; guarded server success and current-floor denial. All 107 E3 tests passed locally. A new local Supabase HTTP runner reuses the byte-preserved earlier direct-path probes and tests restrictive policy presence plus accidental permissive Storage policies, direct replacement/upsert and public-bucket conversion alongside download/transforms/list/upload/delete/sign/Data API negatives. Positive server controls verify route/payload validity. Real Storage HTTP results require CI; native fixtures have no Storage service.

Normalized CRLF-to-LF raw-byte digests:

- Migration (subject): f3bf54d6234a5d5e9751359d0e41880a59898ef6578806f6d16225f25f3ec735
- Defense profile: 9a88e14495881a4cb73dac1b6c369736fe5b41610bace949b3d7bc034d33dc8d
- Native defense tests: 2ed35d29b42880b80c8d314d4e3926448e7b33a58fadbce3198f15b59c88848a
- New local HTTP runner: 86c0e07ff0c1076f580dbce3c588247ea81950944bf8699eccdffa4f8475239a

Official Supabase RLS/Storage documentation and changelog were checked on 2026-10-01, as linked in the profile. CLI 2.117.0 generated the additive migration; no package/provider upgrade. Isolated PostgreSQL verification uses pinned existing test dependencies. No hosted SQL, advisor, migration, account, bucket, key or deployment action was performed; production inventory/compatibility/privileged custody remains separately gated. RLS cannot contain table owners/BYPASSRLS; existing signed URLs/downloaded copies are not revoked, future tables/creators need explicit controls and isolated HTTP probes are not all-path production proof. T-E3-001-R1 remains REVIEW and physical activation HELD. T-E3-017/018 remain separate tasks.

Baseline and final local all 11 E10 checks passed, generated indexes were rebuilt and git diff --check passed. The first post-change check correctly rejected altering the earlier E-DEV-011 subject probe. That probe was restored byte-for-byte and the new runner reuses it, preserving prior evidence. Exact-head CI, independent gpt-6-luna max task review and owner acceptance are pending; task remains REVIEW.
