---
record_id: V-E10-REVIEW-001
version: 1
purpose: Specify independent review roles and nontechnical external dependency notice
domain: project-execution
module: e10-graph
owner: E10
implements: [ADR-015, C10.7, F10.7.1, R-006, R-007, R-008, R-009, R-010, R-013, R-014]
public_contracts: []
internal_scope: separated-review-and-external-notice
tasks: [T-E10-015, T-E10-016, T-E10-017]
tests: [modules/e10-graph/checks/check_trace.py, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_conformance.py]
superseded_by: []
last_verified: 2026-10-02
depends_on: [V-E10-CLOSE-001, V-E10-LIFE-001, D-APP-DOC-004, V-E10-NODE-001, V-E10-REL-001, M-E10-001, V-E10-TOPO-001, I-E10-PATHS-001, task-pack]
used_by: [P-E10-015, T-E10-015, E-DEV-043, V-E10-PARALLEL-001, P-E10-016, E-DEV-044, V-E10-MEASURE-001, P-E10-017, E-DEV-046]
evidence: [E-DEV-043]
supersedes: []
status: ACTIVE
---

# Independent review protocol and external-action notice v1

Record V-E10-REVIEW-001; planpin fa914f013fdcd032faed876689092da245989459; appbase a494ff9a59cb8859904af6b171159e56a4a4ae40.

T-E10-015 only: separated implementer/reviewer/validator and nontechnical external-dependency notice, ADR-015 Decision9/addendum0. Canonical prerequisiteT007, accepted fourteen-field context pack. This specification creates no automatic chat/API actuation, paid service, legal identity, store ownership or qualified attestation; T016 separately owns DEC0041 parallel-output guards.

## Independent task review

- Freeze actual canonical task acceptance, bounded context/source versions, exact candidate head/base and allowed paths/verbs. Implementer supplies actual outcome/diff/tests/proof/limitations/heads; specifications and fixtures remain distinguished from performed product/production evidence.
- Give a separated reviewer a bounded assignment and exact head, independent role/context/initial judgment even when the same model is used. Current owner-requested actual reviewer is gpt-6-luna/max, accepted delegated subagent under DEC0069 and direct standing mandate. This is an operational preference, not a universal model or proof requirement.
- Reviewer inspects actual source acceptance, changed output and necessary tests/proof, and states scope, exact head, concrete findings/verdict and precise actual actions. Root/test/CI results may be cited as separate evidence; copied agreement never implies reviewer ran tests. Missing source/proof/actor/subject keeps affected acceptance nonpassing.
- Preserve disagreements/rejected heads/results/shared blind spots. CHANGES_REQUESTED leads to narrow authorized repair and corrected-head independent re-review, with actual finding closure; no self-PASS, consensus vote or silent scope expansion. Use adversarial/validator role where consequence/current source demands, separated from implementation; do not invent numeric quorum or substitute AI for actual external qualification/custody.
- Batch slices of one task into one PR per DEC0068; task-end independent review precedes accepted DONE, no per-slice owner reports. Actual applicable exact-head CI, owner authority and evidence remain; final metadata/status/views and finalheadCI also require acceptance before normalmerge. Store immutable finalheadreview/CI receipt in PRbody rather than repeatedly changing subject head to document its own CI.
- Production activation/ten-layer closure is separately evidenced. A bounded review PASS or bootstrap documentaryDONE cannot manufacture E3R1liveproduct acceptance, missing E5 authority sources, legal/store attestation or release custody.

## Findings and receipt

Record reviewer identity/model/context separation, task/pack/acceptance scope, exact source/base/candidate head, actual inspected/run checks versus supplied CI, finding reason/path/source/consequence, old rejection and repair/corrected head/closure, bounded verdict/date/evidence pointers and actual owner authorization. Honest MISSING/UNOWNED/BLOCKED/CONFLICT/UNVERIFIED limits survive. This is a protocol receipt description, not a new evidence serialization format replacing ARCHITECTURE_TESTS.

## External dependency identification

Identify unavoidable real external action early from actual source and missing capability/proof: human account/contract, store ownership, legal approval, qualified attestation, independent real custody/recovery/device access where required. AI cannot impersonate these authorities, hide them behind aliases or infer that a repository review relaxes them. Determine actual existing authorization and available evidence first; owner is not the hidden developer/debugger. Where a task can continue independently within its valid pack, do so; dependent activation stays held.

## Notice template for the owner

**Ne bekliyor:** [Kullanıcı açısından hangi sonuç şu an yapılamıyor.]

**Neden senden/dışarıdan bir işlem gerekiyor:** [Gerçek kaynak veya dış kuralın istediği hesap, sahiplik, onay ya da uzman doğrulaması; eksik olanı açıkça belirt.]

**Yapılması gereken:** [İlgili kişi, tam bağlantı/yer ve kısa adımlar; kod, hata ayıklama veya açıklanmamış mimari tercih isteme.]

**Seçenekler:** [Beklet/devam edebilen kısmı yap/uygulanabilir alternatif; gerçek maliyet, gecikme, risk ve geri dönüş açıklaması. Bilinmeyen fiyat veya süreyi bilinmiyor diye yaz.]

**Önerim:** [Onaylı kapsam ve gerçek kanıta dayanan seçenek.]

**Benim sürdüreceğim iş:** [Onaylı kapsamda bağımsız ilerleyebilen somut iş; bekleyen dış eylem yapılmış sayılmaz.]

Use the actual direct standing permission for approved repository work; do not ask repeated approval. For a genuinely missing action/authority, show a concrete prepared/reviewable result and explain the exact requirement/source before asking. No hypothetical compliance checklist or unnecessary permission flow. Costs/account/provider creation/legal/store/release obligations remain consequence-specific and cannot be fabricated by this template.

## Negative cases / shared blind spots

Reject implementer self-PASS, same-context role relabeling, agreement-as-approval, checker output treated as independent judgment, changedheadreusingoldapproval, reviewer claimed tests from CI, missing finding history, scope expansion, productreadinessfromspecPASS, AI claiming legal/store/qualified authority, notice asking owner to debug, guessed costs/delays and repeated permission already granted. These are specified/manual source comparison cases, not actual legal/provider/store activation or automatic review engine. Exact applicable source and actual owner authority remain visible; no new taskstates or automaticactuation.


## Governed sources and actual task addresses

Actual schema `templates/PACK_TEMPLATE.md`; lifecycle `modules/e10-graph/TASK_REGISTRY_LIFECYCLE.md`; closure `templates/CLOSURE_MATRIX_TEMPLATE.md`; task `vault/REGISTRY/T-E10-015.md`; pack `vault/PACKS/P-E10-015.md`; evidence `vault/EVIDENCE/E-DEV-043.md`; admission `vault/INVENTORIES/E10-GOVERNED-PATHS.md`. Exact pinned controlling sources: [TASK_EXECUTION_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/TASK_EXECUTION_PROTOCOL.md), [AI_CODING_PROTOCOL.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/AI_CODING_PROTOCOL.md), [OWNER_STATUS_AND_ESCALATION.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/07_AI_ARCHITECTURE/OWNER_STATUS_AND_ESCALATION.md), [DECISION_LOG.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/DECISION_LOG.md), [PROJECT_SCOPE_ADDENDUM_AI_NATIVE_EXECUTION_SYSTEM.md](https://github.com/xpike-dgm/motobakim-plan/blob/fa914f013fdcd032faed876689092da245989459/00_CONTROL/PROJECT_SCOPE_ADDENDUM_AI_NATIVE_EXECUTION_SYSTEM.md). Original rules/amendments remain, no impersonatedexternal authority. Emptyruntime/lineagearrays mean no new publiccontract or identityreplacement.
