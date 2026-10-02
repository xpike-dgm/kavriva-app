---
record_id: M-E5-001
metadata_version: 1
purpose: "Hesapsız başlangıç, profiller, hibrit yetkilendirme, denetim kasası, kurtarma yolları. E5 authorizes — E1 renders, E3 serves, E5 authorizes (render/authorize split)."
domain: "module-contract"
module: "e05-identity"
owner: "E5"
depends_on: [M-E3-001]
used_by: [M-E1-001, M-E2-001, M-E6-001, I-E10-REGISTRATION-BASELINE, I-E10-PATHS-001, P-E10-006, E-DEV-033, V-E5-LOCAL-001, P-E5-001, E-DEV-047, V-E5-AUTHMETHOD-001, P-E5-007a, E-DEV-048, V-E5-ACTIVATION-001, P-E5-021, E-DEV-049, V-E5-INGEST-001, P-E5-017, E-DEV-050]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E5"
public_contracts:
  - "[[modules/e05-identity/MANIFEST.md#Public contract surface]]"
internal_scope: "Supabase Auth direction, session handling, policy evaluation, audit vault storage, quarantine line, recovery ceremonies. Vault contents never exposed except through investigation chain with authorization."
tasks: [T-E10-001, T-E10-006, T-E5-001, T-E5-007a, T-E5-021, T-E5-017]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e05-identity/MANIFEST.md.snapshot"
metadata_origin_digest: "e24af63e9278e5a670c2957cfc862f060f0e4ac44e8f26c4e288d960f7b38d6d"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
---

# MODULE MANIFEST — e05-identity (E5 Giriş + yetki + denetim)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e05-identity/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E5-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Hesapsız başlangıç, profiller, hibrit yetkilendirme, denetim kasası, kurtarma yolları. E5 authorizes —
E1 renders, E3 serves, E5 authorizes (render/authorize split).

## Public contract surface

- Audit event contract (event scope, minimum meaning, pre-impact link, integrity/alerts, investigation
  chain, management separation — `ADR-005` event/meaning rules).
- Authorization decisions (per-request server-side; separation of duties on publish path).
- `public/consumer_authority.py` exposes the verified consumer principal, current
  PostgreSQL decision and bounded enrollment/session writers to E3's guarded maintenance command.
- Accountless start + profiles + conflict-free migration; phishing-resistant login + second verification;
  epoch closes all edges (downloaded copies honestly unrestorable).
- Recovery alone (cancel + fresh login, dual control/last-admin; recovery never grants approval/publish/
  authorization). Privileged activation gate (11-item evidence pack before critical production work).

## Internal scope

Supabase Auth direction, session handling, policy evaluation, audit vault storage, quarantine line,
recovery ceremonies. Vault contents never exposed except through investigation chain with authorization.

## Allowed / forbidden dependencies

- Allowed: E3 only (serve/verify/edge runtime for identity-plane calls).
- Forbidden: rendering authorization UI as proof (E1 renders, E5 decides); recovery granting powers;
  AI output as authorization (AI output is suggestion, never approval — C5.6); self-authorization paths.

## Tests

- Split tests: render/serve/authorize triple with E1/E3; every sensitive action re-authorized.
- Recovery negatives: recovery grants nothing; dual-control enforced; last-admin rule.
- Audit tests: minimum-meaning events, pre-impact links, tamper-evident chain; quarantine-line tests.

## Change / rollback rules

- Policy/event-schema changes version + dual review (E3 serving impact); activation-gate items change
  only with evidence-pack update.
- Rollback: epoch honored; sessions/keys cancelled edge-wide; no quiet re-grant.

## Links (defined-by-reference, not copied)

- Requirements/design: `C5.1`..`C5.8`, `F5.*`; `ADR-004`, `ADR-005`.
- Architecture: seam rows (E1/E5 split; E5 identity-plane → E3); `R-001`, `R-003`, `R-004`, `R-009`, `R-011`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E5 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.


## Account-light start procedure (T-E5-001)

Procedure `vault/PROFILES/account-light-start.md`; task `vault/REGISTRY/T-E5-001.md`; context `vault/PACKS/P-E5-001.md`; proof `vault/EVIDENCE/E-DEV-047.md`. Review-bounded local-first and optional-profile requirements only; original anatomy/public authority surface/metadata origin/product holds retained. No new runtime contract, account/anonymous signup, local persistence/UI/encryption, profile migration, provider or activation operation.


## Privileged login method specification (T-E5-007a)

Method `vault/PROFILES/privileged-login-method.md`; task `vault/REGISTRY/T-E5-007a.md`; context `vault/PACKS/P-E5-007a.md`; proof `vault/EVIDENCE/E-DEV-048.md`. Required phishing-resistant method class only; no provider/product/numeric/implementation selection or credential/session/production activation. Original anatomy/public surface/metadataorigin/productholds retained.

## Privileged activation skeleton (T-E5-021)

Evaluation-only checklist `vault/PROFILES/privileged-activation-checklist.md`; task `vault/REGISTRY/T-E5-021.md`; context `vault/PACKS/P-E5-021.md`; proof `vault/EVIDENCE/E-DEV-049.md`. Eleven evidence slots UNKNOWN/HELD; no open verdict/production operation. Original anatomy/public authority/metadataorigin and all operational holds preserved; no new runtime seam.

## Internal quarantine processing policy (T-E5-017)

Policy `modules/e05-identity/internal/quarantine_pipeline.py`; regressions `modules/e05-identity/tests/test_quarantine_pipeline.py`; specification `vault/PROFILES/quarantine-processing-policy.md`; task `vault/REGISTRY/T-E5-017.md`; context `vault/PACKS/P-E5-017.md`; proof `vault/EVIDENCE/E-DEV-050.md`. Pure internal state policy, no public product caller/new runtime seam. Future E3 enforcement/producers and E2 rendering separate; trusted producer/persistence/audit/isolation/producttests missing. Original public authority/anatomy/metadataorigin/holds preserved.
