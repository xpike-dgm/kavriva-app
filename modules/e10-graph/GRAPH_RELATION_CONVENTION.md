---
record_id: V-E10-REL-001
version: 1
purpose: Define the eight canonical metadata relation groups without redefining product authority
domain: project-execution
module: e10-graph
owner: E10
depends_on: [V-E10-NODE-001]
used_by: [P-E10-002, T-E10-002, E-DEV-028, M-E10-001, V-E10-STRUCT-001, P-E10-003a, V-E10-GOV-001, P-E10-003b, E-DEV-030, D-APP-DOC-003, P-E10-004, E-DEV-031, V-E10-DIR-001, P-E10-005, E-DEV-032, V-E10-TOPO-001, P-E10-006, E-DEV-033, D-APP-DOC-004, P-E10-007, E-DEV-034, V-E10-LIFE-001, P-E10-008, E-DEV-035, V-E10-CLOSE-001, P-E10-009, E-DEV-036, V-E10-AUDIT-001, I-E10-CLOSURE-001, P-E10-010, E-DEV-037, V-E10-SIM-001, P-E10-011a, E-DEV-038, V-E10-SIM-002, P-E10-011b, E-DEV-039, V-E10-EXCESS-001, P-E10-012, E-DEV-040, V-E10-DESIGN-001, P-E10-013, E-DEV-041, V-E10-DESIGN-EVID-001, P-E10-014, E-DEV-042]
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: graph-relation-serialization-and-meaning
tasks: [T-E10-002, T-E10-003a, T-E10-003b, T-E10-004, T-E10-005, T-E10-006, T-E10-007, T-E10-008, T-E10-009, T-E10-010, T-E10-011a, T-E10-011b, T-E10-012, T-E10-013, T-E10-014]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-028]
supersedes: []
superseded_by: []
status: ACTIVE
last_verified: 2026-10-02
---

# Graph identity/metadata relation convention v1

Record: `V-E10-REL-001`

## Binding scope

T-E10-002 is the §3 relations-only task: acceptance is the eight-relation verbatim list. Sources are [ADR-015 Decision3](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), [addendum §3](https://github.com/xpike-dgm/motobakim-plan/blob/main/00_CONTROL/PROJECT_SCOPE_ADDENDUM_AI_NATIVE_EXECUTION_SYSTEM.md) and [Phase7 metadata standard](https://github.com/xpike-dgm/motobakim-plan/blob/main/07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md). Registration/identity admission is already governed by `[[modules/e10-graph/GRAPH_NODE_REGISTRATION.md]]`; this convention adds no alternative identity scheme, task lifecycle, runtime authority or cross-module seam.

## Eight relation groups — verbatim §3 list

- `purpose` — neden var;
- `domain/module/owner` — sorumluluk ve sahiplik;
- `depends_on` / `used_by` — yönlü bağımlılıklar;
- `implements` — gereksinim, iş kuralı, ekran/state, ADR veya contract bağlantısı;
- `public_contracts` / `internal_scope` — dışarı açık ve içeride kalan yüzey;
- `tasks` / `tests` / `evidence` — değişiklik ve tamamlanma kanıtı;
- `supersedes` / `superseded_by` — kontrollü değişim zinciri;
- `status` / `last_verified` — güncellik.

These are eight grouped relation labels and sixteen individual frontmatter fields. Slash notation groups fields; it is not a YAML key or permission to omit its members. The list is descriptive as well as relational: purpose/status attributes do not become synthetic runtime dependency edges.

## Field meaning and direction

| Canonical group | Current record declares | Scope that must remain explicit |
|---|---|---|
| purpose | Actual reason the record exists | A filename is an address, not a purpose or identity |
| domain/module/owner | Subject domain, owning capsule and accountable record owner | Documentary custody does not grant authority over the product subject |
| depends_on / used_by | Prerequisites used by this record / actual consumers of this record | Forward A depends_on B corresponds to B used_by A for that declared use; documentary source references, tooling service, runtime use and task prerequisites retain their distinct source scope |
| implements | Requirement, rule, screen/state, ADR or contract to which this record contributes | A declared mapping is traceability, not evidence of requirement completion |
| public_contracts / internal_scope | Declared owned public surface / interior boundary | Consumed contract references do not transfer ownership; referencing an interior grants no cross-boundary access |
| tasks / tests / evidence | Actual authoring/change tasks, actual applicable tests, actual evidence records | A future test is not an executed test; evidence result/head/subject scope must be inspected before acceptance |
| supersedes / superseded_by | Predecessor replaced by this identity / successor replacing this identity | Preserve both identities and history; routine contract version changes use their existing version/supersedes_version fields, not identity replacement |
| status / last_verified | Actual record lifecycle/document state / actual date of verification | Metadata custody verification cannot refresh old product proof; task states remain those in the installed registry |

Relation references name stable identities, qualified canonical source sections or actual governed source/test paths where that field requires a source artifact. Existing typed identity fields retain their immutable stored slug, including contract:<slug>; paths remain addresses, not inferred owners or alternate IDs. No automatic edge may be inferred from a filename, shared date, test process exit code or generated index.

## Serialization and absence

- Markdown with YAML frontmatter is authoritative; generated JSON indexes remain views. Use all sixteen individual keys, matching T-E10-001. Existing schema fields retain their type/shape; this task does not convert historical scalar evidence or task dependency declarations into incompatible new lists.
- Reference collections use the installed supported YAML list forms; legacy single references retain their governed meaning. Quote scalar text with colon-space, avoid backticks inside frontmatter and duplicate keys, and keep dates as YYYY-MM-DD. These are existing serialization constraints, not a replacement parser.
- An explicit empty relation is legitimate only when no relation applies in the stated scope and its reason is recorded. Unknown is an explicit MISSING/UNOWNED/UNVERIFIED finding with the affected source/follow-up boundary, not an empty list or successful admission. These finding labels do not invent task lifecycle states.
- Registration custody added in T-E10-001 remains distinctly scoped: original product relation declarations in preserved bodies are authoritative; empty public_contracts declares no new owned runtime surface, not absence of consumed contracts. Structural test pointers prove metadata/links, not unimplemented product behavior. This convention does not retroactively assert semantic closure for the historical corpus.
- If a declared use changes, review its forward and consumer references together. Identity replacement uses reviewed lineage; ordinary relation edits preserve identity and their evidence history. No router or index may invent missing reverse references or act on records merely because all fields are present.

## Countercases and subsequent quality work

| Countercase | Required treatment |
|---|---|
| A references B, but declares B depends_on A without such a prerequisite | Preserve the directional conflict; do not silently reverse or invent runtime use |
| A source link is interpreted as authorization to call a private internal | Reject boundary violation; public ownership and classification remain governed by module/contract sources |
| tests points to a planned/nonexistent test or unrelated successful CI | Keep missing/untested scope explicit; no acceptance from the pointer alone |
| old evidence is cited after its subject bytes change | Retain the exact originally reviewed payload or new independently reviewed evidence; never rehash old approval |
| a version bump is presented as identity replacement, or history is deleted | Preserve the stable ID/version rule and reject unsupported lineage |
| empty list or fresh metadata date hides unknown product ownership/proof | Retain the UNOWNED/UNVERIFIED finding; custody does not close it |

T-E10-003a separately specifies the four structural detectors; T-E10-003b separately specifies ownerless/untested/stale governance detectors. This task records the relation convention, not their implementation or a complete corpus semantic audit. No detector success, product readiness or automatic execution is claimed.

## Change and verification

Convention v1 is sourced from the unchanged canonical eight groups and the accepted registration rule. Full-registry impact: existing identities and historical payloads remain; no bulk relation reclassification or runtime dependency change. New task/rule/pack/evidence references are declared explicitly. A later convention/schema change requires its version, scoped impact, preserved history, source comparison, independent review and applicable exact-head CI; rollback cannot rewrite past decisions.

The existing registration/link/identity checks validate new artifact serialization and target existence. The exact eight-group text and source meanings require actual source comparison and independent review in `[[vault/EVIDENCE/E-DEV-028.md]]`; unrelated runtime tests do not prove this convention. No public runtime contract is introduced; there is no new executable behavior needing a mirrored unit test. Task: `[[vault/REGISTRY/T-E10-002.md]]`; pack: `[[vault/PACKS/P-E10-002.md]]`.

Independent acceptance2026-10-02: /root/pr30_independent_review, gpt-6-luna max, returned PASS at a31ad8e3a218b2956bdd13653c10c02364fce606, including exact eight-group source comparison, current consumer/provenance closure, preserved T001 proof and green exact-headCI. Convention ACTIVE; T002 accepted under direct standing owner mandate. Final status/evidence/index-only audit and exact-headCI must pass before merge and are recorded in PR30. Semantic detectors and production closure remain separately unproved.

T-E10-003a documentary maintenance: added actual structural-specification and mandatory-pack consumers (V-E10-STRUCT-001 and P-E10-003a), with maintenance-task provenance only. EDEV028 retains the exact PR30-approved payload/digest; old acceptance is not approval of this consumer addition. Canonical relation meanings/version remain unchanged.

T-E10-003b custody-only maintenance adds actual V-E10-GOV-001 and P-E10-003b documentary consumers plus maintenance-task provenance. Original source meaning/version/acceptance remains; approved subject payloads/digests are preserved and do not approve these new metadata changes. No implementation/product freshness claim.

E-DEV-030 is also an actual documentary source-reference consumer for this task; used_by records that evidence-source use, not runtime consumption.

T-E10-004 documentary maintenance adds actual D-APP-DOC-003/P-E10-004/E-DEV-031 template/mandatory-pack/evidence consumers and T004 maintenance-task trace. Meaning/version unchanged; original accepted primary subjects/verdicts/digests remain preserved at their existing evidence snapshots, not refreshed by this new metadata.

T-E10-005 documentary maintenance adds actual V-E10-DIR-001/P-E10-005/E-DEV-032 policy/mandatory-pack/evidence consumers and T005 task trace. Meaning/version/original proof unchanged; prior approved primary subjects and verdicts/digests retained at exact archives. No broadened runtime permission or historical freshness claim.
