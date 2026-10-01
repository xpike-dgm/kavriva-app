---
test_id: E-DEV-011
contract_id_version: "ADR-006 Decision 9; T-E3-007 direct-path bypass negatives"
subject_file: modules/e03-server/tests/verify_local_direct_paths.py
subject_digest: E907E1B376F6F729D3B350390ADFBED50331090626DB3CD171E71150763AFD6F
native_test_digest: 7122DC9321681C75B3F475022F31C8875F8FC1F0721D783B57028A53AB5F6BE9
result: "RECORDED (42 local E3 tests; PR-head CI green; independent PASS for generic-client negatives only)"
evidence_links:
  - "[[vault/PACKS/P-E3-007.md]]"
  - "[[vault/REGISTRY/T-E3-007.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]"
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
gate_verdict: "PASS (T-E3-007 client-path negative suite only; owner acceptance and DONE withheld)"
reviewer: "independent gpt-5.6-luna max sub-agent /root/pr13_independent_review; code head 355e6bd306079f2be9a60993d6c7ef5d425be98e PASS; owner acceptance not yet recorded"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-011 — Direct-path bypass negatives

The native PostgreSQL suite adds a second actor's motorcycle and operation-lookup probes. An actual committed operation is indistinguishable to the other actor from an unknown operation ID. SQL sessions restricted to `anon` and `authenticated` fail when reading E3/E5/audit data or inserting an E3 maintenance row. The full local 42-test E3 suite passed on Python 3.12 and embedded PostgreSQL on 2026-10-01.

The CI-only Supabase probe uses two real local Auth users and a server-created private bucket containing actual bytes. It proves the server can read the object, then checks anonymous and both ordinary users on direct private/public downloads, image transformation, signed-URL issuance, upload and delete. List results may be denied or empty, but must not reveal an object path. Direct Data API requests with a client-selected private schema fail. Its fixture service key is read only from the CLI's temporary status JSON and never printed or committed. The first [local-stack CI run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36850975306) found that an unauthorized Storage delete may return HTTP 200 with an empty result. The test was corrected to assert an empty result and re-read the original bytes after each attempt; the [corrected run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851209154) passed. E3, E5 and architecture checks also passed on that code head.

On PR #13 code head `355e6bd306079f2be9a60993d6c7ef5d425be98e`, [architecture/T3 checks](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851673600), [E3 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659450), [E5 tests](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659359), and both [push](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851629706) and [PR](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851659590) isolated Supabase checks passed. Independent Luna Max reviewer `/root/pr13_independent_review` returned PASS only for generic-client Storage/Data API bypass negatives, embedded PostgreSQL client-role denial and command-layer cross-tenant lookup. It verified that the private object exists, DELETE's HTTP 200 empty result causes no effect, and private Data API profile probes are rejected. The reviewer recommended keeping privileged administration separate from this client-path PASS. Owner acceptance of this identified verdict has not been recorded; T-E3-007 remains REVIEW.

**PASS boundary:** ordinary anonymous/authenticated clients cannot use the tested private E3/E5/audit SQL, Data API or file paths; one actor cannot claim the other's motorcycle or learn its operation result. **HELD activation boundary:** actual Studio/Dashboard memberships and MFA, `postgres`/`service_role` custody and hosted privileged bypass, hosted S3/vector/analytics Storage, a future hosted private bucket, and a deployed Kavriva API are not proven by these tests. The positive server fixture does not grant client file authority. Hosted ordinary file Storage still has no Kavriva bucket. Studio/SQL editor sessions run with privileged database authority; client-role SQL denial is deliberately narrower and cannot be called a Studio-admin denial. T-E3-001-R1 remains REVIEW.
