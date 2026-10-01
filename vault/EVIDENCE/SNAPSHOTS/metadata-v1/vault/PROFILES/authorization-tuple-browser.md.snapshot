---
profile_of: authorization-tuple
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-006 Decision 9; ADR-004 Rules 1/3/4/7/8; ADR-010 Decision 3; T-E3-006c
supersedes: ~
---

# Browser transport profile of authorization-tuple — T-E3-006c

This is the framework-independent browser transport profile of the existing authorization-tuple contract for the future E2 Internal Operations browser and any browser consumer of E3. It is not a new catalog contract or cross-epic seam. It specifies the acceptance rules; it does **not** select a web framework, enable a privileged browser, create a Storage bucket, or claim that these rules are implemented. The current E3 maintenance API accepts a verified bearer, rejects cookie authentication, and has no E2 browser client. The hosted Supabase project is not part of this proof.

The API authority remains the existing `[[vault/CONTRACTS/authorization-tuple.md]]`; this profile only narrows how a browser can reach that boundary.

## Authority and storage

- The browser may render proposals, status and limited data returned by E3. It cannot treat route guards, hidden controls, cached roles, service workers, Supabase Auth claims, RLS results, Studio or a signed URL as authorization for a product effect. E3 checks the current E5 decision and all relevant floors, versions, operation identity and audit readiness at the effect boundary. Unknown or stale context holds the effect.
- No `service_role`, database login, privileged grant, signing secret, recovery secret, quarantined original or protected audit data is delivered to browser code or browser storage. Access/refresh-token storage for a privileged browser remains unselected until the session-shape gate is proven; localStorage and sessionStorage are not accepted as the privileged credential store. A server-managed session, if selected, uses `Secure`, `HttpOnly`, host-scoped cookies with an explicit `SameSite` policy, rotation and server revocation. Browser cache and service workers must not cache private responses, sensitive operation results or authority decisions. `Cache-Control: no-store` applies to these responses.
- Private originals, quarantine objects and exports are reached only through a server-mediated, per-request authorization and classification check. Quarantined originals are never served from the operations origin; human previews use an isolated rendering surface. Browser-originated upload receives a server-scoped, single-purpose quarantine handle; a successful upload or scan cannot publish an object. No public bucket or generic client Storage mutation/list authority is implied. Signed URLs are transferable bearer-like handles: if later allowed for a low-consequence derivative, the server records the authorized audience and purpose and scopes issuance to a specific bucket/object/version and short expiry. The URL itself does not enforce its intended audience. Record disclosure and treat issued URLs or downloaded bytes as potentially accessible until cache and URL lifetime end. Do not use a signed URL as the sole revoke control for high-consequence private material.

## Browser request boundary

- Production browser and API origins must be an explicit HTTPS allowlist per environment. Compare the entire scheme, host and port; wildcard, reflected or `null` origins do not authorize credentialed requests. Restrict CORS methods and headers to the actual routes, send `Vary: Origin` where responses differ by origin, and never combine wildcard origin with credentials. CORS is a browser transport check, not product authorization; non-browser direct calls face the same E3/E5 gate.
- Any future cookie-authenticated state-changing route requires server-checked anti-CSRF proof bound to the session plus exact Origin/Referer validation and restrictive SameSite cookies. A missing or mismatched proof, absent/untrusted origin, or cross-site fetch is rejected before effect. Cookie-free bearer routes must not silently acquire cookie fallback; their bearer must be verified server-side and the origin/CORS policy still applies to browser use. GET and status lookup never mutate product state. CSRF proof does not replace XSS prevention, input validation or commit-time authorization.
- Any browser OAuth redirect uses an exact environment-specific redirect allowlist, PKCE with state/nonce correlation, one-time code exchange and no token in a URL fragment or log. A callback that fails state, code, redirect or session checks grants no product authority. Provider token validity alone is insufficient for a current E5 session or grant; E3 rechecks those canonical rows for protected actions.
- High-consequence action step-up is fresh and bound server-side to actor, current session/epoch, exact operation ID and immutable fingerprint, action, target/tenant, current target version and a single use/expiry. A step-up for another action, changed payload, stale tab or revoked session is rejected. Browser timestamps and "recent login" UI badges do not prove freshness. If the product has no proven step-up method or independent custody, privileged effects stay `HELD`.

## Lookup and disclosure

- Every operation-status lookup verifies the current requester and exact tenant/object/scope against the canonical operation record before returning a result. A caller cannot learn another tenant's existence, payload, actor, resource ID, audit reference, or success by guessing an operation ID; cross-tenant and unknown-for-caller responses have a generic reason and consistent disclosure shape. Lookup results are minimal, `no-store`, rate-limited and never include credentials, private URLs or authorization tuples.
- A lost response or timeout is `OUTCOME_UNKNOWN` in the browser until same-operation canonical lookup resolves it. The browser retries only with the original operation ID and immutable request fingerprint; it cannot generate a fresh effect from a changed payload. A 2xx transport response, local cache hit, empty queue or rendered success message alone is not proof of a committed effect.
- On logout, epoch change or scope revocation, the browser discards local private view state and object handles and stops pending positive actions. Server-side rejection remains authoritative; already downloaded copies are marked non-retractable rather than described as erased.

## Acceptance examples for later implementation

| Fixture | Required result |
| --- | --- |
| Cross-tenant direct API, guessed operation ID or Storage path | No effect and no other tenant's existence/details disclosed |
| Stale tab, changed E5 grant/policy/epoch, or expired step-up | `DENIED`/`HELD` with stable reason; no positive effect |
| Cookie action from unlisted origin or without matching CSRF proof | Rejected before effect; no CORS reflection |
| OAuth callback with wrong state, redirect or reused code | No session accepted for protected work |
| Signed URL after revoke or browser cache after logout | Never used as evidence of revocation; high-consequence private bytes stay server-mediated |
| Response lost after submit, then same-ID and changed-payload retries | Lookup reconciles the original; changed payload conflicts rather than creating another effect |

Implementation and adversarial browser tests belong to future E2/E3 activation work and T-E3-007. T-E3-006b separately inventories real Storage, URL and Studio surfaces. Those tasks must not infer deployment safety from this document.

Sources: [Supabase private Storage and signed URL behavior](https://supabase.com/docs/guides/storage/serving/downloads), [Supabase PKCE flow](https://supabase.com/docs/guides/auth/sessions/pkce-flow), [Supabase redirect allowlist](https://supabase.com/docs/guides/auth/redirect-urls), [OWASP CSRF guidance](https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html).
