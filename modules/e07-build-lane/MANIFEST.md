# MODULE MANIFEST — e07-build-lane (E7 Derleme + mağaza hattı)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e07-build-lane/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E7-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Android şeridi sürekliliği; imza/mağaza şerit uygulaması; iOS aktivasyon kapıları (tanımlı, inşa yok).
E7 EXECUTES lane work under E6 policy — owns no policy (execution/policy split).

## Public contract surface

- Android lane runs (independent low-cost lane; external provenance; build-approval separation;
  signature/store execution separate from CI; provenance binding — lane application of E6 policy).
- Separation of duties in execution: build/sign/provenance/approve/store/transport/verify separated;
  provider runs but never owns; key loss = revoke/rotate/re-establish (EXECUTION of E6 policy).
- Capability classification lists (mandatory/deferrable/optional/scale-triggered); cost readings
  (TRY-anchored, never purchase authorization; store fees separate); exit playbook.
- iOS activation gates DEFINED (5 evidences separately: real Mac, Apple custody, independent history,
  ownerless-recovery, clean room); no hardware/fee commitment without explicit owner ask.

## Internal scope

Lane scripts, runner configs, signing-execution plumbing, cost dashboards. Policy texts stay in E6;
this capsule proves compliance per run.

## Allowed / forbidden dependencies

- Allowed: E3 (source/serve), E6 (policy — obeyed, never edited here).
- Forbidden: owning/changing release, custody, or signing policy; building iOS gates unasked;
  provider ownership of keys/lanes; spend commitments (readings only).

## Tests

- Compliance tests: every lane run checks E6 policy version + seal/provenance before store transport.
- Separation tests: duty-merge negatives in execution roles; key-loss drill (revoke/rotate/re-establish).
- Cost tests: readings accurate; no spend action without owner authorization.

## Change / rollback rules

- Lane changes: standard review + E6-policy compatibility check; policy drift rejected at review.
- Rollback: lane reruns are execution retries, never release rollbacks (E6 lethal-error route governs).

## Links (defined-by-reference, not copied)

- Requirements/design: `C7.1`..`C7.6`, `F7.*`; `DEC-0032` (Android-first).
- Architecture: seam rows (E7 ← E3,E6; E6 decides, E7 executes); `R-001`, `R-003`, `R-004`, `R-009`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E7 rows (Step 5 builds).
