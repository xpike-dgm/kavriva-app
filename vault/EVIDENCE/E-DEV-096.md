---
test_id: E-DEV-096
contract_id_version: "ADR012 Decision4; C8.5/F8.5.1/FL8.5.1 v1"
subject_file: vault/PROFILES/measurement-capability-bands.md
subject_digest: 9fc973918a0f31ada8d04cd7e1598a13564c7b8325faa5850a0bd575f56b6983
result: "RECORDED ölçüm kabiliyetlerinin sınıflarının değerlendirmesi; bağımsız kabul bekleniyor"
evidence_links:
  - "vault/PROFILES/measurement-capability-bands.md"
  - "vault/PACKS/P-E8-009.md"
  - "vault/REGISTRY/T-E8-009.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-094-E10-GOVERNED-PATHS-FOR-T-E8-009.md.snapshot"
gate_verdict: "RECORDED ölçüm sınıflandırması REVIEW; gerçek analitik/kesinti/gizlilik kanıtı HELD"
reviewer: none
timestamp: 2026-10-04
purpose: Ölçüm kabiliyetlerini tam kaynak nitelikleriyle dört sınıfa ayırmak
domain: measurement-capability-bands
module: e08-content
owner: E8
implements: [ADR-012, ADR-001, ADR-005, ADR-010, C8.5, F8.5.1, R-001, R-003, R-004, R-007, R-011, R-013, R-014]
public_contracts: []
internal_scope: measurement-capability-bands
tasks: [T-E8-009]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [V-E8-MEASUREMENT-BANDS-001]
used_by: [V-E8-MEASUREMENT-BANDS-001, P-E8-009, T-E8-009]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-096 ölçüm kabiliyetlerinin sınıflarının değerlendirmesi

Kabul edilmiş taban a43f47c558b7e6ccadd483e1eca4a25675893172/v62; plan fa914f013fdcd032faed876689092da245989459. Belge üretiminden önce 5e1fae03857a4af65a3ad25846b12b8349debe0f başında pack kaydedildi: 14 alan, 12 sabit kaynak, 11 izinli yol. Kanonik ADR012R4 dört ölçüm sınıfının tam9/6/5/7kalemi ve nitelikleri kaynak referansıyla korunur; tablo dört sınıfı görünür kılar, yeni yetki/policy/rol/permit üretmez. Kanonik kayıt ve şema E3 sahipliğinde kalır; E8 türetir, E2 gösterir. Korumalı denetim analitik dışında kalır. Gerçek analitik kurulumu, gizlilik ve kesinti bağımsızlığı kanıtı eksiktir; bunlar HELD. Önceki görevlerin eksikleri bu sınıflandırma ile kapatılmaz.

LF profil SHA256 9fc973918a0f31ada8d04cd7e1598a13564c7b8325faa5850a0bd575f56b6983. Ham v62 snapshot `vault/EVIDENCE/SNAPSHOTS/E-DEV-094-E10-GOVERNED-PATHS-FOR-T-E8-009.md.snapshot`: 188857 byte, rawSHA256 a7cfe8e0543f46eb79d59ed8aaca09f6985ba1df9c03f00b8a00a9a7d8b4c1e6; kabul edilmiş a43f47c558b7e6ccadd483e1eca4a25675893172 envanter Git blobuyla bayt eşit. v63 yalnız yeni kabul yollarını genişletir; 401dosya79klasör/pending13-23-25 ve önceki bütün kabuller korunur. EDEV094 birincil subject/reviewer/hüküm/geçmiş değişmez; yalnız gerçek PR96 ikincil makbuzu ve tüketici referansı eklenir.

Yazar kaynak doğrulaması ve bütün kanonik kabulün bağımsız gpt-6-luna/max incelemesi/aynı başlık CI bekleniyor. Ortak kör nokta sınıflandırmayı gerçek analitik/kesinti/gizlilik kanıtı sanmak veya mantıksal ACTIVE kaydını fiziksel geçerli izin sanmak; incelemeci tüm kaynak cümlesini/owner/seam/pin/raw/diff/actualHELD sınırını bağımsız denetlemelidir. Pack `vault/PACKS/P-E8-009.md`; görev `vault/REGISTRY/T-E8-009.md`; profil `vault/PROFILES/measurement-capability-bands.md`.

## Yazarın gerçek kaynak doğrulaması

12 sabit uygulama kaynak özeti yeniden hesaplandı ve eşleşti. ADR012R4 tam cümlesi, yalnız satır boşlukları ve Markdown işaretleri normalleştirilerek kaynakla birebir karşılaştırıldı. Tablolar 9/6/5/7 kalem içeriyor. Ham v62 arşivi taban Git blobuyla bayt eşit. Önceki E-DEV-094 birincil içeriği yalnız tüketici referansı dışında değişmedi. Taban farkı tam 11 izinli yolda; ürün kodu, test, workflow ve runtime sözleşmesi değişmedi. build_index 88 satır, routing T-E8-009 REVIEW; run_all 12 kontrol ve 42 regresyon testi (0.407 s), worst exit 0. git diff --check başarılı. Bu kontroller gerçek analitik kurulumu veya kesinti testi değildir. Bağımsız inceleme ve aynı kaynak başındaki GitHub CI henüz bekleniyor.
