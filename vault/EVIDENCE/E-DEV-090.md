---
test_id: E-DEV-090
contract_id_version: "ADR013 Decision3; yedi görev ve beş sağlayıcı sahipliği yasağı v1"
subject_file: vault/PROFILES/lane-separation-check.md
subject_digest: 208b245726263d3688f70f8684e6716a50e05cdfe9419066b736cc8c2aec35af
result: "RECORDED sorumluluk ayrımı kaydı; bağımsız tam inceleme ve CI bekleniyor"
evidence_links:
  - "vault/PROFILES/lane-separation-check.md"
  - "vault/PACKS/P-E7-004.md"
  - "vault/REGISTRY/T-E7-004.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-089-E10-GOVERNED-PATHS-FOR-T-E7-004.md.snapshot"
gate_verdict: "RECORDED belge kapsamı REVIEW; gerçek hat ve fiziksel bağımsızlık HELD"
reviewer: none
timestamp: 2026-10-04
purpose: Derleme, imza ve yayın görevlerinin ayrı sorumluluklarını kontrol etmek
domain: lane-responsibility-separation
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.3, F7.3.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: lane-separation-check
tasks: [T-E7-004]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [V-E7-SEPARATION-001]
used_by: [V-E7-SEPARATION-001, P-E7-004, T-E7-004]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-090 derleme ve yayın sorumluluklarının ayrımı

Kabul edilmiş uygulama 2d3d38a786f5fa1c40192aa4c6128b2fe2e11aa8/v57 ve plan fa914f013fdcd032faed876689092da245989459. Pack7d4e707 kaydındaki F7.2.1 eski feature metadata adresi artifact öncesi okumada saptandı ve yalnız pack düzeltmesi33d5eaa ile F7.3.1 yapıldı; tarihçe silinmedi. Tam14alan/11yol artifact öncesi doğru kaydedildi, diff kontrolü başarılı. Güncel pack temiz; noharddeps; yalnız belge kapsamı.

Yedi ayrı görevin mevcut kaynak deklarasyonları, beş sağlayıcı sahipliği yasağı ve E6 key-loss yönü karşılaştırıldı. Gerçek fiziksel kişi/anahtar/audit/hat bağımsızlığı HELD; logical identity/AIreview/CI/simülatör gerçek sonuç değildir. E6 politika sahibi, Android bağımsız; satın alma/hesap/anahtar/build/signing/store/device eylemi yok. Beş iOS koşulu ve güncel yayın kararı eksik; ürün veya fiziksel hazırlık DONE iddiası yok.

Kaynak profil LF-normalize SHA256 208b245726263d3688f70f8684e6716a50e05cdfe9419066b736cc8c2aec35af. Ham v57 kopyası `vault/EVIDENCE/SNAPSHOTS/E-DEV-089-E10-GOVERNED-PATHS-FOR-T-E7-004.md.snapshot`: 184074 byte; raw SHA256 6aa04f819cb1c6411a3b5f981a374c75dc1834072de68150c973dcd1d1e65692. Kaynak kabul edilmiş 2d3d38a786f5fa1c40192aa4c6128b2fe2e11aa8 içindeki `vault/INVENTORIES/E10-GOVERNED-PATHS.md` blobu; arşiv ile byte eşit, aynı ham SHA256. Ham hash ölçümünde satır sonları normalize edilmedi. Rawv57/workingv58/catalog40179/bütün önceki kabul yolları/pending13-23-25 korunacak; EDEV089 yalnız tüketici+gerçek ikincilPR91receipt, birincilsubject/reviewer/verdict/history değişmez.

Yazar kontrolleri, mevcut kaynak CI ve ayrı gpt6luna/max bütün görev incelemesi henüz bekleniyor. Ortak kör nokta: Deklarasyon ayrımı kaydını gerçek fiziksel kimlik/anahtar/yayın bağımsızlığı kanıtı sanmak; bağımsız incelemeci canonical kabul ve fiziksel eksikleri karşılaştırmalı. İngilizce eski kayıtlar korunur; yeni açıklamalar Türkçe.

Yazar kaynak kontrolü PASS: ADR013R3 üç özgün koşul, yedi ayrı deklarasyon, beş sağlayıcı sahipliği yasağı, gerçek kişi/anahtar/audit/hat HELD ve hiçbir yayın yetkisi verilmemesi, E6politika/E7uygulama/E3kaynak/Androidbağımsız/noownerdebug karşılaştırıldı. On iki immutablepin/profileLFhash/rawv57boyut-SHA-bayteşitliği/exact11paths/öncekiEDEV089primary/kod-policy-workflow ve üçiOSprofil korunması PASS. Runall12+42PASS0.433s/worst0/build83/routingREVIEW/diffPASS. Artifact öncesi eski feature metadata adresi yalnız pack checkpoint33d5eaa ile düzeltildi; İlk salt-okunur Temp kontrolü inline alıntıları yalnız satır başında aradığı için IndexError verdi; helper bütün üç tam alıntıya düzeltildi. İkinci salt-okunur kontrol iki ayrı tablodaki release approval satırını tek tabloda saydığı için assertion verdi; sayım yedi görev tablosuna sınırlandı. Profil iki düzeltmede de aynı kaldı. Bu bağımsız ret veya ürün test hatası değildir. Bağımsız bütün görev FULL ve bu kaynak başlığının CI sonucu bekleniyor.
