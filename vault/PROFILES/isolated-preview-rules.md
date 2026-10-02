---
record_id: V-E5-PREVIEW-001
version: 1
purpose: Define and validate credential-free isolated preview rules
domain: untrusted-ingestion
module: e05-identity
owner: E5
implements: [ADR-004, ADR-001, C5.6, F5.6.1, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: isolated-preview-policy
tasks: [T-E5-018]
tests: [modules/e05-identity/tests/test_preview_isolation.py, modules/e05-identity/tests/preview_browser_fixture.cjs, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-INGEST-001, M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-018, T-E5-018, E-DEV-052]
evidence: [E-DEV-052]
supersedes: []
status: REVIEW
---

# Isolated preview rules v1

Canonical T-E5-018: **No creds/APIs/network in preview**; prerequisite T017 bounded internal processing policy DONE at PR52merge50aade7f5c606c30dd56068d93cd9edf49d32706. Accepted appbasead623eac59086ac54aac597fee59cf43b9bc0d80; planmainfa914f013fdcd032faed876689092da245989459. E5 owns this policy, E2 owns product rendering and E3 owns serving/current authorization. This pure internal requirements factory has no product caller, creates no permission and fetches no configured URL.

## Mandatory deployment controls

Boundary configuration requires independent verification of cookie/site separation, credential-free delivery, denied network egress, denied privileged APIs, response-level/direct-entry sandbox, passive text renderer, prohibited native handoff and prohibited navigation/download/print. Every marker must be exactly True plus a nonempty verification reference; missing/unknown/false/truthy string/int fails ISOLATION_UNVERIFIED. These fields are structural trusted-input fixtures, **not authenticated observations or production certification**. Actual E3 adapter must resolve exact current protected observations rather than accepting client-provided flags or a review verdict.

Operations and preview origins must be canonical ASCII HTTPS origins without credentials/path/query/fragment/control characters. Exact same origin, including default-port aliases, is forbidden. Different hostname/subdomain/port does not prove cookie isolation: same-site/domain cookies and real delivery headers require separate verification. No production host/domain/framework/provider is selected here. The future preview endpoint cannot accept application cookies, Authorization or signed original URLs; credential omission must apply before transport, and actual serving must reject credentials, Set-Cookie/CORS grants and insecure redirects.

The factory requires a structurally SCANNED-or-later source record, exact full subject/current receipt/classification, distinct derived object identity, output digest and transformation receipt, and explicitly passive text. Original, received/unscanned/failed/lifecycle-closed sources, stale generation/receipt/classification and unknown/active derived format are blocked. These are fixture provenance checks, not proof of actual scanning/derivation/current source truth. Equal byte digests can occur for distinct originals/derivatives; provenance never follows from bytes alone. Processing readiness does not grant access, correctness, approval or publication.

Embedded derivative source context is type-checked before comparison: exact Subject with validated fields, nonempty plain-string source receipt and classification. Objects with caller-defined equality cannot impersonate the source or run comparison callbacks. These structural guards still do not authenticate a real producer or prove an observed transformation.

## Required browser and serving constraints

Returned immutable requirements have intrinsic UNTRUSTED_PREVIEW/NONE, empty iframe sandbox tokens and request credential mode omit. Response headers require CSP default/script/connect/image/style/font/media/object/frame/worker/base/form denial, frame-ancestors restricted to the configured operations origin and an empty response sandbox for direct entry. Cache-Control no-store, Referrer-Policy no-referrer, nosniff, explicit HTML UTF8 and restrictive Permissions-Policy are required; no Set-Cookie/CORS grant is emitted. Headers must be actual responses, not a report-only or meta-policy substitute.

Baseline preview is **passive escaped text only**, no untrusted HTML, scripts, links, forms, frames, styles, fonts, images, attachments, active document formats or auto-detected native viewers. Actual derived content production must neutralize these features and preserve original/derived exact lineage and classification. This task contains no product renderer/parser/CDR/upload/scan worker. The hostile raw HTML below is only a negative browser test, never an approved preview format.

An iframe sandbox alone does not deny arbitrary resource fetches or all self-navigation. Separate cookie/site isolation, no active/navigation-bearing content, actual network containment and direct-entry response sandbox are cumulative requirements. Browser headers cannot establish complete privileged API, clipboard/export, native print/viewer or compromised-renderer containment. Uncertain controls, unsupported browsers or renderer compromise keep actual preview HELD; human inspection/standalone printing cannot be authorized by this policy. Original-file access remains a separately governed capability and never follows from scanning.

## Actual synthetic browser witness

`modules/e05-identity/tests/preview_browser_fixture.cjs` is a test-only HTML/server harness; it reads headers from the Python policy fixture. Existing bundled Playwright1.62.1 launched installed Chrome154.0.8037.93 headless in a fresh context with CSP enforcement/browser sandbox and no user profile. Two ephemeral loopback HTTP servers use distinct hosts127.0.0.1 and127.0.0.2; a synthetic host-only HttpOnly cookie is placed only on operations. No real account/file/session/credential/domain/deployment is used.

Actual PASS: three preview deliveries contain no cookie/Authorization/referrer; raw hostile script does not execute, image/frame resources do not reach the prohibited endpoint, button/form and top navigation do not leave their page, the parent cannot read the iframe document, cookie access fails with SecurityError, direct entry retains response sandbox, escaped passive text is unchanged and creates zero active DOM elements. No popup/dialog/download event occurred; this is absence during these probes, not a complete handoff/print denial experiment.

Only frame-ancestors is replaced with the ephemeral HTTP operations origin for this fixture; production HTTPS requirement remains unchanged. Automation evaluation reads sandbox state through developer tooling, not page-granted scripting/API permission. A harness route fences other destinations; no external request was attempted. That fence is not a production egress-control implementation. This one Chrome/Windows synthetic fixture is not HTTPS/mobile/cross-engine/native-print/real producer/compromised-renderer or end-to-end product acceptance. Unit tests independently reject weakened/missing settings; actual composite F5.6.1/FL5.6.1 test remains MISSING.

## Ten-layer trace and remaining gaps

ADR004R7/ADR001R4 → C5.6 → F5.6.1 → FL5.6.1 → T-E5-018 (T017 prerequisite) → M-E5-001 internal policy → E-DEV-052. Each denial returns to approved quarantine-first/no-trust-root requirements. Canonical acceptance matrix joins E3 object boundary/serving and E5 pipeline/preview as physical test; this rules/fixture slice does not close that composite.

| Layer | Boundary |
|---|---|
| task | Executable preview rules with unit/local browser fixture; actual integration unperformed |
| feature | Isolation requirements only; real source handling MISSING |
| flow | No E2/E3 consumer, actual authenticated serving HELD |
| requirement | No credentials/APIs/arbitrary network/active/native escape; unknown HELD |
| design | Policy API; synthetic HTML is not product UI, accessibility/mobile unverified |
| architecture | Same E5 internal state reuse; E2 rendering/E3 enforcement unchanged, no new runtime seam |
| data/migration | Fixture exact derived/source context; no canonical schema/persistence/custody |
| release | No actual origin/host/provider/billing/provisioning/production activation |
| product-scenario | Eleven configuration/type negatives plus one Chrome local fixture; product/HTTPS/mobile/native containment MISSING |
| gap-audit | Real canonical observation producers/renderer/transport/egress/revocation/audit/floor attributed E3/E2/E5; no owner debugging |

E3R1 REVIEW/E5-003 IN_PROGRESS/physical provisioning/privileged production HELD unchanged. No actual view/access/audit/classification/release operation, no automatic safety or authorization proof. Source `vault/PROFILES/quarantine-processing-policy.md`; code `modules/e05-identity/internal/preview_isolation.py`; pack `vault/PACKS/P-E5-018.md`; task `vault/REGISTRY/T-E5-018.md`; proof `vault/EVIDENCE/E-DEV-052.md`; capsule `modules/e05-identity/MANIFEST.md`; addresses `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Source authority

- [Pinned ADR004R7](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md) and [historical section9 detail](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-004__IDENTITY_AUTHORIZATION_AUDIT_UNTRUSTED_INGESTION.md)
- [WHATWG HTML iframe sandbox](https://html.spec.whatwg.org/multipage/iframe-embed-object.html#attr-iframe-sandbox), living standard updated2026-10-01, read2026-10-02: sandbox flags constrain execution/navigation/origin; hostile content needs independent domain and direct-entry protection.
- [W3C CSP3](https://www.w3.org/TR/2026/WD-CSP3-20260916/), Working Draft2026-09-16, not Recommendation; response sandbox and resource/form directives provide distinct constraints.
- [Playwright BrowserType](https://playwright.dev/docs/api/class-browsertype), read2026-10-02; headless existing browser in separate test context, no bypassCSP/default profile/install.
