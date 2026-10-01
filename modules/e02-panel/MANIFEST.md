---
record_id: M-E2-001
metadata_version: 1
purpose: "Tarayıcı operasyon çalışma alanı: inceleme, onay, yayın-yürütme yüzeyi, ölçüm görünürlüğü, topluluk moderasyon kararı. E2 renders + records decisions — never self-publishes, never self-authorizes."
domain: "module-contract"
module: "e02-panel"
owner: "E2"
depends_on: [M-E3-001, M-E5-001, M-E8-001]
used_by: [I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E2"
public_contracts:
  - "[[modules/e02-panel/MANIFEST.md#Public contract surface]]"
internal_scope: "Panel layout/navigation, queue filters, draft editor state (WS-04 Kavriva-internal drafts; draft-never-live, never self-publishes). No canonical data; no audit vault; no signing custody."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e02-panel/MANIFEST.md.snapshot"
metadata_origin_digest: "f0f2b7d6b7628f160cc8e1f2fc6e5c7a38284223b92422e88e8445690e8256ab"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
---

# MODULE MANIFEST — e02-panel (E2 Şirket yönetim paneli)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e02-panel/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
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
- Consumed contracts: authorization-tuple (E3, every sensitive action re-authorized at API;
  browser transport profile `[[vault/PROFILES/authorization-tuple-browser.md]]`), audit-event (E5).
  Release/promotion contract is NOT consumed directly: publish/recall operations reach
  E6-governed flows only via E3 serving (E2 deps fixed: E3, E5).
- Invoke-only note (OUT-3 B-17, non-runtime): E2 renders invoke surfaces for E6 flows (WS-07 publish ops
  T-E2-004, WS-11 recall impact T-E2-005, failed-state render T-E2-016); E6 authorizes and executes; the
  invocation travels exclusively through E3 serving. Declared in the seam table invoke stanza; not an edge.

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
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E2 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
