---
record_id: M-E4-001
metadata_version: 1
purpose: "Seçili görev paketi indirilir; kullanıcı işleri defterle gider; CON-005 uyumlu (onaysız hücresel/roaming başlatma, ağ-türü/MB eşiği diyaloğu yok). E4 ← E3, consumed by E1 (never the reverse)."
domain: "module-contract"
module: "e04-offline"
owner: "E4"
depends_on: [M-E3-001]
used_by: [M-E1-001, I-E10-REGISTRATION-BASELINE, I-E10-PATHS-001, P-E10-006, E-DEV-033, V-E4-CORE-001, P-E4-001, E-DEV-060]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E4"
public_contracts:
  - "[[modules/e04-offline/MANIFEST.md#Public contract surface]]"
internal_scope: "Package composer, delta engine, download scheduler, storage janitor order (temp → needless media → old cache; active package/user data/audit/floors never auto-deleted), ledger queue. Mechanism/key custody split decided separately (encryption); no plaintext backups."
tasks: [T-E10-001, T-E10-006, T-E4-001]
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
