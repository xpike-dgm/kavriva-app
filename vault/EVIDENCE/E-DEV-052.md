---
test_id: E-DEV-052
contract_id_version: "ADR004 R7; ADR001 R4; preview requirements v1"
subject_file: vault/PROFILES/isolated-preview-rules.md
subject_digest: 9b3c7e76d44a98b46c0c8d05fa2770abd66fffeb36408b33f76a1d001805f766
result: "PASS: independently reviewed internal preview rules/local fixture; actual product preview missing"
evidence_links:
  - "[[vault/PROFILES/isolated-preview-rules.md]]"
  - "[[vault/PACKS/P-E5-018.md]]"
  - "[[vault/REGISTRY/T-E5-018.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-051-E10-GOVERNED-PATHS.md.snapshot]]"
  - modules/e05-identity/internal/preview_isolation.py
  - modules/e05-identity/tests/test_preview_isolation.py
  - modules/e05-identity/tests/preview_browser_fixture.cjs
gate_verdict: "PASS (bounded rules/fixture; final audit/latestCI required; actual preview/production HELD)"
reviewer: /root/pr53_proposal_tag_review (gpt-6-luna/max; initial and updated bounded PASS)
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
used_by: [V-E5-PREVIEW-001, P-E5-018, T-E5-018, P-E5-019, E-DEV-053]
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

## Initial independent verdict and stricter derivative types

Actual independent /root/pr53_proposal_tag_review gpt-6-luna/max bounded T3 PASS at exactc0c044c6d6cd07544be53ffc5f748f1ed5242c00 over acceptedad623eac59086ac54aac597fee59cf43b9bc0d80. Reviewer verified thirteen paths/fourteen fields/task authority/dependency/manifest/graph, primary code/unit/browser hashes and exact accepted inventory archive blob. Read-only, no tests/CI/edits/provider operations. No blocking findings in that verdict; actual serving/authenticated observations/production isolation/mobile/native/composite proof remains MISSING/HELD. Reviewer earlier considered embedded derivative field types; root chose to strengthen this structural check before closure. This is an author hardening after actual PASS, not a fabricated reviewer rejection or self-PASS.

All eight applicable actual exactc0c source workflows SUCCESS: labelledPRarchitecture37001876816 (T3 SUCCESS; earlier unlabelled37001854467 also green), E3commit37001854330,E537001854421,liveAuth37001854359; pusharchitecture37001847851,E3commit37001847875,E537001847858,liveAuth37001847936. Exact source E5 CI48testsPASS1.435s. These results and prior hashes belong to c0c and do not substitute updated source review/CI.

Root now requires embedded derivative source to be exact Subject with validated fields, source receipt/classification nonempty plain strings before equality. Added a meaningful equality-callback trap and invalid-field-type regression; caller-defined equality cannot spoof context or execute during the comparison. Eleven updated unit testsPASS0.023s/compilePASS; unchanged synthetic browser fixture rerun with updated policyPASS, same Chrome154.0.8037.93/three deliveries/probes/limits. Current normalized profile8c4340852e65f6b1045c5ec36d2b0626d6ba55ff98f2279e0cb2993ec59e0dcb, codeb41a6e20f953671f406129b3a50913f0e1c40b96073d47b43808c04ec285497a, unitfcb6a1d266e125a2d9521bd15b5766af233ab5509ae4fe459e21399b0d9e774f. Browser/archive/prior proof/inventory/manifest unchanged by this correction. Task remains REVIEW until actual updated independent verdict/currentCI; no production/current authority proof added.

Updated preparation architecture12checks/42regressionsPASS0.468s/diffcheck, existing47-row views remain correct and taskREVIEW. Frozen updated head and exact applicableCI/independent re-review still required. No new paths or runtime/product operation.

## Actual updated independent source acceptance

Independent /root/pr53_proposal_tag_review gpt-6-luna/max actual updated bounded PASS at exactb31056821b9bb48baf402e7602b4d1197e14e2bb versus earlier reviewedc0c, acceptedbasead623eac59086ac54aac597fee59cf43b9bc0d80. Five-file delta scoped, exact Subject validation/plain-string receipt/classification before equality, EqualityTrap/malformed-type coverage and updated profile/code/unit hashes verified. No blocking findings. Read-only review, no tests/CI/provider operations or edits; reported checks remain separate from this verdict. Initial source PASS remains historical, never used as acceptance of b310.

All eight actual exactb310 source workflows SUCCESS: PRarchitecture37003293610 (T3 job SUCCESS), E3commit37003293581,E537003293744,liveAuth37003293553; pusharchitecture37003289536,E3commit37003289535,E537003289542,liveAuth37003289699. Root fetched source E5CI49testsPASS1.453s. Eleven unit/compile/current-policy browser/architecture12+42/diff receipts above are actual preparation checks, not hosted preview proof.

Direct standing ownerDEC0070 accepts bounded internal rules/fixture DONE after independent updated PASS/currentCI. PendingplanPR4notmerged. Primary status-only ACTIVE, packACTIVE/taskDONE/views47actualrows; source profile8c4340852e65f6b1045c5ec36d2b0626d6ba55ff98f2279e0cb2993ec59e0dcb, current normalized profile9b3c7e76d44a98b46c0c8d05fa2770abd66fffeb36408b33f76a1d001805f766. Current codeb41a6e20f953671f406129b3a50913f0e1c40b96073d47b43808c04ec285497a/unitfcb6a1d266e125a2d9521bd15b5766af233ab5509ae4fe459e21399b0d9e774f/browserc4614f11f80f00acfe81fe62e9087abd26c8d11812443d679cc9fe7e2698f9cd unchanged. Prior proof/archive/inventory/manifest untouched by closeout. Final six-path metadata audit/latestheadCI remain separate merge gates; immutable final receipt in PR body. Product rendering/serving/authenticated observation/current effect authorization/HTTPS/cookie/network/privilegedAPI/native/mobile/composite tests remain MISSING/HELD, E3R1REVIEW/E5-003IN_PROGRESS/physicalprovisioning/privilegedproductionHELD preserved. No production activation or preview/original access granted.

Performed final metadata preparation: root architecture12checks/42regressionsPASS0.459s, generated47actualrows/T018boundedDONE/diffcheck. Exactly six metadata/view paths changed after independently acceptedb310; source code/unit/browser/archive/prior proof/inventory/manifest unchanged. Final independent metadata audit/latesthead eightCI must be recorded in immutable PR receipt before normal matched-head merge.

## T-E5-019 secondary inventory custody

AcceptedPR54merge893e3eb63c12c888cd9be014c3a67e2f6bd14f68 inventoryv20 exact raw snapshot `vault/EVIDENCE/SNAPSHOTS/E-DEV-052-E10-GOVERNED-PATHS.md.snapshot`, normalizedSHA256f1565ab09ca21ff3c4703b85681a16657380366ba1e9c494d4ed7f50dfc5570c. Original subject/digest/reviewer/verdict/heads/date/source review history/core/code/unit/browser remain unchanged; documentary consumer and secondary custody only. Context `vault/PACKS/P-E5-019.md`; proof `vault/EVIDENCE/E-DEV-053.md`.
