---
profile_of: secret-custody-rotation
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Option A and Decisions 1 and 6; T-E3-017; ADR-006 Decision 11
supersedes: ~
---

# Secret custody and rotation rules

## Scope and proof boundary

T-E3-017 defines server-only secret custody and a rotation procedure. It issues no credential, selects no secrets product/account, changes no provider key/password/role/session, and deploys no broker or runtime. Document acceptance cannot prove live custody, successful rotation or emergency recovery. Every operational closure below is currently HELD. T-E3-001-R1 remains REVIEW and physical activation remains HELD; T-E3-018 owns the separate compatibility/changelog procedure.

The Kavriva API remains the product authority boundary. A provider secret, database password, signing key, valid login, RLS pass or administrative console session does not approve a product effect. Current E5 authorization, E3 operation/tuple/floor/audit/runtime checks and declared E6 gates remain necessary. Provider administration is separate from product approval/publication.

## Credential classes and custody

| Class | Permitted custody / consumer | Required restriction and current proof |
|---|---|---|
| Maintenance database credential | Controlled server secret store and exact API workload only; `KAVRIVA_DATABASE_DSN` is the current config input. | Use a deployment-proven login with existing bounded `kavriva_consumer_api` privileges, never `postgres`/owner/BYPASSRLS. Reject wrong project/environment or unexpected memberships. Live login/provisioning and store injection remain HELD. |
| Supabase privileged secret API key or legacy service-role key | Segregated technical administrative/necessary server component path, never a general maintenance credential. | Bypasses RLS; no public client, ordinary AI task or generic tool access. No such key is required by the current maintenance WSGI configuration. Hosted custody and component inventory remain HELD. |
| Supabase Auth signing/private or legacy JWT secret | Provider signing custody or separately reviewed signing administration only. | Do not retrieve it into client/API/AI contexts to verify users; public verification material is not a private signer. Key rotation, user-session revocation and legacy API-key retirement are distinct operations. Live inventory remains HELD. |
| User access/refresh tokens | Existing reviewed user/session transport only. | Sensitive session material, not server infrastructure credentials. Never evidence/log text; do not use rotation as a substitute for E5 revoke/current provider-session checks. |
| Public configuration / publishable key | Exact environment configuration; current `SUPABASE_URL`, `SUPABASE_ISSUER`, `SUPABASE_PUBLISHABLE_KEY`. | Publishable keys and public verification keys are not secrets or product permissions. Never place a privileged key in the publishable slot. Binding to the expected project/issuer stays required. |
| GitHub/provider administration, support and recovery credentials | Separate authorized technical/account actor; controlled store independent enough for the declared outage/recovery purpose. | No standing AI owner/billing/SQL/SSH/global-object access. Legal/account ownership may require an external human actor; the owner is not the technical debugger. Operational actor/store/access proof remains HELD. |
| Backup/object/audit/floor and worker credentials | Separate named components, planes and environments through declared seams. | Narrow permissions and independent custody/recovery; ordinary-project failure must not remove the only recovery access. Inventory and actual isolation remain HELD. |
| Local CI fixture credentials | Isolated test process and temporary runner storage only. | Current Supabase tests read a temporary CLI status file containing local keys. Never print/upload that file or startup logs; cleanup and retention must be verified for the execution environment. These local fixtures do not establish hosted custody. |

## Required non-secret custody record

Each deployed credential must have a record containing references only: credential class and opaque ID/version; exact provider/project/environment and component; permitted resources/actions and role memberships; protected-store and injection mechanism references; accountable technical custodian and external recovery actor; validity/expiry and rotation/revocation triggers; every consumer (API, workers, deployment, support, recovery, connection pools and queued work); leak-detection/redaction and disposal controls; independent review and owner authorization; current status and evidence links. Do not record raw values, connection strings, private URLs, user tokens or secret-derived fragments. Missing custodian, store, scope, consumer or revocation proof keeps use HELD.

Separate development/test/production and administrative/application/recovery credentials. Do not reuse a credential between components merely for convenience. A secret store must restrict read access, protect stored/transferred values, audit retrieval without logging values and inject only into the intended server process. Environment variables are an injection interface, not proof of encrypted custody: protect the source store, process access, crash dumps and diagnostics. No browser/mobile build prefix, repository/config literal, chat, prompt, screenshot, PR, CI artifact/cache, URL argument or ordinary model-visible tool output may carry a privileged secret.

Before later deployment, inspect build output and logs, not only source patterns. Existing CI's secret-pattern scan is a limited detector and can miss new formats; green CI never proves absence of secrets in deployment artifacts. No scanner is changed or new detection coverage claimed by this task. A secret found in Git history/artifacts remains compromised even after deleting the visible text; revoke it and address retained copies through the incident path.

The current maintenance app caches its configured command/auth object in `_configured_app`. Changing the store/environment alone does not reload an already running process. Rotation must restart/recreate and verify every consumer and pool before claiming the old version is gone. The document adds no hot-reload or restart automation.

## Planned rotation procedure

Each step records the exact target, operation/change identity, credential references, technical actor, state, non-secret evidence and stop response. This is an execution specification for a separately authorized operation, not permission to run administrative tools now.

| Step | Required action and evidence | Stop rule |
|---|---|---|
| Prepare | Identify reason, complete consumer/custody inventory, target environment, provider-supported rotation semantics, authority/audit preconditions, technical resolver and recovery/support path. Define justified overlap/expiry/cost limits in the execution record; obtain independent T3 verdict and explicit owner acceptance. | Missing scope/actor/access, unclear revocation or unaffordable mandatory safety keeps execution HELD. |
| Stage replacement | Create/store a replacement through controlled administration without emitting its value. Prove intended role/project/component, minimum privileges and denied cross-environment/client paths in a safe target. | Unexpected access or secret disclosure stops rollout; deny/revoke the replacement as appropriate. |
| Controlled cutover | Switch permitted consumers to the replacement; recreate cached processes/pools; fence affected jobs or retain them for reconciliation. If planned overlap is supported, keep it bounded and track both references. | No blind repeats after a possible write; uncertain result is OUTCOME_UNKNOWN until canonical lookup. Never drain by weakening authority. |
| Verify replacement | Prove current guarded reads/effects where applicable and required negative cases, denied stale/revoked authority, exact runtime/config references, sanitized diagnostics and every consumer's replacement reference. | Partial inventory, mere HTTP success or new-key creation is not cutover proof; affected capability remains HELD. |
| Retire old access | Revoke/delete/disable the old credential according to its specific provider semantics. Resolve existing DB connections, caches, queued work and previously issued tokens/URLs separately; test old access using controlled injection without printing it. | If old access or unverifiable revocation remains, do not claim retirement. Fence/hold and reconcile with technical/support actor. |
| Close | Prove replacement coverage, old-access denial, retained-data/operation reconciliation, current floors/audit and recoverability. Dispose of transient material; independent reviewer verifies evidence and owner accepts the identified verdict. | Close only the proven target/scope. Unproven edges remain HELD; deployment rollback cannot resurrect revoked authority. |

## Provider-specific distinctions to verify at execution

- Modern Supabase publishable/secret keys are separate from legacy JWT-based anon/service-role keys. Creating a new key does not disable legacy access; inventory and retire it explicitly. Privileged API keys map to service-role access and bypass RLS. This is why the ordinary API uses its bounded database credential and publishable Auth input instead.
- For asymmetric Auth signing keys, rotation changes the signer while earlier keys may remain trusted. Revocation and public-key cache refresh need separate proof at each verifier. Private key retrieval is unnecessary for verification. The legacy JWT secret also affects legacy API keys; use the current official migration/retirement procedure before an authorized operation, not a universal replacement recipe.
- Database password replacement, active connection termination/recreation, privileged API-key retirement, Auth session/grant revoke and signed-URL invalidation are separate surfaces. Never assume changing one closes the others. Provider-specific password commands and exact cache/expiry limits must be verified in the later execution pack; none are selected here.

## Compromise, partial cutover and recovery

On suspected exposure, stop affected positive effects, contain the leak path, revoke/fence compromised access through the authorized technical emergency path and preserve only non-secret incident evidence. Do not keep a known compromised credential alive merely to finish a graceful migration. If provider revocation cannot be confirmed, treat access as potentially live and hold the capability. Escalate unavailable administration/custody to the recorded external recovery actor; do not ask the owner to run SQL/SSH or inspect secrets/logs.

A clean planned-rotation failure may revert only to a still-valid, uncompromised version if the reviewed execution plan and current floors/epochs allow it. A compromised/revoked version is never a rollback option. After a partially applied change, inventory which consumers/operations switched, fence uncertain work and reconcile canonical outcomes; restoring an old config or backup cannot restore a revoked credential/grant or lower a floor. Provider/account/billing outage must retain work and report applicable HELD/OUTCOME_UNKNOWN/SERVICE_UNAVAILABLE state without inventing success.

The owner receives a plain-language summary of what stopped, affected users/data, retained work, technical resolver/support, cost and safe recovery choices. Owner decisions are approve/hold/stop or necessary account/legal/support authorization; technical execution remains with the authorized custodian. Ordinary AI receives only broker-enforced narrow task grants under `[[vault/PROFILES/ai-task-scope.md]]`, never raw privileged credentials or authority to self-approve rotation.

## Later operational closure evidence

Require protected-store/access audit and redaction evidence; complete environment/consumer inventory; replacement-positive plus old-access-negative tests; current API authority tests through cutover; cached-process/pool and job reconciliation; provider/session/key/URL distinctions; interrupted/unknown-result and provider-outage drills; emergency revoke and uncompromised-only rollback; independently available recovery custody; independent T3 verdict and owner acceptance. These are required later proofs, not tests performed by this document task.

Document acceptance checks the class/custody rules and actionable planned/emergency rotation procedure without secret values, live execution or invented limits. Reject rules that expose privileged keys to clients/AI, use an owner credential as runtime fallback, equate replacement creation with revocation, reuse compromised access, ignore cached consumers or require owner debugging. Present operational readiness: HELD.

## Dated sources and related scope

Official Supabase [API keys](https://supabase.com/docs/guides/getting-started/api-keys) and [JWT signing keys](https://supabase.com/docs/guides/auth/signing-keys), plus the [changelog index](https://supabase.com/changelog.md), were checked on 2026-10-01. These support the key-class/legacy-retirement and signer/trust/cache distinctions; current behavior must be checked again for actual execution. No provider version, account, secrets product or numeric rotation schedule is selected here.

Existing defense: `[[vault/PROFILES/rls-storage-defense.md]]`; reversibility: `[[vault/PROFILES/backend-reversibility.md]]`; pack: `[[vault/PACKS/P-E3-017.md]]`; state: `[[vault/REGISTRY/T-E3-017.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-021.md]]`.
