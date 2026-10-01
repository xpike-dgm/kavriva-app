---
test_id: E-DEV-010
contract_id_version: "ADR-006 Decision 9; T-E3-006b Storage/URLs/Studio inventory"
subject_file: vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md
subject_digest: C6C4B9ED8B5E0AF95E0AF564CC9A0189F81CECA0BC7EC071FE73A63968A801D1
result: "RECORDED (hosted Storage and URL inventory observed; no bucket or product file path; production isolation unproved)"
evidence_links:
  - "[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006b.md]]"
  - "[[vault/REGISTRY/T-E3-006b.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
  - "supabase/config.toml"
gate_verdict: "RECORDED (independent task-level review and owner acceptance outstanding; no activation)"
reviewer: "none; independent Luna Max task-level review requested at PR readiness"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-010 — Hosted Storage, URL and Studio paths

On 2026-10-01 the active `Kavriva` project `tmcitwyzoahtvysxblty` was read without modifying it. The project detail tool identified its active hosted origin. Read-only SQL counted zero `storage.buckets` and zero `storage.objects`; `pg_policies` returned no Storage policies. `pg_class` showed RLS enabled for `storage.buckets` and `storage.objects`. `has_schema_privilege` and `has_table_privilege` showed Storage schema/table grants for `anon`, `authenticated` and `service_role`; those grants do not override RLS. Edge Function listing returned zero functions.

The scoped Supabase MCP connector returned `Insufficient scope` for its bucket/config tools, so no result is attributed to them. The project-ID-targeted Supabase tool supplied the SQL facts. Supabase CLI 2.117.0 `config pull --project-ref tmcitwyzoahtvysxblty --dry-run` made no file change and showed hosted `site_url` as `http://localhost:3000` with an empty additional redirect list. The committed local config instead uses `127.0.0.1:3000`; it is not a hosted redirect proof. A read-only custom-domain query returned `entitlement_required`, so no custom hostname was inferred or purchased.

The CLI retrieved the **publishable** key into process memory solely for three read-only GET probes, without printing or saving it. `/storage/v1/bucket` returned HTTP 200 and `[]`. Public and authenticated object GETs against a deliberately nonexistent bucket returned HTTP 400, `Bucket not found`. No signed URL was generated, and no private object, user, upload, policy or Storage setting was created. These outcomes establish the present empty route state, not behavior for a future real bucket.

The inventory additionally names the provider Dashboard/SQL editor path and its ability to bypass the application API boundary, based on current official Supabase documentation. Individual Dashboard members, MFA and sessions were not available from these checks and are left unverified. Hosted S3 compatibility was also not confirmed by the available connector. The task remains REVIEW pending independent review, PR checks and owner acceptance; T-E3-007's live-bucket bypass tests and T-E3-001-R1's production authorization proof are separate.
