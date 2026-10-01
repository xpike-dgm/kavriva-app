---
test_id: E-DEV-021
contract_id_version: "ADR-002 Option A and Decisions 1 and 6; ADR-006 Decision 11; T-E3-017 rules v1"
subject_file: vault/PROFILES/secret-custody-rotation.md
subject_digest: 8e3105ab3bddc98cb14512b1d8c49f5b8963b3cabddcf06d8e410cb244c8e8be
result: "RECORDED: server-only custody and rotation rules; independent review and exact-head CI pending"
evidence_links:
  - "[[vault/PROFILES/secret-custody-rotation.md]]"
  - "[[vault/PACKS/P-E3-017.md]]"
  - "[[vault/REGISTRY/T-E3-017.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "RECORDED (rules document only; independent T3 review and owner acceptance pending)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-021 — Secret custody and rotation rules

The document covers bounded database credentials, privileged Supabase API keys/legacy service-role keys, Auth signing material, user tokens, public configuration, administrative/support/recovery access, cross-plane/worker credentials and isolated CI fixture material. It defines a references-only custody record, separate environments/components, protected injection/redaction/artifact handling, narrow technical actors and ordinary AI prohibitions. Current maintenance configuration is named accurately: bounded database DSN plus public URL/issuer/publishable Auth input; cached configured process/connection consumers must be recreated and verified during later cutover.

Planned rotation has prepare/stage/cutover/verify/retire/close steps, each with evidence and stop rules. Replacement creation is not old-key retirement; signing trust/cache, database connections, provider API keys, product grants/sessions and URLs are distinct. Compromise requires containment/revocation rather than graceful overlap of a known compromised key; partial/unknown outcomes reconcile canonical operations; safe rollback never restores compromised/revoked access or lowers floors. Provider outage recovery stays with named technical/external actors, not owner SQL/SSH/debugging. Later privileged execution requires its own scoped T3 review and owner acceptance.

Official Supabase API/signing guidance and changelog were checked on 2026-10-01 and linked in the profile. This task changes no runtime, tests, schemas, workflow, account, provider key/password/role/session or secret store; retrieves no secrets; authorizes no purchases or rotation. No numeric limits/schedules are invented. All operational custody/rotation/recovery proof is HELD; T-E3-001-R1 remains REVIEW and physical activation remains HELD. T-E3-018 compatibility procedure remains separate. Existing regression CI does not prove live custody or rotation.

Baseline and post-change all 11 E10 checks passed; registry/routing indexes were regenerated and git diff --check passed. Exact-head CI and independent gpt-6-luna max T3 review will be recorded after execution. Owner acceptance is pending; task remains REVIEW.
