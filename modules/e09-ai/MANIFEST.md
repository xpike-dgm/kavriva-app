---
record_id: M-E9-001
metadata_version: 1
purpose: "Asistan akışı + açıklama soruları + karar katmanı + deterministik son doğrulama. E9 PROPOSES — E9 proposes, E1 renders, E3 verifies (no E1↔E9 cycle, ever)."
domain: "module-contract"
module: "e09-ai"
owner: "E9"
depends_on: [M-E3-001, M-E1-001]
used_by: [I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E9"
public_contracts:
  - "[[modules/e09-ai/MANIFEST.md#Public contract surface]]"
internal_scope: "Model adapters (provider detail in adapter; version/change observed, re-evaluated), prompt inventory, least-privilege tool bindings (tool authority outside model output; AI-free safe continuation path), decision-layer logic up to — but never including — final authority."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
---

# MODULE MANIFEST — e09-ai (E9 AI Usta + karar katmanı)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e09-ai/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E9-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Asistan akışı + açıklama soruları + karar katmanı + deterministik son doğrulama. E9 PROPOSES —
E9 proposes, E1 renders, E3 verifies (no E1↔E9 cycle, ever).

## Public contract surface

- Assistant flow: understand → ask → propose candidates from 5 options → verify in 6 dimensions →
  show/ask/hold. Economist principle: cheapest-sufficient fast model first, escalate on need;
  deterministic wins on rule-based work.
- Permitted AI helps (10 items, verbatim list by reference): understanding/questions/normalization/
  query/summary/ranking/draft/triage/project-research/bounded-suggestion.
- NEVER-single-authority list (15 qualified items by reference): unsupported value, canonical reality,
  definitive diagnosis, approval/publish/recall, signature, billing, and the rest — never AI's.
- Project-AI discipline: performer/reviewer split, evidence, no-mimicry (`DEC-0028`/`DEC-0029`).

## Internal scope

Model adapters (provider detail in adapter; version/change observed, re-evaluated), prompt inventory,
least-privilege tool bindings (tool authority outside model output; AI-free safe continuation path),
decision-layer logic up to — but never including — final authority.

## Allowed / forbidden dependencies

- Allowed: E3 (verify/serve), E1 (render target for proposals — propose-flow only).
- Forbidden: E1↔E9 cycle; direct user-facing execution of AI decisions; any never-list item;
  content-as-policy; provider lock-in without re-evaluation trigger.

## Tests

- Flow tests: 5-option candidacy + 6-dimension verification before any show/ask/hold.
- Never-list negatives: each of the 15 items rejected when attempted by AI path.
- Adapter tests: provider swap re-evaluates; deterministic-beats-model on rule-based work.

## Change / rollback rules

- Flow/never-list changes: dual review (performer/reviewer split); list only grows by review, never
  shrinks silently.
- Rollback: disable AI path, AI-free safe continuation carries users (C9.4 by reference).

## Links (defined-by-reference, not copied)

- Requirements/design: `C9.1`..`C9.7`, `F9.*`; `DEC-0028`, `DEC-0029`.
- Architecture: seam rows (E9 proposes / E1 renders / E3 verifies); `R-001`, `R-003`, `R-004`, `R-007`, `R-009`, `R-013`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E9 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.
