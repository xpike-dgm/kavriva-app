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
- Tasks/tests: physical registry rows `supersedes` planning `TASK_INDEX.md` E5 rows (Step 5 builds).
