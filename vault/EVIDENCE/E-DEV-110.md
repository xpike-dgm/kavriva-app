---
test_id: E-DEV-110
version: 1
purpose: Bağımsız bakım kaydı ve itirazın kaynaklı sunumu
domain: history
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.6, F1.6.1, SCR-027, SCR-028, BR-057, BR-058, BR-059, BR-093, BR-094, BR-114, BR-115, BR-116, BR-120, BR-144, BR-145, BR-146, BR-150, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: record-dispute-presentation
tasks: [T-E1-012]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-06
depends_on: [V-E1-RECORD-001]
used_by: [V-E1-RECORD-001, P-E1-012, T-E1-012]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR-027/028; C1.6/F1.6.1/FL1.6.2 record-dispute v1"
subject_file: modules/e01-app/internal/shell/lib/record_dispute.dart
subject_digest: 68f833c099d0fffb329279f58d10773daf5e9d0297e775fe83a9f90eba04c3d0
result: "Yerel260normal/1native PASS; ilkoku ve bağımsız inceleme ile aynı GitHubCI-T3 bekleniyor"
gate_verdict: "RECORDED yerel kanıt; bağımsız inceleme bekleniyor, kabul değil"
reviewer: none
timestamp: 2026-10-06
evidence_links: [vault/PROFILES/record-dispute-render.md, vault/PACKS/P-E1-012.md, vault/REGISTRY/T-E1-012.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-109-E10-GOVERNED-PATHS-FOR-T-E1-012.md.snapshot, modules/e01-app/internal/shell/lib/record_dispute.dart, modules/e01-app/internal/shell/test/record_dispute_test.dart, modules/e01-app/internal/shell/test/fixtures/record_dispute_reading_questions.json]
---

# Bağımsız bakım kaydı ve itiraz sunumu

T-E1-012; yalnız SCR-027/028, C1.6/F1.6.1/FL1.6.2. Kanonik kabul: Standalone preserved; no-silent-winner. Tek sert bağımlılık T-E1-011 gerçek DONE; kabul edilen taban 2c104afed8d438dcd1d0c4ef12ef82537d623f91. Plan fa914f013fdcd032faed876689092da245989459 F1.6.1 kabul yöntemini SIMULATION olarak tanımlar. Bu sunum üretim kimliğini, yetkiyi, kayıt/itiraz servisini veya fiziksel işi tamamlamaz. SCR-029 ayrı görevdir; yeni sert bağımlılık eklenmedi.

Rehber dışında yapılan iş tarih/mesafe, kendim-hobi-dış servis, bildirilen tamamlandı-kısmi-çözülemedi sonucu, sonuç notu ve isteğe bağlı belge bağlamıyla ayrı tutulur. Bu seçimler kullanıcı beyanıdır; profesyonel/servis rolü ve belge otomatik doğrulama veya yetki üretmez. Kısmi ve çözülemeyen iş için açıklama gereklidir. UI gerçek dosya yüklemez ve bakım sayacı/rehber adımını ilerletmez.

İtiraz görünümü bugünkü değerlendirmeyi önce gösterir. İddia/aktör/kanıt/kaynak kartları ayrı kalır; bilinen ve açık kalan ayrılır. Kazanan, güven puanı veya doğrulanmış işçilik uydurulmaz. İnceleme varsa yalnız belirtilen iddia ve kanıt kapsamıdır. Yüksek riskte kaynak/inceleyen/bilinmeyenler görünür. Eski-yeni-zaman-gerekçe isteğe bağlı geçmiş bölümünde korunur; özel tarihsel alanın ayrı güncel okuma izni yoksa değerler ve gerekçe açılmaz.

HistoryScope/HistoryReference/HistoryRecord/HistoryRevision aynı E1 history sunumundan tüketilir. Yeni özel RecordDraft/RecordDispute/RecordEvidence/RecordSnapshot değerleri ve iç listeler/haritalar değişmezdir. Kapsam/istek/amaç/tam form girdisi veya bütün hedef üyelikleri-revizyonları-sınıflandırmaları bağlanır. Kimlik ayraçları, Unicode ve bozuk UTF16 kayıpsız ayrılır; boş kimlik/çift claim ID güvenli biçimde kapanır. Aktör seçimi principal veya güncel izin yerine geçmez.

Form ve itiraz okumaları dört güncel kaynak/izin boyutuna ve alan izinlerine bağlıdır. Eski/yabancı/held/izinli kopya referansları güncel üretim kaynağı yerine geçmez. Handler varlığı ALLOW değildir. Etkiler altı ayrı güncel motorcycle/source/authorization/policy/operationIntent/audit bağı gerektirir. Yerel düzenleme tam girdiyi değiştirir; dış üretici yeni tam girdiyi bağlamadan eski kaydetme izni kullanılamaz. Eski callback, yeni kapsam/istek/form/hedef/sınıflandırma ile çalışmaz. Kendi kanıtını geri çekme, tıklama anında mevcut kanıtın güncel okuma ve sahiplik referanslarını yeniden kontrol eder; yakalanmış eski izin kullanılamaz. Geri çekme diğer claim veya eski iz ve bağımsızlaşmış kopyaları silmez.

RecordIntent yalnız typed yerel niyettir; üretim yazısı değildir. Gönderim kilidi aynı istekte kaynak yenilense de korunur. Gerçek tap sonrası sent+idle bekleme durumu native ve duyarlı testlerde vardır. Failed/unknown/kanıtsız kayıt sonucu yalnız aynı isteğin sonucunu sorgular; yeni gönderim kapalıdır. İşlem sonucunun güncel kaynak+istek+tam konu bağı yoksa çıplak ALLOW başarı sayılmaz. Sonuç makbuzu fiziksel işi veya işçiliği doğrulamaz. Destek ve çıkış güvenli ayrı niyetlerdir. Motosiklet pasif/paket değişmiş olsa da temel kayıt/itiraz geçmişi geriye dönük kapanmaz; yeni etki ayrı izin gerektirir.

## Üretim sınırı

Mevcut E3 maintenance_api USER_REPORTED oluşturma ve düzeltme sınırındadır. Servis/belge/itiraz/geri çekme kaynak üreticisi, gerçek HTTP/kimlik, E5 güncel okuma/etki bağlayıcısı, dosya yükleme ve üretim niyet işleyicisi bu görevde yoktur. Olumlu kaynak ve sonuç durumları açık test girdileridir. Bu private widget ve manifest kayıtları çalışma zamanı bağlantısı değildir; yeni public seam/DB/Supabase/YAML/SDK/bağımlılık/router değişmedi. Üretim E3R1 REVIEW/E5-003 IN_PROGRESS, Supabase47/57/59, RET97, fiziksel cihaz/OS/ekran okuyucu ve yayın engelleri korunur.

## Gerçek yerel doğrulama

Kodöncesi 5da85fb57182a553031b7e298f1a877cdc190df6; kod/test 8aaf8081400d6b3d6234dcfd033081bfc80336fa. Kilitli pubget başarılı; güncel strictformat28dosya/0değişiklik ve analyze0sorun. R2 bütün normal260PASS=önceki241+yeni19; native ayrı1PASS. Tek261normal koşu iddiası yoktur. 40durum×320/390/768×1/2/3 =360 düzen gerçek tam kaydırma,52hedef ve fatalpointer ile denetlendi. Gerçek Tab/Enter/Space, form düzenleme ve düğme gönderimi, görünür input/düğme odağı, disabledSemantics/liveRegion, çizilmiş metin4.5/odak3 kontrastı, alan+semantik gizlilik ve eski callback/güncel izin/çift gönderim sınanmıştır.

Güncel121PNG/40durum390×844 tam kaydırmalı native çizimdir; fiziksel telefon veya bütün360kombinasyon görüntüsü değildir. Root R1'in121PNG'sini original açtı; R2'de değişen28PNG ayrıca original açıldı ve kalan93RAW SHA birebir R1 açılmış dosyalara eşit. Rootun bütün121R2'yi yeni açtığı iddia edilmez. Kaydırma her durumun0başlangıcı ve gerçek maxScrollExtentsonunu içerir. SDK Roboto test fontudur; nihai ürün fontu değildir. Sabit17kodöncesi soru değiştirilmedi.

## Korunan hata ve dar onarım geçmişi

İlk hedef18testin tamamı aynı gerçek runtime tür hatasına takıldı: iç Map.unmodifiable dynamic olarak çıkarılmıştı. İç ve dış map tipleri açık verildi; beklentiler gevşetilmedi. İkinci hedef18PASS. Boyanmış odak testi ilk koşuda gerçek mavi zemin üzerindeki koyu çerçeve kontrastını2.7165884449213253 buldu (gerekli3); birincil etkin düğmenin odak çerçevesi beyaz yapıldı. Gerçek Tab ve Space, metin/odak kontrastı ve kapalı sonuç kontrolleri onarım sonrası PASS. İlk260normal/R1native1PASS kendi sürümüne aittir.

Root R1 çiziminde iddia bulunmayan test örneğinin bilinen alanında iki iddia olduğunu söyleyen tutarsız test girdisini buldu. R2 örneği iddia sunulmadığını açıkça bildirir; aynı regresyon eski iki-iddia cümlesinin yokluğunu denetler. Ürün aktör açıklamasındaki oturum/izin uygulama dili kullanıcıya anlaşılır kayıt doğruluğu cümlesiyle değiştirildi. R2normal260/native1 yeni gerçek koşulardır; eski R1 ve hata günlükleri silinmedi.

## Yedi E10 tasarım kapısı — yerel kanıt ve açık inceleme

| Kapı | Gerçek yöntem ve sınır |
|---|---|
| Bütün ekran |121güncel parça R1original açımı+28R2original açımı+93RAW eşitliğiyle tam okunmuştur; destek/çıkış dahil tüm sonuna erişim. |
| Ekranlar arası | Kabul edilmiş T011 R2 detail-disputed0 gerçek original açıldı; aynı32/22/16tip/52hedef/açık zemin/çerçeveli ikincil eylem/kaynaklı belirsizlik. Form, claim karşılaştırması ve geçmiş anlamı farklı hiyerarşidir. |
| Durum |40örnek; aktör/sonuç/boş-geçersiz-düzenlenmiş form, izin kapanması, sent/busy/failed/unknown/kanıtlı-kanıtsız sonuç, itiraz/incelenmiş/çekilmiş/risk/özel geçmiş/claims yok/own revocation. Eşit PNG ayrı tasarım veya kesin arıza nedeni değildir. |
| Duyarlı düzen |360gerçek kaydırma;320/390/768×1/2/3 uzun Türkçe ve52hedef. Native yalnız390×844; cihaz ve nihai breakpoint kanıtı değil. |
| Erişilebilirlik | Gerçek Tab/Enter/Space, input/düğme görünür odak, Semantics/disabled/liveRegion, çizilmiş kontrast; OS/ekran okuyucu HELD. |
| Regresyon | Önceki241normal aynı260koşuda başarılı;34tabanpin, hamv76, eski esas gövdeler ve SDK/lock/YAML/eski kod/sorular korunur. |
| Kaynak/varyasyon | Plan I03/I04 gerçek original tekrar açıldı; belgeSHA eşit. Formda iş/aktör/bildirilen sonuç/not/opsiyonel kanıt; itirazda güncel anlam/iki ayrı claim/bilinen-açık kalan/geçmiş/ayrı etki. Logo/ikon/font/altbar/router/dosya/device/yayın kararları HELD. |

## Bağımsız inceleme henüz tamamlanmadı

Geçmişsiz GPT6LunaMax R1ilkoku alt ajanı kullanım sınırı hatasıyla durdu. Rapor dosyası oluşmadı,17soru onayı veya açılmış121görüntü iddiası yoktur. Bu başarısız girişim bir ret hükmü veya PASS değildir. Güncel R2 için yeni geçmişsiz17soru okuması, bütün kaynak bağımsız hükmü ve gerçek aynı CI/T3; sonra ayrı son6kayıt incelemesi/aynısonCI-T3 gerekir. İlk okuma/bağımsız inceleme beklemede; görev IN_PROGRESS kalır, merge edilmez. Yerel başarı GitHubCI değildir. Ana dal98DONE/108kalan/206 değişmez; adayv77/102generated kabul sayımı değildir. DEC0069+doğrudan sahip yetkisi geçerlidir, birleşmemiş DEC0070 kanonik kullanılmaz.

## Sabit kimlikler

KodLF SHA256 68f833c099d0fffb329279f58d10773daf5e9d0297e775fe83a9f90eba04c3d0; testLF SHA256 ff824b753daa0ce2a224cba0e4e0e9ffbb396656b6ea00f8057c720b75d562e4;17soruLF SHA256 2a823c7c1a30b146bdb98e3ab9011e999d4c4e8a5526939fe6608fe409d59928. Hamv76207939byte/RAW SHA2564467a7ed4e6b8c50b5385af6140de88e95a35e584cb2d1714d7d5a7e7c913046.

## Güncel görüntü kimlikleri

- kavriva_e1012_native_R2-form-self-0.png / form-self / RAW SHA256 a92682c9cbeb87ef0d88918ff672fd03bbafa42e40c877953c61e321dac10a18 / 57685byte /390×844 /offset 0.0/end 908.0
- kavriva_e1012_native_R2-form-self-1.png / form-self / RAW SHA256 7dde371ea409aceeb056078ac9a29498787d7ee7c6c8c70c490b16f8153c0eb8 / 62541byte /390×844 /offset 620.0/end 908.0
- kavriva_e1012_native_R2-form-self-2.png / form-self / RAW SHA256 017c810f14622f1f5c5fb84d3ca791fc525729544f7f3bc3626ea294e86d88a2 / 57606byte /390×844 /offset 908.0/end 908.0
- kavriva_e1012_native_R2-form-hobby-0.png / form-hobby / RAW SHA256 9228e7462e57ebb338b9be7478cfc3bc317a3b410d2da9f205ef61e99f16a28b / 57743byte /390×844 /offset 0.0/end 908.0
- kavriva_e1012_native_R2-form-hobby-1.png / form-hobby / RAW SHA256 3dbbbfe65cd04535b854c1c33005104f166036f33758b199e1e6f12cbc0be9e9 / 62762byte /390×844 /offset 620.0/end 908.0
- kavriva_e1012_native_R2-form-hobby-2.png / form-hobby / RAW SHA256 377d7a7ead4b0be4360a0f1d35b1152b472a6c60425ef6a2ba895f73d082dc62 / 57670byte /390×844 /offset 908.0/end 908.0
- kavriva_e1012_native_R2-form-service-0.png / form-service / RAW SHA256 35d80e1d66c426f259925affb5969e95bd25404f906e9f59f91afa26f93d6568 / 59036byte /390×844 /offset 0.0/end 1050.0
- kavriva_e1012_native_R2-form-service-1.png / form-service / RAW SHA256 990ab0f6153d5e577e9c7ff52ccb0f7b3240ddf12df71bf3a3b668aa4867090b / 60438byte /390×844 /offset 620.0/end 1050.0
- kavriva_e1012_native_R2-form-service-2.png / form-service / RAW SHA256 91c44ecc01b3e45e34e09dfd04889b9d3f03479fa0607cc0dbb182ec0573c4cc / 57712byte /390×844 /offset 1050.0/end 1050.0
- kavriva_e1012_native_R2-form-unresolved-0.png / form-unresolved / RAW SHA256 35d80e1d66c426f259925affb5969e95bd25404f906e9f59f91afa26f93d6568 / 59036byte /390×844 /offset 0.0/end 1050.0
- kavriva_e1012_native_R2-form-unresolved-1.png / form-unresolved / RAW SHA256 d18a76166e482a87791c9fefc43faac68dbd6cc2b798a7a9205281b66661a5c7 / 60443byte /390×844 /offset 620.0/end 1050.0
- kavriva_e1012_native_R2-form-unresolved-2.png / form-unresolved / RAW SHA256 f35c72a91f92448182a18ca3457e94839b12a464780a2499635c9fb0f741f086 / 57723byte /390×844 /offset 1050.0/end 1050.0
- kavriva_e1012_native_R2-form-empty-0.png / form-empty / RAW SHA256 16c97e2fcf720e17728a9ce48dfbe2fd130724c34025d1703192e959ed87d047 / 54162byte /390×844 /offset 0.0/end 936.0
- kavriva_e1012_native_R2-form-empty-1.png / form-empty / RAW SHA256 644d7292878ffff62e6210f3b345c2219d3df7561abd914339548d5f1cd57190 / 60472byte /390×844 /offset 620.0/end 936.0
- kavriva_e1012_native_R2-form-empty-2.png / form-empty / RAW SHA256 a7bfc79cb809c9f91b16ab23378dd284c57b837f4db7a854934b2deda6836e48 / 54830byte /390×844 /offset 936.0/end 936.0
- kavriva_e1012_native_R2-form-invalid-date-0.png / form-invalid-date / RAW SHA256 890bcdbed09d2a6a73d8655deccb96bc3364f1a66ccb2684644f1cfd398d507c / 59241byte /390×844 /offset 0.0/end 1104.0
- kavriva_e1012_native_R2-form-invalid-date-1.png / form-invalid-date / RAW SHA256 990ab0f6153d5e577e9c7ff52ccb0f7b3240ddf12df71bf3a3b668aa4867090b / 60438byte /390×844 /offset 620.0/end 1104.0
- kavriva_e1012_native_R2-form-invalid-date-2.png / form-invalid-date / RAW SHA256 d00b5c0f6cdb37d102a393a392c14ecf603c3c01e67018b6bbc72c0fb2686356 / 59850byte /390×844 /offset 1104.0/end 1104.0
- kavriva_e1012_native_R2-form-edited-0.png / form-edited / RAW SHA256 daaba43677f5c68dfe41bd7d04b9c51f35cfc5159188d9a869598748513a7b88 / 59785byte /390×844 /offset 0.0/end 1180.0
- kavriva_e1012_native_R2-form-edited-1.png / form-edited / RAW SHA256 901fda0ec9efeb74cedc38b5b5b9b24cf09e83c7d20bd70809b1da51b5f7176a / 59782byte /390×844 /offset 620.0/end 1180.0
- kavriva_e1012_native_R2-form-edited-2.png / form-edited / RAW SHA256 2e803c175a0fcc8dd60e0ae7021ec231714a52d5b35429c527bcfad85977a822 / 61686byte /390×844 /offset 1180.0/end 1180.0
- kavriva_e1012_native_R2-form-sent-0.png / form-sent / RAW SHA256 8015ec29aad58041f2fe4e19692e8051466823c540780f4f9e743345bb442f02 / 58384byte /390×844 /offset 0.0/end 1264.0
- kavriva_e1012_native_R2-form-sent-1.png / form-sent / RAW SHA256 405512dbc72f8b2d5e607935ab54044d6d749e2281bf387a31baffe44405d6ec / 54134byte /390×844 /offset 620.0/end 1264.0
- kavriva_e1012_native_R2-form-sent-2.png / form-sent / RAW SHA256 f13c3e3c68958fe9db645c8b7001965c892cc289eb08234979f1c5c4ad69f9dd / 59618byte /390×844 /offset 1240.0/end 1264.0
- kavriva_e1012_native_R2-form-sent-3.png / form-sent / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1264.0/end 1264.0
- kavriva_e1012_native_R2-form-no-handler-0.png / form-no-handler / RAW SHA256 35d80e1d66c426f259925affb5969e95bd25404f906e9f59f91afa26f93d6568 / 59036byte /390×844 /offset 0.0/end 1178.0
- kavriva_e1012_native_R2-form-no-handler-1.png / form-no-handler / RAW SHA256 990ab0f6153d5e577e9c7ff52ccb0f7b3240ddf12df71bf3a3b668aa4867090b / 60438byte /390×844 /offset 620.0/end 1178.0
- kavriva_e1012_native_R2-form-no-handler-2.png / form-no-handler / RAW SHA256 03d1d119a4560be71f8eae382bc102cebb14857c209730f6e68b8665a83dc8cd / 61760byte /390×844 /offset 1178.0/end 1178.0
- kavriva_e1012_native_R2-form-no-source-0.png / form-no-source / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-form-stale-0.png / form-stale / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-form-held-0.png / form-held / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-form-foreign-0.png / form-foreign / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-form-copy-0.png / form-copy / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-form-inactive-0.png / form-inactive / RAW SHA256 82faaa74e8a917185888c2802939bd3a20c6b060494d1baf8b4e4b62a70cf2c0 / 54411byte /390×844 /offset 0.0/end 1178.0
- kavriva_e1012_native_R2-form-inactive-1.png / form-inactive / RAW SHA256 0decb15dffea20b4bae5b9ee816363d61ea926e97bc6b46dc876efd86bb64823 / 51808byte /390×844 /offset 620.0/end 1178.0
- kavriva_e1012_native_R2-form-inactive-2.png / form-inactive / RAW SHA256 91c44ecc01b3e45e34e09dfd04889b9d3f03479fa0607cc0dbb182ec0573c4cc / 57712byte /390×844 /offset 1178.0/end 1178.0
- kavriva_e1012_native_R2-form-submitting-0.png / form-submitting / RAW SHA256 8015ec29aad58041f2fe4e19692e8051466823c540780f4f9e743345bb442f02 / 58384byte /390×844 /offset 0.0/end 1264.0
- kavriva_e1012_native_R2-form-submitting-1.png / form-submitting / RAW SHA256 405512dbc72f8b2d5e607935ab54044d6d749e2281bf387a31baffe44405d6ec / 54134byte /390×844 /offset 620.0/end 1264.0
- kavriva_e1012_native_R2-form-submitting-2.png / form-submitting / RAW SHA256 f13c3e3c68958fe9db645c8b7001965c892cc289eb08234979f1c5c4ad69f9dd / 59618byte /390×844 /offset 1240.0/end 1264.0
- kavriva_e1012_native_R2-form-submitting-3.png / form-submitting / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1264.0/end 1264.0
- kavriva_e1012_native_R2-form-failed-0.png / form-failed / RAW SHA256 23bdaf3b35efd6c3c3856a23dc010896b5ddd0effbfddc2f75211c76ce76a7ca / 64086byte /390×844 /offset 0.0/end 1373.0
- kavriva_e1012_native_R2-form-failed-1.png / form-failed / RAW SHA256 365db9a1013b518f768a70b9a9225973b60679ce80d015865dc629c4b8a18b56 / 54641byte /390×844 /offset 620.0/end 1373.0
- kavriva_e1012_native_R2-form-failed-2.png / form-failed / RAW SHA256 4eb6f648c194db1c5bb9083e295e14e270e6c9c0db90fd0bab4b74f691ee0373 / 60067byte /390×844 /offset 1240.0/end 1373.0
- kavriva_e1012_native_R2-form-failed-3.png / form-failed / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1373.0/end 1373.0
- kavriva_e1012_native_R2-form-unknown-0.png / form-unknown / RAW SHA256 df1fabf12ce178a3b93297b8fe2743733c91fb6c46a16ef787737797abe5b21c / 63164byte /390×844 /offset 0.0/end 1373.0
- kavriva_e1012_native_R2-form-unknown-1.png / form-unknown / RAW SHA256 365db9a1013b518f768a70b9a9225973b60679ce80d015865dc629c4b8a18b56 / 54641byte /390×844 /offset 620.0/end 1373.0
- kavriva_e1012_native_R2-form-unknown-2.png / form-unknown / RAW SHA256 4eb6f648c194db1c5bb9083e295e14e270e6c9c0db90fd0bab4b74f691ee0373 / 60067byte /390×844 /offset 1240.0/end 1373.0
- kavriva_e1012_native_R2-form-unknown-3.png / form-unknown / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1373.0/end 1373.0
- kavriva_e1012_native_R2-form-recorded-0.png / form-recorded / RAW SHA256 35bb57042665339364ffbf6b60556b6222332b0cdc8646049d8890a3ce760a34 / 58442byte /390×844 /offset 0.0/end 1233.0
- kavriva_e1012_native_R2-form-recorded-1.png / form-recorded / RAW SHA256 a6a9c4f5d7c753a57022a7b313c6817206d56e59b78f724e0a9aa6085164973c / 50743byte /390×844 /offset 620.0/end 1233.0
- kavriva_e1012_native_R2-form-recorded-2.png / form-recorded / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1233.0/end 1233.0
- kavriva_e1012_native_R2-form-unproven-result-0.png / form-unproven-result / RAW SHA256 df1fabf12ce178a3b93297b8fe2743733c91fb6c46a16ef787737797abe5b21c / 63164byte /390×844 /offset 0.0/end 1373.0
- kavriva_e1012_native_R2-form-unproven-result-1.png / form-unproven-result / RAW SHA256 365db9a1013b518f768a70b9a9225973b60679ce80d015865dc629c4b8a18b56 / 54641byte /390×844 /offset 620.0/end 1373.0
- kavriva_e1012_native_R2-form-unproven-result-2.png / form-unproven-result / RAW SHA256 4eb6f648c194db1c5bb9083e295e14e270e6c9c0db90fd0bab4b74f691ee0373 / 60067byte /390×844 /offset 1240.0/end 1373.0
- kavriva_e1012_native_R2-form-unproven-result-3.png / form-unproven-result / RAW SHA256 5d60efef46308db151608f1e7dbbe2f978de7459a65817c23030b5834135dffe / 57823byte /390×844 /offset 1373.0/end 1373.0
- kavriva_e1012_native_R2-form-long-0.png / form-long / RAW SHA256 fb6380f9cac25265e3f7741a27c1af68b920cb189c87db332148a139bb8dafe4 / 64284byte /390×844 /offset 0.0/end 1116.0
- kavriva_e1012_native_R2-form-long-1.png / form-long / RAW SHA256 7b3b6c8e44109e0e58d21d885b5400a8b0ae5be9a5c402640cf6ea6a23633377 / 63179byte /390×844 /offset 620.0/end 1116.0
- kavriva_e1012_native_R2-form-long-2.png / form-long / RAW SHA256 4312908995f9a95bf13c1b27c4e317e5662f952fb8cb86ce6e63fa7edf5092f1 / 65005byte /390×844 /offset 1116.0/end 1116.0
- kavriva_e1012_native_R2-dispute-unresolved-0.png / dispute-unresolved / RAW SHA256 17c998135b17d1670c7e5200186c16942fd2e58650732f0eb78ca6817305f119 / 69325byte /390×844 /offset 0.0/end 1312.0
- kavriva_e1012_native_R2-dispute-unresolved-1.png / dispute-unresolved / RAW SHA256 03b51bab4198c425799dd05b95b70f1e5008ab390c18bb7f12111dd1a76676f5 / 72652byte /390×844 /offset 620.0/end 1312.0
- kavriva_e1012_native_R2-dispute-unresolved-2.png / dispute-unresolved / RAW SHA256 e413048d74a92f5cf1b10c9efc3ff2c03bf07c8d4b9707f587d08a8d980fec8d / 66164byte /390×844 /offset 1240.0/end 1312.0
- kavriva_e1012_native_R2-dispute-unresolved-3.png / dispute-unresolved / RAW SHA256 47400bec2f58fae2a54c0f2756b7c032037c1a7fac0b3cba80708c9646bd98c7 / 64696byte /390×844 /offset 1312.0/end 1312.0
- kavriva_e1012_native_R2-dispute-reviewed-0.png / dispute-reviewed / RAW SHA256 1f9fe65d7580075dcd00a33a8c9270d54c2ddc5fa15210fe5bcd4e4342d7af92 / 64524byte /390×844 /offset 0.0/end 1236.0
- kavriva_e1012_native_R2-dispute-reviewed-1.png / dispute-reviewed / RAW SHA256 bbf3bdb95099b8ca1b6de63bd7a1a9bd7c743ae047ee0f548aad5aff8e044bbb / 65878byte /390×844 /offset 620.0/end 1236.0
- kavriva_e1012_native_R2-dispute-reviewed-2.png / dispute-reviewed / RAW SHA256 47400bec2f58fae2a54c0f2756b7c032037c1a7fac0b3cba80708c9646bd98c7 / 64696byte /390×844 /offset 1236.0/end 1236.0
- kavriva_e1012_native_R2-dispute-withdrawn-0.png / dispute-withdrawn / RAW SHA256 6fcfe85cb7c93c76063329d782972929e2c29a8f2941e4a18529e88cd52ce714 / 63851byte /390×844 /offset 0.0/end 1236.0
- kavriva_e1012_native_R2-dispute-withdrawn-1.png / dispute-withdrawn / RAW SHA256 bbf3bdb95099b8ca1b6de63bd7a1a9bd7c743ae047ee0f548aad5aff8e044bbb / 65878byte /390×844 /offset 620.0/end 1236.0
- kavriva_e1012_native_R2-dispute-withdrawn-2.png / dispute-withdrawn / RAW SHA256 47400bec2f58fae2a54c0f2756b7c032037c1a7fac0b3cba80708c9646bd98c7 / 64696byte /390×844 /offset 1236.0/end 1236.0
- kavriva_e1012_native_R2-dispute-highrisk-0.png / dispute-highrisk / RAW SHA256 0b0b9421d33579d13e3e666be977b8f3894d375dc6368232ac2f0bd4a6abc3b7 / 70088byte /390×844 /offset 0.0/end 1613.0
- kavriva_e1012_native_R2-dispute-highrisk-1.png / dispute-highrisk / RAW SHA256 4d881839644e70009d9726d83d816eb389c79533d80504b67f61d6b5f8a3ba43 / 71599byte /390×844 /offset 620.0/end 1613.0
- kavriva_e1012_native_R2-dispute-highrisk-2.png / dispute-highrisk / RAW SHA256 b475c474451e2f550f656d25e47e65a78c5eecb468051b2ed1cdd7034ee62126 / 70333byte /390×844 /offset 1240.0/end 1613.0
- kavriva_e1012_native_R2-dispute-highrisk-3.png / dispute-highrisk / RAW SHA256 695d18a49834c61ae3ef277f99a4985f2d8c371d5f5226d8cebad78bbabba675 / 62493byte /390×844 /offset 1613.0/end 1613.0
- kavriva_e1012_native_R2-dispute-versions-0.png / dispute-versions / RAW SHA256 17c998135b17d1670c7e5200186c16942fd2e58650732f0eb78ca6817305f119 / 69325byte /390×844 /offset 0.0/end 1590.0
- kavriva_e1012_native_R2-dispute-versions-1.png / dispute-versions / RAW SHA256 1136790e08e7b771dcd339b484d6701298a8581e6b086baa08f4fc313bebf4b5 / 71449byte /390×844 /offset 620.0/end 1590.0
- kavriva_e1012_native_R2-dispute-versions-2.png / dispute-versions / RAW SHA256 cb7b883c844f79b72cb4b6c39231858e85c20fec0bcafd83e65858c76cc640f3 / 64762byte /390×844 /offset 1240.0/end 1590.0
- kavriva_e1012_native_R2-dispute-versions-3.png / dispute-versions / RAW SHA256 0824be3e5b76072d36abf7d9da0a556c8847532e17728b064bf1c664272d6b0a / 60330byte /390×844 /offset 1590.0/end 1590.0
- kavriva_e1012_native_R2-dispute-private-version-0.png / dispute-private-version / RAW SHA256 17c998135b17d1670c7e5200186c16942fd2e58650732f0eb78ca6817305f119 / 69325byte /390×844 /offset 0.0/end 1366.0
- kavriva_e1012_native_R2-dispute-private-version-1.png / dispute-private-version / RAW SHA256 d217abc88f4bc8adc8f35541eebe72d9e0659e571ac4a3e8777a3ce8c331c897 / 71540byte /390×844 /offset 620.0/end 1366.0
- kavriva_e1012_native_R2-dispute-private-version-2.png / dispute-private-version / RAW SHA256 d5b5ebc0eab92e6a7f0efde10c7cff568280a52639e677c28a1dd08385ec3ac8 / 69078byte /390×844 /offset 1240.0/end 1366.0
- kavriva_e1012_native_R2-dispute-private-version-3.png / dispute-private-version / RAW SHA256 22772337c3e40df5d38b1a3955403f51febddce7ff7f873b9d30ae5fb072c255 / 63456byte /390×844 /offset 1366.0/end 1366.0
- kavriva_e1012_native_R2-dispute-no-evaluation-0.png / dispute-no-evaluation / RAW SHA256 b638a3807cd9a22bec8c1fcfce2fe9151a5d16a0b9ebf179de797136f0f0ab9d / 70171byte /390×844 /offset 0.0/end 1397.0
- kavriva_e1012_native_R2-dispute-no-evaluation-1.png / dispute-no-evaluation / RAW SHA256 ea09328010b97c358299e7ef925940f6ced779bfbf622b5380c3d3e898cb6ee3 / 72305byte /390×844 /offset 620.0/end 1397.0
- kavriva_e1012_native_R2-dispute-no-evaluation-2.png / dispute-no-evaluation / RAW SHA256 4c23075651d8c4e0ad4620f9e825b7a38daf38e9dcb0238ee0a8bbe3968191b0 / 73336byte /390×844 /offset 1240.0/end 1397.0
- kavriva_e1012_native_R2-dispute-no-evaluation-3.png / dispute-no-evaluation / RAW SHA256 f69adc848ef3b2c09f82d52c89bb34d8d37be0af370e7c389e857496b284c1eb / 64429byte /390×844 /offset 1397.0/end 1397.0
- kavriva_e1012_native_R2-dispute-no-source-0.png / dispute-no-source / RAW SHA256 3f0f00a944d30f81f4d8f13a5a43a56907eb3037292270e88dfacd49ef9487b2 / 45867byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-dispute-field-denied-0.png / dispute-field-denied / RAW SHA256 3f0f00a944d30f81f4d8f13a5a43a56907eb3037292270e88dfacd49ef9487b2 / 45867byte /390×844 /offset 0.0/end 0.0
- kavriva_e1012_native_R2-dispute-no-claims-0.png / dispute-no-claims / RAW SHA256 e4f8925adfaa7dd68780b1d6bc21235f6cd453236fb8e8b89a92ada438695809 / 70944byte /390×844 /offset 0.0/end 812.0
- kavriva_e1012_native_R2-dispute-no-claims-1.png / dispute-no-claims / RAW SHA256 b079ccb6754a1a7c8b1d0848d438359272ff8c8ae7a5254b2ac261e67a6eb07f / 71635byte /390×844 /offset 620.0/end 812.0
- kavriva_e1012_native_R2-dispute-no-claims-2.png / dispute-no-claims / RAW SHA256 02f3e350f2c202e4bbdca815585235301ef3b1454f46b4160362309a79cd55f7 / 63118byte /390×844 /offset 812.0/end 812.0
- kavriva_e1012_native_R2-dispute-own-revoked-0.png / dispute-own-revoked / RAW SHA256 17c998135b17d1670c7e5200186c16942fd2e58650732f0eb78ca6817305f119 / 69325byte /390×844 /offset 0.0/end 1312.0
- kavriva_e1012_native_R2-dispute-own-revoked-1.png / dispute-own-revoked / RAW SHA256 03b51bab4198c425799dd05b95b70f1e5008ab390c18bb7f12111dd1a76676f5 / 72652byte /390×844 /offset 620.0/end 1312.0
- kavriva_e1012_native_R2-dispute-own-revoked-2.png / dispute-own-revoked / RAW SHA256 c5b7054b8d6cd82771968a1a0dc4ae13326392c8599e42bb6751ff81a80fb748 / 66202byte /390×844 /offset 1240.0/end 1312.0
- kavriva_e1012_native_R2-dispute-own-revoked-3.png / dispute-own-revoked / RAW SHA256 6d0e7af897181b7f8141ad12a1540d41ed250d9468c9b5cd0039c0a0df040b62 / 64729byte /390×844 /offset 1312.0/end 1312.0
- kavriva_e1012_native_R2-dispute-private-evidence-0.png / dispute-private-evidence / RAW SHA256 17c998135b17d1670c7e5200186c16942fd2e58650732f0eb78ca6817305f119 / 69325byte /390×844 /offset 0.0/end 1228.0
- kavriva_e1012_native_R2-dispute-private-evidence-1.png / dispute-private-evidence / RAW SHA256 03b51bab4198c425799dd05b95b70f1e5008ab390c18bb7f12111dd1a76676f5 / 72652byte /390×844 /offset 620.0/end 1228.0
- kavriva_e1012_native_R2-dispute-private-evidence-2.png / dispute-private-evidence / RAW SHA256 a5637d654a8e0b4eccc1422d01199211b45188432805ac43e5e1b4c21d379fb0 / 66302byte /390×844 /offset 1228.0/end 1228.0
- kavriva_e1012_native_R2-dispute-sent-0.png / dispute-sent / RAW SHA256 5fd5dd9978ebe5d5b1700493d4d811c8908a146ed643510965a2807b7f92bc38 / 67018byte /390×844 /offset 0.0/end 1526.0
- kavriva_e1012_native_R2-dispute-sent-1.png / dispute-sent / RAW SHA256 c3f3b284a54bdbbc4ee332f1c3bf2037c3df12f931820d8e4c3098548014b2c5 / 65246byte /390×844 /offset 620.0/end 1526.0
- kavriva_e1012_native_R2-dispute-sent-2.png / dispute-sent / RAW SHA256 ebf83667867d733f68a31429d1e36501474723924c465efbb2cc14b27f1421e5 / 71690byte /390×844 /offset 1240.0/end 1526.0
- kavriva_e1012_native_R2-dispute-sent-3.png / dispute-sent / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1526.0/end 1526.0
- kavriva_e1012_native_R2-dispute-submitting-0.png / dispute-submitting / RAW SHA256 5fd5dd9978ebe5d5b1700493d4d811c8908a146ed643510965a2807b7f92bc38 / 67018byte /390×844 /offset 0.0/end 1526.0
- kavriva_e1012_native_R2-dispute-submitting-1.png / dispute-submitting / RAW SHA256 c3f3b284a54bdbbc4ee332f1c3bf2037c3df12f931820d8e4c3098548014b2c5 / 65246byte /390×844 /offset 620.0/end 1526.0
- kavriva_e1012_native_R2-dispute-submitting-2.png / dispute-submitting / RAW SHA256 ebf83667867d733f68a31429d1e36501474723924c465efbb2cc14b27f1421e5 / 71690byte /390×844 /offset 1240.0/end 1526.0
- kavriva_e1012_native_R2-dispute-submitting-3.png / dispute-submitting / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1526.0/end 1526.0
- kavriva_e1012_native_R2-dispute-failed-0.png / dispute-failed / RAW SHA256 c583325d7d5bc8936bb7c370b66e211b154c53b275d124fbfa237d6c70e696f8 / 69554byte /390×844 /offset 0.0/end 1635.0
- kavriva_e1012_native_R2-dispute-failed-1.png / dispute-failed / RAW SHA256 1e30b05720d678da872d204c705c5a6da9da46f7ff427dfd1e6dce4bb1b28a95 / 65000byte /390×844 /offset 620.0/end 1635.0
- kavriva_e1012_native_R2-dispute-failed-2.png / dispute-failed / RAW SHA256 9c174c41db047c240cbf343b0cd9d301f119586c5e674c2826cfda887ce8d107 / 70908byte /390×844 /offset 1240.0/end 1635.0
- kavriva_e1012_native_R2-dispute-failed-3.png / dispute-failed / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1635.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unknown-0.png / dispute-unknown / RAW SHA256 d7ec0174637071b24028252cf6273402a43bdef804f5af38e597323f1d9c9378 / 68626byte /390×844 /offset 0.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unknown-1.png / dispute-unknown / RAW SHA256 1e30b05720d678da872d204c705c5a6da9da46f7ff427dfd1e6dce4bb1b28a95 / 65000byte /390×844 /offset 620.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unknown-2.png / dispute-unknown / RAW SHA256 9c174c41db047c240cbf343b0cd9d301f119586c5e674c2826cfda887ce8d107 / 70908byte /390×844 /offset 1240.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unknown-3.png / dispute-unknown / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1635.0/end 1635.0
- kavriva_e1012_native_R2-dispute-recorded-0.png / dispute-recorded / RAW SHA256 fe5d185b25bfb4e8d0f0e8435fd514007301bc117cad976abc3ca23ac036d26b / 68220byte /390×844 /offset 0.0/end 1495.0
- kavriva_e1012_native_R2-dispute-recorded-1.png / dispute-recorded / RAW SHA256 9c28bcefe04e7aa12bbf59acb614ec425b62765ba1bbae8f8d24961743d858a4 / 67376byte /390×844 /offset 620.0/end 1495.0
- kavriva_e1012_native_R2-dispute-recorded-2.png / dispute-recorded / RAW SHA256 0a6efbe0cc5e02d8433e3e0ce5ea12911e71481e0f2bb182b34a9b0cca6e9e1a / 69916byte /390×844 /offset 1240.0/end 1495.0
- kavriva_e1012_native_R2-dispute-recorded-3.png / dispute-recorded / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1495.0/end 1495.0
- kavriva_e1012_native_R2-dispute-unproven-result-0.png / dispute-unproven-result / RAW SHA256 d7ec0174637071b24028252cf6273402a43bdef804f5af38e597323f1d9c9378 / 68626byte /390×844 /offset 0.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unproven-result-1.png / dispute-unproven-result / RAW SHA256 1e30b05720d678da872d204c705c5a6da9da46f7ff427dfd1e6dce4bb1b28a95 / 65000byte /390×844 /offset 620.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unproven-result-2.png / dispute-unproven-result / RAW SHA256 9c174c41db047c240cbf343b0cd9d301f119586c5e674c2826cfda887ce8d107 / 70908byte /390×844 /offset 1240.0/end 1635.0
- kavriva_e1012_native_R2-dispute-unproven-result-3.png / dispute-unproven-result / RAW SHA256 37e5e3cc3a474c613b5a18efcc92fb0b9d957e03b13f9b28876fee8937d1d528 / 64734byte /390×844 /offset 1635.0/end 1635.0
- kavriva_e1012_native_R2-missing-snapshot-0.png / missing-snapshot / RAW SHA256 ff75700bbcd19ffabc7d610112f5c2f762e62fa567ae143b4164584298d86968 / 46036byte /390×844 /offset 0.0/end 0.0

## Yerel ham günlük kimlikleri

- kavriva_e1012_analyze.log / RAW SHA256 6c44a36aa3ba94c685e36f84694b5cba68f950e2bd3475c704e9d2a1d721f6e4 / 98byte
- kavriva_e1012_format.log / RAW SHA256 965d46342bae0a36b6ac664affcd42e2272badcc9a4b26e216a0c5b6b50e9bab / 49byte
- kavriva_e1012_full_tests.log / RAW SHA256 e8d8968adb137d0d8edf63ff176dc48b30c0bbfd3a668f76669761abd15bab5c / 59915byte
- kavriva_e1012_initial_analyze.log / RAW SHA256 8c42e137a6af2076c6a0fdd146363e3af9ada27fa9bf0e03092c18dab4cb88a5 / 98byte
- kavriva_e1012_initial_tests.log / RAW SHA256 5a1b5c5e5b9af0971114eb14f4211d9faca2a282fb7b52e622982d37fe42ac14 / 39649byte
- kavriva_e1012_initial_with_tests_analyze.log / RAW SHA256 6aa3e8dc01cf3f2154b027c1b8495f977201e2fa8dba878c80ea4734491c36cf / 98byte
- kavriva_e1012_native_R1.log / RAW SHA256 bd78f0c060f34d0affa19916d4ff20ec10b3703cf24ec6af735790ff2d72e05e / 264byte
- kavriva_e1012_native_R2.log / RAW SHA256 bd78f0c060f34d0affa19916d4ff20ec10b3703cf24ec6af735790ff2d72e05e / 264byte
- kavriva_e1012_paint_focus_initial.log / RAW SHA256 d736890293d0d76ee7294e1c2f30d79708656e07b893e731e20517e337895764 / 2376byte
- kavriva_e1012_paint_focus_repair.log / RAW SHA256 5912bc8553acf0031061f52d2842779fb129d1714090ce3cb2430e09b8b3a9b9 / 267byte
- kavriva_e1012_pubget.log / RAW SHA256 0f6f606fe6106606054e3e430c19492c9b51de46c4a608eef235b1e595dc13d4 / 287byte
- kavriva_e1012_R2_analyze.log / RAW SHA256 7fb807150e723718f462833e056eaf59c9d0c85057cbadc18687b5d97f7a92ce / 98byte
- kavriva_e1012_R2_format.log / RAW SHA256 eff43837e4ab1b774ed4f41063477e6c88ed9fc42ed135b4a5458ff4be36d4bc / 49byte
- kavriva_e1012_R2_full_tests.log / RAW SHA256 2cbc8fabccc44df449b17b7b96d9fb4ea7eb0378e195a69e5cad730dee302e1c / 60987byte
- kavriva_e1012_tests_after_map_fix.log / RAW SHA256 91e2435c066015ab64f67b1da0b0aabee28e0849bb3d6b8d83f45949d1fc93e7 / 1683byte


## Kaynak PNG kimlikleri

[
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1012_readahead_I03-SCR-027-Record-Work-Self-Hobby-External-Service.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/I03-SCR-027-Record-Work-Self-Hobby-External-Service.png",
    "sha256": "5cf25f15fc47dfd5616ae5548d8d9fdb269784f06a421cb98ebf1b327d6bc599",
    "rootActualOpened": true,
    "docShaMatch": true,
    "dimensions": [
      887,
      1774
    ]
  },
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1012_readahead_I04-SCR-028-Correction-Dispute-Evidence-Review.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/I04-SCR-028-Correction-Dispute-Evidence-Review.png",
    "sha256": "f5afc7406bee5b5f96fae3943816c3f8b03814ac326291e62643762c40acdf30",
    "rootActualOpened": true,
    "docShaMatch": true,
    "dimensions": [
      887,
      1774
    ]
  }
]


`vault/PROFILES/record-dispute-render.md`; `vault/PACKS/P-E1-012.md`; `vault/REGISTRY/T-E1-012.md`; `vault/EVIDENCE/E-DEV-110.md`.

## Kayıt yardımcı komutu sınırı

İlk kayıt yardımcı komutu CI_PLAN çok satırlı used_by listesini tek satır varsaydığı için assert ile durdu. YAML/workflow veya eski esas gövde değişmedi. Önceden yazılmış kayıtlar yeniden oynatılmadı; yalnız CI_PLAN ve önceki EDEV109 tüketici/makbuz eki tamamlandı. Sonrasında hamv76 ve eski esas gövdeler tekrar doğrulandı.

İlk run_all görevdeki HELD açıklamasının kaynak bağlantısını ve kanıttaki IN_PROGRESS hükmünün kapalı enum kümesine uymadığını reddetti. Kaynak EDEV110'a bağlandı; REVIEW de hüküm enumunda olmadığından ikinci koşu bunu reddetti. Kayıtlı yerel kanıt için mevcut RECORDED hükmü kullanıldı. Görev IN_PROGRESS/incelemeci none ve bağımsız inceleme engeli korunur; kurallar/testler değiştirilmedi. İki eski FAIL günlükleri saklanır.
