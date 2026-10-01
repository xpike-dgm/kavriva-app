---
record_id: V-CMD-001
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e10-graph/checks/VALIDATION_COMMANDS.md.snapshot"
metadata_origin_digest: "0da097afcafbd521a8a5ae3c454b57c543bf0a8ca7da8567f38285ac8fc1c3db"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md` (check classes + consequence tiers + run/verify/enforce ownership); `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (detection families + conformance shape fields); `planning 07_AI_ARCHITECTURE/RULES/README.md` (R-001..R-014 + rule→gate mapping, invoked never duplicated); `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md` (lifecycle); `DEC-0051` (free = templates + GitHub automation; no API actuation); `DEC-0052`/`DEC-0056` (different-chat verify, loop-until-PASS). Install addresses: `modules/e10-graph/checks/` (specs) + `vault/EVIDENCE/` (records)."
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "V-E10-STRUCT-001"
  - "P-E10-003a"
implements:
  - "ADR-015 Decision3 record registration"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
  - "T-E10-003a"
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
metadata_verified_at: "2026-10-02"
---

# VALIDATION COMMANDS (INSTALLED — Phase-8 Step 3 REVIEWED PASS + B-07 rows; OUT-3 B-19 header fix 2026-09-23)

Status: INSTALLED (round 1: independent review PASS, no open findings, 2026-09-22; installed to `modules/e10-graph/checks/VALIDATION_COMMANDS.md`)
Record: `V-CMD-001` (first claim in this draft; collisions rejected per identity standard)

Binding sources (single truth, not copied): `planning 07_AI_ARCHITECTURE/VALIDATION_STRATEGY.md` (check classes +
consequence tiers + run/verify/enforce ownership); `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md` (detection families + conformance
shape fields); `planning 07_AI_ARCHITECTURE/RULES/README.md` (R-001..R-014 + rule→gate mapping, invoked never duplicated);
`planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md` (lifecycle); `DEC-0051` (free = templates + GitHub automation; no API actuation);
`DEC-0052`/`DEC-0056` (different-chat verify, loop-until-PASS). Install addresses: `modules/e10-graph/checks/`
(specs) + `vault/EVIDENCE/` (records).

## Command inventory (spec-only; implementation wired in Step 4)

| Command address | Rule(s) | What it detects | Tier |
|---|---|---|---|
| `checks/check-manifests` | R-001 | capsule anatomy field missing in any module manifest (`modules/e01-app/MANIFEST.md` … `modules/e10-graph/MANIFEST.md`) | T1 |
| `checks/check-contracts` | R-011, R-012 | contract field/version/`supersedes` incomplete; surface/classification not propagated | T1 |
| `checks/check-packs` | R-005 | pack 14-field absence; stale pack (older than its task's `last_verified`) | T1 |
| `checks/check-identity` | R-004 | duplicate slug/type (collision → reject); metadata fields absent | T2 |
| `checks/check-orphans` | R-002 | file/record with no owner, no link, no registry row | T2 |
| `checks/check-links` | R-014 | broken reference; open-link label smoothed over (MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED hidden) | T2 |
| `checks/check-edges` | R-003 | cross-module use without declared allowed edge; dependency cycle | T2 |
| `checks/conformance-record` | R-013 | conformance shape incomplete (test ID, contract ID+version, subject digest, result, evidence links, gate verdict, reviewer, timestamp) | T3 |
| `checks/check-trace` | R-014 | registry row without resolvable evidence or owner-manifest; contract without owner module (OUT-3 B-07) | T2 |
| `checks/check-design` | R-011/R-012 | design-token record unversioned; manifest Links without capability/feature/design reference (OUT-3 B-07) | T2 |

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
- `checks/` specs never duplicate the rule→gate mapping (`planning 07_AI_ARCHITECTURE/RULES/README.md` owns it).

## Acceptance of THIS draft

1. Every R-001..R-005, R-011..R-014 auto/semi-auto rule owns ≥1 command row above (manual check; R-006..R-010
   are manual-discipline rules with no command — listed here so the gap is explicit, not hidden).
2. Tiers cover all 10 epics' task classes with no epic unassigned (manual check vs `planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md`).
3. No vendor/number/implementation selection smuggled (manual check vs guardrails above).
4. Reviewer verdict PASS, zero open findings, different context (R-007).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

T-E10-003a custody-only maintenance adds actual specification consumer/task provenance. Original installed body, origin payload, last_verified and product/evidence scope remain unchanged; no detector implementation or historical proof refresh.
