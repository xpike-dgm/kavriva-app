---
record_id: M-E3-001
metadata_version: 1
purpose: "API kapısı + kanonik veri düzeni + platform kurulumu + ortamlar. E3 serves and verifies; single end-to-end owner of runtime edges. Foundation capsule (no inbound epic dependencies)."
domain: "module-contract"
module: "e03-server"
owner: "E3"
depends_on: []
used_by: [M-E1-001, M-E2-001, M-E4-001, M-E5-001, M-E6-001, M-E7-001, M-E8-001, M-E9-001, I-E10-REGISTRATION-BASELINE]
implements:
  - "planning 06_DELIVERY_PLANNING/EPIC_CATALOG.md row E3"
public_contracts:
  - "[[modules/e03-server/MANIFEST.md#Public contract surface]]"
internal_scope: "Supabase config (migrations, RLS/Storage policies, service_role server-side only — never leaves), Edge Functions or equivalently bounded replaceable runtime (`ADR-002`), caches, workers, secrets custody. Helpers, storage layout, in-flight job state invisible outside. Secret custody/rotation follows `vault/PROFILES/secret-custody-rotation.md`: server-only privileged material, separate planned/emergency retirement proof; document completion does not execute rotation or prove live custody. The private maintenance history reader uses a coherent tenant-scoped database transaction; callers must authorize the read first. No history HTTP endpoint is introduced by T-E3-010. AI workload/tool access follows `vault/PROFILES/ai-task-scope.md`; a task pack or model output never mints authority."
tasks: [T-E10-001]
tests: [modules/e10-graph/checks/check_manifests.py, modules/e10-graph/checks/check_identity.py]
evidence: [E-DEV-027]
supersedes: []
superseded_by: []
status: INSTALLED
last_verified: 2026-10-01
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/modules/e03-server/MANIFEST.md.snapshot"
metadata_origin_digest: "fdd6098632d96cf26ab09f24a889c71462fe7b176c2230a43e5d09ab830cfbda"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_scope: "record registration; original product/verification scope unchanged"
metadata_verified_at: "2026-10-01"
---

# MODULE MANIFEST — e03-server (E3 Sunucu + veri omurgası)

Status: INSTALLED (Step-2 REVIEWED PASS 2026-09-22 + installed to `modules/e03-server/MANIFEST.md`; OUT-3 B-19 header fix 2026-09-23)
Record: `M-E3-001` (first claim in this draft; collisions rejected per identity standard)

## Purpose

API kapısı + kanonik veri düzeni + platform kurulumu + ortamlar. E3 serves and verifies; single end-to-end
owner of runtime edges. Foundation capsule (no inbound epic dependencies).

## Public contract surface

- Durable-state categories (`vault/PROFILES/durable-state-categories.md`) list required canonical state;
  no physical store, independent custody or recovery implementation is established by the list.
- API authorization tuple contract (commit-time ALLOW/DENY/HELD; cached claims never substitute).
- RLS/Storage defense profile (`vault/PROFILES/rls-storage-defense.md`) records restrictive client defenses
  for migrated private tables and Storage; policies never grant product authority or prove hosted activation.
- Cost hold behavior (`vault/PROFILES/cost-hold-behavior.md`) specifies retained work, safe hold/drain and
  plain-language owner outcomes; no live metering, billing control or shipped UI is established.
- Classified cost skeleton (`vault/PROFILES/classified-cost-bom.md`) defines mandatory baseline and conditional extras,
  with queue/rollout hold-versus-drain references; financial readiness and runtime cost controls remain HELD.
- Platform cost input template (`vault/PROFILES/platform-bom-inputs.md`) supplies empty scenario and classification
  slots; no price, spend authorization, provisioning or operational readiness is established.
- API enforcement needs (`vault/PROFILES/api-enforcement-needs.md`) specify sensitive-read/effect and alternate-path
  requirements; document completion does not provision services or prove live enforcement.
- Browser transport profile of the authorization tuple (`vault/PROFILES/authorization-tuple-browser.md`): E3 serves and verifies;
  browser storage, origin, CSRF/PKCE, step-up and lookup rules do not grant product authority.
- Consumer maintenance API verifies a bearer login, calls E5's public current-authority surface,
  and commits the allowed maintenance revision on the same guarded E3 transaction.
- Operation identity contract (stable identity/fingerprint; idempotency; CONFLICT/REJECTED semantics).
- State-dictionary / negative-floor / epoch contract (verbatim state word; floors win on ties; epoch
  reaches all edges — downloaded copies honestly unrestorable).
- Domain authority CRUD + versioning; history/provenance + protected audit planes (convenience copies
  never authoritative); object/media boundary + quarantine-first intake.
- `public/domain_authority.py` validates and resolves the reviewed logical domain registry
  (`vault/PROFILES/domain-authority-registry.md`); metadata is never product authorization or physical activation.
- `public/maintenance_provenance.py` defines immutable history/copy representations
  (`vault/PROFILES/history-provenance.md`); copies and history rows never substitute for current snapshots or audit.
- `public/object_boundary.py` verifies object bytes, direct-parent/transitive lineage and exact classification
  propagation (`vault/PROFILES/object-boundary.md`); all factory outputs quarantine and grant no access or activation.
- `public/object_activation.py` defines exact-version validation and intent binding
  (`vault/PROFILES/object-activation.md`); the private PostgreSQL gate records eligibility only after current
  validation/authority checks. A receipt never publishes an object or grants future access.
- Queue/worker job families (lease/pulse/checkpoint/DLQ/backpressure/cancel/evacuate); backup/restore
  drills + clean-room exit; cost-BOM skeleton; environment separation + promotion plumbing.

## Internal scope

Supabase config (migrations, RLS/Storage policies, service_role server-side only — never leaves),
Edge Functions or equivalently bounded replaceable runtime (`ADR-002`), caches, workers, secrets custody.
Helpers, storage layout, in-flight job state invisible outside.
Secret custody/rotation follows `vault/PROFILES/secret-custody-rotation.md`: server-only privileged material,
separate planned/emergency retirement proof; document completion does not execute rotation or prove live custody.
The private maintenance history reader uses a coherent tenant-scoped database transaction;
callers must authorize the read first. No history HTTP endpoint is introduced by T-E3-010.
AI workload/tool access follows `vault/PROFILES/ai-task-scope.md`; a task pack or model output never mints authority.

## Allowed / forbidden dependencies

- Allowed: none inbound from epics (foundation); serves E1, E2, E4, E5, E6, E7, E8, E9 per seam table.
  For the declared E3-serves/E5-authorizes seam, E3 calls only E5's public
  `consumer_authority` decision and verified-principal contract; E5 storage internals stay private.
  E10 tooling-plane relation declared in the seam table invoke stanza (2026-09-23, OUT-3 B-16 — the prescribed
  change-request path; one-way tooling service, no epic runtime inbound to E10).
- Gate-reference note (OUT-3 B-17, non-runtime): E3 tasks reference E6 gates without depending on E6 runtime
  (T-E3-033 HELD unless E6 checks pass; T-E3-022 links T-E6-015). Declared in the seam table invoke stanza;
  not an edge, not a dependency.
- Forbidden: UI/presentation logic; provider-coupled code beyond the bounded runtime; client-side
  authorization trust; plaintext backups; single-provider lock-in without exit rehearsal.

## Tests

- Authorization negatives: bypass/direct-path inventory tests; cached-claim substitution negatives.
- Idempotency + state-word tests; epoch-propagation tests; quarantine-restore + clean-room drills.
- Cross-cutting: every sensitive action re-authorized at API (consumed by E1/E2/E5 tests).
- AI task grants: deny owner/billing/service-role/unrestricted paths; later broker tests must prove scope, expiry,
  revocation and hard-stop behavior before privileged AI execution.

## Change / rollback rules

- Runtime transition gate package (`vault/PROFILES/runtime-transition-gates.md`) requires equal real evidence;
  document completion keeps all candidate/transition gates HELD and performs no migration.
- Backend readiness/exit prerequisites follow `vault/PROFILES/backend-reversibility.md`: document-level checklist
  completion never selects/provisions a platform or proves operational recovery/activation.
- Provider/dependency changes follow `vault/PROFILES/compatibility-hold.md` and the dated
  `vault/INVENTORIES/E3-COMPATIBILITY-CHANGELOG.md`; document closure never proves live compatibility or deploys a change.
- Contract changes version + `supersedes` (R-011); floors/epochs change only with full-edge review.
- Rollback: epoch + quarantine rules by reference (`planning 07_AI_ARCHITECTURE/ROLLBACK_STRATEGY.md`); restored systems land in
  quarantine; forbidden-state resurrection rejected.

## Links (defined-by-reference, not copied)

- Requirements/design: `C3.1`..`C3.9`, `F3.*`; `ADR-002`, `ADR-006`.
- Architecture: seam rows (E3 verifies/serves; single end-to-end owner); `R-001`..`R-004`, `R-010`, `R-011`, `R-013`, `R-014`.
- Tasks/tests: physical registry rows `supersedes` planning `planning 06_DELIVERY_PLANNING/TASK_INDEX.md` E3 rows (Step 5 builds).

## Metadata verification boundary (T-E10-001 remediation)

Same stable manifest identity and original semantic body preserved. Purpose/internal scope are serialized verbatim from the existing sections; public surface is defined by an exact same-record section reference, not a new contract or runtime seam. depends_on/used_by encode the declared epic foundation DAG from the canonical epic/dependency catalog, with E2 consumption of E8 outputs and E9 propose-flow to E1 retaining their existing qualifiers; they are not an assertion of deployed calls. The baseline inventory is an actual documentary consumer. No predecessor/successor record exists for this same-ID addition. Listed tests verify installed anatomy/identity, not all future declared product behavior; E-DEV-027 records scoped metadata validation and outstanding corpus acceptance. Product activation/release/identity gates remain unresolved.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
