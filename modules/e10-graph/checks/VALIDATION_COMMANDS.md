# VALIDATION COMMANDS (DRAFT — Phase-8 Step 3, pending independent review)

Status: REVIEWED PASS (round 1: independent review PASS, no open findings, 2026-09-22; nothing installed)
Record: `V-CMD-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md` (check classes +
consequence tiers + run/verify/enforce ownership); `ARCHITECTURE_TESTS.md` (detection families + conformance
shape fields); `RULES/README.md` (R-001..R-014 + rule→gate mapping, invoked never duplicated);
`TASK_EXECUTION_PROTOCOL.md` (lifecycle); `DEC-0051` (free = templates + GitHub automation; no API actuation);
`DEC-0052`/`DEC-0056` (different-chat verify, loop-until-PASS). Install addresses: `modules/e10-graph/checks/`
(specs) + `vault/EVIDENCE/` (records).

## Command inventory (spec-only; implementation wired in Step 4)

| Command address | Rule(s) | What it detects | Tier |
|---|---|---|---|
| `checks/check-manifests` | R-001 | capsule anatomy field missing in any `MANIFEST.md` | T1 |
| `checks/check-contracts` | R-011, R-012 | contract field/version/`supersedes` incomplete; surface/classification not propagated | T1 |
| `checks/check-packs` | R-005 | pack 14-field absence; stale pack (older than its task's `last_verified`) | T1 |
| `checks/check-identity` | R-004 | duplicate slug/type (collision → reject); metadata fields absent | T2 |
| `checks/check-orphans` | R-002 | file/record with no owner, no link, no registry row | T2 |
| `checks/check-links` | R-014 | broken reference; open-link label smoothed over (MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED hidden) | T2 |
| `checks/check-edges` | R-003 | cross-module use without declared allowed edge; dependency cycle | T2 |
| `checks/conformance-record` | R-013 | conformance shape incomplete (test ID, contract ID+version, subject digest, result, evidence links, gate verdict, reviewer, timestamp) | T3 |

## Consequence tiers → task classes (from VALIDATION_STRATEGY.md, by reference)

- T1 render-only tasks (E1/E2 presentation, docs): manifest/contract/pack checks.
- T2 state/branch tasks (E3/E4/E5/E8 behavior, E9 flow, E10 tooling): T1 + identity/orphan/link/edge checks.
- T3 privileged/release/migration tasks (E5 powers, E6 promotion, E3 epochs/migrations, E7 lanes):
  T1+T2 + conformance records + security-scan placeholder + mandatory independent review.
- Ownership per check: implementer runs, different-chat reviewer verifies, gate enforces (R-007).

## Non-goals (binding guardrails, not modesty)

- No linter/runner/vendor/language selection; no coverage-%/timeout/threshold numbers (Phase-7 guardrail).
- No check implementation in this step (algorithms live in `ARCHITECTURE_TEST_SUITE.md`, in words);
  Step 4 wires specs to CI events; implementation language stays HELD for Step 4.
- `checks/` specs never duplicate the rule→gate mapping (`RULES/README.md` owns it).

## Acceptance of THIS draft

1. Every R-001..R-005, R-011..R-014 auto/semi-auto rule owns ≥1 command row above (manual check; R-006..R-010
   are manual-discipline rules with no command — listed here so the gap is explicit, not hidden).
2. Tiers cover all 10 epics' task classes with no epic unassigned (manual check vs `EPIC_CATALOG.md`).
3. No vendor/number/implementation selection smuggled (manual check vs guardrails above).
4. Reviewer verdict PASS, zero open findings, different context (R-007).
