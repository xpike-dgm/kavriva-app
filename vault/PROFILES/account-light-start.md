---
record_id: V-E5-LOCAL-001
version: 1
purpose: Specify account-light local start without a mandatory server account
domain: consumer-identity
module: e05-identity
owner: E5
implements: [ADR-004, C5.1, F5.1.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: account-light-start-procedure
tasks: [T-E5-001]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E5-001, I-E10-PATHS-001]
used_by: [P-E5-001, T-E5-001, E-DEV-047]
evidence: [E-DEV-047]
supersedes: []
status: ACTIVE
---

# Account-light start procedure v1

Plan fa914f013fdcd032faed876689092da245989459; accepted application base 3f016aa6cca70ff48cb2837e1da242264a0a073d. T-E5-001 acceptance is **Local-first default; no forced server account**, validated by **review** in the canonical acceptance matrix. This procedure specifies the required behavior. It does not implement a mobile screen, device identity, encrypted persistence, backup, migration or server authorization.

## Identity boundaries

| Identity | Meaning and allowed use | Boundary |
|---|---|---|
| Local installation/device partition | Origin and separation of local motorcycle context, history, notes, evidence and pending work | Not a server account, authenticated consumer principal, ownership proof or official technical truth |
| Verified consumer principal | Current actor/session established through E5's declared consumer authority surface, served through E3 | A login alone cannot import local ownership or grant arbitrary motorcycle access; sensitive effects need current canonical authorization |
| Provider/control-plane account | Service/project administration | Never the consumer principal or local profile; no provider role/key/sign-up is issued by this procedure |

The local partition is a domain requirement, not a newly chosen UUID, device fingerprint, credential, crypto algorithm or storage key. Missing physical local identity/encryption evidence stays visible; a fabricated session or privileged fallback is forbidden.

## Start and continue locally

1. On first use, offer approved local/core value without a mandatory login or profile wall. Selected motorcycle, local history, notes and evidence context may start in the local installation partition. Do not create a Supabase anonymous account in the background to simulate local identity. The procedure sends no account-creation, enrollment or upload request merely because the app opened.
2. Keep a clear way to continue locally when the optional profile/persistence offer appears. Consume the approved SCR-006 intent: `Profil oluştur` and the lower-emphasis `Şimdilik yerel devam et` path. E1 owns actual rendering. Language, units and accessibility are available without profile creation.
3. Attribute local/source records to their actual local origin, preserving motorcycle/context and provenance. User-reported content is not official verified technical content. Local state, an empty queue, a successful local write, cached roles or provider claims never imply canonical server acceptance.
4. Keep usable local/source state when the user skips, cancels, loses connectivity, or a provider becomes unavailable. Distinguish a server-only feature that cannot run from local value that can continue. Do not force sign-up to handle a provider outage or use an administrative credential as a shortcut.
5. Do not turn local-first into a blanket permission to perform physical work with stale, missing, recalled or incompatible safety guidance. Existing eligibility, stop/recovery, package and revocation requirements remain binding; retain source records while the affected action is held. This task does not decide package download, offline content entitlement, or safety qualification.
6. Tell users the actual storage/continuity limit when implemented and verified. A local partition alone is not a tested backup, clean-room restore or cross-device synchronization guarantee. Never use `hiçbir şey kaybolmaz` or an absolute security claim. If the required safe persistence/encryption implementation is missing, hold that write capability without silently falling back to plaintext or manufacturing a cloud account.

## Optional later profile choice

Profile creation is a distinct user choice for the approved continuity/collaboration value. It is not implicit consent to upload all records, reassign ownership, acquire an entitlement, or merge histories. A previously signed-in session may be used only under its current verified scope; switching profiles never silently attaches an old partition's pending work to a different actor.

T-E5-002 owns the actual local-to-profile migration procedure and implementation. Its handoff requirements are scope/classification preview, conflict review, source preservation until accepted/reconciled, and non-destructive cancellation/partial/failure. This task performs no merge, delete, link, enrollment or migration. Conflicts remain separate; provider linking cannot select a winning record or ownership claim.

Backup restore or device migration does not restore current authority. Preserve source, use the existing `RESTORE_QUARANTINE` boundary, reconcile current epochs/floors/accepted operations before eligibility, and never resurrect a deleted/revoked grant from an old snapshot. Device encryption/key provisioning/rotation/recovery and actual restore proof remain unimplemented here, not waived by this document.

## Scope and resolver handoff

| Missing or unavailable capability | Required result | Technical resolver |
|---|---|---|
| Local partition/persistence/encryption proof | Preserve existing records; hold affected write, no plaintext or forced-cloud substitute | E4 local persistence owner with E5 identity boundaries; future implementing task must declare its exact scope |
| Current server actor/session/authorization | Hold or deny server-only effect with its stable reason; local origin is not ALLOW | E5 authorizes through existing public surface; E3 serves and rechecks at commit |
| Profile migration preview/conflict resolution | Preserve both sources; no automatic attachment or overwrite | T-E5-002; E1 renders the reviewed scope |
| Restore continuity/floors/epochs | Quarantine and reconcile; no authority inheritance from backup | E4 local restore / E3 runtime / E5 identity through the already declared seams |
| Actual screen/accessibility/device evidence | Product scenario remains UNVERIFIED; document review is not a device test | E1 consumer implementation and its applicable device acceptance |

These are existing ownership references, not new runtime dependencies or calls into another module's internals. The existing server `consumer_authority.py` surface remains unchanged. No sensitive effect or privileged production activation is authorized by this start procedure.

## Source-reviewed countercases

| Countercase | Required outcome |
|---|---|
| Opening the app automatically creates an anonymous Auth user | Reject: local installation is the start origin; no simulated cloud identity |
| Profile is required to choose language/units or access accessibility | Reject: these controls remain available locally |
| Skip/cancel deletes local notes, evidence or history | Reject: retain usable source; no migration effect |
| Provider outage replaces local start with a mandatory login wall | Reject: isolate unavailable server-only capability from local use |
| Local device ID, cached ALLOW or successful HTTP response grants a server mutation | Reject: current E5/E3 canonical authorization still required |
| New account/sign-in silently uploads or attaches another profile's pending work | Reject: explicit scope and T-E5-002 preview/conflict handoff |
| Old backup regains a revoked entitlement or bypasses current safety checks | Reject: RESTORE_QUARANTINE and reconciliation, preserve origin without authority |
| Green CI or this procedure proves encryption/backup/no-loss behavior | Reject: physical evidence remains missing; no plaintext fallback or absolute claim |

These are manual source walkthroughs. No user account, API command, mobile/device, offline write, restore or migration was executed.

## Trace and closure limits

Forward: ADR-004 identity composition / C5.1 / REF-PROFILE-001 SCR-006/007 → E5 → F5.1.1 → FL5.1.1 → T-E5-001 → M-E5-001 / this procedure → E-DEV-047 bounded source review. Reverse: each countercase and procedure step resolves to those source boundaries; T-E5-002 migration and E1/E4/E3 physical acceptance are separate unperformed work.

| Closure layer | Bounded procedure evidence and remaining gap |
|---|---|
| task | T-E5-001 procedure review; independent review/current CI required before bounded DONE |
| feature | F5.1.1 local account-light requirement connected; feature implementation not claimed |
| flow | FL5.1.1 optional profile/migration scope connected; no executed screen flow |
| requirement | C5.1 and ADR-004 identity composition compared verbatim in scope |
| design | SCR-006/007 / REF-PROFILE-001 skip, copy and source-preservation constraints consumed; render/accessibility MISSING |
| architecture | E5 authorizes, E1 renders, E3 serves; E4 persistence reference only, no new public contract or internal import |
| data/migration | No schema/data effect in this task; actual device storage/encryption and T-E5-002 migration proof MISSING |
| release | No rollout/activation; existing production HELD remains |
| product-scenario | Source countercases reviewed; actual Android-first/iOS/device/Auth/migration scenarios UNVERIFIED |
| gap-audit | Missing local/restore/UI/provider/canonical authority proof named with technical resolvers; never borrowed from bootstrap or source CI |

Actual pack `vault/PACKS/P-E5-001.md`; task `vault/REGISTRY/T-E5-001.md`; proof `vault/EVIDENCE/E-DEV-047.md`; capsule `modules/e05-identity/MANIFEST.md`; address inventory `vault/INVENTORIES/E10-GOVERNED-PATHS.md`.

## Pinned controlling sources

- [ADR-004 identity composition and rules](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/05_ADR/RECORDS/ADR-004__IDENTITY_AUTHORIZATION_SESSION_RECOVERY_AND_PRIVILEGED_ACTIVATION.md)
- [Task acceptance](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/TASK_INDEX.md) and [review validation row](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/06_DELIVERY_PLANNING/ACCEPTANCE_MATRIX.md)
- [Approved profile and collaboration constraints](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/03_DESIGN/PROFILE_COLLABORATION_VISUAL_REFERENCES.md)
- [Identity requirements, local origin and migration/restore constraints](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/04_TECH_STRATEGY/DEBATES/DEBATE-010__IDENTITY_REQUIREMENTS_SYNTHESIS.md)
- [Declared module boundaries](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/MODULE_BOUNDARIES.md) and [ten-layer closure](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/COMPLETION_EVIDENCE_AND_CLOSURE_MATRIX.md)
