---
test_id: E-DEV-011
contract_id_version: "ADR-006 Decision 9; T-E3-007 direct-path bypass negatives"
subject_file: modules/e03-server/tests/verify_local_direct_paths.py
subject_digest: E907E1B376F6F729D3B350390ADFBED50331090626DB3CD171E71150763AFD6F
native_test_digest: 7122DC9321681C75B3F475022F31C8875F8FC1F0721D783B57028A53AB5F6BE9
result: "RECORDED (42 local E3 tests and prior isolated Supabase Storage/Data API CI passed; final-head CI and independent review required)"
evidence_links:
  - "[[vault/PACKS/P-E3-007.md]]"
  - "[[vault/REGISTRY/T-E3-007.md]]"
  - "[[vault/INVENTORIES/E3-DB-RPC-DIRECT-PATHS.md]]"
  - "[[vault/INVENTORIES/E3-STORAGE-URL-STUDIO-DIRECT-PATHS.md]]"
  - "[[vault/PROFILES/authorization-tuple-browser.md]]"
gate_verdict: "RECORDED (task review not yet performed; no production activation)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-011 — Direct-path bypass negatives

The native PostgreSQL suite adds a second actor's motorcycle and operation-lookup probes. An actual committed operation is indistinguishable to the other actor from an unknown operation ID. SQL sessions restricted to `anon` and `authenticated` fail when reading E3/E5/audit data or inserting an E3 maintenance row. The full local 42-test E3 suite passed on Python 3.12 and embedded PostgreSQL on 2026-10-01.

The CI-only Supabase probe uses two real local Auth users and a server-created private bucket containing actual bytes. It proves the server can read the object, then checks anonymous and both ordinary users on direct private/public downloads, image transformation, signed-URL issuance, upload and delete. List results may be denied or empty, but must not reveal an object path. Direct Data API requests with a client-selected private schema fail. Its fixture service key is read only from the CLI's temporary status JSON and never printed or committed. The first [local-stack CI run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36850975306) found that an unauthorized Storage delete may return HTTP 200 with an empty result. The test was corrected to assert an empty result and re-read the original bytes after each attempt; the [corrected run](https://github.com/xpike-dgm/kavriva-app/actions/runs/36851209154) passed. E3, E5 and architecture checks also passed on that code head.

The positive server fixture does not grant client file authority. These tests do not inspect live Dashboard memberships/MFA, stop a project administrator or `service_role` from bypassing RLS, cover hosted S3/vector/analytics Storage, or prove a deployed Kavriva API. The hosted project still has no Kavriva file bucket. Actual Studio/SQL editor sessions run with privileged database authority; this test's client-role SQL sessions are intentionally narrower. Their denial must not be reported as a Studio-admin denial. T-E3-001-R1 remains REVIEW; this test work cannot mark it DONE.
