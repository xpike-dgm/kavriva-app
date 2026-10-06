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
subject_digest: 5adcdf94a050732aa6fd9dc1b1b07fec3298f72312cb6df479b3fd3338efdf36
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
