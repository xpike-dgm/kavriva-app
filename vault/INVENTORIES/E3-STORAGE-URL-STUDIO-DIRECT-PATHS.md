# T-E3-006b — Storage, URL and Studio direct-path inventory

Observed on 2026-10-01 for the active hosted `Kavriva` Supabase project `tmcitwyzoahtvysxblty`. This is a point-in-time inventory of present paths and their authority. It does not activate file handling, prove future-bucket isolation or replace the bypass tests in T-E3-007. No external application-hosting environment was inspected.

## Repository surface

| Surface | Committed state | Boundary |
| --- | --- | --- |
| `supabase/config.toml` Storage | Local file Storage, S3 protocol and vector Storage are enabled; analytics Storage is locally disabled. The example file bucket is commented out. No project-owned bucket or Storage policy appears in the three committed migrations. | Local service flags do not establish a hosted bucket, permission or S3/vector route. |
| E3 product HTTP routes | Enrollment, maintenance create/correct and operation lookup are the only application routes. No repository Storage SDK call, direct object URL, signed-URL issuer or browser upload/download route was found. | The current E3 server has no file-serving product path. |
| `vault/PROFILES/authorization-tuple-browser.md` | Future browser rules prohibit generic private-object authority, require server-mediated checks and treat signed URLs as transferable handles. | A specification, not an implemented browser or Storage policy. |
| Local Auth redirects | `site_url = "http://127.0.0.1:3000"` and `additional_redirect_urls = ["https://127.0.0.1:3000"]`. | These are local configuration, not the hosted allowlist. |

## Hosted Storage and client paths

Read-only catalog queries returned **0 rows in `storage.buckets`, 0 rows in `storage.objects` and 0 policies on `storage` tables**. These are metadata counts; external object bytes and separate vector/analytics services were not enumerated. `storage.buckets` and `storage.objects` both have row-level security enabled. PostgreSQL table grants for `anon`, `authenticated` and `service_role` include Storage table operations. `anon` and `authenticated` have `rolbypassrls=false`, so the grants do not pass their missing row-level policies. `service_role` and `postgres` have `rolbypassrls=true` and can bypass RLS; their keys or sessions must never be treated as product-client authority. The present file-object metadata contains no Kavriva bucket or object, but this does not prove absence of bytes in every provider storage plane.

| Direct path | Observed with the project's publishable key | Meaning and limit |
| --- | --- | --- |
| `GET /storage/v1/bucket` | HTTP 200, empty array | The anonymous client can query bucket metadata but there is currently nothing to list. A future bucket requires a new review. |
| `GET /storage/v1/object/public/{bucket}/{path}` | HTTP 400, `Bucket not found` for a deliberately nonexistent bucket | No public asset exists at that probe path; this does not test a future real bucket. |
| `GET /storage/v1/object/authenticated/{bucket}/{path}` | HTTP 400, `Bucket not found` for the same nonexistent bucket | No private asset exists at that probe path; this does not prove future Auth/RLS behavior. |
| `GET /storage/v1/render/image/public/{bucket}/{path}?width=100` | HTTP 400, `Bucket not found` for the same nonexistent bucket | The hosted CLI dry-run reports image transformation enabled. The route responds, but no real image or transformation result was tested. |
| Signed download or upload URL issuance | No repository issuer, ordinary file bucket/object metadata or observed issued URL | Issuance was not called. A future signed URL can grant its holder access until expiry; it is not a fresh E3/E5 authorization decision. |
| S3-compatible Storage path | Local config enables the protocol; hosted per-service setting was not exposed by the available scoped connector | No hosted S3 credential or access attempt was made. It remains an explicit direct path to test if Storage is enabled for product use. |
| Vector buckets and indexes | Local config enables vector Storage; hosted bucket/index list was not available from the scoped connector | This is a separate alpha Storage surface, not covered by the zero rows in `storage.buckets` or `storage.objects`; no vector access test was made. |
| Analytics buckets | Hosted CLI dry-run reports analytics Storage enabled, while local config disables it; hosted analytics bucket list was not available from the scoped connector | This is a separate Storage surface. The ordinary file-object SQL counts do not establish its bucket count or access rules. |

The hosted project currently has **0 Edge Functions**. No committed application endpoint issues a Kavriva file URL. Deployment to a non-Supabase host was not inspected. Supabase's file, vector and analytics Storage APIs and Dashboard administration remain provider surfaces, even with no repository file feature.

## API, redirect and administrator URLs

The observed hosted API origin is `https://tmcitwyzoahtvysxblty.supabase.co`. `/auth/v1` and `/storage/v1` are provider endpoints at that origin; `/rest/v1` and `/graphql/v1` are covered separately by the DB/RPC inventory. The hosted Auth configuration read with CLI `config pull --dry-run` reported `site_url = "http://localhost:3000"` and **zero additional redirect URLs**. This differs from the committed local `127.0.0.1` values. Neither configuration names a production browser origin. No browser login or redirect was attempted, and no hosted Auth setting was changed. A custom-domain read returned `entitlement_required`; no custom domain was purchased, configured or tested here.

The Supabase project Dashboard/Studio at `https://supabase.com/dashboard/project/tmcitwyzoahtvysxblty` is a **provider administration surface**. Its SQL editor and Storage/Auth controls can act outside the Kavriva E3/E5 request path; an administrator's SQL access is therefore not an acceptable product approval, publication, audit or private-object route. Supabase documents that Dashboard SQL editor queries run through the `postgres` database role. The earlier DB/RPC inventory found `postgres` to be the only member of the private `kavriva_consumer_api` role. Actual organization memberships, MFA, Dashboard session settings and individual human access were not inspected by this inventory. They must not be inferred from empty ordinary file Storage metadata. Studio is not a Kavriva Internal Operations app.

## Reproduction and remaining gate

Use the active project ID above. In read-only SQL, count `storage.buckets` and `storage.objects`; inspect `pg_policies` for schema `storage`, `pg_class.relrowsecurity` for `buckets`/`objects`, and effective table privileges with `has_table_privilege` for `anon`, `authenticated` and `service_role`. Compare the committed Storage/Auth config with CLI `config pull --project-ref <ref> --dry-run`, printing only the non-secret site URL, redirect and Storage feature-flag fields. List Edge Functions. Retrieve the publishable key in memory, issue the four GET probes above, then discard it. The inspection made no bucket, object, policy, URL, secret, user or database change.

Before a file feature or privileged browser is activated, T-E3-007 must test a real private bucket and adversarial client/Studio paths, including cross-tenant reads, list/upload/download, transformed images, signed-URL lifetime and privileged bypass. Vector/analytics bucket state and hosted S3 settings require separate provider-scope verification before those capabilities are used. Production redirect and administrator access settings also need explicit verification. Until then, this inventory supports route awareness only; it does not prove product authorization or T-E3-001-R1 completion.

Provider behavior references: [Storage bucket access models](https://supabase.com/docs/guides/storage/buckets/fundamentals), [Storage access control and service-key bypass](https://supabase.com/docs/guides/storage/security/access-control), [signed URL behavior](https://supabase.com/docs/guides/storage/serving/downloads), [image transformation routes](https://supabase.com/docs/guides/storage/serving/image-transformations), [vector buckets](https://supabase.com/docs/guides/storage/vector/introduction), [Dashboard access roles](https://supabase.com/docs/guides/platform/access-control), and [Dashboard SQL editor execution role](https://supabase.com/docs/guides/troubleshooting/tracking-postgres-role-activity-to-specific-dashboard-users-8d3715). The Supabase changelog was checked on 2026-10-01; no listed Storage breaking change altered this read-only inventory.
