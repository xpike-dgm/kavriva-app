---
test_id: E-DEV-101
version: 1
contract_id_version: "SCR-009/010; C1.2/F1.2.1/FL1.2.1 discovery v1"
subject_file: modules/e01-app/internal/shell/lib/guide_discovery.dart
subject_digest: 7f20cae9a4055961a6d69a56c282f5030db6d5a5cafcb3b8156bf9ad2dbac3b4
result: "RECORDED discovery sunumu; bağımsız kabul bekleniyor"
evidence_links: [vault/PROFILES/guide-discovery-render.md, vault/PACKS/P-E1-005a.md, vault/REGISTRY/T-E1-005a.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-100-E10-GOVERNED-PATHS-FOR-T-E1-005a.md.snapshot, modules/e01-app/internal/shell/lib/guide_discovery.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e01-app/internal/shell/test/fixtures/discovery_reading_questions.json]
gate_verdict: "RECORDED kaynak REVIEW; üretim/cihaz/yayın HELD"
reviewer: none
timestamp: 2026-10-04
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
depends_on: [V-E1-DISCOVERY-001]
used_by: [V-E1-DISCOVERY-001, P-E1-005a, T-E1-005a]
evidence: []
supersedes: []
status: RECORDED
---

# İşi bulma ve rehber kapsamı sunumu

T-E1-005a; C1.2/F1.2.1/FL1.2.1/SCR-009/010. TaskDiscoveryView kullanıcının kendi sözleriyle iş arama isteğini taşır; boş sorgu reddedilir. Seçim yalnız rehber kapsamını açmak için immutable aday isteğidir. Rehber seçmek uygunluk, hazırlık veya yeni erişim hakkı üretmez. Yerel sorgu değişince önceki sonuç açılmaz; sonuç ancak güncel, aynı motosiklet/revizyon/sorgu, hata/busy yoksa kullanılabilir. Başka bağlamdaki aday saklanır. Aynı bağlamdaki parent güncellemesi kullanıcının metnini silmez; motor/revizyon değişince eski sorgu taşınmaz. Callback yoksa açık kullanılamaz; kendi kendine arama veya kayıt yok.

GuideScopePreview kapsamı ve kapsam dışını, seçili motosiklet ve rehberi gösterir. Kapsam eksik/eski/yanlış bağlamdaysa olumlu fit yolu açılmaz. Kabul edilmiş MotorcycleFitView aynı E1 kapsülü içinde tekrar kullanılır; yalnız eşleşen güncel kaynak kanıtıyla ayrı hazırlık isteği, eksik/eski durumda yeniden ayrım/öğrenme/bilgi düzenleme. Öğrenme fiziksel uygulama değildir, uygunluk başarı veya şimdi hazır olma garantisi değildir. SCR011/012/013 içerikleri, gerçek E3 arama/fit/kimlik/entitlement/DB/upload/native/yayın bu sunumun dışında ve HELD. E1 otorite üretmez; E3 hizmet/E5 izin/E4 gerçek kayıt sorumluluğu değişmez. Beş sekme korunur; yeni rehber sekmesi veya sınır/publiccontract yok.

Kanonik dokuz what/why/next soru JSON'u pack35e8bea ile koddan önce sabitlendi. Bağımsız ilk okuyucu yalnız gerçek altı PNG ve soru setini görür; kod, plan veya cevap anahtarı verilmez. AI okuyucu gerçek insan/cihaz kullanılabilirliği kanıtı değildir. Dış yardım/yanlış cevap metin bulgusudur; CON004 yeterliliği bütün bağımsız incelemede ayrıca değerlendirilir. Hiçbir kabul kapısı yalnız yeşil testlerle kapanmaz.

BR106107/R012: plain Türkçe, keyboard/IME, semantik açıklama/disabled ve liveRegion; gerçek320390768×scale1/2/3 scroll ve en az52 kontrol, actualpaint contrast. Altı390×844 gerçek Flutter PNG üst/alt kaydırılmış hâlleri açıldı. Teknik adım/medya/tork veya uyumluluk uydurulmadı. REF-GUIDE001D01D02 binary repo içinde yok; kabul edilmiş metin hiyerarşisi kullanılır, pixelperfect/nihai tasarım tokenı iddiası yok. Üretim kaynaklar/kimlik/E3R1/E5-003/PR47-57-59/retliPR97/gerçek cihaz/fiziksel/yayın HELD kalır.

Yerel64 test PASS (15 yeni+optionalPNG1+eski48); CI capture kapalı63. Strict format10dosya0değişim .13s; analyze0issue9.3s. İlk test dosyasında yanlış aiUsta enum adı analyze3error10.6s ile bulundu; gerçek assistance düzeltildi. Bir test çağrısı kökte test dizini olmadığı için çalışmadı; doğru paket dizininde bütün64 PASS. Önceki test veya kanıtlar silinmedi.

## Kaynak kimliği ve gerçek kontroller

Başlangıç kabul main 22d9b623d4ad07f86fc1327343f4e82e4033de58/PR102; planfa914f013fdcd032faed876689092da245989459; run_all12+42PASS .401s. Pack35e8bea önce, kod d8f75b9ea624da54e667513788c2e3105aeb96f4. Kod LF SHA256 7f20cae9a4055961a6d69a56c282f5030db6d5a5cafcb3b8156bf9ad2dbac3b4; test 3b45308621d107d7b2535f59e28676204773672654e0d511aba9972c30647e6f; sabit9soru 0fa8c7338a96f56999eed9b36f4da9336ca8bfef439873946a03c4694a58862d. Hamv67 195513bayt/rawSHA256 e2e324afef1bd697fbe526f651c686b79e2d172a4827a362b360583e3dc6391f; Gitblob byte eşit arşiv. v68/93kayıt yalnız aday; kabul89/kalan117/206 değişmez.

- Temp discovery-top PNG SHA256 9e977cd960b3a01497f35826161ac70fa479c22c69a8c1847a33091ce73c5b1f
- Temp discovery-bottom PNG SHA256 9e977cd960b3a01497f35826161ac70fa479c22c69a8c1847a33091ce73c5b1f
- Temp current-preview-top PNG SHA256 97094a2ae92348ce064311cd2e07f01753ddf647a3a9646217774118f2b0d061
- Temp current-preview-bottom PNG SHA256 a8d0ef43cdb0e5c2e0f927eff9d66fa32240d05fc7914e57ea84feb731f1c870
- Temp missing-preview-top PNG SHA256 9ce8eabb0164b5577b9199d2f3b557940c1ace1b7f58a4fa12d509352b608ee6
- Temp missing-preview-bottom PNG SHA256 08e7d12ead22e565abad2fb76376b9ac8778050fa2b2b13106b2baf8ada94753

Bütün inceleme, aynı kaynak CI/T3 ve ayrı final6metadata inceleme/aynı finalCI henüz bekleniyor; DONE veya merge yok. İlk okuyucu gerçek cevapları ayrı makbuzla eklenecek. Önceki EDEV100 birincil gövde/codehash/reviewer/verdict/failurehistory korunur.


Profil `vault/PROFILES/guide-discovery-render.md`; pack `vault/PACKS/P-E1-005a.md`; görev `vault/REGISTRY/T-E1-005a.md`; kanıt `vault/EVIDENCE/E-DEV-101.md`.
## Bağımsız ilk okuma — gerçek cevap makbuzu

Kaynak d8f75b9ea624da54e667513788c2e3105aeb96f4. /root/e1005a_blind_reading, gpt-6-luna/max ayrı ve geçmişsiz görevlendirme; yalnız altı gerçek PNG ve koddan önce sabitlenen dokuz soruya erişim. Kod/plan/cevap anahtarı/teknik açıklama verilmedi. AI okuma denemesi, insan veya gerçek cihaz testi değildir. Aşağıdakiler incelemecinin gerçek cevaplarıdır:

- 009-what — Bu ekranda yapmak istediğim işi bulmaya çalışıyorum; işi kendi sözlerimle arayabilir ve bir rehberin kapsamına bakabilirim. Ekranda “Yapmak istediğin işi bul” ve “İşi kendi sözlerinle yaz” deniyor.
- 009-why — Hayır. Rehberi seçmek yalnızca kapsamını açıyor; motosiklete uygunluk ve hazırlık ayrıca kontrol ediliyor.
- 009-next — İşi farklı sözcüklerle yeniden arayabilirim. Eski sonuçla devam etmemem, güncel sonuç istemem gerektiği yazıyor.
- 010-fit-what — Örnek motosiklet için “Örnek bakım kontrolü” rehberi. Kapsamı “Neleri kapsar?” ve “Neleri kapsamaz?” bölümlerinde görebilirim; ilki kontrolün amacını ve gereken bilgileri, ikincisi kapsam dışındakileri anlatıyor.
- 010-fit-why — Hayır. Sonuç yalnızca bu motosiklet ile rehberin uygunluğunu gösteriyor; işin başarılı olacağını veya şu anda hazır olduğumu garanti etmiyor.
- 010-fit-next — Fiziksel işe geçmeden “Hazırlığı görüntüle” seçeneğine bakıp gerekli hazırlık ve güvenlik kontrollerini tamamlamalıyım. Ekran, rehberin doğrudan uygulama adımları olmadığını da belirtiyor.
- 010-missing-what — Bilgi yetersiz veya güncelliği doğrulanmamış; kaynak durumu güncel değil ve yeniden kontrol gerekiyor. Bu motosiklete özel uygulama kapalı.
- 010-missing-why — Öğrenme görünümü yalnızca bilgi içeriyor; motosiklette uygulanacak bir adım olarak sunulmuyor. Ekranda motosiklete özel uygulamanın kapalı olduğu da belirtiliyor.
- 010-missing-next — “Ayrımı yeniden çöz” seçeneğiyle yeniden kontrol etmeliyim. Ekran, yakın yılın adımlarını kullanmamamı söylüyor.

İncelemeci ek dış açıklama veya yardım gerektiren soru görmediğini belirtti. Dokuz soru kimliği eksiksiz cevaplandı; cevaplar görünen what/why/next anlamlarıyla eşleşiyor. Bu değerlendirme uygulayıcının kontrolüdür; CON004 kapsam/yöntem/kabul yeterliliğinin bütün bağımsız hükmü hâlâ bekleniyor. Bir insan araştırması veya üretim kullanılabilirliği onayı uydurulmadı. Cevapları ekleyen metadata kaynak başlığı değişse de kod/test/soru ve PNG özetleri d8f75b9 ile aynı; sonraki tam inceleme bu izlenebilirliği ayrıca doğrular.


## Gerçek sunum karşılaştırmaları

| Karşılaştırma | Gerçek kontrol ve sınır |
|---|---|
| Tam ekran | Altı actual390×844 üst/alt kaydırılmış PNG açıldı; arama, kapsam ve current/missing uygunluk metinleri ile ayrı eylemler incelendi; ekran kırpma/composite yok |
| Ekranlar arası | Kabul edilmiş ilk kullanım ve ayrım/fit sunumuyla aynı kapsül/shell, aynı metin ve kontrol yaklaşımı; rehber seçme≠uygunluk≠hazırlık anlamı incelendi. Gerçek ürün routing yok |
| Durumlar arası | Boş sorgu, eski/başka sorgu/motor/revizyon, yanlış aday, callbackyok, busy/error, kapsam yok/eski/yanlış rehber ve fit missing/stale/wrongcontext negatifleri gerçek widget testleri |
| Duyarlı Türkçe | Arama ve iki önizleme320390768×1/2/3; actual scroll/son kontrol alanı>=48, uzun Türkçe açıklamalar; nihai breakpoint/cihaz kararı değil |
| Erişilebilirlik | IME/Search, Tab/Enter, enabled/disabled Semantics, liveRegion, gerçek kenar/zemin/metin kontrastı; native screenreader/voice/gerçek cihaz HELD |
| Regresyon | Eski48 widget test aynı ve PASS; yeni15+optionalPNG1 ile64; eski kod/test/toolchain/publock/YAML değişmez |
| Kanonik referans ve anlaşılabilirlik | SCR009010/REF-GUIDE001D01D02 kabul metin hiyerarşisi; binary repo içinde yok, pixelperfect yok. Koddan önce9sabit CON004 soru; ayrı kör AI okuyucu9cevap, insan/device proof değil; yöntem/kabul yeterliliği bütün bağımsız inceleme bekler |

Hazırlık okumalarında kökte checks/build_index.py bulunmadı; doğru adres modules/e10-graph/checks/build_index.py kullanıldı. Bu bir ürün/test başarısızlığı değildir; gizlenmez. Strict format10dosya0değişim .13s/analyze0issue9.3s ve gerçek bütün64PASS kaydı mevcut.

Gerçek kaynak kayıt kontrolleri: build_index93rows; routing REVIEW/excluded ve eligibleboş; run_all12checks+42regresyonPASS .404s/worstexit0; git diff --check PASS. Yeni görev henüz kabul sayacına alınmadı.
