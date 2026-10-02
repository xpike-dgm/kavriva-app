---
record_id: M-E4-001
metadata_version: 1
purpose: "Seçili görev paketi indirilir; kullanıcı işleri defterle gider; CON-005 uyumlu (onaysız hücresel/roaming başlatma, ağ-türü/MB eşiği diyaloğu yok). E4 ← E3, consumed by E1 (never the reverse)."
domain: "module-contract"
module: "e04-offline"
owner: "E4"
depends_on: [M-E3-001]
used_by: [M-E1-001, I-E10-REGISTRATION-BASELINE, I-E10-PATHS-001, P-E10-006, E-DEV-033, V-E4-CORE-001, P-E4-001, E-DEV-060, V-E4-SAFETY-001, P-E4-002, E-DEV-061, V-E4-OPTIONAL-001, P-E4-003, E-DEV-062, V-E4-SIZE-001, P-E4-004, E-DEV-063, V-E4-TRANSITION-001, P-E4-005, E-DEV-064, V-E4-FALLBACK-001, P-E4-006, E-DEV-065, V-E4-AUTO-001, P-E4-007, E-DEV-066, V-E4-RETRY-001, P-E4-008, E-DEV-067, V-E4-EVICTION-001, P-E4-009a, E-DEV-068, V-E4-PROTECTED-001, P-E4-009b, E-DEV-069, V-E4-HOLD-001, P-E4-010, E-DEV-070, V-E4-LEDGER-001, P-E4-011a, E-DEV-071, V-E4-ELIGIBILITY-001, P-E4-013, E-DEV-072, V-E4-RECOVERY-001, P-E4-014, E-DEV-073]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E4"
public_contracts:
  - "[[modules/e04-offline/MANIFEST.md#Public contract surface]]"
internal_scope: "Package composer, delta engine, download scheduler, storage janitor order (temp → needless media → old cache; active package/user data/audit/floors never auto-deleted), ledger queue. Mechanism/key custody split decided separately (encryption); no plaintext backups."
tasks: [T-E10-001, T-E10-006, T-E4-001, T-E4-002, T-E4-003, T-E4-004, T-E4-005, T-E4-006, T-E4-007, T-E4-008, T-E4-009a, T-E4-009b, T-E4-010, T-E4-011a, T-E4-013, T-E4-014]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e04-offline/MANIFEST.md.snapshot"
metadata_origin_digest: "4bcc6ec58313806b72536ad7cc2e242ae16d4afb8ca6b5243bea2917e7890038"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
---

# MODULE MANIFEST — e04-offline (E4 Çevrimdışı paket + senkron)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e04-offline/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E4-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Seçili görev paketi indirilir; kullanıcı işleri defterle gider; CON-005 uyumlu (onaysız hücresel/roaming
başlatma, ağ-türü/MB eşiği diyaloğu yok). E4 ← E3, consumed by E1 (never the reverse).

## Public contract surface

- Package manifest contract (verified compact core + nested safety media; non-mandatory media outside,
  separately cancellable/cleanable/re-fetchable; size shown upfront).
- Ledger operation contract (identity operation + fingerprint + version; API send/query; no silent
  last-writer-wins on critical data; restore lands in quarantine, cannot resurrect forbidden).
- Staged accept → verify → atomic upgrade; broken/mixed/old packages unusable; missing delta falls back
  to full package; peak-storage rule.

## Internal scope

Package composer, delta engine, download scheduler, storage janitor order (temp → needless media →
old cache; active package/user data/audit/floors never auto-deleted), ledger queue. Mechanism/key
custody split decided separately (encryption); no plaintext backups.

## Allowed / forbidden dependencies

- Allowed: E3 only (serve/verify/source of packages and ledger API).
- Consumed by: E1 (renders package content; E1 never sources packages elsewhere).
- Forbidden: depending on E1 (direction fixed: E4 ← E3, consumed by E1); auto-deleting protected classes;
  numeric policy values smuggled as constants (all C4.8 candidate numbers stay HELD for real measurement).

## Tests

- CON-005 tests: no network-type/MB dialogs; resumable transfer where supported.
- Package negatives: corrupt/mixed/stale rejection; delta-fallback; peak-storage behavior.
- Ledger tests: fingerprint/version conflicts surface, never silent wins; quarantine-restore tests.

## Change / rollback rules

- Package-format changes version + atomic-upgrade path; old-format packages rejected, never half-applied.
- Rollback: restore-in-quarantine only; recovery closure complete before offline restart (C4.6).

## Links (defined-by-reference, not copied)

- Requirements/design: `C4.1`..`C4.9`, `F4.*`; `ADR-009`; `CON-005`.
- Architecture: seam rows (E4 ← E3, consumed by E1); `R-001`, `R-003`, `R-004`, `R-008`, `R-011`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E4 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## T-E4-001 actual internal composition coverage

`modules/e04-offline/internal/core_composition.py` and `modules/e04-offline/tests/test_core_composition.py` check supplied selected-task declared complete membership/byte digests/context only, intrinsic NONE. Pure production gate HELD until E3 canonical approved package source is bound. No generator/classification authority/new public seam/private cross-import/persistence/mobile actionability. Original anatomy/scope/allowed E3 dependency unchanged. Context `vault/PACKS/P-E4-001.md`; profile `vault/PROFILES/core-composition-check.md`; evidence `vault/EVIDENCE/E-DEV-060.md`. New CI `.github/workflows/e4-tests.yml`. At pre-review source freeze task remained IN_PROGRESS. Independent full task-level PASS at 3c2c55d96a2130936ae8b8003e8d12bcbe8f79f9 now completes only this composition-check task; actual source/generation/classification/device/runtime still HELD. Final receipt in `vault/EVIDENCE/E-DEV-060.md`.

## T-E4-002 actual internal nesting check

`modules/e04-offline/internal/safety_media_nesting.py` delegates accepted core verification, rejects essential ID on-demand and counts safety bytes only as subset of actual required core total, no additional budget/size trim. Tests `modules/e04-offline/tests/test_safety_media_nesting.py`; unchanged E4 workflow discovers current22tests. No classification/generator/newseam/E6import/runtime permission/persistence. Authoritative lifecycle `vault/REGISTRY/T-E4-002.md`; context `vault/PACKS/P-E4-002.md`; profile `vault/PROFILES/safety-media-nesting.md`; evidence `vault/EVIDENCE/E-DEV-061.md`.

## T-E4-003 actual optional lifecycle rules

`modules/e04-offline/internal/optional_media.py` / `modules/e04-offline/tests/test_optional_media.py` implement internal separate optional states, exact explicit intent, cancellation/late-receipt rejection/eviction/fresh refetch with required-core protection on each state use. No actual network/disk/source/user identity/classification/device/encrypted custody proof, intrinsicNONE/productionHELD. Authoritative lifecycle `vault/REGISTRY/T-E4-003.md`; context `vault/PACKS/P-E4-003.md`; profile `vault/PROFILES/nonessential-media-rules.md`; evidence `vault/EVIDENCE/E-DEV-062.md`. Public/anatomy/edge scope unchanged, core never enters optional intent gate.

## T-E4-004 actual size presentation rule

`modules/e04-offline/internal/size_shown.py` / `modules/e04-offline/tests/test_size_shown.py` bind exact declared size/text/spec/request before optional model request. Actual E1 display/receipt provenance/gesture/transfer/device/encrypted storage still HELD, intrinsicNONE/constantproductionHELD; coherent caller receipt not UI evidence. Required core path unchanged, no CON005 prompt/size policy. Public/anatomy/scope/edges unchanged. Lifecycle `vault/REGISTRY/T-E4-004.md`; context `vault/PACKS/P-E4-004.md`; profile `vault/PROFILES/optional-size-shown.md`; proof `vault/EVIDENCE/E-DEV-063.md`.

## T-E4-005 actual internal transition contract

`modules/e04-offline/internal/stage_verify_promote.py` / `modules/e04-offline/tests/test_stage_verify_promote.py` define staged complete verification/reference binding and one immutable all-or-nothing replacement proposal retaining prior complete bytes/current pin, with old+new+verification peak and disposable-only cleanup/insufficient hold. No actual atomic persistence/CAS/encryption/physical cleanup/promotion/compatibility authority/device proof. IntrinsicNONE/productionconstantHELD; original public/anatomy/scope/edges unchanged. Lifecycle `vault/REGISTRY/T-E4-005.md`; context `vault/PACKS/P-E4-005.md`; profile `vault/PROFILES/package-transition-contract.md`; proof `vault/EVIDENCE/E-DEV-064.md`.

## T-E4-006 actual complete-package fallback rule

`modules/e04-offline/internal/full_package_fallback.py` / `modules/e04-offline/tests/test_full_package_fallback.py` choose complete selectedtarget closure for absent/stale/malformed/unusable delta/base hints; exacthint stillfullbecause deltaoptimizationdeferred. Knownstale/foreigntargetrejects. Plan is not bytes/permission/actualfetch, T005verification/peak/atomicity gates unchanged. IntrinsicNONE/constantproductionHELD; public/anatomy/scope/edgesunchanged. Lifecycle `vault/REGISTRY/T-E4-006.md`; pack `vault/PACKS/P-E4-006.md`; profile `vault/PROFILES/full-package-fallback.md`; proof `vault/EVIDENCE/E-DEV-065.md`.

## T-E4-007 actual internal automatic scheduling policy

`modules/e04-offline/internal/required_auto_transfer.py` / `modules/e04-offline/tests/test_required_auto_transfer.py` schedule declaredneededrequiredcore first/only existingexplicitoptional/no network or byteconfirmation; completionmeans suppliedoutcomeonly/NONE. No actualE1need/size/gesture/networkOS/download/byteproof/encryptedstorage/runtimeauthority, productionconstantHELD. Originalpublic/anatomy/scope/edgesunchanged. Lifecycle `vault/REGISTRY/T-E4-007.md`; pack `vault/PACKS/P-E4-007.md`; profile `vault/PROFILES/required-auto-transfer.md`; proof `vault/EVIDENCE/E-DEV-066.md`.

## T-E4-008 actual internal retry-saver policy

`modules/e04-offline/internal/retry_saver.py` / `modules/e04-offline/tests/test_retry_saver.py` preserve acceptedrequiredpriority/explicitoptional/no confirmation; suppliedOSsaver delays/unknownholds, supplied supportedinterruption declares resumableboundedretrywithvaluesHELD. No actualOSadapter/resume/loop/encryptedstore/device authority; constantproductionHELD/NONE. Originalanatomy/scope/publicedgesunchanged. Task `vault/REGISTRY/T-E4-008.md`; pack `vault/PACKS/P-E4-008.md`; profile `vault/PROFILES/retry-saver-rule.md`; proof `vault/EVIDENCE/E-DEV-067.md`.

## T-E4-009a actual internal eviction order

`modules/e04-offline/internal/eviction_order.py` / `modules/e04-offline/tests/test_eviction_order.py` order allvalidateddisposablecandidates in acceptedfourclassorder/stableties, preserve acceptedT005protectionchecks, no actualcleanup/freedbytes/sourceclassification/storageauthority. ProductionconstantHELD/NONE. Originalscope/anatomy/publicedges unchanged. Profile `vault/PROFILES/eviction-order-rule.md`; pack `vault/PACKS/P-E4-009a.md`; task `vault/REGISTRY/T-E4-009a.md`; proof `vault/EVIDENCE/E-DEV-068.md`.

## T-E4-009b actual internal protection policy

`modules/e04-offline/internal/never_evict.py` / `modules/e04-offline/tests/test_never_evict.py` protectsixclasses/unknownconflictheld/separatesameIDfactguard before returnedacceptedT009aorder, no actualcleanup/freedbytes/sourceclassification/storageauthority. ProductionconstantHELD/NONE. Originalscope/anatomy/publicedges unchanged. Profile `vault/PROFILES/never-evict-policy.md`; pack `vault/PACKS/P-E4-009b.md`; task `vault/REGISTRY/T-E4-009b.md`; proof `vault/EVIDENCE/E-DEV-069.md`.

## T-E4-010 actual internal held staging rule

`modules/e04-offline/internal/hold_transfer.py` / `modules/e04-offline/tests/test_hold_transfer.py` hold ifcomplete staging cannotfit afterdeclaredorderedguardedcleanup, preserveold/requiredtruth/acceptedT005checks, no actualcleanup/freedbytes/transfer/runtimeauthority. ProductionconstantHELD/NONE. Originalscope/anatomy/publicedges unchanged. Profile `vault/PROFILES/hold-transfer-rule.md`; pack `vault/PACKS/P-E4-010.md`; task `vault/REGISTRY/T-E4-010.md`; proof `vault/EVIDENCE/E-DEV-070.md`.

## T-E4-011a actual internal ledger states

`modules/e04-offline/internal/ledger_states.py` / `modules/e04-offline/tests/test_ledger_states.py` enumerateeightlocalledgerstate meanings and deny noncanonicalacceptance; no actualpersistedoperation/E3result/ledgerauthority. ProductionconstantHELD/NONE. Originalscope/anatomy/publicedges unchanged. Profile `vault/PROFILES/ledger-state-rule.md`; pack `vault/PACKS/P-E4-011a.md`; task `vault/REGISTRY/T-E4-011a.md`; proof `vault/EVIDENCE/E-DEV-071.md`.

## T-E4-013 actual internal offline eligibility rule

`modules/e04-offline/internal/offline_eligibility.py` / `modules/e04-offline/tests/test_offline_eligibility.py` inherit highest declared consequence, hold unknown/stale dependencies, enforce sticky monotonic cached negatives and online-authoritative Internal Operations routing. All decisions NONE/physical_progressionFalse; actual canonical taxonomy/windows/eligibility/recovery/encrypted runtime HELD. Original scope/anatomy/public edges unchanged. Profile `vault/PROFILES/offline-eligibility-rule.md`; pack `vault/PACKS/P-E4-013.md`; task `vault/REGISTRY/T-E4-013.md`; proof `vault/EVIDENCE/E-DEV-072.md`.

## T-E4-014 actual internal recovery-closure rule

`modules/e04-offline/internal/recovery_closure.py` / `modules/e04-offline/tests/test_recovery_closure.py` reverify complete compact bytes/context and exact graph source pin, require both safe-stop/recovery parts for every reachable declared state, hold incomplete/unsupported/expired/unknown closure. Even complete supplied declarations remain NONE/physical_startFalse; actual reviewed physical graph/instructions/canonical source/eligibility/encrypted device/runtime HELD. Original scope/anatomy/public edges unchanged. Profile `vault/PROFILES/recovery-closure-rule.md`; pack `vault/PACKS/P-E4-014.md`; task `vault/REGISTRY/T-E4-014.md`; proof `vault/EVIDENCE/E-DEV-073.md`.
