---
test_id: E-DEV-050
contract_id_version: "ADR004 R7; ADR001 R4; internal policy v1"
subject_file: vault/PROFILES/quarantine-processing-policy.md
subject_digest: 80dce4d378f21b2d716a0b6d3cc74747afe5d441ced9d66a8c0d46863715e5c5
result: "RECORDED: deterministic policy/unit evidence; independent review/current CI outstanding"
evidence_links:
  - "[[vault/PROFILES/quarantine-processing-policy.md]]"
  - "[[vault/PACKS/P-E5-017.md]]"
  - "[[vault/REGISTRY/T-E5-017.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-049-E10-GOVERNED-PATHS.md.snapshot]]"
  - modules/e05-identity/internal/quarantine_pipeline.py
  - modules/e05-identity/tests/test_quarantine_pipeline.py
gate_verdict: "BLOCKED (independent review/current CI missing; actual ingestion/activation HELD)"
reviewer: none
timestamp: 2026-10-02
purpose: Enforce the quarantine processing state chain and explicit failure branches
domain: project-execution
module: e05-identity
owner: E5
implements: [ADR-004, ADR-001, C5.6, F5.6.1, R-003, R-004, R-007, R-009, R-012, R-013, R-014]
public_contracts: []
internal_scope: quarantine-processing-state-policy
tasks: [T-E5-017]
tests: [modules/e05-identity/tests/test_quarantine_pipeline.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E5-INGEST-001]
used_by: [V-E5-INGEST-001, P-E5-017, T-E5-017]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-050 — guarded quarantine processing policy

Source comparison approved ADR004R7/ADR001R4, historical DEBATE004section9, canonical no-hard-dependency task and composite physical-test rows. Full eight-stage chain and explicit REJECTED/SCAN_FAILED/SCAN_UNKNOWN/PARSING_FAILED/MALICIOUS/SUSPICIOUS/EXPIRED/DELETED_BY_POLICY branches; immutable exact-subject/processingpolicy/attributed receipt history; no processing-as-access/approval/correctness. Internal pure functions only, no public runtime seam. Twelve-path pack written before code; actualacceptedPR51base671e7de484ec5c190458d98ed9cba0d805c84ec3 after initialpendingbranch fast-forward. Planmainfa914f013fdcd032faed876689092da245989459/pendingplanPR4e3c2e3 notmerged; directhumanDEC0070mandate. Allprior401/79catalog/admissions/PR47v13/E045pendingreservation retained. EDEV049 original subject/digest/verdict/reviewer/heads/date/core unchanged, secondary inventoryv17 exact raw accepted archive normalized1afa8094055630add5932fd2bf1a719ff202118b4d12fe6bb4c37f5e64136a91.

Root initial11 new policy tests PASS0.014s and compilecheck; full existingE5 suite plus new tests25PASS10.013s using existing pinnedpsycopg isolatedlocalPostgreSQL/fakeAuthfixture, no hostedSupabase/provider/secret/account operations. Small subsequent defensive history subject/enum-type checks require final rerun before freeze. Profile normalized80dce4d378f21b2d716a0b6d3cc74747afe5d441ced9d66a8c0d46863715e5c5; internalcode df829a0576c98cfa84f2e34129a6d7d833323eb352e6b8a8505c0713df81a9eb; tests 6f84fcdefcd2d40698249f7a7a89a8cc1433fec4a0516a93689436ce93c7a775. Root architecture/graph/finaltest/diff checks and actual independent review/currentCI outstanding.

All observations/producer/humanclass markers are fixtures. No verified scanner/isolation/humanreceipt or canonical state/persistence/concurrency/currenteffectauthorization/audit/floor proof; full manifest fingerprint is supplied by future trustedE3producer, not verified here. Source correctness/access/publication/objectactivation never follows from SAFE_FOR_HUMAN_REVIEW. Composite ingestion/preview product tests MISSING; E3R1REVIEW/E5-003IN_PROGRESS/provisioning/privilegedproductionHELD remain. No retention deletion, file/URL/network/parser/scanner/preview/device/UI/incident or deployment operation.

## Performed final source preparation checks

After defensive history subject/enum-type clarification, new policy11testsPASS0.026s and py_compilePASS; root architecture12checks/42regressionsPASS0.414s, exit0; generated45 actual task rows retain T017REVIEW/E3R1REVIEW/E5-003IN_PROGRESS, no eligible state invented. Exact acceptedinventoryv17 archive byteequal rawgitblob671e7de verified. DiffcheckPASS, historical P-PROOF-001warning unchanged. Above final primary/code/test hashes match this source. ExistingfullE5suite25PASS10.013s is pre-clarification regression receipt; current exact-head allCI must execute final code independently. Independent reviewer/currentCI outstanding, no selfPASS.
