---
record_id: V-E4-CLASSIFICATION-001
version: 1
purpose: Record media and history classification criteria without authorizing semantic classification or storage effects
domain: offline-classification
module: e04-offline
owner: E4
implements: [ADR-009, ADR-001, BR-131, BR-132, BR-133, C4.1, F4.9.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: media-classification-table
tasks: [T-E4-017]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E4-001, V-E4-CORE-001, V-E4-OPTIONAL-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-017, T-E4-017, E-DEV-076]
evidence: [E-DEV-076]
supersedes: []
status: REVIEW
---

# Media and history classification table

Canonical T-E4-017 row125/F4.9.1/FL4.9.1/C4.1/acceptance192 requires criteria plus Q156/Q157 examples, rule only; mechanism remains in F4.1.1/F4.1.2. Harddeps T-E4-001/T-E4-003 are DONE internal checks at actualacceptedmainf04a10e542f9853f7551b4eabc3d8b0c43298419 after actual PR62/PR64 merges. They do not authenticate source semantics or complete E3 productR1. UnmergedPR75/unpublishedT015/T016 and their admissions/statuses are not consumed. Source planning pinfa914f, directownerstandingmandate/acceptedDEC0069; pendinglocalplanPR4/DEC0070 notacceptedmain.

## Authoritative rule and evidence sources

[Confirmed synthesis BR131..133](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/02_DISCOVERY/SYNTHESIS/BUSINESS_RULES.md) governs product rules. [Raw Q156/Q157/Q158 answers](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/02_DISCOVERY/SESSIONS/SESSION-006_BATCH_06_Q156_Q185.md) supply examples, not a replacement for synthesis. [F4.9.1 feature owner/guard](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/FEATURE_CATALOG.md) preserves E3/E6 classification ownership; E8 derives/checks only. No new runtime E4-to-E6/E8 edge introduced; E4 consumes E3 served classification, E1 renders.

## Classification criteria (rule table, not an item classifier)

| Criterion | Rule outcome | Guard / negative case | Source |
|---|---|---|---|
| Basic longitudinal motorcycle history | Preserve motorcycle, operation, date, mileage, actor, outcome, important safety notes, evidence level and correction history | Old basic records never deleted merely to free space; large history is not automatically optional | BR131/Q156 |
| Evidence necessary to understand or prove the operation | Core evidence regardless of volume, resolution, format or length | Necessary high-resolution photo or long video cannot become expanded merely because large | BR132/Q157 |
| Media necessary for safe understanding of selected-task instructions/warnings/checks/safe-stop/recovery | Required safety-media inside one complete required compact core | Never additive budget, optional request gate or trimming to a size candidate | ADR009R1/accepted T001/T002 |
| High-volume high-resolution photos, long videos or wide document archive beyond necessary core evidence and without protected necessity | May be expanded-storage value, conditional on authoritative necessity classification | Format/count/size alone never decides; a needed item stays core, unknown critical necessity holds actual optionalization | BR132/Q157/ADR009R6 |
| Existing core history and safety-critical evidence under premium/storage limit | Keep access and preserve evidence; basic history view/export continues | No hiding or deleting existing core/safety evidence; new large uploads may be managed without inventing quota/tier | BR133/Q158 |
| User-owned durable photos/notes/evidence/pending-or-accepted operation truth versus disposable delivery cache | Durable user work remains protected from routine adaptive eviction, including expanded user archive | Expanded is not synonym for evictable; only correctly classified disposable/refetchable nonessential delivery media is subject to its separate lifecycle | ADR009R4/BR133/accepted T003 boundaries |
| Missing, disputed or uncertain trusted necessity classification | Hold real optionalization/progression pending current authoritative review/source | No optional label/default inferred from missing facts; no deleting evidence or silently changing pinned core | ADR009R6/accepted T001/T003 |

## Q156 core examples

The following exact nine field meanings remain core: motorcycle; operation; date; mileage; actor; outcome; important safety notes; evidence level; correction history. Old basic history cannot be purged for storage pressure or hidden behind premium status. This rule does not authenticate an entered history fact: preservation/core status does not change user-reported evidence into technical truth, canonical approval or publication. No item record is written, accepted or edited here.

## Q157 expanded examples and counterexamples

| Example from Q157 meaning | Required distinction | No automatic inference |
|---|---|---|
| A visual needed to understand or prove the operation | Core evidence; included in required compact core if also needed for safe selected-task understanding | Never optional because of size/resolution or premium status |
| Many high-resolution photos beyond the necessary evidence | Potential expanded archive only when authoritative classification confirms they are beyond core and not protected necessary evidence | No count/resolution threshold chosen; durable user images not routine-evictable cache |
| A long video beyond the necessary evidence | Potential expanded archive only under the same necessity/protection test | If the full video is required for understanding/proof/safety, it stays core/required regardless of length |
| A broad document archive beyond the necessary operation evidence | Potential expanded storage value; retain required evidence/access guards | Necessary document/evidence cannot be downgraded because part of a large archive |

These are source-derived rule examples, not actual corpus measurements, item classifications or safe physical instructions. No new safety decision boundary authored. Unknown necessity does not become nonessential by default. New large uploads may be managed under a later reviewed policy, but no numeric limit, tier, price, upload/delete/export mechanism or actual entitlement is selected here.

## Consumption and reclassification boundaries

E3/E6 own current authoritative classification and generation through E3 serving; E8 only derives/checks and cannot approve or reclassify. This table grants no semantic writer, source authenticity or canonical release permission. Actual consumed item/source/provenance/version/context must be verified at its owning runtime boundary; a fixture label or this review verdict cannot open it. A changed required/optional classification requires new reviewed current source/pinned complete-core context and revalidation under accepted T001/T003, never silently weakening the old accepted pin. Actual complete core/safety/recovery/generation/compatibility/negative floors/authority/storage/encryption/device/runtime/rendering remain MISSING/HELD. No new private import/public seam.

Actual user data/physical media/classification/release/export/entitlement/download/deletion/key/provider/device effects absent. This static table cannot prove actual semantic classification or app enforcement. Existing source/profile/test helpers unchanged; no new units mirroring constants. E3R1 REVIEW/E5-003IN_PROGRESS/unmergedPR47/57/59/75 unchanged. Missing universal handoff stays MISSING/BLOCKED for affected operational/production handoff.

## Trace

Q0046/BR131..133 -> C4.1 -> F4.9.1 -> FL4.9.1 -> T-E4-017 -> M-E4-001 -> E-DEV-076. Mechanism owned F4.1.1/F4.1.2; this acceptance rule-only. Profile does not claim real corpus/device measurement/numeric/encryption policy or E1 screen/accessibility completion. Pack `vault/PACKS/P-E4-017.md`; task `vault/REGISTRY/T-E4-017.md`; proof `vault/EVIDENCE/E-DEV-076.md`. FULL independent task/current-head CI needed before DONE, no author PASS.
