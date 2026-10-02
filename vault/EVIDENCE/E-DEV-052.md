---
test_id: E-DEV-052
contract_id_version: "ADR004 R7; ADR001 R4; preview requirements v1"
subject_file: vault/PROFILES/isolated-preview-rules.md
subject_digest: f3039bf1c006389a2e3eb754078f291f52318a7b844d2a7c1dcf02843c5bdf44
result: "RECORDED: executable preview rules/unit/local browser witness; independent review/currentCI pending"
evidence_links:
  - "[[vault/PROFILES/isolated-preview-rules.md]]"
  - "[[vault/PACKS/P-E5-018.md]]"
  - "[[vault/REGISTRY/T-E5-018.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-051-E10-GOVERNED-PATHS.md.snapshot]]"
  - modules/e05-identity/internal/preview_isolation.py
  - modules/e05-identity/tests/test_preview_isolation.py
  - modules/e05-identity/tests/preview_browser_fixture.cjs
gate_verdict: "BLOCKED (independent review/currentCI missing; real preview/production HELD)"
reviewer: none (separate gpt-6-luna/max T3 required)
timestamp: 2026-10-02
purpose: Define and validate credential-free isolated preview rules
domain: project-execution
module: e05-identity
owner: E5
implements: [ADR-004, ADR-001, C5.6, F5.6.1, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: isolated-preview-policy
tasks: [T-E5-018]
tests: [modules/e05-identity/tests/test_preview_isolation.py, modules/e05-identity/tests/preview_browser_fixture.cjs, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-PREVIEW-001]
used_by: [V-E5-PREVIEW-001, P-E5-018, T-E5-018]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-052 — isolated preview rules

Canonical sole dependencyT017 accepted bounded policyDONE PR52merge50aade7; T018 acceptance no credentials/APIs/network, composite F5.6.1/FL5.6.1 remains physical test across E3/E5/E2. Sourcecomparison approvedADR004R7/ADR001R4/historicalDEBATE004section9/moduleboundaries/task/acceptance/dependency/packstandard/validation/closure. Thirteen-path fourteen-fieldpack written beforecode. Initialbranch inherited pendingPR53final25a; actual acceptedPR53mergead623eac59086ac54aac597fee59cf43b9bc0d80 reconciled fast-forward beforecode. Planmainfa914f013fdcd032faed876689092da245989459/pendingplanPR4notmerged; directstandingownerDEC0070.

Pure E5 requirements builder: structural processing/exact source/currentreceipt/classification/derivedidentity/digest/transformation context, passive-text-only flag and strict HTTPS origins; every verified boundary control required. Different origins never substitute cookie/site proof; all verification refs/flags/producer/derivation markers trusted-input fixtures, not authenticated actual observation or current permission. Empty iframe and response sandbox, denied resources/connect/script/forms/frames, no credential/CORS/cookie grants, no-referrer/no-store/nosniff/Permissions-Policy. Returned requirements intrinsically NONE/UNTRUSTED_PREVIEW, no renderer/request/storage/transition/access operation, same-capsule internal reuse only.

Initial ten tests failed before freeze because fixture used uppercase classification and a wrong predecessor Observation/advance signature. Root read actual predecessor contract, corrected only new test fixture to lowercase classification/current API, then ten meaningful negatives PASS0.016s. After intrinsic immutable properties/type replacement regression, final ten tests PASS0.015s; full existingE5suite48PASS7.769s using existing pinnedpsycopg isolated nativePG/fakeAuth (no hosted provider). No prior tests/code altered. Compile before intrinsic clarification passed; final compilation/currentCI required.

Actual final synthetic browser fixture PASS with existing bundledPlaywright1.62.1/Chrome154.0.8037.93/headless fresh context and browser sandbox/CSP enforcement, no default user browser. Two ephemeral loopback HTTP hosts127.0.0.1/127.0.0.2; synthetic HttpOnly operations-cookie positive witness present on operations, absent on all three preview requests alongside absent Authorization/referrer. Raw hostile script does not run; image/iframe loads never hit prohibited endpoint; form and top-navigation attempts blocked; parent iframe document null, opaque cookie access SecurityError; direct-entry response sandbox; exact passive escaped text/zero active elements. Zero dialog/download/popup events during these probes, not exhaustive native/print containment. Harness route restricts other destinations; zero external attempts, not actual product egress enforcement. Only CSP frame-ancestors substitutes ephemeral HTTP operations origin; real HTTPS requirement unchanged. No real account/source/user credential/network/hosting/provisioning operation.

NormalizedSHA256 profilef3039bf1c006389a2e3eb754078f291f52318a7b844d2a7c1dcf02843c5bdf44; code d1db3a5a59917ac3aba12bde93d19212fce6c6a9f4feeb73b4a2344512f4c1a0; unit c5670ca3ac5175948e510d52bbe9cad3c24008b2eba78f16e21e25add31d7476; final browser c4614f11f80f00acfe81fe62e9087abd26c8d11812443d679cc9fe7e2698f9cd. Exact acceptedv19 rawarchive byteequal, normalized357a6bd06df5a3e2bfc55aae24af23a23927741c9f2e09244385b9f0f7fdf724. PriorEDEV051 subject/digest/reviewer/verdict/heads/date/rejection/core/code/tests unchanged except actual documentary consumer/secondarycustody. Original401/79catalog/prioradmissions/unmergedPR47v13/E045reservation retained. Architecture/graph/diff/finalcompile/review/exactheadCI pending; no authorPASS.

Actual canonical source/derivation/isolation observation producer, E2 renderer/E3 serving/current transaction authorization/audit/floor/revocation, HTTPS redirect/request handling/credential transport/site boundaries, real network/privileged/native containment, scanner/CDR/mobile/cross-engine/compromised-renderer and composite product tests remain MISSING/HELD. No actual preview/original access or production readiness, no framework/domain/provider selected. E3R1REVIEW/E5-003IN_PROGRESS/provisioning/privilegedproductionHELD unchanged. Source-linked ten-layer profile gap audit attributes future work to E2/E3/E5, never owner debugging or synthetic PASS.

## Prepared source boundary

Root completed compile, architecture12checks/42regressionsPASS0.797s, generated47actualrows/T018REVIEW/diffcheck; historical P-PROOF-001 warning unchanged. Local synthetic browser/fullE5 results are performed receipts, not independent acceptance or GitHub CI. Browser fixture closed its context and both ephemeral servers. This frozen task branch is based on acceptedPR53mergead623eac59086ac54aac597fee59cf43b9bc0d80; prior planPR4 remains unmerged and PR47 physical provisioning unresolved. Independent review/currentCI are separate gates; actual preview/production remains HELD.
