---
record_id: M-E6-001
metadata_version: 1
purpose: "Onay → yayın → acil fren; sürüm disiplini; imza emaneti politikası; olay müdahalesi. E6 decides and owns POLICY — E7 executes lanes (policy/execution split)."
domain: "module-contract"
module: "e06-release"
owner: "E6"
depends_on: [M-E3-001, M-E5-001]
used_by: [M-E7-001, I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E6"
public_contracts:
  - "[[modules/e06-release/MANIFEST.md#Public contract surface]]"
internal_scope: "Authority roster, seal/verify tooling, suspension-strap state, incident runbooks, custody policy docs. Lane execution machinery lives in E7; this capsule holds the rules E7 must obey."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e06-release/MANIFEST.md.snapshot"
metadata_origin_digest: "c33ad9ef6d50ea0258030d072f680271b1ee71f3cc30aeba67637935b593d146"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
---

# MODULE MANIFEST — e06-release (E6 Yayın + güvenlik zinciri)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e06-release/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E6-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

Onay → yayın → acil fren; sürüm disiplini; imza emaneti politikası; olay müdahalesi. E6 decides and owns
POLICY — E7 executes lanes (policy/execution split).

## Public contract surface

- Release/promotion contract (`ADR-003` R1–R4 + `ADR-007` release rules): sealed package, single gate;
  publish bound to suspension strap; rollback path is a lethal-error route (never routine).
- 8 release authorities separated (roles never merged; visible WAITING if unstaffed).
- Provenance/SBOM/signature + no-rebuild (promote byte-identical to production; pinned dependencies).
- Config/flag/migration releases under version discipline; staged rollout + recall + quarantine;
  incident response + impact graph; OTA channel closed (remote code needs separate future authorization).

## Internal scope

Authority roster, seal/verify tooling, suspension-strap state, incident runbooks, custody policy docs.
Lane execution machinery lives in E7; this capsule holds the rules E7 must obey.

## Allowed / forbidden dependencies

- Allowed: E3 (serve/source), E5 (authorize/audit).
- Governs: E7 lane execution (E7 ← E3, E6 for policy).
- Surface-reference note (OUT-3 B-17, non-runtime): rollout-state surfacing touches E1 surfaces
  (T-E6-013); render-only, no E1 dependency. Declared in the seam table invoke stanza; not an edge.
- Forbidden: executing lanes itself; merging authority roles; routine rollback of releases; OTA code
  delivery; promoting unsealed or unprovenanced packages.

## Tests

- Authority-separation tests (role-merge negatives; WAITING visibility).
- Seal/promotion tests: byte-identical promotion; no-rebuild verification; SBOM/provenance checks.
- Brake tests: normal path overridden by stop; glass-break drills; recall + quarantine tests.

## Change / rollback rules

- Policy changes (authorities, seal rules, custody) require dual review + evidence-pack note; E7
  execution proves compliance, never redefines policy.
- Rollback of RELEASES is not a routine path (lethal-error route only); recalled systems land in
  quarantine per E3 rules.

## Links (defined-by-reference, not copied)

- Requirements/design: `C6.1`..`C6.8`, `F6.*`; `ADR-003`, `ADR-007`.
- Architecture: seam rows (E6 ← E3,E5; E6 decides, E7 executes); `R-001`, `R-003`, `R-004`, `R-009`, `R-011`, `R-013`, `R-014`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E6 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
