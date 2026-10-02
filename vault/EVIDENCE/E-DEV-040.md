---
test_id: E-DEV-040
contract_id_version: "ADR-015 Decision7; excess-work scan specification v1"
subject_file: modules/e10-graph/EXCESS_WORK_SCAN_RULE.md
subject_digest: 411e2e726f2d029de5738d047f8cb83eb1cd487d778136cd916ea1a6d26ba88a
result: "BLOCKED: actual independent task-end review and exact-head CI outstanding"
evidence_links:
  - "[[modules/e10-graph/EXCESS_WORK_SCAN_RULE.md]]"
  - "[[vault/PACKS/P-E10-012.md]]"
  - "[[vault/REGISTRY/T-E10-012.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-039-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "BLOCKED (bounded specification review/CI outstanding; full product/semanticaudit unproved)"
reviewer: none
timestamp: 2026-10-02
purpose: Specify excess-work detection without automatic deletion or scope expansion
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.5, F10.5.1, R-006, R-007, R-009, R-010, R-014]
public_contracts: []
internal_scope: excess-work-detection-specification
tasks: [T-E10-012]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-EXCESS-001]
used_by: [V-E10-EXCESS-001, P-E10-012, T-E10-012]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-040 - excess-work rule specification

Actual pinned source comparison2026-10-02: canonicalT012acceptance/dependencyT011a/ADR015Decision7/addendum5-6, source/taskflowcatalog and existinggovcore/closure/lifecycle/metadata rules. Bounded proposed/changedwork reverse+forward trace to approvedneed or necessarygoverned obligation, scopedsemanticcomparison, actual owner/context/output overlap, missingcoverage/unknown vs confirmedexcess, controlledhistory-preserving disposition. No automatic detector/taskdelete/merge/sourceauthorityrewrite or product/provider actuation. Existing T010historical observation/method/report/tool unchanged and not broadsemanticproof.

Specified countercases manually compared againstsource: link-onlyfalseapprovedneed, unknownsource-as-deleteableexcess, usefulnegative/custodywork-as-waste, fixture/bootstrapDONE-as-productduplication, titles/IDs-as-semanticproof, necessaryoutscope-as-permission, taskremoval-as-coveredneed, standingauthority-as-newrequirement/providerwindow. These are specified/manualsource comparisons, not actual detector/runtime/corpus/removal-drill execution. Pack19exactpaths/verbs beforework, exact accepted PR41secondaryinventoryarchive, old EDEV039primary/core/digests/verdict/reviewer/heads/date and original126body/catalog preserved. Localchecks/views/diff/independentreview/exactCI stillrequired, no selfPASS.


Actual local validation2026-10-02: all12existingchecks42existingunittestregressions PASS;183Markdownrecords153IDs38packs43evidence36registryrows2382declaredlinks. Registry/routingrebuilt, gitdiffcheckclean, exact19pathsetequalsP012. No newtests/code/check/workflow. Original126catalog/bodyprefix/exactacceptedsecondary and oldproofcores retained. HistoricalP-PROOF-001own-taskfreshnessWARN unchanged. Actualsourceindependentreview/exactCIoutstanding, not authorPASS or actual product/excess-detectorexecution.
