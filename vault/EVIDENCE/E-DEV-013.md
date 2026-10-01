---
test_id: E-DEV-013
contract_id_version: "ADR-001 Decision 1; T-E3-009 logical domain authority registry v1"
subject_file: vault/REGISTRY/domain-authorities.json
subject_digest: 422D96C8F95D5A083357B11525D6F277F2678B9701728556607352CBD88A378B
result: "RECORDED (13 domain registry tests and all 11 E10 checks pass; PR CI and independent review to follow)"
evidence_links:
  - "[[vault/PROFILES/domain-authority-registry.md]]"
  - "[[vault/PACKS/P-E3-009.md]]"
  - "[[vault/REGISTRY/T-E3-009.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "RECORDED (logical registry validation only; independent review and owner acceptance required)"
reviewer: none
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-013 — Domain authority registry

The registry maps eight ADR-001 data domains to one stable logical authority identity each. The loader rejects duplicates, unknown/missing domains, identity/owner substitution, malformed versions and unproven activation. Resolution checks expected registry/revision and rejects held domains and convenience-copy kinds. Successor validation checks predecessor byte digest, version step and per-domain revision without changing identities. Thirteen unit tests pass locally, including all negative paths above and snapshot succession against preserved Git history. E3 CI checks out full history so the succession gate has its predecessor. All 11 E10 checks and git diff --check pass.

This is governed logical metadata with executable validation, not a product data store. Create/update/retire operations publish reviewed snapshots via PR; there is no dynamic registry API, concurrent publication transaction, hosted source switch-over, production freshness/floor guarantee or account/key change. All physical activation values remain HELD. E5/E6 authority is named through existing boundaries, not implemented or expanded by this task. T-E3-001-R1 remains REVIEW. Independent review, green PR CI and owner acceptance are still required.
