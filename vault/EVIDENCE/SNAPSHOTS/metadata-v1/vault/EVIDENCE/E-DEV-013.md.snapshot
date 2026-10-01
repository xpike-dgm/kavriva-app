---
test_id: E-DEV-013
contract_id_version: "ADR-001 Decision 1; T-E3-009 logical domain authority registry v1"
subject_file: vault/REGISTRY/domain-authorities.json
subject_digest: 422D96C8F95D5A083357B11525D6F277F2678B9701728556607352CBD88A378B
result: "PASS for logical registry scope at 0b9a459; 13 registry tests, 11 E10 checks and PR CI pass; owner accepted identified verdict on 2026-10-01"
evidence_links:
  - "[[vault/PROFILES/domain-authority-registry.md]]"
  - "[[vault/PACKS/P-E3-009.md]]"
  - "[[vault/REGISTRY/T-E3-009.md]]"
  - "[[modules/e03-server/MANIFEST.md]]"
gate_verdict: "PASS (logical registry scope only; owner accepted identified independent verdict under DEC-0069)"
reviewer: "independent gpt-5.6-luna max subagent, PR #15 head 0b9a459bb32a43cbc7ec028d71beaa1d2d20100b"
timestamp: 2026-10-01
status: RECORDED
last_verified: 2026-10-01
---

# E-DEV-013 — Domain authority registry

The registry maps eight ADR-001 data domains to one stable logical authority identity each. The loader rejects duplicates, unknown/missing domains, identity/owner substitution, malformed versions and unproven activation. Resolution checks expected registry/revision and rejects held domains and convenience-copy kinds. Successor validation checks predecessor byte digest, version step and per-domain revision without changing identities. Thirteen unit tests pass locally, including negative paths and fixture-based successor validation. E3 CI checks out full history to wire the predecessor gate for future snapshots. The committed initial v1 has no predecessor: its history test exercises only the initial-version check, not a real historical transition. All 11 E10 checks and git diff --check pass.

An independent gpt-5.6-luna max subagent reviewed exact head 0b9a459bb32a43cbc7ec028d71beaa1d2d20100b and returned PASS for this logical registry implementation. It separately verified a valid v2 HELD snapshot using temporary v1-to-v2 Git history. PR-head architecture, E3, E5, live-auth and applicable T3 checks are green; GitHub E3 CI ran 55 tests successfully. Its non-blocking evidence note about the initial-version history branch is clarified above. No blocking findings remain. Future runtime integration must consume the reviewed loader output; direct dataclass construction is not proof of a valid binding.

This is governed logical metadata with executable validation, not a product data store. Create/update/retire operations publish reviewed snapshots via PR; there is no dynamic registry API, concurrent publication transaction, hosted source switch-over, production freshness/floor guarantee or account/key change. All physical activation values remain HELD. E5/E6 authority is named through existing boundaries, not implemented or expanded by this task. T-E3-001-R1 remains REVIEW. The same independent reviewer returned PASS for final metadata head 83fc67812b6d46af64cdbbabce002ce9b2a4997d. On 2026-10-01 the owner explicitly accepted the identified verdict under DEC-0069. T-E3-009 is DONE for the logical registry implementation scope only.
