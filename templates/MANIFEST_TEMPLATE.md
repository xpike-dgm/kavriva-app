---
record_id: D-APP-DOC-003
version: 1
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/templates/MANIFEST_TEMPLATE.md.snapshot"
metadata_origin_digest: "3cc44940f43fb78c125c417ce6fc275a76062ca9dad1297d44c278c7fded91eb"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "Reusable capsule declaration template with preserved historical reservation"
domain: "project-records"
owner: "E10"
module: "e10-graph"
depends_on:
  - "ADR-015"
  - "V-E10-NODE-001"
  - "V-E10-REL-001"
used_by:
  - "I-E10-REGISTRATION-BASELINE"
  - "P-E10-004"
  - "T-E10-004"
  - "E-DEV-031"
implements:
  - "ADR-015 Decision3 record registration"
  - "ADR-015 Decisions1-2; C10.2; F10.2.1"
public_contracts: []
internal_scope: "Capsule declaration authoring template; original reservation/custody history preserved"
tasks:
  - "T-E10-001"
  - "T-E10-004"
tests:
  - "modules/e10-graph/checks/check_manifests.py"
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
  - "E-DEV-031"
supersedes: []
superseded_by: []
status: "REVIEW"
last_verified: "2026-10-02"
metadata_verified_at: "2026-10-02"
---

# Template stub — Module manifest

Defined-by-reference: planning `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md` (capsule anatomy, 7 mandatory fields)
+ `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md` (conformance-test form).
Full authoring belongs to the owning step; this stub reserves the address. Instantiated 10× in Step 2
(`modules/eXX-*/MANIFEST.md`).

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.

## Current reusable capsule declaration template v1 (T-E10-004)

The preceding stub and custody text preserve the original bootstrap reservation. The following marked template is the current authoring form at this same governed address; no identity replacement. D-APP-DOC-003 identifies the template itself, not an instantiated product capsule. Current task is T-E10-004, frozen acceptance Purpose/surface/interior/deps/tests/change fields, prerequisite T-E10-001 accepted/merged PR29. No runtime/contract/schema/code or module-manifest migration is performed here.

Pinned sources: planning fa914f013fdcd032faed876689092da245989459 (ADR-015 Decisions1–2, MODULE_BOUNDARIES seven mandatory anatomy fields, contract template and metadata standard); app base d9dc9441620b3255f5ecc6963d9b5c0cb791b23b. Sources by reference: `planning 07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md`, `planning 07_AI_ARCHITECTURE/CONTRACTS/CONTRACT_TEMPLATE.md`, `planning 07_AI_ARCHITECTURE/GRAPH_METADATA_AND_IDENTITY_STANDARD.md`, `planning 07_AI_ARCHITECTURE/RULES/README.md`; accepted registration and meanings: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`, `modules/e10-graph/GRAPH_RELATION_CONVENTION.md`. Decisions1–2: [ADR-015](https://github.com/xpike-dgm/motobakim-plan/blob/main/05_ADR/RECORDS/ADR-015__AI_SAFE_MODULE_CONTRACT_TOPOLOGY_AND_GRAPH.md).

### Authoring instructions and admission

Copy only the marked reusable form below to the capsule's governed manifest address. Replace every angle-bracket placeholder with verified capsule-specific content. Choose/reuse the capsule's actual stable manifest ID after uniqueness/lineage checks; never copy this template's D-APP-DOC-003 or documentary E10 owner into a product capsule. All sixteen metadata fields and all seven anatomy headings are mandatory. Actual ownership/relationships must resolve, and scalar/list/date shapes follow the accepted convention. Use an explicit scoped empty collection only if no relation applies and explain why in its corresponding section. Unknown content is a visible MISSING/UNOWNED/CONFLICT/UNVERIFIED gap and prevents acceptance; placeholders are authoring prompts, never valid default entries.

No new capsule, cross-epic seam or product authority is granted by filling this form. A new seam follows canonical declare-and-review before use. Small source files/folders resolve through governed module path inventories and task evidence, not additional per-file bureaucracy. Instantiate within the task pack's allowed scope; an out-of-scope change requires BLOCKED/change-request. Existing manifests retain identity/history; later controlled adoption requires its actual authoring task and evidence, not bulk rewrite by this template task.

### BEGIN reusable form (authoring prompts, not admitted records)

```yaml
---
record_id: "<existing or reviewed first-claim stable capsule manifest ID>"
metadata_version: 1
purpose: "<actual reason this capsule exists>"
domain: "<actual subject domain>"
module: "<owning capsule's governed module address>"
owner: "<accountable provider capsule owner>"
depends_on: ["<resolved prerequisites with scope/plane stated below>"]
used_by: ["<actual consumers in the same stated scope>"]
implements: ["<requirement/rule/feature/ADR identities or qualified sources>"]
public_contracts: ["<owned stable public contract identities>"]
internal_scope: "<actual private boundary>"
tasks: ["<actual authoring/change task identities>"]
tests: ["<applicable actual test IDs or governed test source addresses>"]
evidence: ["<actual scoped evidence identities>"]
supersedes: ["<actual identity predecessor, only for replacement>"]
superseded_by: ["<actual identity successor, only for replacement>"]
status: "<actual document/capsule state, not a guessed completion claim>"
last_verified: "<actual verification date YYYY-MM-DD>"
---
```

# MODULE MANIFEST — <capsule identity and name>

Record: <same stable manifest identity as frontmatter>

## Purpose

<Explain actual responsibility and user outcome, with owning requirement/capability/feature references. State accountable provider and its decision boundary. Identify governed module/path inventory and how constituent files/folders resolve to this purpose/module/task; filenames alone do not imply ownership.>

## Public contract surface

<List actual functions/data/events intentionally offered outside the capsule, their governed public addresses and stable contract IDs+versions, provider/consumer parties and exact signature/source references. Link pre/post-conditions, classification and authority propagation plus negative guarantees to the owning contract. Commit-time authorization requirements reference ADR-006/its governed contract rather than copying its tuple or logic. Empty public surface needs an explicit reason; it never exposes internal helpers. A consumed contract does not transfer ownership. Proposed declarations do not prove a callable implemented capability.>

## Internal scope

<List storage layout, caches, helpers, in-flight state and private paths owned here, with explicit public/private boundary. These interiors cannot be used across capsules merely because the provider name is allowed. Identify what remains outside this capsule's responsibility and governing authority. No secret values or runtime credentials in manifests.>

## Allowed / forbidden dependencies

<Declare each actual cross-boundary use with consumer, provider, public contract/version/surface, classification/authority condition and explicit governed allowed-edge/source reference. Identify forbidden uses/private paths and canonical prohibitions; toward-stability direction must match source. Keep runtime consumption, task prerequisites, documentary/tooling service and invoke/gate references in separately named scopes. used_by is actual consumption, not an invented inverse prerequisite. New seams require canonical declaration/independent review before use; missing allowed permission or conflicting authority remains nonpassing.>

## Tests

<Link actual applicable test IDs/addresses, mapped contract/version/behavior and required positive/negative/failure cases. Record executions/head/environment and scoped evidence when performed; future tests or a green unrelated CI do not prove behavior. Required independent review is recorded separately and never supplied by author self-PASS. Structural admission tests alone do not establish product behavior or complete semantic detector coverage. Untested critical behaviors stay UNVERIFIED/BLOCKED for applicable gates.>

## Change / rollback rules

<State controlled changes and their source/policy, scope/impact on consumers/registry, compatibility and data-protection requirements plus reversible rollback/evidence path. Preserve stable capsule/contract identities and original proof/history; routine contract version changes use version/supersedes_version, identity replacement uses governed supersedes/superseded_by lineage. No emergency privilege/authority widening from this form. Source/contract changes trigger scoped revalidation, never automatic date refresh. No deployment, purchase or production promotion implied.>

## Links

<List resolved requirement/design/screen-state/ADR/rule sources, actual task pack/task/test/evidence references, and governed module/source inventories; distinguish authoritative sources from views and documentary custody from product proof. Record missing/conflicting/unverified links explicitly and identify the follow-up boundary. This form adds no competing requirement source or rule-to-gate mapping.>

### END reusable form

### Anatomy mapping and countercases

| Required source anatomy | Template field and acceptance oracle |
|---|---|
| purpose | Purpose section + actual purpose/domain/module/owner; accountable outcome/source, not just a title |
| public contract surface | Public contract surface + owned public_contracts and actual contract/version/parties; provider and private boundary resolved |
| internal scope | Internal scope + private paths/responsibility; no accidental public grant |
| allowed/forbidden dependencies | Allowed / forbidden dependencies + scoped depends_on/used_by; explicit governed edge, classification/authority and prohibitions |
| tests | Tests + actual tests/evidence; behavior/negative-case/execution scope visible, planned tests not successful proof |
| change/rollback rules | Change / rollback rules + preserved identity/version/history and scoped consumer/rollback impact |
| requirement/design/task/test links | Links + implements/tasks/tests/evidence; governed source/address resolution, open gaps visible |

All seven anatomy fields are retained even though frozen acceptance names the first six groups. Missing Links is rejection, not an optional seventh field. Empty collections require actual scoped absence; do not leave placeholder items. Documentary references/tooling/invoke/gates remain distinct from runtime graph edges. Dates are actual verification, not approval or product completion.

Countercases: missing Purpose/public/interior/deps/tests/change/Links → incomplete declaration; copied E10/template ID as product owner/identity → reject unsupported custody transfer/collision; private helper exposed by allowed capsule name → reject; tests/evidence only planned or unrelated to subject → unproved behavior; new seam absent from canonical table → blocked boundary; source/date changed to refresh old PASS → reject proof/history forgery; unsupported supersede used for ordinary version bump → reject lineage. Correct anchored private-only capsule with explicitly justified empty public surface is not forced to invent a contract; complete documentary-only scope does not become a product runtime capability.

### Verification, change and full-registry impact

Template v1's complete form maps to canonical seven-field anatomy and accepted identity/metadata meanings. Existing installed10manifests already have those seven headings; that structural comparison is not a new semantic audit of their bodies. The installed check_manifests validates heading existence, not this form's actual owner/contracts/allowed edges/behavior proof. Existing run_all/regression tests validate artifact admission/preservation; manual source/anatomy/countercase comparison plus independent exact-head review proves this template acceptance. No mirrored executable test added for this reversible document change.

Current record last_verified records actual T004 template verification; earlier stub/origin/product proof dates remain exact in their preserved payloads. Origin snapshot/body prefix stays untouched; new body extension is an explicit governed template task, not historical re-authoring. Full-registry impact: template and actual documentary consumers/task/evidence links plus generated views only; no existing module identity, relation reclassification or product manifest migration. Later template/schema change requires version/impact/preservation/independent review and applicable CI; rollback preserves original stub and approved template payloads, never erases history. No new owned runtime contract, so this template record's public_contracts is empty; no identity replacement, so its lineage is empty.

Task: `vault/REGISTRY/T-E10-004.md`; pack: `vault/PACKS/P-E10-004.md`; actual validation/review proof: `vault/EVIDENCE/E-DEV-031.md`.
