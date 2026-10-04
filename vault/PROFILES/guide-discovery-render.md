---
record_id: V-E1-DISCOVERY-001
version: 1
purpose: Yapılacak işi bulmayı ve rehber kapsamını anlaşılır biçimde sunmak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, C1.2, F1.2.1, SCR-009, SCR-010, BR-001, BR-003, BR-005, BR-009, BR-010, BR-036, BR-081, BR-082, BR-083, BR-105, BR-106, BR-107, CON-004, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: guide-discovery-presentation
tasks: [T-E1-005a]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E1-001, M-E3-001, M-E5-001, M-E4-001, I-E10-PATHS-001, V-CI-001, V-E1-VARIANT-001]
used_by: [P-E1-005a, T-E1-005a, E-DEV-101]
evidence: [E-DEV-101]
supersedes: []
status: ACTIVE
---

# İşi bulma ve rehber kapsamı sunumu

T-E1-005a; C1.2/F1.2.1/FL1.2.1/SCR-009/010. TaskDiscoveryView kullanıcının kendi sözleriyle iş arama isteğini taşır; boş sorgu reddedilir. Seçim yalnız rehber kapsamını açmak için immutable aday isteğidir. Rehber seçmek uygunluk, hazırlık veya yeni erişim hakkı üretmez. Yerel sorgu değişince önceki sonuç açılmaz; sonuç ancak güncel, aynı motosiklet/revizyon/sorgu, hata/busy yoksa kullanılabilir. Başka bağlamdaki aday saklanır. Aynı bağlamdaki parent güncellemesi kullanıcının metnini silmez; motor/revizyon değişince eski sorgu taşınmaz. Callback yoksa açık kullanılamaz; kendi kendine arama veya kayıt yok.

GuideScopePreview kapsamı ve kapsam dışını, seçili motosiklet ve rehberi gösterir. Kapsam eksik/eski/yanlış bağlamdaysa olumlu fit yolu açılmaz. Kabul edilmiş MotorcycleFitView aynı E1 kapsülü içinde tekrar kullanılır; yalnız eşleşen güncel kaynak kanıtıyla ayrı hazırlık isteği, eksik/eski durumda yeniden ayrım/öğrenme/bilgi düzenleme. Öğrenme fiziksel uygulama değildir, uygunluk başarı veya şimdi hazır olma garantisi değildir. SCR011/012/013 içerikleri, gerçek E3 arama/fit/kimlik/entitlement/DB/upload/native/yayın bu sunumun dışında ve HELD. E1 otorite üretmez; E3 hizmet/E5 izin/E4 gerçek kayıt sorumluluğu değişmez. Beş sekme korunur; yeni rehber sekmesi veya sınır/publiccontract yok.

Kanonik dokuz what/why/next soru JSON'u pack35e8bea ile koddan önce sabitlendi. Bağımsız ilk okuyucu yalnız gerçek altı PNG ve soru setini görür; kod, plan veya cevap anahtarı verilmez. AI okuyucu gerçek insan/cihaz kullanılabilirliği kanıtı değildir. Dış yardım/yanlış cevap metin bulgusudur; CON004 yeterliliği bütün bağımsız incelemede ayrıca değerlendirilir. Hiçbir kabul kapısı yalnız yeşil testlerle kapanmaz.

BR106107/R012: plain Türkçe, keyboard/IME, semantik açıklama/disabled ve liveRegion; gerçek320390768×scale1/2/3 scroll ve en az52 kontrol, actualpaint contrast. Altı390×844 gerçek Flutter PNG üst/alt kaydırılmış hâlleri açıldı. Teknik adım/medya/tork veya uyumluluk uydurulmadı. REF-GUIDE001D01D02 binary repo içinde yok; kabul edilmiş metin hiyerarşisi kullanılır, pixelperfect/nihai tasarım tokenı iddiası yok. Üretim kaynaklar/kimlik/E3R1/E5-003/PR47-57-59/retliPR97/gerçek cihaz/fiziksel/yayın HELD kalır.

Yerel64 test PASS (15 yeni+optionalPNG1+eski48); CI capture kapalı63. Strict format10dosya0değişim .13s; analyze0issue9.3s. İlk test dosyasında yanlış aiUsta enum adı analyze3error10.6s ile bulundu; gerçek assistance düzeltildi. Bir test çağrısı kökte test dizini olmadığı için çalışmadı; doğru paket dizininde bütün64 PASS. Önceki test veya kanıtlar silinmedi.


Profil `vault/PROFILES/guide-discovery-render.md`; pack `vault/PACKS/P-E1-005a.md`; görev `vault/REGISTRY/T-E1-005a.md`; kanıt `vault/EVIDENCE/E-DEV-101.md`.

## Bütün kaynak kabulü

Bağımsız /root/e1005a_discovery_full_review, gpt-6-luna/max geçmişsiz ayrı görevlendirme; exact 30b95de8a8b126405cad3875cb0a10798642af59 FULL PASS. Tam SCR009/010 discovery render ve CON004 sabit soru/ilk okuyucu yöntemi kabul kapsamında ayrıca değerlendirildi. Kör okuyucu9gerçekcevap yalnız6ekran+questions; kaynakd8f75b9 ile sourcekod/test/questions byteeşit. AIreader insan/gerçek cihaz usability attestation değildir. Sahip DEC0069 ve sürekli yetkiyle ayrı inceleme alt ajanını kabul etti; görevlendirme runtime modelattestation değildir. Actualsource17/17CI ve gerçekPRT3five/checkssevenSUCCESS ayrıca kaydedildi.

Tam kanonik sunum görevi kabul adayı; son altı metadata incelemesi ve aynıfinalCI/T3 hâlâ beklenir. Henüz merge/main sayacı artışı yok. Üretim/E3R1/E5-003/PR47-57-59/retliPR97/gerçek cihaz/fiziksel/yayın HELD. Eski bekleyiş/hatalar/kanıt gövdesi tarihsel olarak korunur; SDK/publock/YAML/oldcode-test/rawv67/previousEDEV100primarybody değişmez.
