---
record_id: V-E4-RECOVERY-001
version: 1
purpose: Check complete declared recovery coverage for every reachable physical state without granting offline authority
domain: offline-recovery
module: e04-offline
owner: E4
implements: [ADR-009, ADR-001, ADR-003, C4.6, F4.6.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: recovery-closure-rule
tasks: [T-E4-014]
tests: [modules/e04-offline/tests/test_recovery_closure.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E4-001, V-E4-ELIGIBILITY-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-014, T-E4-014, E-DEV-073]
evidence: [E-DEV-073]
supersedes: []
status: REVIEW
---

# Recovery closure rule

Canonical T014/ADR009R6/C4.6/F4.6.1/FL4.6.1 acceptance matrix140/145; harddepT013 DONE internal negative-only rule at acceptedmainf04a10e542f9853f7551b4eabc3d8b0c43298419 after PR74 merged2026-10-02T21:43:00Z with FULL independent source/final metadata PASS and exact-source/final12CI/actualT3. Taxonomy/windows gate145, canonical eligibility/floors/encryption/device/runtime remain separately HELD. T001/T005 full compact composition/verification reused unchanged. T011b/T012 actual E3 operation source pending, productR1 unfinished; no bootstrap-product dependency substitution. E4 consumes E3/E1 renders unchanged, no E6 private import/new public seam. Acceptedplanmainfa914f/localstale7d705/localpendinge3c2/planPR4unmerged/directstandingmandate distinguished. E3R1 REVIEW/E5-003 IN_PROGRESS/unmergedPR47/57/59 unchanged.

Immutable RecoveryGraph has exact Scope, capability Reference, entry state, declared state tuple, transition edges and per-state safe-stop/recovery part mappings. Every plain immutable field is validated, duplicate/dangling edges/state/mappings and unknown IDs rejected, even unreachable malformed data. Deterministic graph_digest is a local binding fingerprint only, no production wire or storage format selected. It includes scope/capability/entry/states/edges/coverage; exact graph Reference digest must match and be admitted to complete package dependency context, so rehashed graph mutation cannot borrow an old manifest pin. Finite encoding rejection for extreme generation, no raw input echo.

check_closure revalidates supplied VerifiedCandidate through accepted T005 complete package bytes/digest/current dependency/applicability/compatibility context before graph use; caller-constructed verified marker insufficient. Exact graph/package scope must match; graph capability must match compact compatibility reference. Every mapped part must exist in same required compact core and have correct safe_stop/recovery role; optional media/generic text/foreign refs cannot replace safe closure. Traversal includes entry and all branches/terminal states and terminates across cycles. Every reachable state requires both mappings; missing mapping or either role holds, unreachable states need no mapping but any supplied mapping remains strictly validated. All required compact/media bytes must remain present; no separate budget/trimming.

CURRENT/EXPIRED/UNKNOWN evidence status is a supplied declaration, not a clock, signature or authoritative review. Default UNKNOWN and EXPIRED hold; unsupported capability holds. Complete coherent declared graph/bytes/current flag returns DECLARED_CLOSURE_COMPLETE_CANONICAL_SOURCE_AND_OFFLINE_AUTHORITY_HELD, authorityNONE/physical_startFalse. Coherently omitted physical states/edges, false reviewed instructions, capability/expiry/source metadata can match this model but cannot create real safe recovery or physical start. Constant production gate HELD_CANONICAL_REVIEWED_CLOSURE_ELIGIBILITY_TAXONOMY_WINDOWS_AND_ENCRYPTED_RUNTIME_MISSING ignores flags/callback. No renderer, physical action/guide-authoring or recovery instruction selected. Normal application denial does not delete last safe context/history; safe-stop is never a hidden progression path.

Twelve new+accepted148 full160 tests PASS0.381s/compile. Complete branch/terminal coverage, finite cycles, missing each state/either mapping, unreachable malformed nodes/edges/mappings, same-core correct roles, complete-byte/current dependency revalidation, unsupported capability/defaultUNKNOWN/EXPIRED, old/unadmitted source reference/pin/graph mutation, cross-motorcycle/task/release/generation, strict mutable/duplicate/dangling/hostile/subclass values, coherent omitted graph state/false CURRENT flags, immutability/constant production hold, extreme encoding finite reason. No current unit failure or independent verdict yet. T013 source/current actual histories preserved.

Actual independently reviewed complete reachable physical-state graph/instructions/safe decision boundaries, authenticated release/recovery/dependency/source/capability/expiry, current authoritative taxonomy/windows/eligibility/negative floors, actual complete encrypted device store/restore/time/process-death/runtime/E1 rendering and safe recovery remain MISSING/HELD. This checker neither authenticates those sources nor proves physical corpus completeness or supported device recovery. T013 broader gates remain, T011b/T012/productE3R1 unclosed. No plaintext fallback/provider/DB/crypto/TTL/authoring/physical mechanism chosen or activated; user/history/content never actually written here.

## Trace

ADR009R6 -> C4.6 -> F4.6.1 -> FL4.6.1 -> T-E4-014 -> M-E4-001 -> E-DEV-073. Taxonomy/windows gate145 remains HELD independently of rule acceptance; E1 client renderer HELD. Source `modules/e04-offline/internal/recovery_closure.py`; tests `modules/e04-offline/tests/test_recovery_closure.py`; pack `vault/PACKS/P-E4-014.md`; task `vault/REGISTRY/T-E4-014.md`; proof `vault/EVIDENCE/E-DEV-073.md`. FULL canonical task review/exact-head CI required before internal rule DONE, no selfPASS.
