---
profile_of: rls-storage-defense
owner: E3
version: 1
status: PROPOSED
content_defined_by: ADR-002 Option A and Decision 1; T-E3-016
supersedes: ~
record_id: D-APP-DOC-023
metadata_origin_file: "vault/EVIDENCE/SNAPSHOTS/metadata-v1/vault/PROFILES/rls-storage-defense.md.snapshot"
metadata_origin_digest: "4d841238721e98ea635488e02e05fa1901f440e4ddd2a8c10e623db359b6f4ea"
metadata_origin_commit: "28b3734027d72b8f592b60290c8bf5f8fc0dfe2b"
metadata_version: 1
metadata_scope: "record registration; original product/verification scope unchanged"
purpose: "The Kavriva API remains the authority boundary for sensitive reads and consequential writes. E3 serves/verifies using E5's public current decision interface. Database grants, row-level security (RLS), a valid login/JWT, Storage policy and provider administration never establish product ALLOW. The server must still verify current actor/session/scope, policy/generations, negative floor, operation intent, protected audit and runtime before the guarded effect. T-E3-001-R1 remains REVIEW; physical activation remains HELD."
domain: "project-records"
module: "e03-server"
depends_on:
  - "ADR-015"
used_by:
  - "D-APP-DOC-015"
  - "D-APP-DOC-025"
  - "E-DEV-020"
  - "E3-COMPATIBILITY-CHANGELOG"
  - "I-E10-REGISTRATION-BASELINE"
  - "M-E3-001"
  - "P-E3-016"
  - "T-E3-016"
implements:
  - "ADR-002 Option A and Decision 1; T-E3-016"
public_contracts: []
internal_scope: "Original document declarations and record custody; no new runtime authority"
tasks:
  - "T-E10-001"
tests:
  - "modules/e10-graph/checks/check_identity.py"
  - "modules/e10-graph/checks/check_conformance.py"
  - "modules/e10-graph/checks/check_links.py"
evidence:
  - "E-DEV-027"
superseded_by: []
last_verified: "2026-10-01"
metadata_verified_at: "2026-10-01"
---

# RLS and Storage defense

## Boundary and implementation scope

The Kavriva API remains the authority boundary for sensitive reads and consequential writes. E3 serves/verifies using E5's public current decision interface. Database grants, row-level security (RLS), a valid login/JWT, Storage policy and provider administration never establish product ALLOW. The server must still verify current actor/session/scope, policy/generations, negative floor, operation intent, protected audit and runtime before the guarded effect. T-E3-001-R1 remains REVIEW; physical activation remains HELD.

T-E3-016 installs reproducible defense policies for the currently migrated maintenance/identity/audit tables and existing Supabase Storage metadata tables. Proof is isolated native PostgreSQL plus local Supabase CI, with two real local Auth users and a private bucket fixture. No hosted project is altered, no bucket or product upload/disclosure path is provisioned, and no production-wide security proof is claimed. Object activation's separate native fixture schema is not a deployed Supabase schema; its production integration remains HELD.

## Controls and negative proof

| Surface | Defense installed | Evidence / remaining boundary |
|---|---|---|
| Current `kavriva_e3`, `kavriva_e5`, `kavriva_audit` tables | Enable RLS; restrictive `false` client policy for `anon` and `authenticated`; revoke schema/table/sequence/function access from clients/PUBLIC. | Native tests inventory every current table. Deliberately granting CRUD and adding permissive policy still yields no rows or changes and rejects inserts. |
| Bounded `kavriva_consumer_api` | Server RLS policy preserves existing specific grants; no new table/column permissions, client membership, login or bypass role. | Guarded maintenance succeeds; a current negative floor still prevents another write. RLS server policy is an additional transport defense, never current product authorization. |
| Future database objects | Remove migration creator's default client table/sequence privileges and global PUBLIC function EXECUTE default. | Native future-object tests. RLS/policies on newly created tables and equivalent defaults for other creators must be explicitly included in later migrations; defaults do not auto-install RLS. |
| Supabase `storage.objects` and `storage.buckets` | Restrictive deny-all client policies; no generic client upload/read/list/update/delete/sign or bucket management grant. Applies to all buckets in this stack, not a new public upload feature. | Local HTTP probes add an intentionally permissive fixture policy, then test anonymous and two signed-in users: private download/transform, metadata list, upload, replacement/upsert, delete, signed issuance and public-bucket conversion. |
| Public URL / private bytes | A bucket must remain private; a public bucket can bypass object-download RLS. | Fixture confirms private state before/after, public raw/transformed routes fail and expected bytes survive attempts. No existing public bucket is converted by this migration; live bucket inventory/activation is separately HELD. |
| Data API and privileged function | Private schemas stay outside the exposed API set; no client function EXECUTE or server membership. | Existing local Data API probes and native privilege checks; no new view, RPC, publication or Realtime path. Future exposed views must preserve caller permissions or remain inaccessible. |

## Privileged paths and holds

RLS does not contain a superuser, table owner or `BYPASSRLS` role. Supabase server secrets/service-role and provider console can bypass parts of these controls; they remain trusted infrastructure paths subject to separate custody, least-privilege, audit and activation gates. No secret is printed, committed or handed to a client. Storage fixtures use service-role only in isolated CI for setup/verification. There is no grant of product approval or publication authority to that key.

A previously issued signed URL or downloaded copy is not revoked by adding these policies. URL custody/expiry, per-edge revocation, non-retraction and production object access remain separate work; this task proves client issuance denial only. Production public-bucket checks, alternate role/view/function/creator inventory and provider compatibility checks are required before deployment. Missing/contradictory proof holds the affected capability; permissive policy, client claims or RLS success cannot bypass current API decisions.

## Migration and recovery

Apply the new migration through the reviewed deployment process only after environment-specific gates; this task does not apply it to hosted Supabase. Private tables receive RLS; Storage policies are installed only when the provider-owned tables exist and their provider-enabled RLS is verified. The migration does not ALTER provider-owned Storage tables; missing RLS fails the prerequisite. Plain PostgreSQL fixtures omit Storage and cannot prove HTTP behavior. New migrations must explicitly inventory tables, RLS, grants, policies, default creator privileges and any new exposed path. Do not disable these defenses to recover access; hold the affected operation and have the technical implementer diagnose the failed grant/policy or current authority. Reversal uses a reviewed corrective migration, preserving floor/audit/current authority and quarantine.

## Source verification

Checked official Supabase guidance on 2026-10-01: [RLS](https://supabase.com/docs/guides/database/postgres/row-level-security), [Storage access](https://supabase.com/docs/guides/storage/security/access-control), [Storage schema protection](https://supabase.com/docs/guides/storage/schema/design), and [public/private buckets](https://supabase.com/docs/guides/storage/buckets/fundamentals). The [changelog index](https://supabase.com/changelog.md) was fetched; the [PostgreSQL minor-release notice](https://supabase.com/changelog/postgres-15-19-17-11-breaking-changes) was examined. This change creates no ltree/btree_gist indexes, legacy-cipher pgcrypto data or custom operators. That scope comparison is not a hosted-project upgrade audit. CI retains pinned CLI and dependencies; no provider version upgrade is performed by this task.

Pack: `[[vault/PACKS/P-E3-016.md]]`; task: `[[vault/REGISTRY/T-E3-016.md]]`; evidence: `[[vault/EVIDENCE/E-DEV-020.md]]`; broader enforcement needs: `[[vault/PROFILES/api-enforcement-needs.md]]`.

## Record metadata custody v1 (T-E10-001)

This metadata frame preserves the original identity and document scope. Where no record identity existed, record_id is an explicit first claim; existing profile_of remains its original relationship, not a renamed ID. metadata_origin_file, when present, is the exact baseline Git-blob payload, with its normalized digest; historical primary/secondary proof refers to those unchanged bytes. Original verdicts, proof timestamps and subject digests are retained, never approval of this new frame. Newly assigned E10 ownership is documentary record custody only, not ownership/authorization of its product subject; existing declared owners remain. Missing relation entries are not inferred from filenames: added registration dependency is the governing ADR-015, and added used_by is documentary source-reference usage, not runtime calls. Original product dependency/contract/implementation declarations remain authoritative in the unchanged source. Added test pointers cover structural metadata/links/digests only; product and semantic closure remain UNVERIFIED where not proved. Empty public_contracts means this frame declares no new owned runtime contract; original consumed surfaces remain in source. Empty evidence on evidence records means no separate supporting evidence record, never self-approval; subject/support artifacts remain in evidence_links. Empty predecessor/successor lists mean no identity replacement, not erased history. Fresh metadata verification does not refresh historical product verification. No independent acceptance or production activation follows from serialization alone.

Registration authority for this metadata frame: `modules/e10-graph/GRAPH_NODE_REGISTRATION.md`.
