---
record_id: V-RT-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e10-graph/ROUTING_AND_TRACEABILITY.md.snapshot"
metadata_origin_digest: "263c1e2a0d15614028d269eaaeed5ccfdde9d086dca4b18953ed9bac7de4a4ab"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources: `planning 07_AI_ARCHITECTURE/CONTEXT_ROUTING.md` (selection rule, inputs/output, manual-carry binding); `planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers enumerated + bidirectional chain); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`; `DEC-0041` (parallel eligibility preserved); `DEC-0051` (manual-carry default). Companion: `TASK_REGISTRY.md` (this step). Install address: `modules/e10-graph/` (router rules) + `vault/` (trace graph); no router software selected here."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
supersedes: []
superseded_by: []
status: "INSTALLED"
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# ROUTING AND TRACEABILITY (INSTALLED — Phase-8 Step 5 REVIEWED PASS; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (round 1: independent review PASS, no open findings, 2026-09-22; installed to `modules/e10-graph/ROUTING_AND_TRACEABILITY.md`)
Record: `V-RT-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources: `planning 07_AI_ARCHITECTURE/CONTEXT_ROUTING.md` (selection rule, inputs/output, manual-carry binding);
`planning 07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md` (10 layers enumerated + bidirectional chain);
`planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`; `DEC-0041` (parallel eligibility preserved); `DEC-0051` (manual-carry default).
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

1. Selection rule + inputs/output match `planning 07_AI_ARCHITECTURE/CONTEXT_ROUTING.md` exactly (manual check — no invented criterion).
2. Chain order + bidirectionality + open-link visibility match closure matrix (manual check).
3. Manual-carry default + HELD actuation stated (manual check vs DEC-0051).
4. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
