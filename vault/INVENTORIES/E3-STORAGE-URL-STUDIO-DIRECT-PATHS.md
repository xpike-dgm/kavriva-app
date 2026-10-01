# T-E3-006b — Storage, URL and Studio direct-path inventory

Observed on 2026-10-01 for the active hosted `Kavriva` Supabase project `tmcitwyzoahtvysxblty`. This is a point-in-time inventory of present paths and their authority. It does not activate file handling, prove future-bucket isolation or replace the bypass tests in T-E3-007. The project's application API is not deployed.

## Repository surface

| Surface | Committed state | Boundary |
| --- | --- | --- |
| `supabase/config.toml` Storage | Local Storage and S3 protocol are enabled; the example file bucket is commented out. No project-owned bucket or Storage policy appears in the three committed migrations. | Local service flags do not establish a hosted bucket, permission or S3 route. |
| E3 product HTTP routes | Enrollment, maintenance create/correct and operation lookup are the only application routes. No repository Storage SDK call, direct object URL, signed-URL issuer or browser upload/download route was found. | The current E3 server has no file-serving product path. |
| `vault/PROFILES/authorization-tuple-browser.md` | Future browser rules prohibit generic private-object authority, require server-mediated checks and treat signed URLs as transferable handles. | A specification, not an implemented browser or Storage policy. |
| Local Auth redirects | `site_url = "http://127.0.0.1:3000"` and `additional_redirect_urls = ["https://127.0.0.1:3000"]`. | These are local configuration, not the hosted allowlist. |

## Hosted Storage and client paths

Read-only catalog queries returned **0 file buckets, 0 objects and 0 policies on `storage` tables**. `storage.buckets` and `storage.objects` both have row-level security enabled. PostgreSQL table grants for `anon`, `authenticated` and `service_role` include Storage table operations; those grants alone do not pass row-level policies. With no policies or bucket, the present file-object path has no Kavriva content. A `service_role` or provider administrator is a different, privileged path and must never be treated as a product-client credential.

| Direct path | Observed with the project's publishable key | Meaning and limit |
| --- | --- | --- |
| `GET /storage/v1/bucket` | HTTP 200, empty array | The anonymous client can query bucket metadata but there is currently nothing to list. A future bucket requires a new review. |
| `GET /storage/v1/object/public/{bucket}/{path}` | HTTP 400, `Bucket not found` for a deliberately nonexistent bucket | No public asset exists at that probe path; this does not test a future real bucket. |
| `GET /storage/v1/object/authenticated/{bucket}/{path}` | HTTP 400, `Bucket not found` for the same nonexistent bucket | No private asset exists at that probe path; this does not prove future Auth/RLS behavior. |
| Signed download or upload URL issuance | No repository issuer, bucket, object or observed issued URL | Issuance was not called. A future signed URL can grant its holder access until expiry; it is not a fresh E3/E5 authorization decision. |
| S3-compatible Storage path | Local config enables the protocol; hosted per-service setting was not exposed by the available scoped connector | No hosted S3 credential or access attempt was made. It remains an explicit direct path to test if Storage is enabled for product use. |

The hosted project currently has **0 Edge Functions**. There is no deployed application endpoint or Edge Function that issues a Kavriva file URL. Supabase's standard Storage API and Dashboard administration are still provider surfaces, even with no application file feature.

## API, redirect and administrator URLs

The observed hosted API origin is `https://tmcitwyzoahtvysxblty.supabase.co`. `/auth/v1` and `/storage/v1` are provider endpoints at that origin; `/rest/v1` and `/graphql/v1` are covered separately by the DB/RPC inventory. The hosted Auth configuration read with CLI `config pull --dry-run` reported `site_url = "http://localhost:3000"` and **zero additional redirect URLs**. This differs from the committed local `127.0.0.1` values. Neither configuration names a production browser origin. No browser login or redirect was attempted, and no hosted Auth setting was changed. A custom-domain read returned `entitlement_required`; no custom domain was purchased, configured or tested here.

The Supabase project Dashboard/Studio at `https://supabase.com/dashboard/project/tmcitwyzoahtvysxblty` is a **provider administration surface**. Its SQL editor and Storage/Auth controls can act outside the Kavriva E3/E5 request path; an administrator's SQL access is therefore not an acceptable product approval, publication, audit or private-object route. Supabase documents that Dashboard SQL editor queries run through the `postgres` database role. The earlier DB/RPC inventory found `postgres` to be the only member of the private `kavriva_consumer_api` role. Actual organization memberships, MFA, Dashboard session settings and individual human access were not inspected by this inventory. They must not be inferred from the empty Storage catalog. Studio is not a Kavriva Internal Operations app.

## Reproduction and remaining gate

Use the active project ID above. In read-only SQL, count `storage.buckets` and `storage.objects`; inspect `pg_policies` for schema `storage`, `pg_class.relrowsecurity` for `buckets`/`objects`, and effective table privileges with `has_table_privilege` for `anon`, `authenticated` and `service_role`. Compare the committed Storage/Auth config with CLI `config pull --project-ref <ref> --dry-run`, printing only the non-secret site URL and redirect fields. List Edge Functions. Retrieve the publishable key in memory, issue the three GET probes above, then discard it. The inspection made no bucket, object, policy, URL, secret, user or database change.

Before a file feature or privileged browser is activated, T-E3-007 must test a real private bucket and adversarial client/Studio paths, including cross-tenant reads, list/upload/download, signed-URL lifetime and privileged bypass. Production redirect and administrator access settings also need explicit verification. Until then, this inventory supports route awareness only; it does not prove product authorization or T-E3-001-R1 completion.

Provider behavior references: [Storage bucket access models](https://supabase.com/docs/guides/storage/buckets/fundamentals), [Storage access control and service-key bypass](https://supabase.com/docs/guides/storage/security/access-control), [signed URL behavior](https://supabase.com/docs/guides/storage/serving/downloads), [Dashboard access roles](https://supabase.com/docs/guides/platform/access-control), and [Dashboard SQL editor execution role](https://supabase.com/docs/guides/troubleshooting/tracking-postgres-role-activity-to-specific-dashboard-users-8d3715). The Supabase changelog was checked on 2026-10-01; no listed Storage breaking change altered this read-only inventory.
