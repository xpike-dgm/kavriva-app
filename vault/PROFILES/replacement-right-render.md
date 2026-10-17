---
record_id: V-E1-REPLACEMENT-001
version: 1
purpose: Rehber seçimi düzeltme ve yeniden seçim taleplerini güncel sunucu kararıyla sınırlı sunmak
domain: motorcycle-entitlement
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.7, F1.7.1, FL1.7.2, SCR-037, BR-048, BR-049, BR-134, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: selection-replacement-presentation
tasks: [T-E1-025]
tests: [modules/e01-app/internal/shell/test/replacement_right_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-17
depends_on: [M-E1-001, V-E1-ENTITLEMENT-001, T-E1-014a]
used_by: [P-E1-025, T-E1-025, E-DEV-124]
evidence: [E-DEV-124]
supersedes: []
status: IN_PROGRESS
---

# Rehber seçimi hakkının sunumu

Kodöncesi paket P-E1-025 ile tam14adres sabittir. Güncel sunucu kararı olmadan düzeltme veya yenileme yok; sadece istek gönderilir. Canlı kaynak/üretim HELD. T023/T024 uzman belgesi bekler. Yerel test/bağımsız kabul henüz yok; gerçek112/94/206.
