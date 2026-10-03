---
record_id: V-E4-POINTS-001
version: 1
purpose: Register source-attributed held storage test points without selecting numeric product policy
domain: offline-measurement
module: e04-offline
owner: E4
implements: [ADR-009, ADR-001, C4.8, F4.8.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: numeric-candidate-points
tasks: [T-E4-016]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-016, T-E4-016, E-DEV-075]
evidence: [E-DEV-075]
supersedes: []
status: REVIEW
---

# Candidate-points HELD registry

Canonical T-E4-016 taskrow124/ADR009R8/C4.8/F4.8.1/FL4.8.1/acceptance142 accepts a HELD registry only. No hard task dependencies. Actual accepted appbasef04a10e542f9853f7551b4eabc3d8b0c43298419(PR74); unmergedPR75T014 and unpublishedT015 not consumed. Actual code/product/device/corpus/encryption/selection remain separate. Local branch reservations/graph checks do not establish accepted merge or numeric policy.

## Approved ADR009 candidate text (verbatim expressions)

Source [approved ADR009 Decision8](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-009__MOBILE_OFFLINE_PACKAGE_LEDGER_AND_TRANSFER.md#decision), pinned accepted planning revisionfa914f. Authority is candidate status only: `HELD CANDIDATE SENSITIVITY / TEST POINTS`.

| Source category | Exact source expression | Status |
|---|---|---|
| compact points | 5/12/25/50/100 MB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| safety-media points | 25/100/150/300/500 MB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| cache points | 100/250 MB/1 GB/2 GB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| free-space bands | 20/10/5% | HELD CANDIDATE SENSITIVITY / TEST POINTS |

## Earlier working-direction candidate text (separate, verbatim expressions)

Source [DEBATE017 Manager Synthesis / Numeric Policy Status](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-017__MANAGER_SYNTHESIS.md#numeric-policy-status), same accepted planning revision. This earlier working direction is not a replacement for approved ADR009. Each expression is retained separately under its original source; all remain HELD.

| Source category | Exact source expression | Status |
|---|---|---|
| compact package | 5 / 12 / 25 / 50 / 100 MB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| required-safety-media subtype | 25 / 100 / 150 / 300 / 500 MB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| refetchable cache | 100 / 250 / 500 MB / 1 GB / 2 GB | HELD CANDIDATE SENSITIVITY / TEST POINTS |
| device free-space test bands | 20% / 10% / 5% | HELD CANDIDATE SENSITIVITY / TEST POINTS |

## Source difference and authority

The older DEBATE017 cache expression includes 500 MB; approved ADR009 Decision8 cache expression does not. Lists remain separate/source-attributed; 500 MB is not silently merged into the ADR list or promoted to an approved product limit. Different percentage notation is also retained verbatim instead of normalized. No point/range/band here is a selected soft budget, hard cap, warning trigger, absolute reserve, cache setting, retry/TTL/chunk parameter or recommendation. No unit-to-byte conversion, formula, chosen product serialization or executable numeric threshold is installed. Source disagreement is visible; choosing a production number requires measured evidence and review, not this registry.

## Safety-media and transfer boundaries

Required safety-media is a semantic subset of the one complete required compact core, never a second additive allowance or removable optional content. Candidate sensitivity axes cannot justify a compact package smaller than its actual required bytes or trimming safety/recovery content to a point. No unrelated library/motorcycle download by default. CON005 keeps required selected-task transfer confirmation-free over Wi-Fi/cellular/roaming/byte-thresholds; the historical25MBcellularconfirmation is superseded, not current policy. Android Auto Backup researched25MBfile quota is a separate platform backup-service constraint, not Kavriva compact/cache/download threshold. Current registry is documentary, not proof of any OS quota behavior or device restore.

## Evidence needed before selection

Real guide/media corpus distribution and safety classification, device storage cohorts, peak old+new+verification space, compression/dedup and cache refetch behavior, interruption/retry behavior, supported Android/iOS device measurements, actual encrypted local mechanism/key custody/native/runtime/backup/restore/migration proof remain MISSING/HELD. T-E4-018 owns actual corpus+device matrix sizes/areas/durations evidence closing C4.8. Fixture or simulation data can inform a test plan but cannot be presented as real measurements or activate a numeric policy. Matrix146 encryption/native/device gate remains separate. No invented corpus/devices/results/verified capacity or positive offline authority.

## Trace and bounded scope

ADR009R8 -> C4.8 -> F4.8.1 -> FL4.8.1 -> T-E4-016 -> M-E4-001 -> E-DEV-075. This registry records the source candidates only, no runtime/API/UI/provider/key/device action. E4/E3/E1 render boundaries unchanged; no private import or new public seam. Actual Owner-view/rendering/accessibility not implemented. Missing universal operational handoff remains MISSING/BLOCKED per installed template. Direct owner standing acceptance/acceptedDEC0069 delegated independent review applies; pending localplanPR4/DEC0070 not acceptedmain. E3R1 REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59/75 unchanged.

Pack `vault/PACKS/P-E4-016.md`; task `vault/REGISTRY/T-E4-016.md`; proof `vault/EVIDENCE/E-DEV-075.md`. FULL independent task review/exact-head CI before DONE; no author PASS/selected policy.
