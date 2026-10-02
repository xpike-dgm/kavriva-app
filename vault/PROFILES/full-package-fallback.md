---
record_id: V-E4-FALLBACK-001
version: 1
purpose: Choose complete selected-task package when delta is missing stale or deferred
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-005, C4.2, F4.2.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: full-package-fallback-rule
tasks: [T-E4-006]
tests: [modules/e04-offline/tests/test_full_package_fallback.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E4-TRANSITION-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-006, T-E4-006, E-DEV-065]
evidence: [E-DEV-065]
supersedes: []
status: REVIEW
---

# Complete-package fallback rule

T-E4-006 canonical Missing/stale delta -> complete package; reviewgate/harddepT005DONE after fullcontract/finalaudit/exactCI/normalmerge acceptedmain e135aa57612f2178090ee6545d0d9ddb379e7b92. Acceptedremoteplanmainfa914f013fdcd032faed876689092da245989459/localstaleplanmain7d705a69/localpendingbranch e3c2e3f/planPR4unmerged/directstandingmandate distinguished, unresolvedPR47/57/59 unmerged. ADR009R2/C4.2/F4.2.1/FL4.2.1/DEBATE009judge complete-package-first and deferred delta optimization until measured savings/exactbase/digest/dependency/ordering/fallback proof. E4consumesE3, generation E3/E6pipeline; no cross-private import/new public seam/managedsyncfallback.

## Actual internal rule

PackageTarget is immutable supplied declaration/scope/manifestpin. Accepted T005 Stage validation checks complete selected-task pinned metadata/required roles/types before a plan, not received bytes. plan_fetch revalidates supplied current VerifiedCandidate if usable; known valid current requires same motorcycle/task and a strictly newer target generation. Old/same or foreign target rejects, never replaced by an old or unrelated catalog target. An absent/corrupt/unusable supplied base can yield a full-fetch plan with finite reason, never local-use permission or override of real canonical floors.

DeltaHint is only a plain immutable base scope/digest+target scope/digest declaration. Missing hint returns COMPLETE_PACKAGE. Missing/unusable current base, changed base generation/selection/digest, targethint scope/digest mismatch, malformed/plain-type-invalid/hostile/callback hints also choose the same complete target. No input callback runs and no supplied hint can force delta execution. Even an exact base/target hint uses COMPLETE_PACKAGE with DELTA_DEFERRED_COMPLETE_PACKAGE because optimization is not selected or measured; no patch algorithm/order/transfer provider is introduced. Fixed finite reasons expose no input contents.

FetchPlan contains exact pinned target and every declared required part ID, including declared required safety; scope never expands to unrelated/full-library content. Plan carries no received bytes or approved generation. Partial or corrupt subsequently staged payloads still fail unchanged T005 full verification; peak-space/all-or-nothing/encrypted-store requirements cannot be bypassed by a full-fetch plan. Old input snapshots/bytes remain unchanged; all outputs intrinsicNONE, constant productionHELD_CANONICAL_PACKAGE_FETCH_AND_RUNTIME_MISSING ignores flags/callbacks. Coherent forged target/base/hint may produce a plan but proves no actual canonical source/classification/compatibility/currentgeneration/floor/transfer permission. Requiredcore CON005 no confirmation unchanged.

## Validation and product holds

Eleven new+accepted61 full72PASS0.088s/compile. Cases missing delta/allrequiredIDs; stale/mixed base or targethint references; exacthint deferred; missing/corrupt/unknownbase; old/same/foreigntarget; unknown/mutable/incomplete/changedtarget metadata; hostile/malformed/callbackhints; actual T005partial/corrupt fixture verification rejects; immutableplan/oldinputs/no catalogexpansion; coherentforgery/defaultproductionHELD; finite extreme targetencoding. Synthetic memory fixtures only; no unit failure or independent verdict before source freeze.

Actual trusted E3 source/semantic classification/compatibility/dependencies/currentgeneration/floors, physical fullfetch/resume/byteverification/encrypted storage/atomic CAS/crashrecovery/mobile device runtime remain MISSING/HELD. Delta algorithm/savings/ordering/physicalbase/payload validation unselected/deferred; no productionlimits/provider/version/wireformat. No actual transfer/approvedpackage/actionability/productready claim. Full task independent review/currentCI required, no authorPASS/DONE.

## Trace

ADR009R2 -> C4.2 -> F4.2.1 -> FL4.2.1 -> T-E4-006 -> M-E4-001 -> E-DEV-065. Requirement/feature/flow/task internal fullfetchrule, design internal API no new UI, architecture E4-only reuse, data no persistence/migration, releaseNONE/held, scenarios negatives, gaps above. Code `modules/e04-offline/internal/full_package_fallback.py`; tests `modules/e04-offline/tests/test_full_package_fallback.py`; accepted contract `modules/e04-offline/internal/stage_verify_promote.py`; unchanged workflow `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-006.md`; task `vault/REGISTRY/T-E4-006.md`; proof `vault/EVIDENCE/E-DEV-065.md`.
