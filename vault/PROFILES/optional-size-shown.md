---
record_id: V-E4-SIZE-001
version: 1
purpose: Bind optional request to exact current declared size presentation
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.1, F4.1.2, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: optional-size-shown-rule
tasks: [T-E4-004]
tests: [modules/e04-offline/tests/test_size_shown.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E4-OPTIONAL-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-004, T-E4-004, E-DEV-063]
evidence: [E-DEV-063]
supersedes: []
status: ACTIVE
---

# Optional size-before-request rule

The sections below describe historical source-freeze state at9360a92. Current full-task acceptance/status and separate product holds are recorded in the completion receipt below.

Canonical T-E4-004 acceptance Size shown before download; hard dependency T-E4-003 DONE at acceptedmain d0b5b06778b8a2789c96f1454607e5de8140c6fc, review gate ADR009R1b/C4.1/F4.1.2/FL4.1.2. Planmain fa914f013fdcd032faed876689092da245989459; pendingplanPR4/direct standing human mandate, unresolvedPR47/57/59 unmerged. E4 consumes E3 and is surfaced via E1; E1 real screen remains HELD. No new public seam/private cross-capsule import or change to accepted optional/core/nesting checks.

## Actual rule

preview_size revalidates accepted OptionalRecord/spec/core pin and derives immutable SizePreview: exact positive plain integer declared_bytes, exact Turkish label N bayt and spec fingerprint. No rounding, unit-switching threshold, size quota, numeric policy or network/MB confirmation. preview_digest validates plain immutable types, label and count and binds all fields with local deterministic SHA256; this is not an authenticated signature or product wire format. No request, screen or download occurs during preview construction.

request_after_size requires exact UserRequest bound to current spec/action USER_FETCH and plain SizeShownReceipt whose preview digest, request identity, displayed_bytes and displayed_label match current preview. Missing receipt, bare displayed flag/dictionary/callback, malformed/mutable/hostile input, edited label/unit/size, stale media revision/digest/identity/core generation or request context are rejected before delegating unchanged request_optional. Same active retry remains idempotent but needs the matching supplied receipt. Terminal old request IDs remain rejected by accepted lifecycle; fresh refetch after cancellation/eviction needs fresh matching request receipt. Label has no rounded-size ambiguity. Invalid serialization receives finite reason codes without input echo or interpreter setting changes.

SizeShownReceipt is a supplied declaration, not proof of actual screen visibility, accessibility, temporal presentation or authenticated human intent. A coherently forged receipt can pass the model; intrinsic authority NONE and constant production HELD_CANONICAL_SIZE_PRESENTATION_AND_RUNTIME_MISSING prevent actual runtime permission. Direct T003 model request is unchanged and is not a live bypass: neither path opens production. Required core route is unchanged, never acquires optional size or intent confirmation under CON005.

## Validation and remaining product gates

Twelve new + accepted35 E4 full47PASS0.064s/compile. Tests check exact text/arbitrary counts, missing/fake/stale/edited receipts, changed size/revision/digest/media/core generation, wrong intent/action, retry/refetch/replay, hostile/plain immutable types/boolean and negative counts, finite serializer stress, core invariance and coherent forgery/defaultHELD. Memory fixtures only, no real screen/device/download experiment. No unit failure or independent verdict before this source freeze.

Actual E1 render/presentation provenance/visibility/accessibility/user gesture, trusted E3/E6 semantic classification/current approved source, physical transfer/cancellation/eviction/durable storage/encryption/mobile runtime remain MISSING/HELD. No real human saw-size claim, actual transfer or approved package/product readiness claim. At the historical source freeze full task review and current CI were still required; no authorPASS/DONE. Current acceptance is recorded below. Any eventual live entrypoint must prove actual visible size before initiating transfer; fixture receipt alone cannot satisfy it.

## Trace

ADR009R1b -> C4.1 -> F4.1.2 -> FL4.1.2 -> T-E4-004 -> M-E4-001 -> E-DEV-063. Feature/flow/task/requirement bound internal presentation rule; design E1 screenHELD, architecture E4-only reuse/no new seam, data no persistence/migration, release NONE/runtimeHELD, scenarios negatives above, gap audit above. Code `modules/e04-offline/internal/size_shown.py`; tests `modules/e04-offline/tests/test_size_shown.py`; unchanged accepted lifecycle `modules/e04-offline/internal/optional_media.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-004.md`; task `vault/REGISTRY/T-E4-004.md`; proof `vault/EVIDENCE/E-DEV-063.md`.

## Independent full task completion receipt

Separate configured owner-selected gpt-6-luna/max /root/pr58_snapshot_binding_review FULL T-E4-004 internal size-before-request task PASS/no actionable source findings at9360a924524a10155f423ee7224aee0d71718c64 against acceptedbase d0b5b06778b8a2789c96f1454607e5de8140c6fc. Canonical review-gate/taskdependency T003DONE and E4 client logic/E1 screenHELD inspected; exact byte label/spec/request receipt guards accepted with no thresholds/core prompt/effect/new seam. Reviewer checked full13paths/digests/byteequalarchive/dependency; no tests/CI/provider/writes. No source rejection or failure in this task history.

Exact source all12CI SUCCESS: PRarchitecture37034309627 actualT3SUCCESS (earlier unlabeled duplicate37034288919), E4 37034288961 actual47PASS0.035s, E3commit37034288922/E5 37034288873/E6 37034288941/live37034288958; pusharchitecture37034238976/E4 37034238942/E3commit37034239078/E5 37034239125/E6 37034239041/live37034238873. Root47PASS0.064s/compile, graph12checks+42regressionsPASS0.776s/worstexit0/index56/routing/diff/exact13paths/rawarchive. Original P-PROOF001warning unchanged.

Owner direct standing DEC0069/0070 accepts full delegated task PASS/normal matchedheadmerge after current applicable greenCI until revoked; pendingplanPR4 remainsunmerged, not claimed governing main. Profile/packACTIVE/taskDONE only internal size-before-request rule. This does not prove a person saw size: real E1 screen/presentation provenance/visibility/accessibility/authenticated intent, trusted source/semantic classification/currentcontext and physical transfer/cancellation/eviction/encrypted durable storage/device/mobile runtime remain MISSING/HELD. Future live E1 entrypoint must route through this rule and establish real presentation before transfer; caller fixture receipt alone never suffices. Coherent forged receipt can pass model, all outputsNONE/productionconstantHELD. Required core CON005 unchanged. No actual UI/display/permission/approvedpackage/productready claim. E3R1REVIEW/E5-003IN_PROGRESS/unresolvedPR47/57/59 unchanged. Final six metadata/view files only; source/tests/acceptedcheckers/workflow/archive/inventory/manifest/CIplan/priorproof unchanged. Final independent metadata audit/latesthead12CI required before normal merge.
