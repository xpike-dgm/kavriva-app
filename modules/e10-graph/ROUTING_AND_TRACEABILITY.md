# ROUTING AND TRACEABILITY (DRAFT — Phase-8 Step 5, pending independent review)

Status: REVIEWED PASS (round 1: independent review PASS, no open findings, 2026-09-22; nothing installed)
Record: `V-RT-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources: `CONTEXT_ROUTING.md` (selection rule, inputs/output, manual-carry binding);
`COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers enumerated + bidirectional chain);
`TASK_EXECUTION_PROTOCOL.md`; `DEC-0041` (parallel eligibility preserved); `DEC-0051` (manual-carry default).
Companion: `TASK_REGISTRY.md` (this step). Install address: `modules/e10-graph/` (router rules) +
`vault/` (trace graph); no router software selected here.

## Routing (rules, not software)

- Inputs: physical registry states (`vault/REGISTRY/`), dependency DAG, BLOCKED list.
- Eligible task = Depends-On all DONE + not BLOCKED. Order = topological depth, then Task-ID.
  Parallel eligibility preserved; "first READY" never implies automation priority.
- Output: selected task ID + pack pointer (`vault/PACKS/`). Contents are executed from the pack,
  not by the router. Default handoff is owner copy-paste (manual carry); no auto-submit, no API-opened
  chats (HELD).

## Traceability (bidirectional chain, by reference)

- Chain (verbatim layer order): task, feature, flow, requirement, design, architecture, data/migration,
  release, product-scenario, gap-audit — traced both directions down to Requirement/Rule/Screen/State →
  Epic → Capability → Feature → Flow → Task → Contract/Module → Test/Evidence and back.
- Every physical registry row + evidence record carries the links that realize its segment of the chain;
  orphan tasks and taskless requirements are rejected (closure matrix by reference).
- Open links stay visible as MISSING / UNOWNED / BLOCKED / CONFLICT / UNVERIFIED — checked by
  `check-links` (Step-3 suite); smoothing them is a FAIL.

## Non-goals

- No router software/API/key/account/purchase/code; no trace-tool selection; no numeric targets.

## Acceptance of THIS draft

1. Selection rule + inputs/output match `CONTEXT_ROUTING.md` exactly (manual check — no invented criterion).
2. Chain order + bidirectionality + open-link visibility match closure matrix (manual check).
3. Manual-carry default + HELD actuation stated (manual check vs DEC-0051).
4. Reviewer verdict PASS, zero open findings, different context (R-007).
