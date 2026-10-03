---
test_id: E-DEV-087
contract_id_version: "ADR013 Decision2; ilk iki iOS kanıtı v1"
subject_file: vault/PROFILES/ios-access-custody-proof.md
subject_digest: df3f659c08fd7f12edde33d4264fbbd5700cf12bc796d97817122fce330568b4
result: "RECORDED iki ayrı HELD; bağımsız tam inceleme ve CI bekleniyor"
evidence_links:
  - "vault/PROFILES/ios-access-custody-proof.md"
  - "vault/PACKS/P-E7-003a.md"
  - "vault/REGISTRY/T-E7-003a.md"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-086-E10-GOVERNED-PATHS-FOR-T-E7-003a.md.snapshot"
gate_verdict: "RECORDED belge kapsamı REVIEW; iOS ve gerçek emanet HELD"
reviewer: none
timestamp: 2026-10-03
purpose: iOS gerçek Mac erişimi ve Apple emaneti kanıtlarını ayrı ayrı kaydetmek
domain: ios-lane-readiness
module: e07-build-lane
owner: E7
implements: [ADR-013, ADR-008, ADR-007, C7.2, F7.2.1, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: ios-access-custody-proof
tasks: [T-E7-003a]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-03
depends_on: [V-E7-IOS-ACCESS-001]
used_by: [V-E7-IOS-ACCESS-001, P-E7-003a, T-E7-003a]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-087 ilk iki iOS kanıtının ayrı değerlendirmesi

Kabul edilmiş uygulama eb5a26abd5b5192c3b586740d1504efe4354aa82/v54 ve plan fa914f013fdcd032faed876689092da245989459. İlk pack480330c tam14alan/11yol yazıldı; alan4 sonundaki gereksiz boşluğu diff kontrolü yakaladı, artifact yazmadan önce62e0811 ile giderildi. Bu yazar biçim hatası CI veya bağımsız inceleme reddi değildir. Güncel pack temiz; noharddeps; yalnız belge kapsamı.

Mac/Xcode ve Apple certificate/profile/privatekey rotation/revocation/recovery/Connectroles ayrıntıları iki ayrı HELD değerlendirmeye bağlandı. Ödünç iPhone/VDS/Linux/CI/simülatör/örnekler sahiplik veya gerçek Mac erişimi sağlamaz. E6 politika sahibi, Android bağımsız; satın alma/hesap/anahtar/build/signing/store/device eylemi yok. Diğer üç iOS kanıtı ve yayın kararı eksik; ürün veya fiziksel hazırlık DONE iddiası yok.

Kaynak profil LF-normalize SHA256 588b4c84a7ecf0f0fede1b48e76d6620a941d60c0b0c3851734a10e14a0b4846. Ham v54 kopyası `vault/EVIDENCE/SNAPSHOTS/E-DEV-086-E10-GOVERNED-PATHS-FOR-T-E7-003a.md.snapshot`: 180901 byte; raw SHA256 b1590840e18c2a17839488b9c49ccb4a8d97398520c1bf5e6f38adff0902d3ae. Kaynak kabul edilmiş eb5a26abd5b5192c3b586740d1504efe4354aa82 içindeki `vault/INVENTORIES/E10-GOVERNED-PATHS.md` blobu; arşiv ile byte eşit, aynı ham SHA256. Ham hash ölçümünde satır sonları normalize edilmedi. Rawv54/workingv55/catalog40179/bütün önceki kabul yolları/pending13-23-25 korunacak; EDEV086 yalnız tüketici+gerçek ikincilPR88receipt, birincilsubject/reviewer/verdict/history değişmez.

Yazar kontrolleri, mevcut kaynak CI ve ayrı gpt6luna/max bütün görev incelemesi henüz bekleniyor. Ortak kör nokta: iki HELD değerlendirme kaydını gerçek Mac veya Apple emaneti kanıtı sanmak; bağımsız incelemeci canonical kabul ve fiziksel eksikleri karşılaştırmalı. İngilizce eski kayıtlar korunur; yeni açıklamalar Türkçe.

## Yazar kontrolü ve düzeltme geçmişi

İlk yerel run_all 42 regresyonu geçirdi (0.420s), fakat check_links yeni profilde HELD etiketi için kayıt adresi eksikliğini yakaladı, worst exit1. Hatanın ayrıntılarını kaydetmek için bir kez daha çalıştırıldı ve aynı bağlantı eksiği teyit edildi. Profilin kayıt adresleri eklendi; politika, gerçek kanıt durumları ve kod değişmedi. Bu kaynak daha bağımsız incelemeye gönderilmedi; düzeltme bağımsız ret değildir. İlk profil özeti588b4c84a7ecf0f0fede1b48e76d6620a941d60c0b0c3851734a10e14a0b4846 tarihsel; düzeltmenin güncel özeti c3b458cef88f98355ad4db17e7746fcf49a74dc099e96fbc51da5d19f2be6b21.

Kaynak satır karşılaştırmasında ADR008 Decision4–8 adresi tam64–71 olarak düzeltildi; anlam ve kanıt durumları değişmedi. Profilin güncel LF özeti df3f659c08fd7f12edde33d4264fbbd5700cf12bc796d97817122fce330568b4.

Manuel kaynak denetimi PASS: ilk iki özgün koşul kaynak semicolon ayrımıyla eşleşti; iki ayrıHELD, dokuz sabit pin, rawv54byte/hash, tam11yol, EDEV086öncekibirincil/reviewer/verdict, Androidprofili/E6kaynakları/kod/test/workflow değişmez. Düzeltme sonrası12kontrol+42regresyonPASS0.431s/worst0/build80/routingREVIEW/diffPASS. Son satır adresi düzeltmesi kaynak doğruluğu için yapıldı; bağımsız FULL/currentCI bekleniyor.
