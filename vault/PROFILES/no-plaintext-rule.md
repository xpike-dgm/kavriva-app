---
record_id: V-E4-PLAINTEXT-001
version: 1
purpose: Block plaintext local storage while encryption mechanism and key custody remain unproven
domain: offline-storage
module: e04-offline
owner: E4
implements: [ADR-009, ADR-001, C4.7, F4.7.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: no-plaintext-rule
tasks: [T-E4-015]
tests: [modules/e04-offline/tests/test_no_plaintext.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-015, T-E4-015, E-DEV-074]
evidence: [E-DEV-074]
supersedes: []
status: REVIEW
---

# No-plaintext gate

Canonical TASK_INDEX123/ADR009R7/C4.7/F4.7.1/FL4.7.1/acceptance141 requires no-plaintext gate only; exact mechanism/key/versions/device proof stays HELD under matrix146. No hard task dependencies. AcceptedbasePR74 f04a10e542f9853f7551b4eabc3d8b0c43298419 has148 E4 tests. PR75 T014 code/metadata is unmerged and not consumed; final CI was actual startup FAILURE on GitHub payment/spending notice. This independent local task does not resolve that block or accept T014. Source accepted planfa914f/localpendingplanPR4 distinguished; direct owner standing authorization and DEC0069 delegated review apply.

LocalStorageIntent is frozen, with operation and representation only; no payload/path/key enters this model. Strict exact plain types and finite known labels are required; malformed/unknown/mutable/subclass/hostile values raise finite InvalidComposition reasons before any effect. READ/WRITE/STAGE/PROMOTE/COPY/BACKUP/RESTORE/MIGRATE/EXPORT/FALLBACK are local operation categories, not new product wire/API/storage formats. PLAINTEXT always returns BLOCKED_PLAINTEXT_LOCAL_STORAGE. ENCRYPTED and UNKNOWN both return HELD_ENCRYPTION_MECHANISM_KEY_CUSTODY_AND_DEVICE_PROOF_MISSING. A ciphertext label is not proof of local at-rest encryption or native storage/key lifecycle.

guarded_dispatch evaluates the intent and returns the negative assessment without inspecting, invoking or returning a supplied handler; all routes are closed. Invalid intents also cannot invoke effects. All verdicts intrinsically NONE/local_storage_readyFalse, even a caller-constructed assessment with reason ALLOW. Frozen assessments/intent reject ordinary mutation. Constant production_gate ignores caller data/callbacks/claimed ciphertext/key metadata/HTTPS/cloud encryption/device flags and stays HELD_ENCRYPTED_LOCAL_RUNTIME_AND_KEY_LIFECYCLE_UNPROVEN. No fallback to plaintext on encrypted hold, invalid input or unknown mechanism.

This is a standalone internal gate; no real mobile/filesystem/database/read/write/export/backup/restore/migration handler is wired, executed or authenticated. It cannot establish whole-app absence of plaintext. Actual enforcement integration and exact encryption library/version/native dependency/key custody/creation/loss/rotation/backup/restore/migration/device proof remain MISSING/HELD. No crypto/provider/SQLCipher/OS/keychain mechanism selected. SQLite/Drift working direction alone is not encryption proof. E5 account-light procedure is documentary, no private runtime imported; lack of local storage never implies forced cloud sign-in. Actual renderer/accessibility/device/runtime and broader product gates remain HELD. No user/content/history bytes or keys read, written, logged or deleted by this code.

Ten new+accepted148 full158 E4 tests PASS0.251s; compile PASS. All10 operation categories across3 representations, strict invalid types/unknown values/subclasses/hostile callbacks/extreme integers/finite non-echo reasons, closed effect paths, frozen fields/intrinsic negative assessment, false complete encryption/cloud/key/device flags, unknown production data and encrypted-hold/plaintext-fallback rejection checked. These fixtures prove gate behavior only, not device confidentiality or real storage integration. No current executed unit failure or independent review verdict yet; all prior actual failure/review histories remain unchanged. E3R1 REVIEW/E5-003 IN_PROGRESS/unmergedPR47/57/59/75 unchanged.

## Trace

ADR009R7 -> C4.7 -> F4.7.1 -> FL4.7.1 -> T-E4-015 -> M-E4-001 -> E-DEV-074. Actual encryption mechanism/key/device matrix146 remains HELD; no product activation. Source `modules/e04-offline/internal/no_plaintext.py`; tests `modules/e04-offline/tests/test_no_plaintext.py`; pack `vault/PACKS/P-E4-015.md`; task `vault/REGISTRY/T-E4-015.md`; proof `vault/EVIDENCE/E-DEV-074.md`. FULL independent task review/current CI required before bounded task DONE, no author PASS.
