---
record_id: V-E5-AUTHMETHOD-001
version: 1
purpose: Specify the privileged phishing-resistant login method without implementation
domain: privileged-identity
module: e05-identity
owner: E5
implements: [ADR-004, C5.3, F5.3.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: privileged-login-method-specification
tasks: [T-E5-007a]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-007a, T-E5-007a, E-DEV-048]
evidence: [E-DEV-048]
supersedes: []
status: REVIEW
---

# Privileged login method specification v1

T-E5-007a requires **Specify method, no numerics, no implementation**. Plan main fa914f013fdcd032faed876689092da245989459; accepted app base0a90108921be46319fc20fc4992e999964491677. This specifies a required method class for privileged Internal Operations. It selects no identity provider, plan, authenticator product, web framework, deployed origin, RP domain, credential service or production account. Consumer Supabase Auth and account-light local use are unchanged.

## Required method class

Use asymmetric, verifier-name-bound WebAuthn/FIDO2-class authentication with required user verification for privileged login. Successful authentication establishes a current session identity only; it does not establish technical competence, independence, resource ownership or permission to approve/publish. The current E5 tuple/E3 commit gate remains required for each sensitive effect. A biometric, screen label, hardware brand, `passkey`, `aal2` or `GA` marketing claim is not proof that this composition meets Kavriva's requirements.

The protocol basis is public-key credentials scoped to a relying party. The future verifier must check the stored credential/principal binding, expected ceremony type, fresh challenge, exact allowed origin, RP identifier hash, presence and required verification flags, and the assertion signature. Reject stale/replayed or wrong-account proof. Treat counters and authenticator metadata according to the reviewed standard/composition; do not invent a universal counter threshold or use a browser flag as server validation. Registration and assertion validation are separate ceremonies; both require a reviewed relying-party policy. [W3C WebAuthn Level2 Recommendation](https://www.w3.org/TR/2021/REC-webauthn-2-20210408/#sctn-rp-operations), checked2026-10-02.

Phishing resistance comes from binding authentication output to the legitimate verifier rather than relying on a person noticing a fake page. WebAuthn is a verifier-name-binding example. Require an authenticated protected channel and controlled secure origins; no client-selected verifier or insecure transport downgrade. This capability alone does not establish a deployed assurance level, whole-system security or recovery custody. [NIST SP800-63B-4 authenticator requirements](https://pages.nist.gov/800-63-4/sp800-63b/authenticators/#phishing), checked2026-10-02.

## Kavriva lifecycle and authority requirements

| Boundary | Required policy and still-missing proof |
|---|---|
| Principal and credential binding | A separately identified current operator, a governed enrollment/change path, reviewed public credential binding and server-side verification; no shared administrator or client-selected actor as truth |
| Provider or local credential composition | No provider winner is selected. Existing ADR-004 single-Supabase versus separate privileged IdP alternatives stay held on common-failure-domain/issuer/custody/recovery/cost evidence |
| Registration/additional factor | Adding/replacing a factor is an access-sensitive operation; a weaker email link, stolen cookie or help-desk reset cannot enroll a new privileged factor without the governed assurance/recovery controls |
| Device-bound versus synced factor | Neither is selected here. Future composition must account for actual key custody, synchronization/enrollment, theft/loss, revocation and clean-room recovery; no automatic acceptance or fallback based on availability |
| Session and step-up | Login is not reusable approval. T-E5-007b owns fresh transaction-bound step-up/recovery-strength rules; T-E5-008 owns bounds, rotation and server revoke. Their numeric policy and product tests remain unperformed |
| Credential/account loss | Recovery revokes and re-authenticates, never grants roles/approval/publication; T-E5-011/012 own recovery and governed last-admin paths. Missing independent recovery custody holds privileged production |
| Cancellation/unsupported factor/outage | No successful privileged session/effect; retain the safe read/recovery boundary and show the held capability. No silent password, TOTP, SMS, magic-link or service-role substitute |
| Actor/session/epoch change | Re-evaluate under current server state; revoked credentials or stale sessions cannot borrow an old method receipt. E3 handles runtime edges through the declared seam |
| Evidence and privacy | Store reviewed public binding and protected audit linkage; no raw private key, biometric, credential response or token in ordinary task evidence/logs. Public metadata is not competence or independent safety approval |

These requirements derive from ADR-004's locked identity/session/recovery/activation rules. They do not issue a credential, register a factor, select an attestation/privacy policy or claim such storage/audit protection has been deployed.

## Rejected substitutes and manual negative walkthroughs

| Countercase | Required outcome |
|---|---|
| Password + TOTP/SMS/magic link labelled phishing-resistant | Reject as the privileged method substitute under ADR-004 |
| Correct factor proof used at a different verifier/origin or for another actor | Reject; never bind to the requested client actor |
| Reused challenge or malformed/missing server-verifiable assertion | Reject; no successful session based on UI/provider metadata |
| Presence accepted while required verification is absent | Reject privileged login; no assurance downgrade |
| Revoked/lost factor restored from an old backup or reused through an old tab | Hold/deny until current state and governed recovery reconcile |
| Factor unavailable, operator switches to shared admin or weaker enrollment | Hold affected privileged path; no access workaround |
| Session authentication treated as competence, publication approval or step-up | Reject; each exact effect remains current-context authorized |
| Provider claim, positive CI, device simulator or this document opens production | Reject; all ADR-004 activation evidence and recovery custody still required |

These are source walkthroughs only. No browser, authenticators, provider, user, credential, enrollment, theft/loss, backup or recovery experiment was performed.

## Proof handoff and ten-layer limits

Forward: ADR-004 Decision3/C5.3 → E5 → F5.3.1 → FL5.3.1 → T-E5-007a → M-E5-001 / this specification → E-DEV-048 bounded source comparison/review. Reverse: each requirement/countercase resolves to that method task and the distinct later step-up/session/recovery/activation owners. The composite acceptance matrix marks FL5.3.1 as **test** across T-E5-007a/007b/008; this task's explicit specification acceptance does not satisfy those physical product tests.

| Closure layer | Evidence boundary |
|---|---|
| task | Method specified; independent review/latest CI required for bounded specification DONE |
| feature | F5.3.1 connection only; full authentication/session/step-up implementation MISSING |
| flow | FL5.3.1 method handoff; actual login/step-up flow unperformed |
| requirement | ADR-004 Decision3 / C5.3 source comparison; no weaker substitute |
| design | No login screen/framework/product selected; later accessible E1/E2 rendering UNVERIFIED |
| architecture | E5 authorizes/E3 serves/E1 renders; existing browser authority boundary, no new runtime seam |
| data/migration | No credential/session schema, key or account change; lifecycle/custody implementation MISSING |
| release | No privileged deployment/production; ADR-004 Decision10 activation HELD |
| product-scenario | Listed negatives need real browser/authenticator/provider/loss/recovery tests later; no synthetic PASS |
| gap-audit | Missing composition, issuer/custody/recovery/assurance/privacy/cost/last-admin proof named; E5 and later implementing task resolve, never owner debugging |

Procedure `vault/PROFILES/account-light-start.md` remains separate consumer scope. Pack `vault/PACKS/P-E5-007a.md`; task `vault/REGISTRY/T-E5-007a.md`; proof `vault/EVIDENCE/E-DEV-048.md`; capsule `modules/e05-identity/MANIFEST.md`; governed addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Pinned Kavriva authority

- [ADR-004 identity/session/recovery/activation](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [Canonical task acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and [composite feature tests](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
- [ADR-010 browser authority](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-010__INTERNAL_WEB_FRAMEWORK_RENDER_AND_HOSTING.md) and [module boundaries](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md)
