---
record_id: M-E9-001
metadata_version: 1
purpose: "Asistan akışı + açıklama soruları + karar katmanı + deterministik son doğrulama. E9 PROPOSES — E9 proposes, E1 renders, E3 verifies (no E1↔E9 cycle, ever)."
domain: "module-contract"
module: "e09-ai"
owner: "E9"
depends_on: [M-E3-001, M-E1-001]
used_by: [I-E10-REGISTRATION-BASELINE, I-E10-PATHS-001, P-E10-006, E-DEV-033, V-E9-PROPOSAL-001, P-E9-001, E-DEV-077, V-E9-VERIFY-001, P-E9-002, E-DEV-079, V-E9-ECONOMY-001, P-E9-003, E-DEV-078, V-E9-ADAPTER-001, P-E9-004, E-DEV-080, V-E9-CHANGE-001, P-E9-005, E-DEV-081, V-E9-ALLOWED-001, P-E9-008, E-DEV-082]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E9"
public_contracts:
  - "[[modules/e09-ai/MANIFEST.md#Public contract surface]]"
internal_scope: "Model adapters (provider detail in adapter; version/change observed, re-evaluated), prompt inventory, least-privilege tool bindings (tool authority outside model output; AI-free safe continuation path), decision-layer logic up to — but never including — final authority."
tasks: [T-E10-001, T-E10-006, T-E9-001, T-E9-002, T-E9-003, T-E9-004, T-E9-005, T-E9-008]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e09-ai/MANIFEST.md.snapshot"
metadata_origin_digest: "27898736ca2f3be329f5a1bfa503e650931c948b6f52717e0bfc70be2239db7e"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
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

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## T-E9-001 internal bounded proposal rule

`modules/e09-ai/internal/proposal_options.py` provides five ADR014 Decision1 route categories and immutable, nonauthoritative proposals. Unknown/malformed/untrusted/coerced inputs hold using the existing safety-hold category; plain target reference is opaque and unverified. Every proposal authority NONE/physical_progression false/verification HELD, production gate constantly HELD without effects. No E3/E1 import/public runtime seam/provider/request/prompt or tool schema. E3 six-dimension verification/E1 rendering remain separate, actual current authority/source/runtime HELD. Nine meaningful tests at `modules/e09-ai/tests/test_proposal_options.py`, local9PASS0.002s/compile; new pinned read-only `.github/workflows/e9-tests.yml` discovery. Pack `vault/PACKS/P-E9-001.md`/profile `vault/PROFILES/five-option-proposals.md`/proof `vault/EVIDENCE/E-DEV-077.md`. Fresh reconciled FULL review/current CI required before acceptance; oldsource PASS recorded in E-DEV-077, no author DONE. Original anatomy/metadata custody preserved.

## T-E9-002 documentary six-dimension checklist

`vault/PROFILES/six-dimension-checklist.md` records allsix exactADR014R1dimensions with required owningE3 evaluations/missing-negative consequences/cross-context consistency, E9proposes/E3verifies/E1renders. No actual verifier, producer/issuer/schema/privateimport/runtime/publiccontract or code/unit change. Actual source/fit/approval/prerequisites/readiness/provenance/runtimeE1/physicalproofHELD. Pack `vault/PACKS/P-E9-002.md`; proof `vault/EVIDENCE/E-DEV-079.md`. Fresh FULL/currentCI pending, no authorDONE. Original anatomy/metadata custody preserved.

## T-E9-003 static economy skeleton

`vault/PROFILES/economy-skeleton.md` records approved ADR014 Decision2 cheapest/fastest adequate first, reliable deterministic rules precedence, stronger reasoning only when actual permitted task need proven. Adequacy/need/cost evidence missing holds actual selection; economic pressure never weakens canonical safety/current source/fit/authority. No provider/model/version/threshold/log/budget/runtime/integration chosen or code/workflow changes. E9 proposes/E3 verifies/E1 renders preserved; no public seam/private import. Context `vault/PACKS/P-E9-003.md`; proof `vault/EVIDENCE/E-DEV-078.md`; profile/task REVIEW/packIN_PROGRESS/fresh reconciled FULL/currentCI required; oldFULL/metadatafindings/PASSes historical. No original anatomy/metadata custody rewrite, no authorDONE.

## T-E9-004 static provider adapter boundary

`vault/PROFILES/provider-adapter-boundary.md` maps all seven ADR014R3 provider behaviors behind adapters, keeps producttaxonomy/allowedroutes/safety/eligibility/authorization Kavriva-owned, observable identity/behavior changes require re-evaluation. No actual adapter/provider/config/schema/code/test/workflow/runtime/new public seam or privateimport. Pack `vault/PACKS/P-E9-004.md`; proof `vault/EVIDENCE/E-DEV-080.md`; fresh FULL/currentCI required, no authorDONE. Actual provider/runtime/product readiness HELD.

## T-E9-005 static re-evaluation trigger

`vault/PROFILES/reevaluation-trigger.md`: observable provider/model/version identity OR behavior change requires review, includingbehaviorchangeunderstableversion; missing/ambiguousproofholds and no shape/confidence/cheapbypass. Accepted adapter boundary retained/no code/test/workflow/runtime/privateimport/newpublicseam/evaldesign/providerchoice. Context `vault/PACKS/P-E9-005.md`; proof `vault/EVIDENCE/E-DEV-081.md`; FULL/currentCI beforeacceptance, actualprovider observation/evaluation/runtime/physicalproof HELD.

## T-E9-008 approved ten assistance reference

`vault/PROFILES/allowed-ai-help.md` cites exactten ADR014Decision5 clauses with approved-content/already-eligible/boundedallowedset qualifiers/negativecases, not newauthority/runtime/toolselection. E9proposes/E3verifies/E1renders/neverlist maintained. Context `vault/PACKS/P-E9-008.md`; proof `vault/EVIDENCE/E-DEV-082.md`; fresh FULL/currentCI required, noauthorDONE. T006actualtool/costproof absent/T007dependencyunmet unchanged; actualassistance/runtime/physicalproofHELD.
