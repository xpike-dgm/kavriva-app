---
test_id: E-DEV-047
contract_id_version: "ADR-004 identity composition; C5.1/F5.1.1/FL5.1.1; account-light start procedure v1"
subject_file: vault/PROFILES/account-light-start.md
subject_digest: 361494fb2f346434f41a8f9ef46a5c55e24d2378e567b34ba789f6da2cc05565
result: "RECORDED: manual source comparison; independent review and exact-head CI outstanding"
evidence_links:
  - "[[vault/PROFILES/account-light-start.md]]"
  - "[[vault/PACKS/P-E5-001.md]]"
  - "[[vault/REGISTRY/T-E5-001.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-046-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "BLOCKED (bounded procedure review and CI outstanding; no local app or provider acceptance)"
reviewer: none
timestamp: 2026-10-02
purpose: Specify account-light local start without a mandatory server account
domain: project-execution
module: e05-identity
owner: E5
implements: [ADR-004, C5.1, F5.1.1, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: account-light-start-procedure
tasks: [T-E5-001]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_conformance.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-LOCAL-001]
used_by: [V-E5-LOCAL-001, P-E5-001, T-E5-001]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-047 — account-light start procedure

Root compared the pinned canonical T-E5-001 acceptance/review row, ADR-004 identity composition and rules, REF-PROFILE-001/SCR-006/007 optional profile/local continue/language/accessibility/copy constraints, identity synthesis local origin and AC-ID-14/17/19 migration/restore boundaries, declared module seams and existing E5 consumer surface. Eight negative cases are manual source walkthroughs, not executed product scenarios. Local installation is not a server account or authority; no background anonymous signup, automatic profile/history/entitlement link, provider-outage login wall, or no-loss/encryption guarantee. T-E5-002 owns actual migration; E1/E4 rendering/persistence and existing E3/E5 server authorization remain separate. Exactly ten closure layers retain actual missing device/UI/storage/key/restore/provider evidence and resolvers.

Pack was written before implementation; exact ten-path scope, existing folders, no runtime/test/workflow/schema/operator/provider changes. Original inventory catalog/prior admissions retained; v15/evidence047 does not import or approve pending PR47 v13/evidence045. EDEV046 original primary digest/verdict/reviewer/source/final core retained with exact accepted v14 secondary snapshot vault/EVIDENCE/SNAPSHOTS/E-DEV-046-E10-GOVERNED-PATHS.md.snapshot normalized bb95afd27295c726527e2464afb27b2786734458aff81866aa8a3a932fa9da6c. Actual root graph/index/diff checks and independent review/current CI still required. E3R1 REVIEW/E5-003 IN_PROGRESS/physical provisioning and production release HELD remain.


## Performed preparation checks

Root run_all.py passed all12 architecture checks and42 existing preservation/identity/trace tests (0.416s), exit0. build_index/routing_run rebuilt42 actual task rows; T-E5-001 REVIEW remains excluded, E5-003 IN_PROGRESS/E3R1 REVIEW retained. Manual source comparison covers ADR-004 explicit local installation/no anonymous server account, profile design optional skip/language/accessibility/copy, migration source retention, restore quarantine and eight countercases. No local app/SDK/account/network/device test. Exact accepted inventory archive raw bytes equal git show3f016aa:inventoryv14; EDEV046 old primary subject/digest/reviewer/receipt core retained. Primary procedure SHA256361494fb2f346434f41a8f9ef46a5c55e24d2378e567b34ba789f6da2cc05565. Independent source verdict and current-head CI pending; task is REVIEW, no author acceptance.
