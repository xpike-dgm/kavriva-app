---
test_id: E-DEV-016
contract_id_version: "ADR-001 Decision 4; ADR-006 Decisions 2 through 9; T-E3-012 activation gate v1"
subject_file: modules/e03-server/internal/postgres_object_activation.py
subject_digest: a29f66593bdfec34fff5b387fb04cb7474d36a6bcab8d3f0dee247bb136e48c8
result: "PASS for transactional activation gate at e135c62: 22 focused tests, 102 E3 CI tests, E10, PR CI and independent review passed"
evidence_links:
  - "[[vault/PROFILES/object-activation.md]]"
  - "[[vault/PACKS/P-E3-012.md]]"
  - "[[vault/REGISTRY/T-E3-012.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (transactional activation gate only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #18 code head e135c62b03fa913f5fc5bbb9ee9374d582fd9cf2"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-016 — Quarantine activation gate

Twenty-two focused tests passed locally in an existing pinned-dependency test environment: seven pure exact-version/evidence tests and fifteen isolated native PostgreSQL tests. Pure tests cover all baseline check requirements, scan-only rejection, changed metadata with identical bytes, failed/unknown verdicts, missing/duplicate receipts, official-class correctness requirement, stale policy/version and full intent fingerprint binding. Native tests cover commit/replay, conflict/revoked retry, immutable receipt, missing current reader/bare ALLOW, missing validation, changed bytes/metadata, current floor/audit/runtime/classification/workload gaps, request/tenant substitution, full canonical ancestor changes, rejected-write rollback, concurrent validator failure/session revocation after actual lock waits, missing/unbound/revoked source fences even with unchanged bytes and source-floor changes after lock wait, retained object/ancestor/validation/auth/source-fence locks through the effect and denied generic-client database paths.

Transaction/locking/commit/rollback tests use a real temporary PostgreSQL server. Object intake, current authority, validation policy/check receipts, scanner/provenance/retention/correctness and protected audit/floor/runtime producers are trusted test fixtures. A required production current-reader is not supplied by this task; default activation is HELD. Receipt IDs do not authenticate issuers or prove independent protected audit custody. No live Supabase schema, role, credential, Storage bucket, upload/preview/worker/serving/publication path is changed. All physical registry activations stay HELD and T-E3-001-R1 stays REVIEW. The stored activation receipt is a past eligibility decision, not future byte-access or release authority; original intake manifests remain quarantined and immutable in meaning.

All 11 E10 checks and git diff --check pass. PR #18 exact code head e135c62b03fa913f5fc5bbb9ee9374d582fd9cf2 passed all 102 E3 tests in GitHub run 36875501693, including the native PostgreSQL cases, and all applicable E5, architecture, live Auth and T3 checks. The label-triggered T3 run passed; the initial unlabeled run was skipped. Automatic checks do not constitute independent review.

An independent gpt-5.6-luna max subagent reviewed exact code head e135c62b03fa913f5fc5bbb9ee9374d582fd9cf2 and returned PASS with no findings. It independently ran all 22 focused tests (7 pure and 15 native PostgreSQL), all 11 E10 checks and git diff --check, verified the normalized subject digest, and confirmed exact-head CI including all 102 E3 tests. It verified intent/manifest binding, current source/target authority, validation holds, transaction locks, immutable receipt, replay/conflict, uncertain commit outcomes and private generic-client access. It confirmed that historical eligibility does not grant publication or future access and that producer/reader/custody/hosted activation proof remains outside this gate. Initial pending-results/reviewer-none bookkeeping is replaced by this record. The same reviewer returned PASS for metadata head 62b558fa15879d873d37334c8a022836dbc03466; its final-head CI was fully green before owner acceptance. On 2026-10-01 the owner explicitly accepted this identified independent verdict under DEC-0069. T-E3-012 is DONE for the executable validation gate and real transactional adapter proof only, not hosted object activation or evidence-producer correctness.
