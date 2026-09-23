# MODULE MANIFEST — e08-content (E8 İçerik + ölçüm)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e08-content/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E8-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Kaynak/kanıt yönetimi akışı + analitik/gözlem düzlemleri + veri-kalite görünürlüğü. E8 DERIVES planes —
E2 consumes E8 outputs (E8 derives, E2 renders); ownership of authority/publish stays E3/E6 (E8 defines none).

## Public contract surface

- Technical authority derivations (verbatim): source/claim relations, variant applicability, immutable
  snapshot approval, version identity, suspension straps, package fitness + dependency closure.
- Bounded authoring supplement (write/edit/translate/media within limits; can never approve/publish/recall/
  authorize; detachability gate; re-evaluation under measured load; no CMS in first release).
- Measurement-plane separation: registry-derived counters (registry/schema in E3; E8 derives; E2 only shows);
  analytics discipline (purposeful/minimal/anonymous/replaceable; late-load/quota/billing/deletion never
  break the safe path); first-release measurement capability set.
- Honest fallback: if privacy/operability/cost/offline/exit gates fail, shrink to small-essence base —
  no weakening; raw export is not exit evidence.

## Internal scope

Derivation pipelines, projection rebuilders (all projections re-derivable, CMS included), measurement
aggregators, quality dashboards. Canonical stores stay in E3; publish authority stays in E6.

## Allowed / forbidden dependencies

- Allowed: E3 only (source/serve/canonical).
- Consumed by: E2 visibilities (outputs only, never direction).
- Forbidden: owning authority/publish/recall; bypass lists (closed); analytics carrying registry/audit/
  counters across provider change; weakening-gated capabilities.

## Tests

- Derivation tests: projections re-derivable from canonical sources; snapshot immutability.
- Boundary tests: authoring supplement cannot approve/publish/recall/authorize (negatives).
- Measurement tests: purposeful/minimal/anonymous per class; safe-path unbroken under quota/deletion.

## Change / rollback rules

- Plane-schema changes version + E2-visibility impact note; authority derivations change only with E3.
- Rollback: re-derive, never restore blindly; shrunken-base fallback preferred over weakened operation.

## Links (defined-by-reference, not copied)

- Requirements/design: `C8.1`..`C8.6`, `F8.*`.
- Architecture: seam rows (E2 consumes E8 outputs); `R-001`, `R-003`, `R-004`, `R-011`, `R-013`, `R-014`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E8 rows (Step 5 builds).
