---
test_id: E-DEV-040
contract_id_version: "ADR-015 Decision7; excess-work scan specification v1"
subject_file: modules/e10-graph/EXCESS_WORK_SCAN_RULE.md
subject_digest: cb73626395216d41ab1b1f7927e6b9598f5032d6b8fd493b6e57e9139e3cd009
result: "PASS: independent exact-source review accepted excess-work manual detection specification"
evidence_links:
  - "[[modules/e10-graph/EXCESS_WORK_SCAN_RULE.md]]"
  - "[[vault/PACKS/P-E10-012.md]]"
  - "[[vault/REGISTRY/T-E10-012.md]]"
  - "[[vault/EVIDENCE/SNAPSHOTS/E-DEV-039-E10-GOVERNED-PATHS.md.snapshot]]"
gate_verdict: "PASS (bounded manual detection specification only; product/production holds remain)"
reviewer: "independent gpt-6-luna max; /root/pr42_independent_review"
timestamp: 2026-10-02
purpose: Specify excess-work detection without automatic deletion or scope expansion
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.5, F10.5.1, R-006, R-007, R-009, R-010, R-014]
public_contracts: []
internal_scope: excess-work-detection-specification
tasks: [T-E10-012, T-E10-013]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-EXCESS-001]
used_by: [V-E10-EXCESS-001, P-E10-012, T-E10-012, P-E10-013, E-DEV-041]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-040 - excess-work rule specification

Actual pinned source comparison2026-10-02: canonicalT012acceptance/dependencyT011a/ADR015Decision7/addendum5-6, source/taskflowcatalog and existinggovcore/closure/lifecycle/metadata rules. Bounded proposed/changedwork reverse+forward trace to approvedneed or necessarygoverned obligation, scopedsemanticcomparison, actual owner/context/output overlap, missingcoverage/unknown vs confirmedexcess, controlledhistory-preserving disposition. No automatic detector/taskdelete/merge/sourceauthorityrewrite or product/provider actuation. Existing T010historical observation/method/report/tool unchanged and not broadsemanticproof.

Specified countercases manually compared againstsource: link-onlyfalseapprovedneed, unknownsource-as-deleteableexcess, usefulnegative/custodywork-as-waste, fixture/bootstrapDONE-as-productduplication, titles/IDs-as-semanticproof, necessaryoutscope-as-permission, taskremoval-as-coveredneed, standingauthority-as-newrequirement/providerwindow. These are specified/manualsource comparisons, not actual detector/runtime/corpus/removal-drill execution. Pack19exactpaths/verbs beforework, exact accepted PR41secondaryinventoryarchive, old EDEV039primary/core/digests/verdict/reviewer/heads/date and original126body/catalog preserved. Localchecks/views/diff/independentreview/exactCI stillrequired, no selfPASS.


Actual local validation2026-10-02: all12existingchecks42existingunittestregressions PASS;183Markdownrecords153IDs38packs43evidence36registryrows2382declaredlinks. Registry/routingrebuilt, gitdiffcheckclean, exact19pathsetequalsP012. No newtests/code/check/workflow. Original126catalog/bodyprefix/exactacceptedsecondary and oldproofcores retained. HistoricalP-PROOF-001own-taskfreshnessWARN unchanged. Actualsourceindependentreview/exactCIoutstanding, not authorPASS or actual product/excess-detectorexecution.


Actual independent source acceptance2026-10-02: /root/pr42_independent_review/gpt-6-luna max/forknone/separate boundedcontext. PASS at f2a159c0ac92bba066f4b78fc71edbf656b8e1cb: reviewer manually matched pinned TASK_INDEX T012/depT011a/ADR015Decision7/addendum6 and actual task/pack/registry, inspected full19pathdiff against allowedpaths/perfileverbs, bounded manual predicates/unknowns/controlleddisposition, prior EDEV039core/digest/verdict/reviewer/date/body, raw accepted1b66a614 inventorysnapshotGitblob ac6374f64befce99d8c86f2c8cde60a7f3d8b558, metadata-onlycore/unchangedEDEV038archive, currentnormalizedsubjectdigest and REVIEWviews. Reviewer ran git diff --check clean, workingtree clean; no tests/CI. Rootall8sourceCIactualverification separate. Initial authored outstandingreview/CI history retained; current metadata receipt records actual acceptance. Source subjectdigest 411e2e726f2d029de5738d047f8cb83eb1cd487d778136cd916ea1a6d26ba88a; finalstatusonlydigest cb73626395216d41ab1b1f7927e6b9598f5032d6b8fd493b6e57e9139e3cd009. Root existing12checks42tests/views/diff and CI separate. All8exactsourceSUCCESS: pull_request architecture-checks 36960550483, pull_request e3-commit-authorization-tests 36960550499, pull_request e5-current-authority-tests 36960550481, pull_request e3-live-auth-tests 36960550472, push architecture-checks 36960545761, push e5-current-authority-tests 36960545828, push e3-commit-authorization-tests 36960545887, push e3-live-auth-tests 36960545848. Expected documentaryE10T2label-gatedT3skips; actual independentreview obtained. Direct ownerstanding mandate accepts bounded T012DONE/ruleACTIVE/packACTIVE only. Final six-file metadata/status/evidence/index audit and all8newheadCI before normalPR42merge. No rule body/source/snapshot/priorproof change in closure. E3R1REVIEW/E5IN_PROGRESS/productionactivationreleaseHELD remain. Immutable finalreview/CIreceipt in PRbody avoids recursiveproof rewriting.


T013secondarycustody continuation2026-10-02: exact acceptedPR42final 76fa283c86a90aafd0f57b6a0d55de8b1f66c3e6 inventoryv8rawGitpayload preserved before currentconsumer/admission edits at `vault/EVIDENCE/SNAPSHOTS/E-DEV-040-E10-GOVERNED-PATHS.md.snapshot`, normalizeddigest 83f6acdde70a31c4dfe888615c04e7a7357fd8594a5402c54cca7406b8fd74ab. Original EDEV040primarysubject/digest/body/verdict/reviewer/source+finalheads/date/core unchanged; current documentaryconsumer/taskprovenance and secondarycustody only, not reused acceptance of changedinventory.
