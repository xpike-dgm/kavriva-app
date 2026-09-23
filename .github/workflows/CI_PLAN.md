# CI PLAN (DRAFT — Phase-8 Step 4, pending independent review)

Status: REVIEWED PASS (round 1: CHANGES_REQUESTED 2 findings → narrow remediation; round 2: independent re-review PASS, no open findings, 2026-09-22; nothing installed)
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
2. Human review: different-chat reviewer (R-007); T3 additionally requires mandatory independent review
   with agreement≠approval recorded (DEC-0052/0056; no reviewer authority beyond these sources is claimed).
3. Scope check: change touches only its task's declared surface (manifest-declared seams; new seam use
   without declaration + review = violation, rejected at gate).
4. Evidence: T2/T3 merges attach conformance-shaped records (`vault/EVIDENCE/`); missing evidence = block.
5. No self-merge on `t3-privileged`; no direct pushes to `main` (all change via pull request).

## Ownership

- Automation runs checks; implementer remediates; different-chat reviewer verifies; gate enforces.
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
