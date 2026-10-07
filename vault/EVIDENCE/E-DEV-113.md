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
used_by: [V-E1-ENTITLEMENT-001, P-E1-014b, T-E1-014b, V-E1-PROFILE-001, P-E1-015]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR037 C1.7/F1.7.1/FL1.7.1 entitlement v1 GATE"
subject_file: modules/e01-app/internal/shell/lib/entitlement_gate.dart
subject_digest: a38f5df556cbfb65562bbd6e0d46a2fbe0e0baf19788ea0779c0733518814fff
result: "Bütün bağımsız kaynak FULL PASS sınırlı E1 GATE; ayrısonkayıt ve sonCI-T3 bekleniyor"
gate_verdict: "PASS sınırlı E1 kaynak GATE değerlendirmesi; üretim kapıları HELD; ayrısonkayıt/CI-T3 bekleniyor"
reviewer: "/root/e1014b_r2_whole_review; requested gpt-6-luna/max"
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

## F01 dar onarımın gerçek yerel kanıtı

Özgün SOURCE 18fbc51d153acd28a0a55d2a6d5e5f4fe4e467ae ve tam bağımsız CHANGES_REQUESTED raporu yukarıda özgün HTML/RAW Base64 ile korunur. Kodöncesi onarım 1d7e0edf8cbb27b9c5f67af3452fd6e3f94cf351; onarım kodu f8df461775692958fe35e7a3c5ec8a05a228c842. Ret kapanışı henüz verilmedi; taze bütün kaynak GATE incelemesi gerekir.

Korunan yolların dört öz-okuma boyutu ile yol referansı entitlement planından ayrı immutable girdidir. Tam kapsam kimliklerinin kayıpsız UTF16 subject'i; `entitlement-preserved-read` ve `entitlement-preserved-path` purpose'ları, aynı scope/request/current/confirmed gerekir. Metadata ve özel plan metni eski 4read/4field/authority guard'ıyla kapalı kalır. Yeni işlem kontrolü 6effect ve active/allowed/online/handler ister; seçenek değerlendirme niyeti readable/online ister, altı etkiyle karıştırılmaz. Öz-okuma geçerliyken entitlement kaybı/değişimi veya offline geçmiş yolunu kapatmaz. Öz-okuma eksik/eski/yabancı/held/unknown/yanlış purpose-subject-request ise yollar kapalıdır. Eski callback güncel öz-okuma ve handler'ı yeniden denetler; scope/request veya izin kaybını ödünç alamaz. Okuma niyeti entitlement özel metnini ve plan! null erişimini taşımaz; garaj/destek subject boş.

Gerçek hedef22PASS; önceki299 değişmeden yeni22 dahil toplam321 normal PASS. Üç yeni anlamlı F01 testi: yedi eksik/geçersiz entitlement altında altı yola toplam42 gerçek tap; dört öz-okuma boyutunun sekiz negatif türü; lisans kaybı/değişimi/çevrimdışı eski callback ve scope/request/revocation kapanışı. Strictformat34/0, analyze0. Güncel25durum×9duyarlı düzen=225 tamkaydırma/52hedef; native ayrı1PASS,390×844 tamkaydırma68PNG. Root4 yeni özgün içerik açtı;42 önceki gerçekten açılmış içerikle RAW byteequal,22 yeni tekrarı bu4 ile RAW byteequal doğrulandı. Eski50 görüntü/ilkoku raporu değişmeden tarih olarak korunur, güncel68 yerine kullanılamaz. Sabit13soru değişmez; taze ilk okuma beklenir.

Önceki17 kaynakCI yalnız reddedilmiş18fbc başına aittir; onarımı kabul etmez. Yeni aynı kaynak CI/T3, taze bütün görev incelemesi, ayrısonaltı kayıt/inceleme/CI-T3, normalmerge/fetchedmain8 beklenir. Ana101DONE105kalan206 değişmez. E3R1REVIEW/E5IN_PROGRESS/üretim kimlik-yetki-quota-billing/physical/router/device/release HELD. Özgün ret/FAIL geçmişi silinmez. F01 ilk atomik patch indent eşleşmedi ve uygulanmadı; doğru patch uygulandı, test hatası veya bypass olmadı.

KodLF SHA256 a38f5df556cbfb65562bbd6e0d46a2fbe0e0baf19788ea0779c0733518814fff; testLF SHA256 220b36f8ab2b7bca4b6934e485f963de94d0016ebc030862f956f8c1d9e91c38; sabit13soruLF SHA256 6df6a758a90611576c1fcf915cd2e0a277329ccca247d8acc021aec7b039e3e1.

### F01 özgün yerel günlük ve PNG makbuzları

- kavriva_e1014b_F01_R1_target_tests.log: RAW 2031bayt/SHA256 520d4e1095aa48845e166bf987c52d45836050bc30f29c568f38ac5935ec80cd.
- kavriva_e1014b_F01_R2_full_tests.log: RAW 71792bayt/SHA256 ef40383711b1ec3b653f9789f3c5bb84ce67914c6699106c32861cd70f693386.
- kavriva_e1014b_F01_format.log: RAW 49bayt/SHA256 8d24b26c90ad60301481416ece81e045f5406f282314ddd3ac1c661333d60e41.
- kavriva_e1014b_F01_analyze.log: RAW 99bayt/SHA256 433b6744b97c33eb986cd7e9d7e05d362725f2ca4b103a43aad373667bb09bd7.
- kavriva_e1014b_native_R3.log: RAW 266bayt/SHA256 e2d1a63e283e3cdb8a28742168ff2c7d67bc65848abd48e981c5bd8cffb3779e.
- kavriva_e1014b_R3_images.json: RAW 20101bayt/SHA256 97a2724cd0c08c1e7e701a318e151b8a15411ab4c06b2b7accd76878fd42bdcf.
- kavriva_e1014b_R3_root_image_queue.json: RAW 20296bayt/SHA256 2b3a050cfbaefd7a662e740d3cdde2efda5d408ab3db9f02464f14d19c780bba.

Güncel native RAW tüm kimlikler:

```json
[
  {
    "state": "preserved-source-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-source-missing-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-source-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-source-missing-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-source-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-source-missing-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "preserved-dimension-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-dimension-missing-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-dimension-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-dimension-missing-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-dimension-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-dimension-missing-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "preserved-stale",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-stale-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-stale",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-stale-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-stale",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-stale-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "preserved-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-held-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-held-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-held-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "preserved-unknown",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-unknown-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-unknown",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-unknown-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-unknown",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-unknown-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "preserved-foreign",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-foreign-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "preserved-foreign",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-foreign-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81340,
    "sha256": "3633f400f9bfcc720087428cd5cb934dceb07290c3c84a53be442448b0c1fef9"
  },
  {
    "state": "preserved-foreign",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-preserved-foreign-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79377,
    "sha256": "48fe8e0158cc5753fa2f2b446b9c77f858b4fc052f1fdc8d1c8244ddb91e6314"
  },
  {
    "state": "context-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-context-requested-0.png",
    "offset": 0.0,
    "end": 905.0,
    "index": 0,
    "bytes": 72783,
    "sha256": "9ea737c8e61afb69a4692757207a8beec8b4883cb8e7eea73a52ea561f872a1b"
  },
  {
    "state": "context-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-context-requested-1.png",
    "offset": 620.0,
    "end": 905.0,
    "index": 1,
    "bytes": 81405,
    "sha256": "404cd88bc42ccf4308c2e66482dbc805758a85466443368bc5889a13d80a9db6"
  },
  {
    "state": "context-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-context-requested-2.png",
    "offset": 905.0,
    "end": 905.0,
    "index": 2,
    "bytes": 78499,
    "sha256": "89fa169a88ebbb95fd2b5f6bb87aaa35b760b02952c0f2bc96742cfee3658a5f"
  },
  {
    "state": "check-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-check-requested-0.png",
    "offset": 0.0,
    "end": 1038.0,
    "index": 0,
    "bytes": 69176,
    "sha256": "679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2"
  },
  {
    "state": "check-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-check-requested-1.png",
    "offset": 620.0,
    "end": 1038.0,
    "index": 1,
    "bytes": 78961,
    "sha256": "dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4"
  },
  {
    "state": "check-requested",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-check-requested-2.png",
    "offset": 1038.0,
    "end": 1038.0,
    "index": 2,
    "bytes": 80136,
    "sha256": "1637c26a8093314830ea63d293ec0428da1f8ef3eac967f3a45c5d577f72d789"
  },
  {
    "state": "inactive",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-inactive-0.png",
    "offset": 0.0,
    "end": 890.0,
    "index": 0,
    "bytes": 70534,
    "sha256": "625112ec3d959524877095df815ca92cc5c8f5f7f9bb0e0a09f961859249f125"
  },
  {
    "state": "inactive",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-inactive-1.png",
    "offset": 620.0,
    "end": 890.0,
    "index": 1,
    "bytes": 80880,
    "sha256": "6406fdabb3d4721d404dcc506336146a8cf37eb6a1296f452dca24c98d769a12"
  },
  {
    "state": "inactive",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-inactive-2.png",
    "offset": 890.0,
    "end": 890.0,
    "index": 2,
    "bytes": 76890,
    "sha256": "9c2d31ce035da73692386816bc433b41ddd6905a7205da5cd5fc46de22083d42"
  },
  {
    "state": "denied",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-denied-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72783,
    "sha256": "9ea737c8e61afb69a4692757207a8beec8b4883cb8e7eea73a52ea561f872a1b"
  },
  {
    "state": "denied",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-denied-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81408,
    "sha256": "e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268"
  },
  {
    "state": "denied",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-denied-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79400,
    "sha256": "9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3"
  },
  {
    "state": "held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-held-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 71557,
    "sha256": "383b8aab4b6a15c2cea9ee2883f65860138adc08454cf58cc475b3e79bfa03e5"
  },
  {
    "state": "held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-held-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81408,
    "sha256": "e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268"
  },
  {
    "state": "held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-held-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79400,
    "sha256": "9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3"
  },
  {
    "state": "allowed",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-allowed-0.png",
    "offset": 0.0,
    "end": 980.0,
    "index": 0,
    "bytes": 69176,
    "sha256": "679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2"
  },
  {
    "state": "allowed",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-allowed-1.png",
    "offset": 620.0,
    "end": 980.0,
    "index": 1,
    "bytes": 78961,
    "sha256": "dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4"
  },
  {
    "state": "allowed",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-allowed-2.png",
    "offset": 980.0,
    "end": 980.0,
    "index": 2,
    "bytes": 78331,
    "sha256": "7fc2c7f308a7606c9f0f4da31d302c0cd693ddd775166735a814c1088378632e"
  },
  {
    "state": "started",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-started-0.png",
    "offset": 0.0,
    "end": 971.0,
    "index": 0,
    "bytes": 70534,
    "sha256": "625112ec3d959524877095df815ca92cc5c8f5f7f9bb0e0a09f961859249f125"
  },
  {
    "state": "started",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-started-1.png",
    "offset": 620.0,
    "end": 971.0,
    "index": 1,
    "bytes": 77766,
    "sha256": "d23278f1e3601ed651da61b62b504bb46a2a87b0123b53ecb00172c574761172"
  },
  {
    "state": "started",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-started-2.png",
    "offset": 971.0,
    "end": 971.0,
    "index": 2,
    "bytes": 77649,
    "sha256": "2464897526b9e389cf672b5313116d4fdffaa459ea3950e85d2b2a14c2719546"
  },
  {
    "state": "offline",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-offline-0.png",
    "offset": 0.0,
    "end": 1038.0,
    "index": 0,
    "bytes": 68483,
    "sha256": "acde49c429589cded2168bc17095ffe02cb8789ce70a6f278109457c10cd323e"
  },
  {
    "state": "offline",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-offline-1.png",
    "offset": 620.0,
    "end": 1038.0,
    "index": 1,
    "bytes": 76113,
    "sha256": "282d8173a5a83b0ba5961e24ac8b4d1da7be8022794456a38e0027d25b0b7805"
  },
  {
    "state": "offline",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-offline-2.png",
    "offset": 1038.0,
    "end": 1038.0,
    "index": 2,
    "bytes": 78280,
    "sha256": "b9cddd1c7bbf3cefc59e5d4dedf1369b335b0d3930287ba956b956d33af42f56"
  },
  {
    "state": "missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-missing-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-missing-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "source-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-source-missing-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "source-missing",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-source-missing-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "stale",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-stale-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "stale",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-stale-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "authority-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-authority-held-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "authority-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-authority-held-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "authority-unknown",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-authority-unknown-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "authority-unknown",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-authority-unknown-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "foreign",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-foreign-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "foreign",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-foreign-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "field-private",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-field-private-0.png",
    "offset": 0.0,
    "end": 550.0,
    "index": 0,
    "bytes": 75865,
    "sha256": "271bd934a38a6e213cce0860a43d0523c9274157e98ba8f8446aade2076da80f"
  },
  {
    "state": "field-private",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-field-private-1.png",
    "offset": 550.0,
    "end": 550.0,
    "index": 1,
    "bytes": 80830,
    "sha256": "cd1c9ce4bd9800df55287a7c599c0745290d336af3f8bf789e16126177f97221"
  },
  {
    "state": "path-private",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-path-private-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72838,
    "sha256": "478783ad548d12c4efc3ceb00f970e9456e31ad22d41d1295ff9458abef821c0"
  },
  {
    "state": "path-private",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-path-private-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81408,
    "sha256": "e4ba87ff94e2ccb2a938ee19d582d93d0700d56670ebe35d6d998521a0ffb268"
  },
  {
    "state": "path-private",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-path-private-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79400,
    "sha256": "9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3"
  },
  {
    "state": "effect-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-effect-held-0.png",
    "offset": 0.0,
    "end": 980.0,
    "index": 0,
    "bytes": 69176,
    "sha256": "679894472940fe16866fc8b28c89d6839693ac5a7f35acfb01fc79a30d05cdc2"
  },
  {
    "state": "effect-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-effect-held-1.png",
    "offset": 620.0,
    "end": 980.0,
    "index": 1,
    "bytes": 78961,
    "sha256": "dff67d7df217e761cb383e4ef66b9bad2768f8c428dc3f237fbe5d03aa5682b4"
  },
  {
    "state": "effect-held",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-effect-held-2.png",
    "offset": 980.0,
    "end": 980.0,
    "index": 2,
    "bytes": 78346,
    "sha256": "d0be377d5f31318fe1803529c951a2a0228d3ad11598ad7cecf98fb3164588f3"
  },
  {
    "state": "no-handler",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-no-handler-0.png",
    "offset": 0.0,
    "end": 847.0,
    "index": 0,
    "bytes": 72732,
    "sha256": "c396dc67f06761b1128deac18a68f9fd0ae2dec1a85a4c127d4a01cea0fae031"
  },
  {
    "state": "no-handler",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-no-handler-1.png",
    "offset": 620.0,
    "end": 847.0,
    "index": 1,
    "bytes": 81339,
    "sha256": "fe04257dbcf0bff93b7c96a605541b0e8f40a0215a6ec2dd7c7c924f0fa99055"
  },
  {
    "state": "no-handler",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-no-handler-2.png",
    "offset": 847.0,
    "end": 847.0,
    "index": 2,
    "bytes": 79264,
    "sha256": "6c01486f2c24eac7358df3df0137e63ecedab0b182ba832e4f3997db31122f02"
  },
  {
    "state": "long",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-long-0.png",
    "offset": 0.0,
    "end": 1123.0,
    "index": 0,
    "bytes": 82710,
    "sha256": "1fac4d0080312945eb37603ee8a2da10320b103b857dd830535565d00a8ecbbc"
  },
  {
    "state": "long",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-long-1.png",
    "offset": 620.0,
    "end": 1123.0,
    "index": 1,
    "bytes": 75089,
    "sha256": "48e07e32a23e218ed0006ae45755f0f22f5bb07217d8732a462f7bcc87eafb7e"
  },
  {
    "state": "long",
    "path": "C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014b_native_R3-long-2.png",
    "offset": 1123.0,
    "end": 1123.0,
    "index": 2,
    "bytes": 79400,
    "sha256": "9765a6c8df8a3b69011ac6bfa71e138f80289b2683096d071ca208ce9fe61bd3"
  }
]
```

## F01 sonrası taze ilk okuma ve bütün GATE kaynağı

/root/e1014b_r2_first_reading geçmişsiz bağımsız bağlam, istenen gpt-6-luna/max; yalnız güncel68nativePNG ve değişmeyen13soru. Root özgün raporun tamamını okudu; 6393bayt RAW SHA256 3a94dad4668fa55b9d52412d3d115aecdd96ee5ca039f19a693eeafa19efc348. Anlamlar doğru; nohandler/garaj kapalı gerçek sınırı korunur. AI anlam okuması canlı ürün/insan/OS/cihaz veya bütün görev kabulü değildir. Özgün önceki ilkoku ve CHANGES_REQUESTED tam raporları değiştirilmedi.

F01 yerel321normal/34format0/analyze0/68native25durum/225duyarlı düzen PASS; mimari12kontrol+42izkoruma worst0. Görev REVIEW onarım adayı; özgün ret history kalır. Taze bütün bağımsız GATE hükmü ve gerçek bu başın CI/T3 beklenir. Eski18fbc kaynak17CI yeni başa sayılmaz. AynıPR115; ana101DONE105kalan206, üretim kapıları HELD. Ayrısonaltı inceleme/CI-T3/normalmerge/fetchedmain8 olmadan kabul sayılmaz.

## F01 sonrası özgün ilk okuma tam raporu

<pre>E01-014b — Native ekranlardan bağımsız ilk okuma

Kapsam ve görsel bütünlük
- Yalnız sabit soru dosyası ile verilen ekran manifesti ve o manifestteki PNG’ler kullanıldı.
- Manifestte 68 görüntü kaydı ve 25 durum var. Her dosyanın gerçek bayt uzunluğu ve ham SHA-256 manifestteki değerle eşleşti; 68/68 dosya PNG imzası taşıyor ve boyutu 390 × 844.
- Tam bayt/SHA-256 eşitliğiyle tekilleştirince 29 farklı görüntü kaldı. Bu 29 özgün görüntünün tamamını açıp inceledim; kalan 39 kayıt bu görüntülerden biriyle bayt düzeyinde aynıydı.
- Görseller etkileşim testi değildir. Düğme rengi ve metni görülebilir; tıklama sonucu, kimlik/izin doğrulaması, fiziksel durum veya gerçek işlem davranışı bu ekranlardan doğrulanamaz.

İlk okuma özeti
Ekran, “Yeni işlem kapalı” veya bazı durumlarda “Yeni bakım kapalı” diyerek yeni bakım/işlemi sınırlandırıyor. Metin açıkça mevcut kayıtların korunacağını ve yeni işlem sınırının geçmişi silmediğini söylüyor. Geçmiş, kanıt/kaynak, düzeltme/itiraz ve dışa aktarma yollarının paket satın almaya bağlı olmadığı; her biri için güncel kimlik ve okuma izni gerektiği belirtilmiş. Kritik güvenlik bilgisi ve başlanmış işin güvenli dönüşü de paket nedeniyle kapatılmıyor. Normal kapalı ekranlarda mavi “Garaja dön” düğmesi görülüyor.

Sabit 13 soruya yanıtlar

1. Bu ekran hangi işlemi kapatıyor; geçmiş kayıtlarını siliyor mu?
Yalnız yeni bakım/yeni işlem etkileniyor. Geçmişi silmiyor; ekranda “Mevcut kayıtlar korunur” ve “Yeni işlem sınırı geçmişini silmez” deniyor. Belirsizlik: Bu, metnin beyanıdır; kayıtların arka uçtaki durumu görselden doğrulanamaz.

2. Geçmiş, kanıt ve kaynak bilgisi yeni bakım kapalıyken nereye gider?
Ekran dört yolu sayıyor: “Geçmiş kayıtları”, “Kanıt ve kaynak bilgisi”, “Düzeltme ve itiraz” ve “Kayıtları dışa aktar”. Bunların paket satın almaya bağlı olmadığı, her birinin güncel kimlik ve okuma izni gerektirdiği yazıyor. Belirsizlik: Durum ekranlarında düğmelerin görünümü değişiyor; metin plan bağımsızlığını söylese de tüm durumlarda fiilen açık oldukları yalnız görüntüden doğrulanamıyor.

3. Düzeltme, itiraz ve dışa aktarma paket nedeniyle kaybolur mu?
Hayır. Metin bu yolların paket satın almaya bağlı olmadığını söylüyor; erişim için yine güncel kimlik ve okuma izni gerekiyor.

4. Kritik güvenlik bilgisi ve başlanmış işin güvenli dönüşü paket satın almaya bağlı mı?
Hayır. Metin kritik güvenlik bilgisinin ve başlanmış işin güvenli dönüşünün paket nedeniyle kapatılmadığını söylüyor. Önceki izinler işi sürdürmeye yetmiyor; güncel fiziksel durum ayrıca değerlendirilmelidir.

5. Yeni bakım kapalıyken bu ekrandan hangi güvenli ana eylemi seçebilirsin?
Normal kapalı ekranlarda mavi “Garaja dön” düğmesi güvenli ana eylem olarak sunuluyor. “no-handler” durumunun görüntülerinde bu düğme gri ve diğer eylemler de gri görünüyor; o varyantta güvenli dönüş ekranda seçilebilir görünmüyor. Görüntü, gerçek tıklama davranışını veya düğmenin neden pasif olduğunu kanıtlamıyor.

6. Ücretsiz kaç motosiklet; abonelikle toplam kaç; aynı anda kaçında tam rehber var?
Ücretsiz 1 motosiklet; abonelikle toplam 3 motosiklet. Aynı anda yalnız seçili 1 motosiklette tam rehber var.

7. Tam rehber için başka motosiklet seçmek önceki hakkın üstüne ek hak yaratır mı?
Hayır. Hak başka motosiklet seçilince taşınıyor; önceki hakkın üstüne eklenmiyor. Her motosikletin kayıtları ayrı kalıyor.

8. Ücret veya abonelik motosikletin fiziksel uygunluğunu veya bakımın doğruluğunu kanıtlar mı?
Hayır. Ekran, hak veya aboneliğin bakımın doğruluğunu ya da motosikletin güncel fiziksel uygunluğunu kanıtlamadığını söylüyor. Yeniden etkinleştirme de fiziksel kontrolün yerine geçmiyor.

9. Mevcut kayıtlarına erişim korunuyor demek kimlik ve okuma izni olmadan özel veriye erişebilirsin demek mi?
Hayır. Her yol için güncel kimlik ve okuma izni gerektiği yazıyor. İzin bilgisi alınamayan görünümde özel motosiklet ve izin bilgilerinin gösterilmediği de belirtilmiş.

10. Güncel izin alınamıyorsa veya çevrimdışıysan yeni bakım kendiliğinden açılır mı?
Hayır. Bekleyen durumda güncel kararın beklendiği ve yeni işleme izin verilmediği yazıyor. Çevrimdışı görünüm güncel sunucu kontrolünün gerektiğini söylüyor; kontrol olmadan kendiliğinden açılma beyanı yok.

11. Bu ekrandaki yeni işlem kontrolü isteği bakımın başlaması ya da tamamlanması anlamına gelir mi?
Hayır. Bu, güncel değerlendirme isteği. Ekran isteğin ödeme yapmadığını, hak vermediğini ve bakımı başlatmadığını söylüyor; kontrol isteği iletilmiş görünümde güncel sonuç doğrulanmadı ve işlemin başlamadığı açıkça yazıyor.

12. Bu ekranda fiyat, ödeme veya seçimi değiştirme sıklığı kesinleştirilmiş mi?
Hayır. Fiyat, ödeme, seçim değiştirme sıklığı ve deneme koşullarının burada kesinleştirilmediği açıkça yazıyor.

13. Motosiklet etkin değilse yeniden etkinleştirmek güncel fiziksel durumun uygun olduğunu kanıtlar mı?
Hayır. Yeniden etkinleştirmenin fiziksel kontrolün yerine geçmediği yazıyor; güncel fiziksel uygunluk ayrıca değerlendirilmelidir.

Açık/kapalı yollar ve belirsizlik
Metinsel ayrım anlaşılır: yeni bakım/işlem kapalı olabilirken geçmiş ve güvenlik yolları paket nedeniyle kapatılmıyor; bu yollar güncel kimlik ve okuma iznine bağlı. Ekranlar arasındaki görsel sunum ise tutarlı değil: bazı örneklerde geçmiş yolları beyaz konturlu, bazılarında gri; özel yol görünümünde yalnız geçmiş düğmesi gri; “no-handler” görüntülerinde “Garaja dön” dâhil bütün düğmeler gri. Bu yüzden “paketten bağımsız” ifadesini “her durumda ekrandan kullanılabilir” diye okumak güvenli değil. Özellikle “no-handler” varyantında güvenli dönüşün görünür bir eylem olarak sunulmadığını not ediyorum. Bu ilk okuma yalnız ekran metni ve görünümüne dayanır; kod, gerçek kişi/cihaz kanıtı veya üretim kabulü hakkında iddia içermez.
</pre>

## F01 sonrası özgün ilk okuma RAW Base64

```base64
RTAxLTAxNGIg4oCUIE5hdGl2ZSBla3JhbmxhcmRhbiBiYcSfxLFtc8SxeiBpbGsgb2t1bWEKCkthcHNhbSB2ZSBnw7Zyc2VsIGLDvHTDvG5sw7xrCi0gWWFsbsSxeiBzYWJpdCBzb3J1IGRvc3lhc8SxIGlsZSB2ZXJpbGVuIGVrcmFuIG1hbmlmZXN0aSB2ZSBvIG1hbmlmZXN0dGVraSBQTkfigJlsZXIga3VsbGFuxLFsZMSxLgotIE1hbmlmZXN0dGUgNjggZ8O2csO8bnTDvCBrYXlkxLEgdmUgMjUgZHVydW0gdmFyLiBIZXIgZG9zeWFuxLFuIGdlcsOnZWsgYmF5dCB1enVubHXEn3UgdmUgaGFtIFNIQS0yNTYgbWFuaWZlc3R0ZWtpIGRlxJ9lcmxlIGXFn2xlxZ90aTsgNjgvNjggZG9zeWEgUE5HIGltemFzxLEgdGHFn8SxeW9yIHZlIGJveXV0dSAzOTAgw5cgODQ0LgotIFRhbSBiYXl0L1NIQS0yNTYgZcWfaXRsacSfaXlsZSB0ZWtpbGxlxZ90aXJpbmNlIDI5IGZhcmtsxLEgZ8O2csO8bnTDvCBrYWxkxLEuIEJ1IDI5IMO2emfDvG4gZ8O2csO8bnTDvG7DvG4gdGFtYW3EsW7EsSBhw6fEsXAgaW5jZWxlZGltOyBrYWxhbiAzOSBrYXnEsXQgYnUgZ8O2csO8bnTDvGxlcmRlbiBiaXJpeWxlIGJheXQgZMO8emV5aW5kZSBheW7EsXlkxLEuCi0gR8O2cnNlbGxlciBldGtpbGXFn2ltIHRlc3RpIGRlxJ9pbGRpci4gRMO8xJ9tZSByZW5naSB2ZSBtZXRuaSBnw7Zyw7xsZWJpbGlyOyB0xLFrbGFtYSBzb251Y3UsIGtpbWxpay9pemluIGRvxJ9ydWxhbWFzxLEsIGZpemlrc2VsIGR1cnVtIHZleWEgZ2Vyw6dlayBpxZ9sZW0gZGF2cmFuxLHFn8SxIGJ1IGVrcmFubGFyZGFuIGRvxJ9ydWxhbmFtYXouCgrEsGxrIG9rdW1hIMO2emV0aQpFa3Jhbiwg4oCcWWVuaSBpxZ9sZW0ga2FwYWzEseKAnSB2ZXlhIGJhesSxIGR1cnVtbGFyZGEg4oCcWWVuaSBiYWvEsW0ga2FwYWzEseKAnSBkaXllcmVrIHllbmkgYmFrxLFtL2nFn2xlbWkgc8SxbsSxcmxhbmTEsXLEsXlvci4gTWV0aW4gYcOnxLFrw6dhIG1ldmN1dCBrYXnEsXRsYXLEsW4ga29ydW5hY2HEn8SxbsSxIHZlIHllbmkgacWfbGVtIHPEsW7EsXLEsW7EsW4gZ2XDp21pxZ9pIHNpbG1lZGnEn2luaSBzw7Z5bMO8eW9yLiBHZcOnbWnFnywga2FuxLF0L2theW5haywgZMO8emVsdG1lL2l0aXJheiB2ZSBkxLHFn2EgYWt0YXJtYSB5b2xsYXLEsW7EsW4gcGFrZXQgc2F0xLFuIGFsbWF5YSBiYcSfbMSxIG9sbWFkxLHEn8SxOyBoZXIgYmlyaSBpw6dpbiBnw7xuY2VsIGtpbWxpayB2ZSBva3VtYSBpem5pIGdlcmVrdGnEn2kgYmVsaXJ0aWxtacWfLiBLcml0aWsgZ8O8dmVubGlrIGJpbGdpc2kgdmUgYmHFn2xhbm3EscWfIGnFn2luIGfDvHZlbmxpIGTDtm7DvMWfw7wgZGUgcGFrZXQgbmVkZW5peWxlIGthcGF0xLFsbcSxeW9yLiBOb3JtYWwga2FwYWzEsSBla3JhbmxhcmRhIG1hdmkg4oCcR2FyYWphIGTDtm7igJ0gZMO8xJ9tZXNpIGfDtnLDvGzDvHlvci4KClNhYml0IDEzIHNvcnV5YSB5YW7EsXRsYXIKCjEuIEJ1IGVrcmFuIGhhbmdpIGnFn2xlbWkga2FwYXTEsXlvcjsgZ2XDp21pxZ8ga2F5xLF0bGFyxLFuxLEgc2lsaXlvciBtdT8KWWFsbsSxeiB5ZW5pIGJha8SxbS95ZW5pIGnFn2xlbSBldGtpbGVuaXlvci4gR2XDp21pxZ9pIHNpbG1peW9yOyBla3JhbmRhIOKAnE1ldmN1dCBrYXnEsXRsYXIga29ydW51cuKAnSB2ZSDigJxZZW5pIGnFn2xlbSBzxLFuxLFyxLEgZ2XDp21pxZ9pbmkgc2lsbWV64oCdIGRlbml5b3IuIEJlbGlyc2l6bGlrOiBCdSwgbWV0bmluIGJleWFuxLFkxLFyOyBrYXnEsXRsYXLEsW4gYXJrYSB1w6d0YWtpIGR1cnVtdSBnw7Zyc2VsZGVuIGRvxJ9ydWxhbmFtYXouCgoyLiBHZcOnbWnFnywga2FuxLF0IHZlIGtheW5hayBiaWxnaXNpIHllbmkgYmFrxLFtIGthcGFsxLF5a2VuIG5lcmV5ZSBnaWRlcj8KRWtyYW4gZMO2cnQgeW9sdSBzYXnEsXlvcjog4oCcR2XDp21pxZ8ga2F5xLF0bGFyxLHigJ0sIOKAnEthbsSxdCB2ZSBrYXluYWsgYmlsZ2lzaeKAnSwg4oCcRMO8emVsdG1lIHZlIGl0aXJheuKAnSB2ZSDigJxLYXnEsXRsYXLEsSBkxLHFn2EgYWt0YXLigJ0uIEJ1bmxhcsSxbiBwYWtldCBzYXTEsW4gYWxtYXlhIGJhxJ9sxLEgb2xtYWTEscSfxLEsIGhlciBiaXJpbmluIGfDvG5jZWwga2ltbGlrIHZlIG9rdW1hIGl6bmkgZ2VyZWt0aXJkacSfaSB5YXrEsXlvci4gQmVsaXJzaXpsaWs6IER1cnVtIGVrcmFubGFyxLFuZGEgZMO8xJ9tZWxlcmluIGfDtnLDvG7DvG3DvCBkZcSfacWfaXlvcjsgbWV0aW4gcGxhbiBiYcSfxLFtc8SxemzEscSfxLFuxLEgc8O2eWxlc2UgZGUgdMO8bSBkdXJ1bWxhcmRhIGZpaWxlbiBhw6fEsWsgb2xkdWtsYXLEsSB5YWxuxLF6IGfDtnLDvG50w7xkZW4gZG/En3J1bGFuYW3EsXlvci4KCjMuIETDvHplbHRtZSwgaXRpcmF6IHZlIGTEscWfYSBha3Rhcm1hIHBha2V0IG5lZGVuaXlsZSBrYXlib2x1ciBtdT8KSGF5xLFyLiBNZXRpbiBidSB5b2xsYXLEsW4gcGFrZXQgc2F0xLFuIGFsbWF5YSBiYcSfbMSxIG9sbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3I7IGVyacWfaW0gacOnaW4geWluZSBnw7xuY2VsIGtpbWxpayB2ZSBva3VtYSBpem5pIGdlcmVraXlvci4KCjQuIEtyaXRpayBnw7x2ZW5saWsgYmlsZ2lzaSB2ZSBiYcWfbGFubcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvCBwYWtldCBzYXTEsW4gYWxtYXlhIGJhxJ9sxLEgbcSxPwpIYXnEsXIuIE1ldGluIGtyaXRpayBnw7x2ZW5saWsgYmlsZ2lzaW5pbiB2ZSBiYcWfbGFubcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvG7DvG4gcGFrZXQgbmVkZW5peWxlIGthcGF0xLFsbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3IuIMOWbmNla2kgaXppbmxlciBpxZ9pIHPDvHJkw7xybWV5ZSB5ZXRtaXlvcjsgZ8O8bmNlbCBmaXppa3NlbCBkdXJ1bSBheXLEsWNhIGRlxJ9lcmxlbmRpcmlsbWVsaWRpci4KCjUuIFllbmkgYmFrxLFtIGthcGFsxLF5a2VuIGJ1IGVrcmFuZGFuIGhhbmdpIGfDvHZlbmxpIGFuYSBleWxlbWkgc2XDp2ViaWxpcnNpbj8KTm9ybWFsIGthcGFsxLEgZWtyYW5sYXJkYSBtYXZpIOKAnEdhcmFqYSBkw7Zu4oCdIGTDvMSfbWVzaSBnw7x2ZW5saSBhbmEgZXlsZW0gb2xhcmFrIHN1bnVsdXlvci4g4oCcbm8taGFuZGxlcuKAnSBkdXJ1bXVudW4gZ8O2csO8bnTDvGxlcmluZGUgYnUgZMO8xJ9tZSBncmkgdmUgZGnEn2VyIGV5bGVtbGVyIGRlIGdyaSBnw7Zyw7xuw7x5b3I7IG8gdmFyeWFudHRhIGfDvHZlbmxpIGTDtm7DvMWfIGVrcmFuZGEgc2XDp2lsZWJpbGlyIGfDtnLDvG5tw7x5b3IuIEfDtnLDvG50w7wsIGdlcsOnZWsgdMSxa2xhbWEgZGF2cmFuxLHFn8SxbsSxIHZleWEgZMO8xJ9tZW5pbiBuZWRlbiBwYXNpZiBvbGR1xJ91bnUga2FuxLF0bGFtxLF5b3IuCgo2LiDDnGNyZXRzaXoga2HDpyBtb3Rvc2lrbGV0OyBhYm9uZWxpa2xlIHRvcGxhbSBrYcOnOyBheW7EsSBhbmRhIGthw6fEsW5kYSB0YW0gcmVoYmVyIHZhcj8Kw5xjcmV0c2l6IDEgbW90b3Npa2xldDsgYWJvbmVsaWtsZSB0b3BsYW0gMyBtb3Rvc2lrbGV0LiBBeW7EsSBhbmRhIHlhbG7EsXogc2XDp2lsaSAxIG1vdG9zaWtsZXR0ZSB0YW0gcmVoYmVyIHZhci4KCjcuIFRhbSByZWhiZXIgacOnaW4gYmHFn2thIG1vdG9zaWtsZXQgc2XDp21layDDtm5jZWtpIGhha2vEsW4gw7xzdMO8bmUgZWsgaGFrIHlhcmF0xLFyIG3EsT8KSGF5xLFyLiBIYWsgYmHFn2thIG1vdG9zaWtsZXQgc2XDp2lsaW5jZSB0YcWfxLFuxLF5b3I7IMO2bmNla2kgaGFra8SxbiDDvHN0w7xuZSBla2xlbm1peW9yLiBIZXIgbW90b3Npa2xldGluIGthecSxdGxhcsSxIGF5csSxIGthbMSxeW9yLgoKOC4gw5xjcmV0IHZleWEgYWJvbmVsaWsgbW90b3Npa2xldGluIGZpemlrc2VsIHV5Z3VubHXEn3VudSB2ZXlhIGJha8SxbcSxbiBkb8SfcnVsdcSfdW51IGthbsSxdGxhciBtxLE/CkhhecSxci4gRWtyYW4sIGhhayB2ZXlhIGFib25lbGnEn2luIGJha8SxbcSxbiBkb8SfcnVsdcSfdW51IHlhIGRhIG1vdG9zaWtsZXRpbiBnw7xuY2VsIGZpemlrc2VsIHV5Z3VubHXEn3VudSBrYW7EsXRsYW1hZMSxxJ/EsW7EsSBzw7Z5bMO8eW9yLiBZZW5pZGVuIGV0a2lubGXFn3Rpcm1lIGRlIGZpemlrc2VsIGtvbnRyb2zDvG4geWVyaW5lIGdlw6dtaXlvci4KCjkuIE1ldmN1dCBrYXnEsXRsYXLEsW5hIGVyacWfaW0ga29ydW51eW9yIGRlbWVrIGtpbWxpayB2ZSBva3VtYSBpem5pIG9sbWFkYW4gw7Z6ZWwgdmVyaXllIGVyacWfZWJpbGlyc2luIGRlbWVrIG1pPwpIYXnEsXIuIEhlciB5b2wgacOnaW4gZ8O8bmNlbCBraW1saWsgdmUgb2t1bWEgaXpuaSBnZXJla3RpxJ9pIHlhesSxeW9yLiDEsHppbiBiaWxnaXNpIGFsxLFuYW1heWFuIGfDtnLDvG7DvG1kZSDDtnplbCBtb3Rvc2lrbGV0IHZlIGl6aW4gYmlsZ2lsZXJpbmluIGfDtnN0ZXJpbG1lZGnEn2kgZGUgYmVsaXJ0aWxtacWfLgoKMTAuIEfDvG5jZWwgaXppbiBhbMSxbmFtxLF5b3JzYSB2ZXlhIMOnZXZyaW1kxLHFn8SxeXNhbiB5ZW5pIGJha8SxbSBrZW5kaWxpxJ9pbmRlbiBhw6fEsWzEsXIgbcSxPwpIYXnEsXIuIEJla2xleWVuIGR1cnVtZGEgZ8O8bmNlbCBrYXJhcsSxbiBiZWtsZW5kacSfaSB2ZSB5ZW5pIGnFn2xlbWUgaXppbiB2ZXJpbG1lZGnEn2kgeWF6xLF5b3IuIMOHZXZyaW1kxLHFn8SxIGfDtnLDvG7DvG0gZ8O8bmNlbCBzdW51Y3Uga29udHJvbMO8bsO8biBnZXJla3RpxJ9pbmkgc8O2eWzDvHlvcjsga29udHJvbCBvbG1hZGFuIGtlbmRpbGnEn2luZGVuIGHDp8SxbG1hIGJleWFuxLEgeW9rLgoKMTEuIEJ1IGVrcmFuZGFraSB5ZW5pIGnFn2xlbSBrb250cm9sw7wgaXN0ZcSfaSBiYWvEsW3EsW4gYmHFn2xhbWFzxLEgeWEgZGEgdGFtYW1sYW5tYXPEsSBhbmxhbcSxbmEgZ2VsaXIgbWk/CkhhecSxci4gQnUsIGfDvG5jZWwgZGXEn2VybGVuZGlybWUgaXN0ZcSfaS4gRWtyYW4gaXN0ZcSfaW4gw7ZkZW1lIHlhcG1hZMSxxJ/EsW7EsSwgaGFrIHZlcm1lZGnEn2luaSB2ZSBiYWvEsW3EsSBiYcWfbGF0bWFkxLHEn8SxbsSxIHPDtnlsw7x5b3I7IGtvbnRyb2wgaXN0ZcSfaSBpbGV0aWxtacWfIGfDtnLDvG7DvG1kZSBnw7xuY2VsIHNvbnXDpyBkb8SfcnVsYW5tYWTEsSB2ZSBpxZ9sZW1pbiBiYcWfbGFtYWTEscSfxLEgYcOnxLFrw6dhIHlhesSxeW9yLgoKMTIuIEJ1IGVrcmFuZGEgZml5YXQsIMO2ZGVtZSB2ZXlhIHNlw6dpbWkgZGXEn2nFn3Rpcm1lIHPEsWtsxLHEn8SxIGtlc2lubGXFn3RpcmlsbWnFnyBtaT8KSGF5xLFyLiBGaXlhdCwgw7ZkZW1lLCBzZcOnaW0gZGXEn2nFn3Rpcm1lIHPEsWtsxLHEn8SxIHZlIGRlbmVtZSBrb8WfdWxsYXLEsW7EsW4gYnVyYWRhIGtlc2lubGXFn3RpcmlsbWVkacSfaSBhw6fEsWvDp2EgeWF6xLF5b3IuCgoxMy4gTW90b3Npa2xldCBldGtpbiBkZcSfaWxzZSB5ZW5pZGVuIGV0a2lubGXFn3Rpcm1layBnw7xuY2VsIGZpemlrc2VsIGR1cnVtdW4gdXlndW4gb2xkdcSfdW51IGthbsSxdGxhciBtxLE/CkhhecSxci4gWWVuaWRlbiBldGtpbmxlxZ90aXJtZW5pbiBmaXppa3NlbCBrb250cm9sw7xuIHllcmluZSBnZcOnbWVkacSfaSB5YXrEsXlvcjsgZ8O8bmNlbCBmaXppa3NlbCB1eWd1bmx1ayBheXLEsWNhIGRlxJ9lcmxlbmRpcmlsbWVsaWRpci4KCkHDp8Sxay9rYXBhbMSxIHlvbGxhciB2ZSBiZWxpcnNpemxpawpNZXRpbnNlbCBheXLEsW0gYW5sYcWfxLFsxLFyOiB5ZW5pIGJha8SxbS9pxZ9sZW0ga2FwYWzEsSBvbGFiaWxpcmtlbiBnZcOnbWnFnyB2ZSBnw7x2ZW5saWsgeW9sbGFyxLEgcGFrZXQgbmVkZW5peWxlIGthcGF0xLFsbcSxeW9yOyBidSB5b2xsYXIgZ8O8bmNlbCBraW1saWsgdmUgb2t1bWEgaXpuaW5lIGJhxJ9sxLEuIEVrcmFubGFyIGFyYXPEsW5kYWtpIGfDtnJzZWwgc3VudW0gaXNlIHR1dGFybMSxIGRlxJ9pbDogYmF6xLEgw7ZybmVrbGVyZGUgZ2XDp21pxZ8geW9sbGFyxLEgYmV5YXoga29udHVybHUsIGJhesSxbGFyxLFuZGEgZ3JpOyDDtnplbCB5b2wgZ8O2csO8bsO8bcO8bmRlIHlhbG7EsXogZ2XDp21pxZ8gZMO8xJ9tZXNpIGdyaTsg4oCcbm8taGFuZGxlcuKAnSBnw7Zyw7xudMO8bGVyaW5kZSDigJxHYXJhamEgZMO2buKAnSBkw6JoaWwgYsO8dMO8biBkw7zEn21lbGVyIGdyaS4gQnUgecO8emRlbiDigJxwYWtldHRlbiBiYcSfxLFtc8SxeuKAnSBpZmFkZXNpbmkg4oCcaGVyIGR1cnVtZGEgZWtyYW5kYW4ga3VsbGFuxLFsYWJpbGly4oCdIGRpeWUgb2t1bWFrIGfDvHZlbmxpIGRlxJ9pbC4gw5Z6ZWxsaWtsZSDigJxuby1oYW5kbGVy4oCdIHZhcnlhbnTEsW5kYSBnw7x2ZW5saSBkw7Zuw7zFn8O8biBnw7Zyw7xuw7xyIGJpciBleWxlbSBvbGFyYWsgc3VudWxtYWTEscSfxLFuxLEgbm90IGVkaXlvcnVtLiBCdSBpbGsgb2t1bWEgeWFsbsSxeiBla3JhbiBtZXRuaSB2ZSBnw7Zyw7xuw7xtw7xuZSBkYXlhbsSxcjsga29kLCBnZXLDp2VrIGtpxZ9pL2NpaGF6IGthbsSxdMSxIHZleWEgw7xyZXRpbSBrYWJ1bMO8IGhha2vEsW5kYSBpZGRpYSBpw6dlcm1lei4K
```

## Bütün bağımsız kaynak kabulü — sınırlı E1 GATE değerlendirmesi

Bağımsız /root/e1014b_r2_whole_review geçmişsiz inceleme bağlamı, istenen gpt-6-luna/max, kaynak21d1485157777b0b6d4d8a1a78596abaa8c680e1 için bütün görev FULL PASS verdi. Root özgün14639bayt raporun tamamını okudu; RAW SHA2567e8f88d0848a9a81ef83884d51c3b8de77a4c0525c560d7cdabb8b370d5182ee. Aynı kaynak gerçek16CI/T3 workflow/job/adım/hamlog ile doğrulandı; Önceki reddedilmiş başın17CI makbuzu ayrı tarih olarak korunur; onarım başı yerine kullanılamaz. Kanonik GATE HELD-acceptance evaluation; SCR037/DEC0053 şekli ve korunan okuma/güvenlik yollarının sunumu kabul edildi. Üretim hak/quota/billing/kimlik/yetki/rehber seçimi/physical recovery kapıları HELD kalır. SIMULATION veya üretim enforcement tamamlandı iddiası yok.

İlk okuma özgün raporu Q5 nohandler/garaj kapalı sınırını korur; AI anlam okuması insan/OS/device/nav çalışma kanıtı değildir. İstenen model ayarı gizli runtime modelinin ayrıca doğrulandığı iddiası değildir. Sahip bu oturumda bağımsız alt-ajanı ikinci göz olarak açıkça kabul etti ve aksi söylenene kadar bütün onayları verdi; DEC0069 ile doğrudan sürekli sahip yetkisi bu ayrı incelemecinin exacthead ve sınırlı hükmüyle birlikte kaydedilir. BirleşmemişDEC0070 bu kayıt için otorite değildir.

Bu son aday yalnız profil/paket/görev/kanıt ve iki generated görünümde tamaltı metadata değişikliğidir; kod/test/sabit13soru/native68/SDK/YAML/E3E5/önceki gövdeler değişmez. Profil/paket ACTIVE ve task DONE yalnız sınırlı E1 kaynak sunum kapısı kabulünün branch adayı. Ayrıson inceleme/aynısonCI-T3/normalmerge/fetchedmain8 henüz yok; ana101DONE105kalan206 ilerlemez. ÜretimDONE/yayın veya ana102DONE iddiası yok. E3R1REVIEW/E5IN_PROGRESS/Supabase47-57-59/RET97/runtime/identity/physical/device/release korunur. DEC0068/69 ve kullanıcı standingyetkisi geçerli; birleşmemişDEC0070otorite değil.

## Özgün bütün kaynak incelemesi tam rapor

RAW 14639bayt/SHA256 7e8f88d0848a9a81ef83884d51c3b8de77a4c0525c560d7cdabb8b370d5182ee

<pre>BAĞIMSIZ BÜTÜN KAYNAK GATE İNCELEMESİ — R2
T-E1-014b / FL1.7.1 / F1.7.1 / C1.7 / SCR-037
Tarih: 2026-10-07
İncelemeci: /root/e1014b_r2_whole_review — implementer Root’tan ayrı delegated reviewer
İstenen inceleme bağlamı: gpt-6-luna/max

HÜKÜM: FULL PASS

Bu hüküm yalnızca exact source head üzerinde T-E1-014b’nin sınırlı E1 sunum GATE kabulüdür. Üretim entitlement enforcement, ana görev DONE, PR merge veya release onayı değildir. Bu inceleme repo/PR/task kaydına hüküm yazmadı; T-E1-014b’nin kaynak kaydı REVIEW durumunda kalır.

1. İncelenen özne ve otorite

Repo: C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app
Dal: codex/e1-entitlement-gate
Base / kabul edilmiş main: 2471734750e723ab7af5cb84f6676155ca26960f
SOURCE HEAD: 21d1485157777b0b6d4d8a1a78596abaa8c680e1
Plan otorite pimi: C:\Users\Xpike\Desktop\Kavriva-plan, fa914f013fdcd032faed876689092da245989459
İlgili PR: https://github.com/xpike-dgm/kavriva-app/pull/115 — inceleme anında Draft; CI kayıtları PR 115 ve yukarıdaki kaynak başına bağlı.

Kanonik yöntem P-E1-014b / T-E1-014b’de yazdığı biçimde GATE / HELD-acceptance evaluation’dır; SIMULATION değildir ve üretim izin kapısının açılması değildir. Sabit plan ağacında DEC-0070 bulunmuyor; bu hükümde otorite olarak kullanılmadı. T-E1-014a, kabul edilmiş main’deki tek sert bağımlılıktır. T-E5-003/C5.x kaynak guardıdır, yeni sert DAG bağımlılığı değildir; E3R1 REVIEW ve E5 IN_PROGRESS kalır. Genel görünüm 101 DONE / 105 kalan / 206 toplam olarak değişmez.

Otorite başlangıcında sabit planın PHASE_GATES, TASK_EXECUTION_PROTOCOL (DEC-0068/0069), AI_CODING_PROTOCOL, MODULE_BOUNDARIES, PACK_STANDARD, TASK_INDEX, DEPENDENCY_GRAPH, ACCEPTANCE_MATRIX, feature/user-flow/capability catalogları, SCR-037, FAM-07, STATE_MATRIX, BR-048/049/103/104/106/134/135, DEC-0053 ve ADR-001/004/005 kayıtlarını; repo tabanındaki E10 DESIGN_GATE_CHECKLIST ve DESIGN_REGRESSION_EVIDENCE_RULE kaynaklarını; onaylı J05/SCR-037 v3 referansını karşılaştırdım. T-E1-014b’nin amacı ve sınırı tutarlı: E1 yeni işlem sınırını ve korunan yolları gösterir; gerçek yetkilendirme E3/E5 tarafındadır.

2. Kapsam ve custody

P-E1-014b’deki 14 zorunlu alan ve açık allowed/forbidden boundary tamdır. Base→SOURCE gerçek diff’i tam 14 izinli adresle birebir eşleşti; ekstra veya eksik yol yok. Değişen adresler:
- vault/PROFILES/entitlement-gate-render.md
- vault/PACKS/P-E1-014b.md
- vault/REGISTRY/T-E1-014b.md
- vault/EVIDENCE/E-DEV-113.md
- vault/EVIDENCE/SNAPSHOTS/E-DEV-112-E10-GOVERNED-PATHS-FOR-T-E1-014b.md.snapshot
- vault/EVIDENCE/E-DEV-112.md
- vault/INVENTORIES/E10-GOVERNED-PATHS.md
- modules/e01-app/MANIFEST.md
- .github/workflows/CI_PLAN.md (belge; workflow YAML değişikliği değil)
- vault/INDEX/registry.json
- vault/INDEX/routing.json
- modules/e01-app/internal/shell/lib/entitlement_gate.dart
- modules/e01-app/internal/shell/test/entitlement_gate_test.dart
- modules/e01-app/internal/shell/test/fixtures/entitlement_gate_reading_questions.json

Worktree kaynak head’de temizdi; git diff --check base..head sonucu temiz. Scope manifestindeki 57 base pin’in 57’si de base blob’larıyla SHA-256 düzeyinde eşleşti. Ham v79 governed-paths içeriği 211840 bayt ve SHA-256 eb8d54882d55e1f147f2060a97449dddb10e78c5295354641fc36c9b98075602; E-DEV-112 snapshot’ıyla byte-byte aynı. Kod dosyası 20001 bayt / SHA-256 a38f5df556cbfb65562bbd6e0d46a2fbe0e0baf19788ea0779c0733518814fff; test 36708 bayt / SHA-256 220b36f8ab2b7bca4b6934e485f963de94d0016ebc030862f956f8c1d9e91c38; sabit soru fixture’ı 1632 bayt / SHA-256 6df6a758a90611576c1fcf915cd2e0a277329ccca247d8acc021aec7b039e3e1.

MANIFEST ve inventory yeni tüketici/artifact izini bağlar; registry/routing T-E1-014b kaydını REVIEW, P-E1-014b kaydını IN_PROGRESS ve E-DEV-113 kaydını RECORDED gösterir. Hiçbiri DONE iddiası eklemez. E-DEV-112’nin esas gövdesi ve önceki ret geçmişi korunmuş; yalnız T-E1-014b tüketici izi ve PR114’ün ayrı ikincil kabul makbuzu eklenmiş. Yeni public contract/seam, router, DB/SQL, E3/E5 writer, kimlik, quota/billing, SDK/dependency veya workflow YAML değişikliği görmedim.

3. Önceki ret bulgusu F-01/P1 — kapandı

Önceki bağımsız tam kaynak reddi SOURCE 18fbc51d153acd28a0a55d2a6d5e5f4fe4e467ae için bir P1 bulguydu: pathAllowed korunan yolları readable entitlement planına ve path subject’ini özel plan.subject değerine bağlıyordu; eski callback de plan değişimini korunan okuma izniyle karıştırıyordu. Bu nedenle entitlement kaynağı/planı missing veya geçersizken kendi güncel korunan okuma referansı bulunan yol da kapanıyordu. Bu rapor o eski özne için CHANGES_REQUESTED hükmünü geri çekmez.

21d1485’te F-01 onarımını doğruladım:
- entitlement_gate.dart:92-123 içindeki readable, entitlement planı/otoritesi, dört entitlement-read boyutu ve dört özel alan referansı tam scope/request/purpose/subject/current/confirmed değilse false kalır. Özel motosiklet/plan metni buna bağlı olarak kapalıdır.
- entitlement_gate.dart:125-149 içindeki preservedSubject yalnızca kararlı motorcycle/context/catalog kimlik ve revision alanlarından üretilir. pathAllowed, dört ayrı entitlement-preserved-read referansının her birini ve istenen yol için entitlement-preserved-path referansını tam scope/request/purpose/subject/current/confirmed koşuluyla doğrular. plan.subject veya entitlement özel metni bu doğrulama yolunda yoktur.
- entitlement_gate.dart:151-165 yeni işlem kontrolünü eski ayrı guard’larda tutar: readable plan, online, active/allowed kararı ve altı effect referansı. Handler yoksa veya bu şartlardan biri yoksa kontrol gönderilmez.
- entitlement_gate.dart:196-248 read/garage/support callback’i aynı scope ve request’i, değişmemiş handler’ı ve tıklama anındaki güncel izni tekrar denetler. Read niyetinin subject’i preservedSubject/path; garaj ve destek subject’i boştur. Okuma callback’i planın değişmesini tek başına geçersizleştirmez; scope/request, handler veya kendi güncel yol izni kaybı eski callback’i kapatır.
- Widget özel entitlement alanlarını yalnız readable iken gösterir (:287-349); altı korunan yolun her birini ayrı yol iznine bağlar (:351-392). Yeni kontrol/bağlam seçenekleri yalnız ilgili plan guard’larıyla açılır (:419-434). onIntent yoksa butonlar, Garaja dön dahil, devre dışı kalır (:209-219, :457-511). Bu gerçek sınırı korudum; her butonun tıklanabilir olduğunu veya gerçek navigation bulunduğunu iddia etmiyorum.

Yeni/uyarlanmış testler düzeltmeyi doğrudan doğruluyor: entitlement_gate_test.dart:401-440 yedi missing/no-source/stale/held/unknown/private entitlement çeşidinde altı korunan yola toplam 42 gerçek tap yapıyor; her yolun typed read niyetini ve özel lisans verisinin kapalı kaldığını denetliyor. :441-489 dört kendi okuma boyutunun eksik, yanlış purpose/request/scope/subject, stale, held ve unknown negatiflerinde korunan erişimi kapatıyor. :490-534 entitlement planı yok/değişmiş veya offline olduğunda kendi güncel okuması geçerli eski callback’in çalıştığını; scope/request, okuma veya path revocation durumlarında çalışmadığını doğruluyor. :595-634 entitlement metadata eksikken özel alanları kapalı tutarken ayrı güncel korunan yolu açık bırakıyor. Önceki testlerin ilgili beklenen sonuçları da bu semantiğe göre güncellenmiş. Açık P1/P2/P3 bulgum yok.

4. GATE ve tasarım kabulü

Kanonik SCR-037/FAM-07/STATE_MATRIX kuralı “yeni eylem/kapasite kapatılabilir; truth, history, provenance, correction, safety reach-back ve başlanmış iş güvenli dönüşü lisansla kilitlenemez” şeklinde. Ekran candidate state family’dir; kalıcı paywall route değildir. DEC-0053’ün gösterilen şekli 1 ücretsiz motosiklet, abonelikle toplam 3, aynı anda seçili tek motosiklette tam rehberdir; seçimde hak taşınır, üst üste eklenmez. Fiyat, paket adı, ödeme dönemi, geçiş sıklığı, deneme ve anti-abuse koşulları HELD kalır. Kod ve copy fiziksel uygunluk veya bakımın doğruluğunu abonelikten türetmiyor.

Yedi E10 tasarım kapısını şu kanıtla değerlendirdim:
1. Tam ekran: 25 durum ve tam kaydırma parçaları ekranın içeriğini ve son destek/çıkış bölgesini kapsıyor.
2. Ekranlar arası: Pinned J05/SCR-037 v3 ile ve kabul edilmiş T-E1-014a çalışma DNA’sından açtığım lifecycle/transfer örnekleriyle semantik, temel tipografi ve near-white/navy/amber çalışma dili karşılaştırıldı. Yeni widget nihai ortak layout/token/route olarak sunulmuyor.
3. Durum: güncel fixture ve görsel manifestte 25 durum; lisansın yok/stale/held/unknown/foreign, kendi yol izninin yok/stale/held/unknown, özel alan eksik, offline/başlanmış iş, denied/allowed ve handler yok senaryoları var. Geçersiz kendi okuma yalnız ait olduğu erişimi kapatıyor.
4. Responsive: entitlement_gate_test.dart:1033-1071 25×3 genişlik (320/390/768)×3 text scale (1/2/3) = 225 gerçek widget düzeninde tüm scroll offset’lerini geziyor; overflow/fatal exception ve 52’den küçük hedef arıyor. Ekran kaydı 390×844 Flutter çizim bağlamıdır, gerçek cihaz/OS testi değildir.
5. Erişilebilirlik: entitlement_gate_test.dart:921-1032 gerçek Tab/Enter/Space akışını, header/disabled/live-region semantics’i, çizilmiş metinde 4.5 ve odak kenarında 3 kontrastı sınar. Screen-reader/OS/cihaz testi iddiası yoktur.
6. Regresyon: önceki 299 normal test korunmuş; bu görevle toplam 22 yeni normal test kapsamı 321’e taşımış. Önceki başarısızlık ve ret kayıtları silinmemiş veya PASS diye yeniden adlandırılmamış.
7. Kaynak/varyasyon: J05 pinned referansının byte boyutu/SHA’sı scope kaydıyla eşleşiyor ve kaynak görüntü açıldı (887×1774, 1720052 bayt, SHA-256 3116e28ee8527b114c790dbcffa750f93ed547a7a0eb1886bd147d25a8d64e7c). Current R3 manifestinde 68 capture, 25 durum, 29 eşsiz PNG SHA’sı var; tüm dosyalar mevcut, manifest boyut/SHA ve PNG imzası eşleşiyor, boyutları 390×844. R3’te önceki R2’de olmayan dört ayrı içerik var; bunların tamamını açtım. Eski R2 görüntüleriyle eşitlik/tekrarlar ayrı kaydedilmiş; güncel 68 görüntünün tamamı eski 50 ile eşitmiş gibi raporlanmıyor.

Görsel incelemede missing plan durumunda özel motosiklet/izin metni görünmüyor ve kendi izinli korunan yollar açık; path-private durumunda yalnız ilgili korunan yol kapanıyor; no-handler durumunda Garaja dön ve diğer intent düğmeleri kapalı; handler’lı varyantta Garaja dön baskın. Bu gözlemlerle ilk okuma raporundaki izin/düğme farklılığı açıklaması tutarlı. Ekran görüntüleri tıklama/navigation/kimlik/üretim doğrulaması değildir.

Taze bağımsız ilk okuma dosyası kavriva_e1014b_r2_first_reading.txt (6393 bayt; SHA-256 3a94dad4668fa55b9d52412d3d115aecdd96ee5ca039f19a693eeafa19efc348) ve sabit 13 soru ile uyumlu. Yanıtlar yeni faaliyet sınırını, korunan yolların yine kendi güncel iznine bağlı olduğunu, 1/3/1 DEC-0053 şeklini, fiziksel durumun ayrıca doğrulanacağını ve no-handler’daki kapalı garaj düğmesini doğru sınırlıyor. Bu okuma AI ekran metni/anlamı değerlendirmesidir; insan, OS, screen-reader, çalışan production uygulaması veya task acceptance yerine geçmez.

5. Gerçek aynı-baş CI/T3

Aynı-baş makbuzu kavriva_e1014b_r2source_ci_receipt.md (4019 bayt; SHA-256 244f4770226f6ce106cbdbe4ad1c8627a86b2bdf773daa0c7943a6bc47a578c7) ve job/log JSON’u kavriva_e1014b_r2source_jobs_logs.json (49188 bayt; SHA-256 f8d7e4751972055504ae767a59bf753fc00b703012b8e0361ede27815ed58a0f) üzerinden incelendi. JSON’daki 16 workflow run kaydının tamamı exact head 21d1485…, tamamlanmış SUCCESS olarak işaretli; 8 pull_request + 8 push. 16 RAW log dosyasının her birinin gerçek byte uzunluğu ve SHA-256’sı makbuz/JSON ile eşleşti; uyumsuzluk yok.

- PR architecture-checks run 37564366277: checks job 7/7 başarılı adım; t3-gate job 5/5 gerçek başarılı adım.
- PR E1 run 37564366260: Formatted 34 files (0 changed), No issues found!, 321 tests passed.
- E3 commit auth, E3 live auth, E4 offline, E5 authority, E6 release policy ve E9 bounded proposal PR koşuları da SUCCESS.
- PR T3 logu 112 evidence kaydı taradığını; identity check’in 360 ID / 459 dosya indekslediğini gösteriyor. PR iş akışı checkout’u 4f517ded194212ef41d5c42d4a68e6f1aea5571d sentetik merge commit’idir; kaynak başı 21d1485 ve base 2471734 metadata’sıyla doğrulandı. Push architecture’daki T3 işi SKIPPED/0 adım; T3 kanıtı sayılmadı.

Eski 18fbc source için 17 başarılı CI, bu head için kanıt kabul edilmedi. Bu rapor CI’ı bağımsız reviewer hükmünün yerine koymaz; bu rapor ayrı kaynak incelemesi hükmüdür.

6. Bulgular, tarihçe ve kesin sınır

Güncel SOURCE 21d1485 için açık bulgu: YOK. Önceki 18fbc’deki F-01/P1, bu başta ayrı korunan okuma kaynakları, plan bağımsız subject ve tıklama anı recheck ile kapandı. Eski rapor kavriva_e1014b_whole_review.txt 11890 bayt / SHA-256 726c1908467c4aff5b25e57adce4fd589a45685980fa8edf2ac800f6367e7285 olarak değişmeden duruyor ve yalnız reddedilmiş 18fbc öznesine ait. Eski ilk okuma/R1-R2 graph FAIL günlükleri ve özgün bulgu tarihi korunmuştur.

Aşağıdakiler açık kalır ve bu FULL PASS hükmünü aşmaz: E1 fixture’ındaki olumlu referanslar gerçek kullanıcı/üretim izin kaynağı değildir; korunan yol hâlâ kendi güncel okuma iznini ister; handler yoksa garaj butonu görünür ama devre dışıdır; ekran capture’ı gerçek navigation veya tıklama kanıtı değildir. Gerçek router/nav, E3/E5 authority, identity, quota, billing, entitlement writer, DB, fiziksel durum ve recovery üreticisi, gerçek cihaz/OS/screen-reader, nihai token/logo/font/modalite ve release/hosted production kabulü HELD’dir. E3R1 REVIEW, E5 IN_PROGRESS, T-E1-014b kayıtları REVIEW/RECORDED; genel 101/105/206 görünümü aynı kalır.

Sonuç: 21d1485 başında T-E1-014b’nin sınırlı E1 sunum GATE kaynağına ilişkin bağımsız inceleme FULL PASS’tır. Bu rapor task’ı DONE yapmaz, yeni bağımlılık/feature kararı vermez, merge veya üretim aktivasyonu yetkisi oluşturmaz. DEC-0069 uyarınca bu, ayrı delegated review hükmüdür; owner-side acceptance/status kaydı bu dosyanın yazımıyla otomatik yapılmış sayılmaz.</pre>

## Özgün bütün kaynak raporu RAW Base64

```base64
QkHEnklNU0laIELDnFTDnE4gS0FZTkFLIEdBVEUgxLBOQ0VMRU1FU8SwIOKAlCBSMgpULUUxLTAxNGIgLyBGTDEuNy4xIC8gRjEuNy4xIC8gQzEuNyAvIFNDUi0wMzcKVGFyaWg6IDIwMjYtMTAtMDcKxLBuY2VsZW1lY2k6IC9yb290L2UxMDE0Yl9yMl93aG9sZV9yZXZpZXcg4oCUIGltcGxlbWVudGVyIFJvb3TigJl0YW4gYXlyxLEgZGVsZWdhdGVkIHJldmlld2VyCsSwc3RlbmVuIGluY2VsZW1lIGJhxJ9sYW3EsTogZ3B0LTYtbHVuYS9tYXgKCkjDnEvDnE06IEZVTEwgUEFTUwoKQnUgaMO8a8O8bSB5YWxuxLF6Y2EgZXhhY3Qgc291cmNlIGhlYWQgw7x6ZXJpbmRlIFQtRTEtMDE0YuKAmW5pbiBzxLFuxLFybMSxIEUxIHN1bnVtIEdBVEUga2FidWzDvGTDvHIuIMOccmV0aW0gZW50aXRsZW1lbnQgZW5mb3JjZW1lbnQsIGFuYSBnw7ZyZXYgRE9ORSwgUFIgbWVyZ2UgdmV5YSByZWxlYXNlIG9uYXnEsSBkZcSfaWxkaXIuIEJ1IGluY2VsZW1lIHJlcG8vUFIvdGFzayBrYXlkxLFuYSBow7xrw7xtIHlhem1hZMSxOyBULUUxLTAxNGLigJluaW4ga2F5bmFrIGtheWTEsSBSRVZJRVcgZHVydW11bmRhIGthbMSxci4KCjEuIMSwbmNlbGVuZW4gw7Z6bmUgdmUgb3Rvcml0ZQoKUmVwbzogQzpcVXNlcnNcWHBpa2VcLmNvZGV4XHdvcmt0cmVlc1xlNC1yZXF1aXJlZC1hdXRvLXRyYW5zZmVyXGthdnJpdmEtYXBwCkRhbDogY29kZXgvZTEtZW50aXRsZW1lbnQtZ2F0ZQpCYXNlIC8ga2FidWwgZWRpbG1pxZ8gbWFpbjogMjQ3MTczNDc1MGU3MjNhYjdhZjVjYjg0ZjY2NzYxNTVjYTI2OTYwZgpTT1VSQ0UgSEVBRDogMjFkMTQ4NTE1Nzc3N2IwYjZkNGQ4YTFhNzg1OTZhYmFhOGM2ODBlMQpQbGFuIG90b3JpdGUgcGltaTogQzpcVXNlcnNcWHBpa2VcRGVza3RvcFxLYXZyaXZhLXBsYW4sIGZhOTE0ZjAxM2ZkY2QwMzJmYWVkODc2Njg5MDkyZGEyNDU5ODk0NTkKxLBsZ2lsaSBQUjogaHR0cHM6Ly9naXRodWIuY29tL3hwaWtlLWRnbS9rYXZyaXZhLWFwcC9wdWxsLzExNSDigJQgaW5jZWxlbWUgYW7EsW5kYSBEcmFmdDsgQ0kga2F5xLF0bGFyxLEgUFIgMTE1IHZlIHl1a2FyxLFkYWtpIGtheW5hayBiYcWfxLFuYSBiYcSfbMSxLgoKS2Fub25payB5w7ZudGVtIFAtRTEtMDE0YiAvIFQtRTEtMDE0YuKAmWRlIHlhemTEscSfxLEgYmnDp2ltZGUgR0FURSAvIEhFTEQtYWNjZXB0YW5jZSBldmFsdWF0aW9u4oCZZMSxcjsgU0lNVUxBVElPTiBkZcSfaWxkaXIgdmUgw7xyZXRpbSBpemluIGthcMSxc8SxbsSxbiBhw6fEsWxtYXPEsSBkZcSfaWxkaXIuIFNhYml0IHBsYW4gYcSfYWPEsW5kYSBERUMtMDA3MCBidWx1bm11eW9yOyBidSBow7xrw7xtZGUgb3Rvcml0ZSBvbGFyYWsga3VsbGFuxLFsbWFkxLEuIFQtRTEtMDE0YSwga2FidWwgZWRpbG1pxZ8gbWFpbuKAmWRla2kgdGVrIHNlcnQgYmHEn8SxbWzEsWzEsWt0xLFyLiBULUU1LTAwMy9DNS54IGtheW5hayBndWFyZMSxZMSxciwgeWVuaSBzZXJ0IERBRyBiYcSfxLFtbMSxbMSxxJ/EsSBkZcSfaWxkaXI7IEUzUjEgUkVWSUVXIHZlIEU1IElOX1BST0dSRVNTIGthbMSxci4gR2VuZWwgZ8O2csO8bsO8bSAxMDEgRE9ORSAvIDEwNSBrYWxhbiAvIDIwNiB0b3BsYW0gb2xhcmFrIGRlxJ9pxZ9tZXouCgpPdG9yaXRlIGJhxZ9sYW5nxLFjxLFuZGEgc2FiaXQgcGxhbsSxbiBQSEFTRV9HQVRFUywgVEFTS19FWEVDVVRJT05fUFJPVE9DT0wgKERFQy0wMDY4LzAwNjkpLCBBSV9DT0RJTkdfUFJPVE9DT0wsIE1PRFVMRV9CT1VOREFSSUVTLCBQQUNLX1NUQU5EQVJELCBUQVNLX0lOREVYLCBERVBFTkRFTkNZX0dSQVBILCBBQ0NFUFRBTkNFX01BVFJJWCwgZmVhdHVyZS91c2VyLWZsb3cvY2FwYWJpbGl0eSBjYXRhbG9nbGFyxLEsIFNDUi0wMzcsIEZBTS0wNywgU1RBVEVfTUFUUklYLCBCUi0wNDgvMDQ5LzEwMy8xMDQvMTA2LzEzNC8xMzUsIERFQy0wMDUzIHZlIEFEUi0wMDEvMDA0LzAwNSBrYXnEsXRsYXLEsW7EsTsgcmVwbyB0YWJhbsSxbmRha2kgRTEwIERFU0lHTl9HQVRFX0NIRUNLTElTVCB2ZSBERVNJR05fUkVHUkVTU0lPTl9FVklERU5DRV9SVUxFIGtheW5ha2xhcsSxbsSxOyBvbmF5bMSxIEowNS9TQ1ItMDM3IHYzIHJlZmVyYW5zxLFuxLEga2FyxZ/EsWxhxZ90xLFyZMSxbS4gVC1FMS0wMTRi4oCZbmluIGFtYWPEsSB2ZSBzxLFuxLFyxLEgdHV0YXJsxLE6IEUxIHllbmkgacWfbGVtIHPEsW7EsXLEsW7EsSB2ZSBrb3J1bmFuIHlvbGxhcsSxIGfDtnN0ZXJpcjsgZ2Vyw6dlayB5ZXRraWxlbmRpcm1lIEUzL0U1IHRhcmFmxLFuZGFkxLFyLgoKMi4gS2Fwc2FtIHZlIGN1c3RvZHkKClAtRTEtMDE0YuKAmWRla2kgMTQgem9ydW5sdSBhbGFuIHZlIGHDp8SxayBhbGxvd2VkL2ZvcmJpZGRlbiBib3VuZGFyeSB0YW1kxLFyLiBCYXNl4oaSU09VUkNFIGdlcsOnZWsgZGlmZuKAmWkgdGFtIDE0IGl6aW5saSBhZHJlc2xlIGJpcmViaXIgZcWfbGXFn3RpOyBla3N0cmEgdmV5YSBla3NpayB5b2wgeW9rLiBEZcSfacWfZW4gYWRyZXNsZXI6Ci0gdmF1bHQvUFJPRklMRVMvZW50aXRsZW1lbnQtZ2F0ZS1yZW5kZXIubWQKLSB2YXVsdC9QQUNLUy9QLUUxLTAxNGIubWQKLSB2YXVsdC9SRUdJU1RSWS9ULUUxLTAxNGIubWQKLSB2YXVsdC9FVklERU5DRS9FLURFVi0xMTMubWQKLSB2YXVsdC9FVklERU5DRS9TTkFQU0hPVFMvRS1ERVYtMTEyLUUxMC1HT1ZFUk5FRC1QQVRIUy1GT1ItVC1FMS0wMTRiLm1kLnNuYXBzaG90Ci0gdmF1bHQvRVZJREVOQ0UvRS1ERVYtMTEyLm1kCi0gdmF1bHQvSU5WRU5UT1JJRVMvRTEwLUdPVkVSTkVELVBBVEhTLm1kCi0gbW9kdWxlcy9lMDEtYXBwL01BTklGRVNULm1kCi0gLmdpdGh1Yi93b3JrZmxvd3MvQ0lfUExBTi5tZCAoYmVsZ2U7IHdvcmtmbG93IFlBTUwgZGXEn2nFn2lrbGnEn2kgZGXEn2lsKQotIHZhdWx0L0lOREVYL3JlZ2lzdHJ5Lmpzb24KLSB2YXVsdC9JTkRFWC9yb3V0aW5nLmpzb24KLSBtb2R1bGVzL2UwMS1hcHAvaW50ZXJuYWwvc2hlbGwvbGliL2VudGl0bGVtZW50X2dhdGUuZGFydAotIG1vZHVsZXMvZTAxLWFwcC9pbnRlcm5hbC9zaGVsbC90ZXN0L2VudGl0bGVtZW50X2dhdGVfdGVzdC5kYXJ0Ci0gbW9kdWxlcy9lMDEtYXBwL2ludGVybmFsL3NoZWxsL3Rlc3QvZml4dHVyZXMvZW50aXRsZW1lbnRfZ2F0ZV9yZWFkaW5nX3F1ZXN0aW9ucy5qc29uCgpXb3JrdHJlZSBrYXluYWsgaGVhZOKAmWRlIHRlbWl6ZGk7IGdpdCBkaWZmIC0tY2hlY2sgYmFzZS4uaGVhZCBzb251Y3UgdGVtaXouIFNjb3BlIG1hbmlmZXN0aW5kZWtpIDU3IGJhc2UgcGlu4oCZaW4gNTfigJlzaSBkZSBiYXNlIGJsb2LigJlsYXLEsXlsYSBTSEEtMjU2IGTDvHpleWluZGUgZcWfbGXFn3RpLiBIYW0gdjc5IGdvdmVybmVkLXBhdGhzIGnDp2VyacSfaSAyMTE4NDAgYmF5dCB2ZSBTSEEtMjU2IGViOGQ1NDg4MmQ1NWUxZjE0N2YyMDYwYTk3NDQ5ZGRkYjEwZTc4YzUyOTUzNTQ2NDFmYzM2YzliOTgwNzU2MDI7IEUtREVWLTExMiBzbmFwc2hvdOKAmcSxeWxhIGJ5dGUtYnl0ZSBheW7EsS4gS29kIGRvc3lhc8SxIDIwMDAxIGJheXQgLyBTSEEtMjU2IGEzOGY1ZGY1NTZjYmZiNjU1NjJiYmQ2ZTBkNDZhMmZiZTBlMGJhZjE5Nzg4ZWEwNzc5YzA3MzM1MTg4MTRmZmY7IHRlc3QgMzY3MDggYmF5dCAvIFNIQS0yNTYgMjIwYjM2ZjhhYjJiN2JjYTRiNjkzNGU0ODVmOTYzZGU5NGQwMDE2ZWJjMDMwODYyZjk1NmY4YzFkOWU5MWMzODsgc2FiaXQgc29ydSBmaXh0dXJl4oCZxLEgMTYzMiBiYXl0IC8gU0hBLTI1NiA2ZGY2YTc1OGE5MDYxMTU3NmMxZmNmOTE1Y2QyZTBhMjc3MzI5Y2NjYTI0N2Q4YWNjMDIxYWVjN2IwMzllM2UxLgoKTUFOSUZFU1QgdmUgaW52ZW50b3J5IHllbmkgdMO8a2V0aWNpL2FydGlmYWN0IGl6aW5pIGJhxJ9sYXI7IHJlZ2lzdHJ5L3JvdXRpbmcgVC1FMS0wMTRiIGtheWTEsW7EsSBSRVZJRVcsIFAtRTEtMDE0YiBrYXlkxLFuxLEgSU5fUFJPR1JFU1MgdmUgRS1ERVYtMTEzIGtheWTEsW7EsSBSRUNPUkRFRCBnw7ZzdGVyaXIuIEhpw6diaXJpIERPTkUgaWRkaWFzxLEgZWtsZW1lei4gRS1ERVYtMTEy4oCZbmluIGVzYXMgZ8O2dmRlc2kgdmUgw7ZuY2VraSByZXQgZ2XDp21pxZ9pIGtvcnVubXXFnzsgeWFsbsSxeiBULUUxLTAxNGIgdMO8a2V0aWNpIGl6aSB2ZSBQUjExNOKAmcO8biBheXLEsSBpa2luY2lsIGthYnVsIG1ha2J1enUgZWtsZW5tacWfLiBZZW5pIHB1YmxpYyBjb250cmFjdC9zZWFtLCByb3V0ZXIsIERCL1NRTCwgRTMvRTUgd3JpdGVyLCBraW1saWssIHF1b3RhL2JpbGxpbmcsIFNESy9kZXBlbmRlbmN5IHZleWEgd29ya2Zsb3cgWUFNTCBkZcSfacWfaWtsacSfaSBnw7ZybWVkaW0uCgozLiDDlm5jZWtpIHJldCBidWxndXN1IEYtMDEvUDEg4oCUIGthcGFuZMSxCgrDlm5jZWtpIGJhxJ/EsW1zxLF6IHRhbSBrYXluYWsgcmVkZGkgU09VUkNFIDE4ZmJjNTFkMTUzYWNkMjhhMGE1NWQyYTZkNWU1ZjRmZTRlNDY3YWUgacOnaW4gYmlyIFAxIGJ1bGd1eWR1OiBwYXRoQWxsb3dlZCBrb3J1bmFuIHlvbGxhcsSxIHJlYWRhYmxlIGVudGl0bGVtZW50IHBsYW7EsW5hIHZlIHBhdGggc3ViamVjdOKAmWluaSDDtnplbCBwbGFuLnN1YmplY3QgZGXEn2VyaW5lIGJhxJ9sxLF5b3JkdTsgZXNraSBjYWxsYmFjayBkZSBwbGFuIGRlxJ9pxZ9pbWluaSBrb3J1bmFuIG9rdW1hIGl6bml5bGUga2FyxLHFn3TEsXLEsXlvcmR1LiBCdSBuZWRlbmxlIGVudGl0bGVtZW50IGtheW5hxJ/EsS9wbGFuxLEgbWlzc2luZyB2ZXlhIGdlw6dlcnNpemtlbiBrZW5kaSBnw7xuY2VsIGtvcnVuYW4gb2t1bWEgcmVmZXJhbnPEsSBidWx1bmFuIHlvbCBkYSBrYXBhbsSxeW9yZHUuIEJ1IHJhcG9yIG8gZXNraSDDtnpuZSBpw6dpbiBDSEFOR0VTX1JFUVVFU1RFRCBow7xrbcO8bsO8IGdlcmkgw6dla21lei4KCjIxZDE0ODXigJl0ZSBGLTAxIG9uYXLEsW3EsW7EsSBkb8SfcnVsYWTEsW06Ci0gZW50aXRsZW1lbnRfZ2F0ZS5kYXJ0OjkyLTEyMyBpw6dpbmRla2kgcmVhZGFibGUsIGVudGl0bGVtZW50IHBsYW7EsS9vdG9yaXRlc2ksIGTDtnJ0IGVudGl0bGVtZW50LXJlYWQgYm95dXR1IHZlIGTDtnJ0IMO2emVsIGFsYW4gcmVmZXJhbnPEsSB0YW0gc2NvcGUvcmVxdWVzdC9wdXJwb3NlL3N1YmplY3QvY3VycmVudC9jb25maXJtZWQgZGXEn2lsc2UgZmFsc2Uga2FsxLFyLiDDlnplbCBtb3Rvc2lrbGV0L3BsYW4gbWV0bmkgYnVuYSBiYcSfbMSxIG9sYXJhayBrYXBhbMSxZMSxci4KLSBlbnRpdGxlbWVudF9nYXRlLmRhcnQ6MTI1LTE0OSBpw6dpbmRla2kgcHJlc2VydmVkU3ViamVjdCB5YWxuxLF6Y2Ega2FyYXJsxLEgbW90b3JjeWNsZS9jb250ZXh0L2NhdGFsb2cga2ltbGlrIHZlIHJldmlzaW9uIGFsYW5sYXLEsW5kYW4gw7xyZXRpbGlyLiBwYXRoQWxsb3dlZCwgZMO2cnQgYXlyxLEgZW50aXRsZW1lbnQtcHJlc2VydmVkLXJlYWQgcmVmZXJhbnPEsW7EsW4gaGVyIGJpcmluaSB2ZSBpc3RlbmVuIHlvbCBpw6dpbiBlbnRpdGxlbWVudC1wcmVzZXJ2ZWQtcGF0aCByZWZlcmFuc8SxbsSxIHRhbSBzY29wZS9yZXF1ZXN0L3B1cnBvc2Uvc3ViamVjdC9jdXJyZW50L2NvbmZpcm1lZCBrb8WfdWx1eWxhIGRvxJ9ydWxhci4gcGxhbi5zdWJqZWN0IHZleWEgZW50aXRsZW1lbnQgw7Z6ZWwgbWV0bmkgYnUgZG/En3J1bGFtYSB5b2x1bmRhIHlva3R1ci4KLSBlbnRpdGxlbWVudF9nYXRlLmRhcnQ6MTUxLTE2NSB5ZW5pIGnFn2xlbSBrb250cm9sw7xuw7wgZXNraSBheXLEsSBndWFyZOKAmWxhcmRhIHR1dGFyOiByZWFkYWJsZSBwbGFuLCBvbmxpbmUsIGFjdGl2ZS9hbGxvd2VkIGthcmFyxLEgdmUgYWx0xLEgZWZmZWN0IHJlZmVyYW5zxLEuIEhhbmRsZXIgeW9rc2EgdmV5YSBidSDFn2FydGxhcmRhbiBiaXJpIHlva3NhIGtvbnRyb2wgZ8O2bmRlcmlsbWV6LgotIGVudGl0bGVtZW50X2dhdGUuZGFydDoxOTYtMjQ4IHJlYWQvZ2FyYWdlL3N1cHBvcnQgY2FsbGJhY2vigJlpIGF5bsSxIHNjb3BlIHZlIHJlcXVlc3TigJlpLCBkZcSfacWfbWVtacWfIGhhbmRsZXLigJnEsSB2ZSB0xLFrbGFtYSBhbsSxbmRha2kgZ8O8bmNlbCBpem5pIHRla3JhciBkZW5ldGxlci4gUmVhZCBuaXlldGluaW4gc3ViamVjdOKAmWkgcHJlc2VydmVkU3ViamVjdC9wYXRoOyBnYXJhaiB2ZSBkZXN0ZWsgc3ViamVjdOKAmWkgYm/Fn3R1ci4gT2t1bWEgY2FsbGJhY2vigJlpIHBsYW7EsW4gZGXEn2nFn21lc2luaSB0ZWsgYmHFn8SxbmEgZ2XDp2Vyc2l6bGXFn3Rpcm1lejsgc2NvcGUvcmVxdWVzdCwgaGFuZGxlciB2ZXlhIGtlbmRpIGfDvG5jZWwgeW9sIGl6bmkga2F5YsSxIGVza2kgY2FsbGJhY2vigJlpIGthcGF0xLFyLgotIFdpZGdldCDDtnplbCBlbnRpdGxlbWVudCBhbGFubGFyxLFuxLEgeWFsbsSxeiByZWFkYWJsZSBpa2VuIGfDtnN0ZXJpciAoOjI4Ny0zNDkpOyBhbHTEsSBrb3J1bmFuIHlvbHVuIGhlciBiaXJpbmkgYXlyxLEgeW9sIGl6bmluZSBiYcSfbGFyICg6MzUxLTM5MikuIFllbmkga29udHJvbC9iYcSfbGFtIHNlw6dlbmVrbGVyaSB5YWxuxLF6IGlsZ2lsaSBwbGFuIGd1YXJk4oCZbGFyxLF5bGEgYcOnxLFsxLFyICg6NDE5LTQzNCkuIG9uSW50ZW50IHlva3NhIGJ1dG9ubGFyLCBHYXJhamEgZMO2biBkYWhpbCwgZGV2cmUgZMSxxZ/EsSBrYWzEsXIgKDoyMDktMjE5LCA6NDU3LTUxMSkuIEJ1IGdlcsOnZWsgc8SxbsSxcsSxIGtvcnVkdW07IGhlciBidXRvbnVuIHTEsWtsYW5hYmlsaXIgb2xkdcSfdW51IHZleWEgZ2Vyw6dlayBuYXZpZ2F0aW9uIGJ1bHVuZHXEn3VudSBpZGRpYSBldG1peW9ydW0uCgpZZW5pL3V5YXJsYW5txLHFnyB0ZXN0bGVyIGTDvHplbHRtZXlpIGRvxJ9ydWRhbiBkb8SfcnVsdXlvcjogZW50aXRsZW1lbnRfZ2F0ZV90ZXN0LmRhcnQ6NDAxLTQ0MCB5ZWRpIG1pc3Npbmcvbm8tc291cmNlL3N0YWxlL2hlbGQvdW5rbm93bi9wcml2YXRlIGVudGl0bGVtZW50IMOnZcWfaWRpbmRlIGFsdMSxIGtvcnVuYW4geW9sYSB0b3BsYW0gNDIgZ2Vyw6dlayB0YXAgeWFwxLF5b3I7IGhlciB5b2x1biB0eXBlZCByZWFkIG5peWV0aW5pIHZlIMO2emVsIGxpc2FucyB2ZXJpc2luaW4ga2FwYWzEsSBrYWxkxLHEn8SxbsSxIGRlbmV0bGl5b3IuIDo0NDEtNDg5IGTDtnJ0IGtlbmRpIG9rdW1hIGJveXV0dW51biBla3NpaywgeWFubMSxxZ8gcHVycG9zZS9yZXF1ZXN0L3Njb3BlL3N1YmplY3QsIHN0YWxlLCBoZWxkIHZlIHVua25vd24gbmVnYXRpZmxlcmluZGUga29ydW5hbiBlcmnFn2ltaSBrYXBhdMSxeW9yLiA6NDkwLTUzNCBlbnRpdGxlbWVudCBwbGFuxLEgeW9rL2RlxJ9pxZ9tacWfIHZleWEgb2ZmbGluZSBvbGR1xJ91bmRhIGtlbmRpIGfDvG5jZWwgb2t1bWFzxLEgZ2XDp2VybGkgZXNraSBjYWxsYmFja+KAmWluIMOnYWzEscWfdMSxxJ/EsW7EsTsgc2NvcGUvcmVxdWVzdCwgb2t1bWEgdmV5YSBwYXRoIHJldm9jYXRpb24gZHVydW1sYXLEsW5kYSDDp2FsxLHFn21hZMSxxJ/EsW7EsSBkb8SfcnVsdXlvci4gOjU5NS02MzQgZW50aXRsZW1lbnQgbWV0YWRhdGEgZWtzaWtrZW4gw7Z6ZWwgYWxhbmxhcsSxIGthcGFsxLEgdHV0YXJrZW4gYXlyxLEgZ8O8bmNlbCBrb3J1bmFuIHlvbHUgYcOnxLFrIGLEsXJha8SxeW9yLiDDlm5jZWtpIHRlc3RsZXJpbiBpbGdpbGkgYmVrbGVuZW4gc29udcOnbGFyxLEgZGEgYnUgc2VtYW50acSfZSBnw7ZyZSBnw7xuY2VsbGVubWnFny4gQcOnxLFrIFAxL1AyL1AzIGJ1bGd1bSB5b2suCgo0LiBHQVRFIHZlIHRhc2FyxLFtIGthYnVsw7wKCkthbm9uaWsgU0NSLTAzNy9GQU0tMDcvU1RBVEVfTUFUUklYIGt1cmFsxLEg4oCceWVuaSBleWxlbS9rYXBhc2l0ZSBrYXBhdMSxbGFiaWxpcjsgdHJ1dGgsIGhpc3RvcnksIHByb3ZlbmFuY2UsIGNvcnJlY3Rpb24sIHNhZmV0eSByZWFjaC1iYWNrIHZlIGJhxZ9sYW5txLHFnyBpxZ8gZ8O8dmVubGkgZMO2bsO8xZ/DvCBsaXNhbnNsYSBraWxpdGxlbmVtZXrigJ0gxZ9la2xpbmRlLiBFa3JhbiBjYW5kaWRhdGUgc3RhdGUgZmFtaWx54oCZZGlyOyBrYWzEsWPEsSBwYXl3YWxsIHJvdXRlIGRlxJ9pbGRpci4gREVDLTAwNTPigJnDvG4gZ8O2c3RlcmlsZW4gxZ9la2xpIDEgw7xjcmV0c2l6IG1vdG9zaWtsZXQsIGFib25lbGlrbGUgdG9wbGFtIDMsIGF5bsSxIGFuZGEgc2XDp2lsaSB0ZWsgbW90b3Npa2xldHRlIHRhbSByZWhiZXJkaXI7IHNlw6dpbWRlIGhhayB0YcWfxLFuxLFyLCDDvHN0IMO8c3RlIGVrbGVubWV6LiBGaXlhdCwgcGFrZXQgYWTEsSwgw7ZkZW1lIGTDtm5lbWksIGdlw6dpxZ8gc8Sxa2zEscSfxLEsIGRlbmVtZSB2ZSBhbnRpLWFidXNlIGtvxZ91bGxhcsSxIEhFTEQga2FsxLFyLiBLb2QgdmUgY29weSBmaXppa3NlbCB1eWd1bmx1ayB2ZXlhIGJha8SxbcSxbiBkb8SfcnVsdcSfdW51IGFib25lbGlrdGVuIHTDvHJldG1peW9yLgoKWWVkaSBFMTAgdGFzYXLEsW0ga2FwxLFzxLFuxLEgxZ91IGthbsSxdGxhIGRlxJ9lcmxlbmRpcmRpbToKMS4gVGFtIGVrcmFuOiAyNSBkdXJ1bSB2ZSB0YW0ga2F5ZMSxcm1hIHBhcsOnYWxhcsSxIGVrcmFuxLFuIGnDp2VyacSfaW5pIHZlIHNvbiBkZXN0ZWsvw6fEsWvEscWfIGLDtmxnZXNpbmkga2Fwc8SxeW9yLgoyLiBFa3JhbmxhciBhcmFzxLE6IFBpbm5lZCBKMDUvU0NSLTAzNyB2MyBpbGUgdmUga2FidWwgZWRpbG1pxZ8gVC1FMS0wMTRhIMOnYWzEscWfbWEgRE5B4oCZc8SxbmRhbiBhw6d0xLHEn8SxbSBsaWZlY3ljbGUvdHJhbnNmZXIgw7ZybmVrbGVyaXlsZSBzZW1hbnRpaywgdGVtZWwgdGlwb2dyYWZpIHZlIG5lYXItd2hpdGUvbmF2eS9hbWJlciDDp2FsxLHFn21hIGRpbGkga2FyxZ/EsWxhxZ90xLFyxLFsZMSxLiBZZW5pIHdpZGdldCBuaWhhaSBvcnRhayBsYXlvdXQvdG9rZW4vcm91dGUgb2xhcmFrIHN1bnVsbXV5b3IuCjMuIER1cnVtOiBnw7xuY2VsIGZpeHR1cmUgdmUgZ8O2cnNlbCBtYW5pZmVzdHRlIDI1IGR1cnVtOyBsaXNhbnPEsW4geW9rL3N0YWxlL2hlbGQvdW5rbm93bi9mb3JlaWduLCBrZW5kaSB5b2wgaXpuaW5pbiB5b2svc3RhbGUvaGVsZC91bmtub3duLCDDtnplbCBhbGFuIGVrc2lrLCBvZmZsaW5lL2JhxZ9sYW5txLHFnyBpxZ8sIGRlbmllZC9hbGxvd2VkIHZlIGhhbmRsZXIgeW9rIHNlbmFyeW9sYXLEsSB2YXIuIEdlw6dlcnNpeiBrZW5kaSBva3VtYSB5YWxuxLF6IGFpdCBvbGR1xJ91IGVyacWfaW1pIGthcGF0xLF5b3IuCjQuIFJlc3BvbnNpdmU6IGVudGl0bGVtZW50X2dhdGVfdGVzdC5kYXJ0OjEwMzMtMTA3MSAyNcOXMyBnZW5pxZ9saWsgKDMyMC8zOTAvNzY4KcOXMyB0ZXh0IHNjYWxlICgxLzIvMykgPSAyMjUgZ2Vyw6dlayB3aWRnZXQgZMO8emVuaW5kZSB0w7xtIHNjcm9sbCBvZmZzZXTigJlsZXJpbmkgZ2V6aXlvcjsgb3ZlcmZsb3cvZmF0YWwgZXhjZXB0aW9uIHZlIDUy4oCZZGVuIGvDvMOnw7xrIGhlZGVmIGFyxLF5b3IuIEVrcmFuIGtheWTEsSAzOTDDlzg0NCBGbHV0dGVyIMOnaXppbSBiYcSfbGFtxLFkxLFyLCBnZXLDp2VrIGNpaGF6L09TIHRlc3RpIGRlxJ9pbGRpci4KNS4gRXJpxZ9pbGViaWxpcmxpazogZW50aXRsZW1lbnRfZ2F0ZV90ZXN0LmRhcnQ6OTIxLTEwMzIgZ2Vyw6dlayBUYWIvRW50ZXIvU3BhY2UgYWvEscWfxLFuxLEsIGhlYWRlci9kaXNhYmxlZC9saXZlLXJlZ2lvbiBzZW1hbnRpY3PigJlpLCDDp2l6aWxtacWfIG1ldGluZGUgNC41IHZlIG9kYWsga2VuYXLEsW5kYSAzIGtvbnRyYXN0xLEgc8SxbmFyLiBTY3JlZW4tcmVhZGVyL09TL2NpaGF6IHRlc3RpIGlkZGlhc8SxIHlva3R1ci4KNi4gUmVncmVzeW9uOiDDtm5jZWtpIDI5OSBub3JtYWwgdGVzdCBrb3J1bm11xZ87IGJ1IGfDtnJldmxlIHRvcGxhbSAyMiB5ZW5pIG5vcm1hbCB0ZXN0IGthcHNhbcSxIDMyMeKAmWUgdGHFn8SxbcSxxZ8uIMOWbmNla2kgYmHFn2FyxLFzxLF6bMSxayB2ZSByZXQga2F5xLF0bGFyxLEgc2lsaW5tZW1pxZ8gdmV5YSBQQVNTIGRpeWUgeWVuaWRlbiBhZGxhbmTEsXLEsWxtYW3EscWfLgo3LiBLYXluYWsvdmFyeWFzeW9uOiBKMDUgcGlubmVkIHJlZmVyYW5zxLFuxLFuIGJ5dGUgYm95dXR1L1NIQeKAmXPEsSBzY29wZSBrYXlkxLF5bGEgZcWfbGXFn2l5b3IgdmUga2F5bmFrIGfDtnLDvG50w7wgYcOnxLFsZMSxICg4ODfDlzE3NzQsIDE3MjAwNTIgYmF5dCwgU0hBLTI1NiAzMTE2ZTI4ZWU4NTI3YjExNGM3OTBkYmNmZmE3NTBmOTNlZDU0N2E3YTBlYjE4ODZiZDE0N2QyNWE4ZDY0ZTdjKS4gQ3VycmVudCBSMyBtYW5pZmVzdGluZGUgNjggY2FwdHVyZSwgMjUgZHVydW0sIDI5IGXFn3NpeiBQTkcgU0hB4oCZc8SxIHZhcjsgdMO8bSBkb3N5YWxhciBtZXZjdXQsIG1hbmlmZXN0IGJveXV0L1NIQSB2ZSBQTkcgaW16YXPEsSBlxZ9sZcWfaXlvciwgYm95dXRsYXLEsSAzOTDDlzg0NC4gUjPigJl0ZSDDtm5jZWtpIFIy4oCZZGUgb2xtYXlhbiBkw7ZydCBheXLEsSBpw6dlcmlrIHZhcjsgYnVubGFyxLFuIHRhbWFtxLFuxLEgYcOndMSxbS4gRXNraSBSMiBnw7Zyw7xudMO8bGVyaXlsZSBlxZ9pdGxpay90ZWtyYXJsYXIgYXlyxLEga2F5ZGVkaWxtacWfOyBnw7xuY2VsIDY4IGfDtnLDvG50w7xuw7xuIHRhbWFtxLEgZXNraSA1MCBpbGUgZcWfaXRtacWfIGdpYmkgcmFwb3JsYW5txLF5b3IuCgpHw7Zyc2VsIGluY2VsZW1lZGUgbWlzc2luZyBwbGFuIGR1cnVtdW5kYSDDtnplbCBtb3Rvc2lrbGV0L2l6aW4gbWV0bmkgZ8O2csO8bm3DvHlvciB2ZSBrZW5kaSBpemlubGkga29ydW5hbiB5b2xsYXIgYcOnxLFrOyBwYXRoLXByaXZhdGUgZHVydW11bmRhIHlhbG7EsXogaWxnaWxpIGtvcnVuYW4geW9sIGthcGFuxLF5b3I7IG5vLWhhbmRsZXIgZHVydW11bmRhIEdhcmFqYSBkw7ZuIHZlIGRpxJ9lciBpbnRlbnQgZMO8xJ9tZWxlcmkga2FwYWzEsTsgaGFuZGxlcuKAmWzEsSB2YXJ5YW50dGEgR2FyYWphIGTDtm4gYmFza8Sxbi4gQnUgZ8O2emxlbWxlcmxlIGlsayBva3VtYSByYXBvcnVuZGFraSBpemluL2TDvMSfbWUgZmFya2zEsWzEscSfxLEgYcOnxLFrbGFtYXPEsSB0dXRhcmzEsS4gRWtyYW4gZ8O2csO8bnTDvGxlcmkgdMSxa2xhbWEvbmF2aWdhdGlvbi9raW1saWsvw7xyZXRpbSBkb8SfcnVsYW1hc8SxIGRlxJ9pbGRpci4KClRhemUgYmHEn8SxbXPEsXogaWxrIG9rdW1hIGRvc3lhc8SxIGthdnJpdmFfZTEwMTRiX3IyX2ZpcnN0X3JlYWRpbmcudHh0ICg2MzkzIGJheXQ7IFNIQS0yNTYgM2E5NGRhZDQ2NjhmYTU1YjlkNTI0MTJkM2QxMTVhZWNkZDk2ZWU1Y2EwMzlmMTlhNjkzZWVhZmExOWVmYzM0OCkgdmUgc2FiaXQgMTMgc29ydSBpbGUgdXl1bWx1LiBZYW7EsXRsYXIgeWVuaSBmYWFsaXlldCBzxLFuxLFyxLFuxLEsIGtvcnVuYW4geW9sbGFyxLFuIHlpbmUga2VuZGkgZ8O8bmNlbCBpem5pbmUgYmHEn2zEsSBvbGR1xJ91bnUsIDEvMy8xIERFQy0wMDUzIMWfZWtsaW5pLCBmaXppa3NlbCBkdXJ1bXVuIGF5csSxY2EgZG/En3J1bGFuYWNhxJ/EsW7EsSB2ZSBuby1oYW5kbGVy4oCZZGFraSBrYXBhbMSxIGdhcmFqIGTDvMSfbWVzaW5pIGRvxJ9ydSBzxLFuxLFybMSxeW9yLiBCdSBva3VtYSBBSSBla3JhbiBtZXRuaS9hbmxhbcSxIGRlxJ9lcmxlbmRpcm1lc2lkaXI7IGluc2FuLCBPUywgc2NyZWVuLXJlYWRlciwgw6dhbMSxxZ9hbiBwcm9kdWN0aW9uIHV5Z3VsYW1hc8SxIHZleWEgdGFzayBhY2NlcHRhbmNlIHllcmluZSBnZcOnbWV6LgoKNS4gR2Vyw6dlayBheW7EsS1iYcWfIENJL1QzCgpBeW7EsS1iYcWfIG1ha2J1enUga2F2cml2YV9lMTAxNGJfcjJzb3VyY2VfY2lfcmVjZWlwdC5tZCAoNDAxOSBiYXl0OyBTSEEtMjU2IDI0NGY0NzcwMjI2ZjZjZTEwNmNiZGJlNGFkMWM4NjI3YTg2YjJiZGY3NzNkYWEwYzc5NDNhNmJjNDdhNTc4YzcpIHZlIGpvYi9sb2cgSlNPTuKAmXUga2F2cml2YV9lMTAxNGJfcjJzb3VyY2Vfam9ic19sb2dzLmpzb24gKDQ5MTg4IGJheXQ7IFNIQS0yNTYgZjhkN2U0NzUxOTcyMDU1NTA0YWU3NjdhNTliZjc1M2ZjMDBiNzAzMDEyYjhlMDM2MWVkZTI3ODE1ZWQ1OGEwZikgw7x6ZXJpbmRlbiBpbmNlbGVuZGkuIEpTT07igJlkYWtpIDE2IHdvcmtmbG93IHJ1biBrYXlkxLFuxLFuIHRhbWFtxLEgZXhhY3QgaGVhZCAyMWQxNDg14oCmLCB0YW1hbWxhbm3EscWfIFNVQ0NFU1Mgb2xhcmFrIGnFn2FyZXRsaTsgOCBwdWxsX3JlcXVlc3QgKyA4IHB1c2guIDE2IFJBVyBsb2cgZG9zeWFzxLFuxLFuIGhlciBiaXJpbmluIGdlcsOnZWsgYnl0ZSB1enVubHXEn3UgdmUgU0hBLTI1NuKAmXPEsSBtYWtidXovSlNPTiBpbGUgZcWfbGXFn3RpOyB1eXVtc3V6bHVrIHlvay4KCi0gUFIgYXJjaGl0ZWN0dXJlLWNoZWNrcyBydW4gMzc1NjQzNjYyNzc6IGNoZWNrcyBqb2IgNy83IGJhxZ9hcsSxbMSxIGFkxLFtOyB0My1nYXRlIGpvYiA1LzUgZ2Vyw6dlayBiYcWfYXLEsWzEsSBhZMSxbS4KLSBQUiBFMSBydW4gMzc1NjQzNjYyNjA6IEZvcm1hdHRlZCAzNCBmaWxlcyAoMCBjaGFuZ2VkKSwgTm8gaXNzdWVzIGZvdW5kISwgMzIxIHRlc3RzIHBhc3NlZC4KLSBFMyBjb21taXQgYXV0aCwgRTMgbGl2ZSBhdXRoLCBFNCBvZmZsaW5lLCBFNSBhdXRob3JpdHksIEU2IHJlbGVhc2UgcG9saWN5IHZlIEU5IGJvdW5kZWQgcHJvcG9zYWwgUFIga2/Fn3VsYXLEsSBkYSBTVUNDRVNTLgotIFBSIFQzIGxvZ3UgMTEyIGV2aWRlbmNlIGtheWTEsSB0YXJhZMSxxJ/EsW7EsTsgaWRlbnRpdHkgY2hlY2vigJlpbiAzNjAgSUQgLyA0NTkgZG9zeWEgaW5kZWtzbGVkacSfaW5pIGfDtnN0ZXJpeW9yLiBQUiBpxZ8gYWvEscWfxLEgY2hlY2tvdXTigJl1IDRmNTE3ZGVkMTk0MjEyZWY0MWQ1YzQyZDRhNjhlNmYxYWVhNTU3MWQgc2VudGV0aWsgbWVyZ2UgY29tbWl04oCZaWRpcjsga2F5bmFrIGJhxZ/EsSAyMWQxNDg1IHZlIGJhc2UgMjQ3MTczNCBtZXRhZGF0YeKAmXPEsXlsYSBkb8SfcnVsYW5kxLEuIFB1c2ggYXJjaGl0ZWN0dXJl4oCZZGFraSBUMyBpxZ9pIFNLSVBQRUQvMCBhZMSxbTsgVDMga2FuxLF0xLEgc2F5xLFsbWFkxLEuCgpFc2tpIDE4ZmJjIHNvdXJjZSBpw6dpbiAxNyBiYcWfYXLEsWzEsSBDSSwgYnUgaGVhZCBpw6dpbiBrYW7EsXQga2FidWwgZWRpbG1lZGkuIEJ1IHJhcG9yIENJ4oCZxLEgYmHEn8SxbXPEsXogcmV2aWV3ZXIgaMO8a23DvG7DvG4geWVyaW5lIGtveW1hejsgYnUgcmFwb3IgYXlyxLEga2F5bmFrIGluY2VsZW1lc2kgaMO8a23DvGTDvHIuCgo2LiBCdWxndWxhciwgdGFyaWjDp2UgdmUga2VzaW4gc8SxbsSxcgoKR8O8bmNlbCBTT1VSQ0UgMjFkMTQ4NSBpw6dpbiBhw6fEsWsgYnVsZ3U6IFlPSy4gw5ZuY2VraSAxOGZiY+KAmWRla2kgRi0wMS9QMSwgYnUgYmHFn3RhIGF5csSxIGtvcnVuYW4gb2t1bWEga2F5bmFrbGFyxLEsIHBsYW4gYmHEn8SxbXPEsXogc3ViamVjdCB2ZSB0xLFrbGFtYSBhbsSxIHJlY2hlY2sgaWxlIGthcGFuZMSxLiBFc2tpIHJhcG9yIGthdnJpdmFfZTEwMTRiX3dob2xlX3Jldmlldy50eHQgMTE4OTAgYmF5dCAvIFNIQS0yNTYgNzI2YzE5MDg0NjdjNGFmZjViMjVlNTdhZGNlNGZkNTg5YTQ1Njg1OTgwZmE4ZWRmMmFjODAwZjYzNjdlNzI4NSBvbGFyYWsgZGXEn2nFn21lZGVuIGR1cnV5b3IgdmUgeWFsbsSxeiByZWRkZWRpbG1pxZ8gMThmYmMgw7Z6bmVzaW5lIGFpdC4gRXNraSBpbGsgb2t1bWEvUjEtUjIgZ3JhcGggRkFJTCBnw7xubMO8a2xlcmkgdmUgw7Z6Z8O8biBidWxndSB0YXJpaGkga29ydW5tdcWfdHVyLgoKQcWfYcSfxLFkYWtpbGVyIGHDp8SxayBrYWzEsXIgdmUgYnUgRlVMTCBQQVNTIGjDvGttw7xuw7wgYcWfbWF6OiBFMSBmaXh0dXJl4oCZxLFuZGFraSBvbHVtbHUgcmVmZXJhbnNsYXIgZ2Vyw6dlayBrdWxsYW7EsWPEsS/DvHJldGltIGl6aW4ga2F5bmHEn8SxIGRlxJ9pbGRpcjsga29ydW5hbiB5b2wgaMOibMOiIGtlbmRpIGfDvG5jZWwgb2t1bWEgaXpuaW5pIGlzdGVyOyBoYW5kbGVyIHlva3NhIGdhcmFqIGJ1dG9udSBnw7Zyw7xuw7xyIGFtYSBkZXZyZSBkxLHFn8SxZMSxcjsgZWtyYW4gY2FwdHVyZeKAmcSxIGdlcsOnZWsgbmF2aWdhdGlvbiB2ZXlhIHTEsWtsYW1hIGthbsSxdMSxIGRlxJ9pbGRpci4gR2Vyw6dlayByb3V0ZXIvbmF2LCBFMy9FNSBhdXRob3JpdHksIGlkZW50aXR5LCBxdW90YSwgYmlsbGluZywgZW50aXRsZW1lbnQgd3JpdGVyLCBEQiwgZml6aWtzZWwgZHVydW0gdmUgcmVjb3Zlcnkgw7xyZXRpY2lzaSwgZ2Vyw6dlayBjaWhhei9PUy9zY3JlZW4tcmVhZGVyLCBuaWhhaSB0b2tlbi9sb2dvL2ZvbnQvbW9kYWxpdGUgdmUgcmVsZWFzZS9ob3N0ZWQgcHJvZHVjdGlvbiBrYWJ1bMO8IEhFTETigJlkaXIuIEUzUjEgUkVWSUVXLCBFNSBJTl9QUk9HUkVTUywgVC1FMS0wMTRiIGthecSxdGxhcsSxIFJFVklFVy9SRUNPUkRFRDsgZ2VuZWwgMTAxLzEwNS8yMDYgZ8O2csO8bsO8bcO8IGF5bsSxIGthbMSxci4KClNvbnXDpzogMjFkMTQ4NSBiYcWfxLFuZGEgVC1FMS0wMTRi4oCZbmluIHPEsW7EsXJsxLEgRTEgc3VudW0gR0FURSBrYXluYcSfxLFuYSBpbGnFn2tpbiBiYcSfxLFtc8SxeiBpbmNlbGVtZSBGVUxMIFBBU1PigJl0xLFyLiBCdSByYXBvciB0YXNr4oCZxLEgRE9ORSB5YXBtYXosIHllbmkgYmHEn8SxbWzEsWzEsWsvZmVhdHVyZSBrYXJhcsSxIHZlcm1leiwgbWVyZ2UgdmV5YSDDvHJldGltIGFrdGl2YXN5b251IHlldGtpc2kgb2x1xZ90dXJtYXouIERFQy0wMDY5IHV5YXLEsW5jYSBidSwgYXlyxLEgZGVsZWdhdGVkIHJldmlldyBow7xrbcO8ZMO8cjsgb3duZXItc2lkZSBhY2NlcHRhbmNlL3N0YXR1cyBrYXlkxLEgYnUgZG9zeWFuxLFuIHlhesSxbcSxeWxhIG90b21hdGlrIHlhcMSxbG3EscWfIHNhecSxbG1hei4=
```

## Gerçek r2source CI makbuzu

Exact baş 21d1485157777b0b6d4d8a1a78596abaa8c680e1; gerçek16/16SUCCESS. Push8/PR8; label/opened architecture tekrarları ayrı olay olarak korunur. Her workflow/job/adım ve her ham günlük doğrulandı.
PRrun37564366277/checksjob112608604627: 7başarılıadım/success.
PRrun37564366277/t3-gatejob112608604940: 5başarılıadım/success.
- pull_request architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366277 — SUCCESS; hamlogRAW SHA256423ed446b7eca60d0bb675e611e6f748691058d354e6cce3acfc76471ba73e6c/47366byte.
- pull_request e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366260 — SUCCESS; hamlogRAW SHA2561c965fe0ae757cdc255c375f948b570b616cf7ac3af2a3414f78b2a98f010c10/122861byte.
- pull_request e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366258 — SUCCESS; hamlogRAW SHA2561a272d2db58946f856350de15c1f824e8fb91ce94e829f7acfa81202f7f22720/65981byte.
- pull_request e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366253 — SUCCESS; hamlogRAW SHA256ada4dd615ec14f48a169d34e221b1027f8e5049a012e8ab5ba1d0f42a08695e0/25639byte.
- pull_request e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366252 — SUCCESS; hamlogRAW SHA256fcfd80b32f94215c1f33708ff87473543a74cca832af99b8de931448215a8479/56249byte.
- pull_request e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366276 — SUCCESS; hamlogRAW SHA256d507f8006ca7b96c3e6be97c1f80b8454e0528da9a3c0eb048aa67707e27682f/35655byte.
- pull_request e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366308 — SUCCESS; hamlogRAW SHA256dd50656048f979420b376724b71e2d1816affde8255eb53e6de495453f5f11ba/27986byte.
- pull_request e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564366281 — SUCCESS; hamlogRAW SHA25614884d6a5e440792fe732a67e91be013a8ab7b10be7e4e686202088df9185246/18330byte.
- push architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362927 — SUCCESS; hamlogRAW SHA256e433b6e457480decde68008000492ffba996c8bae71c86bd1f68ac46026a9568/30817byte.
- push e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362859 — SUCCESS; hamlogRAW SHA256496e5dd002bd8bf2648301c9a825f93d8db31c3309a61f547792731c00c26714/121184byte.
- push e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362933 — SUCCESS; hamlogRAW SHA256b3308754d99e2d16c3c5413caf4d714d42806a9208a4af5819ed06060485d8f4/63536byte.
- push e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362871 — SUCCESS; hamlogRAW SHA256c232eb48167c010bb1f931c24653d46468f66e5249ae170b1e33e47280c7b050/24229byte.
- push e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362862 — SUCCESS; hamlogRAW SHA2560cbbd5b3062a1fb8996516bbfa3244dac7506947636618b9a3c1fdda197639cd/54850byte.
- push e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362935 — SUCCESS; hamlogRAW SHA256ad07fbaae17daa47371ee471c7c37e5e6e5f22a20d9dab70b3325aa2ea4675b7/34253byte.
- push e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362924 — SUCCESS; hamlogRAW SHA25657491f771874797e22aff5c185b84ba5b72cd927ee58a0729da6ee79f3a03f1b/26654byte.
- push e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37564362884 — SUCCESS; hamlogRAW SHA256bf14cdad5acc98ac4599602cfeb12bcd7addc7b43702db9f16c65cfd88e4633c/17046byte.

E1gerçekhamlog: strictformat34/0-analyze0-321normalPASS; E4 170PASS/E9 9PASS; mimarirun_allworst0. PushT3SKIPPED0adım bağımsız kabul değildir; yukarıdaki PR T3 gerçek adımlarla başarılıdır. CI bağımsız incelemeci hükmünün yerine geçmez; CI görev tamamlanma hükmü değildir.

## T015 tüketimi ve gerçek PR115 ikincil kabul makbuzu

[PR115](https://github.com/xpike-dgm/kavriva-app/pull/115) normal eşleşen başla birleşti. Kaynak `21d1485157777b0b6d4d8a1a78596abaa8c680e1` bağımsız FULL PASS; son `749aa2c033668b88e467bce32175fbecfbb9e38c` ayrı PASS. Gerçek kaynak16, son16 ve ana8 workflow/job/adım/ham günlük başarılı. Merge ve fetched main `9f02dc013bff0d49256dcbb030a9d68d94603085`, tree eşit. Gerçek ana 102 sınırlı DONE /104 kalan /206. T014b sınırlı sunum GATE kabulüdür; üretim kapanışı veya bu T015 görevinin kabulü değildir. Özgün ret, rapor ve eski kanıt gövdesi korunur.

### Özgün bağımsız son rapor, değiştirilmeden

RAW 6910 bayt / SHA256 20014c28c249f747719dc3b64d3efd97c4cdefb7774c6b6a3848f132abdd60f9

<pre>BAĞIMSIZ SON METADATA KABUL İNCELEMESİ — PASS
T-E1-014b / SCR-037 / C1.7 / F1.7.1 / FL1.7.1
Tarih: 2026-10-07
İncelemeci: /root/e1014b_final_metadata_review — implementer Root’tan ayrı reviewer
İstenen inceleme bağlamı: gpt-6-luna/max

HÜKÜM
PASS — yalnızca aşağıdaki FINAL başındaki altı dosyalı metadata adayı ve sınırlı E1 sunum GATE kaydı için. Bu hüküm ana dala kabul/merge, gerçek görev sayımında ilerleme veya üretim/entitlement enforcement onayı değildir. Bu incelemede bu kapsam içinde kabulü durduran bulgu bulmadım.

1. Özne ve otorite

Repo: C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app
PR: https://github.com/xpike-dgm/kavriva-app/pull/115
Kabul edilmiş main/base: 2471734750e723ab7af5cb84f6676155ca26960f
SOURCE: 21d1485157777b0b6d4d8a1a78596abaa8c680e1
İncelenen FINAL: 749aa2c033668b88e467bce32175fbecfbb9e38c
Plan pimi: C:\Users\Xpike\Desktop\Kavriva-plan, fa914f013fdcd032faed876689092da245989459
Kanonik yöntem: GATE / HELD-acceptance evaluation; SIMULATION veya production enforcement değildir.

Sabit planın DEC-0068/0069, PACK_STANDARD, TASK_INDEX, DEPENDENCY_GRAPH, ACCEPTANCE_MATRIX ve PHASE_GATES kayıtlarıyla karşılaştırdım. DEC-0069, ayrı ve sahibi tarafından kabul edilen delegated review’un T3 second-eye olmasına izin verir; reviewer hükmü tek başına task’ı DONE yapmaz. P-E1-014b:49 görev kabulünün exact-head review/CI ve main8 doğrulamasından sonra sayılacağını, üretim yetki GATE’inin HELD kaldığını söyler.

2. Metadata diff’i ve status sınırı

SOURCE→FINAL gerçek diff’i tam altı dosyadır:

- vault/PROFILES/entitlement-gate-render.md
- vault/PACKS/P-E1-014b.md
- vault/REGISTRY/T-E1-014b.md
- vault/EVIDENCE/E-DEV-113.md
- vault/INDEX/registry.json
- vault/INDEX/routing.json

Diff’in kalan içeriği beklenen status ve E-DEV-113 kanıt kaydı eklerinden oluşur. Profile status ACTIVE (line 19), pack status ACTIVE (line 20), task status DONE (line 25; generated registry line 1107 ve routing line 21) olarak adaylanmış; E-DEV-113 status RECORDED kalmıştır. Kod, test, sabit 13 soru fixture’ı, native görüntüler, SDK/dependency, workflow YAML, E3/E5 kayıtları veya önceki ret gövdeleri bu SOURCE→FINAL farkında değişmemiştir. Worktree temizdir; git diff --check temizdir.

Bu status değerleri unmerged PR dalındaki önerilen registry görünümüdür. Canlı main/base 2471734 içinde T-E1-014b task satırı yoktur. E-DEV-113:1028, task’ın DONE/main sayımı olmadığını; normal merge ve fetched-main8 olmadan genel sayımın 101 DONE / 105 kalan / 206 toplam olarak kalacağını; E3R1 REVIEW ve E5 IN_PROGRESS ile üretim kapılarının HELD olduğunu açıkça sınırlar. Bu nedenle DONE dal adayı main kabulü veya ana sayım artışı olarak sunulmamıştır. Merge ve main8 koşulu beklemededir.

Önceki bağımsız R2 whole-source raporunun FULL PASS’ı sadece SOURCE 21d1485 üzerindeki dar E1 sunum GATE’ine ilişkindir. E-DEV-113:1022’de kaynak bulgusu olmadığını kaydeder; aynı dosya:1024-1028 üretim enforcement ve ana görev tamamlanması iddiasını dışlar. Önceki 18fbc ret hükmü geri alınmamış, eski F-01/P1 geçmişi korunmuştur.

3. Kanıt custody

E-DEV-113 içindeki dört tam raporun HTML içeriği HTML entity decode sonrası özgün Temp dosyalarına karakter karakter eşittir. Dört Base64 bloğu özgün ham dosyaların boyut/SHA-256 değerleriyle eşleşir:

- İlk bağımsız okuma: 4.153 bayt, SHA-256 1f24efa76a0046a67dd64f7a4f64b385b001af02157a4eb085f4960f821dffa8
- Önceki reddedilmiş whole-source raporu: 11.890 bayt, SHA-256 726c1908467c4aff5b25e57adce4fd589a45685980fa8edf2ac800f6367e7285
- R2 ilk okuma: 6.393 bayt, SHA-256 3a94dad4668fa55b9d52412d3d115aecdd96ee5ca039f19a693eeafa19efc348
- R2 whole-source raporu: 14.639 bayt, SHA-256 7e8f88d0848a9a81ef83884d51c3b8de77a4c0525c560d7cdabb8b370d5182ee

Önceki ret ve ilk okuma içerikleri değiştirilmemiştir. R2 raporunun hükmü ve sınırları burada kaynak kabulünün yerine geçirilmemiştir.

4. FINAL aynı-baş CI/T3 ve canlı GitHub

PR 115’i canlı olarak kontrol ettim: OPEN, Draft; headRefOid FINAL 749aa2c033668b88e467bce32175fbecfbb9e38c ile eşleşiyor. Merge yapılmamış. gh run list --commit FINAL 16 tamamlanmış run gösteriyor: 8 push ve 8 pull_request; tamamı exact FINAL head ve SUCCESS.

- PR architecture run 37565655150: checks job 112612640156 SUCCESS; 7 gerçek adım. T3 job 112612639963 SUCCESS; 5 gerçek adım, “T3 conformance + identity gate” dahil.
- PR E1 run 37565655141: job 112612639470 SUCCESS; 7/7 gerçek adım. Ham log 321 normal test PASS, format 34 dosya / 0 değişiklik ve analyze 0 issue kaydediyor.
- Final architecture günlük çıktısı run-all: worst exit = 0; koruma/kimlik testleri 42/42 PASS.
- Push architecture run 37565651533 içindeki T3 job SKIPPED ve sıfır adımlıdır; T3 kanıtı olarak sayılmamıştır. PR run’ındaki beş gerçek T3 adımı başarıyla tamamlanmıştır.

kavriva_e1014b_final_jobs_logs.json içindeki 16 run kaydının exact head/event/status/conclusion bilgilerini canlı GitHub ile karşılaştırdım. JSON’un işaret ettiği 16 ham logun her birinde gerçek dosya uzunluğu ve SHA-256 tekrar eşleşti; 18 job kaydında başarısızlık yok ve yukarıdaki push T3 skip’i beklenen tek istisnadır. Makbuz 4.016 bayt / SHA-256 0055b3f15a5f3ee1d28511841ce3abd8c54f718048f277132b1621f25c48f37d; jobs/log JSON 49.140 bayt / SHA-256 723ba1c3cbb26f55dbaecf7e695407d880b6b5bf0f0cf38835913a9807b9025d. Bu CI, bağımsız reviewer hükmü yerine geçmez ve üretim kabulü değildir.

FINAL commit açıklamasındaki “son inceleme/CI bekleniyor” cümleleri commit oluşturulurken bekleyen durumun zaman damgalı kaydıdır. Bu rapor ve FINAL CI/T3 makbuzu sonraki review olaylarını doğrular. İnceleme sırasında repo değiştirilmemiştir.

5. Bulgular ve açık sınırlar

Altı dosyalı metadata adayı, status sınırı, generated registry/routing uyumu, E-DEV-113 rapor custody’si ve aynı-baş CI/T3 kanıtı için kabulü durduran bulgu yoktur.

Canlı PR sayfasının ilk okumasında eski bekleyen-review/CI açıklaması görünüyordu. Sonraki canlı tekrar kontrolde açıklama ve yorum 6030166611 exact FINAL CI/T3 makbuzunu içeriyor; review’un sürmekte olduğunu belirtiyor. Bu gözlem zaman damgalı tutulmuştur. En son görülen PR durumu OPEN/Draft ve aynı FINAL başıdır. Bu rapor PR’ı onaylamaz veya merge etmez.

Bu hüküm gerçek uygulamada entitlement/yetki, E3/E5, identity, quota/billing, gerçek router/navigation, fiziksel durum/recovery, cihaz/OS/screen reader veya release/production kabulü sağlamaz. Bunlar HELD kalır. Genel main sayımı 101/105/206 olarak kalır; normal merge ve fetched-main8 bu incelemeden sonra yapılacak ayrı koşullardır.
</pre>

```text
QkHEnklNU0laIFNPTiBNRVRBREFUQSBLQUJVTCDEsE5DRUxFTUVTxLAg4oCUIFBBU1MKVC1FMS0wMTRiIC8gU0NSLTAzNyAvIEMxLjcgLyBGMS43LjEgLyBGTDEuNy4xClRhcmloOiAyMDI2LTEwLTA3CsSwbmNlbGVtZWNpOiAvcm9vdC9lMTAxNGJfZmluYWxfbWV0YWRhdGFfcmV2aWV3IOKAlCBpbXBsZW1lbnRlciBSb2904oCZdGFuIGF5csSxIHJldmlld2VyCsSwc3RlbmVuIGluY2VsZW1lIGJhxJ9sYW3EsTogZ3B0LTYtbHVuYS9tYXgKCkjDnEvDnE0KUEFTUyDigJQgeWFsbsSxemNhIGHFn2HEn8SxZGFraSBGSU5BTCBiYcWfxLFuZGFraSBhbHTEsSBkb3N5YWzEsSBtZXRhZGF0YSBhZGF5xLEgdmUgc8SxbsSxcmzEsSBFMSBzdW51bSBHQVRFIGtheWTEsSBpw6dpbi4gQnUgaMO8a8O8bSBhbmEgZGFsYSBrYWJ1bC9tZXJnZSwgZ2Vyw6dlayBnw7ZyZXYgc2F5xLFtxLFuZGEgaWxlcmxlbWUgdmV5YSDDvHJldGltL2VudGl0bGVtZW50IGVuZm9yY2VtZW50IG9uYXnEsSBkZcSfaWxkaXIuIEJ1IGluY2VsZW1lZGUgYnUga2Fwc2FtIGnDp2luZGUga2FidWzDvCBkdXJkdXJhbiBidWxndSBidWxtYWTEsW0uCgoxLiDDlnpuZSB2ZSBvdG9yaXRlCgpSZXBvOiBDOlxVc2Vyc1xYcGlrZVwuY29kZXhcd29ya3RyZWVzXGU0LXJlcXVpcmVkLWF1dG8tdHJhbnNmZXJca2F2cml2YS1hcHAKUFI6IGh0dHBzOi8vZ2l0aHViLmNvbS94cGlrZS1kZ20va2F2cml2YS1hcHAvcHVsbC8xMTUKS2FidWwgZWRpbG1pxZ8gbWFpbi9iYXNlOiAyNDcxNzM0NzUwZTcyM2FiN2FmNWNiODRmNjY3NjE1NWNhMjY5NjBmClNPVVJDRTogMjFkMTQ4NTE1Nzc3N2IwYjZkNGQ4YTFhNzg1OTZhYmFhOGM2ODBlMQrEsG5jZWxlbmVuIEZJTkFMOiA3NDlhYTJjMDMzNjY4Yjg4ZTQ2N2JjZTMyMTc1ZmJlY2ZiYjllMzhjClBsYW4gcGltaTogQzpcVXNlcnNcWHBpa2VcRGVza3RvcFxLYXZyaXZhLXBsYW4sIGZhOTE0ZjAxM2ZkY2QwMzJmYWVkODc2Njg5MDkyZGEyNDU5ODk0NTkKS2Fub25payB5w7ZudGVtOiBHQVRFIC8gSEVMRC1hY2NlcHRhbmNlIGV2YWx1YXRpb247IFNJTVVMQVRJT04gdmV5YSBwcm9kdWN0aW9uIGVuZm9yY2VtZW50IGRlxJ9pbGRpci4KClNhYml0IHBsYW7EsW4gREVDLTAwNjgvMDA2OSwgUEFDS19TVEFOREFSRCwgVEFTS19JTkRFWCwgREVQRU5ERU5DWV9HUkFQSCwgQUNDRVBUQU5DRV9NQVRSSVggdmUgUEhBU0VfR0FURVMga2F5xLF0bGFyxLF5bGEga2FyxZ/EsWxhxZ90xLFyZMSxbS4gREVDLTAwNjksIGF5csSxIHZlIHNhaGliaSB0YXJhZsSxbmRhbiBrYWJ1bCBlZGlsZW4gZGVsZWdhdGVkIHJldmlld+KAmXVuIFQzIHNlY29uZC1leWUgb2xtYXPEsW5hIGl6aW4gdmVyaXI7IHJldmlld2VyIGjDvGttw7wgdGVrIGJhxZ/EsW5hIHRhc2vigJnEsSBET05FIHlhcG1hei4gUC1FMS0wMTRiOjQ5IGfDtnJldiBrYWJ1bMO8bsO8biBleGFjdC1oZWFkIHJldmlldy9DSSB2ZSBtYWluOCBkb8SfcnVsYW1hc8SxbmRhbiBzb25yYSBzYXnEsWxhY2HEn8SxbsSxLCDDvHJldGltIHlldGtpIEdBVEXigJlpbmluIEhFTEQga2FsZMSxxJ/EsW7EsSBzw7Z5bGVyLgoKMi4gTWV0YWRhdGEgZGlmZuKAmWkgdmUgc3RhdHVzIHPEsW7EsXLEsQoKU09VUkNF4oaSRklOQUwgZ2Vyw6dlayBkaWZm4oCZaSB0YW0gYWx0xLEgZG9zeWFkxLFyOgoKLSB2YXVsdC9QUk9GSUxFUy9lbnRpdGxlbWVudC1nYXRlLXJlbmRlci5tZAotIHZhdWx0L1BBQ0tTL1AtRTEtMDE0Yi5tZAotIHZhdWx0L1JFR0lTVFJZL1QtRTEtMDE0Yi5tZAotIHZhdWx0L0VWSURFTkNFL0UtREVWLTExMy5tZAotIHZhdWx0L0lOREVYL3JlZ2lzdHJ5Lmpzb24KLSB2YXVsdC9JTkRFWC9yb3V0aW5nLmpzb24KCkRpZmbigJlpbiBrYWxhbiBpw6dlcmnEn2kgYmVrbGVuZW4gc3RhdHVzIHZlIEUtREVWLTExMyBrYW7EsXQga2F5ZMSxIGVrbGVyaW5kZW4gb2x1xZ91ci4gUHJvZmlsZSBzdGF0dXMgQUNUSVZFIChsaW5lIDE5KSwgcGFjayBzdGF0dXMgQUNUSVZFIChsaW5lIDIwKSwgdGFzayBzdGF0dXMgRE9ORSAobGluZSAyNTsgZ2VuZXJhdGVkIHJlZ2lzdHJ5IGxpbmUgMTEwNyB2ZSByb3V0aW5nIGxpbmUgMjEpIG9sYXJhayBhZGF5bGFubcSxxZ87IEUtREVWLTExMyBzdGF0dXMgUkVDT1JERUQga2FsbcSxxZ90xLFyLiBLb2QsIHRlc3QsIHNhYml0IDEzIHNvcnUgZml4dHVyZeKAmcSxLCBuYXRpdmUgZ8O2csO8bnTDvGxlciwgU0RLL2RlcGVuZGVuY3ksIHdvcmtmbG93IFlBTUwsIEUzL0U1IGthecSxdGxhcsSxIHZleWEgw7ZuY2VraSByZXQgZ8O2dmRlbGVyaSBidSBTT1VSQ0XihpJGSU5BTCBmYXJrxLFuZGEgZGXEn2nFn21lbWnFn3Rpci4gV29ya3RyZWUgdGVtaXpkaXI7IGdpdCBkaWZmIC0tY2hlY2sgdGVtaXpkaXIuCgpCdSBzdGF0dXMgZGXEn2VybGVyaSB1bm1lcmdlZCBQUiBkYWzEsW5kYWtpIMO2bmVyaWxlbiByZWdpc3RyeSBnw7Zyw7xuw7xtw7xkw7xyLiBDYW5sxLEgbWFpbi9iYXNlIDI0NzE3MzQgacOnaW5kZSBULUUxLTAxNGIgdGFzayBzYXTEsXLEsSB5b2t0dXIuIEUtREVWLTExMzoxMDI4LCB0YXNr4oCZxLFuIERPTkUvbWFpbiBzYXnEsW3EsSBvbG1hZMSxxJ/EsW7EsTsgbm9ybWFsIG1lcmdlIHZlIGZldGNoZWQtbWFpbjggb2xtYWRhbiBnZW5lbCBzYXnEsW3EsW4gMTAxIERPTkUgLyAxMDUga2FsYW4gLyAyMDYgdG9wbGFtIG9sYXJhayBrYWxhY2HEn8SxbsSxOyBFM1IxIFJFVklFVyB2ZSBFNSBJTl9QUk9HUkVTUyBpbGUgw7xyZXRpbSBrYXDEsWxhcsSxbsSxbiBIRUxEIG9sZHXEn3VudSBhw6fEsWvDp2Egc8SxbsSxcmxhci4gQnUgbmVkZW5sZSBET05FIGRhbCBhZGF5xLEgbWFpbiBrYWJ1bMO8IHZleWEgYW5hIHNhecSxbSBhcnTEscWfxLEgb2xhcmFrIHN1bnVsbWFtxLHFn3TEsXIuIE1lcmdlIHZlIG1haW44IGtvxZ91bHUgYmVrbGVtZWRlZGlyLgoKw5ZuY2VraSBiYcSfxLFtc8SxeiBSMiB3aG9sZS1zb3VyY2UgcmFwb3J1bnVuIEZVTEwgUEFTU+KAmcSxIHNhZGVjZSBTT1VSQ0UgMjFkMTQ4NSDDvHplcmluZGVraSBkYXIgRTEgc3VudW0gR0FUReKAmWluZSBpbGnFn2tpbmRpci4gRS1ERVYtMTEzOjEwMjLigJlkZSBrYXluYWsgYnVsZ3VzdSBvbG1hZMSxxJ/EsW7EsSBrYXlkZWRlcjsgYXluxLEgZG9zeWE6MTAyNC0xMDI4IMO8cmV0aW0gZW5mb3JjZW1lbnQgdmUgYW5hIGfDtnJldiB0YW1hbWxhbm1hc8SxIGlkZGlhc8SxbsSxIGTEscWfbGFyLiDDlm5jZWtpIDE4ZmJjIHJldCBow7xrbcO8IGdlcmkgYWzEsW5tYW3EscWfLCBlc2tpIEYtMDEvUDEgZ2XDp21pxZ9pIGtvcnVubXXFn3R1ci4KCjMuIEthbsSxdCBjdXN0b2R5CgpFLURFVi0xMTMgacOnaW5kZWtpIGTDtnJ0IHRhbSByYXBvcnVuIEhUTUwgacOnZXJpxJ9pIEhUTUwgZW50aXR5IGRlY29kZSBzb25yYXPEsSDDtnpnw7xuIFRlbXAgZG9zeWFsYXLEsW5hIGthcmFrdGVyIGthcmFrdGVyIGXFn2l0dGlyLiBEw7ZydCBCYXNlNjQgYmxvxJ91IMO2emfDvG4gaGFtIGRvc3lhbGFyxLFuIGJveXV0L1NIQS0yNTYgZGXEn2VybGVyaXlsZSBlxZ9sZcWfaXI6CgotIMSwbGsgYmHEn8SxbXPEsXogb2t1bWE6IDQuMTUzIGJheXQsIFNIQS0yNTYgMWYyNGVmYTc2YTAwNDZhNjdkZDY0ZjdhNGY2NGIzODViMDAxYWYwMjE1N2E0ZWIwODVmNDk2MGY4MjFkZmZhOAotIMOWbmNla2kgcmVkZGVkaWxtacWfIHdob2xlLXNvdXJjZSByYXBvcnU6IDExLjg5MCBiYXl0LCBTSEEtMjU2IDcyNmMxOTA4NDY3YzRhZmY1YjI1ZTU3YWRjZTRmZDU4OWE0NTY4NTk4MGZhOGVkZjJhYzgwMGY2MzY3ZTcyODUKLSBSMiBpbGsgb2t1bWE6IDYuMzkzIGJheXQsIFNIQS0yNTYgM2E5NGRhZDQ2NjhmYTU1YjlkNTI0MTJkM2QxMTVhZWNkZDk2ZWU1Y2EwMzlmMTlhNjkzZWVhZmExOWVmYzM0OAotIFIyIHdob2xlLXNvdXJjZSByYXBvcnU6IDE0LjYzOSBiYXl0LCBTSEEtMjU2IDdlOGY4OGQwODQ4YTlhODFlZjgzODg0ZDUxYzNiOGRlNzdhNGMwNTI1YzU2MGQ3Y2RhYmI4YjM3MGQ1MTgyZWUKCsOWbmNla2kgcmV0IHZlIGlsayBva3VtYSBpw6dlcmlrbGVyaSBkZcSfacWfdGlyaWxtZW1pxZ90aXIuIFIyIHJhcG9ydW51biBow7xrbcO8IHZlIHPEsW7EsXJsYXLEsSBidXJhZGEga2F5bmFrIGthYnVsw7xuw7xuIHllcmluZSBnZcOnaXJpbG1lbWnFn3Rpci4KCjQuIEZJTkFMIGF5bsSxLWJhxZ8gQ0kvVDMgdmUgY2FubMSxIEdpdEh1YgoKUFIgMTE14oCZaSBjYW5sxLEgb2xhcmFrIGtvbnRyb2wgZXR0aW06IE9QRU4sIERyYWZ0OyBoZWFkUmVmT2lkIEZJTkFMIDc0OWFhMmMwMzM2NjhiODhlNDY3YmNlMzIxNzVmYmVjZmJiOWUzOGMgaWxlIGXFn2xlxZ9peW9yLiBNZXJnZSB5YXDEsWxtYW3EscWfLiBnaCBydW4gbGlzdCAtLWNvbW1pdCBGSU5BTCAxNiB0YW1hbWxhbm3EscWfIHJ1biBnw7ZzdGVyaXlvcjogOCBwdXNoIHZlIDggcHVsbF9yZXF1ZXN0OyB0YW1hbcSxIGV4YWN0IEZJTkFMIGhlYWQgdmUgU1VDQ0VTUy4KCi0gUFIgYXJjaGl0ZWN0dXJlIHJ1biAzNzU2NTY1NTE1MDogY2hlY2tzIGpvYiAxMTI2MTI2NDAxNTYgU1VDQ0VTUzsgNyBnZXLDp2VrIGFkxLFtLiBUMyBqb2IgMTEyNjEyNjM5OTYzIFNVQ0NFU1M7IDUgZ2Vyw6dlayBhZMSxbSwg4oCcVDMgY29uZm9ybWFuY2UgKyBpZGVudGl0eSBnYXRl4oCdIGRhaGlsLgotIFBSIEUxIHJ1biAzNzU2NTY1NTE0MTogam9iIDExMjYxMjYzOTQ3MCBTVUNDRVNTOyA3LzcgZ2Vyw6dlayBhZMSxbS4gSGFtIGxvZyAzMjEgbm9ybWFsIHRlc3QgUEFTUywgZm9ybWF0IDM0IGRvc3lhIC8gMCBkZcSfacWfaWtsaWsgdmUgYW5hbHl6ZSAwIGlzc3VlIGtheWRlZGl5b3IuCi0gRmluYWwgYXJjaGl0ZWN0dXJlIGfDvG5sw7xrIMOnxLFrdMSxc8SxIHJ1bi1hbGw6IHdvcnN0IGV4aXQgPSAwOyBrb3J1bWEva2ltbGlrIHRlc3RsZXJpIDQyLzQyIFBBU1MuCi0gUHVzaCBhcmNoaXRlY3R1cmUgcnVuIDM3NTY1NjUxNTMzIGnDp2luZGVraSBUMyBqb2IgU0tJUFBFRCB2ZSBzxLFmxLFyIGFkxLFtbMSxZMSxcjsgVDMga2FuxLF0xLEgb2xhcmFrIHNhecSxbG1hbcSxxZ90xLFyLiBQUiBydW7igJnEsW5kYWtpIGJlxZ8gZ2Vyw6dlayBUMyBhZMSxbcSxIGJhxZ9hcsSxeWxhIHRhbWFtbGFubcSxxZ90xLFyLgoKa2F2cml2YV9lMTAxNGJfZmluYWxfam9ic19sb2dzLmpzb24gacOnaW5kZWtpIDE2IHJ1biBrYXlkxLFuxLFuIGV4YWN0IGhlYWQvZXZlbnQvc3RhdHVzL2NvbmNsdXNpb24gYmlsZ2lsZXJpbmkgY2FubMSxIEdpdEh1YiBpbGUga2FyxZ/EsWxhxZ90xLFyZMSxbS4gSlNPTuKAmXVuIGnFn2FyZXQgZXR0acSfaSAxNiBoYW0gbG9ndW4gaGVyIGJpcmluZGUgZ2Vyw6dlayBkb3N5YSB1enVubHXEn3UgdmUgU0hBLTI1NiB0ZWtyYXIgZcWfbGXFn3RpOyAxOCBqb2Iga2F5ZMSxbmRhIGJhxZ9hcsSxc8SxemzEsWsgeW9rIHZlIHl1a2FyxLFkYWtpIHB1c2ggVDMgc2tpcOKAmWkgYmVrbGVuZW4gdGVrIGlzdGlzbmFkxLFyLiBNYWtidXogNC4wMTYgYmF5dCAvIFNIQS0yNTYgMDA1NWIzZjE1YTVmM2VlMWQyODUxMTg0MWNlM2FiZDhjNTRmNzE4MDQ4ZjI3NzEzMmIxNjIxZjI1YzQ4ZjM3ZDsgam9icy9sb2cgSlNPTiA0OS4xNDAgYmF5dCAvIFNIQS0yNTYgNzIzYmExYzNjYmIyNmY1NWRiYWVjZjdlNjk1NDA3ZDg4MGI2YjViZjBmMGNmMzg4MzU5MTNhOTgwN2I5MDI1ZC4gQnUgQ0ksIGJhxJ/EsW1zxLF6IHJldmlld2VyIGjDvGttw7wgeWVyaW5lIGdlw6dtZXogdmUgw7xyZXRpbSBrYWJ1bMO8IGRlxJ9pbGRpci4KCkZJTkFMIGNvbW1pdCBhw6fEsWtsYW1hc8SxbmRha2kg4oCcc29uIGluY2VsZW1lL0NJIGJla2xlbml5b3LigJ0gY8O8bWxlbGVyaSBjb21taXQgb2x1xZ90dXJ1bHVya2VuIGJla2xleWVuIGR1cnVtdW4gemFtYW4gZGFtZ2FsxLEga2F5ZMSxZMSxci4gQnUgcmFwb3IgdmUgRklOQUwgQ0kvVDMgbWFrYnV6dSBzb25yYWtpIHJldmlldyBvbGF5bGFyxLFuxLEgZG/En3J1bGFyLiDEsG5jZWxlbWUgc8SxcmFzxLFuZGEgcmVwbyBkZcSfacWfdGlyaWxtZW1pxZ90aXIuCgo1LiBCdWxndWxhciB2ZSBhw6fEsWsgc8SxbsSxcmxhcgoKQWx0xLEgZG9zeWFsxLEgbWV0YWRhdGEgYWRhecSxLCBzdGF0dXMgc8SxbsSxcsSxLCBnZW5lcmF0ZWQgcmVnaXN0cnkvcm91dGluZyB1eXVtdSwgRS1ERVYtMTEzIHJhcG9yIGN1c3RvZHnigJlzaSB2ZSBheW7EsS1iYcWfIENJL1QzIGthbsSxdMSxIGnDp2luIGthYnVsw7wgZHVyZHVyYW4gYnVsZ3UgeW9rdHVyLgoKQ2FubMSxIFBSIHNheWZhc8SxbsSxbiBpbGsgb2t1bWFzxLFuZGEgZXNraSBiZWtsZXllbi1yZXZpZXcvQ0kgYcOnxLFrbGFtYXPEsSBnw7Zyw7xuw7x5b3JkdS4gU29ucmFraSBjYW5sxLEgdGVrcmFyIGtvbnRyb2xkZSBhw6fEsWtsYW1hIHZlIHlvcnVtIDYwMzAxNjY2MTEgZXhhY3QgRklOQUwgQ0kvVDMgbWFrYnV6dW51IGnDp2VyaXlvcjsgcmV2aWV34oCZdW4gc8O8cm1la3RlIG9sZHXEn3VudSBiZWxpcnRpeW9yLiBCdSBnw7Z6bGVtIHphbWFuIGRhbWdhbMSxIHR1dHVsbXXFn3R1ci4gRW4gc29uIGfDtnLDvGxlbiBQUiBkdXJ1bXUgT1BFTi9EcmFmdCB2ZSBheW7EsSBGSU5BTCBiYcWfxLFkxLFyLiBCdSByYXBvciBQUuKAmcSxIG9uYXlsYW1heiB2ZXlhIG1lcmdlIGV0bWV6LgoKQnUgaMO8a8O8bSBnZXLDp2VrIHV5Z3VsYW1hZGEgZW50aXRsZW1lbnQveWV0a2ksIEUzL0U1LCBpZGVudGl0eSwgcXVvdGEvYmlsbGluZywgZ2Vyw6dlayByb3V0ZXIvbmF2aWdhdGlvbiwgZml6aWtzZWwgZHVydW0vcmVjb3ZlcnksIGNpaGF6L09TL3NjcmVlbiByZWFkZXIgdmV5YSByZWxlYXNlL3Byb2R1Y3Rpb24ga2FidWzDvCBzYcSfbGFtYXouIEJ1bmxhciBIRUxEIGthbMSxci4gR2VuZWwgbWFpbiBzYXnEsW3EsSAxMDEvMTA1LzIwNiBvbGFyYWsga2FsxLFyOyBub3JtYWwgbWVyZ2UgdmUgZmV0Y2hlZC1tYWluOCBidSBpbmNlbGVtZWRlbiBzb25yYSB5YXDEsWxhY2FrIGF5csSxIGtvxZ91bGxhcmTEsXIuCg==
```

### Ayrı adım sayısı açıklaması

## Özgün son inceleme adım sayısına ayrı açıklama

Özgün6910bayt/SHA256 20014c28c249f747719dc3b64d3efd97c4cdefb7774c6b6a3848f132abdd60f9 rapor değiştirilmedi. İncelemeci ayrı mesajında PR E1 job112612639470 için 7/7 sayımının Complete job satırını hariç tuttuğunu, Post Checkout’u içerdiğini açıkladı. API’deki gerçek8/8adım SUCCESS; Root da sekiz adımın tamamını doğruladı. Bu ayrı sayı açıklaması özgün PASS veya rapor içeriğini yeniden yazmaz.

### Ana günlük yakalama hata geçmişi

R1 main8 gerçek workflow/job/adım sonuçları SUCCESS, fakat yerel write_text Windows CRLF dönüşümüyle kaydedilmiş RAWlog ile receipt LFhash eşleşmedi. Root main_record guardı durdurdu; acceptedmain guardı da durdu, mainCIReceiptRead/acceptedMainDone/count ilerlemedi. Özgün11 R1dosya ve helper korundu. Collector gerçek capturedUTF8 baytlarını write_bytes ile kaydedecek; aynıhead gerçek loglar yeniden alınacak, test yeniden çalıştırma veya PASS uydurma yok. Kaynak/son bağımsızraporlar/commit/sourceCI/finalCI değişmedi.

### Gerçek ana kontroller makbuzu

## Gerçek birleşmiş main kontrolleri

Exact 9f02dc013bff0d49256dcbb030a9d68d94603085; sekiz push workflow ve bütün uygulanabilir job/adımlar SUCCESS. PushT3skipped, kaynak/finalPR bağımsızreview/T3 yerine geçirilmez.

- e3-commit-authorization-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241736 — SUCCESS.
- e6-release-policy-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241797 — SUCCESS.
- e4-offline-composition-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241676 — SUCCESS.
- e9-bounded-proposal-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241679 — SUCCESS.
- e5-current-authority-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241766 — SUCCESS.
- architecture-checks: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241755 — SUCCESS.
- e3-live-auth-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241913 — SUCCESS.
- e1-shell-widget-tests: https://github.com/xpike-dgm/kavriva-app/actions/runs/37603241695 — SUCCESS.


- e3-commit-authorization-tests RAW SHA256 91522f99aaf810a548ff2fadb6037866eff809eee900bf8b4b25816f295b34f0 / 63419 bayt
- e6-release-policy-tests RAW SHA256 7184391f2329649d7aff26e10fecf8bb33e47ce16cec3268a1b6b703102d94e7 / 26500 bayt
- e4-offline-composition-tests RAW SHA256 ebd9ce36c1da6ce5bb35718e0a1b7a726c24c2db721be5d41152f7562fd77180 / 54706 bayt
- e9-bounded-proposal-tests RAW SHA256 84811b613b1c150ea4d0c15474cc34f2039be70478254e9e29ab3664183b4bb2 / 16840 bayt
- e5-current-authority-tests RAW SHA256 0bca3c844bd27641dc7cdc278281144992c9f310918ee3082bb94c6be2235ed3 / 34055 bayt
- architecture-checks RAW SHA256 3ee2e612432fc437f694cbfde71a266e7c1aa111f3fa1d00905cfb379f038773 / 30667 bayt
- e3-live-auth-tests RAW SHA256 a1df1b18413ac577adcdfdd4ca3dc6423f9b026905da36e08bc84463e1ec808f / 24079 bayt
- e1-shell-widget-tests RAW SHA256 7125e38e0dc5ceee3fe33d94c86ce3dd11dae8d8a62182162fc94e2688954f47 / 121260 bayt
