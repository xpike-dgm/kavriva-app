---
test_id: E-DEV-010
contract_id_version: "ADR-006 Decision 9; T-E3-006b Storage/URLs/Studio inventory"
subject_file: vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md
subject_digest: 486BEEF0E6B1316A5A88482D70C9CF4C7841992BF3DFBC4A70AB3ED3D9993F38
result: "RECORDED (hosted ordinary file Storage and URL paths observed; zero file bucket metadata; vector/analytics state unverified)"
evidence_links:
  - "[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]"
  - "[[vault/PACKS/P-E3-006b.md]]"
  - "[[vault/REGISTRY/T-E3-006b.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
  - "supabase/config.toml"
gate_verdict: "RECORDED (independent T3 review PASS for inventory scope; owner acceptance awaited; no activation)"
reviewer: "independent gpt-5.6-luna max sub-agent /root/pr12_independent_review; heads f4db966 and f8fd149 CHANGES_REQUESTED; head dc0841f PASS; owner acceptance awaited"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-010 — Hosted Storage, URL and Studio paths

On 2026-10-01 the active `Kavriva` project `tmcitwyzoahtvysxblty` was read without modifying it. The project detail tool identified its active hosted origin. Read-only SQL counted zero rows in `storage.buckets` and `storage.objects`; `pg_policies` returned no Storage policies. `pg_class` showed RLS enabled for both tables. `has_schema_privilege` and `has_table_privilege` showed Storage schema/table grants for `anon`, `authenticated` and `service_role`. A separate `pg_roles` check showed `anon`/`authenticated` cannot bypass RLS, whereas `service_role` and `postgres` can. The ordinary file metadata counts say nothing about separate vector/analytics buckets or external object bytes. Edge Function listing returned zero functions; an external application host was not inspected.

The scoped Supabase MCP connector returned `Insufficient scope` for its bucket/config tools, so no result is attributed to them. The project-ID-targeted Supabase tool supplied the SQL facts. Supabase CLI 2.117.0 `config pull --project-ref tmcitwyzoahtvysxblty --dry-run` made no file change and showed hosted `site_url` as `http://localhost:3000` with an empty additional redirect list, `storage.analytics.enabled=true` and `storage.image_transformation.enabled=true`. The committed local config instead uses `127.0.0.1:3000`, disables analytics and enables vector Storage. Hosted vector/analytics bucket counts and S3 settings were not available from this read-only scope. A read-only custom-domain query returned `entitlement_required`, so no custom hostname was inferred or purchased.

The CLI retrieved the **publishable** key into process memory solely for four read-only GET probes, without printing or saving it. `/storage/v1/bucket` returned HTTP 200 and `[]`. Public, authenticated and public-image-transformation GETs against a deliberately nonexistent bucket returned HTTP 400, `Bucket not found`. No signed URL was generated, and no private object, user, upload, policy or Storage setting was created. These outcomes establish the probed empty file-route state, not behavior for a future real bucket or separate Storage type.

The inventory additionally names the provider Dashboard/SQL editor path and its ability to bypass the application API boundary, based on current official Supabase documentation. Individual Dashboard members, MFA and sessions were not available from these checks and are left unverified. Hosted S3 compatibility was also not confirmed by the available connector. The task remains REVIEW pending owner acceptance of the independent verdict; T-E3-007's live-bucket bypass tests and T-E3-001-R1's production authorization proof are separate.

The independent Luna Max reviewer `/root/pr12_independent_review` returned **CHANGES_REQUESTED** on PR #12 head `f4db96690b7f9a5be200930daf13fecbd6e13bce`: the first record failed to distinguish `service_role` RLS bypass, omitted vector/analytics and image-transformation surfaces, and inferred absent application deployment and provider bytes from narrower observations. The first correction added the independently confirmed bypass-role query, CLI flags and image route probe, and narrowed those claims. That first finding was not a PASS or owner acceptance.

The same reviewer returned **CHANGES_REQUESTED** on corrected head `f8fd149d5d8e2396e61b4a944d78095c39e4416f` for two remaining record defects: the reproduction text still counted three instead of four GET probes, and summary fields implied no bucket of any Storage type despite unverified vector/analytics counts. The second correction fixed those exact statements. That earlier head's architecture, E3, E5, local Auth and labeled T3 CI checks passed; automation did not replace the independent verdict.

On PR #12 head `dc0841f5d8af73d64cd92626828f57129be6e417`, the independent Luna Max reviewer returned **PASS for T-E3-006b's inventory scope**, with no remaining acceptance finding. It verified the four-probe count, the ordinary-file-only summaries, subject digest, read-only hosted catalog and role checks, empty Edge Function list, and green [architecture/T3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36845991820), [E3](https://github.com/xpike-dgm/kavriva-app/actions/runs/36845991019), [E5](https://github.com/xpike-dgm/kavriva-app/actions/runs/36845991187) and [local Auth](https://github.com/xpike-dgm/kavriva-app/actions/runs/36845990948) checks. The reviewer did not prove vector/analytics bucket contents, hosted S3, external hosting, actual Studio membership/MFA or a real-bucket bypass case. The owner has not yet accepted this delegated verdict; T-E3-006b stays REVIEW and PR #12 stays unmerged. T-E3-001-R1 also stays REVIEW.
