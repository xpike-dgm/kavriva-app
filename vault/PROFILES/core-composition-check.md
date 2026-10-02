---
record_id: V-E4-CORE-001
version: 1
purpose: Check complete selected-task core composition without inventing canonical package authority
domain: offline-package
module: e04-offline
owner: E4
implements: [ADR-009, CON-003, C4.1, F4.1.1, R-001, R-003, R-004, R-007, R-011, R-013]
public_contracts: []
internal_scope: core-composition-check
tasks: [T-E4-001]
tests: [modules/e04-offline/tests/test_core_composition.py, modules/e10-graph/checks/check_registration.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E4-001, T-E4-001, E-DEV-060]
evidence: [E-DEV-060]
supersedes: []
status: IN_PROGRESS
---

# Selected-task core composition

Canonical ADR-009 R1 / CON-003 / C4.1 / F4.1.1 / FL4.1.1 / T-E4-001. Acceptance is verified core + nested safety, selected scope only, no full library, essentials irremovable. Plan pin fa914f013fdcd032faed876689092da245989459 / accepted main e5c9aeef3f024fb2ed0e2035fe86d852591a3d43. No hard task dependencies. E4 consumes packages through E3 only; generation and semantic safety classification belong to the upstream E3/E6 pipeline. No E6 import or new public seam.

## Actual composition check

Internal frozen declaration names one motorcycle/task/release/generation; exact applicability and compatibility references, dependency object/revision/digest tuples and complete ordered entries. Required roles are text, steps, warnings, checks, safe_stop, recovery. Safety media is nested as additional required entries in this same core, never a second budget or on-demand escape. Every declared entry is essential to this composition check. Optional media is outside this check; no classification or full-library generation occurs.

A local deterministic manifest fingerprint binds all supplied context and entries; not a new product wire format. An independently supplied expected fingerprint and selected scope must match. Received parts must be immutable nonempty byte payloads, contain exactly every declared ID once, share the selected generation/context and match each declared SHA256. Removing any essential, rehashing a changed manifest against the old pin, corrupting bytes, adding unrelated entries, mixing generation or changing contextual references fails with a finite reason. No candidate-size limits, trimming, download, persistence, staging or promotion.

Successful check returns only STRUCTURE_MATCH / intrinsic NONE. Caller-supplied references/pins are not authenticated authority. A coherent forged declaration, empty dependency tuple or missing semantically-required media not declared upstream cannot be detected as canonical falsehood here. Role labels do not prove correct warning text, applicability, recovery for reachable physical states or actual compatibility; no renderer/device evidence. Pure production_gate always returns HELD_CANONICAL_PACKAGE_SOURCE_MISSING / NONE without inspecting input or invoking callbacks. No approval/encryption/readiness marker opens it.

## Incomplete acceptance

T-E4-001 stays IN_PROGRESS: current E3 canonical approved package producer, independently authenticated expected manifest, semantic safety classification/completeness, current generation/compatibility/dependency/floor and recovery proofs are missing. E3 public quarantined object byte verification is insufficient; no substitution with a fixture or logical approval. Runtime actionability, mobile rendering, atomic promotion, encrypted custody and plaintext-fallback gate are separate unproved obligations. Partial units cannot support full task DONE or production readiness.

## Trace and checks

ADR-009 R1 -> C4.1 -> F4.1.1 -> FL4.1.1 -> T-E4-001 -> M-E4-001 -> E-DEV-060. Task/feature/flow/requirement are bound by supplied fixture bytes only. Design/mobile accessibility unproved; architecture E4 consumes E3 only; data pure immutable declarations without persistence; release/current authority absent; scenarios fixture-negative only; gap audit above preserves remaining acceptance.

Code `modules/e04-offline/internal/core_composition.py`; tests `modules/e04-offline/tests/test_core_composition.py`; CI `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-001.md`; task `vault/REGISTRY/T-E4-001.md`; evidence `vault/EVIDENCE/E-DEV-060.md`; capsule `modules/e04-offline/MANIFEST.md`. Full-task independent review follows actual completion, no partial author PASS.
