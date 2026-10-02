---
record_id: D-APP-DOC-004
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/templates/PACK_TEMPLATE.md.snapshot"
metadata_origin_digest: "78645dc0eb4418a443c71eba3f957a6e1d176a1a980f644516ced44c62ea6efe"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Reusable fourteen-field task context schema with preserved historical reservation"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on: [ADR-015, V-E10-NODE-001, V-E10-REL-001, D-APP-DOC-003, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [I-E10-REGISTRATION-BASELINE, P-E10-007, T-E10-007, E-DEV-034, V-E10-LIFE-001, P-E10-008, E-DEV-035, P-E10-009, E-DEV-036, V-E10-CLOSE-001, P-E10-010, E-DEV-037, V-E10-SIM-001, P-E10-011a, E-DEV-038]
implements:
  - "ADR-015 Decision3 record registration"
  - "ADR-015 Decision5; C10.3; F10.3.1"
public_contracts: []
internal_scope: "Task-pack schema authoring; original reservation/custody history preserved"
tasks: [T-E10-001, T-E10-007, T-E10-008, T-E10-009, T-E10-010, T-E10-011a]
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
  - "modules/e10-graph/checks/check_registration.py"
evidence: [E-DEV-027, E-DEV-034]
supersedes: []
superseded_by: []
status: ACTIVE
last_verified: 2026-10-02
metadata_verified_at: "2026-10-02"
version: 1
---

# Template stub — Task pack

Defined-by-reference: planning `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md` (14 fields + field-validity
rules). Full authoring belongs to the owning step; this stub reserves the address. Demonstrated 1× in Step 7
closure (`vault/PACKS/P-PROOF-001.md` + planning `planning 08_REPOSITORY_BOOTSTRAP/PROOF_DRAFT/PROOF_PACK.md`).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## Current task-pack schema v1 (T-E10-007)

This current authoring section follows the preserved historical reservation and custody body above. Binding schema: [PACK_STANDARD](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md), ADR-015 Decision5, scope addendum section4, C10.3/F10.3.1. The frozen T007 row's “detail HELD Phase7” records the earlier boundary; the pinned Phase7 standard explicitly states detail enrichment/field-validity rules and “T-E10-007 detail now closed.” Use those accepted rules; do not reopen a mechanism choice or fabricate missing authority. Task acceptance remains the fourteen-name enumeration, not full semantic corpus/automated gate or product completion.

### Exactly fourteen task-context fields

The numbers below are the canonical schema fields, independent of record YAML metadata. Fill each with task-specific sufficient content; copy neither this record identity/owner nor old verification dates. No whole-project context load and no empty placeholder treated as acceptance. Template paths are governed addresses, not permission to use module internals or create an authority.

1. objective (single, measurable): One measurable sentence; no “and/or” bundling.
2. outcome-link (user result it serves): Name the user result and its requirement ID.
3. preconditions + completed dependencies: List every Depends On ID and actual DONE receipt; frozen planning PROPOSED/bootstrap documentary DONE cannot prove unfinished product prerequisites.
4. mandatory reads (ADRs, contracts, rules, screens, modules): Resolvable ID list plus versions/source revisions; only minimum sufficient relevant reads, never “whole project.”
5. allowed paths: Explicit module/file scope; nothing implied by a parent folder or provider choice.
6. forbidden areas: Explicit excluded scope; silence means forbidden by default. Use field14 for the escalation action, preserving the canonical fourteen-way split.
7. expected artifact changes: Actual file/artifact list with change verbs, including graph/status/evidence/view impact where applicable.
8. acceptance + negative cases: Scoped acceptance and at least one real failure case per task; “tests green” alone cannot substitute for outcome acceptance.
9. validation / architecture / integration checks to run: Named applicable Group4 checks, actual invocation/evidence and known coverage limits; a named but unexecuted check remains unverified.
10. migration / rollback needs: State needs even if “none,” with reason. Preserve data/history/evidence and define controlled rollback where applicable; no undeclared deployment or destructive step.
11. responsive / accessibility rules: Applicable canonical design/reference/rules, or explicit N/A with reason; no new independent design language.
12. evidence + handoff format: Actual evidence types and a resolvable approved handoff-template ID/version/source pointer. Missing handoff remains MISSING/BLOCKED for the affected handoff; do not invent an ID or equate an implementer report with independent approval. Existing conformance evidence fields are defined by ARCHITECTURE_TESTS, not redefined here.
13. graph-update records the task must write: Exact node IDs that must be created/updated, real source consumers and task traces plus reproducible generated views; address listing alone is not a normative dependency.
14. escalation rules: BLOCKED trigger plus canonical owner-option format reference. Out-of-pack work forces BLOCKED/change-request with meaningful impact/options, never silent scope expansion.

### Record frame and authoring instructions

Create a unique reviewed pack_id, version and real task_ref plus all sixteen individually serialized graph metadata keys under the accepted registration/relation standard. Use Markdown with first-line YAML frontmatter; retain actual task owner/module and stable identities/history. Pack record status/freshness is scoped to its own real task and source changes, not an unrelated newer task. Empty relation lists require their actual scoped reason. This template does not authorize blanket semantic defaults.

The fourteen context fields belong to the pack body; metadata provenance, source/version notes and supporting explanations may accompany them without pretending to be a fifteenth context field. A demonstrated proof pack or older ninety-template stub is historical evidence, not a replacement for the current fourteen-field standard. No new schema serialization, provider/API actuation, threshold or runtime choice here.

### Validation limits and countercases

| Countercase | Required scoped outcome |
|---|---|
| Fourteen arbitrary numbered lines but wrong/empty field names | Not a conforming pack; semantic/name comparison required |
| Duplicate number masks a missing field | Reject incomplete or ambiguous schema |
| Declared mandatory source unresolved/stale | MISSING/UNVERIFIED; no assumed source acceptance |
| Undone product prerequisite represented by bootstrap/documentary DONE | BLOCKED for that actual task dependency |
| Required broader path interpreted as implied scope | BLOCKED/change-request; obtain controlled scope before dependent work |
| Green presence checker treated as full field validity | Reject broader claim; review meaningful content and actual sources |
| Copied pack/template ID, owner or old verification receipt | Reject collision/custody drift; actual task-specific record required |
| An earlier HELD statement hides later accepted Phase7 standard | Preserve both history and current source precedence, no invented missing mechanism |

Installed check_packs checks numbered-field presence and own-task date freshness, not exact names, duplicate detection, valid read IDs/versions, real dependency completion or full semantics. This task enumerates the canonical names and accepted validity guidance, checked manually/independently for this template; it does not claim a new automated validator or complete existing-corpus migration. Existing sources remain authoritative, unresolved handoff/source/semantic closure remains visible.

Sources: `planning 07_AI_ARCHITECTURE/CONTEXT_PACKS/PACK_STANDARD.md`, `planning 07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md`, [owner option format](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/OWNER_STATUS_AND_ESCALATION.md), `planning 07_AI_ARCHITECTURE/ARCHITECTURE_TESTS.md`, `planning 07_AI_ARCHITECTURE/RULES/README.md`; reusable capsule prerequisite: `templates/MANIFEST_TEMPLATE.md`; task: `vault/REGISTRY/T-E10-007.md`; pack: `vault/PACKS/P-E10-007.md`; proof: `vault/EVIDENCE/E-DEV-034.md`.

Existing binding contract identity/source: `vault/CONTRACTS/task-pack.md` v1 (canonical catalog row8); it retains defined-by-reference schema and original scope, not a new runtime seam.
