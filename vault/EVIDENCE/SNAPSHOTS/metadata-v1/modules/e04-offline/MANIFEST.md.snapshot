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
