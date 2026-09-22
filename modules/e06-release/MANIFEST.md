# MODULE MANIFEST — e06-release (E6 Yayın + güvenlik zinciri)

Status: REVIEWED PASS (round 1: CHANGES_REQUESTED 2 findings → narrow remediation; round 2: independent re-review PASS, no open findings, 2026-09-22; install address `modules/e06-release/MANIFEST.md`)
Record: `M-E6-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Onay → yayın → acil fren; sürüm disiplini; imza emaneti politikası; olay müdahalesi. E6 decides and owns
POLICY — E7 executes lanes (policy/execution split).

## Public contract surface

- Release/promotion contract (`ADR-003` R1–R4 + `ADR-007` release rules): sealed package, single gate;
  publish bound to suspension strap; rollback path is a lethal-error route (never routine).
- 8 release authorities separated (roles never merged; visible WAITING if unstaffed).
- Provenance/SBOM/signature + no-rebuild (promote byte-identical to production; pinned dependencies).
- Config/flag/migration releases under version discipline; staged rollout + recall + quarantine;
  incident response + impact graph; OTA channel closed (remote code needs separate future authorization).

## Internal scope

Authority roster, seal/verify tooling, suspension-strap state, incident runbooks, custody policy docs.
Lane execution machinery lives in E7; this capsule holds the rules E7 must obey.

## Allowed / forbidden dependencies

- Allowed: E3 (serve/source), E5 (authorize/audit).
- Governs: E7 lane execution (E7 ← E3, E6 for policy).
- Forbidden: executing lanes itself; merging authority roles; routine rollback of releases; OTA code
  delivery; promoting unsealed or unprovenanced packages.

## Tests

- Authority-separation tests (role-merge negatives; WAITING visibility).
- Seal/promotion tests: byte-identical promotion; no-rebuild verification; SBOM/provenance checks.
- Brake tests: normal path overridden by stop; glass-break drills; recall + quarantine tests.

## Change / rollback rules

- Policy changes (authorities, seal rules, custody) require dual review + evidence-pack note; E7
  execution proves compliance, never redefines policy.
- Rollback of RELEASES is not a routine path (lethal-error route only); recalled systems land in
  quarantine per E3 rules.

## Links (defined-by-reference, not copied)

- Requirements/design: `C6.1`..`C6.8`, `F6.*`; `ADR-003`, `ADR-007`.
- Architecture: seam rows (E6 ← E3,E5; E6 decides, E7 executes); `R-001`, `R-003`, `R-004`, `R-009`, `R-011`, `R-013`, `R-014`.
- Tasks/tests: physical registry rows `supersedes` planning `TASK_INDEX.md` E6 rows (Step 5 builds).
