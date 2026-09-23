# MODULE MANIFEST — e03-server (E3 Sunucu + veri omurgası)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e03-server/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E3-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

API kapısı + kanonik veri düzeni + platform kurulumu + ortamlar. E3 serves and verifies; single end-to-end
owner of runtime edges. Foundation capsule (no inbound epic dependencies).

## Public contract surface

- API authorization tuple contract (commit-time ALLOW/DENY/HELD; cached claims never substitute).
- Operation identity contract (stable identity/fingerprint; idempotency; CONFLICT/REJECTED semantics).
- State-dictionary / negative-floor / epoch contract (verbatim state word; floors win on ties; epoch
  reaches all edges — downloaded copies honestly unrestorable).
- Domain authority CRUD + versioning; history/provenance + protected audit planes (convenience copies
  never authoritative); object/media boundary + quarantine-first intake.
- Queue/worker job families (lease/pulse/checkpoint/DLQ/backpressure/cancel/evacuate); backup/restore
  drills + clean-room exit; cost-BOM skeleton; environment separation + promotion plumbing.

## Internal scope

Supabase config (migrations, RLS/Storage policies, service_role server-side only — never leaves),
Edge Functions or equivalently bounded replaceable runtime (`ADR-002`), caches, workers, secrets custody.
Helpers, storage layout, in-flight job state invisible outside.

## Allowed / forbidden dependencies

- Allowed: none inbound from epics (foundation); serves E1, E2, E4, E5, E6, E7, E8, E9 per seam table.
  E10 tooling-plane relation declared in the seam table invoke stanza (2026-09-23, OUT-3 B-16 — the prescribed
  change-request path; one-way tooling service, no epic runtime inbound to E10).
- Gate-reference note (OUT-3 B-17, non-runtime): E3 tasks reference E6 gates without depending on E6 runtime
  (T-E3-033 HELD unless E6 checks pass; T-E3-022 links T-E6-015). Declared in the seam table invoke stanza;
  not an edge, not a dependency.
- Forbidden: UI/presentation logic; provider-coupled code beyond the bounded runtime; client-side
  authorization trust; plaintext backups; single-provider lock-in without exit rehearsal.

## Tests

- Authorization negatives: bypass/direct-path inventory tests; cached-claim substitution negatives.
- Idempotency + state-word tests; epoch-propagation tests; quarantine-restore + clean-room drills.
- Cross-cutting: every sensitive action re-authorized at API (consumed by E1/E2/E5 tests).

## Change / rollback rules

- Contract changes version + `supersedes` (R-011); floors/epochs change only with full-edge review.
- Rollback: epoch + quarantine rules by reference (`planning 07_AI_ARCHITECTURE/ROLLBACK_STRATEGY.md`); restored systems land in
  quarantine; forbidden-state resurrection rejected.

## Links (defined-by-reference, not copied)

- Requirements/design: `C3.1`..`C3.9`, `F3.*`; `ADR-002`, `ADR-006`.
- Architecture: seam rows (E3 verifies/serves; single end-to-end owner); `R-001`..`R-004`, `R-010`, `R-011`, `R-013`, `R-014`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E3 rows (Step 5 builds).
