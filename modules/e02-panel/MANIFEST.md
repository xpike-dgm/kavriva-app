# MODULE MANIFEST — e02-panel (E2 Şirket yönetim paneli)

Status: REVIEWED PASS (round 1: CHANGES_REQUESTED 2 findings → narrow remediation; round 2: independent re-review PASS, no open findings, 2026-09-22; install address `modules/e02-panel/MANIFEST.md`)
Record: `M-E2-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Tarayıcı operasyon çalışma alanı: inceleme, onay, yayın-yürütme yüzeyi, ölçüm görünürlüğü, topluluk
moderasyon kararı. E2 renders + records decisions — never self-publishes, never self-authorizes.

## Public contract surface

- Review/approve queues WS-06 + WS-05 (open/conflict); decision records with reason + audit trail.
- Publish/recall operation UI-surface WS-07/WS-11 (operator clicks here; execution happens exclusively
  through E3 serving under E6 policy — NO direct E2←E6 edge exists or is claimed; the seam table has no such
  row and undeclared seam use is a violation).
- Read-only visibilities: WS-01/WS-09 (consumes E8 outputs; selects no direction), WS-08 lineage,
  WS-10 audit-trail visibility (vault stays in E5), WS-12 access-management surfaces.
- Consumed contracts: authorization-tuple (E3, every sensitive action re-authorized at API),
  audit-event (E5). Release/promotion contract is NOT consumed directly: publish/recall operations reach
  E6-governed flows only via E3 serving (E2 deps fixed: E3, E5).

## Internal scope

Panel layout/navigation, queue filters, draft editor state (WS-04 Kavriva-internal drafts; draft-never-live,
never self-publishes). No canonical data; no audit vault; no signing custody.

## Allowed / forbidden dependencies

- Allowed (consume only): E3 (serve/verify), E5 (authorize/audit), E8 outputs (derived planes only).
- E5 → E2 authorization decisions (E2 renders decisions, E5 authorizes; change-request 2026-09-23: makes the
  existing E5-authorizes relation machine-readable; no new edge claimed, no direct E2←E6 edge).
- Forbidden: direct writes to canonical stores bypassing API; self-approval paths (independence enforced
  in UI); consumer-flow logic (SCR) duplicated here; E6 policy ownership; E7 lane execution.

## Tests

- Independence tests: approver ≠ author enforced; self-authorization path negatives.
- Draft-never-live tests; quarantine activation only via API authorization.
- Decision records carry reason + audit link (R-013 evidence links).

## Change / rollback rules

- Queue/visibility changes: standard review; decision-schema changes re-run independence tests.
- Rollback: UI state rollback only; recorded decisions are never silently edited (supersede chain, R-010).

## Links (defined-by-reference, not copied)

- Requirements/design: `C2.1`..`C2.11`, `F2.*`, flows `WS-01`..`WS-12`, `SCR-036` (moderation back-decision).
- Architecture: seam row (E2 consumes E8 outputs); `R-001`, `R-003`, `R-004`, `R-009`, `R-011`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `TASK_INDEX.md` E2 rows (Step 5 builds).
