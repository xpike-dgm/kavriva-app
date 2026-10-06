---
test_id: E-DEV-111
version: 1
purpose: Sonradan değişen bilginin etkilediği bakım kaydını ve yeniden kontrolü sunmak
domain: history
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.6, F1.6.1, SCR-029, BR-138, BR-139, BR-140, BR-142, BR-143, BR-144, BR-145, BR-146, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: correction-reachback-presentation
tasks: [T-E1-013]
tests: [modules/e01-app/internal/shell/test/correction_reachback_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-07
depends_on: [V-E1-REACHBACK-001]
used_by: [V-E1-REACHBACK-001, P-E1-013, T-E1-013]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR-029 C1.6/F1.6.1/FL1.6.3 correction-reachback v1"
subject_file: modules/e01-app/internal/shell/lib/correction_reachback.dart
subject_digest: 1a8b538919fdc9c71a7a5d19e3b67fbaaa0d042d953757e77000d28597e33ffb
result: "Yerel277normal/1native PASS; ilkoku ve bağımsız kabul/aynıCI-T3 bekleniyor"
gate_verdict: "RECORDED"
reviewer: none
timestamp: 2026-10-07
evidence_links: [vault/PROFILES/correction-reachback-render.md, vault/PACKS/P-E1-013.md, vault/REGISTRY/T-E1-013.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-110-E10-GOVERNED-PATHS-FOR-T-E1-013.md.snapshot, modules/e01-app/internal/shell/lib/correction_reachback.dart, modules/e01-app/internal/shell/test/correction_reachback_test.dart, modules/e01-app/internal/shell/test/fixtures/correction_reachback_reading_questions.json]
---

# Kritik düzeltmenin geçmiş kayda etkisi

T-E1-013 SCR029/C1.6/F1.6.1/FL1.6.3, plan fa914f013fdcd032faed876689092da245989459 SIMULATION kabulü. Kanonik sonuç Severity reach-back; survives inactive. Tek sert bağımlılık T011 gerçek DONE; gerçek kabul edilmiş base 4778c3bb8f29669c0b728ae1da7e2fa8c8a5df8f. T012 yeni DAG bağımlılığı değildir. Ana99DONE107kalan206 değişmez. Bildirim/etkilenen kullanıcı sınırı/kimlik/yetki/yeniden kontrol üreticisi, fiziksel iş, cihaz/OS ve yayın bu sunumla kapanmaz.

I05 refinedv2 tek çalışma referansıdır: bir sonuç mesajı, tek etkilenen kayıt, tek baskın yeniden kontrol yolu; ayrıntı ve izinli geçmiş erişimi korunur. Safety warning, technical value, applied critical step ve narrative-only ayrı dış sınıflardır. E1 yerel etki yükseltmez/indirmez, risk bitmiş veya eski işi güvenli saymaz. Anlatım değişiminde baskın eylem kaydı okumaktır, yeni kontrol gönderimi değildir. Düzeltme iddiası, kaynak/sürüm/bölüm, inceleyen, bilinmeyen ve önce/şimdi/zaman/gerekçe ayrıntıda gösterilir. Eski kayıt ve bağımsız kanıt izi korunur; kazanan veya doğrulanmış tamamlanma üretilmez.

HistoryScope/Reference/Record kabul edilmiş E1history kaynağından değişmeden tüketilir. CorrectionNotice ve iç değerler/CorrectionSnapshot haritaları değişmezdir. Düzeltmenin kimliği, revizyonu, etki/sınıflandırma revizyonu, hedef kayıt üyeliği ve bütün metin değerleri kayıpsız UTF16 uzunluk kodlamasıyla subject'e bağlanır. Bozuk surrogate ile replacement karakter aynı kimlik değildir. Eksik/eski/yabancı/held/unknown/kopya kaynak, hedef veya sınıflandırma güncel otorite değildir. Dört güncel okuma ve sekiz ayrı alan izni gerekir; yüksek risk hedef kaydında inceleyen/bilinmeyen dahil bütün zorunlu alanlar ayrıca izinlidir. Özel kayıt/önceki değer metni boyanmış ve Semantics ağacında kapanır.

Pasif motosiklet ve paket değişimi mevcut izinli düzeltme/temel geçmiş erişimini geriye dönük ücret kapısına taşımaz; geçerli iznin yokluğunu aşmaz. Yeni kontrol/sorgu için ayrı altı motorcycle/source/authorization/policy/operationIntent/audit bağı gerekir. Handler varlığı ALLOW değildir. Çevrimdışı yeni niyet kapalıdır; eski bilgi güncel kontrol veya riskin geçtiği anlamına gelmez. Aynı scope/request için gönderim kilidi, içerik değişse veya idle girdi yeniden gelse de kendiliğinden kalkmaz; çift gönderim engellenir. Eski callback güncel scope/request/subject/phase ve tıklama anındaki izinleri yeniden denetler. Failed/unknown/kanıtsızreceived yalnız aynıistek sorgusu sunar; çift sorgu da kilitlidir. Makbuz yalnız exact scope/request/subject ve correction-recheck-receipt amacıyla isteğin alındığını anlatır; çıplakALLOW, fiziksel yeniden kontrol veya güvenlik değildir. Typed niyet router/DB/üretim işlemi yürütmez.

## Gerçek yerel kanıt

Kodöncesi 346be75cfccea600785f4844a9e1048edd6a69ca; kod 6621c3349b7791d3a296d0c811b105c4023f86c3. Kilitli pubget başarılı. Strictformat30/0, analyze0. Önceki262 normal korunarak toplam277normalPASS (yeni15). Native çizim ayrıca1PASS; tek278normal koşu iddiası yok. 31durum×320/390/768×1/2/3 =279 gerçek tam kaydırma düzeni,52hedef/fatalpointer/sonaÇık; gerçek TabEnterSpace, görünür birincil/ikincil odak/metin4.5odak3, kapalıbuttonSemantics/liveRegion/gizlilik. Native51PNG390×844 tam kaydırma:34benzersizoriginal Root tarafından açıldı; kalan17RAW SHA aynı açılmış görüntülerle eşleşir. Root51yeni görüntüyü ayrıca açtı iddiası yoktur. Sabit SDKRoboto test fontu nihai ürün fontu değildir. I05gerçek887×1774original ve kabul edilmiş T012dispute-unresolved0 ayrıca karşılaştırıldı.

## Korunan hata geçmişi

İlk test dosyası Python yazıcısında bozukUnicode örneğini literal surrogate üretince UTF8 encode hatası aldı; test dosyası boş kaldı. Aynı görevin komut kaydından yalnız test-yazıcı geri alındı ve Dart'a literalUnicode escape geçirildi; uygulama kodu etkilenmedi. İlk15öncesi14hedef koşuda12PASS/2FAIL yalnız SemanticsHandle test bitiminde bırakılmasıydı. Dispose gerçek finally'e alındı; R2hedef15PASS. İlk analyze2deprecatedinfo gerçekSemanticsFinder/flagsCollection ile giderildi, uyarı bastırılmadı. R3tam277denemede276PASS/1FAIL: ebeveyn Focus Semantics nodesi Tristate.none döndürdü. Test gerçek button Semantics alt nodesine yöneltildi; disabledFALSE beklentisi gevşetilmedi. Hedefklavye1PASS, R4bütün277PASS/analyze0/format30-0. Özgün başarısız günlükler korunur; ret veya üretim hatası diye uydurulmaz.

## Yedi E10 tasarım kapısı

| Kapı | Gerçek kapsam |
|---|---|
| Bütün ekran |51tam kaydırma parçası;34original açım+17RAW eşitliği, temel sonuç ve son destek/çıkış okunur. |
| Ekranlar arası |I05refinedv2 ve kabul edilmiş T012itiraz original karşılaştırıldı; aynı çalışan32/22/16/52DNA, kayıt/itiraz ve kritik uyarı bilgi sırası ayrı. |
| Durum |31 örnek; dörtetki/pasif/paket/çevrimdışı/ayrıntı/uzun/özel/eksik/eski/held/unknown/foreign/sınıflandırma/inceleyen/bilinmeyen/handler/operationIntent/busy/sent/failed/query/received. EşitPNG ayrı tasarım veya otomatik arıza nedeni değildir. |
| Duyarlı düzen |279 gerçek kaydırma,320390768×123 yazı,52hedef ve fatalpointer; native yalnız390×844. |
| Erişilebilirlik |Gerçek TabEnterSpace/visiblefocus/disabledSemantics/liveRegion/kontrast; gerçek OS/ekran okuyucu HELD. |
| Regresyon |Önceki262 aynı277koşuda başarılı;41basepin/hamv77/eski esas gövde/SDK/YAML/deps korunur. |
| Kaynak/varyasyon |I05refinedv2 RAW SHA eşit; tek etki/tek kayıt/tek baskın kontrol, pasif erişim açık; logo/ikon/nihai font/token/nav/router/device/release HELD. |

## Bağımsız kabul beklemede

12soru koddan önce sabit. Yeni geçmişsiz gpt-6-luna/max yalnız güncel51PNG ve12soruyu okumakta; henüz rapor/hüküm yok. AI insan/telefon değildir. Bütün görev bağımsız kabul ve aynı gerçek CI/T3, sonra ayrı son6metadata/aynısonCI-T3 ve normalmerge/fetchedmain8 olmadan DONE/ana100sayım yok. DEC0069 ve sahip sürekli yetkisi geçerli; birleşmemiş DEC0070 kullanılmaz. E3R1REVIEW/E5IN_PROGRESS/Supabase47-57-59/RET97/cihaz/yayın engelleri korunur. Üretim olumlu durumları açık fixture; yeni DB/Supabase/publicseam/YAML/SDK/bağımlılık/router değişmedi.

## Sabit kimlikler

KodLF SHA256 5adcdf94a050732aa6fd9dc1b1b07fec3298f72312cb6df479b3fd3338efdf36; testLF SHA256 c791892fa0e3dcf9e5df9c23969570463d0f462d533490b8cecb05a3fa2fd3dc;12soruLF SHA256 3c1664de5fe51a6a28bfae7d34181c25a96cf6c757cb4ef79d932ce5f3277098. Hamv77 209243byte/RAW SHA256 85925d2df50106d95c73e2742a26bcfe4242cfc167def47b3adc6e54e7f56340.

## Güncel native görüntü kimlikleri

- kavriva_e1013_native_R1-safety-0.png / safety / RAW SHA256 feab1dd99a3c099bf8e456088194564c77c6cb14422196a258d597a4f6abd298 / 67439byte /390×844 /offset 0.0/end 51.0
- kavriva_e1013_native_R1-safety-1.png / safety / RAW SHA256 d4a194fac4e6b64c1d957bb674dc06f8e44d7c07bbeca596e449c97c808daadf / 64135byte /390×844 /offset 51.0/end 51.0
- kavriva_e1013_native_R1-technical-value-0.png / technical-value / RAW SHA256 cadd86a760865dca761e957430459daec61ba0b86dad25a5d38fb8899136aad2 / 66711byte /390×844 /offset 0.0/end 51.0
- kavriva_e1013_native_R1-technical-value-1.png / technical-value / RAW SHA256 59dd98941b7815287ed863c959925a35bae22963e768d876bf4276e7166a6675 / 63366byte /390×844 /offset 51.0/end 51.0
- kavriva_e1013_native_R1-critical-step-0.png / critical-step / RAW SHA256 108fc84f7e0c069be1b4dc072b53666ee190890b631d25e628a5cb80f7b4ef23 / 66548byte /390×844 /offset 0.0/end 51.0
- kavriva_e1013_native_R1-critical-step-1.png / critical-step / RAW SHA256 3275ff9a8dfa3430c3d982479b6b942f538ba7c78be9fe86df9e97313062d4de / 63201byte /390×844 /offset 51.0/end 51.0
- kavriva_e1013_native_R1-narrative-0.png / narrative / RAW SHA256 f1e0574ba2cac3d1a43cb1db3e28ff211ed4465bd9adf9771a75f3fdbe7c682c / 59300byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-inactive-0.png / inactive / RAW SHA256 8eef21135e7bf663eaf49d4b5653eac999a012c385f3d3ef044ea8ff31dfaef5 / 71017byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-inactive-1.png / inactive / RAW SHA256 efb01329bc36e2e49553f2babab86e714356f40d36cfc48c749b832d16d8ff74 / 63303byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-entitlement-changed-0.png / entitlement-changed / RAW SHA256 a4461656e343ecbff7976948db5aad6f46f08883b4ad89e143de6ee0b21d9044 / 72498byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-entitlement-changed-1.png / entitlement-changed / RAW SHA256 ae57f7cdc8d8800a009de1afd9d8314ee0a8a4c1465b352bc71c2e4268e9adee / 64774byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-inactive-entitlement-0.png / inactive-entitlement / RAW SHA256 7f3eeb6950d3f25f846258f2642a2ad7930a884c2cabfc9170747f0626b3cd63 / 76339byte /390×844 /offset 0.0/end 163.0
- kavriva_e1013_native_R1-inactive-entitlement-1.png / inactive-entitlement / RAW SHA256 f2dfc0d59d1d55d4a7497cf067797431fea126497a3a644b306b07605f165115 / 66985byte /390×844 /offset 163.0/end 163.0
- kavriva_e1013_native_R1-offline-0.png / offline / RAW SHA256 e6c360842f3376d3882de80768dd0b62b3944d1200bf9a964f387867a197f16e / 76006byte /390×844 /offset 0.0/end 207.0
- kavriva_e1013_native_R1-offline-1.png / offline / RAW SHA256 f4fa84f5724667a6a31d817484829c208b798e0b48ed89440494bab4cf74a04d / 65946byte /390×844 /offset 207.0/end 207.0
- kavriva_e1013_native_R1-details-0.png / details / RAW SHA256 3ec5a26efa1af93a6b74795b8fbf626d1b8dbdcf1c3c85c5bac7e55876ee0e31 / 76082byte /390×844 /offset 0.0/end 520.0
- kavriva_e1013_native_R1-details-1.png / details / RAW SHA256 1702df27f1eb70a38ff29a3a27802de8ec725a5caa4de424a1e44d42fa7e04df / 64639byte /390×844 /offset 520.0/end 520.0
- kavriva_e1013_native_R1-details-inactive-0.png / details-inactive / RAW SHA256 09881b3eecc2998088d6adb9bed188922f6e01ff7adb486f1743f49585fc62e6 / 78095byte /390×844 /offset 0.0/end 632.0
- kavriva_e1013_native_R1-details-inactive-1.png / details-inactive / RAW SHA256 ed6b8ddb2a7f5ce41de0af8509c89a6e75f3c8fa75ecd41c708bfc05ec6ea9fd / 67194byte /390×844 /offset 620.0/end 632.0
- kavriva_e1013_native_R1-details-inactive-2.png / details-inactive / RAW SHA256 b12345aec99eb222736048037e2093447d64e93c233dfdb636a84e190132942e / 65277byte /390×844 /offset 632.0/end 632.0
- kavriva_e1013_native_R1-details-long-0.png / details-long / RAW SHA256 5e0e68bfd8e4924cad05a5431d94eb54ec48281e4f627c12c850ea62dd494cd7 / 76885byte /390×844 /offset 0.0/end 586.0
- kavriva_e1013_native_R1-details-long-1.png / details-long / RAW SHA256 1702df27f1eb70a38ff29a3a27802de8ec725a5caa4de424a1e44d42fa7e04df / 64639byte /390×844 /offset 586.0/end 586.0
- kavriva_e1013_native_R1-missing-0.png / missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-source-missing-0.png / source-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-source-stale-0.png / source-stale / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-source-held-0.png / source-held / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-source-unknown-0.png / source-unknown / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-foreign-source-0.png / foreign-source / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-private-record-0.png / private-record / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-private-correction-0.png / private-correction / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-classification-missing-0.png / classification-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-reviewer-missing-0.png / reviewer-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-uncertainty-missing-0.png / uncertainty-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /390×844 /offset 0.0/end 0.0
- kavriva_e1013_native_R1-no-handler-0.png / no-handler / RAW SHA256 fedd65f5ff9609d211a0c3c67dd27a486a1fce7152da43d9196b551d8bd68081 / 72525byte /390×844 /offset 0.0/end 129.0
- kavriva_e1013_native_R1-no-handler-1.png / no-handler / RAW SHA256 fba92e3fc7324997ba51cc5883180fc4ae631aa310829963270b7c2125d7999d / 65561byte /390×844 /offset 129.0/end 129.0
- kavriva_e1013_native_R1-operation-held-0.png / operation-held / RAW SHA256 d1863c2efc3f01205f251c1eb1bace0c05be11d5f450256e04904501e5036af9 / 72521byte /390×844 /offset 0.0/end 129.0
- kavriva_e1013_native_R1-operation-held-1.png / operation-held / RAW SHA256 5c685865c56e6a40f6aee1ec17f0f876bd7de9bfa272db73b2e7577acb2e6345 / 65553byte /390×844 /offset 129.0/end 129.0
- kavriva_e1013_native_R1-busy-0.png / busy / RAW SHA256 2873ab1820b77a4baba081c8243824ac2b9c17f5640fc3b7d55603e91f3b12a3 / 70504byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-busy-1.png / busy / RAW SHA256 ae2121d7b760e7dc599bd7ae312fb33bb2872bc4437b39aa8868ecc64efeb099 / 62695byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-sent-0.png / sent / RAW SHA256 2873ab1820b77a4baba081c8243824ac2b9c17f5640fc3b7d55603e91f3b12a3 / 70504byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-sent-1.png / sent / RAW SHA256 ae2121d7b760e7dc599bd7ae312fb33bb2872bc4437b39aa8868ecc64efeb099 / 62695byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-failed-0.png / failed / RAW SHA256 c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8 / 74348byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-failed-1.png / failed / RAW SHA256 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558 / 66648byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-unknown-0.png / unknown / RAW SHA256 c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8 / 74348byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-unknown-1.png / unknown / RAW SHA256 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558 / 66648byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-unknown-querying-0.png / unknown-querying / RAW SHA256 94eef641256925aa9c683a7d88e9ec8cf3e7b9d30ecdb0ca3937969ef6835567 / 73000byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-unknown-querying-1.png / unknown-querying / RAW SHA256 d0a36e154f008b2b167accffe1094e373630b26661af886e8b00852156a6f653 / 65222byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-received-unproven-0.png / received-unproven / RAW SHA256 c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8 / 74348byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-received-unproven-1.png / received-unproven / RAW SHA256 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558 / 66648byte /390×844 /offset 107.0/end 107.0
- kavriva_e1013_native_R1-received-confirmed-0.png / received-confirmed / RAW SHA256 b1abc98dd82f0294d189583604087bb0e2f857be4b153f1ea0edaa386b0297fa / 71541byte /390×844 /offset 0.0/end 107.0
- kavriva_e1013_native_R1-received-confirmed-1.png / received-confirmed / RAW SHA256 ce9789c61f37cae782cae3ef332d48c0286673e1a3535b5380969d36bbf26d76 / 63868byte /390×844 /offset 107.0/end 107.0

## Yerel ham günlük kimlikleri

- kavriva_e1013_native_R1.log / RAW SHA256 b4ee3244c7c529df0019c5d6df3ab2f52ff3c627caf95634dfc4506ac9cf7c5f / 270byte
- kavriva_e1013_pubget.log / RAW SHA256 0f6f606fe6106606054e3e430c19492c9b51de46c4a608eef235b1e595dc13d4 / 287byte
- kavriva_e1013_R1_analyze.log / RAW SHA256 957b442f9c44853ca4e65091dc6051585aba4f48f1effcacc5cb8bcada2e7274 / 829byte
- kavriva_e1013_R1_format.log / RAW SHA256 cd80df313158e828a8a316123de866fd15c343b66b7f357a486488eb708ab495 / 49byte
- kavriva_e1013_R1_graph.log / RAW SHA256 0e709acb7f12eb8e78820c943fd57878250e67a5632264ed38ef9d656ae2504f / 8178byte
- kavriva_e1013_R1_target_tests.log / RAW SHA256 ac36ef9ee454a9d15b69007618bcdb529997b9ff54316e86dc60732f46caebae / 4852byte
- kavriva_e1013_R2_analyze.log / RAW SHA256 ec936624566bbb88a0f6c1ffff638ec265bd7e55ccee8b8ac7485c1c74cc9154 / 98byte
- kavriva_e1013_R2_format.log / RAW SHA256 6d123c3e2e502933ce11809b44d5f9da0aef96059378566ca51d27bf569618d4 / 49byte
- kavriva_e1013_R2_target_tests.log / RAW SHA256 d62a38e59e62d34719da19c99f7b3597140b23971cdee5fd8bb36f82f7b9ed5c / 1397byte
- kavriva_e1013_R3_analyze.log / RAW SHA256 3297ca21b1c7a14ca7f042ab19ee4b0c4e5e39d3090014eaef34d07eb999f97c / 99byte
- kavriva_e1013_R3_full_tests.log / RAW SHA256 438fc0ad379a9248d5e77d0587d0c09140f016686ce5881e3e9ff8cc76f82607 / 63905byte
- kavriva_e1013_R4_full_tests.log / RAW SHA256 134cf46b4692b21760fd7e9d9b4e37831b81c961eb908a082b76357f20d02755 / 62603byte
- kavriva_e1013_R4_semantics_test.log / RAW SHA256 fe8c8c09662439829ba7775747e086004121fe3a459003c43cac308b36728fff / 272byte


## Gerçek referans kimliği

[
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1013_readahead_I05-SCR-029-Critical-Correction-Safety-Reach-Back.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/I05-SCR-029-Critical-Correction-Safety-Reach-Back.png",
    "sha256": "d961c8b8b5f2c8361eba57584b0e2cc6e4b45c7b29cf6a088964371b9950a5bb",
    "rootActualOpened": true,
    "dimensions": [
      887,
      1774
    ]
  }
]


`vault/PROFILES/correction-reachback-render.md`; `vault/PACKS/P-E1-013.md`; `vault/REGISTRY/T-E1-013.md`; `vault/EVIDENCE/E-DEV-111.md`.

## İlk bağımsız okuma — Q12 kısmi

Root özgün raporun tamamını okudu. 51görüntü gerçekten açılmış; 12sabitsoru içindeQ12 ayrıntı/geçmiş bakmanın otomatik uygulama başlatmadığı anlamını ekrandan kesinleştiremedi. T013ilkoku kabulü yoktur; dar metin onarımı ve yeni geçmişsiz okuma gerekir. Graph kapalıverdict listesi IN_PROGRESS değerini reddetti; kayıt RECORDED düzeltildi, görev IN_PROGRESS ve kabul yok. Ana99/107değişmez.

RAW SHA256 0b46a295edf8ea7bc5eb21af22d4a3eef9c84c04f1da19616dc691e6434bb368 / 13676byte

T-E1-013 — İlk görsel okuma

Yöntem ve sınır
- Sabit soru kaynağı: correction_reachback_reading_questions.json içindeki 12 soru.
- Görsel kaynağı: kavriva_e1013_R1_images.json içinde listelenen 51 PNG. Manifestteki durum sırası korunarak her yol view_image(detail="original") ile açıldı. 51/51 açma çağrısı yapıldı; tekrarlanan SHA-256 değerli dosyalar aynı görüntü içeriğini taşıyor.
- Bu, yalnızca AI görsel okumasıdır. Gerçek insan, telefon, işletim sistemi, üretim işlemi, işlem sonucu veya kimlik kanıtı değildir.
- Yanıtlar yalnız görünen ekran yazılarına ve sabit sorulara dayanır. "Örnek" olarak etiketlenen içerik gerçek motosiklet veya gerçek işlem bilgisi diye yorumlanamaz.

Sorulara yanıtlar

1. Ekran, sonradan yapılan düzeltmenin etkilenen kayıtta kullanılmış bilgiyi etkilediğini söylüyor. Örneğin fren balatası kontrolü kaydı gösteriliyor. Düzeltme türü ekran varyantına göre değişiyor: güvenlik bilgisini, kullanılmış teknik değeri, uygulanmış önemli adımı veya yalnız anlatım biçimini etkileyen varyantlar var. Ayrıntılarda önceki ve düzeltilmiş bilgi ile önceki işe etkisinin yeniden değerlendirilmesi gerektiği yazıyor.

2. Yalnız anlatım düzeltmesi olduğu her ekranda söylenmiyor. Anlatım varyantı “anlatım düzeltmesi” ve “daha açık yazıldı” diyor; başka varyantlar güvenlik uyarısını, kullanılmış teknik değeri veya uygulanmış önemli adımı etkilediğini açıkça belirtiyor. Önem, ekrandaki etki sınıfından anlaşılabiliyor. Sayısal bir önem/zarar derecesi veya gerçek dünyadaki sonuç görünmüyor.

3. Motosiklet “Örnek motosiklet A · kullanıcı beyanı”; etkilenen kayıt “Fren balatası kontrolü · örnek kayıt”. Önceki bakım tarihi 04.10.2026 olarak gösteriliyor. Ayrıntılar ekranında düzeltme zamanı 06.10.2026, kaynak “Örnek bilgi kaynağı · sürüm 2 · örnek bölüm” olarak yazıyor. Gerçek marka/model veya gerçek motosiklet kimliği görünmüyor.

4. Devam etmeden önce kaydın mevcut duruma etkisini yeniden değerlendirmek; ekrandaki temel eylem “Yeniden kontrol et”. Görsel, bu eylemin fiziksel kontrolün gerçekten yapıldığı anlamına geldiğini söylemiyor.

5. Hayır. Ekran açıkça, mesaja veya düğmeye basmanın bakımın yeniden kontrol edildiğini ya da motosikletin güvenli olduğunu kanıtlamadığını belirtiyor.

6. Evet, gösterilen örnekte motosiklet pasifken düzeltme ve izinli kayıt geçmişinin okunabileceği yazıyor. Paket değişmiş olsa da düzeltme ve izinli kayıt geçmişinin ücret kapısına alınmayacağı belirtiliyor. Bu, ekrandaki izinli içerikle sınırlı.

7. Hayır. Ayrıntılarda düzeltmenin önceki kaydı ve bağımsız kanıt izini silmediği; bir iddiayı kendiliğinden kazanan, doğrulanmış veya tamamlanmış yapmadığı yazıyor.

8. Görünen cevap hayır: güncel kayıt ve erişim bilgisi gerektiği, özel ayrıntıların kapalı olduğu belirtiliyor. Eksik/eski/başka kaynağa ilişkin varyant ekranları aynı “Düzeltme bilgisi şu an açılamıyor” durumunu gösteriyor; yalnız Destek ve Çık seçenekleri görünüyor. Gerçek işlem veya özel kayıt izni açıldığına dair işaret yok.

9. Etkilenen kayıt ana ekrandaki “Etkilenen kayıt” bölümünde. Düzeltmenin önce/şimdi bilgisi, zamanı, gerekçesi, kaynağı, inceleyeni ve açık kalan belirsizlikler ayrıntılardaki “Değişen bilgi ve korunan iz” bölümünde. Ekranda ayrı bir iddia kimliği görünmüyor; görünen örnek, fren balatası kontrol kaydı ve “kullanıcının önceki bakım beyanı; fiziksel iş doğrulanmadı” açıklaması.

10. Hayır. Çevrimdışı ekran, eski bilginin güncel kontrol veya riskin geçtiği anlamına gelmediğini açıkça söylüyor. Yeni kontrol isteği kapalı; kaydı okumak mümkün olsa da güncel işlem izni ve bağlantı gerekiyor.

11. Yeni istek göndermeden aynı isteğin sonucunu sorgulamak gerekiyor. Belirsiz sonuç ekranında bu yönerge ve “Aynı isteğin sonucunu sorgula” düğmesi var. Sorgu sürerken ayrıca yeni kontrol isteği gönderilmediği yazıyor.

12. Ekranlar, ayrıntılara veya eski kayda bakmanın uygulamayı otomatik başlattığını göstermiyor. “Düzeltmenin ayrıntıları”, “Etkilenen kayda bak” ve “Yeniden kontrol et” ayrı eylemler olarak görünüyor; otomatik başlatma davranışı bu sabit görsellerden kesinleştirilemiyor. Bu soru görsellerden tam doğrulanamıyor.

Görsel sayımı ve ham SHA/byte bilgisi
- PNG sayısı: 51; manifest durum sırasına göre 51/51 için view_image(detail="original") çağrıldı.
- PNG dosya boyutları toplamı (JSON manifestindeki bytes alanı): 3,034,367 bayt.
- Listelenen SHA-256 özeti: 51 adet × 32 ham bayt = 1,632 ham özet baytı (3,264 onaltılık karakter); 34 benzersiz SHA-256 değeri.
- Aşağıda manifestteki her görselin durum etiketi, yolu, ham PNG boyutu ve SHA-256 değeri yer alır.

Durum | Yol | PNG bayt | SHA-256

safety | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-safety-0.png | 67439 | feab1dd99a3c099bf8e456088194564c77c6cb14422196a258d597a4f6abd298

safety | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-safety-1.png | 64135 | d4a194fac4e6b64c1d957bb674dc06f8e44d7c07bbeca596e449c97c808daadf

technical-value | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-technical-value-0.png | 66711 | cadd86a760865dca761e957430459daec61ba0b86dad25a5d38fb8899136aad2

technical-value | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-technical-value-1.png | 63366 | 59dd98941b7815287ed863c959925a35bae22963e768d876bf4276e7166a6675

critical-step | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-critical-step-0.png | 66548 | 108fc84f7e0c069be1b4dc072b53666ee190890b631d25e628a5cb80f7b4ef23

critical-step | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-critical-step-1.png | 63201 | 3275ff9a8dfa3430c3d982479b6b942f538ba7c78be9fe86df9e97313062d4de

narrative | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-narrative-0.png | 59300 | f1e0574ba2cac3d1a43cb1db3e28ff211ed4465bd9adf9771a75f3fdbe7c682c

inactive | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-inactive-0.png | 71017 | 8eef21135e7bf663eaf49d4b5653eac999a012c385f3d3ef044ea8ff31dfaef5

inactive | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-inactive-1.png | 63303 | efb01329bc36e2e49553f2babab86e714356f40d36cfc48c749b832d16d8ff74

entitlement-changed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-entitlement-changed-0.png | 72498 | a4461656e343ecbff7976948db5aad6f46f08883b4ad89e143de6ee0b21d9044

entitlement-changed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-entitlement-changed-1.png | 64774 | ae57f7cdc8d8800a009de1afd9d8314ee0a8a4c1465b352bc71c2e4268e9adee

inactive-entitlement | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-inactive-entitlement-0.png | 76339 | 7f3eeb6950d3f25f846258f2642a2ad7930a884c2cabfc9170747f0626b3cd63

inactive-entitlement | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-inactive-entitlement-1.png | 66985 | f2dfc0d59d1d55d4a7497cf067797431fea126497a3a644b306b07605f165115

offline | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-offline-0.png | 76006 | e6c360842f3376d3882de80768dd0b62b3944d1200bf9a964f387867a197f16e

offline | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-offline-1.png | 65946 | f4fa84f5724667a6a31d817484829c208b798e0b48ed89440494bab4cf74a04d

details | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-0.png | 76082 | 3ec5a26efa1af93a6b74795b8fbf626d1b8dbdcf1c3c85c5bac7e55876ee0e31

details | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-1.png | 64639 | 1702df27f1eb70a38ff29a3a27802de8ec725a5caa4de424a1e44d42fa7e04df

details-inactive | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-inactive-0.png | 78095 | 09881b3eecc2998088d6adb9bed188922f6e01ff7adb486f1743f49585fc62e6

details-inactive | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-inactive-1.png | 67194 | ed6b8ddb2a7f5ce41de0af8509c89a6e75f3c8fa75ecd41c708bfc05ec6ea9fd

details-inactive | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-inactive-2.png | 65277 | b12345aec99eb222736048037e2093447d64e93c233dfdb636a84e190132942e

details-long | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-long-0.png | 76885 | 5e0e68bfd8e4924cad05a5431d94eb54ec48281e4f627c12c850ea62dd494cd7

details-long | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-details-long-1.png | 64639 | 1702df27f1eb70a38ff29a3a27802de8ec725a5caa4de424a1e44d42fa7e04df

missing | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-missing-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

source-missing | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-source-missing-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

source-stale | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-source-stale-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

source-held | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-source-held-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

source-unknown | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-source-unknown-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

foreign-source | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-foreign-source-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

private-record | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-private-record-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

private-correction | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-private-correction-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

classification-missing | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-classification-missing-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

reviewer-missing | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-reviewer-missing-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

uncertainty-missing | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-uncertainty-missing-0.png | 26801 | 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7

no-handler | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-no-handler-0.png | 72525 | fedd65f5ff9609d211a0c3c67dd27a486a1fce7152da43d9196b551d8bd68081

no-handler | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-no-handler-1.png | 65561 | fba92e3fc7324997ba51cc5883180fc4ae631aa310829963270b7c2125d7999d

operation-held | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-operation-held-0.png | 72521 | d1863c2efc3f01205f251c1eb1bace0c05be11d5f450256e04904501e5036af9

operation-held | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-operation-held-1.png | 65553 | 5c685865c56e6a40f6aee1ec17f0f876bd7de9bfa272db73b2e7577acb2e6345

busy | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-busy-0.png | 70504 | 2873ab1820b77a4baba081c8243824ac2b9c17f5640fc3b7d55603e91f3b12a3

busy | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-busy-1.png | 62695 | ae2121d7b760e7dc599bd7ae312fb33bb2872bc4437b39aa8868ecc64efeb099

sent | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-sent-0.png | 70504 | 2873ab1820b77a4baba081c8243824ac2b9c17f5640fc3b7d55603e91f3b12a3

sent | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-sent-1.png | 62695 | ae2121d7b760e7dc599bd7ae312fb33bb2872bc4437b39aa8868ecc64efeb099

failed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-failed-0.png | 74348 | c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8

failed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-failed-1.png | 66648 | 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558

unknown | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-unknown-0.png | 74348 | c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8

unknown | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-unknown-1.png | 66648 | 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558

unknown-querying | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-unknown-querying-0.png | 73000 | 94eef641256925aa9c683a7d88e9ec8cf3e7b9d30ecdb0ca3937969ef6835567

unknown-querying | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-unknown-querying-1.png | 65222 | d0a36e154f008b2b167accffe1094e373630b26661af886e8b00852156a6f653

received-unproven | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-received-unproven-0.png | 74348 | c49f2148656fa719dfd9640cd367d479ad9f6ac38abde40ca285a3876ca1cfa8

received-unproven | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-received-unproven-1.png | 66648 | 674e7e0116b5d4c87e412b22b58d1ed0f56120aedcd946c7017fa45b3ef7b558

received-confirmed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-received-confirmed-0.png | 71541 | b1abc98dd82f0294d189583604087bb0e2f857be4b153f1ea0edaa386b0297fa

received-confirmed | C:/Users/Xpike/AppData/Local/Temp/kavriva_e1013_native_R1-received-confirmed-1.png | 63868 | ce9789c61f37cae782cae3ef332d48c0286673e1a3535b5380969d36bbf26d76



## Özgün ilk okuma ham baytları

```base64
VC1FMS0wMTMg4oCUIMSwbGsgZ8O2cnNlbCBva3VtYQoKWcO2bnRlbSB2ZSBzxLFuxLFyCi0gU2FiaXQgc29ydSBrYXluYcSfxLE6IGNvcnJlY3Rpb25fcmVhY2hiYWNrX3JlYWRpbmdfcXVlc3Rpb25zLmpzb24gacOnaW5kZWtpIDEyIHNvcnUuCi0gR8O2cnNlbCBrYXluYcSfxLE6IGthdnJpdmFfZTEwMTNfUjFfaW1hZ2VzLmpzb24gacOnaW5kZSBsaXN0ZWxlbmVuIDUxIFBORy4gTWFuaWZlc3R0ZWtpIGR1cnVtIHPEsXJhc8SxIGtvcnVuYXJhayBoZXIgeW9sIHZpZXdfaW1hZ2UoZGV0YWlsPSJvcmlnaW5hbCIpIGlsZSBhw6fEsWxkxLEuIDUxLzUxIGHDp21hIMOnYcSfcsSxc8SxIHlhcMSxbGTEsTsgdGVrcmFybGFuYW4gU0hBLTI1NiBkZcSfZXJsaSBkb3N5YWxhciBheW7EsSBnw7Zyw7xudMO8IGnDp2VyacSfaW5pIHRhxZ/EsXlvci4KLSBCdSwgeWFsbsSxemNhIEFJIGfDtnJzZWwgb2t1bWFzxLFkxLFyLiBHZXLDp2VrIGluc2FuLCB0ZWxlZm9uLCBpxZ9sZXRpbSBzaXN0ZW1pLCDDvHJldGltIGnFn2xlbWksIGnFn2xlbSBzb251Y3UgdmV5YSBraW1saWsga2FuxLF0xLEgZGXEn2lsZGlyLgotIFlhbsSxdGxhciB5YWxuxLF6IGfDtnLDvG5lbiBla3JhbiB5YXrEsWxhcsSxbmEgdmUgc2FiaXQgc29ydWxhcmEgZGF5YW7EsXIuICLDlnJuZWsiIG9sYXJhayBldGlrZXRsZW5lbiBpw6dlcmlrIGdlcsOnZWsgbW90b3Npa2xldCB2ZXlhIGdlcsOnZWsgacWfbGVtIGJpbGdpc2kgZGl5ZSB5b3J1bWxhbmFtYXouCgpTb3J1bGFyYSB5YW7EsXRsYXIKCjEuIEVrcmFuLCBzb25yYWRhbiB5YXDEsWxhbiBkw7x6ZWx0bWVuaW4gZXRraWxlbmVuIGthecSxdHRhIGt1bGxhbsSxbG3EscWfIGJpbGdpeWkgZXRraWxlZGnEn2luaSBzw7Z5bMO8eW9yLiDDlnJuZcSfaW4gZnJlbiBiYWxhdGFzxLEga29udHJvbMO8IGtheWTEsSBnw7ZzdGVyaWxpeW9yLiBEw7x6ZWx0bWUgdMO8csO8IGVrcmFuIHZhcnlhbnTEsW5hIGfDtnJlIGRlxJ9pxZ9peW9yOiBnw7x2ZW5saWsgYmlsZ2lzaW5pLCBrdWxsYW7EsWxtxLHFnyB0ZWtuaWsgZGXEn2VyaSwgdXlndWxhbm3EscWfIMO2bmVtbGkgYWTEsW3EsSB2ZXlhIHlhbG7EsXogYW5sYXTEsW0gYmnDp2ltaW5pIGV0a2lsZXllbiB2YXJ5YW50bGFyIHZhci4gQXlyxLFudMSxbGFyZGEgw7ZuY2VraSB2ZSBkw7x6ZWx0aWxtacWfIGJpbGdpIGlsZSDDtm5jZWtpIGnFn2UgZXRraXNpbmluIHllbmlkZW4gZGXEn2VybGVuZGlyaWxtZXNpIGdlcmVrdGnEn2kgeWF6xLF5b3IuCgoyLiBZYWxuxLF6IGFubGF0xLFtIGTDvHplbHRtZXNpIG9sZHXEn3UgaGVyIGVrcmFuZGEgc8O2eWxlbm1peW9yLiBBbmxhdMSxbSB2YXJ5YW50xLEg4oCcYW5sYXTEsW0gZMO8emVsdG1lc2nigJ0gdmUg4oCcZGFoYSBhw6fEsWsgeWF6xLFsZMSx4oCdIGRpeW9yOyBiYcWfa2EgdmFyeWFudGxhciBnw7x2ZW5saWsgdXlhcsSxc8SxbsSxLCBrdWxsYW7EsWxtxLHFnyB0ZWtuaWsgZGXEn2VyaSB2ZXlhIHV5Z3VsYW5txLHFnyDDtm5lbWxpIGFkxLFtxLEgZXRraWxlZGnEn2luaSBhw6fEsWvDp2EgYmVsaXJ0aXlvci4gw5ZuZW0sIGVrcmFuZGFraSBldGtpIHPEsW7EsWbEsW5kYW4gYW5sYcWfxLFsYWJpbGl5b3IuIFNhecSxc2FsIGJpciDDtm5lbS96YXJhciBkZXJlY2VzaSB2ZXlhIGdlcsOnZWsgZMO8bnlhZGFraSBzb251w6cgZ8O2csO8bm3DvHlvci4KCjMuIE1vdG9zaWtsZXQg4oCcw5ZybmVrIG1vdG9zaWtsZXQgQSDCtyBrdWxsYW7EsWPEsSBiZXlhbsSx4oCdOyBldGtpbGVuZW4ga2F5xLF0IOKAnEZyZW4gYmFsYXRhc8SxIGtvbnRyb2zDvCDCtyDDtnJuZWsga2F5xLF04oCdLiDDlm5jZWtpIGJha8SxbSB0YXJpaGkgMDQuMTAuMjAyNiBvbGFyYWsgZ8O2c3RlcmlsaXlvci4gQXlyxLFudMSxbGFyIGVrcmFuxLFuZGEgZMO8emVsdG1lIHphbWFuxLEgMDYuMTAuMjAyNiwga2F5bmFrIOKAnMOWcm5layBiaWxnaSBrYXluYcSfxLEgwrcgc8O8csO8bSAyIMK3IMO2cm5layBiw7Zsw7xt4oCdIG9sYXJhayB5YXrEsXlvci4gR2Vyw6dlayBtYXJrYS9tb2RlbCB2ZXlhIGdlcsOnZWsgbW90b3Npa2xldCBraW1sacSfaSBnw7Zyw7xubcO8eW9yLgoKNC4gRGV2YW0gZXRtZWRlbiDDtm5jZSBrYXlkxLFuIG1ldmN1dCBkdXJ1bWEgZXRraXNpbmkgeWVuaWRlbiBkZcSfZXJsZW5kaXJtZWs7IGVrcmFuZGFraSB0ZW1lbCBleWxlbSDigJxZZW5pZGVuIGtvbnRyb2wgZXTigJ0uIEfDtnJzZWwsIGJ1IGV5bGVtaW4gZml6aWtzZWwga29udHJvbMO8biBnZXLDp2VrdGVuIHlhcMSxbGTEscSfxLEgYW5sYW3EsW5hIGdlbGRpxJ9pbmkgc8O2eWxlbWl5b3IuCgo1LiBIYXnEsXIuIEVrcmFuIGHDp8Sxa8OnYSwgbWVzYWphIHZleWEgZMO8xJ9tZXllIGJhc21hbsSxbiBiYWvEsW3EsW4geWVuaWRlbiBrb250cm9sIGVkaWxkacSfaW5pIHlhIGRhIG1vdG9zaWtsZXRpbiBnw7x2ZW5saSBvbGR1xJ91bnUga2FuxLF0bGFtYWTEscSfxLFuxLEgYmVsaXJ0aXlvci4KCjYuIEV2ZXQsIGfDtnN0ZXJpbGVuIMO2cm5la3RlIG1vdG9zaWtsZXQgcGFzaWZrZW4gZMO8emVsdG1lIHZlIGl6aW5saSBrYXnEsXQgZ2XDp21pxZ9pbmluIG9rdW5hYmlsZWNlxJ9pIHlhesSxeW9yLiBQYWtldCBkZcSfacWfbWnFnyBvbHNhIGRhIGTDvHplbHRtZSB2ZSBpemlubGkga2F5xLF0IGdlw6dtacWfaW5pbiDDvGNyZXQga2FwxLFzxLFuYSBhbMSxbm1heWFjYcSfxLEgYmVsaXJ0aWxpeW9yLiBCdSwgZWtyYW5kYWtpIGl6aW5saSBpw6dlcmlrbGUgc8SxbsSxcmzEsS4KCjcuIEhhecSxci4gQXlyxLFudMSxbGFyZGEgZMO8emVsdG1lbmluIMO2bmNla2kga2F5ZMSxIHZlIGJhxJ/EsW1zxLF6IGthbsSxdCBpemluaSBzaWxtZWRpxJ9pOyBiaXIgaWRkaWF5xLEga2VuZGlsacSfaW5kZW4ga2F6YW5hbiwgZG/En3J1bGFubcSxxZ8gdmV5YSB0YW1hbWxhbm3EscWfIHlhcG1hZMSxxJ/EsSB5YXrEsXlvci4KCjguIEfDtnLDvG5lbiBjZXZhcCBoYXnEsXI6IGfDvG5jZWwga2F5xLF0IHZlIGVyacWfaW0gYmlsZ2lzaSBnZXJla3RpxJ9pLCDDtnplbCBheXLEsW50xLFsYXLEsW4ga2FwYWzEsSBvbGR1xJ91IGJlbGlydGlsaXlvci4gRWtzaWsvZXNraS9iYcWfa2Ega2F5bmHEn2EgaWxpxZ9raW4gdmFyeWFudCBla3JhbmxhcsSxIGF5bsSxIOKAnETDvHplbHRtZSBiaWxnaXNpIMWfdSBhbiBhw6fEsWxhbcSxeW9y4oCdIGR1cnVtdW51IGfDtnN0ZXJpeW9yOyB5YWxuxLF6IERlc3RlayB2ZSDDh8SxayBzZcOnZW5la2xlcmkgZ8O2csO8bsO8eW9yLiBHZXLDp2VrIGnFn2xlbSB2ZXlhIMO2emVsIGthecSxdCBpem5pIGHDp8SxbGTEscSfxLFuYSBkYWlyIGnFn2FyZXQgeW9rLgoKOS4gRXRraWxlbmVuIGthecSxdCBhbmEgZWtyYW5kYWtpIOKAnEV0a2lsZW5lbiBrYXnEsXTigJ0gYsO2bMO8bcO8bmRlLiBEw7x6ZWx0bWVuaW4gw7ZuY2UvxZ9pbWRpIGJpbGdpc2ksIHphbWFuxLEsIGdlcmVrw6dlc2ksIGtheW5hxJ/EsSwgaW5jZWxleWVuaSB2ZSBhw6fEsWsga2FsYW4gYmVsaXJzaXpsaWtsZXIgYXlyxLFudMSxbGFyZGFraSDigJxEZcSfacWfZW4gYmlsZ2kgdmUga29ydW5hbiBpeuKAnSBiw7Zsw7xtw7xuZGUuIEVrcmFuZGEgYXlyxLEgYmlyIGlkZGlhIGtpbWxpxJ9pIGfDtnLDvG5tw7x5b3I7IGfDtnLDvG5lbiDDtnJuZWssIGZyZW4gYmFsYXRhc8SxIGtvbnRyb2wga2F5ZMSxIHZlIOKAnGt1bGxhbsSxY8SxbsSxbiDDtm5jZWtpIGJha8SxbSBiZXlhbsSxOyBmaXppa3NlbCBpxZ8gZG/En3J1bGFubWFkxLHigJ0gYcOnxLFrbGFtYXPEsS4KCjEwLiBIYXnEsXIuIMOHZXZyaW1kxLHFn8SxIGVrcmFuLCBlc2tpIGJpbGdpbmluIGfDvG5jZWwga29udHJvbCB2ZXlhIHJpc2tpbiBnZcOndGnEn2kgYW5sYW3EsW5hIGdlbG1lZGnEn2luaSBhw6fEsWvDp2Egc8O2eWzDvHlvci4gWWVuaSBrb250cm9sIGlzdGXEn2kga2FwYWzEsTsga2F5ZMSxIG9rdW1hayBtw7xta8O8biBvbHNhIGRhIGfDvG5jZWwgacWfbGVtIGl6bmkgdmUgYmHEn2xhbnTEsSBnZXJla2l5b3IuCgoxMS4gWWVuaSBpc3RlayBnw7ZuZGVybWVkZW4gYXluxLEgaXN0ZcSfaW4gc29udWN1bnUgc29yZ3VsYW1hayBnZXJla2l5b3IuIEJlbGlyc2l6IHNvbnXDpyBla3JhbsSxbmRhIGJ1IHnDtm5lcmdlIHZlIOKAnEF5bsSxIGlzdGXEn2luIHNvbnVjdW51IHNvcmd1bGHigJ0gZMO8xJ9tZXNpIHZhci4gU29yZ3Ugc8O8cmVya2VuIGF5csSxY2EgeWVuaSBrb250cm9sIGlzdGXEn2kgZ8O2bmRlcmlsbWVkacSfaSB5YXrEsXlvci4KCjEyLiBFa3JhbmxhciwgYXlyxLFudMSxbGFyYSB2ZXlhIGVza2kga2F5ZGEgYmFrbWFuxLFuIHV5Z3VsYW1hecSxIG90b21hdGlrIGJhxZ9sYXR0xLHEn8SxbsSxIGfDtnN0ZXJtaXlvci4g4oCcRMO8emVsdG1lbmluIGF5csSxbnTEsWxhcsSx4oCdLCDigJxFdGtpbGVuZW4ga2F5ZGEgYmFr4oCdIHZlIOKAnFllbmlkZW4ga29udHJvbCBldOKAnSBheXLEsSBleWxlbWxlciBvbGFyYWsgZ8O2csO8bsO8eW9yOyBvdG9tYXRpayBiYcWfbGF0bWEgZGF2cmFuxLHFn8SxIGJ1IHNhYml0IGfDtnJzZWxsZXJkZW4ga2VzaW5sZcWfdGlyaWxlbWl5b3IuIEJ1IHNvcnUgZ8O2cnNlbGxlcmRlbiB0YW0gZG/En3J1bGFuYW3EsXlvci4KCkfDtnJzZWwgc2F5xLFtxLEgdmUgaGFtIFNIQS9ieXRlIGJpbGdpc2kKLSBQTkcgc2F5xLFzxLE6IDUxOyBtYW5pZmVzdCBkdXJ1bSBzxLFyYXPEsW5hIGfDtnJlIDUxLzUxIGnDp2luIHZpZXdfaW1hZ2UoZGV0YWlsPSJvcmlnaW5hbCIpIMOnYcSfcsSxbGTEsS4KLSBQTkcgZG9zeWEgYm95dXRsYXLEsSB0b3BsYW3EsSAoSlNPTiBtYW5pZmVzdGluZGVraSBieXRlcyBhbGFuxLEpOiAzLDAzNCwzNjcgYmF5dC4KLSBMaXN0ZWxlbmVuIFNIQS0yNTYgw7Z6ZXRpOiA1MSBhZGV0IMOXIDMyIGhhbSBiYXl0ID0gMSw2MzIgaGFtIMO2emV0IGJheXTEsSAoMywyNjQgb25hbHTEsWzEsWsga2FyYWt0ZXIpOyAzNCBiZW56ZXJzaXogU0hBLTI1NiBkZcSfZXJpLgotIEHFn2HEn8SxZGEgbWFuaWZlc3R0ZWtpIGhlciBnw7Zyc2VsaW4gZHVydW0gZXRpa2V0aSwgeW9sdSwgaGFtIFBORyBib3l1dHUgdmUgU0hBLTI1NiBkZcSfZXJpIHllciBhbMSxci4KCkR1cnVtIHwgWW9sIHwgUE5HIGJheXQgfCBTSEEtMjU2DQpzYWZldHkgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtc2FmZXR5LTAucG5nIHwgNjc0MzkgfCBmZWFiMWRkOTlhM2MwOTliZjhlNDU2MDg4MTk0NTY0Yzc3YzZjYjE0NDIyMTk2YTI1OGQ1OTdhNGY2YWJkMjk4DQpzYWZldHkgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtc2FmZXR5LTEucG5nIHwgNjQxMzUgfCBkNGExOTRmYWM0ZTZiNjRjMWQ5NTdiYjY3NGRjMDZmOGU0NGQ3YzA3YmJlY2E1OTZlNDQ5Yzk3YzgwOGRhYWRmDQp0ZWNobmljYWwtdmFsdWUgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtdGVjaG5pY2FsLXZhbHVlLTAucG5nIHwgNjY3MTEgfCBjYWRkODZhNzYwODY1ZGNhNzYxZTk1NzQzMDQ1OWRhZWM2MWJhMGI4NmRhZDI1YTVkMzhmYjg4OTkxMzZhYWQyDQp0ZWNobmljYWwtdmFsdWUgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtdGVjaG5pY2FsLXZhbHVlLTEucG5nIHwgNjMzNjYgfCA1OWRkOTg5NDFiNzgxNTI4N2VkODYzYzk1OTkyNWEzNWJhZTIyOTYzZTc2OGQ4NzZiZjQyNzZlNzE2NmE2Njc1DQpjcml0aWNhbC1zdGVwIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWNyaXRpY2FsLXN0ZXAtMC5wbmcgfCA2NjU0OCB8IDEwOGZjODRmN2UwYzA2OWJlMWI0ZGMwNzJiNTM2NjZlZTE5MDg5MGI2MzFkMjVlNjI4YTVjYjgwZjdiNGVmMjMNCmNyaXRpY2FsLXN0ZXAgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtY3JpdGljYWwtc3RlcC0xLnBuZyB8IDYzMjAxIHwgMzI3NWZmOWE4ZGZhMzQzMGMzZDk4MjQ3OWI2Yjk0MmY1MzhiYTdjNzhiZTlmZTg2ZGY5ZTk3MzEzMDYyZDRkZQ0KbmFycmF0aXZlIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLW5hcnJhdGl2ZS0wLnBuZyB8IDU5MzAwIHwgZjFlMDU3NGJhMmNhYzNkMWE0M2NiMWRiM2UyOGZmMjExZWQ0NDY1YmQ5YWRmOTc3MWE3NWYzZmRiZTdjNjgyYw0KaW5hY3RpdmUgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtaW5hY3RpdmUtMC5wbmcgfCA3MTAxNyB8IDhlZWYyMTEzNWU3YmY2NjNlYWY0OWQ0YjU2NTNlYWM5OTlhMDEyYzM4NWYzZDNlZjA0NGVhOGZmMzFkZmFlZjUNCmluYWN0aXZlIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWluYWN0aXZlLTEucG5nIHwgNjMzMDMgfCBlZmIwMTMyOWJjMzZlMmU0OTU1M2YyYmFiYWI4NmU3MTQzNTZmNDBkMzZjZmM0OGM3NDliODMyZDE2ZDhmZjc0DQplbnRpdGxlbWVudC1jaGFuZ2VkIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWVudGl0bGVtZW50LWNoYW5nZWQtMC5wbmcgfCA3MjQ5OCB8IGE0NDYxNjU2ZTM0M2VjYmZmNzk3Njk0OGRiNWFhZDZmNDZmMDg4ODNiNGFkODllMTQzZGU2ZWUwYjIxZDkwNDQNCmVudGl0bGVtZW50LWNoYW5nZWQgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtZW50aXRsZW1lbnQtY2hhbmdlZC0xLnBuZyB8IDY0Nzc0IHwgYWU1N2Y3Y2RjOGQ4ODAwYTAwOWRlMWFmZDlkODMxNGVlMGE4YTRjMTQ2NWIzNTJiYzcxYzJlNDI2OGU5YWRlZQ0KaW5hY3RpdmUtZW50aXRsZW1lbnQgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtaW5hY3RpdmUtZW50aXRsZW1lbnQtMC5wbmcgfCA3NjMzOSB8IDdmM2VlYjY5NTBkM2YyNWY4NDYyNThmMjY0MmEyYWQ3OTMwYTg4NGMyY2FiZmM5MTcwNzQ3ZjA2MjZiM2NkNjMNCmluYWN0aXZlLWVudGl0bGVtZW50IHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWluYWN0aXZlLWVudGl0bGVtZW50LTEucG5nIHwgNjY5ODUgfCBmMmRmYzBkNTlkMWQ1NWQ0YTc0OTdjZjA2Nzc5NzQzMWZlYTEyNjQ5N2EzYTY0NGIzMDZiMDc2MDVmMTY1MTE1DQpvZmZsaW5lIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLW9mZmxpbmUtMC5wbmcgfCA3NjAwNiB8IGU2YzM2MDg0MmYzMzc2ZDM4ODJkZTgwNzY4ZGQwYjYyYjM5NDRkMTIwMGJmOWE5NjRmMzg3ODY3YTE5N2YxNmUNCm9mZmxpbmUgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtb2ZmbGluZS0xLnBuZyB8IDY1OTQ2IHwgZjRmYTg0ZjU3MjQ2NjdhNmEzMWQ4MTc0ODQ4MjljMjA4Yjc5OGUwYjQ4ZWQ4OTQ0MDQ5NGJhYjRjZjc0YTA0ZA0KZGV0YWlscyB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1kZXRhaWxzLTAucG5nIHwgNzYwODIgfCAzZWM1YTI2ZWZhMWFmOTNhNmI3NDc5NWI4ZmJmNjI2ZDFiOGRiZGNmMWMzYzg1YzViYWM3ZTU1ODc2ZWUwZTMxDQpkZXRhaWxzIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWRldGFpbHMtMS5wbmcgfCA2NDYzOSB8IDE3MDJkZjI3ZjFlYjcwYTM4ZmYyOWEzYTI3ODAyZGU4ZWM3MjVhNWNhYTRkZTQyNGExZTQ0ZDQyZmE3ZTA0ZGYNCmRldGFpbHMtaW5hY3RpdmUgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtZGV0YWlscy1pbmFjdGl2ZS0wLnBuZyB8IDc4MDk1IHwgMDk4ODFiM2VlY2MyOTk4MDg4ZDZhZGI5YmVkMTg4OTIyZjZlMDFmZjdhZGI0ODZmMTc0M2Y0OTU4NWZjNjJlNg0KZGV0YWlscy1pbmFjdGl2ZSB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1kZXRhaWxzLWluYWN0aXZlLTEucG5nIHwgNjcxOTQgfCBlZDZiOGRkYjJhN2Y1Y2U0MWRlMGFmODUwOWM4OWE2ZTc1ZjNjOGZhNzVlY2Q0MWM3MDhiZmMwNWVjNmVhOWZkDQpkZXRhaWxzLWluYWN0aXZlIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWRldGFpbHMtaW5hY3RpdmUtMi5wbmcgfCA2NTI3NyB8IGIxMjM0NWFlYzk5ZWIyMjI3MzYwNDgwMzdlMjA5MzQ0N2Q2NGU5M2MyMzNkZmRiNjM2YTg0ZTE5MDEzMjk0MmUNCmRldGFpbHMtbG9uZyB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1kZXRhaWxzLWxvbmctMC5wbmcgfCA3Njg4NSB8IDVlMGU2OGJmZDhlNDkyNGNhZDA1YTU0MzFkOTRlYjU0ZWM0ODI4MWU0ZjYyN2MxMmM4NTBlYTYyZGQ0OTRjZDcNCmRldGFpbHMtbG9uZyB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1kZXRhaWxzLWxvbmctMS5wbmcgfCA2NDYzOSB8IDE3MDJkZjI3ZjFlYjcwYTM4ZmYyOWEzYTI3ODAyZGU4ZWM3MjVhNWNhYTRkZTQyNGExZTQ0ZDQyZmE3ZTA0ZGYNCm1pc3NpbmcgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtbWlzc2luZy0wLnBuZyB8IDI2ODAxIHwgNWM2YjEzMGMyM2ZjMTlkNDcyMjZjMDZjMjNkMThiNTJjNzdjZTM4OWNhMGRkZjUzMWU1MDM0MjY4NjA3YmJhNw0Kc291cmNlLW1pc3NpbmcgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtc291cmNlLW1pc3NpbmctMC5wbmcgfCAyNjgwMSB8IDVjNmIxMzBjMjNmYzE5ZDQ3MjI2YzA2YzIzZDE4YjUyYzc3Y2UzODljYTBkZGY1MzFlNTAzNDI2ODYwN2JiYTcNCnNvdXJjZS1zdGFsZSB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1zb3VyY2Utc3RhbGUtMC5wbmcgfCAyNjgwMSB8IDVjNmIxMzBjMjNmYzE5ZDQ3MjI2YzA2YzIzZDE4YjUyYzc3Y2UzODljYTBkZGY1MzFlNTAzNDI2ODYwN2JiYTcNCnNvdXJjZS1oZWxkIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLXNvdXJjZS1oZWxkLTAucG5nIHwgMjY4MDEgfCA1YzZiMTMwYzIzZmMxOWQ0NzIyNmMwNmMyM2QxOGI1MmM3N2NlMzg5Y2EwZGRmNTMxZTUwMzQyNjg2MDdiYmE3DQpzb3VyY2UtdW5rbm93biB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1zb3VyY2UtdW5rbm93bi0wLnBuZyB8IDI2ODAxIHwgNWM2YjEzMGMyM2ZjMTlkNDcyMjZjMDZjMjNkMThiNTJjNzdjZTM4OWNhMGRkZjUzMWU1MDM0MjY4NjA3YmJhNw0KZm9yZWlnbi1zb3VyY2UgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtZm9yZWlnbi1zb3VyY2UtMC5wbmcgfCAyNjgwMSB8IDVjNmIxMzBjMjNmYzE5ZDQ3MjI2YzA2YzIzZDE4YjUyYzc3Y2UzODljYTBkZGY1MzFlNTAzNDI2ODYwN2JiYTcNCnByaXZhdGUtcmVjb3JkIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLXByaXZhdGUtcmVjb3JkLTAucG5nIHwgMjY4MDEgfCA1YzZiMTMwYzIzZmMxOWQ0NzIyNmMwNmMyM2QxOGI1MmM3N2NlMzg5Y2EwZGRmNTMxZTUwMzQyNjg2MDdiYmE3DQpwcml2YXRlLWNvcnJlY3Rpb24gfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtcHJpdmF0ZS1jb3JyZWN0aW9uLTAucG5nIHwgMjY4MDEgfCA1YzZiMTMwYzIzZmMxOWQ0NzIyNmMwNmMyM2QxOGI1MmM3N2NlMzg5Y2EwZGRmNTMxZTUwMzQyNjg2MDdiYmE3DQpjbGFzc2lmaWNhdGlvbi1taXNzaW5nIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWNsYXNzaWZpY2F0aW9uLW1pc3NpbmctMC5wbmcgfCAyNjgwMSB8IDVjNmIxMzBjMjNmYzE5ZDQ3MjI2YzA2YzIzZDE4YjUyYzc3Y2UzODljYTBkZGY1MzFlNTAzNDI2ODYwN2JiYTcNCnJldmlld2VyLW1pc3NpbmcgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtcmV2aWV3ZXItbWlzc2luZy0wLnBuZyB8IDI2ODAxIHwgNWM2YjEzMGMyM2ZjMTlkNDcyMjZjMDZjMjNkMThiNTJjNzdjZTM4OWNhMGRkZjUzMWU1MDM0MjY4NjA3YmJhNw0KdW5jZXJ0YWludHktbWlzc2luZyB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS11bmNlcnRhaW50eS1taXNzaW5nLTAucG5nIHwgMjY4MDEgfCA1YzZiMTMwYzIzZmMxOWQ0NzIyNmMwNmMyM2QxOGI1MmM3N2NlMzg5Y2EwZGRmNTMxZTUwMzQyNjg2MDdiYmE3DQpuby1oYW5kbGVyIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLW5vLWhhbmRsZXItMC5wbmcgfCA3MjUyNSB8IGZlZGQ2NWY1ZmY5NjA5ZDIxMWEwYzNjNjdkZDI3YTQ4NmExZmNlNzE1MmRhNDNkOTE5NmI1NTFkOGJkNjgwODENCm5vLWhhbmRsZXIgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtbm8taGFuZGxlci0xLnBuZyB8IDY1NTYxIHwgZmJhOTJlM2ZjNzMyNDk5N2JhNTFjYzU4ODMxODBmYzRhZTYzMWFhMzEwODI5OTYzMjcwYjdjMjEyNWQ3OTk5ZA0Kb3BlcmF0aW9uLWhlbGQgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtb3BlcmF0aW9uLWhlbGQtMC5wbmcgfCA3MjUyMSB8IGQxODYzYzJlZmMzZjAxMjA1ZjI1MWMxZWIxYmFjZTBjMDViZTExZDVmNDUwMjU2ZTA0OTA0NTAxZTUwMzZhZjkNCm9wZXJhdGlvbi1oZWxkIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLW9wZXJhdGlvbi1oZWxkLTEucG5nIHwgNjU1NTMgfCA1YzY4NTg2NWM1NmU2YTQwZjZhZWUxZWMxN2YwZjg3NmJkN2RlOWJmYTI3MmRiNzNiMmU3NTc3YWNiMmU2MzQ1DQpidXN5IHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLWJ1c3ktMC5wbmcgfCA3MDUwNCB8IDI4NzNhYjE4MjBiNzdhNGJhYmEwODFjODI0MzgyNGFjMmI5YzE3ZjU2NDBmYzNiN2Q1NTYwM2U5MWYzYjEyYTMNCmJ1c3kgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtYnVzeS0xLnBuZyB8IDYyNjk1IHwgYWUyMTIxZDdiNzYwZTdkYzU5OWJkN2FlMzEyZmIzM2JiMjg3MmJjNDQzN2IzOWFhODg2OGVjYzY0ZWZlYjA5OQ0Kc2VudCB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1zZW50LTAucG5nIHwgNzA1MDQgfCAyODczYWIxODIwYjc3YTRiYWJhMDgxYzgyNDM4MjRhYzJiOWMxN2Y1NjQwZmMzYjdkNTU2MDNlOTFmM2IxMmEzDQpzZW50IHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLXNlbnQtMS5wbmcgfCA2MjY5NSB8IGFlMjEyMWQ3Yjc2MGU3ZGM1OTliZDdhZTMxMmZiMzNiYjI4NzJiYzQ0MzdiMzlhYTg4NjhlY2M2NGVmZWIwOTkNCmZhaWxlZCB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1mYWlsZWQtMC5wbmcgfCA3NDM0OCB8IGM0OWYyMTQ4NjU2ZmE3MTlkZmQ5NjQwY2QzNjdkNDc5YWQ5ZjZhYzM4YWJkZTQwY2EyODVhMzg3NmNhMWNmYTgNCmZhaWxlZCB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS1mYWlsZWQtMS5wbmcgfCA2NjY0OCB8IDY3NGU3ZTAxMTZiNWQ0Yzg3ZTQxMmIyMmI1OGQxZWQwZjU2MTIwYWVkY2Q5NDZjNzAxN2ZhNDViM2VmN2I1NTgNCnVua25vd24gfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtdW5rbm93bi0wLnBuZyB8IDc0MzQ4IHwgYzQ5ZjIxNDg2NTZmYTcxOWRmZDk2NDBjZDM2N2Q0NzlhZDlmNmFjMzhhYmRlNDBjYTI4NWEzODc2Y2ExY2ZhOA0KdW5rbm93biB8IEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDEzX25hdGl2ZV9SMS11bmtub3duLTEucG5nIHwgNjY2NDggfCA2NzRlN2UwMTE2YjVkNGM4N2U0MTJiMjJiNThkMWVkMGY1NjEyMGFlZGNkOTQ2YzcwMTdmYTQ1YjNlZjdiNTU4DQp1bmtub3duLXF1ZXJ5aW5nIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLXVua25vd24tcXVlcnlpbmctMC5wbmcgfCA3MzAwMCB8IDk0ZWVmNjQxMjU2OTI1YWE5YzY4M2E3ZDg4ZTllYzhjZjNlN2I5ZDMwZWNkYjBjYTM5Mzc5NjllZjY4MzU1NjcNCnVua25vd24tcXVlcnlpbmcgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtdW5rbm93bi1xdWVyeWluZy0xLnBuZyB8IDY1MjIyIHwgZDBhMzZlMTU0ZjAwOGIyYjE2N2FjY2ZmZTEwOTRlMzczNjMwYjI2NjYxYWY4ODZlOGIwMDg1MjE1NmE2ZjY1Mw0KcmVjZWl2ZWQtdW5wcm92ZW4gfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtcmVjZWl2ZWQtdW5wcm92ZW4tMC5wbmcgfCA3NDM0OCB8IGM0OWYyMTQ4NjU2ZmE3MTlkZmQ5NjQwY2QzNjdkNDc5YWQ5ZjZhYzM4YWJkZTQwY2EyODVhMzg3NmNhMWNmYTgNCnJlY2VpdmVkLXVucHJvdmVuIHwgQzovVXNlcnMvWHBpa2UvQXBwRGF0YS9Mb2NhbC9UZW1wL2thdnJpdmFfZTEwMTNfbmF0aXZlX1IxLXJlY2VpdmVkLXVucHJvdmVuLTEucG5nIHwgNjY2NDggfCA2NzRlN2UwMTE2YjVkNGM4N2U0MTJiMjJiNThkMWVkMGY1NjEyMGFlZGNkOTQ2YzcwMTdmYTQ1YjNlZjdiNTU4DQpyZWNlaXZlZC1jb25maXJtZWQgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtcmVjZWl2ZWQtY29uZmlybWVkLTAucG5nIHwgNzE1NDEgfCBiMWFiYzk4ZGQ4MmYwMjk0ZDE4OTU4MzYwNDA4N2JiMGUyZjg1N2JlNGIxNTNmMWVhMGVkYWEzODZiMDI5N2ZhDQpyZWNlaXZlZC1jb25maXJtZWQgfCBDOi9Vc2Vycy9YcGlrZS9BcHBEYXRhL0xvY2FsL1RlbXAva2F2cml2YV9lMTAxM19uYXRpdmVfUjEtcmVjZWl2ZWQtY29uZmlybWVkLTEucG5nIHwgNjM4NjggfCBjZTk3ODljNjFmMzdjYWU3ODJjYWUzZWYzMzJkNDhjMDI4NjY3M2UxYTM1MzViNTM4MDk2OWQzNmJiZjI2ZDc2DQo=
```

## Q12 dar onarım kapsamı — koddan önce

Özgün R1ilkoku Q12kısmi; kabul edilmedi. Kaydı/ayrıntıları okumanın yeni bakım işlemi başlatmadığı kullanıcı cümlesi açıklaştırılacak. Aynı15testte gerçek ayrıntı/recordtap yalnız openRecord niyeti, recheck yok doğrulanacak.12soru/41tabanpin/izinli14adres değişmez. Yeni native ve bütün testler/format/analyze/graph, yeni geçmişsiz okuma zorunlu; R1 özgün rapor/RAWBase64 korunur. Kayıt yazıcı ilk denemede dış/iş gövdesi üçlü string sınırı yüzünden SyntaxError aldı; dosya değişmedi. Dış tırnak düzeltilince kayıtlar yazıldı. Graph kapalıverdict listesi IN_PROGRESS kabul etmedi; EVID RECORDED düzeltildi, görev IN_PROGRESS kaldı.

## Güncel Q12 dar onarımı ve gerçek R2 kanıtı

Kod 7c2be3552df9f8623230e1f33da77384ab786eae; öncekiR1kod 6621c3349b7791d3a296d0c811b105c4023f86c3 ve R1ilkokuQ12kısmi özgün/RAWBase64 korunur. Kullanıcı cümlesi kayda/ayrıntıya bakmanın bakım işlemi başlatmadığını açık söyler. Aynı15testte gerçek ayrıntı/recordtap yalnız openRecordniyeti, recheckyok doğrulanır. R5bütün277normalPASS, ayrınativeR2 1PASS; analyze0/format30-0. Güncel31durum/52PNG tam390×844: Root33değişmişbenzersizoriginal açtı;12parça R1açılmışRAWhashlerle eşit, kalan7yeni tekrarlı parça aynıR2açılanRAWhashlere eşit.52R2PNGherbiri ayrı açıldı iddiası yok. 279gerçek dar/geniş/büyükyazı düzeni.12soruLF 3c1664de5fe51a6a28bfae7d34181c25a96cf6c757cb4ef79d932ce5f3277098 değişmez. Yeni geçmişsiz R2okuyucu bütün52PNG/12soruyu okuyor; henüz kabul yok. Ana99DONE107kalan206 korunur.

## Güncel R2 kod test ve native kimlikleri

KodLF SHA256 1a8b538919fdc9c71a7a5d19e3b67fbaaa0d042d953757e77000d28597e33ffb; testLF SHA256 3be071a9ce8889ebb6f17b1050501065952f9b4684745e1f9ef342c88d2d631f

- kavriva_e1013_native_R2-safety-0.png / safety / RAW SHA256 c69be262be3c39883d1db5077c6c9fe503e6f5a1d261faa99a96cf35b7da844c / 70091byte /offset 0.0/end 73.0
- kavriva_e1013_native_R2-safety-1.png / safety / RAW SHA256 19e8339515b2e2911b301300586e681c17367400a96a5aa97cffcfdf419c6154 / 64059byte /offset 73.0/end 73.0
- kavriva_e1013_native_R2-technical-value-0.png / technical-value / RAW SHA256 a3364abd3b24d2c0635fcc33b325d97b22f794761da9bd2ad8768da2b0b02f8e / 69377byte /offset 0.0/end 73.0
- kavriva_e1013_native_R2-technical-value-1.png / technical-value / RAW SHA256 fe6c746d3d5b7877038d03f400cbe982587b62a48c71750ba34238dfcbdb603a / 63303byte /offset 73.0/end 73.0
- kavriva_e1013_native_R2-critical-step-0.png / critical-step / RAW SHA256 0ec9178e11836e5b954ae6a2e0f2aa26f3b02ce17fd457c9d36b4ced7e4e1c6e / 69213byte /offset 0.0/end 73.0
- kavriva_e1013_native_R2-critical-step-1.png / critical-step / RAW SHA256 5a913e2afea96c92fad520161d326bfcf4298aaf47a32686ffe66a5a6bac0d01 / 63146byte /offset 73.0/end 73.0
- kavriva_e1013_native_R2-narrative-0.png / narrative / RAW SHA256 f4244771e74bd617c5ccfcbf1c007da35b8f9e228fdc63f10b8f9d8ad0baa0b8 / 62832byte /offset 0.0/end 9.0
- kavriva_e1013_native_R2-narrative-1.png / narrative / RAW SHA256 51ebc564da370fc062813e983419204a4249f927340b52f99da0224fa188109f / 62823byte /offset 9.0/end 9.0
- kavriva_e1013_native_R2-inactive-0.png / inactive / RAW SHA256 b61298cd93e3447882c3276f524ab267b5b810feadf9aefeee266fcc0fb6598e / 73373byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-inactive-1.png / inactive / RAW SHA256 4494ba886488c8fa850e3d7d87cd83d742ce605e55c42d11fbe4b1990d2e1538 / 66820byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-entitlement-changed-0.png / entitlement-changed / RAW SHA256 8fe81ce7aa4a43e5c610ddf6bb23f5970dba436d06a25cad1ecb706d359cb7fb / 74937byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-entitlement-changed-1.png / entitlement-changed / RAW SHA256 3c142ed82e0a0ee34f60907fe5f4ee829508564ce7112371871bf1c598aace7a / 68284byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-inactive-entitlement-0.png / inactive-entitlement / RAW SHA256 430cc477bcdc0cef5d798490953d4089afa3350c5d45d82b9ad023b06b62ddeb / 78596byte /offset 0.0/end 185.0
- kavriva_e1013_native_R2-inactive-entitlement-1.png / inactive-entitlement / RAW SHA256 051998ed14f23d3e6b45b26ad8d2edc5a4df95b92d4bcfc4e4637cb50ac1840c / 67782byte /offset 185.0/end 185.0
- kavriva_e1013_native_R2-offline-0.png / offline / RAW SHA256 97393c90b66a4375ba756862221c4154ad3660c62c4e933ca7a68f392c1b35aa / 79213byte /offset 0.0/end 229.0
- kavriva_e1013_native_R2-offline-1.png / offline / RAW SHA256 9a35022ff51fa8ecdb0653a50013b00efb3b65bfc741b3ac98965128db8b112f / 66545byte /offset 229.0/end 229.0
- kavriva_e1013_native_R2-details-0.png / details / RAW SHA256 4b3ba2dadc3672d6123d11eea7e0a7733255000b6fc2c172f71ea584d188b7e4 / 78689byte /offset 0.0/end 542.0
- kavriva_e1013_native_R2-details-1.png / details / RAW SHA256 e74cd3ba183d4512d53618d0bab94d2aab59a447f80cbd2fb76de15869dc900c / 65195byte /offset 542.0/end 542.0
- kavriva_e1013_native_R2-details-inactive-0.png / details-inactive / RAW SHA256 8d5754a40b483c2843d797e8b44a84849b8961aaa4a76c8d423c4fd81d726c85 / 80700byte /offset 0.0/end 654.0
- kavriva_e1013_native_R2-details-inactive-1.png / details-inactive / RAW SHA256 152651009f780cb5e211000d9e357560a0ba4541e3be67993b2062e5718a6a4e / 69284byte /offset 620.0/end 654.0
- kavriva_e1013_native_R2-details-inactive-2.png / details-inactive / RAW SHA256 b12345aec99eb222736048037e2093447d64e93c233dfdb636a84e190132942e / 65277byte /offset 654.0/end 654.0
- kavriva_e1013_native_R2-details-long-0.png / details-long / RAW SHA256 f69b758cdb4d8f5179bf7df545050e560c5c4c242071a6fd209f103954b40c63 / 79829byte /offset 0.0/end 608.0
- kavriva_e1013_native_R2-details-long-1.png / details-long / RAW SHA256 e74cd3ba183d4512d53618d0bab94d2aab59a447f80cbd2fb76de15869dc900c / 65195byte /offset 608.0/end 608.0
- kavriva_e1013_native_R2-missing-0.png / missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-source-missing-0.png / source-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-source-stale-0.png / source-stale / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-source-held-0.png / source-held / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-source-unknown-0.png / source-unknown / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-foreign-source-0.png / foreign-source / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-private-record-0.png / private-record / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-private-correction-0.png / private-correction / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-classification-missing-0.png / classification-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-reviewer-missing-0.png / reviewer-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-uncertainty-missing-0.png / uncertainty-missing / RAW SHA256 5c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 / 26801byte /offset 0.0/end 0.0
- kavriva_e1013_native_R2-no-handler-0.png / no-handler / RAW SHA256 8bee5a139544b72ddd6a3241b9002292dfd60f448bccdb21c917bd7f241e42a6 / 75580byte /offset 0.0/end 151.0
- kavriva_e1013_native_R2-no-handler-1.png / no-handler / RAW SHA256 690f1f5ce89ff2e821499f004cacf6ffaaac104d563930b4ff302b1bee364dbe / 66137byte /offset 151.0/end 151.0
- kavriva_e1013_native_R2-operation-held-0.png / operation-held / RAW SHA256 b85fdf93b1f1eaf8d29a2aa445413b7e6aacb36de9be586adebf426fe69e434f / 75582byte /offset 0.0/end 151.0
- kavriva_e1013_native_R2-operation-held-1.png / operation-held / RAW SHA256 53b243488b6fa32383c2e0fbbcb0aeeab2d565ca5e2ca50798baa8f5db492f6a / 66131byte /offset 151.0/end 151.0
- kavriva_e1013_native_R2-busy-0.png / busy / RAW SHA256 0ea29e9590c4d9c17e1c3702192aad76cb7e50c2b9352c22e17bc3563fd301cd / 72767byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-busy-1.png / busy / RAW SHA256 11d8b9fb96992693e2870b379b0e768ad2bbab279fbfe8bf7e09713913e7a9cc / 66201byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-sent-0.png / sent / RAW SHA256 0ea29e9590c4d9c17e1c3702192aad76cb7e50c2b9352c22e17bc3563fd301cd / 72767byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-sent-1.png / sent / RAW SHA256 11d8b9fb96992693e2870b379b0e768ad2bbab279fbfe8bf7e09713913e7a9cc / 66201byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-failed-0.png / failed / RAW SHA256 8be1ef67822bd744ccdb5329eaec7659a7c3df537794fb145cdfc73289a0e8ae / 76833byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-failed-1.png / failed / RAW SHA256 d6e477c59516364063945149e34941696476229f94429d204dafa01724c5dab8 / 70056byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-unknown-0.png / unknown / RAW SHA256 8be1ef67822bd744ccdb5329eaec7659a7c3df537794fb145cdfc73289a0e8ae / 76833byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-unknown-1.png / unknown / RAW SHA256 d6e477c59516364063945149e34941696476229f94429d204dafa01724c5dab8 / 70056byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-unknown-querying-0.png / unknown-querying / RAW SHA256 358540b314f2dff7ffa9d014521408905853c4621a39d172c0b0c94bd843cbc7 / 75386byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-unknown-querying-1.png / unknown-querying / RAW SHA256 05d00d5e4ee0a54c29215317e753ecdf19bed926ab6736cc852164c06f31babc / 68789byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-received-unproven-0.png / received-unproven / RAW SHA256 8be1ef67822bd744ccdb5329eaec7659a7c3df537794fb145cdfc73289a0e8ae / 76833byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-received-unproven-1.png / received-unproven / RAW SHA256 d6e477c59516364063945149e34941696476229f94429d204dafa01724c5dab8 / 70056byte /offset 129.0/end 129.0
- kavriva_e1013_native_R2-received-confirmed-0.png / received-confirmed / RAW SHA256 b2c4ff3a15becbf24cdac365cc3d333f3dd2f7d2be2f7f39f77828a7e3ae791c / 73997byte /offset 0.0/end 129.0
- kavriva_e1013_native_R2-received-confirmed-1.png / received-confirmed / RAW SHA256 1b5c980e5cbaa5fb06dc5b5d1b4ba1aed2776aab2b735a41314b193d802cbcf8 / 67342byte /offset 129.0/end 129.0

- kavriva_e1013_R5_full_tests.log RAW SHA256 19afac1237f8ff3d31b9c532767b962bc21fc2245221ef8d026bb0227fd3423c / 60587byte
- kavriva_e1013_native_R2.log RAW SHA256 8b7993b31f793f127b80cb587c333b4050a47a3b64a2d3831d333dcf87b56c65 / 270byte
- kavriva_e1013_R4_analyze.log RAW SHA256 9c19c5fdc29e847862aafef9d1e355a755d9dcca35aaf92b6430c0c38b9b752d / 99byte
- kavriva_e1013_R3_format.log RAW SHA256 da7aac0bd612f90e6c0ac9219633a27bd2afab391d600bd7004c9f5af5b101a6 / 49byte

## R2 ilk okuma — özgün kısmi hüküm korunur

Root özgün7628bayt raporun tamamını okudu;Q8veQ10kısmi, geçişkuralı sağlanmadı. Raporda bazı PNGler boş olarak yorumlandı. Root aynı source-stale/foreign-source/private-record R2 dosyalarını original yeniden açtı: metin ve kapalı erişim görünümü var; RAW SHA2565c6b130c23fc19d47226c06c23d18b52c77ce389ca0ddf531e5034268607bba7 R1açılmış aynı görüntüye eşit. Rapor düzeltilip PASSa yükseltilmez; ürün değişikliği yapılmadan kaynaklar aynı kalır, yeni geçmişsiz görsel okuma gerekir.

RAW SHA256 c3f9305ac76f4c708d2c0c25737e92f133361e9b319fede70df4f54a639df1b0

KAVRIVA E1-013 — R2 BAĞIMSIZ İLK EKRAN OKUMASI

Yöntem ve sınır
Yalnızca belirtilen native R2 manifesti, kavriva_e1013_R2_images.json, 12 sabit soruluk fixture ve bu eşlemedeki 52 PNG kullanıldı. Görseller manifest sırasıyla ve özgün çözünürlükte tek tek açıldı: 52 PNG, 31 durum. Kod, plan, pack, önceki rapor, cevap anahtarı veya dış yardım kullanılmadı.

Bu, AI tarafından PNG ekran görüntülerinin okunmasıdır. Görüntüler gerçek insanın, telefonun, işletim sisteminin, üretim ortamının, işlemin, kimliğin veya fiziksel işin kanıtı değildir. Ekranlardaki “örnek” ve “test verisi” ifadeleri gerçek motosiklet/işlem kanıtı oluşturmaz.

12 sabit soruya yanıt

1. Bu ekran hangi sonradan yapılan düzeltmeyi ve hangi önceki kaydı etkilediğini söylüyor?
Yanıt: Temel güvenlik ekranı, sonradan yapılan düzeltmenin bu kayıtta kullanılan örnek güvenlik bilgisini etkilediğini söylüyor. Etkilenen kayıt “Fren balatası kontrolü · örnek kayıt”; ekranda Örnek motosiklet A · kullanıcı beyanı ile 04.10.2026 örnek bakım tarihi yazıyor. Görsel kümesindeki ayrı varyantlar kullanılan teknik değeri, uygulanmış önemli adımı ve yalnız anlatımı etkileyen düzeltme örneklerini de gösteriyor.
Değerlendirme: Net.

2. Etki yalnız anlatım düzeltmesi mi, kullanılmış teknik değer veya güvenlik uyarısı mı? Önem derecesini neye göre anlarsın?
Yanıt: Temel ekran yalnız anlatım düzeltmesi değil; “Güvenlik uyarısını etkileyen düzeltme” ve kayıtta kullanılan örnek güvenlik bilgisini etkilediğini açıkça söylüyor. Diğer ekran varyantları teknik değer ve önemli adım etkisini ayrıca adlandırıyor. Yalnız anlatım varyantı ise kaynağın değişikliği anlatım düzeltmesi olarak bildirdiğini ve anlatımın daha açık yazıldığını söylüyor. Etki türü, ekran üzerindeki bu açık sınıflandırma ve önceki kayıtta neyin kullanılmış olduğuna göre anlaşılır; fiziksel riskin sonucu kesinleşmiş değildir.
Değerlendirme: Net.

3. Hangi motosikletin hangi kaydı etkilenmiş, örnek kaynak ve zaman nerede görülüyor?
Yanıt: Örnek Motosiklet A’nın kullanıcı beyanı altındaki Fren balatası kontrolü örnek kaydı etkilenmiş; örnek bakım tarihi 04.10.2026. Ayrıntılar açıkken “Değişen bilgi ve korunan iz” bölümünde zaman 06.10.2026 örnek düzeltme zamanı; gerekçe örnek kaynağın kapsamının sonradan değişmesi; kaynak “Örnek bilgi kaynağı · sürüm 2 · örnek bölüm” olarak görünüyor.
Değerlendirme: Net. Bunlar ekranda örnek/test verisi olarak sunuluyor.

4. Devam etmeden önce senden beklenen tek temel adım nedir?
Yanıt: Etkilenen kaydın mevcut duruma etkisini yeniden değerlendirmek; ekrandaki ana eylem “Yeniden kontrol et”.
Değerlendirme: Net.

5. Yeniden kontrol düğmesini görmek veya basmak fiziksel işi yapılmış veya güvenliği kesinleşmiş sayar mı?
Yanıt: Hayır. Ekran, kayda/ayrıntılara bakmanın bakım işlemi başlatmadığını; mesajı veya düğmeye basmanın bakımın yeniden kontrol edildiğini ya da motosikletin güvenli olduğunu kanıtlamadığını açıkça belirtiyor. Kontrol isteğinin alındığı bildirilen varyantta bile fiziksel kontrol ve güvenlik sonucu henüz doğrulanmamış.
Değerlendirme: Net.

6. Motosiklet pasif olduğunda veya ücretli paket değiştiğinde bu düzeltmeyi okuyabilir misin?
Yanıt: Evet. Pasif motosiklet ekranı düzeltmenin ve izinli kayıt geçmişinin okunabileceğini söylüyor. Paket değişikliği ekranı, düzeltme ve izinli kayıt geçmişinin ücret kapsamına alınmadığını belirtiyor.
Değerlendirme: Net.

7. Düzeltme önceki kayıt veya kanıt izini sessizce silmiş ya da bir iddiayı otomatik kazanan seçmiş mi?
Yanıt: Hayır. Ayrıntılar paneli düzeltmenin önceki kaydı ve bağımsız kanıt izini silmediğini; bir iddiayı kendiliğinden kazanan veya tamamlanmayı doğrulanmış yapmadığını söylüyor.
Değerlendirme: Net.

8. Güncel kaynak eksik/eski veya başka motosiklete aitse özel kayıt ve gerçek işlem izinleri açılıyor mu?
Yanıt: Okunabilen erişim ekranı güncel kayıt ve erişim bilgisinin gerektiğini, özel ayrıntıların kapalı olduğunu ve bilgi yokluğunun düzeltmenin önemsiz olduğu anlamına gelmediğini söylüyor. Okunabilen eylem durumlarında da güncel işlem izni/bağlantı yokken istek açılamıyor. Bu yüzden görünen akış, özel kaydın veya gerçek işlemin otomatik açıldığını göstermiyor. Ancak source-stale, foreign-source ve private-record dahil bazı ilgili PNG’ler görsel olarak bütünüyle boş; bu kaynak türlerinin her birine özgü izin davranışı bu görsellerden doğrulanamıyor.
Değerlendirme: Kısmi; okunabilir genel ekran kapalı erişim diyor, bazı ilgili varyantlar boş olduğundan her alt durum için kesin yanıt verilemiyor.

9. Düzeltmenin kaynağı, etkilediği iddia, inceleyen ve açık kalan belirsizlikler nerede görülüyor?
Yanıt: “Düzeltmenin ayrıntıları” açılınca “Değişen bilgi ve korunan iz” bölümünde Önce/Şimdi, Zaman, Gerekçe, Kaynak, İnceleyen ve Açık kalan alanları görünüyor. Örnek ekranda kaynak “Örnek bilgi kaynağı · sürüm 2 · örnek bölüm”, inceleyen “Örnek inceleyen · test verisi”; açık kalan konu mevcut fiziksel durum ve işçilik sonucunun kesinleşmemesi. Etkilenen kayıt ana ekranda ayrıca gösteriliyor.
Değerlendirme: Net.

10. Çevrimdışı veya eski bilgi söz konusuysa güncel kontrol yapıldığı varsayılıyor mu?
Yanıt: Çevrimdışı durumda hayır. Ekran eski bilginin güncel kontrol veya riskin geçtiği anlamına gelmediğini, yeni kontrol isteğinin kapalı olduğunu ve güncel işlem izni ile bağlantı gerektiğini söylüyor. Eski kaynak varyantını temsil eden PNG ise görsel olarak boş olduğundan, o alt ekranın kendi metni okunamadı.
Değerlendirme: Çevrimdışı durum için net “hayır”; eski kaynak varyantının özgül metni için kısmi.

11. Bir kontrol isteğinin sonucu belirsizse aynı işi yeniden göndermeden ne yapmalısın?
Yanıt: Yeni istek göndermeden aynı isteğin sonucunu sorgulamak. Ekran “Aynı isteğin sonucunu sorgula” eylemini gösteriyor; sonuç sorgulanırken yeni kontrol isteği gönderilmediğini belirtiyor. İstek gönderiliyor durumunda aynı isteğin tekrar gönderilemeyeceğini de söylüyor.
Değerlendirme: Net.

12. Ayrıntılara veya eski kayda bakmak seni otomatik olarak uygulamaya başlatır mı?
Yanıt: Hayır. Ekran kayda veya ayrıntılara bakmanın bakım işlemi başlatmadığını açıkça söylüyor. “Etkilenen kayda bak” ve ayrıntıları açma/kapama kontrolleri, fiziksel işin başladığı veya yapıldığı kanıtı olarak sunulmuyor.
Değerlendirme: Net.

İlk okuma sonucu
12 sorudan 10’una net yanıt verilebildi. 8. soru kısmi kaldı; 10. soruda çevrimdışı alt durumu net, eski kaynak varyantının metni okunamadı. Bu görsel okuma, fixture’daki “12 yanıtın tamamı anlamca doğru” geçiş kuralını karşılayan tam bir sonuç değildir; belirsiz alt durumlar için yeni geçmişsiz okuma gerekir.

Görsel okunabilirliği notu
Tüm 52 PNG açıldı. Bir kısım kaynak/izin hata ekranında genel kapalı erişim metni görünürken, bazı dosyalar (özellikle source-stale, source-held, foreign-source, private-record, classification-missing ve reviewer-missing varyantları) boş/açık metinsiz görüntü verdi. Boş görüntülerden içerik çıkarımı yapılmadı.

## Özgün R2ilkoku ham baytları

```base64
S0FWUklWQSBFMS0wMTMg4oCUIFIyIEJBxJ5JTVNJWiDEsExLIEVLUkFOIE9LVU1BU0kKClnDtm50ZW0gdmUgc8SxbsSxcgpZYWxuxLF6Y2EgYmVsaXJ0aWxlbiBuYXRpdmUgUjIgbWFuaWZlc3RpLCBrYXZyaXZhX2UxMDEzX1IyX2ltYWdlcy5qc29uLCAxMiBzYWJpdCBzb3J1bHVrIGZpeHR1cmUgdmUgYnUgZcWfbGVtZWRla2kgNTIgUE5HIGt1bGxhbsSxbGTEsS4gR8O2cnNlbGxlciBtYW5pZmVzdCBzxLFyYXPEsXlsYSB2ZSDDtnpnw7xuIMOnw7Z6w7xuw7xybMO8a3RlIHRlayB0ZWsgYcOnxLFsZMSxOiA1MiBQTkcsIDMxIGR1cnVtLiBLb2QsIHBsYW4sIHBhY2ssIMO2bmNla2kgcmFwb3IsIGNldmFwIGFuYWh0YXLEsSB2ZXlhIGTEscWfIHlhcmTEsW0ga3VsbGFuxLFsbWFkxLEuCgpCdSwgQUkgdGFyYWbEsW5kYW4gUE5HIGVrcmFuIGfDtnLDvG50w7xsZXJpbmluIG9rdW5tYXPEsWTEsXIuIEfDtnLDvG50w7xsZXIgZ2Vyw6dlayBpbnNhbsSxbiwgdGVsZWZvbnVuLCBpxZ9sZXRpbSBzaXN0ZW1pbmluLCDDvHJldGltIG9ydGFtxLFuxLFuLCBpxZ9sZW1pbiwga2ltbGnEn2luIHZleWEgZml6aWtzZWwgacWfaW4ga2FuxLF0xLEgZGXEn2lsZGlyLiBFa3JhbmxhcmRha2kg4oCcw7ZybmVr4oCdIHZlIOKAnHRlc3QgdmVyaXNp4oCdIGlmYWRlbGVyaSBnZXLDp2VrIG1vdG9zaWtsZXQvacWfbGVtIGthbsSxdMSxIG9sdcWfdHVybWF6LgoKMTIgc2FiaXQgc29ydXlhIHlhbsSxdAoKMS4gQnUgZWtyYW4gaGFuZ2kgc29ucmFkYW4geWFwxLFsYW4gZMO8emVsdG1leWkgdmUgaGFuZ2kgw7ZuY2VraSBrYXlkxLEgZXRraWxlZGnEn2luaSBzw7Z5bMO8eW9yPwpZYW7EsXQ6IFRlbWVsIGfDvHZlbmxpayBla3JhbsSxLCBzb25yYWRhbiB5YXDEsWxhbiBkw7x6ZWx0bWVuaW4gYnUga2F5xLF0dGEga3VsbGFuxLFsYW4gw7ZybmVrIGfDvHZlbmxpayBiaWxnaXNpbmkgZXRraWxlZGnEn2luaSBzw7Z5bMO8eW9yLiBFdGtpbGVuZW4ga2F5xLF0IOKAnEZyZW4gYmFsYXRhc8SxIGtvbnRyb2zDvCDCtyDDtnJuZWsga2F5xLF04oCdOyBla3JhbmRhIMOWcm5layBtb3Rvc2lrbGV0IEEgwrcga3VsbGFuxLFjxLEgYmV5YW7EsSBpbGUgMDQuMTAuMjAyNiDDtnJuZWsgYmFrxLFtIHRhcmloaSB5YXrEsXlvci4gR8O2cnNlbCBrw7xtZXNpbmRla2kgYXlyxLEgdmFyeWFudGxhciBrdWxsYW7EsWxhbiB0ZWtuaWsgZGXEn2VyaSwgdXlndWxhbm3EscWfIMO2bmVtbGkgYWTEsW3EsSB2ZSB5YWxuxLF6IGFubGF0xLFtxLEgZXRraWxleWVuIGTDvHplbHRtZSDDtnJuZWtsZXJpbmkgZGUgZ8O2c3Rlcml5b3IuCkRlxJ9lcmxlbmRpcm1lOiBOZXQuCgoyLiBFdGtpIHlhbG7EsXogYW5sYXTEsW0gZMO8emVsdG1lc2kgbWksIGt1bGxhbsSxbG3EscWfIHRla25payBkZcSfZXIgdmV5YSBnw7x2ZW5saWsgdXlhcsSxc8SxIG3EsT8gw5ZuZW0gZGVyZWNlc2luaSBuZXllIGfDtnJlIGFubGFyc8Sxbj8KWWFuxLF0OiBUZW1lbCBla3JhbiB5YWxuxLF6IGFubGF0xLFtIGTDvHplbHRtZXNpIGRlxJ9pbDsg4oCcR8O8dmVubGlrIHV5YXLEsXPEsW7EsSBldGtpbGV5ZW4gZMO8emVsdG1l4oCdIHZlIGthecSxdHRhIGt1bGxhbsSxbGFuIMO2cm5layBnw7x2ZW5saWsgYmlsZ2lzaW5pIGV0a2lsZWRpxJ9pbmkgYcOnxLFrw6dhIHPDtnlsw7x5b3IuIERpxJ9lciBla3JhbiB2YXJ5YW50bGFyxLEgdGVrbmlrIGRlxJ9lciB2ZSDDtm5lbWxpIGFkxLFtIGV0a2lzaW5pIGF5csSxY2EgYWRsYW5kxLFyxLF5b3IuIFlhbG7EsXogYW5sYXTEsW0gdmFyeWFudMSxIGlzZSBrYXluYcSfxLFuIGRlxJ9pxZ9pa2xpxJ9pIGFubGF0xLFtIGTDvHplbHRtZXNpIG9sYXJhayBiaWxkaXJkacSfaW5pIHZlIGFubGF0xLFtxLFuIGRhaGEgYcOnxLFrIHlhesSxbGTEscSfxLFuxLEgc8O2eWzDvHlvci4gRXRraSB0w7xyw7wsIGVrcmFuIMO8emVyaW5kZWtpIGJ1IGHDp8SxayBzxLFuxLFmbGFuZMSxcm1hIHZlIMO2bmNla2kga2F5xLF0dGEgbmV5aW4ga3VsbGFuxLFsbcSxxZ8gb2xkdcSfdW5hIGfDtnJlIGFubGHFn8SxbMSxcjsgZml6aWtzZWwgcmlza2luIHNvbnVjdSBrZXNpbmxlxZ9tacWfIGRlxJ9pbGRpci4KRGXEn2VybGVuZGlybWU6IE5ldC4KCjMuIEhhbmdpIG1vdG9zaWtsZXRpbiBoYW5naSBrYXlkxLEgZXRraWxlbm1pxZ8sIMO2cm5layBrYXluYWsgdmUgemFtYW4gbmVyZWRlIGfDtnLDvGzDvHlvcj8KWWFuxLF0OiDDlnJuZWsgTW90b3Npa2xldCBB4oCZbsSxbiBrdWxsYW7EsWPEsSBiZXlhbsSxIGFsdMSxbmRha2kgRnJlbiBiYWxhdGFzxLEga29udHJvbMO8IMO2cm5layBrYXlkxLEgZXRraWxlbm1pxZ87IMO2cm5layBiYWvEsW0gdGFyaWhpIDA0LjEwLjIwMjYuIEF5csSxbnTEsWxhciBhw6fEsWtrZW4g4oCcRGXEn2nFn2VuIGJpbGdpIHZlIGtvcnVuYW4gaXrigJ0gYsO2bMO8bcO8bmRlIHphbWFuIDA2LjEwLjIwMjYgw7ZybmVrIGTDvHplbHRtZSB6YW1hbsSxOyBnZXJla8OnZSDDtnJuZWsga2F5bmHEn8SxbiBrYXBzYW3EsW7EsW4gc29ucmFkYW4gZGXEn2nFn21lc2k7IGtheW5hayDigJzDlnJuZWsgYmlsZ2kga2F5bmHEn8SxIMK3IHPDvHLDvG0gMiDCtyDDtnJuZWsgYsO2bMO8beKAnSBvbGFyYWsgZ8O2csO8bsO8eW9yLgpEZcSfZXJsZW5kaXJtZTogTmV0LiBCdW5sYXIgZWtyYW5kYSDDtnJuZWsvdGVzdCB2ZXJpc2kgb2xhcmFrIHN1bnVsdXlvci4KCjQuIERldmFtIGV0bWVkZW4gw7ZuY2Ugc2VuZGVuIGJla2xlbmVuIHRlayB0ZW1lbCBhZMSxbSBuZWRpcj8KWWFuxLF0OiBFdGtpbGVuZW4ga2F5ZMSxbiBtZXZjdXQgZHVydW1hIGV0a2lzaW5pIHllbmlkZW4gZGXEn2VybGVuZGlybWVrOyBla3JhbmRha2kgYW5hIGV5bGVtIOKAnFllbmlkZW4ga29udHJvbCBldOKAnS4KRGXEn2VybGVuZGlybWU6IE5ldC4KCjUuIFllbmlkZW4ga29udHJvbCBkw7zEn21lc2luaSBnw7ZybWVrIHZleWEgYmFzbWFrIGZpemlrc2VsIGnFn2kgeWFwxLFsbcSxxZ8gdmV5YSBnw7x2ZW5sacSfaSBrZXNpbmxlxZ9tacWfIHNheWFyIG3EsT8KWWFuxLF0OiBIYXnEsXIuIEVrcmFuLCBrYXlkYS9heXLEsW50xLFsYXJhIGJha21hbsSxbiBiYWvEsW0gacWfbGVtaSBiYcWfbGF0bWFkxLHEn8SxbsSxOyBtZXNhasSxIHZleWEgZMO8xJ9tZXllIGJhc21hbsSxbiBiYWvEsW3EsW4geWVuaWRlbiBrb250cm9sIGVkaWxkacSfaW5pIHlhIGRhIG1vdG9zaWtsZXRpbiBnw7x2ZW5saSBvbGR1xJ91bnUga2FuxLF0bGFtYWTEscSfxLFuxLEgYcOnxLFrw6dhIGJlbGlydGl5b3IuIEtvbnRyb2wgaXN0ZcSfaW5pbiBhbMSxbmTEscSfxLEgYmlsZGlyaWxlbiB2YXJ5YW50dGEgYmlsZSBmaXppa3NlbCBrb250cm9sIHZlIGfDvHZlbmxpayBzb251Y3UgaGVuw7x6IGRvxJ9ydWxhbm1hbcSxxZ8uCkRlxJ9lcmxlbmRpcm1lOiBOZXQuCgo2LiBNb3Rvc2lrbGV0IHBhc2lmIG9sZHXEn3VuZGEgdmV5YSDDvGNyZXRsaSBwYWtldCBkZcSfacWfdGnEn2luZGUgYnUgZMO8emVsdG1leWkgb2t1eWFiaWxpciBtaXNpbj8KWWFuxLF0OiBFdmV0LiBQYXNpZiBtb3Rvc2lrbGV0IGVrcmFuxLEgZMO8emVsdG1lbmluIHZlIGl6aW5saSBrYXnEsXQgZ2XDp21pxZ9pbmluIG9rdW5hYmlsZWNlxJ9pbmkgc8O2eWzDvHlvci4gUGFrZXQgZGXEn2nFn2lrbGnEn2kgZWtyYW7EsSwgZMO8emVsdG1lIHZlIGl6aW5saSBrYXnEsXQgZ2XDp21pxZ9pbmluIMO8Y3JldCBrYXBzYW3EsW5hIGFsxLFubWFkxLHEn8SxbsSxIGJlbGlydGl5b3IuCkRlxJ9lcmxlbmRpcm1lOiBOZXQuCgo3LiBEw7x6ZWx0bWUgw7ZuY2VraSBrYXnEsXQgdmV5YSBrYW7EsXQgaXppbmkgc2Vzc2l6Y2Ugc2lsbWnFnyB5YSBkYSBiaXIgaWRkaWF5xLEgb3RvbWF0aWsga2F6YW5hbiBzZcOnbWnFnyBtaT8KWWFuxLF0OiBIYXnEsXIuIEF5csSxbnTEsWxhciBwYW5lbGkgZMO8emVsdG1lbmluIMO2bmNla2kga2F5ZMSxIHZlIGJhxJ/EsW1zxLF6IGthbsSxdCBpemluaSBzaWxtZWRpxJ9pbmk7IGJpciBpZGRpYXnEsSBrZW5kaWxpxJ9pbmRlbiBrYXphbmFuIHZleWEgdGFtYW1sYW5tYXnEsSBkb8SfcnVsYW5txLHFnyB5YXBtYWTEscSfxLFuxLEgc8O2eWzDvHlvci4KRGXEn2VybGVuZGlybWU6IE5ldC4KCjguIEfDvG5jZWwga2F5bmFrIGVrc2lrL2Vza2kgdmV5YSBiYcWfa2EgbW90b3Npa2xldGUgYWl0c2Ugw7Z6ZWwga2F5xLF0IHZlIGdlcsOnZWsgacWfbGVtIGl6aW5sZXJpIGHDp8SxbMSxeW9yIG11PwpZYW7EsXQ6IE9rdW5hYmlsZW4gZXJpxZ9pbSBla3JhbsSxIGfDvG5jZWwga2F5xLF0IHZlIGVyacWfaW0gYmlsZ2lzaW5pbiBnZXJla3RpxJ9pbmksIMO2emVsIGF5csSxbnTEsWxhcsSxbiBrYXBhbMSxIG9sZHXEn3VudSB2ZSBiaWxnaSB5b2tsdcSfdW51biBkw7x6ZWx0bWVuaW4gw7ZuZW1zaXogb2xkdcSfdSBhbmxhbcSxbmEgZ2VsbWVkacSfaW5pIHPDtnlsw7x5b3IuIE9rdW5hYmlsZW4gZXlsZW0gZHVydW1sYXLEsW5kYSBkYSBnw7xuY2VsIGnFn2xlbSBpem5pL2JhxJ9sYW50xLEgeW9ra2VuIGlzdGVrIGHDp8SxbGFtxLF5b3IuIEJ1IHnDvHpkZW4gZ8O2csO8bmVuIGFrxLHFnywgw7Z6ZWwga2F5ZMSxbiB2ZXlhIGdlcsOnZWsgacWfbGVtaW4gb3RvbWF0aWsgYcOnxLFsZMSxxJ/EsW7EsSBnw7ZzdGVybWl5b3IuIEFuY2FrIHNvdXJjZS1zdGFsZSwgZm9yZWlnbi1zb3VyY2UgdmUgcHJpdmF0ZS1yZWNvcmQgZGFoaWwgYmF6xLEgaWxnaWxpIFBOR+KAmWxlciBnw7Zyc2VsIG9sYXJhayBiw7x0w7xuw7x5bGUgYm/FnzsgYnUga2F5bmFrIHTDvHJsZXJpbmluIGhlciBiaXJpbmUgw7Z6Z8O8IGl6aW4gZGF2cmFuxLHFn8SxIGJ1IGfDtnJzZWxsZXJkZW4gZG/En3J1bGFuYW3EsXlvci4KRGXEn2VybGVuZGlybWU6IEvEsXNtaTsgb2t1bmFiaWxpciBnZW5lbCBla3JhbiBrYXBhbMSxIGVyacWfaW0gZGl5b3IsIGJhesSxIGlsZ2lsaSB2YXJ5YW50bGFyIGJvxZ8gb2xkdcSfdW5kYW4gaGVyIGFsdCBkdXJ1bSBpw6dpbiBrZXNpbiB5YW7EsXQgdmVyaWxlbWl5b3IuCgo5LiBEw7x6ZWx0bWVuaW4ga2F5bmHEn8SxLCBldGtpbGVkacSfaSBpZGRpYSwgaW5jZWxleWVuIHZlIGHDp8SxayBrYWxhbiBiZWxpcnNpemxpa2xlciBuZXJlZGUgZ8O2csO8bMO8eW9yPwpZYW7EsXQ6IOKAnETDvHplbHRtZW5pbiBheXLEsW50xLFsYXLEseKAnSBhw6fEsWzEsW5jYSDigJxEZcSfacWfZW4gYmlsZ2kgdmUga29ydW5hbiBpeuKAnSBiw7Zsw7xtw7xuZGUgw5ZuY2UvxZ5pbWRpLCBaYW1hbiwgR2VyZWvDp2UsIEtheW5haywgxLBuY2VsZXllbiB2ZSBBw6fEsWsga2FsYW4gYWxhbmxhcsSxIGfDtnLDvG7DvHlvci4gw5ZybmVrIGVrcmFuZGEga2F5bmFrIOKAnMOWcm5layBiaWxnaSBrYXluYcSfxLEgwrcgc8O8csO8bSAyIMK3IMO2cm5layBiw7Zsw7xt4oCdLCBpbmNlbGV5ZW4g4oCcw5ZybmVrIGluY2VsZXllbiDCtyB0ZXN0IHZlcmlzaeKAnTsgYcOnxLFrIGthbGFuIGtvbnUgbWV2Y3V0IGZpemlrc2VsIGR1cnVtIHZlIGnFn8OnaWxpayBzb251Y3VudW4ga2VzaW5sZcWfbWVtZXNpLiBFdGtpbGVuZW4ga2F5xLF0IGFuYSBla3JhbmRhIGF5csSxY2EgZ8O2c3RlcmlsaXlvci4KRGXEn2VybGVuZGlybWU6IE5ldC4KCjEwLiDDh2V2cmltZMSxxZ/EsSB2ZXlhIGVza2kgYmlsZ2kgc8O2eiBrb251c3V5c2EgZ8O8bmNlbCBrb250cm9sIHlhcMSxbGTEscSfxLEgdmFyc2F5xLFsxLF5b3IgbXU/CllhbsSxdDogw4dldnJpbWTEscWfxLEgZHVydW1kYSBoYXnEsXIuIEVrcmFuIGVza2kgYmlsZ2luaW4gZ8O8bmNlbCBrb250cm9sIHZleWEgcmlza2luIGdlw6d0acSfaSBhbmxhbcSxbmEgZ2VsbWVkacSfaW5pLCB5ZW5pIGtvbnRyb2wgaXN0ZcSfaW5pbiBrYXBhbMSxIG9sZHXEn3VudSB2ZSBnw7xuY2VsIGnFn2xlbSBpem5pIGlsZSBiYcSfbGFudMSxIGdlcmVrdGnEn2luaSBzw7Z5bMO8eW9yLiBFc2tpIGtheW5hayB2YXJ5YW50xLFuxLEgdGVtc2lsIGVkZW4gUE5HIGlzZSBnw7Zyc2VsIG9sYXJhayBib8WfIG9sZHXEn3VuZGFuLCBvIGFsdCBla3JhbsSxbiBrZW5kaSBtZXRuaSBva3VuYW1hZMSxLgpEZcSfZXJsZW5kaXJtZTogw4dldnJpbWTEscWfxLEgZHVydW0gacOnaW4gbmV0IOKAnGhhecSxcuKAnTsgZXNraSBrYXluYWsgdmFyeWFudMSxbsSxbiDDtnpnw7xsIG1ldG5pIGnDp2luIGvEsXNtaS4KCjExLiBCaXIga29udHJvbCBpc3RlxJ9pbmluIHNvbnVjdSBiZWxpcnNpenNlIGF5bsSxIGnFn2kgeWVuaWRlbiBnw7ZuZGVybWVkZW4gbmUgeWFwbWFsxLFzxLFuPwpZYW7EsXQ6IFllbmkgaXN0ZWsgZ8O2bmRlcm1lZGVuIGF5bsSxIGlzdGXEn2luIHNvbnVjdW51IHNvcmd1bGFtYWsuIEVrcmFuIOKAnEF5bsSxIGlzdGXEn2luIHNvbnVjdW51IHNvcmd1bGHigJ0gZXlsZW1pbmkgZ8O2c3Rlcml5b3I7IHNvbnXDpyBzb3JndWxhbsSxcmtlbiB5ZW5pIGtvbnRyb2wgaXN0ZcSfaSBnw7ZuZGVyaWxtZWRpxJ9pbmkgYmVsaXJ0aXlvci4gxLBzdGVrIGfDtm5kZXJpbGl5b3IgZHVydW11bmRhIGF5bsSxIGlzdGXEn2luIHRla3JhciBnw7ZuZGVyaWxlbWV5ZWNlxJ9pbmkgZGUgc8O2eWzDvHlvci4KRGXEn2VybGVuZGlybWU6IE5ldC4KCjEyLiBBeXLEsW50xLFsYXJhIHZleWEgZXNraSBrYXlkYSBiYWttYWsgc2VuaSBvdG9tYXRpayBvbGFyYWsgdXlndWxhbWF5YSBiYcWfbGF0xLFyIG3EsT8KWWFuxLF0OiBIYXnEsXIuIEVrcmFuIGtheWRhIHZleWEgYXlyxLFudMSxbGFyYSBiYWttYW7EsW4gYmFrxLFtIGnFn2xlbWkgYmHFn2xhdG1hZMSxxJ/EsW7EsSBhw6fEsWvDp2Egc8O2eWzDvHlvci4g4oCcRXRraWxlbmVuIGtheWRhIGJha+KAnSB2ZSBheXLEsW50xLFsYXLEsSBhw6dtYS9rYXBhbWEga29udHJvbGxlcmksIGZpemlrc2VsIGnFn2luIGJhxZ9sYWTEscSfxLEgdmV5YSB5YXDEsWxkxLHEn8SxIGthbsSxdMSxIG9sYXJhayBzdW51bG11eW9yLgpEZcSfZXJsZW5kaXJtZTogTmV0LgoKxLBsayBva3VtYSBzb251Y3UKMTIgc29ydWRhbiAxMOKAmXVuYSBuZXQgeWFuxLF0IHZlcmlsZWJpbGRpLiA4LiBzb3J1IGvEsXNtaSBrYWxkxLE7IDEwLiBzb3J1ZGEgw6dldnJpbWTEscWfxLEgYWx0IGR1cnVtdSBuZXQsIGVza2kga2F5bmFrIHZhcnlhbnTEsW7EsW4gbWV0bmkgb2t1bmFtYWTEsS4gQnUgZ8O2cnNlbCBva3VtYSwgZml4dHVyZeKAmWRha2kg4oCcMTIgeWFuxLF0xLFuIHRhbWFtxLEgYW5sYW1jYSBkb8SfcnXigJ0gZ2XDp2nFnyBrdXJhbMSxbsSxIGthcsWfxLFsYXlhbiB0YW0gYmlyIHNvbnXDpyBkZcSfaWxkaXI7IGJlbGlyc2l6IGFsdCBkdXJ1bWxhciBpw6dpbiB5ZW5pIGdlw6dtacWfc2l6IG9rdW1hIGdlcmVraXIuCgpHw7Zyc2VsIG9rdW5hYmlsaXJsacSfaSBub3R1ClTDvG0gNTIgUE5HIGHDp8SxbGTEsS4gQmlyIGvEsXPEsW0ga2F5bmFrL2l6aW4gaGF0YSBla3JhbsSxbmRhIGdlbmVsIGthcGFsxLEgZXJpxZ9pbSBtZXRuaSBnw7Zyw7xuw7xya2VuLCBiYXrEsSBkb3N5YWxhciAow7Z6ZWxsaWtsZSBzb3VyY2Utc3RhbGUsIHNvdXJjZS1oZWxkLCBmb3JlaWduLXNvdXJjZSwgcHJpdmF0ZS1yZWNvcmQsIGNsYXNzaWZpY2F0aW9uLW1pc3NpbmcgdmUgcmV2aWV3ZXItbWlzc2luZyB2YXJ5YW50bGFyxLEpIGJvxZ8vYcOnxLFrIG1ldGluc2l6IGfDtnLDvG50w7wgdmVyZGkuIEJvxZ8gZ8O2csO8bnTDvGxlcmRlbiBpw6dlcmlrIMOnxLFrYXLEsW3EsSB5YXDEsWxtYWTEsS4=
```
