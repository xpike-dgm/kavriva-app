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
status: REVIEW
---

# Optional size-before-request rule

Canonical T-E4-004 acceptance Size shown before download; hard dependency T-E4-003 DONE at acceptedmain d0b5b06778b8a2789c96f1454607e5de8140c6fc, review gate ADR009R1b/C4.1/F4.1.2/FL4.1.2. Planmain fa914f013fdcd032faed876689092da245989459; pendingplanPR4/direct standing human mandate, unresolvedPR47/57/59 unmerged. E4 consumes E3 and is surfaced via E1; E1 real screen remains HELD. No new public seam/private cross-capsule import or change to accepted optional/core/nesting checks.

## Actual rule

preview_size revalidates accepted OptionalRecord/spec/core pin and derives immutable SizePreview: exact positive plain integer declared_bytes, exact Turkish label N bayt and spec fingerprint. No rounding, unit-switching threshold, size quota, numeric policy or network/MB confirmation. preview_digest validates plain immutable types, label and count and binds all fields with local deterministic SHA256; this is not an authenticated signature or product wire format. No request, screen or download occurs during preview construction.

request_after_size requires exact UserRequest bound to current spec/action USER_FETCH and plain SizeShownReceipt whose preview digest, request identity, displayed_bytes and displayed_label match current preview. Missing receipt, bare displayed flag/dictionary/callback, malformed/mutable/hostile input, edited label/unit/size, stale media revision/digest/identity/core generation or request context are rejected before delegating unchanged request_optional. Same active retry remains idempotent but needs the matching supplied receipt. Terminal old request IDs remain rejected by accepted lifecycle; fresh refetch after cancellation/eviction needs fresh matching request receipt. Label has no rounded-size ambiguity. Invalid serialization receives finite reason codes without input echo or interpreter setting changes.

SizeShownReceipt is a supplied declaration, not proof of actual screen visibility, accessibility, temporal presentation or authenticated human intent. A coherently forged receipt can pass the model; intrinsic authority NONE and constant production HELD_CANONICAL_SIZE_PRESENTATION_AND_RUNTIME_MISSING prevent actual runtime permission. Direct T003 model request is unchanged and is not a live bypass: neither path opens production. Required core route is unchanged, never acquires optional size or intent confirmation under CON005.

## Validation and remaining product gates

Twelve new + accepted35 E4 full47PASS0.064s/compile. Tests check exact text/arbitrary counts, missing/fake/stale/edited receipts, changed size/revision/digest/media/core generation, wrong intent/action, retry/refetch/replay, hostile/plain immutable types/boolean and negative counts, finite serializer stress, core invariance and coherent forgery/defaultHELD. Memory fixtures only, no real screen/device/download experiment. No unit failure or independent verdict before this source freeze.

Actual E1 render/presentation provenance/visibility/accessibility/user gesture, trusted E3/E6 semantic classification/current approved source, physical transfer/cancellation/eviction/durable storage/encryption/mobile runtime remain MISSING/HELD. No real human saw-size claim, actual transfer or approved package/product readiness claim. Full task review and current CI still required; no authorPASS/DONE. Any eventual live entrypoint must prove actual visible size before initiating transfer; fixture receipt alone cannot satisfy it.

## Trace

ADR009R1b -> C4.1 -> F4.1.2 -> FL4.1.2 -> T-E4-004 -> M-E4-001 -> E-DEV-063. Feature/flow/task/requirement bound internal presentation rule; design E1 screenHELD, architecture E4-only reuse/no new seam, data no persistence/migration, release NONE/runtimeHELD, scenarios negatives above, gap audit above. Code `modules/e04-offline/internal/size_shown.py`; tests `modules/e04-offline/tests/test_size_shown.py`; unchanged accepted lifecycle `modules/e04-offline/internal/optional_media.py`; workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-004.md`; task `vault/REGISTRY/T-E4-004.md`; proof `vault/EVIDENCE/E-DEV-063.md`.
