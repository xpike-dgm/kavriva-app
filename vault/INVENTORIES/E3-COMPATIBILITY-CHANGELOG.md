---
inventory_id: E3-COMPATIBILITY-CHANGELOG
owner: E3
status: RECORDED
last_verified: 2026-10-01
---

# E3 compatibility changelog

Procedure: `[[vault/PROFILES/compatibility-hold.md]]`. Entries below are dated documentary observations, not provider upgrades or operational closure. No hosted inventory was queried. Each affected activation/change remains HELD until its own actual-target proof and gates close. Entry labels are local journal labels, not new delivery tasks.

## Declared baseline observed on 2026-10-01

| Input | Repository evidence | Scope limit |
|---|---|---|
| Supabase CLI 2.117.0 | `.github/workflows/e3-live-auth.yml` | Pinned local CI command; no assertion about installed hosted service versions or the latest CLI. |
| PostgreSQL major 17 | `supabase/config.toml` | Declared local configuration; exact local/hosted minor build/extensions remain UNVERIFIED here. |
| Pinned PostgreSQL test packages | `modules/e03-server/tests/requirements.txt`, `modules/e05-identity/tests/requirements.txt` | Dependency declarations, not measured deployed runtime: fasteners 0.20, pgembed 0.2.0, platformdirs 4.11.12, psutil 7.2.2, psycopg/psycopg-binary 3.3.6, tzdata 2026.4. |
| CI local service exclusions | `.github/workflows/e3-live-auth.yml` | Realtime, mailpit, postgres-meta, Studio, Edge Runtime, logflare, vector and supavisor excluded. Local Auth/ordinary Storage proof is not those services' compatibility or hosted S3/vector/analytics proof. |
| Current application boundary | `[[vault/PROFILES/api-enforcement-needs.md]]`, `[[vault/PROFILES/rls-storage-defense.md]]` | Current API/E5 decisions remain product authority; physical activation HELD and T-E3-001-R1 REVIEW. |

## Dated entries

### Storage schema ownership — observed 2026-10-01

- Publisher date: not stated by the current documentation. Source: [official Storage schema guidance](https://supabase.com/docs/guides/storage/schema/design); checked 2026-10-01.
- Change/surface: provider-owned Storage metadata must not be casually altered. Product migration/policy assumptions need actual provider compatibility evidence.
- Internal evidence: PR #22 initial local startup at adb3dc40 failed before HTTP probes; detailed SQL error was not captured. Corrected head 1705fcdf verified provider-enabled RLS and created restrictive policies without ALTER of provider tables. `[[vault/EVIDENCE/E-DEV-020.md]]` records green local CI and independently accepted narrow defense scope. This is a scope-limited workaround proof, not a claim about the unseen initial SQL error.
- Impact/hold: E3 migration/Storage client defenses; production role/table ownership, RLS/defaults and all alternate paths still require actual-target inventory. Resolver: E3 technical implementer with provider support if needed. Hosted compatibility/activation: HELD.
- Required next proof: exact provider table owner/RLS and allowed policy operation, migration failure/recovery, ordinary and privileged path inventory plus same client negatives at intended target; exact independent verdict/owner/E6 gate references before transition. No new deployment authorized.

### PostgreSQL minor-release advisory — published 2026-09-25; observed 2026-10-01

- Source: [official PostgreSQL 15.19/17.11 notice](https://supabase.com/changelog/postgres-15-19-17-11-breaking-changes); checked 2026-10-01 via [changelog index](https://supabase.com/changelog.md).
- Summary: the notice identifies ltree/index, legacy-cipher pgcrypto, btree_gist/NaN and custom-operator compatibility concerns. It supplies detection guidance; the journal executes none of those queries.
- Declared vs measured: local config declares major 17 only. Neither actual local/hosted minor build nor affected extensions/data/indexes/operators were measured here. The current defense migration's lack of those constructs does not prove the whole project unaffected.
- Impact/hold: E3 DB/migration/restore/exit and their consumers. Resolver: E3 database/recovery implementer; hosted version/extension compatibility: HELD.
- Required next proof: authorized actual-target version/extension/index/data inventory, advisory applicability and safe corrective/recovery plan, same guarded authority/floor/audit/restore negatives, exact candidate and independent review. No version upgrade or repair operation authorized.

### API-key family transition — observed 2026-10-01

- Publisher date: current guide gives no page date. Source: [official API-key guidance](https://supabase.com/docs/guides/getting-started/api-keys); checked 2026-10-01.
- Summary: modern publishable/secret keys and legacy anon/service-role keys have different formats and lifecycle. New-key creation does not retire legacy access. This observation is not a key migration or retirement decision.
- Current inputs: maintenance code names a publishable Auth key and bounded database DSN; local CI fixtures read legacy-key fields from a temporary CLI status file. `[[vault/PROFILES/secret-custody-rotation.md]]` preserves the required distinction and no-secret evidence boundary.
- Impact/hold: E3 Auth transport/CI/admin consumers and E5 session verification through its public seam. Resolver: E3 compatibility/custody implementer with E5 owner review. Actual environment key-family/consumer inventory and retirement compatibility: HELD.
- Required next proof: reference-only current consumer/key-family inventory, verification of pinned local tool output and intended target behavior, valid-user/denied-user/direct-path tests, staged replacement and old-access denial, current grants/sessions plus provider signing/cache proof where affected. No key retrieval/change/revocation authorized.

## Follow-up and closure

Append a dated follow-up per procedure with source entry, measured target, exact candidate/evidence, independent verdict and applicable owner/E6 acceptance. Do not rewrite these limited observations as operational PASS. All operational entries are presently HELD; the only task acceptance sought is this journal plus the procedure document. Evidence: `[[vault/EVIDENCE/E-DEV-022.md]]`.
