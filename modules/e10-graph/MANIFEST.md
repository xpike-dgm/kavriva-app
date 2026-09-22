# MODULE MANIFEST — e10-graph (E10 Proje grafiği + görev altyapısı)

Status: REVIEWED PASS (round 1: CHANGES_REQUESTED 2 findings → narrow remediation; round 2: independent re-review PASS, no open findings, 2026-09-22; install address `modules/e10-graph/MANIFEST.md`)
Record: `M-E10-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Görev zarfları, graf/şema, kalite kapıları, kapanış takibi çalışır. E10 BUILDS the machine that runs the
work — registry software, router, checks, closure tooling. Foundation-adjacent (no epic runtime inbound).

## Public contract surface

- Task-pack contract (`PACK_STANDARD.md` 14 fields + F10.3.1): minimum pack + registry states
  (READY→…→DONE + BLOCKED/CANCELLED/CHANGES_REQUESTED loop); manual-carry compatible, auto-execution HELD.
- Design-token contract (`DESIGN_CONSISTENCY_AND_CHANGE.md` + V10/REF-VISUAL-001; tokens finalized per
  design gate — this capsule enforces the gate, never finalizes tokens).
- Graph schema + identity standard enforcement (F10.1.1); capsule topology + dependency rules + repo
  topology (F10.2.1); closure matrix across 10 layers with bidirectional trace (F10.4.1); simulation set
  + excess-work scan (F10.5.1); review protocol + adversarial + dependency declaration (F10.7.1).

## Internal scope

Registry software, context router, check implementations (R-002/R-003 auto when built in Step 4),
generated JSON index builders, simulation runners. Planning truth (`TASK_INDEX.md` frozen) is read as
migration source only — never edited from here.

## Allowed / forbidden dependencies

- Allowed: serves all epics' registry/pack/check needs; reads planning truth for migration (one-way).
- Forbidden: editing planning truth; auto-executing tasks (HELD — manual carry default, R-008);
  smoothing open links (MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED stay visible, R-014).

## Tests

- Pack-schema tests: 14 fields present (R-005); lifecycle transitions legal, no silent skips (R-006).
- Check tests: orphan/edge/identity/metadata/contract-field checks with evidence links (R-002..R-005, R-011).
- Closure tests: 10-layer evidence, orphan-task/taskless-requirement rejection (R-014).

## Change / rollback rules

- Schema/check changes version + full-registry impact note; design-gate rules change only with Group-5
  change-control (re-validation reason required).
- Rollback: tooling rollback never rewrites history (supersede chains intact, R-010).

## Links (defined-by-reference, not copied)

- Requirements/design: `C10.1`..`C10.7`, `F10.*`; `DEC-0028`, `DEC-0041`, `DEC-0051`, `DEC-0052`.
- Architecture: `PACK_STANDARD.md`, `CONTEXT_ROUTING.md`, `TASK_EXECUTION_PROTOCOL.md`,
  `COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md`, `RULES/README.md`; `R-001`..`R-014` as applicable.
- Tasks/tests: physical registry rows `supersedes` planning `TASK_INDEX.md` E10 rows (Step 5 builds).
