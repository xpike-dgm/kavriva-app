# TASK REGISTRY (DRAFT — Phase-8 Step 5, pending independent review)

Status: REVIEWED PASS (round 1: independent review PASS, no open findings, 2026-09-22; nothing installed)
Record: `V-REG-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `GRAPH_METADATA_AND_IDENTITY_STANDARD.md` (task-registry section:
`06_DELIVERY_PLANNING/TASK_INDEX.md` frozen planning truth, 7 columns; READY-lifecycle only on the physical
registry with explicit migration/`supersedes` rule; `Evidence` is a Phase-8 field); `TASK_EXECUTION_PROTOCOL.md`
(lifecycle states + CHANGES_REQUESTED loop + different-chat review); `PACK_STANDARD.md` (14 fields);
`COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers). Install address: `kavriva-app/vault/REGISTRY/`
(per-task records) + `vault/INDEX/` (generated JSON only).

## Physical schema (8 columns = 7 planning + 1 Phase-8)

Task ID | Flow/Feature | Objective | Depends On | Context Pack | Acceptance | Evidence | Status.
`Evidence` (new): conformance-shaped record pointers in `vault/EVIDENCE/` (8 fields per Step-3 suite);
empty until the task produces evidence — never backfilled, never fabricated.

## Record form (Obsidian-native; no registry software selected here)

- One Markdown file per task in `vault/REGISTRY/`, filename = stable task slug (e.g. `vault/REGISTRY/T-E3-001.md`);
  YAML frontmatter carries the 8 columns + identity metadata (`status`/`last_verified`, `supersedes`, owner).
- `vault/INDEX/` JSON is GENERATED from records (never hand-edited); readers consume records or index,
  writers touch records only.

## Migration / `supersedes` rule (binding)

- Planning `TASK_INDEX.md` stays frozen: never edited, never copied-then-diverged.
- Each physical row is a NEW record reusing the stable planning Task ID, with frontmatter `supersedes`
  pointing at the planning row; planning rows keep `PROPOSED` (planned, never executed there).
- READY-lifecycle (READY→CLAIMED→IN_PROGRESS→REVIEW→DONE + BLOCKED/CANCELLED/CHANGES_REQUESTED loop)
  applies ONLY here. First status on migration: READY iff Depends-On all DONE, else BLOCKED-by-dependency
  (declared, not hidden).

## Lifecycle ownership (by reference, not redefined)

- Claim/progress/report per `TASK_EXECUTION_PROTOCOL.md`; reviewer must be a different chat (R-007);
  CHANGES_REQUESTED→narrow remediation→different-chat re-review→REVIEW; no silent state skips.
- CANCELLED entry/exit per protocol (records archived, dependents re-planned).

## Non-goals

- No registry software/automation selection (templates + GitHub automation only, DEC-0051); no API actuation;
  no numeric SLAs; no editing of planning truth.

## Acceptance of THIS draft

1. 8th column + record form + migration rule present with planning truth frozen (manual check).
2. Lifecycle states match protocol exactly, no invented state (manual check).
3. No software/vendor/numeric selection (manual check).
4. Reviewer verdict PASS, zero open findings, different context (R-007).
