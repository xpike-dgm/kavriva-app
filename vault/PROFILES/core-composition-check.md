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
status: ACTIVE
---

# Selected-task core composition

Canonical ADR-009 R1 / CON-003 / C4.1 / F4.1.1 / FL4.1.1 / T-E4-001. Acceptance is verified core + nested safety, selected scope only, no full library, essentials irremovable. Plan pin fa914f013fdcd032faed876689092da245989459 / accepted main e5c9aeef3f024fb2ed0e2035fe86d852591a3d43. No hard task dependencies. E4 consumes packages through E3 only; generation and semantic safety classification belong to the upstream E3/E6 pipeline. No E6 import or new public seam.

## Actual composition check

Internal frozen declaration names one motorcycle/task/release/generation; exact applicability and compatibility references, dependency object/revision/digest tuples and complete ordered entries. Required roles are text, steps, warnings, checks, safe_stop, recovery. Safety media is nested as additional required entries in this same core, never a second budget or on-demand escape. Every declared entry is essential to this composition check. Optional media is outside this check; no classification or full-library generation occurs.

A local deterministic manifest fingerprint binds all supplied context and entries; not a new product wire format. An independently supplied expected fingerprint and selected scope must match. Received parts must be immutable nonempty byte payloads, contain exactly every declared ID once, share the selected generation/context and match each declared SHA256. Removing any essential, rehashing a changed manifest against the old pin, corrupting bytes, adding unrelated entries, mixing generation or changing contextual references fails with a finite reason. No candidate-size limits, trimming, download, persistence, staging or promotion.

Successful check returns only STRUCTURE_MATCH / intrinsic NONE. Caller-supplied references/pins are not authenticated authority. A coherent forged declaration, empty dependency tuple or missing semantically-required media not declared upstream cannot be detected as canonical falsehood here. Role labels do not prove correct warning text, applicability, recovery for reachable physical states or actual compatibility; no renderer/device evidence. Pure production_gate always returns HELD_CANONICAL_PACKAGE_SOURCE_MISSING / NONE without inspecting input or invoking callbacks. No approval/encryption/readiness marker opens it.

## Separate upstream and runtime gates

Current E3 canonical approved package producer, independently authenticated expected manifest, semantic safety classification/completeness, current generation/compatibility/dependency/floor and recovery proofs are missing for validation of a real product package. They do not prevent the independently accepted composition-check rule from completing its specific review task. E3 public quarantined object byte verification is insufficient; no substitution with a fixture or logical approval. Runtime actionability, mobile rendering, atomic promotion, encrypted custody and plaintext-fallback gate are separate unproved obligations. Units alone cannot support full task DONE; independent full task review is required. Task-level acceptance never proves production readiness.

## Trace and checks

ADR-009 R1 -> C4.1 -> F4.1.1 -> FL4.1.1 -> T-E4-001 -> M-E4-001 -> E-DEV-060. Task/feature/flow/requirement are bound by supplied fixture bytes only. Design/mobile accessibility unproved; architecture E4 consumes E3 only; data pure immutable declarations without persistence; release/current authority absent; scenarios fixture-negative only; gap audit above preserves remaining acceptance.

Code `modules/e04-offline/internal/core_composition.py`; tests `modules/e04-offline/tests/test_core_composition.py`; CI `.github/workflows/e4-tests.yml`; pack `vault/PACKS/P-E4-001.md`; task `vault/REGISTRY/T-E4-001.md`; evidence `vault/EVIDENCE/E-DEV-060.md`; capsule `modules/e04-offline/MANIFEST.md`. Full-task independent review has now accepted this check; no author self-PASS.

## Independent task-level completion receipt

Separate read-only /root/pr58_snapshot_binding_review, configured user-selected gpt-6-luna/max, actual full T-E4-001 task-level PASS/no actionable findings at 3c2c55d96a2130936ae8b8003e8d12bcbe8f79f9 over accepted e5c9aeef3f024fb2ed0e2035fe86d852591a3d43. All fourteen changed paths inspected; accepted v27 archive byte-equal, profile digest matched. No source review rejection or code correction. Reviewer ran no tests/CI/provider/write operations. Canonical task is a review gate/no harddeps; E3/E6 generation/classification and real mobile/runtime source evidence are distinct obligations. The earlier cautious claim that their absence blocks this specific check task was not a canonical prerequisite; retained here as an explicitly superseded scope hypothesis, never historical proof of an actual source failure.

Exact source twelve CI SUCCESS: PR architecture37024980210 actualT3SUCCESS (earlier duplicate37024954595green), E4 37024954497 actual12PASS0.007s, E3commit37024954439, E5 37024954779, E6 37024954647, live-auth37024955023; push architecture37024883327, E4 37024883977, E3commit37024883548, E5 37024884146, E6 37024883635, live-auth37024883776. Root12PASS0.015s/compile; corrected graph12checks+42regressionsPASS0.448s/views53/diff/archive. Initial document-link failure/actual correction retained; checker unchanged.

Owner standing DEC0069/0070 full task-level verdict acceptance; plan PR4 unmerged/direct mandate applies. Task DONE only for internal composition check review acceptance. E3 canonical generation, independent trusted pin, semantic necessity/completeness/classification/current compatibility/recovery/floor, real package validation, encrypted persistence/staging/promotion, E1 warning rendering and actual mobile/device/actionability remain unproved/HELD. No approved canonical package, producer, production or whole offline feature readiness claimed. Production gate remains constant HELD/NONE. Unresolved E3R1/E5-003/PR47/57/59 unchanged. Final seven metadata/view paths only; code/tests/workflow/archive/priorproof/inventory untouched. Manifest lifecycle note aligned, original anatomy and scope unchanged. Separate final metadata audit and latest exact-head twelve green CI before normal matched-head merge.
