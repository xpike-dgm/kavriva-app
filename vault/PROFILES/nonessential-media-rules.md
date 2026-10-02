---
record_id: V-E4-OPTIONAL-001
version: 1
purpose: Model separate optional media requests with explicit intent cancellation eviction and refetch
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.1, F4.1.2, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: nonessential-media-rules
tasks: [T-E4-003]
tests: [modules/e04-offline/tests/test_optional_media.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-003, T-E4-003, E-DEV-062]
evidence: [E-DEV-062]
supersedes: []
status: ACTIVE
---

# Nonessential on-demand rules

T-E4-003 canonical acceptance Separate/explicit/cancelable/evictable/refetchable, review gate/harddepsnone. ADR009R1b/C4.1/F4.1.2/FL4.1.2/CON005. Acceptedbase8e310199768844ae8667c3f53182e57334c7ceb1 includes reviewed T001/T002 checks reused inside E4. Planmainfa914f013fdcd032faed876689092da245989459. Generation and actual semantic classification owned E3/E6, E4 consumes E3 only; no new seam/private cross-capsule import.

## Actual internal lifecycle

prepare_optional verifies complete supplied core via accepted nesting checker and rejects any optional reference sharing a required core ID, including different revision/digest. OptionalSpec freezes the complete core declaration, expected scope/manifest digest, optional reference, declared byte count and NONESSENTIAL label. Its internal fingerprint binds context/reference/count/classification; declaration is revalidated against the core pin and optional ID overlap checked on every record use, not merely construction. UNKNOWN/REQUIRED/unclassified labels are rejected. No source semantics/authentication comes from that caller label.

OptionalRecord has separate ABSENT/REQUESTED/AVAILABLE/CANCELLED/EVICTED model states. ABSENT performs no automatic fetch. Request requires exact UserRequest/action USER_FETCH/spec fingerprint/request ID; declaration is not proof a real human clicked. Same active exact intent retry is structurally idempotent; conflicting active intent is rejected. Cancellation clears active intent, retains request identity history and blocks late completion. Reusing a terminal request ID cannot revive it. Fresh explicit intent permits refetch after cancellation/eviction; old attempt results still fail. Complete receipt checks exact byte count and SHA256 before model AVAILABLE. Eviction clears only the optional completed digest, never the core or its immutable declaration/payloads. Active requests must be cancelled before model eviction. No payload bytes are retained in the record or written to disk.

Finite errors for malformed/mutable/hostile/inconsistent state, overlap, stale attempts, changed context, corrupt/partial/wrong-size receipt. No network callback, filesystem operation, downloader, serializer/product wire format, actual cancel/evict/refetch or encryption implementation. Coherently forged state/source/label/intent can remain a structural model; intrinsic NONE and constant production HELD_CANONICAL_OPTIONAL_SOURCE_AND_RUNTIME_MISSING prohibit treating it as permission or real transfer proof. Required content never passes through this optional intent gate; CON005 unchanged. Actual size-before-download rendering is T004, not proven by declared count alone.

## Root tests and separate product gates

Twelve new + accepted22 E4 full34PASS0.069s/compile. Initial33PASS0.049s; root strengthened per-use pinned-core/overlap validation and added direct forged-record probe before freeze, no unit failure/review rejection. Tests cover initial no-auto-fetch, explicit intent/retry, unknown/required labels/every core essential, cancel/late receipt/replay, fresh refetch/old attempt, eviction/core preservation, exact byte/digest, changed size/ref/context, forged/mutable/hostile state, illegal transitions, immutable NONE/defaultHELD. Synthetic memory fixtures only.

Real classification/semantic completeness, trusted E3 source/current generation/compatibility/floors/recovery, E1 accessible intent/size/controls, actual device/runtime/transfer cancellation/physical cleanup/durable restart/encrypted custody remain MISSING/HELD. Full independent task review required, no author PASS or actual user/authentication/approved package/production proof. No plaintext fallback or selected production limits.

## Trace

ADR009R1b -> C4.1 -> F4.1.2 -> FL4.1.2 -> T-E4-003 -> M-E4-001 -> E-DEV-062. Task/feature/flow/requirement bound supplied immutable model only; design E1 screenHELD; architecture same-capsule checks/no new seam; data no persistence or migration; release NONE/no permission; scenarios negative fixtures; gap audit above. Code `modules/e04-offline/internal/optional_media.py`; tests `modules/e04-offline/tests/test_optional_media.py`; unchanged checker `modules/e04-offline/internal/core_composition.py` / `modules/e04-offline/internal/safety_media_nesting.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-003.md`; task `vault/REGISTRY/T-E4-003.md`; proof `vault/EVIDENCE/E-DEV-062.md`.

## Post-review root serialization hardening

Separate configured gpt-6-luna/max reviewer gave full T-E4-003 task-level PASS/no actionable findings at e1fcde49a429b126149742155c06e0a21ba029f4. That accepted review remains historical, not approval of new source. Root then identified an unbounded declared-size integer that passed plain type guards but json serialization raised a non-finite ValueError. A new focused stress regression first ran1 ERROR0.009s, actual failure preserved. The local spec serializer now converts its ValueError/TypeError/OverflowError/RecursionError into finite OPTIONAL_SPEC_ENCODING_FAILED, without echoing input or changing interpreter limits, selected byte policy or accepted checkers. Fixture10**5000 is a serializer stress probe only, never a product/candidate size boundary.

Current13new+accepted22full35PASS0.100s/compile. No independent source rejection: this was implementer-discovered concrete risk after old source PASS. Per-use core protection, lifecycle, source/classification and intrinsicNONE/constant productionHELD unchanged. Historical state at bcdd72a source freeze required independent full re-review and exact latest12CI; old green/old PASS could not be substituted. Actual current source acceptance is recorded in the later independent completion receipt.

## Independent full task completion receipt

Separate configured user-selected gpt-6-luna/max /root/pr58_snapshot_binding_review full bounded T-E4-003 task-level PASS/no actionable findings at current bcdd72a242a27b1c6a95848b0224ed7bcd78f217 over accepted8e310199768844ae8667c3f53182e57334c7ceb1. Initial e1fcde49a429b126149742155c06e0a21ba029f4 was actually PASS/no findings, not an independent rejection. Root identified subsequent concrete serializer failure; new1ERROR0.009s before finite catch, full35PASS0.100s/compile afterward. Current independent re-review PASS closes that implementer-discovered risk, no invented CHANGES_REQUESTED/source rejection. Reviewer inspected five-path fix; finite OPTIONAL_SPEC_ENCODING_FAILED/no input echo/source lifecycle/held production unchanged, old review/hashes/history preserved. Reviewer did not run tests/CI/network/provider/writes.

Exact current source all12CI SUCCESS: PRarchitecture37031288894 actualT3SUCCESS/E4 37031289197 actual35PASS0.025s/E3commit37031288909/E5 37031289048/E6 37031288939/live37031289153; pusharchitecture37031281830/E4 37031281699/E3commit37031281745/E5 37031281628/E6 37031281803/live37031281758. Earlier source34CI and PASS remain historical. Rootcurrent35PASS0.100s/compile, graph12+42PASS0.890/index55/routing/diff/archive; firstpreparation graph0.477 preserved. Original P-PROOF001warning unchanged.

Owner direct standing DEC0069/0070 delegated full-task verdict acceptance, pendingplanPR4 remainsunmerged. Profile/packACTIVE/taskDONE only internal nonessential lifecycle rules. Separate/explicit/cancelable/evictable/refetchable model passes full review; actual E3/E6 classification/semantic completeness/current source/context, real E1 human gesture/controls/size rendering, physical transfer/cancellation/eviction/durable storage/encryption/mobile/device/runtime remain MISSING/HELD. Coherent supplied state/intent/source can be false; intrinsicNONE and constant productionHELD unchanged. No real transfer/user/authentication or approved package/productreadiness claim. Size-before-download rule T004 separate. E3R1REVIEW/E5-003IN_PROGRESS/unresolvedPR47/57/59 unchanged. Final six metadata/view paths only; code/tests/acceptedcheckers/workflow/archive/priorproof/inventory/manifest/CIplan unchanged. Independent final metadata audit/latest-head twelve green CI required before normal matchedheadmerge.
