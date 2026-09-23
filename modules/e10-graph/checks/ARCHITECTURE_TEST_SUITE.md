# ARCHITECTURE TEST SUITE (DRAFT — Phase-8 Step 3, pending independent review)

Status: REVIEWED PASS (round 1: independent review PASS, no open findings, 2026-09-22; nothing installed)
Record: `V-TST-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources: `07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (families + detection map + conformance shape);
`planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers); `planning 07_AI_ARCHITECTURE/RULES/README.md` (rule→gate mapping).
Companion: `VALIDATION_COMMANDS.md` (this step; command addresses + tiers). Install address:
`modules/e10-graph/checks/` (suite spec alongside command specs).

## Families: detection (verbatim) → algorithm in words → gate signal

1. Orphans → walk all records/files; flag any node with no owner, no `depends_on`/`used_by`, and no registry
   row → signal FAIL (R-002) with node list.
2. Broken links → resolve every reference (IDs, paths, contract pointers); flag dangling targets and any
   open-link label (MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED) that a record hides → signal FAIL (R-014).
3. Forbidden dependencies → parse cross-module uses from manifests/code; flag any use without a declared
   allowed edge, and any use of a forbidden path → signal FAIL (R-003) with edge list.
4. Cycles → build dependency DAG from declared edges; flag any cycle → signal FAIL (R-003); E1↔E9-shaped
   cycles flagged as critical (seam table).
5. Ownerless public contracts → list every `public/` surface and contract record; flag surfaces with no
   owning capsule or no contract record → signal FAIL (R-011/R-012).
6. Untested critical behavior → list T3-class tasks; flag any without conformance record in `vault/EVIDENCE/`
   carrying all 8 shape fields → signal FAIL (R-013).
7. Stale context packs → compare each pack's `last_verified` against its task's; flag older packs →
   signal WARN-then-FAIL if used by an active task (R-005).
8. Identity collisions → index all slugs by (type, slug); flag duplicates (cross-type included) → signal
   REJECT, never merge (R-004/R-010; rename only via `supersedes` chain).

## Evidence + gating

- Every family writes conformance-shaped records (8 fields per `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md`) to `vault/EVIDENCE/`.
- Gate signals consumed by Step-4 CI (events/fail/merge) and by per-task review (R-006/R-007 manual gates);
  this suite defines signals, never CI wiring (Step 4 owns it).

## Non-goals

- No harness/CI implementation, no runner/vendor, no numeric thresholds (Phase-7 guardrail, repeated here
  so Step-4 scope stays honest). Simulation design excluded (Group-4 boundary).

## Acceptance of THIS draft

1. All 8 Phase-7 families present with detection→algorithm→signal unbroken (manual check vs source).
2. Conformance 8-field shape referenced, not redefined (manual check — no field-name drift).
3. No implementation/vendor/number selection (manual check).
4. Reviewer verdict PASS, zero open findings, different context (R-007).
