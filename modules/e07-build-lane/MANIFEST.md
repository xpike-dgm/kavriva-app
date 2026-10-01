---
record_id: M-E7-001
metadata_version: 1
purpose: "Android şeridi sürekliliği; imza/mağaza şerit uygulaması; iOS aktivasyon kapıları (tanımlı, inşa yok). E7 EXECUTES lane work under E6 policy — owns no policy (execution/policy split)."
domain: "module-contract"
module: "e07-build-lane"
owner: "E7"
depends_on: [M-E3-001, M-E6-001]
used_by: [I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E7"
public_contracts:
  - "[[modules/e07-build-lane/MANIFEST.md#Public contract surface]]"
internal_scope: "Lane scripts, runner configs, signing-execution plumbing, cost dashboards. Policy texts stay in E6; this capsule proves compliance per run."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
---

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

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.
