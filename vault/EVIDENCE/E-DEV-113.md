---
test_id: E-DEV-113
version: 1
purpose: Yeni işlem erişim sınırını ve korunan yolları açık sunmak
domain: motorcycle-entitlement
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.7, F1.7.1, SCR-037, BR-048, BR-049, BR-103, BR-104, BR-106, BR-134, BR-135, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: entitlement-presentation
tasks: [T-E1-014b]
tests: [modules/e01-app/internal/shell/test/entitlement_gate_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-07
depends_on: [V-E1-ENTITLEMENT-001]
used_by: [V-E1-ENTITLEMENT-001, P-E1-014b, T-E1-014b]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR037 C1.7/F1.7.1/FL1.7.1 entitlement v1 GATE"
subject_file: modules/e01-app/internal/shell/lib/entitlement_gate.dart
subject_digest: 260210e37d26fa37153ade46db383c35f4db5ff2a5804879304eae10b5938c4c
result: "Yerel318normal/ayrı1native PASS; bağımsız kabul ve aynıCI-T3 bekleniyor"
gate_verdict: "FAIL F-01 korunmuş erişim entitlement kaynağına bağlı; dar onarım bekleniyor"
reviewer: "/root/e1014b_whole_review; requested gpt-6-luna/max"
timestamp: 2026-10-07
evidence_links: [vault/PROFILES/entitlement-gate-render.md, vault/PACKS/P-E1-014b.md, vault/REGISTRY/T-E1-014b.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-112-E10-GOVERNED-PATHS-FOR-T-E1-014b.md.snapshot, modules/e01-app/internal/shell/lib/entitlement_gate.dart, modules/e01-app/internal/shell/test/entitlement_gate_test.dart, modules/e01-app/internal/shell/test/fixtures/entitlement_gate_reading_questions.json]
---

# Yeni işlem sınırı ve korunan erişim

T-E1-014b, SCR037/C1.7/F1.7.1/FL1.7.1, plan fa914f013fdcd032faed876689092da245989459. Kanonik yöntem GATE / HELD-acceptance evaluation: durumların ve DEC0053 şeklinin E1 sunumu değerlendirilir; gerçek izin E3/E5 sunucusunda uygulanır. SIMULATION olarak yeniden adlandırma veya üretim kapısı kapanışı yok. Tek sert bağımlılık T-E1-014a gerçek DONE; kabul edilmiş main 2471734750e723ab7af5cb84f6676155ca26960f, gerçek101 sınırlı DONE/105 kalan/206. C5.x/T-E5-003 kaynak guardıdır, yeni sert DAG bağımlılığı değildir; E5 IN_PROGRESS kalır.

## Girdi ve niyet sınırı

EntitlementPlan karar, pasiflik, başlamış iş, bütün özel metin, kimlik ve revizyonu kayıpsız UTF16 uzunluk/hex subject'e bağlar; haritalar immutable. Kabul edilmiş E1 HistoryScope/Reference değişmeden tüketilir. Güncel dış plan kaynağı, dört okuma boyutu ve dört alan izni tam scope/request/purpose/subject ile gerekir. Kaynak yok, eski, yabancı, yanlış request/subject/purpose, unknown veya HELD ise özel motosiklet, karar gerekçesi, kaynak ve zaman boyanmaz. E1 abonelik, yerel slot sayısı, handler veya çıplak ALLOW metninden izin türetmez.

Altı korunan yol: geçmiş, kanıt/kaynak, düzeltme/itiraz, dışa aktarma, kritik güvenlik ve başlanmış işin güvenli dönüşü. Bunlar yeni işlem lisans kararından bağımsızdır; her yol kendi güncel okuma referansını yine ister. Yeni bakımın kapalı olması özel veriyi izinsiz okumayı sağlamaz. Çevrimdışı yeni işlem kontrolü kapanır; mevcut güncel okuma izni ve güvenli garaj çıkışı lisans engeline dönüştürülmez.

DEC0053: ücretsiz1 motosiklet, abonelikle toplam3, aynıanda1 seçili tamrehber; başka seçim hak taşır, ek hak yığmaz. BR049 önceki genel ifade bu sonraki şekli değiştirmez. Fiyat, ödeme, seçim sıklığı, deneme/yanlış seçim/antiabuse koşulları HELD. Her motosikletin temel kayıt izolasyonu paket ayrıcalığı değildir. Lisans ve yeniden etkinlik, bakım doğruluğu veya güncel fiziksel uygunluk kanıtı olmaz.

Garaja dön baskın güvenli eylemdir. Seçenek kontrolü dışarı yalnız güncel değerlendirme niyeti iletir, yeniden etkinleştirme/yetki/ödeme yürütmez. Yeni işlem kontrolü yalnız active + dış allowed karar + ayrı altı motorcycle/source/authorization/policy/operationIntent/audit referansı + online + handler ile açıktır; bu da yalnız sunucu kontrolü isteğidir, fiziksel bakım başlatmaz. Aynı scope/request için iki kontrol türü ayrı tek gönderim kilitlidir; içerik değişince kilit açılmaz. Eski callback scope/request/tamplan/online/okuma ve güncel eylem iznini tıklama anında yeniden denetler; handler değişimini ödünç alamaz. Destek ve garaj niyeti özel subject taşımaz. İstek mesajı yalnız niyetin iletildiğini, güncel sonucun doğrulanmadığını ve işlemin başlamadığını söyler.

## Sunum kapısı değerlendirmesi

| Kapı ve kaynak | Gözlenen yerel sunum | Açık üretim sınırı |
|---|---|---|
| SCR037/FAM07/J05v3 | Kısa yeni bakım kapalı, yalnız yeni işlem etkilenir, korunan yollar ve baskın Garaja dön | Gerçek router, kalıcı route/modalite/nav ve cihaz HELD |
| DEC0053/BR134135 |1/3/1 şekli ve taşınan hak, temel motosiklet izolasyonu ayrı | Gerçek quota, abonelik, seçim ve billing yazıcısı HELD |
| BR048/başlamış iş | Kritik güvenlik ve güvenli dönüş lisansla kilitlenmez; geçmiş/düzeltme/export korunur | Gerçek recovery/physical hazırlık üreticisi HELD |
| Güncel mahremiyet |4read/4field/tam subject; eksik veya uygunsuz referansta özel içerik kapalı | Olumlu örnekler açık fixture; üretim E3/E5 okuyucusu yok |
| Yeni işlem kontrolü |active/allowed/6effect/online/handler ve ayrı niyet; oldcallback/çift gönderim engelli | Gerçek sunucu commit kontrolü/ürün mutasyonu/kimlik HELD |

GATE değerlendirmesi üretim kapılarını HELD tutar. Test fixture olumlu referansı canlı kullanıcı izni veya üretim enforcement kanıtı değildir. Bağımsız görev kabulü ve aynı başın CI/T3 henüz beklenir.

## Gerçek yerel kanıt

Kodöncesi 6c8c91c194cfcfdb14f23cb3ce17d129ac837ac6; kod 652d016329618f682bee5fab96ff805f0157614e. Kilitli pubget başarılı, strictformat34 dosya/0 değişiklik, analyze0. Önceki299 normal test değiştirilmeden aynı318 koşuda PASS; yeni19. Native ayrı1PASS;319normal iddiası yok. 19durum×320/390/768×1/2/3=171 gerçek tamkaydırma düzeni; bütün52hedef, son güvenli çıkış gerçek tap/fatalpointer kontrolü. Tab/Enter/Space gerçek, her başlığın çizilmiş header rolü, kapalı button/liveRegion, gerçek çizilmiş metin4.5 ve ikincil/baskın birincil odak3 kontrastı doğrulandı.

Native390×844 tamkaydırma50PNG. Root27 farklı özgün içerik açtı;23 görüntü gerçekten açılmışlara RAW bayt/SHA256 eşitliğiyle doğrulandı. R2 güncel kaynak/test native50, geçmişsiz ilk okuyucunun R1native50 setine tamamı byteequal; R1 veR2 manifestleri ayrı korunur. J05v3 pinned orijinal887×1774 Root açtı ve karşılaştırdı;50 yeni özgün görüntünün ayrıca açıldığı iddiası yok. SDKRoboto yalnız sabit testfontu, nihai font/token kararı değil.

## Hata geçmişi

Test yazıcı ilk shell cwd çağrısında repo-relative yolu bulamadı; hiçbir test yazılmadı. Ardından iki yardımcı substring araması mevcut test helper imzasıyla uyuşmadı; dosya yazılmadı. Doğru bounded helper alımıyla test oluşturuldu. İlk19 test koşusu18PASS/1FAIL: SemanticsHandle teardown geç kaldı. Test gerçek try/finally dispose ile düzeltildi, eşik/uyarı bastırılmadı. R2 hedef19PASS, R3 bütün318PASS. Gerçek header rolleri ve baskın mavi eylemin Tab odak kontrastı ek kontrolü sonrası R4 bütün318PASS; güncelformat34/0-analyze0-nativeR2ayrı1PASS. Bir atomik patch yanlış indent eşleşmesiyle uygulanmadı; doğru bounded patch uygulandı. Temp inline Python görüntü listesi komutu shell kaçış hatasıyla yazmadan durdu; ayrı güvenli dosya yazıcısıyla gerçek RAW kimlikler üretildi. Özgün FAIL/komut kayıtları korunur; bağımsız ret veya üretim arızası uydurulmaz.

## Yedi E10 tasarım kapısı

| Kapı | Gerçek kapsam |
|---|---|
| Bütün ekran |50tamkaydırma parçası;27original+23byteequal, bütün yollar ve son destek okunur |
| Ekranlar arası |J05v3/contextual FAM07 ve kabul edilmiş T014a/E1 çalışmaDNA; yeni router/modalite yok |
| Durum |19 örnek: inactive/denied/held/allowed/started/offline/missing/source/stale/held-unknown-authority/foreign/fieldprivate/pathprivate/effectheld/nohandler/long/contextsent/checksent |
| Duyarlı |171 gerçek düzen; bütün scroll offset/52hedef/fatalpointer/Garaja dön gerçek tap; native390×844 |
| Erişilebilir |TabEnterSpace/gerçek header/disabled button/liveRegion/metin4.5/iki gerçek odak3; OS/screenreader HELD |
| Regresyon |Önceki299 aynı318koşudaPASS;57tabanLFpin/hamv79/eski esas gövde/SDK/YAML/deps korunur |
| Kaynak/varyasyon |REF-LIFECYCLE-001 J05 approvedv3; DEC0053 yalnız şekli sonraki otorite. Mevcut32/22/16/52/640 çalışmaDNA; nihai token/ikon/logo/font/nav/darkmode/device/release HELD |

## Açık kabul ve devam sınırı

13 sabit soru koddan önce donduruldu. Geçmişsiz gpt-6-luna/max yalnız native ekranları ve soruları okuyor; henüz rapor/hüküm yok. Bu AI okuması insan/telefon/CON004 kapanışı değildir. Bütün bağımsız kaynak hükmü ve gerçek aynısourceCI/T3; sonra yalnız6sonmetadata/ayrısonreview/aynısonCI/T3; normalmerge/fetchedmain8 gerekir. Ana101DONE105kalan206 değişmez. DEC0068/69 ve sahibin sürekli açık yetkisi geçerli, birleşmemişDEC0070 otorite değildir. Gerçek gizli model çalışma altyapısı ayrıca doğrulandı iddiası yok. E3R1REVIEW/E5IN_PROGRESS/Supabase47-57-59/RET97/runtime/identity/physical/device/release sınırları korunur.

## Sabit kimlikler

KodLF SHA256 260210e37d26fa37153ade46db383c35f4db5ff2a5804879304eae10b5938c4c; testLF SHA256 bd871e0045e9099b152a72f2ad91d94445af818ef074403e30620115264516f7;13soruLF SHA256 6df6a758a90611576c1fcf915cd2e0a277329ccca247d8acc021aec7b039e3e1. Hamv79 211840bayt/RAW SHA256 eb8d54882d55e1f147f2060a97449dddb10e78c5295354641fc36c9b98075602.

## Güncel native RAW kimlikler

- kavriva_e1014b_native_R2-context-requested-0.png / context-requested / RAW SHA256 9ea737c8e61afb69a4692757207a8beec8b4883cb8e7eea73a52ea561f872a1b / 72783bayt /390×844 /offset 0.0/end 905.0
- kavriva_e1014b_native_R2-context-requested-1.png / context-requested / RAW SHA256 404cd88bc42ccf4308c2e66482dbc805758a85466443368bc5889a13d80a9db6 / 81405bayt /390×844 /offset 620.0/end 905.0
- kavriva_e1014b_native_R2-context-requested-2.png / context-requested / RAW SHA256 89fa169a88ebbb95fd2b5f6bb87aaa35b760b02952c0f2bc96742cfee3658a5f / 78499bayt /390×844 /offset 905.0/end 905.0
- kavriva_e1014b_native_R2-check-requested-0.png / check-requested / RAW SHA256 679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2 / 69176bayt /390×844 /offset 0.0/end 1038.0
- kavriva_e1014b_native_R2-check-requested-1.png / check-requested / RAW SHA256 dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4 / 78961bayt /390×844 /offset 620.0/end 1038.0
- kavriva_e1014b_native_R2-check-requested-2.png / check-requested / RAW SHA256 1637c26a8093314830ea63d293ec0428da1f8ef3eac967f3a45c5d577f72d789 / 80136bayt /390×844 /offset 1038.0/end 1038.0
- kavriva_e1014b_native_R2-inactive-0.png / inactive / RAW SHA256 625112ec3d959524877095df815ca92cc5c8f5f7f9bb0e0a09f961859249f125 / 70534bayt /390×844 /offset 0.0/end 890.0
- kavriva_e1014b_native_R2-inactive-1.png / inactive / RAW SHA256 6406fdabb3d4721d404dcc506336146a8cf37eb6a1296f452dca24c98d769a12 / 80880bayt /390×844 /offset 620.0/end 890.0
- kavriva_e1014b_native_R2-inactive-2.png / inactive / RAW SHA256 9c2d31ce035da73692386816bc433b41ddd6905a7205da5cd5fc46de22083d42 / 76890bayt /390×844 /offset 890.0/end 890.0
- kavriva_e1014b_native_R2-denied-0.png / denied / RAW SHA256 9ea737c8e61afb69a4692757207a8beec8b4883cb8e7eea73a52ea561f872a1b / 72783bayt /390×844 /offset 0.0/end 847.0
- kavriva_e1014b_native_R2-denied-1.png / denied / RAW SHA256 e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268 / 81408bayt /390×844 /offset 620.0/end 847.0
- kavriva_e1014b_native_R2-denied-2.png / denied / RAW SHA256 9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3 / 79400bayt /390×844 /offset 847.0/end 847.0
- kavriva_e1014b_native_R2-held-0.png / held / RAW SHA256 383b8aab4b6a15c2cea9ee2883f65860138adc08454cf58cc475b3e79bfa03e5 / 71557bayt /390×844 /offset 0.0/end 847.0
- kavriva_e1014b_native_R2-held-1.png / held / RAW SHA256 e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268 / 81408bayt /390×844 /offset 620.0/end 847.0
- kavriva_e1014b_native_R2-held-2.png / held / RAW SHA256 9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3 / 79400bayt /390×844 /offset 847.0/end 847.0
- kavriva_e1014b_native_R2-allowed-0.png / allowed / RAW SHA256 679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2 / 69176bayt /390×844 /offset 0.0/end 980.0
- kavriva_e1014b_native_R2-allowed-1.png / allowed / RAW SHA256 dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4 / 78961bayt /390×844 /offset 620.0/end 980.0
- kavriva_e1014b_native_R2-allowed-2.png / allowed / RAW SHA256 7fc2c7f308a7606c9f0f4da31d302c0cd693ddd775166735a814c1088378632e / 78331bayt /390×844 /offset 980.0/end 980.0
- kavriva_e1014b_native_R2-started-0.png / started / RAW SHA256 625112ec3d959524877095df815ca92cc5c8f5f7f9bb0e0a09f961859249f125 / 70534bayt /390×844 /offset 0.0/end 971.0
- kavriva_e1014b_native_R2-started-1.png / started / RAW SHA256 d23278f1e3601ed651da61b62b504bb46a2a87b0123b53ecb00172c574761172 / 77766bayt /390×844 /offset 620.0/end 971.0
- kavriva_e1014b_native_R2-started-2.png / started / RAW SHA256 2464897526b9e389cf672b5313116d4fdffaa459ea3950e85d2b2a14c2719546 / 77649bayt /390×844 /offset 971.0/end 971.0
- kavriva_e1014b_native_R2-offline-0.png / offline / RAW SHA256 acde49c429589cded2168bc17095ffe02cb8789ce70a6f278109457c10cd323e / 68483bayt /390×844 /offset 0.0/end 1038.0
- kavriva_e1014b_native_R2-offline-1.png / offline / RAW SHA256 282d8173a5a83b0ba5961e24ac8b4d1da7be8022794456a38e0027d25b0b7805 / 76113bayt /390×844 /offset 620.0/end 1038.0
- kavriva_e1014b_native_R2-offline-2.png / offline / RAW SHA256 b9cddd1c7bbf3cefc59e5d4dedf1369b335b0d3930287ba956b956d33af42f56 / 78280bayt /390×844 /offset 1038.0/end 1038.0
- kavriva_e1014b_native_R2-missing-0.png / missing / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-missing-1.png / missing / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-source-missing-0.png / source-missing / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-source-missing-1.png / source-missing / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-stale-0.png / stale / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-stale-1.png / stale / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-authority-held-0.png / authority-held / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-authority-held-1.png / authority-held / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-authority-unknown-0.png / authority-unknown / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-authority-unknown-1.png / authority-unknown / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-foreign-0.png / foreign / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-foreign-1.png / foreign / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-field-private-0.png / field-private / RAW SHA256 056e9789cc2048afc90555b9140f9b508ff8a81fdebbf8a8291985b5f5810b53 / 75800bayt /390×844 /offset 0.0/end 550.0
- kavriva_e1014b_native_R2-field-private-1.png / field-private / RAW SHA256 0b236e534a984258f43420c84a795b51ce355072398b01ed894b75e2b53a5d33 / 80779bayt /390×844 /offset 550.0/end 550.0
- kavriva_e1014b_native_R2-path-private-0.png / path-private / RAW SHA256 478783ad548d12c4efc3ceb00f970e9456e31ad22d41d1295ff9458abef821c0 / 72838bayt /390×844 /offset 0.0/end 847.0
- kavriva_e1014b_native_R2-path-private-1.png / path-private / RAW SHA256 e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268 / 81408bayt /390×844 /offset 620.0/end 847.0
- kavriva_e1014b_native_R2-path-private-2.png / path-private / RAW SHA256 9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3 / 79400bayt /390×844 /offset 847.0/end 847.0
- kavriva_e1014b_native_R2-effect-held-0.png / effect-held / RAW SHA256 679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2 / 69176bayt /390×844 /offset 0.0/end 980.0
- kavriva_e1014b_native_R2-effect-held-1.png / effect-held / RAW SHA256 dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4 / 78961bayt /390×844 /offset 620.0/end 980.0
- kavriva_e1014b_native_R2-effect-held-2.png / effect-held / RAW SHA256 d0be377d5f31318fe1803529c951a2a0228d3ad11598ad7cecf98fb3164588f3 / 78346bayt /390×844 /offset 980.0/end 980.0
- kavriva_e1014b_native_R2-no-handler-0.png / no-handler / RAW SHA256 c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031 / 72732bayt /390×844 /offset 0.0/end 847.0
- kavriva_e1014b_native_R2-no-handler-1.png / no-handler / RAW SHA256 fe04257dbcf0bff93b7c96a605541b0e8f40a0215a6ec2dd7c7c924f0fa99055 / 81339bayt /390×844 /offset 620.0/end 847.0
- kavriva_e1014b_native_R2-no-handler-2.png / no-handler / RAW SHA256 6c01486f2c24eac7358df3df0137e63ecedab0b182ba832e4f3997db31122f02 / 79264bayt /390×844 /offset 847.0/end 847.0
- kavriva_e1014b_native_R2-long-0.png / long / RAW SHA256 1fac4d0080312945eb37603ee8a2da10320b103b857dd830535565d00a8ecbbc / 82710bayt /390×844 /offset 0.0/end 1123.0
- kavriva_e1014b_native_R2-long-1.png / long / RAW SHA256 48e07e32a23e218ed0006ae45755f0f22f5bb07217d8732a462f7bcc87eafb7e / 75089bayt /390×844 /offset 620.0/end 1123.0
- kavriva_e1014b_native_R2-long-2.png / long / RAW SHA256 9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3 / 79400bayt /390×844 /offset 1123.0/end 1123.0

## Ham günlükler

- kavriva_e1014b_analyze.log / RAW SHA256 6c44a36aa3ba94c685e36f84694b5cba68f950e2bd3475c704e9d2a1d721f6e4 / 98bayt
- kavriva_e1014b_final_analyze.log / RAW SHA256 1609c1b19dee94b382f0cae9370263c5a7bef130f52ae6c4e8dbfa2f7151490d / 98bayt
- kavriva_e1014b_final_format.log / RAW SHA256 a80af3c68298bdf33915e974763d7730c4cc1e6a3fa10993ba9dc6c27c35ef5d / 49bayt
- kavriva_e1014b_format.log / RAW SHA256 5f113e42375cfed519f68e6cac5160cbd68cbbf577a403291707dd7bac51d0fa / 49bayt
- kavriva_e1014b_native_R1.log / RAW SHA256 e2d1a63e283e3cdb8a28742168ff2c7d67bc65848abd48e981c5bd8cffb3779e / 266bayt
- kavriva_e1014b_native_R2.log / RAW SHA256 e2d1a63e283e3cdb8a28742168ff2c7d67bc65848abd48e981c5bd8cffb3779e / 266bayt
- kavriva_e1014b_pubget.log / RAW SHA256 0f6f606fe6106606054e3e430c19492c9b51de46c4a608eef235b1e595dc13d4 / 287bayt
- kavriva_e1014b_R1_analyze.log / RAW SHA256 6c44a36aa3ba94c685e36f84694b5cba68f950e2bd3475c704e9d2a1d721f6e4 / 98bayt
- kavriva_e1014b_R1_target_tests.log / RAW SHA256 195e3810140a3bc4e5f12d25d643fca30639deca1a01f71d847d8e94f48d372d / 3401bayt
- kavriva_e1014b_R2_target_tests.log / RAW SHA256 c3ef7da7eb91b688decd46ddff8d9cbca3c4ccac66eb841e6366c4ff457f34b2 / 1696bayt
- kavriva_e1014b_R3_full_tests.log / RAW SHA256 28f2262633c1808759779d920b21d80b372508b41199bfdb0db193bd83b67121 / 72018bayt
- kavriva_e1014b_R4_full_tests.log / RAW SHA256 0b3b351558f9e413f496350e22a72e59383f7ab3894b63835df740cf024df202 / 72102bayt

## Pinned kaynak görsel

[
  {
    "plan": "fa914f013fdcd032faed876689092da245989459",
    "reference": "refernces/J05-SCR-037-New-Activity-Entitlement-Gate-Preserved-Access.png",
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1014b_readahead_J05-SCR-037.png",
    "bytes": 1720052,
    "sha256": "3116e28ee8527b114c790dbcffa750f93ed547a7a0eb1886bd147d25a8d64e7c",
    "dimensions": [
      887,
      1774
    ],
    "rootOriginalOpened": true
  }
]


`vault/PROFILES/entitlement-gate-render.md`; `vault/PACKS/P-E1-014b.md`; `vault/REGISTRY/T-E1-014b.md`; `vault/EVIDENCE/E-DEV-113.md`.

## İlk mimari kayıt kontrolü ve düzeltme

R1 run_all42koruma testi PASS, fakat toplam worst1: görevde kaynak bağlantısı olmayan HELD etiketi ve kanıtta kapalı hüküm sözlüğü dışı GATE başlangıcı. Üretim engeli kaldırılmadı; hüküm IN_PROGRESS yapıldı ve engelin kaynakları `vault/PACKS/P-E1-014b.md` / `vault/PROFILES/entitlement-gate-render.md` / `vault/EVIDENCE/E-DEV-113.md` olarak bağlandı. Özgün R1 günlük tutulur; tekrar run_all sonucu ayrıca beklenir.

## Bağımsız ekran ilk okuması ve gerçek sınırlama

/root/e1014b_first_reading geçmişsiz bağımsız bağlam, istenen gpt-6-luna/max; yalnız50nativePNG ve sabit13soruyu okudu. 50/50RAW boyut/SHA doğrulandı;27farklıoriginal açıldı ve23girdi byteequal. Root özgün raporun tamamını okudu: 13 anlam doğru çıkarılıyor. Q5 özellikle Garaja dön etiketinin açık olduğunu, fakat no-handler görüntüsünde kapalı olduğunu kaydediyor; her durumda tıklanabilir iddiası yok. Bu gerçek sınır saklanmaz: handler olmayan E1 örneği gerçek garaj/router bağlantısı değildir; handler sağlanırsa eksik kaynak ve offline altında bile güvenli garaj niyeti açıktır. Bu durum yeni izin veya üretim nav kanıtı sağlamaz. İlk okuma ürünün gerçek çalışması veya bütün görev bağımsız kabulü değildir. Özgün rapor değişmedi.

R2 run_all ilk kaynak-bağlantı hatasını kapattı; yine conformance worst1 kaldı çünkü IN_PROGRESS evidence hükmünün kapalı sözlüğünde yok. Kaynak dosyanın gerçek sözlüğü okundu; kanıt hükmü RECORDED yapıldı, görev IN_PROGRESS/üretim HELD korundu. R1/R2özgün günlükleri korunur; hiçbir göreve PASS/DONE verilmedi. Yeni run_all sonucu ayrıca doğrulanacaktır.

## Özgün ilk okuma tam raporu

RAW 4153bayt/SHA256 1f24efa76a0046a67dd64f7a4f64b385b001af02157a4eb085f4960f821dffa8

<pre>Bağımsız ilk okuma raporu

Kapsam ve görüntü doğrulaması

Yalnızca sabit 13 soruyu ve manifestteki native PNG ekranlarını okudum. Manifest 19 duruma ait 50 PNG girdisi içeriyor. 50 dosyanın tamamında ham dosya boyutu ve SHA-256 manifest değerleriyle eşleşti. Aynı ham SHA-256 grubundaki dosyalar ayrıca bayt bayt karşılaştırıldı.

Açılan farklı özgün görüntü içeriği sayısı: 27. Bu 27 PNG&#x27;nin her biri view_image ile original ayrıntıda açıldı. Diğer 23 manifest girdisi, daha önce açılmış bir özgün içerikle bayt bayt aynı çıktı. Yinelenen gruplar içindeki tüm olası ikili RAW eşitlik sayısı 59. Manifestte boyut veya hash uyuşmazlığı yoktu.

Ekranlardan anladığım yanıtlar

1. Bu ekran yeni bir bakım/yeni işlem için mevcut hak veya izin durumunu gösterip yeni işlemi kapatıyor. Geçmiş kayıtlarını silmiyor; metin açıkça yeni işlem sınırının geçmişi silmediğini ve mevcut kayıtların korunduğunu söylüyor.

2. Geçmiş kayıtları ile kanıt ve kaynak bilgisi, ekrandaki “Geçmiş kayıtları” ve “Kanıt ve kaynak bilgisi” yollarından görüntülenebilir. Bunlar paket satın almaya bağlı değil; her biri için güncel kimlik ve okuma izni gerekiyor.

3. Hayır. “Düzeltme ve itiraz” ile “Kayıtları dışa aktar” paket nedeniyle kaybolmuyor. Bu yollar için de güncel kimlik ve okuma izni gerektiği belirtiliyor.

4. Hayır. Kritik güvenlik bilgisi ve başlanmış işin güvenli dönüşü paket nedeniyle kapatılmıyor. Önceki izinlerin işi sürdürmek için tek başına yeterli olmadığı, güncel fiziksel durumun ayrıca değerlendirilmesi gerektiği de yazıyor.

5. Güvenli ana eylem “Garaja dön”. Ekranların çoğunda bu düğme etkin ve mavi; bir görüntü varyantında gri/devre dışı. Bu nedenle eylemin ne olduğu açık, fakat her durumda seçilebilir olduğu söylenmiyor.

6. Ücretsiz hak 1 motosiklet için. Abonelikle toplam 3 motosiklet kapsamda; aynı anda yalnızca seçili 1 motosiklette tam rehber var.

7. Tam rehber için başka motosiklet seçilince hak o motosiklete taşınıyor; önceki hakkın üstüne eklenmiyor. Her motosikletin kayıtları ayrı kalıyor.

8. Hayır. Hak veya abonelik bakımın doğruluğunu ya da motosikletin güncel fiziksel uygunluğunu kanıtlamıyor. Yeniden etkinleştirme de fiziksel kontrolün yerini almıyor.

9. Hayır. Mevcut kayıtlara erişimin korunması, özel verilere kimlik ve okuma izni olmadan erişilebileceği anlamına gelmiyor. Ekran bu izinlerin her erişim yolu için gerekli olduğunu söylüyor.

10. Hayır. Çevrimdışıyken yeni işlem için güncel sunucu kontrolü gerektiği yazıyor. Güncel izin bilgisi alınamadığında özel motosiklet ve izin bilgileri gösterilmiyor; güncel kimlik ve okuma izni gerekiyor. Yeni bakım kendiliğinden açılmıyor.

11. Hayır. Sunucu kontrolü isteği güncel değerlendirme talebidir; ödeme yapmıyor, hak vermiyor ve bakımı başlatmıyor. Ekran, sonucun henüz doğrulanmadığını ve işlemin başlamadığını söylüyor.

12. Hayır. Ekranda fiyat, ödeme, seçim değiştirme sıklığı ve deneme koşulları kesinleştirilmemiş.

13. Hayır. Motosikleti yeniden etkinleştirmek, güncel fiziksel uygunluğun kanıtı değil; fiziksel kontrolün yerine geçmiyor.

Anlaşılırlık hükmü

13 sorunun yanıtı ekran metninden anlamca çıkarılabiliyor. Ana mesajlar anlaşılır: yeni işlem sınırı geçmişi silmiyor; korunan kayıt yolları paket satın almaya bağlı değil ama kimlik/okuma izni istiyor; abonelik fiziksel uygunluk veya bakım doğruluğu kanıtı değil; izin ya da sunucu kontrolü yokken yeni işlem otomatik başlamıyor.

Görüntüler arasında düğmelerin etkin/devre dışı durumu değişiyor. Özellikle “Garaja dön” eyleminin adı anlaşılır, ancak tüm varyantlarda etkin değil. Çekirdek açıklamalarda birbiriyle çelişen anlam görmedim.

Bu, yalnızca görüntüdeki metnin ve eylem etiketlerinin anlaşılabilirliğine ilişkin AI okumasıdır; insan, telefon veya işletim sistemi deneyimine dair kanıt değildir.
</pre>

## Özgün ilk okuma RAW Base64

```base64
QmHEn8SxbXPEsXogaWxrIG9rdW1hIHJhcG9ydQoKS2Fwc2FtIHZlIGfDtnLDvG50w7wgZG/En3J1bGFtYXPEsQoKWWFsbsSxemNhIHNhYml0IDEzIHNvcnV5dSB2ZSBtYW5pZmVzdHRla2kgbmF0aXZlIFBORyBla3JhbmxhcsSxbsSxIG9rdWR1bS4gTWFuaWZlc3QgMTkgZHVydW1hIGFpdCA1MCBQTkcgZ2lyZGlzaSBpw6dlcml5b3IuIDUwIGRvc3lhbsSxbiB0YW1hbcSxbmRhIGhhbSBkb3N5YSBib3l1dHUgdmUgU0hBLTI1NiBtYW5pZmVzdCBkZcSfZXJsZXJpeWxlIGXFn2xlxZ90aS4gQXluxLEgaGFtIFNIQS0yNTYgZ3J1YnVuZGFraSBkb3N5YWxhciBheXLEsWNhIGJheXQgYmF5dCBrYXLFn8SxbGHFn3TEsXLEsWxkxLEuCgpBw6fEsWxhbiBmYXJrbMSxIMO2emfDvG4gZ8O2csO8bnTDvCBpw6dlcmnEn2kgc2F5xLFzxLE6IDI3LiBCdSAyNyBQTkcnbmluIGhlciBiaXJpIHZpZXdfaW1hZ2UgaWxlIG9yaWdpbmFsIGF5csSxbnTEsWRhIGHDp8SxbGTEsS4gRGnEn2VyIDIzIG1hbmlmZXN0IGdpcmRpc2ksIGRhaGEgw7ZuY2UgYcOnxLFsbcSxxZ8gYmlyIMO2emfDvG4gacOnZXJpa2xlIGJheXQgYmF5dCBheW7EsSDDp8Sxa3TEsS4gWWluZWxlbmVuIGdydXBsYXIgacOnaW5kZWtpIHTDvG0gb2xhc8SxIGlraWxpIFJBVyBlxZ9pdGxpayBzYXnEsXPEsSA1OS4gTWFuaWZlc3R0ZSBib3l1dCB2ZXlhIGhhc2ggdXl1xZ9tYXpsxLHEn8SxIHlva3R1LgoKRWtyYW5sYXJkYW4gYW5sYWTEscSfxLFtIHlhbsSxdGxhcgoKMS4gQnUgZWtyYW4geWVuaSBiaXIgYmFrxLFtL3llbmkgacWfbGVtIGnDp2luIG1ldmN1dCBoYWsgdmV5YSBpemluIGR1cnVtdW51IGfDtnN0ZXJpcCB5ZW5pIGnFn2xlbWkga2FwYXTEsXlvci4gR2XDp21pxZ8ga2F5xLF0bGFyxLFuxLEgc2lsbWl5b3I7IG1ldGluIGHDp8Sxa8OnYSB5ZW5pIGnFn2xlbSBzxLFuxLFyxLFuxLFuIGdlw6dtacWfaSBzaWxtZWRpxJ9pbmkgdmUgbWV2Y3V0IGthecSxdGxhcsSxbiBrb3J1bmR1xJ91bnUgc8O2eWzDvHlvci4KCjIuIEdlw6dtacWfIGthecSxdGxhcsSxIGlsZSBrYW7EsXQgdmUga2F5bmFrIGJpbGdpc2ksIGVrcmFuZGFraSDigJxHZcOnbWnFnyBrYXnEsXRsYXLEseKAnSB2ZSDigJxLYW7EsXQgdmUga2F5bmFrIGJpbGdpc2nigJ0geW9sbGFyxLFuZGFuIGfDtnLDvG50w7xsZW5lYmlsaXIuIEJ1bmxhciBwYWtldCBzYXTEsW4gYWxtYXlhIGJhxJ9sxLEgZGXEn2lsOyBoZXIgYmlyaSBpw6dpbiBnw7xuY2VsIGtpbWxpayB2ZSBva3VtYSBpem5pIGdlcmVraXlvci4KCjMuIEhhecSxci4g4oCcRMO8emVsdG1lIHZlIGl0aXJheuKAnSBpbGUg4oCcS2F5xLF0bGFyxLEgZMSxxZ9hIGFrdGFy4oCdIHBha2V0IG5lZGVuaXlsZSBrYXlib2xtdXlvci4gQnUgeW9sbGFyIGnDp2luIGRlIGfDvG5jZWwga2ltbGlrIHZlIG9rdW1hIGl6bmkgZ2VyZWt0acSfaSBiZWxpcnRpbGl5b3IuCgo0LiBIYXnEsXIuIEtyaXRpayBnw7x2ZW5saWsgYmlsZ2lzaSB2ZSBiYcWfbGFubcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvCBwYWtldCBuZWRlbml5bGUga2FwYXTEsWxtxLF5b3IuIMOWbmNla2kgaXppbmxlcmluIGnFn2kgc8O8cmTDvHJtZWsgacOnaW4gdGVrIGJhxZ/EsW5hIHlldGVybGkgb2xtYWTEscSfxLEsIGfDvG5jZWwgZml6aWtzZWwgZHVydW11biBheXLEsWNhIGRlxJ9lcmxlbmRpcmlsbWVzaSBnZXJla3RpxJ9pIGRlIHlhesSxeW9yLgoKNS4gR8O8dmVubGkgYW5hIGV5bGVtIOKAnEdhcmFqYSBkw7Zu4oCdLiBFa3JhbmxhcsSxbiDDp2/En3VuZGEgYnUgZMO8xJ9tZSBldGtpbiB2ZSBtYXZpOyBiaXIgZ8O2csO8bnTDvCB2YXJ5YW50xLFuZGEgZ3JpL2RldnJlIGTEscWfxLEuIEJ1IG5lZGVubGUgZXlsZW1pbiBuZSBvbGR1xJ91IGHDp8SxaywgZmFrYXQgaGVyIGR1cnVtZGEgc2XDp2lsZWJpbGlyIG9sZHXEn3Ugc8O2eWxlbm1peW9yLgoKNi4gw5xjcmV0c2l6IGhhayAxIG1vdG9zaWtsZXQgacOnaW4uIEFib25lbGlrbGUgdG9wbGFtIDMgbW90b3Npa2xldCBrYXBzYW1kYTsgYXluxLEgYW5kYSB5YWxuxLF6Y2Egc2XDp2lsaSAxIG1vdG9zaWtsZXR0ZSB0YW0gcmVoYmVyIHZhci4KCjcuIFRhbSByZWhiZXIgacOnaW4gYmHFn2thIG1vdG9zaWtsZXQgc2XDp2lsaW5jZSBoYWsgbyBtb3Rvc2lrbGV0ZSB0YcWfxLFuxLF5b3I7IMO2bmNla2kgaGFra8SxbiDDvHN0w7xuZSBla2xlbm1peW9yLiBIZXIgbW90b3Npa2xldGluIGthecSxdGxhcsSxIGF5csSxIGthbMSxeW9yLgoKOC4gSGF5xLFyLiBIYWsgdmV5YSBhYm9uZWxpayBiYWvEsW3EsW4gZG/En3J1bHXEn3VudSB5YSBkYSBtb3Rvc2lrbGV0aW4gZ8O8bmNlbCBmaXppa3NlbCB1eWd1bmx1xJ91bnUga2FuxLF0bGFtxLF5b3IuIFllbmlkZW4gZXRraW5sZcWfdGlybWUgZGUgZml6aWtzZWwga29udHJvbMO8biB5ZXJpbmkgYWxtxLF5b3IuCgo5LiBIYXnEsXIuIE1ldmN1dCBrYXnEsXRsYXJhIGVyacWfaW1pbiBrb3J1bm1hc8SxLCDDtnplbCB2ZXJpbGVyZSBraW1saWsgdmUgb2t1bWEgaXpuaSBvbG1hZGFuIGVyacWfaWxlYmlsZWNlxJ9pIGFubGFtxLFuYSBnZWxtaXlvci4gRWtyYW4gYnUgaXppbmxlcmluIGhlciBlcmnFn2ltIHlvbHUgacOnaW4gZ2VyZWtsaSBvbGR1xJ91bnUgc8O2eWzDvHlvci4KCjEwLiBIYXnEsXIuIMOHZXZyaW1kxLHFn8SxeWtlbiB5ZW5pIGnFn2xlbSBpw6dpbiBnw7xuY2VsIHN1bnVjdSBrb250cm9sw7wgZ2VyZWt0acSfaSB5YXrEsXlvci4gR8O8bmNlbCBpemluIGJpbGdpc2kgYWzEsW5hbWFkxLHEn8SxbmRhIMO2emVsIG1vdG9zaWtsZXQgdmUgaXppbiBiaWxnaWxlcmkgZ8O2c3RlcmlsbWl5b3I7IGfDvG5jZWwga2ltbGlrIHZlIG9rdW1hIGl6bmkgZ2VyZWtpeW9yLiBZZW5pIGJha8SxbSBrZW5kaWxpxJ9pbmRlbiBhw6fEsWxtxLF5b3IuCgoxMS4gSGF5xLFyLiBTdW51Y3Uga29udHJvbMO8IGlzdGXEn2kgZ8O8bmNlbCBkZcSfZXJsZW5kaXJtZSB0YWxlYmlkaXI7IMO2ZGVtZSB5YXBtxLF5b3IsIGhhayB2ZXJtaXlvciB2ZSBiYWvEsW3EsSBiYcWfbGF0bcSxeW9yLiBFa3Jhbiwgc29udWN1biBoZW7DvHogZG/En3J1bGFubWFkxLHEn8SxbsSxIHZlIGnFn2xlbWluIGJhxZ9sYW1hZMSxxJ/EsW7EsSBzw7Z5bMO8eW9yLgoKMTIuIEhhecSxci4gRWtyYW5kYSBmaXlhdCwgw7ZkZW1lLCBzZcOnaW0gZGXEn2nFn3Rpcm1lIHPEsWtsxLHEn8SxIHZlIGRlbmVtZSBrb8WfdWxsYXLEsSBrZXNpbmxlxZ90aXJpbG1lbWnFny4KCjEzLiBIYXnEsXIuIE1vdG9zaWtsZXRpIHllbmlkZW4gZXRraW5sZcWfdGlybWVrLCBnw7xuY2VsIGZpemlrc2VsIHV5Z3VubHXEn3VuIGthbsSxdMSxIGRlxJ9pbDsgZml6aWtzZWwga29udHJvbMO8biB5ZXJpbmUgZ2XDp21peW9yLgoKQW5sYcWfxLFsxLFybMSxayBow7xrbcO8CgoxMyBzb3J1bnVuIHlhbsSxdMSxIGVrcmFuIG1ldG5pbmRlbiBhbmxhbWNhIMOnxLFrYXLEsWxhYmlsaXlvci4gQW5hIG1lc2FqbGFyIGFubGHFn8SxbMSxcjogeWVuaSBpxZ9sZW0gc8SxbsSxcsSxIGdlw6dtacWfaSBzaWxtaXlvcjsga29ydW5hbiBrYXnEsXQgeW9sbGFyxLEgcGFrZXQgc2F0xLFuIGFsbWF5YSBiYcSfbMSxIGRlxJ9pbCBhbWEga2ltbGlrL29rdW1hIGl6bmkgaXN0aXlvcjsgYWJvbmVsaWsgZml6aWtzZWwgdXlndW5sdWsgdmV5YSBiYWvEsW0gZG/En3J1bHXEn3Uga2FuxLF0xLEgZGXEn2lsOyBpemluIHlhIGRhIHN1bnVjdSBrb250cm9sw7wgeW9ra2VuIHllbmkgacWfbGVtIG90b21hdGlrIGJhxZ9sYW3EsXlvci4KCkfDtnLDvG50w7xsZXIgYXJhc8SxbmRhIGTDvMSfbWVsZXJpbiBldGtpbi9kZXZyZSBkxLHFn8SxIGR1cnVtdSBkZcSfacWfaXlvci4gw5Z6ZWxsaWtsZSDigJxHYXJhamEgZMO2buKAnSBleWxlbWluaW4gYWTEsSBhbmxhxZ/EsWzEsXIsIGFuY2FrIHTDvG0gdmFyeWFudGxhcmRhIGV0a2luIGRlxJ9pbC4gw4dla2lyZGVrIGHDp8Sxa2xhbWFsYXJkYSBiaXJiaXJpeWxlIMOnZWxpxZ9lbiBhbmxhbSBnw7ZybWVkaW0uCgpCdSwgeWFsbsSxemNhIGfDtnLDvG50w7xkZWtpIG1ldG5pbiB2ZSBleWxlbSBldGlrZXRsZXJpbmluIGFubGHFn8SxbGFiaWxpcmxpxJ9pbmUgaWxpxZ9raW4gQUkgb2t1bWFzxLFkxLFyOyBpbnNhbiwgdGVsZWZvbiB2ZXlhIGnFn2xldGltIHNpc3RlbWkgZGVuZXlpbWluZSBkYWlyIGthbsSxdCBkZcSfaWxkaXIuCg==
```

## Bütün kaynak incelemesine hazırlık

R3run_all12kontrol+42koruma/iztestiPASSworst0; R1/R2özgünFAILkorunur.318normal/format34-0/analyze0/currentnative50byteequal/13ilkoku sınırlaması kaydedildi. GörevREVIEW; bağımsız bütün GATE hükmü ve gerçek aynısourceCI-T3 henüz bekleniyor. Normalmain101DONE105kalan206 değişmez; üretimHELD.

## Özgün bütün kaynak reddi ve kodöncesi F-01 dar onarım

Bağımsız /root/e1014b_whole_review, istenen gpt-6-luna/max, SOURCE18fbc51d153acd28a0a55d2a6d5e5f4fe4e467ae için CHANGES REQUESTED. Root özgün11890bayt raporun tamamını okudu; RAW SHA256726c1908467c4aff5b25e57adce4fd589a45685980fa8edf2ac800f6367e7285. Aynısource17CI/gerçek PR-T3 başarılı olması bu reddi kapatmaz. Ana101DONE105kalan206; görev CHANGES_REQUESTED. Özgün ilk okuma ve Q5nohandler sınırı, R1/R2graphFAIL ve bütün eski kanıtlar korunur.

F-01 koddan önce dar onarım kapsamı: korunmuş yollar, entitlement plan/authority/field/kararından bağımsız immutable dört kendi okuma boyutu ve yol iznine bağlanır. Own preserved subject yalnız motorcycle/context/catalog/revision kimlikleri; özel entitlement gerekçesi/değerleri taşımaz. Her kendi referans tam scope/request/purpose/subject/current/confirmed bağında. Lisans planı veya alan kaynağı eksik/eski/held/unknown olsa bile geçerli korunmuş okuma lisans nedeniyle kapanmaz; kendi okuma referansı eksik/eski/yabancı/held/unknown olduğunda yine kapanır. Yeni işlem 4read/4field/6effect/active/allowed/online guardları değişmez. Korunmuş read callback aynıscope/request ve güncel ownpath iznini tıklama anında denetler; lisans planının değişmesi tek başına geçerli okumayı kapatmaz. Handler veya öz-okuma izin kaybı/eski scope/request callback'i kapatır. Garaj/destek özel subject taşımaz ve geçerli handler altında plan kaybında güvenli çıkış niyeti kalır; gerçek router yok.

Mevcut tam14adres/57tabanpin/hamv79/13soru değişmez. Yeni publicseam/DB/auth/billing/cihaz/nav/token kararı yok. Tests missing/noSource/stale/held/unknown/private-entitlement + independently valid preservedread, own4read/path negatifleri ve callback license-change/no-borrow senaryolarını göstermeli. Native tümcurrentstates+fresh13ilkoku, yeni exactsourceCI/T3 ve taze bütün GATE review; ayrıson6/finalreview/finalCI/main8 beklenir. ÜretimE3R1REVIEW/E5IN_PROGRESS/Supabase47-57-59/RET97/identity/physical/device/release HELD.

## Özgün R1 bütün kaynak raporu tam içerik

<pre>BAĞIMSIZ BÜTÜN KAYNAK İNCELEMESİ
T-E1-014b / SCR-037 / FL1.7.1 / F1.7.1 / C1.7
Tarih: 2026-10-07

HÜKÜM: CHANGES_REQUESTED

İncelenen özne PR 115, açık/taslak ve t3-privileged etiketli; dal codex/e1-entitlement-gate, ana dal 2471734750e723ab7af5cb84f6676155ca26960f, exact source başı 18fbc51d153acd28a0a55d2a6d5e5f4fe4e467ae. Bağımsız kaynak incelemesi bu başta yapıldı. Repo temiz ve dondurulmuştu. Bu rapor kaynak kabulünü vermiyor; aşağıdaki P1 bulgusu kapatılmadan T-E1-014b&#x27;nin sınırlandırılmış sunum GATE kabulü uygun değil.

Bu hüküm yalnızca T-E1-014b&#x27;nin kanonik GATE / HELD-acceptance sunum değerlendirmesine ilişkindir. SIMULATION veya üretim entitlement enforcement kabulü değildir. T-E1-014a&#x27;nın main&#x27;deki gerçek DONE durumu tek sert bağımlılıktır. T-E5-003 kaynak/acceptance guardıdır, yeni hard dependency değildir; T-E5-003 IN_PROGRESS ve E3R1 REVIEW kalır. Planın sabit kimliği fa914f013fdcd032faed876689092da245989459&#x27;dır; birleşmemiş DEC0070 bu görev için otorite değildir. Ana 101 DONE / 105 kalan / 206 toplam görünümü değişmez; billing, E3/E5 kimlik-yetki, fiziksel doğrulama, runtime, cihaz ve release kapıları HELD kalır.

1. Kanonik kaynak ve görev sınırı

P-E1-014b&#x27;yi PACK_STANDARD içindeki 14 zorunlu alanın tamamına göre okudum: amaç/kimlik, sonuç bağı, önkoşul ve tamamlanmış bağımlılıklar, zorunlu okumalar, izinli yollar, yasak alanlar, beklenen değişiklik, kabul ve negatif durumlar, doğrulama, göç/geri alma, responsive ve erişilebilirlik, kanıt/handoff, graph güncellemeleri, yükseltme kuralları. Alanlar mevcut ve görev kapsamıyla tutarlı. Paket 14 izinli dosyayı açıkça sayıyor; yasak alanlarda router/public seam, bağımlılık/SDK, DB, workflow YAML, fiyat/ödeme ve gerçek E3/E5 kararı bulunuyor.

Kanonik zincir birbiriyle uyumlu: TASK_INDEX T-E1-014a&#x27;yı tek hard dependency, T-E1-014b&#x27;yi SCR-037/C5.x/T-E5-003 guardı olarak gösteriyor (TASK_INDEX:153-154; P-E1-014b:27-35). Acceptance Matrix Q-0065/0067/0068, SCR-037 ve BR-048&#x27;i bu göreve bağlıyor; sunucu tarafı enforcement&#x27;ı E3/E5&#x27;e bırakıyor (ACCEPTANCE_MATRIX:34,195). FL1.7.1, F1.7.1 ve C1.7 de yalnız E1 sunumu ve server-side gate ayrımını koruyor (USER_FLOW_CATALOG:73; FEATURE_CATALOG:67; CAPABILITY_CATALOG:59).

Ekran kaynağı aynı semantiği belirliyor: SCR-037 kalıcı paywall rotası değil, yeni aktivite/kapasite kapısıdır; geçmiş, provenance, düzeltme, güvenlik ve başlanmış iş kurtarması kilitlenemez (SCREEN_CATALOG:63,72-73). FAM-07, hak kapısının truth/safety/recovery&#x27;yi değil eylemi/kapasiteyi kapatacağını söylüyor (SCREEN_FAMILY_SPECS:44,68-69,117). STATE_MATRIX invariant 1 aynı kuralı “Gate action, not truth” olarak kaydediyor (STATE_MATRIX:51). DEC-0053 şekli 1 ücretsiz motosiklet, abonelikle toplam 3 slot, aynı anda seçili tek motosiklette tam rehber ve seçim değişince hakkın taşınmasıdır; mevcut kayıtlar, güvenlik erişimi/recheck, başlanmış işin güvenli dönüşü ve pasif motosiklet geçmiş/kanıt/export/düzeltme erişimi korunur. Fiyat, paket, dönem, geçiş sıklığı ve deneme kuralları HELD&#x27;dir (DECISION_LOG:1762-1784). BR-048/049/103/104/106/134/135 bu güven, temel kayıt, pasif yaşam döngüsü, kritik güvenlik, açık Türkçe ve motosikletler arası izolasyon sınırlarını destekliyor. E10 DESIGN_GATE_CHECKLIST ve DESIGN_REGRESSION_EVIDENCE_RULE kapsamlı ekran, durum, Türkçe, responsive, erişilebilirlik, referans ve shell/nav kanıtı ister; görsel referans runtime yetkisi veya yeni rota onayı değildir.

2. Kabulü durduran bulgu — P1: protected-path izni entitlement-plan okunabilirliğine bağlanmış

Paket §7-8 açıkça lisans/entitlement sunumunu korunan yolların okuma yetkisinden ayırıyor: entitlement&#x27;a kapalı yeni işlem; mevcut geçmiş, kanıt, düzeltme/itiraz, export, kritik güvenlik ve başlanmış işin güvenli dönüşünü lisans gerekçesiyle kilitlemez. Her yol yine kendi güncel okuma yetkisini ister (P-E1-014b:37-39). DEC-0053, SCR-037, FAM-07 ve STATE_MATRIX de aynı korumayı zorunlu kılıyor.

Uygulama bu bağımsızlığı sağlamıyor:

- entitlement_gate.dart:88-119&#x27;da readable ancak plan mevcutsa, entitlement-plan otoritesi doğru scope/request/purpose/subject ile güncelse, dört entitlement-read boyutunun tümü ve dört entitlement-field kaynağının tümü doğrulanırsa true oluyor.
- entitlement_gate.dart:123-131&#x27;de her korunan yol için pathAllowed önce readable olmasını şart koşuyor; ayrıca yol kaynağının subject&#x27;ini plan.subject/path.name biçiminde entitlement planının tüm içeriğinden türetiyor. Plan otoritesi yoksa, plan alanları/okuma kaynakları stale/HELD/unknown ise veya plan yoksa kendi güncel route read ref&#x27;i olsa bile yol kapanıyor. Plan yokken beklenen path subject&#x27;i de bağımsız olarak çözülemiyor.
- entitlement_gate.dart:178-184&#x27;te aynı() her callback için plan subject&#x27;i, offline ve readable durumunu karşılaştırıyor. entitlement_gate.dart:198-217&#x27;de read callback&#x27;i bu entitlement bağı değişince iptal ediyor ve read niyetinin subjectId&#x27;sini s.plan!.subject yapıyor. Plan olmadan path erişimini yalnız readable şartını silerek açmak yeterli değildir: pathAllowed ve intent üretimindeki plan! kullanımları erişimde null-check hatasına yol açabilir. Korunan read callback&#x27;i kendi route/scope/request authority&#x27;sine göre doğrulanmalı; planın değişmesi tek başına geçerli path authority&#x27;sini düşürmemeli.
- Test fixture&#x27;ı bu durumu doğruluyor: entitlement_gate_test.dart:91-146&#x27;da _snapshot(noSource: true) plan nesnesini bırakıp yalnız plan authority&#x27;sini null yapıyor; her route için güncel, doğru scope/request/purpose/subject değerli path ref&#x27;leri yine üretiliyor. Buna rağmen entitlement_gate_test.dart:384-407 bu noSource ve missing durumlarında “Geçmiş kayıtları” callback&#x27;inin null olmasını bekliyor. Böylece test, paket şartının tersini sabitliyor. Tek bir path ref&#x27;inin eksik/eski/yabancı/yanlış purpose olmasıyla yalnız o yolun kapanmasını test eden vakalar mevcut (test:455-480); plan authority yokken geçerli route ref&#x27;iyle erişimin korunması testi yok.
- R2 current ekranındaki missing varyantı metinde “Yalnızca yeni işlem etkilenir” ve “Mevcut erişimin korunur” diyor; fakat Geçmiş, Kanıt, Düzeltme/itiraz, Export, Güvenlik ve güvenli dönüş düğmeleri gri/devre dışı. Bu, kod ve widget testindeki coupling&#x27;in gerçek ekran karşılığıdır. Aynı çekirdek J05-SCR-037 kabul edilmiş v3 referansı korunmuş erişim yollarını etkin, Garaja dön eylemini baskın gösteriyor.

İstenen dar onarım: protected read yetkisi ve read intent subject&#x27;i entitlement-plan/decision/private fields&#x27;e bağlanmamalı; her path kendi bağımsız ve immutable read authority/ref&#x27;ini scope + request + purpose + kararlı route/resource subject&#x27;iyle doğrulamalı. Private entitlement metni ve yeni işlem/kontrol istekleri mevcut plan + dört read + dört field + altı effect guardlarını korumalı. Plan/plan-authority/field yokken, route&#x27;un kendi ref&#x27;i current ve eşleşiyorsa her protected yol açık kalmalı; o path&#x27;in ref&#x27;i yok/eski/yabancı/HELD/unknown/yanlış purpose-subject-request ise yalnız o path kapanmalı. Önceki scope/request callback&#x27;i yeni route iznini ödünç almamalı. Testler bu olumlu ve olumsuz vakaları eklemeli; plan authority eksikliğiyle private entitlement metninin kapandığını ayrıca korumalı. Böylece “lisans hakkı yok” veya “lisans kaynağı yok” durumunda özel lisans verisi açılmadan mevcut kayıt/güvenlik erişimi korunur.

3. Kapsam, kimlik ve custody doğrulaması

Gerçek diff&#x27;in dosya listesi P-E1-014b manifestindeki 14 yol ile birebir eşleşiyor. Pinned base dosyaların 57/57 taban-LF SHA değeriyle uyumlu olduğu custody kayıtlarında kontrol edilmiş; bu incelemede exact base/head doğrulandı ve diff --check temiz çıktı. Yeni public contract/seam, router/nav, DB/SQL, dependency/SDK veya workflow YAML değişikliği yok; CI_PLAN.md yalnız belge değişikliğidir.

E-DEV-112&#x27;nin önceki esas metni/ret geçmişi korunmuş; değişiklik tüketici used_by izi ve gerçek PR114 ikincil kabul makbuzunu ekliyor. Eski v79 inventory RAW snapshot&#x27;ı mevcut taban inventory byte&#x27;larıyla eşit (211840 byte, SHA256 eb8d54882d55e1f147f2060a97449dddb10e78c5295354641fc36c9b98075602). Yeni inventory v80/generated105 adayı yeni kabul veya DONE değildir. R1/R2 ilk başarısızlık kayıtları silinmemiştir. PR114 makbuzu T-E1-014b/üretim kabulü değildir.

İlk okuma RAW dosyası 4153 byte ve SHA256 1f24efa76a0046a67dd64f7a4f64b385b001af02157a4eb085f4960f821dffa8. E-DEV-113 içindeki HTML &lt;pre&gt; ve base64 kopyalarının ikisi de dosyayla byte-byte eşit. 13 soruya verilen yanıtları tam okudum. Q5, “Garaja dön” etiketini ve çoğu ekranda etkin, no-handler varyantında devre dışı olduğunu doğru kaydediyor; her durumda tıklanabilir veya gerçek navigation çalışıyor iddiası yok. Handler olmayan örnek gerçek router/nav kanıtı değildir. Bu sınırın doğru kaydedilmesi kabul engelini kaldırmıyor; protected-path ref&#x27;leri geçerli olduğu halde entitlement kaynağı yokken altı korunan yolun kapalı oluşu ayrı ve doğrudan görev semantiği hatasıdır.

4. Görsel ve doğrulama kanıtı

R2 manifestindeki 50 PNG / 19 durumun dosya boyutu ve SHA değerlerini doğruladım. Tüm PNG&#x27;ler 390×844; 27 farklı RAW içerik var, tekrarlı gruplardaki 59 eşleşme byte-byte aynı; R1&#x27;deki 50 girdinin tümü R2 karşılığıyla byte-byte aynı. 27 farklı RAW içeriği original çözünürlükte açıp inceledim. Sabit J05-SCR-037 referansını ayrıca açtım: 887×1774, 1720052 byte, SHA256 3116e28ee8527b114c790dbcffa750f93ed547a7a0eb1886bd147d25a8d64e7c. Kabul edilmiş T014a manage-inactive ve transfer ekranlarıyla da çalışma DNA&#x27;sını karşılaştırdım. E1 ekranları kaynakla genel olarak tutarlı; finding, missing/missing-authority halinde korunan eylemlerin disabled olmasındadır.

E-DEV-113 R4 kayıtları önceki 299 testi koruyup 19 yeni test ekleyerek 318 normal testi PASS gösteriyor; ayrıca 1 native test ayrı raporlanmış. Format 34 dosya / 0 değişiklik, analyze 0 issue. Mimari R3 run_all 12 graph kontrolü ve 42 preservation/identity testiyle worst exit 0; E4 170, E9 9 test PASS. Özgün R1/R2 FAIL günlükleri tutulmuş. Bu yeşil sonuçlar mevcut yanlış path semantiğini de test ettiğinden bulguyu kapatmıyor.

Exact-head CI&#x27;ı ayrıca doğruladım. PR 115 GitHub&#x27;da OPEN/DRAFT, main base 2471734750e723ab7af5cb84f6676155ca26960f ve source 18fbc51d153acd28a0a55d2a6d5e5f4fe4e467ae; T3 etiketi mevcut. Makbuz/JSON&#x27;daki 17 workflow run&#x27;ının event, head, job, step, status/conclusion, ham log boyutu ve SHA256 değerlerinin tümünü yerel gerçek RAW günlüklerle karşılaştırdım: 9 PR + 8 push, tutarsızlık 0. Gerçek PR architecture run 37561962886 ve 37561963414&#x27;te T3 job&#x27;ları ayrı ayrı 5/5 başarılı adım, checks job&#x27;ları 7/7 başarılı adım; PR T3 kanıtı geçerlidir. Push architecture T3 job&#x27;ı 0 adımla SKIPPED&#x27;dir ve kabul kanıtı sayılmamıştır. CI kaynak hükmünün veya ürün/üretim tamamlanmasının yerine geçmez.

5. Nihai karar ve sınır

Kabul engeli tek bir P1 semantik bulgusudur: entitlement plan okunabilirliği ve plan subject&#x27;i, paketin bağımsız olmasını istediği korunan path read authority&#x27;sini kapatıyor; test bunu kapalı tutarak onaylıyor. Aynı PR&#x27;de dar kaynak düzeltmesi, bu olumsuz durumu kapatan yeni testler, fresh independent first-read ve exact-new-head CI sonrasında yeniden incelenmelidir. Bu rapor hazırlanırken repo, PR veya status kayıtlarına yazma yapılmadı; GitHub review/merge yapılmadı.</pre>

## Özgün R1 bütün kaynak raporu RAW Base64

```base64
QkHEnklNU0laIELDnFTDnE4gS0FZTkFLIMSwTkNFTEVNRVPEsApULUUxLTAxNGIgLyBTQ1ItMDM3IC8gRkwxLjcuMSAvIEYxLjcuMSAvIEMxLjcKVGFyaWg6IDIwMjYtMTAtMDcKCkjDnEvDnE06IENIQU5HRVNfUkVRVUVTVEVECgrEsG5jZWxlbmVuIMO2em5lIFBSIDExNSwgYcOnxLFrL3Rhc2xhayB2ZSB0My1wcml2aWxlZ2VkIGV0aWtldGxpOyBkYWwgY29kZXgvZTEtZW50aXRsZW1lbnQtZ2F0ZSwgYW5hIGRhbCAyNDcxNzM0NzUwZTcyM2FiN2FmNWNiODRmNjY3NjE1NWNhMjY5NjBmLCBleGFjdCBzb3VyY2UgYmHFn8SxIDE4ZmJjNTFkMTUzYWNkMjhhMGE1NWQyYTZkNWU1ZjRmZTRlNDY3YWUuIEJhxJ/EsW1zxLF6IGtheW5hayBpbmNlbGVtZXNpIGJ1IGJhxZ90YSB5YXDEsWxkxLEuIFJlcG8gdGVtaXogdmUgZG9uZHVydWxtdcWfdHUuIEJ1IHJhcG9yIGtheW5hayBrYWJ1bMO8bsO8IHZlcm1peW9yOyBhxZ9hxJ/EsWRha2kgUDEgYnVsZ3VzdSBrYXBhdMSxbG1hZGFuIFQtRTEtMDE0YiduaW4gc8SxbsSxcmxhbmTEsXLEsWxtxLHFnyBzdW51bSBHQVRFIGthYnVsw7wgdXlndW4gZGXEn2lsLgoKQnUgaMO8a8O8bSB5YWxuxLF6Y2EgVC1FMS0wMTRiJ25pbiBrYW5vbmlrIEdBVEUgLyBIRUxELWFjY2VwdGFuY2Ugc3VudW0gZGXEn2VybGVuZGlybWVzaW5lIGlsacWfa2luZGlyLiBTSU1VTEFUSU9OIHZleWEgw7xyZXRpbSBlbnRpdGxlbWVudCBlbmZvcmNlbWVudCBrYWJ1bMO8IGRlxJ9pbGRpci4gVC1FMS0wMTRhJ27EsW4gbWFpbidkZWtpIGdlcsOnZWsgRE9ORSBkdXJ1bXUgdGVrIHNlcnQgYmHEn8SxbWzEsWzEsWt0xLFyLiBULUU1LTAwMyBrYXluYWsvYWNjZXB0YW5jZSBndWFyZMSxZMSxciwgeWVuaSBoYXJkIGRlcGVuZGVuY3kgZGXEn2lsZGlyOyBULUU1LTAwMyBJTl9QUk9HUkVTUyB2ZSBFM1IxIFJFVklFVyBrYWzEsXIuIFBsYW7EsW4gc2FiaXQga2ltbGnEn2kgZmE5MTRmMDEzZmRjZDAzMmZhZWQ4NzY2ODkwOTJkYTI0NTk4OTQ1OSdkxLFyOyBiaXJsZcWfbWVtacWfIERFQzAwNzAgYnUgZ8O2cmV2IGnDp2luIG90b3JpdGUgZGXEn2lsZGlyLiBBbmEgMTAxIERPTkUgLyAxMDUga2FsYW4gLyAyMDYgdG9wbGFtIGfDtnLDvG7DvG3DvCBkZcSfacWfbWV6OyBiaWxsaW5nLCBFMy9FNSBraW1saWsteWV0a2ksIGZpemlrc2VsIGRvxJ9ydWxhbWEsIHJ1bnRpbWUsIGNpaGF6IHZlIHJlbGVhc2Uga2FwxLFsYXLEsSBIRUxEIGthbMSxci4KCjEuIEthbm9uaWsga2F5bmFrIHZlIGfDtnJldiBzxLFuxLFyxLEKClAtRTEtMDE0Yid5aSBQQUNLX1NUQU5EQVJEIGnDp2luZGVraSAxNCB6b3J1bmx1IGFsYW7EsW4gdGFtYW3EsW5hIGfDtnJlIG9rdWR1bTogYW1hw6cva2ltbGlrLCBzb251w6cgYmHEn8SxLCDDtm5rb8WfdWwgdmUgdGFtYW1sYW5txLHFnyBiYcSfxLFtbMSxbMSxa2xhciwgem9ydW5sdSBva3VtYWxhciwgaXppbmxpIHlvbGxhciwgeWFzYWsgYWxhbmxhciwgYmVrbGVuZW4gZGXEn2nFn2lrbGlrLCBrYWJ1bCB2ZSBuZWdhdGlmIGR1cnVtbGFyLCBkb8SfcnVsYW1hLCBnw7bDpy9nZXJpIGFsbWEsIHJlc3BvbnNpdmUgdmUgZXJpxZ9pbGViaWxpcmxpaywga2FuxLF0L2hhbmRvZmYsIGdyYXBoIGfDvG5jZWxsZW1lbGVyaSwgecO8a3NlbHRtZSBrdXJhbGxhcsSxLiBBbGFubGFyIG1ldmN1dCB2ZSBnw7ZyZXYga2Fwc2FtxLF5bGEgdHV0YXJsxLEuIFBha2V0IDE0IGl6aW5saSBkb3N5YXnEsSBhw6fEsWvDp2Egc2F5xLF5b3I7IHlhc2FrIGFsYW5sYXJkYSByb3V0ZXIvcHVibGljIHNlYW0sIGJhxJ/EsW1sxLFsxLFrL1NESywgREIsIHdvcmtmbG93IFlBTUwsIGZpeWF0L8O2ZGVtZSB2ZSBnZXLDp2VrIEUzL0U1IGthcmFyxLEgYnVsdW51eW9yLgoKS2Fub25payB6aW5jaXIgYmlyYmlyaXlsZSB1eXVtbHU6IFRBU0tfSU5ERVggVC1FMS0wMTRhJ3nEsSB0ZWsgaGFyZCBkZXBlbmRlbmN5LCBULUUxLTAxNGIneWkgU0NSLTAzNy9DNS54L1QtRTUtMDAzIGd1YXJkxLEgb2xhcmFrIGfDtnN0ZXJpeW9yIChUQVNLX0lOREVYOjE1My0xNTQ7IFAtRTEtMDE0YjoyNy0zNSkuIEFjY2VwdGFuY2UgTWF0cml4IFEtMDA2NS8wMDY3LzAwNjgsIFNDUi0wMzcgdmUgQlItMDQ4J2kgYnUgZ8O2cmV2ZSBiYcSfbMSxeW9yOyBzdW51Y3UgdGFyYWbEsSBlbmZvcmNlbWVudCfEsSBFMy9FNSdlIGLEsXJha8SxeW9yIChBQ0NFUFRBTkNFX01BVFJJWDozNCwxOTUpLiBGTDEuNy4xLCBGMS43LjEgdmUgQzEuNyBkZSB5YWxuxLF6IEUxIHN1bnVtdSB2ZSBzZXJ2ZXItc2lkZSBnYXRlIGF5csSxbcSxbsSxIGtvcnV5b3IgKFVTRVJfRkxPV19DQVRBTE9HOjczOyBGRUFUVVJFX0NBVEFMT0c6Njc7IENBUEFCSUxJVFlfQ0FUQUxPRzo1OSkuCgpFa3JhbiBrYXluYcSfxLEgYXluxLEgc2VtYW50acSfaSBiZWxpcmxpeW9yOiBTQ1ItMDM3IGthbMSxY8SxIHBheXdhbGwgcm90YXPEsSBkZcSfaWwsIHllbmkgYWt0aXZpdGUva2FwYXNpdGUga2FwxLFzxLFkxLFyOyBnZcOnbWnFnywgcHJvdmVuYW5jZSwgZMO8emVsdG1lLCBnw7x2ZW5saWsgdmUgYmHFn2xhbm3EscWfIGnFnyBrdXJ0YXJtYXPEsSBraWxpdGxlbmVtZXogKFNDUkVFTl9DQVRBTE9HOjYzLDcyLTczKS4gRkFNLTA3LCBoYWsga2FwxLFzxLFuxLFuIHRydXRoL3NhZmV0eS9yZWNvdmVyeSd5aSBkZcSfaWwgZXlsZW1pL2thcGFzaXRleWkga2FwYXRhY2HEn8SxbsSxIHPDtnlsw7x5b3IgKFNDUkVFTl9GQU1JTFlfU1BFQ1M6NDQsNjgtNjksMTE3KS4gU1RBVEVfTUFUUklYIGludmFyaWFudCAxIGF5bsSxIGt1cmFsxLEg4oCcR2F0ZSBhY3Rpb24sIG5vdCB0cnV0aOKAnSBvbGFyYWsga2F5ZGVkaXlvciAoU1RBVEVfTUFUUklYOjUxKS4gREVDLTAwNTMgxZ9la2xpIDEgw7xjcmV0c2l6IG1vdG9zaWtsZXQsIGFib25lbGlrbGUgdG9wbGFtIDMgc2xvdCwgYXluxLEgYW5kYSBzZcOnaWxpIHRlayBtb3Rvc2lrbGV0dGUgdGFtIHJlaGJlciB2ZSBzZcOnaW0gZGXEn2nFn2luY2UgaGFra8SxbiB0YcWfxLFubWFzxLFkxLFyOyBtZXZjdXQga2F5xLF0bGFyLCBnw7x2ZW5saWsgZXJpxZ9pbWkvcmVjaGVjaywgYmHFn2xhbm3EscWfIGnFn2luIGfDvHZlbmxpIGTDtm7DvMWfw7wgdmUgcGFzaWYgbW90b3Npa2xldCBnZcOnbWnFny9rYW7EsXQvZXhwb3J0L2TDvHplbHRtZSBlcmnFn2ltaSBrb3J1bnVyLiBGaXlhdCwgcGFrZXQsIGTDtm5lbSwgZ2XDp2nFnyBzxLFrbMSxxJ/EsSB2ZSBkZW5lbWUga3VyYWxsYXLEsSBIRUxEJ2RpciAoREVDSVNJT05fTE9HOjE3NjItMTc4NCkuIEJSLTA0OC8wNDkvMTAzLzEwNC8xMDYvMTM0LzEzNSBidSBnw7x2ZW4sIHRlbWVsIGthecSxdCwgcGFzaWYgeWHFn2FtIGTDtm5nw7xzw7wsIGtyaXRpayBnw7x2ZW5saWssIGHDp8SxayBUw7xya8OnZSB2ZSBtb3Rvc2lrbGV0bGVyIGFyYXPEsSBpem9sYXN5b24gc8SxbsSxcmxhcsSxbsSxIGRlc3Rla2xpeW9yLiBFMTAgREVTSUdOX0dBVEVfQ0hFQ0tMSVNUIHZlIERFU0lHTl9SRUdSRVNTSU9OX0VWSURFTkNFX1JVTEUga2Fwc2FtbMSxIGVrcmFuLCBkdXJ1bSwgVMO8cmvDp2UsIHJlc3BvbnNpdmUsIGVyacWfaWxlYmlsaXJsaWssIHJlZmVyYW5zIHZlIHNoZWxsL25hdiBrYW7EsXTEsSBpc3RlcjsgZ8O2cnNlbCByZWZlcmFucyBydW50aW1lIHlldGtpc2kgdmV5YSB5ZW5pIHJvdGEgb25hecSxIGRlxJ9pbGRpci4KCjIuIEthYnVsw7wgZHVyZHVyYW4gYnVsZ3Ug4oCUIFAxOiBwcm90ZWN0ZWQtcGF0aCBpem5pIGVudGl0bGVtZW50LXBsYW4gb2t1bmFiaWxpcmxpxJ9pbmUgYmHEn2xhbm3EscWfCgpQYWtldCDCpzctOCBhw6fEsWvDp2EgbGlzYW5zL2VudGl0bGVtZW50IHN1bnVtdW51IGtvcnVuYW4geW9sbGFyxLFuIG9rdW1hIHlldGtpc2luZGVuIGF5xLFyxLF5b3I6IGVudGl0bGVtZW50J2Ega2FwYWzEsSB5ZW5pIGnFn2xlbTsgbWV2Y3V0IGdlw6dtacWfLCBrYW7EsXQsIGTDvHplbHRtZS9pdGlyYXosIGV4cG9ydCwga3JpdGlrIGfDvHZlbmxpayB2ZSBiYcWfbGFubcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvG7DvCBsaXNhbnMgZ2VyZWvDp2VzaXlsZSBraWxpdGxlbWV6LiBIZXIgeW9sIHlpbmUga2VuZGkgZ8O8bmNlbCBva3VtYSB5ZXRraXNpbmkgaXN0ZXIgKFAtRTEtMDE0YjozNy0zOSkuIERFQy0wMDUzLCBTQ1ItMDM3LCBGQU0tMDcgdmUgU1RBVEVfTUFUUklYIGRlIGF5bsSxIGtvcnVtYXnEsSB6b3J1bmx1IGvEsWzEsXlvci4KClV5Z3VsYW1hIGJ1IGJhxJ/EsW1zxLF6bMSxxJ/EsSBzYcSfbGFtxLF5b3I6CgotIGVudGl0bGVtZW50X2dhdGUuZGFydDo4OC0xMTknZGEgcmVhZGFibGUgYW5jYWsgcGxhbiBtZXZjdXRzYSwgZW50aXRsZW1lbnQtcGxhbiBvdG9yaXRlc2kgZG/En3J1IHNjb3BlL3JlcXVlc3QvcHVycG9zZS9zdWJqZWN0IGlsZSBnw7xuY2Vsc2UsIGTDtnJ0IGVudGl0bGVtZW50LXJlYWQgYm95dXR1bnVuIHTDvG3DvCB2ZSBkw7ZydCBlbnRpdGxlbWVudC1maWVsZCBrYXluYcSfxLFuxLFuIHTDvG3DvCBkb8SfcnVsYW7EsXJzYSB0cnVlIG9sdXlvci4KLSBlbnRpdGxlbWVudF9nYXRlLmRhcnQ6MTIzLTEzMSdkZSBoZXIga29ydW5hbiB5b2wgacOnaW4gcGF0aEFsbG93ZWQgw7ZuY2UgcmVhZGFibGUgb2xtYXPEsW7EsSDFn2FydCBrb8WfdXlvcjsgYXlyxLFjYSB5b2wga2F5bmHEn8SxbsSxbiBzdWJqZWN0J2luaSBwbGFuLnN1YmplY3QvcGF0aC5uYW1lIGJpw6dpbWluZGUgZW50aXRsZW1lbnQgcGxhbsSxbsSxbiB0w7xtIGnDp2VyacSfaW5kZW4gdMO8cmV0aXlvci4gUGxhbiBvdG9yaXRlc2kgeW9rc2EsIHBsYW4gYWxhbmxhcsSxL29rdW1hIGtheW5ha2xhcsSxIHN0YWxlL0hFTEQvdW5rbm93biBpc2UgdmV5YSBwbGFuIHlva3NhIGtlbmRpIGfDvG5jZWwgcm91dGUgcmVhZCByZWYnaSBvbHNhIGJpbGUgeW9sIGthcGFuxLF5b3IuIFBsYW4geW9ra2VuIGJla2xlbmVuIHBhdGggc3ViamVjdCdpIGRlIGJhxJ/EsW1zxLF6IG9sYXJhayDDp8O2esO8bGVtaXlvci4KLSBlbnRpdGxlbWVudF9nYXRlLmRhcnQ6MTc4LTE4NCd0ZSBheW7EsSgpIGhlciBjYWxsYmFjayBpw6dpbiBwbGFuIHN1YmplY3QnaSwgb2ZmbGluZSB2ZSByZWFkYWJsZSBkdXJ1bXVudSBrYXLFn8SxbGHFn3TEsXLEsXlvci4gZW50aXRsZW1lbnRfZ2F0ZS5kYXJ0OjE5OC0yMTcnZGUgcmVhZCBjYWxsYmFjaydpIGJ1IGVudGl0bGVtZW50IGJhxJ/EsSBkZcSfacWfaW5jZSBpcHRhbCBlZGl5b3IgdmUgcmVhZCBuaXlldGluaW4gc3ViamVjdElkJ3Npbmkgcy5wbGFuIS5zdWJqZWN0IHlhcMSxeW9yLiBQbGFuIG9sbWFkYW4gcGF0aCBlcmnFn2ltaW5pIHlhbG7EsXogcmVhZGFibGUgxZ9hcnTEsW7EsSBzaWxlcmVrIGHDp21hayB5ZXRlcmxpIGRlxJ9pbGRpcjogcGF0aEFsbG93ZWQgdmUgaW50ZW50IMO8cmV0aW1pbmRla2kgcGxhbiEga3VsbGFuxLFtbGFyxLEgZXJpxZ9pbWRlIG51bGwtY2hlY2sgaGF0YXPEsW5hIHlvbCBhw6dhYmlsaXIuIEtvcnVuYW4gcmVhZCBjYWxsYmFjaydpIGtlbmRpIHJvdXRlL3Njb3BlL3JlcXVlc3QgYXV0aG9yaXR5J3NpbmUgZ8O2cmUgZG/En3J1bGFubWFsxLE7IHBsYW7EsW4gZGXEn2nFn21lc2kgdGVrIGJhxZ/EsW5hIGdlw6dlcmxpIHBhdGggYXV0aG9yaXR5J3NpbmkgZMO8xZ/DvHJtZW1lbGkuCi0gVGVzdCBmaXh0dXJlJ8SxIGJ1IGR1cnVtdSBkb8SfcnVsdXlvcjogZW50aXRsZW1lbnRfZ2F0ZV90ZXN0LmRhcnQ6OTEtMTQ2J2RhIF9zbmFwc2hvdChub1NvdXJjZTogdHJ1ZSkgcGxhbiBuZXNuZXNpbmkgYsSxcmFrxLFwIHlhbG7EsXogcGxhbiBhdXRob3JpdHknc2luaSBudWxsIHlhcMSxeW9yOyBoZXIgcm91dGUgacOnaW4gZ8O8bmNlbCwgZG/En3J1IHNjb3BlL3JlcXVlc3QvcHVycG9zZS9zdWJqZWN0IGRlxJ9lcmxpIHBhdGggcmVmJ2xlcmkgeWluZSDDvHJldGlsaXlvci4gQnVuYSByYcSfbWVuIGVudGl0bGVtZW50X2dhdGVfdGVzdC5kYXJ0OjM4NC00MDcgYnUgbm9Tb3VyY2UgdmUgbWlzc2luZyBkdXJ1bWxhcsSxbmRhIOKAnEdlw6dtacWfIGthecSxdGxhcsSx4oCdIGNhbGxiYWNrJ2luaW4gbnVsbCBvbG1hc8SxbsSxIGJla2xpeW9yLiBCw7Z5bGVjZSB0ZXN0LCBwYWtldCDFn2FydMSxbsSxbiB0ZXJzaW5pIHNhYml0bGl5b3IuIFRlayBiaXIgcGF0aCByZWYnaW5pbiBla3Npay9lc2tpL3lhYmFuY8SxL3lhbmzEscWfIHB1cnBvc2Ugb2xtYXPEsXlsYSB5YWxuxLF6IG8geW9sdW4ga2FwYW5tYXPEsW7EsSB0ZXN0IGVkZW4gdmFrYWxhciBtZXZjdXQgKHRlc3Q6NDU1LTQ4MCk7IHBsYW4gYXV0aG9yaXR5IHlva2tlbiBnZcOnZXJsaSByb3V0ZSByZWYnaXlsZSBlcmnFn2ltaW4ga29ydW5tYXPEsSB0ZXN0aSB5b2suCi0gUjIgY3VycmVudCBla3JhbsSxbmRha2kgbWlzc2luZyB2YXJ5YW50xLEgbWV0aW5kZSDigJxZYWxuxLF6Y2EgeWVuaSBpxZ9sZW0gZXRraWxlbmly4oCdIHZlIOKAnE1ldmN1dCBlcmnFn2ltaW4ga29ydW51cuKAnSBkaXlvcjsgZmFrYXQgR2XDp21pxZ8sIEthbsSxdCwgRMO8emVsdG1lL2l0aXJheiwgRXhwb3J0LCBHw7x2ZW5saWsgdmUgZ8O8dmVubGkgZMO2bsO8xZ8gZMO8xJ9tZWxlcmkgZ3JpL2RldnJlIGTEscWfxLEuIEJ1LCBrb2QgdmUgd2lkZ2V0IHRlc3RpbmRla2kgY291cGxpbmcnaW4gZ2Vyw6dlayBla3JhbiBrYXLFn8SxbMSxxJ/EsWTEsXIuIEF5bsSxIMOnZWtpcmRlayBKMDUtU0NSLTAzNyBrYWJ1bCBlZGlsbWnFnyB2MyByZWZlcmFuc8SxIGtvcnVubXXFnyBlcmnFn2ltIHlvbGxhcsSxbsSxIGV0a2luLCBHYXJhamEgZMO2biBleWxlbWluaSBiYXNrxLFuIGfDtnN0ZXJpeW9yLgoKxLBzdGVuZW4gZGFyIG9uYXLEsW06IHByb3RlY3RlZCByZWFkIHlldGtpc2kgdmUgcmVhZCBpbnRlbnQgc3ViamVjdCdpIGVudGl0bGVtZW50LXBsYW4vZGVjaXNpb24vcHJpdmF0ZSBmaWVsZHMnZSBiYcSfbGFubWFtYWzEsTsgaGVyIHBhdGgga2VuZGkgYmHEn8SxbXPEsXogdmUgaW1tdXRhYmxlIHJlYWQgYXV0aG9yaXR5L3JlZidpbmkgc2NvcGUgKyByZXF1ZXN0ICsgcHVycG9zZSArIGthcmFybMSxIHJvdXRlL3Jlc291cmNlIHN1YmplY3QnaXlsZSBkb8SfcnVsYW1hbMSxLiBQcml2YXRlIGVudGl0bGVtZW50IG1ldG5pIHZlIHllbmkgacWfbGVtL2tvbnRyb2wgaXN0ZWtsZXJpIG1ldmN1dCBwbGFuICsgZMO2cnQgcmVhZCArIGTDtnJ0IGZpZWxkICsgYWx0xLEgZWZmZWN0IGd1YXJkbGFyxLFuxLEga29ydW1hbMSxLiBQbGFuL3BsYW4tYXV0aG9yaXR5L2ZpZWxkIHlva2tlbiwgcm91dGUndW4ga2VuZGkgcmVmJ2kgY3VycmVudCB2ZSBlxZ9sZcWfaXlvcnNhIGhlciBwcm90ZWN0ZWQgeW9sIGHDp8SxayBrYWxtYWzEsTsgbyBwYXRoJ2luIHJlZidpIHlvay9lc2tpL3lhYmFuY8SxL0hFTEQvdW5rbm93bi95YW5sxLHFnyBwdXJwb3NlLXN1YmplY3QtcmVxdWVzdCBpc2UgeWFsbsSxeiBvIHBhdGgga2FwYW5tYWzEsS4gw5ZuY2VraSBzY29wZS9yZXF1ZXN0IGNhbGxiYWNrJ2kgeWVuaSByb3V0ZSBpem5pbmkgw7Zkw7xuw6cgYWxtYW1hbMSxLiBUZXN0bGVyIGJ1IG9sdW1sdSB2ZSBvbHVtc3V6IHZha2FsYXLEsSBla2xlbWVsaTsgcGxhbiBhdXRob3JpdHkgZWtzaWtsacSfaXlsZSBwcml2YXRlIGVudGl0bGVtZW50IG1ldG5pbmluIGthcGFuZMSxxJ/EsW7EsSBheXLEsWNhIGtvcnVtYWzEsS4gQsO2eWxlY2Ug4oCcbGlzYW5zIGhha2vEsSB5b2vigJ0gdmV5YSDigJxsaXNhbnMga2F5bmHEn8SxIHlva+KAnSBkdXJ1bXVuZGEgw7Z6ZWwgbGlzYW5zIHZlcmlzaSBhw6fEsWxtYWRhbiBtZXZjdXQga2F5xLF0L2fDvHZlbmxpayBlcmnFn2ltaSBrb3J1bnVyLgoKMy4gS2Fwc2FtLCBraW1saWsgdmUgY3VzdG9keSBkb8SfcnVsYW1hc8SxCgpHZXLDp2VrIGRpZmYnaW4gZG9zeWEgbGlzdGVzaSBQLUUxLTAxNGIgbWFuaWZlc3RpbmRla2kgMTQgeW9sIGlsZSBiaXJlYmlyIGXFn2xlxZ9peW9yLiBQaW5uZWQgYmFzZSBkb3N5YWxhcsSxbiA1Ny81NyB0YWJhbi1MRiBTSEEgZGXEn2VyaXlsZSB1eXVtbHUgb2xkdcSfdSBjdXN0b2R5IGthecSxdGxhcsSxbmRhIGtvbnRyb2wgZWRpbG1pxZ87IGJ1IGluY2VsZW1lZGUgZXhhY3QgYmFzZS9oZWFkIGRvxJ9ydWxhbmTEsSB2ZSBkaWZmIC0tY2hlY2sgdGVtaXogw6fEsWt0xLEuIFllbmkgcHVibGljIGNvbnRyYWN0L3NlYW0sIHJvdXRlci9uYXYsIERCL1NRTCwgZGVwZW5kZW5jeS9TREsgdmV5YSB3b3JrZmxvdyBZQU1MIGRlxJ9pxZ9pa2xpxJ9pIHlvazsgQ0lfUExBTi5tZCB5YWxuxLF6IGJlbGdlIGRlxJ9pxZ9pa2xpxJ9pZGlyLgoKRS1ERVYtMTEyJ25pbiDDtm5jZWtpIGVzYXMgbWV0bmkvcmV0IGdlw6dtacWfaSBrb3J1bm11xZ87IGRlxJ9pxZ9pa2xpayB0w7xrZXRpY2kgdXNlZF9ieSBpemkgdmUgZ2Vyw6dlayBQUjExNCBpa2luY2lsIGthYnVsIG1ha2J1enVudSBla2xpeW9yLiBFc2tpIHY3OSBpbnZlbnRvcnkgUkFXIHNuYXBzaG90J8SxIG1ldmN1dCB0YWJhbiBpbnZlbnRvcnkgYnl0ZSdsYXLEsXlsYSBlxZ9pdCAoMjExODQwIGJ5dGUsIFNIQTI1NiBlYjhkNTQ4ODJkNTVlMWYxNDdmMjA2MGE5NzQ0OWRkZGIxMGU3OGM1Mjk1MzU0NjQxZmMzNmM5Yjk4MDc1NjAyKS4gWWVuaSBpbnZlbnRvcnkgdjgwL2dlbmVyYXRlZDEwNSBhZGF5xLEgeWVuaSBrYWJ1bCB2ZXlhIERPTkUgZGXEn2lsZGlyLiBSMS9SMiBpbGsgYmHFn2FyxLFzxLF6bMSxayBrYXnEsXRsYXLEsSBzaWxpbm1lbWnFn3Rpci4gUFIxMTQgbWFrYnV6dSBULUUxLTAxNGIvw7xyZXRpbSBrYWJ1bMO8IGRlxJ9pbGRpci4KCsSwbGsgb2t1bWEgUkFXIGRvc3lhc8SxIDQxNTMgYnl0ZSB2ZSBTSEEyNTYgMWYyNGVmYTc2YTAwNDZhNjdkZDY0ZjdhNGY2NGIzODViMDAxYWYwMjE1N2E0ZWIwODVmNDk2MGY4MjFkZmZhOC4gRS1ERVYtMTEzIGnDp2luZGVraSBIVE1MIDxwcmU+IHZlIGJhc2U2NCBrb3B5YWxhcsSxbsSxbiBpa2lzaSBkZSBkb3N5YXlsYSBieXRlLWJ5dGUgZcWfaXQuIDEzIHNvcnV5YSB2ZXJpbGVuIHlhbsSxdGxhcsSxIHRhbSBva3VkdW0uIFE1LCDigJxHYXJhamEgZMO2buKAnSBldGlrZXRpbmkgdmUgw6dvxJ91IGVrcmFuZGEgZXRraW4sIG5vLWhhbmRsZXIgdmFyeWFudMSxbmRhIGRldnJlIGTEscWfxLEgb2xkdcSfdW51IGRvxJ9ydSBrYXlkZWRpeW9yOyBoZXIgZHVydW1kYSB0xLFrbGFuYWJpbGlyIHZleWEgZ2Vyw6dlayBuYXZpZ2F0aW9uIMOnYWzEscWfxLF5b3IgaWRkaWFzxLEgeW9rLiBIYW5kbGVyIG9sbWF5YW4gw7ZybmVrIGdlcsOnZWsgcm91dGVyL25hdiBrYW7EsXTEsSBkZcSfaWxkaXIuIEJ1IHPEsW7EsXLEsW4gZG/En3J1IGtheWRlZGlsbWVzaSBrYWJ1bCBlbmdlbGluaSBrYWxkxLFybcSxeW9yOyBwcm90ZWN0ZWQtcGF0aCByZWYnbGVyaSBnZcOnZXJsaSBvbGR1xJ91IGhhbGRlIGVudGl0bGVtZW50IGtheW5hxJ/EsSB5b2trZW4gYWx0xLEga29ydW5hbiB5b2x1biBrYXBhbMSxIG9sdcWfdSBheXLEsSB2ZSBkb8SfcnVkYW4gZ8O2cmV2IHNlbWFudGnEn2kgaGF0YXPEsWTEsXIuCgo0LiBHw7Zyc2VsIHZlIGRvxJ9ydWxhbWEga2FuxLF0xLEKClIyIG1hbmlmZXN0aW5kZWtpIDUwIFBORyAvIDE5IGR1cnVtdW4gZG9zeWEgYm95dXR1IHZlIFNIQSBkZcSfZXJsZXJpbmkgZG/En3J1bGFkxLFtLiBUw7xtIFBORydsZXIgMzkww5c4NDQ7IDI3IGZhcmtsxLEgUkFXIGnDp2VyaWsgdmFyLCB0ZWtyYXJsxLEgZ3J1cGxhcmRha2kgNTkgZcWfbGXFn21lIGJ5dGUtYnl0ZSBheW7EsTsgUjEnZGVraSA1MCBnaXJkaW5pbiB0w7xtw7wgUjIga2FyxZ/EsWzEscSfxLF5bGEgYnl0ZS1ieXRlIGF5bsSxLiAyNyBmYXJrbMSxIFJBVyBpw6dlcmnEn2kgb3JpZ2luYWwgw6fDtnrDvG7DvHJsw7xrdGUgYcOnxLFwIGluY2VsZWRpbS4gU2FiaXQgSjA1LVNDUi0wMzcgcmVmZXJhbnPEsW7EsSBheXLEsWNhIGHDp3TEsW06IDg4N8OXMTc3NCwgMTcyMDA1MiBieXRlLCBTSEEyNTYgMzExNmUyOGVlODUyN2IxMTRjNzkwZGJjZmZhNzUwZjkzZWQ1NDdhN2EwZWIxODg2YmQxNDdkMjVhOGQ2NGU3Yy4gS2FidWwgZWRpbG1pxZ8gVDAxNGEgbWFuYWdlLWluYWN0aXZlIHZlIHRyYW5zZmVyIGVrcmFubGFyxLF5bGEgZGEgw6dhbMSxxZ9tYSBETkEnc8SxbsSxIGthcsWfxLFsYcWfdMSxcmTEsW0uIEUxIGVrcmFubGFyxLEga2F5bmFrbGEgZ2VuZWwgb2xhcmFrIHR1dGFybMSxOyBmaW5kaW5nLCBtaXNzaW5nL21pc3NpbmctYXV0aG9yaXR5IGhhbGluZGUga29ydW5hbiBleWxlbWxlcmluIGRpc2FibGVkIG9sbWFzxLFuZGFkxLFyLgoKRS1ERVYtMTEzIFI0IGthecSxdGxhcsSxIMO2bmNla2kgMjk5IHRlc3RpIGtvcnV5dXAgMTkgeWVuaSB0ZXN0IGVrbGV5ZXJlayAzMTggbm9ybWFsIHRlc3RpIFBBU1MgZ8O2c3Rlcml5b3I7IGF5csSxY2EgMSBuYXRpdmUgdGVzdCBheXLEsSByYXBvcmxhbm3EscWfLiBGb3JtYXQgMzQgZG9zeWEgLyAwIGRlxJ9pxZ9pa2xpaywgYW5hbHl6ZSAwIGlzc3VlLiBNaW1hcmkgUjMgcnVuX2FsbCAxMiBncmFwaCBrb250cm9sw7wgdmUgNDIgcHJlc2VydmF0aW9uL2lkZW50aXR5IHRlc3RpeWxlIHdvcnN0IGV4aXQgMDsgRTQgMTcwLCBFOSA5IHRlc3QgUEFTUy4gw5Z6Z8O8biBSMS9SMiBGQUlMIGfDvG5sw7xrbGVyaSB0dXR1bG11xZ8uIEJ1IHllxZ9pbCBzb251w6dsYXIgbWV2Y3V0IHlhbmzEscWfIHBhdGggc2VtYW50acSfaW5pIGRlIHRlc3QgZXR0acSfaW5kZW4gYnVsZ3V5dSBrYXBhdG3EsXlvci4KCkV4YWN0LWhlYWQgQ0knxLEgYXlyxLFjYSBkb8SfcnVsYWTEsW0uIFBSIDExNSBHaXRIdWInZGEgT1BFTi9EUkFGVCwgbWFpbiBiYXNlIDI0NzE3MzQ3NTBlNzIzYWI3YWY1Y2I4NGY2Njc2MTU1Y2EyNjk2MGYgdmUgc291cmNlIDE4ZmJjNTFkMTUzYWNkMjhhMGE1NWQyYTZkNWU1ZjRmZTRlNDY3YWU7IFQzIGV0aWtldGkgbWV2Y3V0LiBNYWtidXovSlNPTidkYWtpIDE3IHdvcmtmbG93IHJ1bifEsW7EsW4gZXZlbnQsIGhlYWQsIGpvYiwgc3RlcCwgc3RhdHVzL2NvbmNsdXNpb24sIGhhbSBsb2cgYm95dXR1IHZlIFNIQTI1NiBkZcSfZXJsZXJpbmluIHTDvG3DvG7DvCB5ZXJlbCBnZXLDp2VrIFJBVyBnw7xubMO8a2xlcmxlIGthcsWfxLFsYcWfdMSxcmTEsW06IDkgUFIgKyA4IHB1c2gsIHR1dGFyc8SxemzEsWsgMC4gR2Vyw6dlayBQUiBhcmNoaXRlY3R1cmUgcnVuIDM3NTYxOTYyODg2IHZlIDM3NTYxOTYzNDE0J3RlIFQzIGpvYidsYXLEsSBheXLEsSBheXLEsSA1LzUgYmHFn2FyxLFsxLEgYWTEsW0sIGNoZWNrcyBqb2InbGFyxLEgNy83IGJhxZ9hcsSxbMSxIGFkxLFtOyBQUiBUMyBrYW7EsXTEsSBnZcOnZXJsaWRpci4gUHVzaCBhcmNoaXRlY3R1cmUgVDMgam9iJ8SxIDAgYWTEsW1sYSBTS0lQUEVEJ2RpciB2ZSBrYWJ1bCBrYW7EsXTEsSBzYXnEsWxtYW3EscWfdMSxci4gQ0kga2F5bmFrIGjDvGttw7xuw7xuIHZleWEgw7xyw7xuL8O8cmV0aW0gdGFtYW1sYW5tYXPEsW7EsW4geWVyaW5lIGdlw6dtZXouCgo1LiBOaWhhaSBrYXJhciB2ZSBzxLFuxLFyCgpLYWJ1bCBlbmdlbGkgdGVrIGJpciBQMSBzZW1hbnRpayBidWxndXN1ZHVyOiBlbnRpdGxlbWVudCBwbGFuIG9rdW5hYmlsaXJsacSfaSB2ZSBwbGFuIHN1YmplY3QnaSwgcGFrZXRpbiBiYcSfxLFtc8SxeiBvbG1hc8SxbsSxIGlzdGVkacSfaSBrb3J1bmFuIHBhdGggcmVhZCBhdXRob3JpdHknc2luaSBrYXBhdMSxeW9yOyB0ZXN0IGJ1bnUga2FwYWzEsSB0dXRhcmFrIG9uYXlsxLF5b3IuIEF5bsSxIFBSJ2RlIGRhciBrYXluYWsgZMO8emVsdG1lc2ksIGJ1IG9sdW1zdXogZHVydW11IGthcGF0YW4geWVuaSB0ZXN0bGVyLCBmcmVzaCBpbmRlcGVuZGVudCBmaXJzdC1yZWFkIHZlIGV4YWN0LW5ldy1oZWFkIENJIHNvbnJhc8SxbmRhIHllbmlkZW4gaW5jZWxlbm1lbGlkaXIuIEJ1IHJhcG9yIGhhesSxcmxhbsSxcmtlbiByZXBvLCBQUiB2ZXlhIHN0YXR1cyBrYXnEsXRsYXLEsW5hIHlhem1hIHlhcMSxbG1hZMSxOyBHaXRIdWIgcmV2aWV3L21lcmdlIHlhcMSxbG1hZMSxLg==
```
