---
record_id: V-E6-TRANSITION-001
version: 1
purpose: Check exact publication expectations and negative-fence precedence
domain: release-governance
module: e06-release
owner: E6
implements: [ADR-003, ADR-001, ADR-006, C6.2, F6.2.1, R-003, R-004, R-007, R-009, R-011, R-013, R-014]
public_contracts: []
internal_scope: guarded-publication-transition
tasks: [T-E6-004]
tests: [modules/e06-release/tests/test_guarded_transition.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E6-001, V-E6-SNAPSHOT-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E6-004, T-E6-004, E-DEV-057]
evidence: [E-DEV-057]
supersedes: []
status: IN_PROGRESS
---

# Guarded publication transition: incomplete task

Canonical task T-E6-004 acceptance Single transition; fenced precedence; backward fatal, validation test. Harddep T-E6-003 internal binding DONE at merged PR58 a2798024bda445cec4b11bdab43e98ff9576ba7c. Plan main fa914f013fdcd032faed876689092da245989459. ADR003R2/R4 and ADR006R6 require actual single transaction, current E3 negative floors/current E5 authority/protected audit and independent server-derived read-after result; these sources are not installed for publication. PR57 independence and PR47 provisioning remain unmerged incomplete drafts, not source proof.

## Implemented initial slice

Internal frozen PublicationRequest records exact scope/operation ID, expected release/floor generations, target generation and exact snapshot ReviewBinding fingerprint. Deterministic operation fingerprint binds all supplied fields; changing one changes the fingerprint. Exact plain types/nonnegative generations and stable reference syntax reject malformed metadata before comparisons; backward/equal target is fatal. Current fixture carries exact scope, release/floor generations, suspension and restore-quarantine flags. Lower-than-expected current release/floor generation is fatal within this structural expectation model; no actual persisted monotonic floor is proved by that comparison.

assess_fixture_transition revalidates full bound snapshot/review at supplied time, rejects changed snapshot binding/scope/current release/newer floor and equal-generation suspension. Restore quarantine holds. Prior fixture receipt must bind same exact operation/request/result/floor; coherent repeat can match structural retry shape only after current fence/suspension rechecks. Current release may advance independently; old retry cannot claim it is still current. Successful result names FIXTURE_STRUCTURE_MATCH or FIXTURE_RETRY_STRUCTURE_MATCH and intrinsic authority NONE; no timestamp, audit event, ALLOW or effect is invented.

production_gate ALWAYS returns HELD_CANONICAL_RELEASE_TRANSACTION_MISSING without evaluating fixtures, opening a connection or writing any state. There is no adapter selection flag to enable it. Fixtures can be coherently forged; the rules cannot authenticate current state, approval, a receipt, full manifest integrity/completeness/applicability, publisher competence/role independence or real monotonic floor. No locks, canonical writer, transaction, concurrency, rollback, durable idempotency/history, protected audit or independent read-after lookup. This partial implementation cannot meet the task acceptance and stays IN_PROGRESS/draft, no completion review or DONE claim.

## Actual tests and remaining proof

Eleven meaningful new tests plus accepted30 E6 tests: full41 PASS0.049s/compile PASS. Tests exercise scope/current/fence changes, equal negative precedence, quarantine, backward target/current/floor errors, every operation-intent field, changed/expired/bare review, coherent retry and conflicting/mismatched receipt, newer fence/suspension after retry, exact types and runtime default HELD even with hostile fixtures. No actual database/provider/identity/publication/consumer experiment.

Existing E6 workflow automatically discovers these internal units with accepted registry/snapshot; no workflow modification or new package/provider installation. Hosted current-head CI and root architecture/view/custody checks remain separate. Production transaction integration and real public E3/E5 sources must be completed within this same task PR before independent final gpt-6-luna/max task review; not per-slice review.

## Ten-layer trace and gaps

ADR003R2/R4 and ADR006R6 -> C6.2 -> F6.2.1 -> FL6.2.1 -> T-E6-004 -> M-E6-001 internal policy -> E-DEV-057.

| Layer | Current evidence/limit |
|---|---|
| task | IN_PROGRESS, single canonical transition not proved |
| feature | No publication permission or actual positive truth |
| flow | E2 via E3 only, no direct public seam installed |
| requirement | Fixture expectation/fence/backward/error rules only |
| design | No screen/device/accessibility evidence |
| architecture | E6 internal, allowed E3/E5 public inputs not available |
| data/migration | Immutable fixture records, no real schema/transaction |
| release | All publication/provider/lane/activation remains HELD |
| product-scenario | 41 internal units, no real concurrent publish/suspend/commit/read-after |
| gap-audit | E3 current floors/source, E5 publisher/role/auth/audit, E6 transaction/store/read-after missing |

Task T004 remains incomplete; T005/T006 dependent work cannot infer DONE. Shared ADR001R3 publishing-control gate remains MISSING/HELD. E3R1 REVIEW/E5-003 IN_PROGRESS/privileged activation unchanged.

Context `vault/PACKS/P-E6-004.md`; task `vault/REGISTRY/T-E6-004.md`; proof `vault/EVIDENCE/E-DEV-057.md`; accepted binding `modules/e06-release/internal/snapshot_binding.py`; actual public E5 boundary `modules/e05-identity/public/consumer_authority.py`. These references expose gaps, not accepted current publisher sources.
