---
record_id: V-E4-SAFETY-001
version: 1
purpose: Keep declared required safety media nested in one required core without additive budgeting
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, C4.1, F4.1.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: safety-media-nesting
tasks: [T-E4-002]
tests: [modules/e04-offline/tests/test_safety_media_nesting.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E4-001, T-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-002, T-E4-002, E-DEV-061]
evidence: [E-DEV-061]
supersedes: []
status: ACTIVE
---

# Safety media is a subset of required core

Canonical T-E4-002 acceptance Never additive/on-demand-for-size, review gate, hard dependency T-E4-001 DONE at accepted6af8dbf323d2e688b7a6b2d4634e00971672af14. Plan mainfa914f013fdcd032faed876689092da245989459. ADR009R1 / C4.1/F4.1.1/FL4.1.1. Generation/classification E3/E6; E4 consumes via E3 only, no generator/new public seam or runtime permission.

## Actual internal check

check_nesting delegates exact scope/context/manifest/membership/digest verification to accepted T001 check_composition without changing it. Required safety media entries occur among those same complete core parts. Moving an essential to the on-demand declaration cannot replace its missing core bytes; on-demand references cannot duplicate any required core ID even if they claim another revision/digest. Mutable, invalid, hostile or duplicate on-demand declarations rejected by finite reasons. Unrelated on-demand references are untrusted plan inputs, not authenticated classification, fetch permission or measured size.

Frozen NestedCore.required_core_bytes is the sum of the actual complete core payload lengths. safety_subset_bytes counts only safety-media payloads already included in that same total; safety_media_ids names that subset. There is no additive safety budget, size target, trimming/eviction/split branch, policy limit or on-demand-for-size exception. Empty declared media subset can be structurally valid only if all required core roles/bytes match; this never proves that actual media is unnecessary. Hidden omitted required media or coherent upstream false classifications cannot be detected as canonical falsehood; upstream semantic completeness/necessity remains required for real packages. Current result intrinsically NONE and accepted production_gate stays HELD_CANONICAL_PACKAGE_SOURCE_MISSING.

## Verification and separate gates

Ten new probes + accepted12 E4 full22 tests PASS0.019s/compile. Actual bytes/subset count, moved/missing media, overlap despite other revision, duplicate/corrupt bytes, reclassification against old pin, arbitrary fixture lengths with no trimming, empty declared media, unrelated refs, mutable/hostile/invalid/duplicate plan and immutable result/held production tested. Fixture1/8192 byte lengths are synthetic probes, not candidates or production policies. No first-run unit error. No actual network/media decoding/mobile/storage/renderer/source proof.

Task-specific composition/nesting check requires independent full review before DONE. Real E3 expected manifest origin/semantic safety classification/complete current generation/compatibility/recovery/floors, E1 media/warning display, device/accessibility, encrypted storage/staging/promotion and offline actionability stay MISSING/HELD. They are separate product gates, not a fabricated hard dependency or an actual approved package from this internal check.

## Trace

ADR009R1 -> C4.1 -> F4.1.1 -> FL4.1.1 -> T-E4-002 -> M-E4-001 -> E-DEV-061. Task/feature/flow/requirement supplied-core membership only; design no screen; architecture internal E4 checker uses accepted same-capsule checker; data pure immutable counts no format/schema/storage; release no authority; product scenarios fixture-negative only; gap audit above.

Code `modules/e04-offline/internal/safety_media_nesting.py`; tests `modules/e04-offline/tests/test_safety_media_nesting.py`; accepted checker `modules/e04-offline/internal/core_composition.py`; unchanged CI `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-002.md`; task `vault/REGISTRY/T-E4-002.md`; evidence `vault/EVIDENCE/E-DEV-061.md`; capsule `modules/e04-offline/MANIFEST.md`.

## Independent bounded task completion

Separate /root/pr58_snapshot_binding_review, configured user-selected gpt-6-luna/max, full T-E4-002 task-level PASS/no actionable findings at ff5ff4fae4cbcade3962be910aab45749d9de613 over accepted6af8dbf323d2e688b7a6b2d4634e00971672af14. All13paths reviewed, clean checkout/profiledigest matched/v28archivebyteequal. No source rejection/fix. Delegated accepted T001 exact verification, missing/split/on-demand required IDs rejected, safety subset counted only in complete core total, no budget/trim path, intrinsicNONE. Empty declared media not canonical necessity proof; E3/E6 source/semantic completeness/classification and mobile/render/device/storage/promotion/actionability stillHELD. Reviewer ran no tests/CI/network/provider/writes.

Root exact source all12CI SUCCESS: PRarchitecture37028475629 actualT3SUCCESS (earlierduplicate37028471176green), E4 37028471615 actual22PASS0.010s, E3commit37028471830, E5 37028471683, E6 37028471524, live37028472435; pusharchitecture37028463651/E4 37028463165/E3commit37028463143/E5 37028463351/E6 37028463176/live37028463166. Rootfull22PASS0.019s/compile/graph12+42PASS0.492/index54/routing/diff/archive. No initial unit/graph failure or source review rejection.

Direct owner standing DEC0069/0070 acceptance applies, planPR4 unmerged. Profile/pack ACTIVE/task DONE only independently accepted internal nesting rule, never actual approved package/producer/semantic classification/current trust/recovery/device/encrypted storage/promotion/production readiness. Result NONE/productionHELD unchanged. E3R1REVIEW/E5-003IN_PROGRESS/unresolvedPR47/57/59 unchanged. Final six metadata/view paths only, code/tests/accepted checker/workflow/archive/priorproof/inventory/manifest/CIplan unchanged. Independent final metadata audit and latest exact-head twelve green runs required before normal matched-head merge.
