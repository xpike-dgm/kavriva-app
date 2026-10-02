---
record_id: V-E4-TRANSITION-001
version: 1
purpose: Define verified all-or-nothing package transition and peak-space preservation contract
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.2, F4.2.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: package-transition-contract
tasks: [T-E4-005]
tests: [modules/e04-offline/tests/test_stage_verify_promote.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-005, T-E4-005, E-DEV-064]
evidence: [E-DEV-064]
supersedes: []
status: REVIEW
---

# Stage-verify-promote internal contract

Canonical T-E4-005 review gate/harddepsnone: Verified; atomic; peak-space by eviction, never by deleting truth. ADR009R2/C4.2/F4.2.1/FL4.2.1. Acceptedmain d862e2f0cfb7a8b8e02ab0e2df7f4c17fef082b7; canonical accepted remote planmainfa914f013fdcd032faed876689092da245989459, local staleplanmain7d705a69 and pendingplanPR4/directstandingmandate distinguished. No fabricated harddeps; same-capsule accepted composition verifier reused. Actual generation/semantic classification E3/E6pipeline, E4consumesE3; no new public seam or private cross-capsule import.

## Actual contract and atomicity boundary

stage_package creates only immutable staged Declaration/scope/pin/tupleplainPart/bytes; a partial stage may exist and is not actionable. verify_stage revalidates stage pin/context then requires exact supplied VerificationContext applicability/compatibility/dependency references, strict immutable types/unique dependencies and accepted check_composition full membership/same generation/SHA. Missing, stale or mismatched compatibility/dependency references and partial/corrupt/mixed/duplicate contents fail. These are expected supplied reference bindings, not real runtime compatibility evaluation or canonical source authority.

VerifiedCandidate is a model binding; propose_promotion always re-verifies both candidate and previous current before use, never trusts caller verified flags or constructors. Expected-current digest comparison rejects a changed supplied active snapshot; newer generation and same selected motorcycle/task required. First install requires absent expected current pin. It emits one immutable PromotionProposal with entire verified replacement and retained complete previous snapshot, expected pin, peak bytes and proposed cleanup IDs, or HELD for insufficient space. No intermediate current state, mutation, effect, deletion or actual promotion occurs. Caller snapshots can be coherent but false/stale against the real store; there is no durable compare-and-swap or crash recovery implementation. Atomicity here is an all-or-nothing proposal contract requiring actual encrypted store transaction/CAS/recovery proof before execution, not evidence of device/Drift atomic commit.

## Peak space and protected truth

Peak = actual old payload bytes + actual new payload bytes + supplied verification-extra bytes. Supplied free_bytes already excludes retained old occupancy; additional requirement new+verification. No old data is subtracted to fit new staging. Declared disposable rows must be immutable/unique/positive exact integers and one of INVALID_OR_ORPHAN_TEMP, NONESSENTIAL_MEDIA, OLD_INACTIVE_REFETCHABLE_CACHE, REBUILDABLE_PROJECTION; plan orders these and stops once declared space suffices. Six protected labels ACTIVE_TASK_COMPLETE_PACKAGE, REQUIRED_SAFETY_MEDIA, DURABLE_USER_DATA, PENDING_OR_ACCEPTED_OPERATION_TRUTH, PROTECTED_AUDIT_OR_AUTHORITY, NEGATIVE_FLOOR are rejected, along with any row sharing current or candidate essential part ID even if relabelled optional. Unknown/duplicate/malformed cleanup or negative/boolean/mutable space fails. Insufficient declared disposable cleanup returns HELD_INSUFFICIENT_STAGING_SPACE without changing old state. No production MB/GB/% constants or cleanup/delete mechanism selected.

Classification, object IDs and space counts are caller declarations: coherent misclassification or incorrect free/overhead amount is not trusted real device evidence. Production gate always HELD_CANONICAL_PACKAGE_SOURCE_AND_ATOMIC_ENCRYPTED_STORE_MISSING/intrinsicNONE ignores caller flags/callbacks. No content-only hash, VERIFIED label or proposal grants source/compatibility/recall/floor/authority/actionability. Required core CON005 route unchanged/no confirmation. Delta fallback T006 and general eviction T009a/T009b/T010 remain separate tasks.

## Validation and product holds

Fourteen new + accepted47 E4 full61PASS0.114s/compile. Cases: partial staged but not verified, whole replacement/retained old/peak sums, firstinstall, corrupt/mixed/duplicate/missing parts, wrong compatibility/applicability/dependencies, changed manifest oldpin, old/same generation/wrong selection/changed-current pin, inadequate space, ordered disposable stop, each protectedclass and relabelled essential ID, unknown/duplicate/mutable/hostile/plain types, finite extreme context encoding, immutable proposal/coherent forgery/runtimeHELD. Synthetic memory declarations only; no unit failure or independent verdict before source freeze.

Actual trusted source/current generation/negativefloor/authenticated compatibility and dependency readers, real active store/CAS/encrypted durable storage/actual disposable classification/free-space/verification overhead/cleanup/physical atomic replace/crash recovery/mobile runtime/device evidence remain MISSING/HELD. No plaintext fallback, runtime transfer/promotion or product-ready claim. Full task independent review/current CI required, no authorPASS/DONE.

## Trace

ADR009R2 -> C4.2 -> F4.2.1 -> FL4.2.1 -> T-E4-005 -> M-E4-001 -> E-DEV-064. Requirement/task/feature/flow internal contract, design no new screen, architecture E4-only/no new seam, data no actual persistence/migration/CAS, release NONE/held, scenarios fixture negatives, gap audit above. Source `modules/e04-offline/internal/stage_verify_promote.py`; tests `modules/e04-offline/tests/test_stage_verify_promote.py`; accepted checker `modules/e04-offline/internal/core_composition.py`; unchanged workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-005.md`; task `vault/REGISTRY/T-E4-005.md`; evidence `vault/EVIDENCE/E-DEV-064.md`.
