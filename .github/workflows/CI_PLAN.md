---
record_id: V-CI-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/.github/workflows/CI_PLAN.md.snapshot"
metadata_origin_digest: "2306c23234ad720be61b3a90b7bb58b3f40e03b14c98b2f9cdf536cf70bde4fd"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources (single truth, not copied): `DEC-0051` (free = templates + GitHub automation; no API actuation); Step-3 `planning 08_REPOSITORY_BOOTSTRAP/VALIDATION_DRAFT/VALIDATION_COMMANDS.md` (8 commands × T1/T2/T3) + `ARCHITECTURE_TEST_SUITE.md` (gate signals FAIL / WARN-then-FAIL / REJECT); `planning 07_AI_ARCHITECTURE/RULES/README.md` (rule→gate mapping: per-task review / release gate / bootstrap gate); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md` (lifecycle + different-chat review); Step-1 blueprint (`.github/workflows/` address reservation). Install addresses: `kavriva-app/.github/workflows/` (workflow files) — this draft is the spec; YAML wiring is installation after PASS + owner approval."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "E-PR-002"
  - "E-PR-003"
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E3-001-R3"
  - "P-E6-003"
  - "E-DEV-056"
  - "P-E6-011"
  - "E-DEV-058"
  - "P-E6-017"
  - "E-DEV-059"
  - "P-E4-001"
  - "E-DEV-060"
  - "P-E4-002"
  - "E-DEV-061"
  - "P-E4-003"
  - "E-DEV-062"
  - "P-E4-004"
  - "E-DEV-063"
  - "P-E4-005"
  - "E-DEV-064"
  - "P-E4-006"
  - "E-DEV-065"
  - "P-E4-007"
  - "E-DEV-066"
  - "P-E4-008"
  - "E-DEV-067"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
supersedes: []
superseded_by: []
status: "INSTALLED"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# CI PLAN (INSTALLED — Phase-8 Step 4 REVIEWED PASS; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (round 1: CHANGES_REQUESTED 2 findings → narrow remediation; round 2: independent re-review PASS, no open findings, 2026-09-22; installed to `.github/workflows/CI_PLAN.md`)
Record: `V-CI-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `DEC-0051` (free = templates + GitHub automation; no API
actuation); Step-3 `planning 08_REPOSITORY_BOOTSTRAP/VALIDATION_DRAFT/VALIDATION_COMMANDS.md` (8 commands × T1/T2/T3) +
`ARCHITECTURE_TEST_SUITE.md` (gate signals FAIL / WARN-then-FAIL / REJECT); `planning 07_AI_ARCHITECTURE/RULES/README.md`
(rule→gate mapping: per-task review / release gate / bootstrap gate); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`
(lifecycle + different-chat review); Step-1 blueprint (`.github/workflows/` address reservation).
Install addresses: `kavriva-app/.github/workflows/` (workflow files) — this draft is the spec; YAML wiring
is installation after PASS + owner approval.

## Events → check sets (platform: GitHub automation per DEC-0051; no other vendor)

| Event | Check set | Rationale |
|---|---|---|
| Push to any non-`main` branch | T1 (manifest/contract/pack checks) | fast feedback on render/doc-level breakage |
| Pull request opened/synchronized | T1 + T2 (identity/orphan/link/edge) | full architecture surface before human review |
| Pull request labeled `t3-privileged` (E5 powers, E6 promotion, E3 epochs/migrations, E7 lanes) | T1+T2+T3 + conformance-record presence | privileged work never merges on green lights alone |
| Merge to `main` (post-merge) | T1+T2+T3 full + closure-evidence write | `main` always verified; evidence lands in `vault/EVIDENCE/` |
| Scheduled (periodic) | stale-pack + orphan sweeps | drift detection independent of change flow |

## Fail conditions (signals defined in Step-3 suite; consumed here, never redefined)

- FAIL (orphan, broken link, forbidden edge, cycle, ownerless contract, missing conformance):
  blocks the event's gate; merge impossible until narrow remediation + re-run green.
- WARN-then-FAIL (stale pack): WARN on detection; FAIL if an active task consumes the stale pack.
- REJECT (identity collision): rejected outright, never merged; rename only via `supersedes` chain (R-010).
- No numeric thresholds anywhere (coverage-%, timeouts, counts): fail is signal-based only (Phase-7 guardrail).

## Merge gates (`main` protection logic; enforced by platform, owned by gate)

1. Required green: the event's check set, re-run on latest commit (stale green never merges).
2. Independent review: different-chat reviewer (R-007) or an independent delegated sub-agent whose identified
   verdict the owner explicitly accepts (DEC-0069). T3 still requires a recorded second eye with
   agreement≠approval (DEC-0052/0056/0069).
3. Scope check: change touches only its task's declared surface (manifest-declared seams; new seam use
   without declaration + review = violation, rejected at gate).
4. Evidence: T2/T3 merges attach conformance-shaped records (`vault/EVIDENCE/`); missing evidence = block.
5. No T3 merge based on implementer self-review or an automatic check alone. A recorded independent verdict,
   explicit owner acceptance, green PR checks and a PR are required; no direct pushes to `main`.

## Ownership

- Automation runs checks; implementer remediates; independent reviewer verifies; owner accepts the
  delegated verdict where DEC-0069 applies; gate enforces.
- Check-implementation language stays HELD for installation (Step-3 deferral honored): this plan reserves
  one workflow file per check family + one aggregator; file decomposition is installation detail, not selection.

## Non-goals

- No workflow-file contents in this step (installation after PASS + approval); no runner/labelMinute choices;
  no numeric gates; no product-code CI (lint/typecheck/unit for Flutter/Supabase arrive with Development, not here).

## Acceptance of THIS draft

1. Every Step-3 command owns ≥1 event row above (manual check — no unwired command).
2. Every T1/T2/T3 class has a blocking gate (manual check — no tier merges on lights alone where review required).
3. No vendor-beyond-GitHub / numeric / implementation selection (manual check vs guardrails).
4. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## Development E6 test family (T-E6-003)

`.github/workflows/e6-tests.yml` independently installs `python3 -m unittest discover -s modules/e06-release/tests -v` on push and pull_request, using the existing reviewed immutable checkout pin, contents: read and persist-credentials: false. No dependency installation, product credential or deployment. It runs accepted registry and new snapshot-binding tests present in this branch; absent draft PR57 role code is not claimed covered or merged. Current-head gates include this family alongside existing workflows, with independent review/T3/main-protection unchanged. Green structural tests grant no authenticated approval or publication permission.

Context `vault/PACKS/P-E6-003.md`; evidence `vault/EVIDENCE/E-DEV-056.md`. Draft PR57's parallel pending E6-family/CI-plan additions need normal source/evidence reconciliation when its full task is ready. Original CI plan and metadata custody above remain unchanged.

## Development T-E6-011 coverage

Existing E6 family runs accepted registry/snapshot plus current config-typing fixtures. `vault/PACKS/P-E6-011.md` / `vault/EVIDENCE/E-DEV-058.md`: review-level internal rules only; no unmerged PR59 guarded/PR57 independence units counted. No workflow/install/provider change. Current exactheadCI/actualT3 and independent source/finalmetadata review separate from effective config/migration/publishing/production gates.

## Development default OTA denial coverage

Existing E6 family includes actual registry/snapshot/config/denial units, `vault/PACKS/P-E6-017.md` / `vault/EVIDENCE/E-DEV-059.md`. No workflow/dependency/provider installation; no unmerged PR59/PR57 tests counted. Default-denial security probes/currentexactheadCI and independent source/final metadata acceptance never approve an OTA channel or prove missing client/device/provider/audit/physical integration.

## E4 actual internal composition unit family

`.github/workflows/e4-tests.yml` runs current `modules/e04-offline/tests/test_core_composition.py` on push/PR using the existing pinned checkout, read-only permissions and no persisted credentials. Local 12 fixture tests check exact declared composition with default production HELD; no canonical source/device/package promotion proof. Existing five families and gate rules unchanged. Current twelve runs required at exact source head; no partial-task independent acceptance from CI. Context `vault/PACKS/P-E4-001.md`; proof `vault/EVIDENCE/E-DEV-060.md`.

## E4 safety nesting coverage

Existing `.github/workflows/e4-tests.yml` unchanged, current discovery covers22units (accepted12composition +10nesting). `modules/e04-offline/tests/test_safety_media_nesting.py` verifies required safety is nested and not additive/on-demand-for-size in exact supplied declarations; NONE/real source/classification/runtimeHELD retained. Context `vault/PACKS/P-E4-002.md`; evidence `vault/EVIDENCE/E-DEV-061.md`. No CI policy or privilege/authentication gate changed.

## E4 optional lifecycle rule coverage

Existing `.github/workflows/e4-tests.yml` unchanged Historical e1fcde4 discovery covered34units (accepted22 +12optional). Current new source covers35units (accepted22 +13optional), including finite serializer-error stress after root correction; workflow unchanged. `modules/e04-offline/tests/test_optional_media.py` tests synthetic explicit requests/cancelled and replayed attempts/eviction/refetch/core invariance/type and byte corruption; never actual human intent/network/storage/canonical acceptance. Context `vault/PACKS/P-E4-003.md`; proof `vault/EVIDENCE/E-DEV-062.md`. Exact-source twelve CI/independent task review remain separate gates; no gate-policy changes.

## E4 size presentation rule coverage

Existing `.github/workflows/e4-tests.yml` unchanged; current discovery47units (accepted35 +12size-rule). `modules/e04-offline/tests/test_size_shown.py` probes missing/fake/edited/stale receipts, exact text/current size/spec/request identity, retry/refetch/terminal replay, type/finite encoding failure/core invariance/NONE/runtimeHELD. Memory fixtures are not actual screen visibility/user authentication/transfer/device proof. Context `vault/PACKS/P-E4-004.md`; proof `vault/EVIDENCE/E-DEV-063.md`. Exacthead12CI/actualPRT3/full independent task/final metadata review separate gates; no gate policy/workflow/custody change.

## E4 transition contract coverage

Existing `.github/workflows/e4-tests.yml` unchanged discovers61units (accepted47 +14transition). `modules/e04-offline/tests/test_stage_verify_promote.py` probes incomplete/corrupt/mixed/old/incompatible declaration bindings/current-pin conflict/reverification/retained old/peak sums/disposable order/protected classes/insufficient space/type/immutable forgedproposal/runtimeHELD. Memory declaration tests are not actual encrypted disk/CAS/atomic commit/crash recovery/canonical source/compatibility/device evidence. Context `vault/PACKS/P-E4-005.md`; proof `vault/EVIDENCE/E-DEV-064.md`. Exacthead12CI/actualPRT3/full independent task/final metadata review remain gates; no workflow/gatepolicy/custody changes.

## E4 complete-package fallback coverage

Existing `.github/workflows/e4-tests.yml` unchanged discovers72units (accepted61 +11fallback). `modules/e04-offline/tests/test_full_package_fallback.py` probes missing/stale/mixed/malformed/hostile delta or base, exacthintdeferred, targetfreshness/selection, completeIDs, partial/corrupt T005integrationfailures, immutability/no callback/finiteerrors/NONE/productionHELD. Memory fixtures are not actualdelta/fullfetch/encryptedatomicstore/canonicalacceptance/device evidence. Context `vault/PACKS/P-E4-006.md`; proof `vault/EVIDENCE/E-DEV-065.md`. Exacthead12CI/actualPRT3/fulltask/finalmetadatareview remain separate; no workflow/gatepolicy/custodychange.

## E4 required-only automatic scheduling coverage

Existing `.github/workflows/e4-tests.yml` unchanged discovers84units (accepted72 +12scheduling). `modules/e04-offline/tests/test_required_auto_transfer.py` probes requiredonly/nointent/priority/alltransports/arbitraryfixturelength/no dialog/notneedednoauto/unknownclassification/wrongscope/optionalexplicitcontext/hostiletypes/completionNONE/unknown or forgedqueue/immutability/productionHELD. Memory declarations not actualE1needs/visiblegesture/size/physicalnetwork/start/completion/encryptedstore/authority/device proof. Context `vault/PACKS/P-E4-007.md`; proof `vault/EVIDENCE/E-DEV-066.md`. Exacthead12CI/actualPRT3/fulltask/finalmetadatareview remain separate; no workflow/gatepolicy/custodychange.

## E4 retry-saver policy coverage

Existing `.github/workflows/e4-tests.yml` unchanged discovers96units (accepted84+12retry-saver). `modules/e04-offline/tests/test_retry_saver.py` probes constraintdelay/noconfirmation/unknownhold/supportedinterruptionboundedvaluesheld/unsupportedunknown/priorityalltransports/noimplicitintent/forgedproposal/types/immutability/coherentforgery/constantHELD. Fixtures not actualOS/capability/download/resume/background/encryptedstore/authority/device proof. Context `vault/PACKS/P-E4-008.md`; proof `vault/EVIDENCE/E-DEV-067.md`. Exacthead12CI/actualPRT3/FULLtask/finalmetadatareview required; no workflow/gatepolicy/custody change.
