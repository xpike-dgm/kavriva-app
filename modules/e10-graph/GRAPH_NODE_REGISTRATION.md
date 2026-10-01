---
record_id: V-E10-NODE-001
version: 1
purpose: Define mandatory registration of every project graph record
domain: project-execution
module: e10-graph
owner: E10
depends_on: []
used_by: [P-E10-001, T-E10-001, E-DEV-027, I-E10-REGISTRATION-BASELINE, M-E10-001]
implements: [ADR-015, C10.1, F10.1.1]
public_contracts: []
internal_scope: documentary-registration-rule
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/tests/test_record_preservation.py, modules/e10-graph/tests/test_registration_identity.py, modules/e10-graph/checks/check_packs.py, modules/e10-graph/tests/test_pack_freshness.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: REVIEW
last_verified: 2026-10-02
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-02"
---

# Graph node registration rule v1

Record: `V-E10-NODE-001`

## Authority and scope

[ADR-015 Decision3](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md), [Phase7 identity standard](https://github.com/xpike-dgm/motobakim-plan/blob/main/07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md), F10.1.1/FL10.1.1/C10.1 and planning T-E10-001 require stable identity and machine-verifiable metadata on every record. This is the registration rule, not the T-E10-002 relation convention, T-E10-003 detector implementation or an assertion that all historical records already conform. It introduces no product runtime seam, automatic task execution or replacement planning truth.

The rule applies to all project graph records: modules, contracts, tasks, packs, evidence, profiles, inventories, schemas and governed project documents. A source file belongs through its module/path/task links under ADR-015 Decision2; it does not need a separate bureaucratic record. Generated indexes are views of authoritative records, never independent identity or completion authority. Planning records remain in their repository and are referenced, not silently copied into application truth.

## Identity admission

1. A record carries its immutable type prefix plus stable slug in Markdown/YAML frontmatter. Use the existing record-type identity field and record declaration; do not substitute its filename, title or current path for identity. Identity aliases or missing prefixes in legacy files are explicit unresolved migration gaps, not newly normalized or silently renamed IDs.
2. Verify same-type and cross-type uniqueness against current application records and planning truth before first claim. First claim wins; a collision is REJECTED, never merged. A review must distinguish the legitimate planning-to-physical migration below from unrelated duplicate claims.
3. Physical task records may reuse their planning Task ID only with explicit frontmatter supersedes pointing to that precise frozen planning row, per the installed task registry. The planning row remains PROPOSED and the physical row owns execution state; this controlled lineage is not two competing live claims.
4. Changing an identity requires a separately reviewed supersedes/superseded_by chain; the original ID and history remain. A path move keeps identity and updates governed references under review, never creates a second node or loses history.
5. Reject ambiguous owners, conflicting claims, unsupported lineage and unverified external identity checks. A generated index or duplicate filename cannot resolve the conflict.

## Minimum metadata on every admitted record

The binding minimum, verbatim, is `purpose`, `domain/module/owner`, `depends_on`/`used_by`, `implements`, `public_contracts`/`internal_scope`, `tasks`/`tests`/`evidence`, `supersedes`/`superseded_by`, `status`/`last_verified`. Each individual named field is carried in YAML frontmatter; these slashes group fields, not permission to omit fields.

| Fields | Registration duty | Failure consequence |
|---|---|---|
| purpose | State the record's actual purpose; no title-only proxy | Missing/ambiguous purpose: MISSING/UNVERIFIED |
| domain, module, owner | Declare actual domain, capsule and accountable owner; referenced targets must resolve | Missing owner: UNOWNED; ambiguous assignment: CONFLICT |
| depends_on, used_by | Explicit dependency/consumer references, using the canonical direction and relation meanings | Broken references: MISSING; invalid edge: CONFLICT |
| implements | Link the actual requirement/rule/feature being implemented or defined | Unsupported completion mapping: UNVERIFIED |
| public_contracts, internal_scope | Declare public surface and interior boundary; empty public surface does not expose internals | Undeclared surface or boundary: CONFLICT |
| tasks, tests, evidence | Link actual tasks, tests and evidence; do not fabricate tests/evidence from a date or green unrelated CI | Critical behavior without tests/evidence: UNVERIFIED |
| supersedes, superseded_by | Preserve actual predecessor/successor identity and exact planning-row lineage where applicable | Missing/contradictory lineage: MISSING/CONFLICT |
| status, last_verified | Carry actual lifecycle/document status and date of actual verification, not file modification or guessed freshness | Missing verification: UNVERIFIED; status conflict: CONFLICT |

Explicit empty lists are valid only where there is actually no applicable relation, with the reason recorded. Unknown is not empty: mark the unresolved fact MISSING, UNOWNED or UNVERIFIED with the affected requirement and follow-up boundary. A node may be visible in an inventory with gaps, but may not be admitted as conforming, DONE or production-ready because its fields exist. Operational HELD, task BLOCKED and other existing states retain their meanings; gap labels are findings, not invented lifecycle transitions. Documentary records may have no executable tests or public runtime surface; their actual source comparison/review evidence is still required.

## Registration and change procedure

- Author an immutable identity, full minimum metadata, actual purpose/boundary and trace references in governed Markdown with YAML frontmatter. Claim only the authorized task and paths; preserve all existing history.
- Compare IDs with application and planning truth, resolve references, inspect metadata meaning and boundary ownership. Existing check_identity.py scans four frontmatter ID keys plus body Record declarations and checks status; it does NOT prove full metadata, all record types or planning-wide identity coverage.
- Preserve failures explicitly; no silent defaults, semantic inference from filenames, invented ownership, copied evidence or wholesale historical backfill. T-E10-002/003 convention/detector work retains its own dependencies and acceptance; this rule does not claim those tasks are implemented.
- Independently review the exact proposed head, including scope, identity/lineage and full-registry impact; require applicable exact-head CI. Record real evidence and owner authority before task closure. Green legacy checks do not replace this admission review.
- Admit only conforming records. Return incomplete authoring to the existing remediation/blocking lifecycle. A visible incomplete legacy node stays UNVERIFIED until a controlled, independently reviewed repair or superseding record supplies truthful metadata; its old proof is never rewritten as newly verified.
- Rebuild generated indexes after changes; never hand-merge them. Rollback preserves identity, supersedes chains, evidence and incomplete findings. Tooling rollback is not permission to remove findings or undo historical proof.

## Impact and current limits

The companion inventory records a literal frontmatter-field presence audit of all126 tracked Markdown documents at base28b3734027d72b8f592b60290c8bf5f8fc0dfe2b. It is a baseline, not a semantic conformance audit or a live generated index. It demonstrates existing gaps; current run_all green is not full registration proof. This task publishes the universal registration rule. Existing-corpus admission, complete graph closure, relation conventions, detector implementations, physical activation and production authorization are not established by publishing it. If the independent reviewer finds T-E10-001 acceptance also requires the existing corpus to be fully migrated now, task remains CHANGES_REQUESTED/IN_PROGRESS until that scope is fulfilled; no bounded PASS is used to conceal an unmet criterion.

For this documentary rule: no public runtime contracts, no executable behavior/tests and used_by names the present documentary consumers; no future convention/detector consumer is claimed. Metadata dependency list is empty because canonical T-E10-001 has no task dependencies. The evidence is linked as an existing record, with its actual review state authoritative.

## Registration countercases to inspect

- Same ID in another type or source: reject; legitimate task migration needs the exact lineage exception, never generic duplicate allowance.
- Missing required field, blank owner, guessed verification date or unknown encoded as empty: retain the gap and reject conforming admission.
- Renamed identity without predecessor, stale index pointing to deleted source, body-only legacy metadata or changed digest without new verification: retain MISSING/CONFLICT/UNVERIFIED.
- Copied cached/old approval, all-tasks-DONE argument or green legacy check standing in for full metadata: refuse completion claim; independent exact evidence remains necessary.

Inventory: `[[vault/INVENTORIES/E10-REGISTRATION-BASELINE.md]]`; task: `[[vault/REGISTRY/T-E10-001.md]]`; pack: `[[vault/PACKS/P-E10-001.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-027.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## Corrective whole-corpus registration implementation (2026-10-02)

The initial rule-only submission was rejected at0213a1a; that decision remains in E-DEV-027. All131 current Markdown documents now carry stable stored identity and each minimum metadata field. Existing identities, declared owners, product status, verification timestamps and semantic bodies remain; previously unidentified governed documents receive explicit first claims. E10 is the newly declared custodian of otherwise ownerless document records, not the owner or authorizer of product data. Unknown operational/semantic coverage remains UNVERIFIED, rather than fabricated proof. Original forward semantics remain in immutable source bodies; no new runtime relation convention is claimed.

The126 original baseline Git blobs are preserved exactly under vault/EVIDENCE/SNAPSHOTS/metadata-v1 as non-Markdown immutable .snapshot payloads. metadata_origin_file/digest/commit reference those originals. A pinned count/raw-content catalog digest and per-record normalized digest protect them. Current frames retain original metadata values and begin with the original body; the preservation guardian rejects historic verdict/identity/content changes. Old evidence Markdown subject paths now resolve to their exact original bytes, with subject_original_path retained and original subject_digest unchanged. E-PR-001 pack_file is the exact preserved proof pack; the guardian accepts only the original/preserved addresses and the originally pinned digest, so wrapping the record cannot authorize rewriting old proof. Secondary historical sources are listed as preserved payload references. Archived payloads are historical data, not active duplicate graph nodes.

check_registration v1 enforces131-record field presence, nonempty declared purpose/domain/module/owner/scope/status/date, real dates/module ownership, exactly one owned identity, same/cross-type collisions, matching body identity, duplicate-key rejection and preserved-origin integrity. Exact same-address origin links and continued presence of every baseline record are required; new nodes cannot borrow old origins. This is registration/serialization and historical-preservation coverage, not completed T-E10-002 relation conventions or the seven T-E10-003 semantic detectors. Twenty meaningful tests cover proof tampering, rehashing, missing/redirected/borrowed payloads, removed custody links/nodes, historic verdict/body rewrites conflicting identities and actual linked-task freshness. The pre-existing pack checker now compares only its own task, avoiding unrelated date changes without refreshing old proof or waiving actual stale active work. run_all executes these guards/tests in CI. No production runtime/schema/deployment/account/credential action.

Whole-corpus registration is proposed for independent re-review; no DONE until actual acceptance review and exact-headCI pass. Semantic reference completeness, tested critical product behavior, ten-layer closure and production authority remain separately unproved. The original126-row gap inventory remains a frozen before-state, not a claim that corrected records still lack fields or a current conformance index.
