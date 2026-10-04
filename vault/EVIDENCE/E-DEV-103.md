---
test_id: E-DEV-103
version: 1
contract_id_version: "SCR-013; C1.2/F1.2.1/FL1.2.1 teaching v1"
subject_file: modules/e01-app/internal/shell/lib/teaching_only.dart
subject_digest: 00034099fdb7a93b09301b88e6851215e35a23bcf50a395fed07920e525d215a
result: "RECORDED öğrenme sunumu; bağımsız kabul bekleniyor"
evidence_links: [vault/PROFILES/teaching-only-render.md, vault/PACKS/P-E1-005c.md, vault/REGISTRY/T-E1-005c.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-102-E10-GOVERNED-PATHS-FOR-T-E1-005c.md.snapshot, modules/e01-app/internal/shell/lib/teaching_only.dart, modules/e01-app/internal/shell/test/teaching_only_test.dart, modules/e01-app/internal/shell/test/fixtures/teaching_reading_questions.json]
gate_verdict: "RECORDED kaynak REVIEW; üretim/cihaz/yayın HELD"
reviewer: none
timestamp: 2026-10-04
purpose: Öğrenme bilgisini fiziksel uygulamadan açıkça ayrı sunmak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, C1.2, F1.2.1, SCR-013, BR-001, BR-003, BR-005, BR-084, BR-088, BR-093, BR-094, BR-105, BR-106, BR-107, CON-001, CON-002, CON-003, CON-004, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: teaching-only-presentation
tasks: [T-E1-005c]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [V-E1-TEACHING-001]
used_by: [V-E1-TEACHING-001, P-E1-005c, T-E1-005c]
evidence: []
supersedes: []
status: RECORDED
---

# Yalnız öğrenme sunumu

T-E1-005c; C1.2/F1.2.1/FL1.2.1/SCR013. Konunun amacı, genel veya eşleşen motosiklet bağlamı, kaynak/sürüm/yer/kontrol zamanı ve güncellik, yalnız açıklayıcı kavramlar gösterilir. Öğrenme etiketi görünür; okuma, geri dönüş veya yeniden kontrol isteği fiziksel işlem/uygunluk/hazırlık/tamamlanma üretmez. Kaynağın güncel olması garantisi değildir. Yalnız iki niyet: uygunluk ve hazırlığı yeniden kontrol et, önceki ekrana dön. Fiziksel adım, checkbox, adım ilerletme, başlatma veya tamamlandı yok.

Genel açıklama seçili motosiklete uygulanabilirlik gibi sunulmaz; özel konu motor/rehber/bağlam revizyonuyla tam eşleşmelidir. Boş veya başka bağlamda konu ve özel kaynak/metni saklanır; güncel bağlam/null eski konu kimliği ile kontrol istenir. Kavram/kaynak metinleri boş olamaz, kavram kimlikleri eşsizdir ve liste immutable. Çağıran teknik metnin sınıflamasından sorumludur; E1 teknik içerik, doğrulama veya otorite üretmez. Üretim içerik sağlayıcısı/sınıflayıcısı yok. Metin-only kapsam; medya/kamera/ses/üretim routing HELD.

Offline/eski/bilinmeyen/kaynaksız açıklama okunabilir, güncel değerlendirme veya uygulama izni değildir. Meşgulken iki niyet de kapalı; işleyici yoksa ilgili düğme açıkça devre dışı. Hata açıklamasıyla tekrar kontrol mümkün, okuma korunur. E1 kapsülü içindeki VariantContext kullanılır, yeni publiccontract veya crosscapsuleprivate seam yok. Gerçek kimlik/E3R1/E5-003/Supabase47-57-59/RET97/cihaz/fiziksel/yayın bağları HELD.

Koddan önce ec5eae4 paket ve dokuz sabit soru donduruldu. Kod ve son test bd340ff3815277828cb19a3f225cd48587b0aaa5. Flutter3.47.0/Dart3.13.0 mevcut sabitSDK, pubget --enforce-lockfile başarılı; 24paket/21hosted/3SDK ve lock değişmedi. Son strictformat14dosya0değişiklik .58s, analyze0issue21.7s, bütün90PASS yaklaşık14s:80eski+9yeni+yerelPNG1. CI capture kapalıyken89 beklenir; henüz CI sonucu değildir.

Gerçek ilk iki test başarısızlığı gizlenmez: ilk run89PASS/1FAIL devre dışı düğme Semantics viewport dışında isHidden olduğundan; gerçek ensureVisible+pump ile görünür kontrol üzerinde aynı enabled/button beklentisi korundu. İkinci run89PASS/1FAIL SemanticsHandle addTearDown ile Flutter son doğrulamasından sonra kapanıyordu; test içinde try/finally dispose ile yaşam süresi düzeltildi. Üretim kodu ve beklenen güvenlik davranışı değişmedi. Son90PASS ve beşPNG yeniden üretildi/açıldı. İlk/fixed/verified analyze ve test logları Temp kavriva_e1005c_*_analyze.txt/*_test.txt olarak korunur.

Dokuz anlamlı test: veri koşulları/immutable; genel etiket ve yalnız iki güncel niyet; current/stale/unknown/sourcegap×offline; eksik/yabancı motor/rehber/revizyon saklama; nohandler/busy/error ve gerçek disabled Semantics; gerçek TabEnterSpace;320390768×1/2/3 ve kaydırma/≥52; gerçek paint metin≥4.5/border≥3/liveRegion; parentcontext değişince eski özel açıklama saklama. Bütün önceki80test ve kod, SDK/publock/YAML değişmedi. Yerel görseller gerçek Flutter390×844 örtüşen viewportlar; SDKRoboto yalnız test yakalama girdisi, font politikası değil.

REF-GUIDE001D05 çalışma kısıtıdır; binary repoda yok, pixelperfect/blueKlogo/finaltoken/font/modal/bottomnavpolicy iddiası yok. Kaynak binary provenanceSHA256 5ae0c6eedecdbfc61054680caa37aaa70940c02b08b3174c5752dfb2aa7fe770, mevcut resim kanıtı değildir. U04 direct yalnız SCR014; öğrenme ekranına taşınmadı. İnsan/gerçek cihaz kullanılabilirliği ve üretim içerik bağlılığı bu kanıtın dışında.

## Kaynak kimliği

Base b2d003f182d948f210fa9b4438acb9068e0765a3/PR104/planfa914f013fdcd032faed876689092da245989459; main8SUCCESS/baseline12+42PASS. CodeLF 00034099fdb7a93b09301b88e6851215e35a23bcf50a395fed07920e525d215a; testLF 9471e88e034410c217cd5446c35c31fa6afc2ad62d01e86b3bf540736e9ba66d; frozen9questions 20f7e299625f9566e1efc0cfbfbe058c16e8899ae4ffc1a3f1915175e7a067e0. Rawv69 198395bayt/SHA256 789787a5bf63154ed309e5cd6c7a13b91373563befeb39c6ea3934832db6cd4a/Gitblobbyteeşit. v70/95 yalnız aday; kabul91/kalan115/206 değişmedi.

- Temp kavriva_e1005c-missing-0.png PNG SHA256 539a6243fa571c8e51a4ac6ce04004f9ea14aebf0705d816d1b14c2c2e33713a
- Temp kavriva_e1005c-reference-0.png PNG SHA256 e26b605dc6a0a0e37ec02c164b287d59ec47bdaca50759f1e2da07290b88fb2d
- Temp kavriva_e1005c-reference-1.png PNG SHA256 71a2752d4b1b172270c7e82e5729436fe621092d8570a17d3904e0706b68ada1
- Temp kavriva_e1005c-stale-offline-0.png PNG SHA256 e1f7cde0c0d46ae2ebfbf8b17d2d9e0cb364cd20cb2d13e7952fce8099915f7a
- Temp kavriva_e1005c-stale-offline-1.png PNG SHA256 91de4cb86020f94bef40c7a097c058ac7b6b03ffd414bfe577ac5ec1b2ff0f4f

## Yedi tasarım karşılaştırması

| Kapı | Gerçek karşılaştırma ve sınır |
| --- | --- |
| Bütün ekran | reference0/1 ve staleoffline0/1 örtüşen tam kaydırma, missing0; üst etiket/amaç/kaynak/kavram/iki niyet okunur. İşlem adımı/tamamlanma yok. |
| Ekranlar arası | Gerçek kabul edilmiş kavriva_e1005b-ready-0.png ve kavriva_e1005a-current-preview-top.png ile yeniden açılarak karşılaştırıldı; açık zemin/koyu metin/bağlam/güvenlik ayrımı aynı, öğrenmede ready/start veya fit sonucu yok. |
| Durum | Genel kaynak güncel olsa da uygulanabilirlik değil; staleoffline açıklama korunup güncel kontrol olmadığı açık; missing başka bağlamı sızdırmaz. Busy/error/nohandler aynı koda bağlı widget testleri. |
| Duyarlı düzen |320390768×1/2/3 gerçek layout/kaydırma testleri, son iki niyet görünür ve bütün niyetler≥52;390×844 görseller örtüşür. Gerçek telefon kanıtı yok. |
| Erişilebilirlik |TabEnterSpace gerçek callback, disabled Semantics ve liveRegion; gerçek paint kontrast eşikleri. SDKtestfont nihai font veya yerel OS assistive kanıtı değil. |
| Regresyon |Eski80test aynı bütün çalıştırmada geçer; eski kod/test/SDK/publock/YAML baseeşit. Hamv69 ve önceki kanıt gövdesi korunur. |
| Referans |D05/SCR013 etiketi, öğrenme/uygulama ayrımı ve yeniden kontrol/geri dönüş; numaralı aktif talimat yok. D05binary bulunmadığından piksel/finalnavigation iddiası yok. |

## Bağımsız ilk okuma

Dokuz soruluk set koddan önce sabitlenmiştir. Geçmişsiz bağımsız AI yalnız soru ve beş gerçek PNG açmıştır; kod/plan/cevap anahtarı verilmemiştir. Aşağıdaki gerçek yanıtlar root tarafından yeniden yazılmaz. Tam görev incelemecisi yöntem ve kapsam yeterliliğini ayrıca değerlendirmelidir. AI görevlendirmesi runtime model doğrulaması veya insan/cihaz kullanılabilirliği kanıtı değildir.

İncelemeci /root/e1005c_blind_reading; geçmişsiz gpt-6-luna/max görevlendirmesi. Gerçek yanıt:

Bağımsız, geçmişsiz okuyucu olarak **dış yardım almadım**. Yanıtları yalnızca verilen soru dosyası ve beş PNG’ye göre verdim. Soru ve ekran metinleri okunaklıydı; yanıtları etkileyen bir belirsizlik yoktu.

1. **013-reference-what:** Bu, yalnızca öğrenme ve bilgi görünümüdür. Konunun kapsamını ve motosiklette uygulanabilirlikten farkını açıklar; motosiklette yapılacak bir işlem adımı değildir.
2. **013-reference-why:** Genel konu açıklaması, seçili motosiklet için uygunluğu veya gerekli hazırlıkların tamamlandığını doğrulamaz. Kaynağın bulunması ya da güncel olması da uygulamaya hazır olunduğu anlamına gelmez.
3. **013-reference-next:** “Uygunluğu ve hazırlığı yeniden kontrol et” seçeneğiyle kontrol isteyebilir veya “Önceki ekrana dön” seçeneğini kullanabilirsin. İstek göndermek kendiliğinden doğrulama ya da işlem başlatma değildir.
4. **013-stale-offline-what:** Çevrimdışıyken açıklamanın okunabilmesi, yalnızca açıklamanın gösterilebildiği anlamına gelir. Bağlantı yokken güncel değerlendirme yapılmış sayılmaz.
5. **013-stale-offline-why:** Önceki açıklama güncel uygunluk veya hazırlık kanıtı değildir; ayrıca fiziksel işlem talimatı ya da uygulama izni vermez. Yeniden kontrol gerekir.
6. **013-stale-offline-next:** Güncel kontrol için “Uygunluğu ve hazırlığı yeniden kontrol et” seçeneğini kullanabilirsin. Çevrimdışı okumak işi tamamlamaz; istek göndermek de kendiliğinden doğrulama veya işlem başlatma değildir.
7. **013-missing-what:** Ekran, bu bağlam için açıklama olmadığını; konu bilgisinin eksik olabileceğini veya seçili motosiklet ve rehberle eşleşmediğini söylüyor.
8. **013-missing-why:** Başka motosikletin açıklaması ya da yakın model tahmini bu bağlamla eşleştiği doğrulanmadığından burada doğru kabul edilemez.
9. **013-missing-next:** “Uygunluğu ve hazırlığı yeniden kontrol et” seçeneğiyle kontrol isteyebilir veya “Önceki ekrana dön” seçeneğini kullanabilirsin. Ekran, isteğin kendiliğinden doğrulama veya işlem başlatma olmadığını da belirtiyor.

**Açılan dosyalar:** Soru dosyası `C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app\modules\e01-app\internal\shell\test\fixtures\teaching_reading_questions.json` ve şu beş PNG: `C:\Users\Xpike\AppData\Local\Temp\kavriva_e1005c-reference-0.png`, `reference-1.png`, `stale-offline-0.png`, `stale-offline-1.png`, `missing-0.png`. Örtüşen `reference` ve `stale-offline` görüntülerini birlikte okudum.

**PNG SHA256:**

- `reference-0.png`: `E26B605DC6A0A0E37EC02C164B287D59EC47BDACA50759F1E2DA07290B88FB2D`
- `reference-1.png`: `71A2752D4B1B172270C7E82E5729436FE621092D8570A17D3904E0706B68ADA1`
- `stale-offline-0.png`: `E1F7CDE0C0D46AE2EBFBF8B17D2D9E0CB364CD20CB2D13E7952FCE8099915F7A`
- `stale-offline-1.png`: `91DE4CB86020F94BEF40C7A097C058AC7B6B03FFD414BFE577AC5EC1B2FF0F4F`
- `missing-0.png`: `539A6243FA571C8E51A4AC6CE04004F9EA14AEBF0705D816D1B14C2C2E33713A`

Verilen kaynak revizyonu: `bd340ff3815277828cb19a3f225cd48587b0aaa5`; kod açarak doğrulamadım. Dosya değiştirmedim ve test çalıştırmadım. Bu AI okuması gerçek insan veya cihaz kullanılabilirliği kanıtı değildir.


Bütün bağımsız kaynak hükmü/sameCI/T3 ve ayrı sonmetadata hükmü/finalCI bekleniyor.


`vault/PROFILES/teaching-only-render.md`; `vault/PACKS/P-E1-005c.md`; `vault/REGISTRY/T-E1-005c.md`; `vault/EVIDENCE/E-DEV-103.md`.
