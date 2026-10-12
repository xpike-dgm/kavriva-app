---
test_id: E-DEV-121
version: 1
purpose: Ticari listenin rehber veya teknik karar yerine geçmesini engellemek
domain: commercial-neutrality
module: e01-app
owner: E1
implements: [ADR-001, ADR-008, ADR-014, C1.9, F1.9.2, FL1.9.2, SCR-010, BR-070, BR-071, BR-073, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: ranking-firewall-presentation
tasks: [T-E1-021]
tests: [modules/e01-app/internal/shell/test/ranking_firewall_test.dart, modules/e01-app/internal/shell/test/sponsored_marking_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-13
depends_on: [V-E1-RANK-001]
used_by: [V-E1-RANK-001, P-E1-021, T-E1-021]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.9 F1.9.2 FL1.9.2 BR070071073 v1 REVIEW validation method"
subject_file: modules/e01-app/internal/shell/lib/ranking_firewall.dart
subject_digest: 03514fbdef7b2b643b19a3e840411d38abd41062bcbf34e20866c986bdd4c863
result: "Yerel454 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-13
evidence_links: [vault/PROFILES/ranking-firewall-render.md, vault/PACKS/P-E1-021.md, vault/REGISTRY/T-E1-021.md, vault/EVIDENCE/E-DEV-121.md, vault/EVIDENCE/E-DEV-120.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-120-E10-GOVERNED-PATHS-FOR-T-E1-021.md.snapshot, modules/e01-app/internal/shell/lib/guide_discovery.dart, modules/e01-app/internal/shell/lib/sponsored_marking.dart, modules/e01-app/internal/shell/lib/ranking_firewall.dart, modules/e01-app/internal/shell/test/ranking_firewall_test.dart, modules/e01-app/internal/shell/test/fixtures/ranking_firewall_reading_questions.json]
---

# Ticari yönlendirme sınırı — mevcut rehberde sınırlı sunum

Plan fa914f013fdcd032faed876689092da245989459; BASE 3e04c8033781358cec3bcf450218bc52374f4fba; PRECODE df70046a62a7f008cccd4ccb39b47f44eba505e2; kapsam düzeltmesi 298d4fdd08cbda28a7f70c72491165c0549855bf. T-E1-021, C1.9/F1.9.2/FL1.9.2 BR070071073. Bağımlılık T-E1-020 sınırlı DONE; PR122 olağan birleşme ve fetchedmain sekiz başarılı. Gerçek109DONE/97kalan/206; bu aday sayacı ilerletmez.

## Kaynak ve uygulama sınırı

Approved SCREEN_COVERAGE J012 mevcut rehber/destek yüzeylerine bağlıdır. SCR010/D02 içinde MotorcycleFitView sonrası yardımcı salt metin alanı; yeni pazar ekranı, route, pattern, token, public seam veya katalog icat edilmez. D02 ticari yardımcı alanı çizmez; mevcut maliyetin fit öncesindeki konumu D02den farklı ve değişmemiştir. Tam görsel eşlik/flow SCR-TBD ve üretim feed HELD.

RankingFirewallView yalnız supplement amacını gösterir; replaceGuide, salesTarget, technicalRanking ve unknown ticari ayrıntıyı gizler, gerekçe gösterir. Rehber ve aynı teknik fit nesnesi sınırın dışındadır; ödeme, sponsor, satış ölçümü veya kullanıcı davranışı teknik seçime girdi olmaz. Bu E1 sunum beyanıdır; çağıranın commercialPurpose alanı üretim niyet doğrulayıcısı değildir. Eski kaynak modeli baytça korunur; mevcut kaynak filtreleri ve sponsor açıklamaları değişmez. Gerçek ticari feed, ranking algoritması ve kanonik amaç doğrulaması kurulmuş değildir.

## Gerçek yerel kanıt ve korunan denemeler

İlk model denemesi target-r1 yedi PASS: kaynak modeline amaç ekliyordu. Eski E-DEV-120 subject digest korunması nedeniyle bu tasarım bırakıldı; attempt-r1-code.json özgün kod RAWBase64 ve logları saklar. Kapsam düzeltmesi koddan önce iki metadata dosyasına işlendi. İlk düzeltme komutundaki AssertionError biçimlendirme nedeniyleydi; dar regex düzeltildi ve scope-correction-command.txt sınırı kaydeder. Eski sponsor dosyası BASE baytıyla aynıdır; eski kanıtın subject digest değiştirilmedi. İlk denemenin testi yeni uygulama kanıtı sayılmaz.

Revize target-r2 yedi PASS. Full454=korunmuş447+yeni7 PASS; format49 dosya/0 değişiklik; analyze0 sorun. Native-r1 ayrı7+1capture=8 PASS, normal454ye eklenmez. Amaç değişimi listeyi kaldırır/geri getirir, teknik fit nesnesini değiştirmez. Meşru hazırlık yalnız önceki aynı hedefe gider. Eksik/eski/yanlış fit, kaynak, scope, bağlam, revizyon, busy/error/offline ticari içerikten izin kazanmaz. Gerçek Tab/Enter/Space iki aynı hedef callback, 2px focus, focus>=3 ve metin>=4.5 test edilir.

20durum x 320/390/768 x ölçek1/2/3=180 tam kaydırma; fatalpointer,52px hedef ve beş sekme/sonTopluluk hit. Native20durum390x844: 51PNG/22benzersiz/29bayt eş alias. RAW/SHA/IHDR/kaydırma aralıkları doğrulanır. Root bütün22benzersizPNG ve D02 referansını gerçekten açtı: fit rehber üstte, engel gerekçesi ve beş sekme okunabilir, taşma yok. Bu headless kanıttır; fiziksel cihaz/insan incelemesi değildir. Bağımsız ilk okuma henüz beklenir.

## Yedi tasarım karşılaştırması

Tam ekran: scope/fit korunur; ticari alan altında. Komşu: previous-default null kaynak eski yüzeyi korur. Durum:20 kaynak/engel/eksik/loading/error/offline/uzun. Duyarlı:180 tam kaydırma. Erişilebilirlik:klavye/odak/semantics ve kontrast testleri. Kanonik:SCR010/D02/J012 kaynak türevli yardımcı alan; tam görsel/piksel/token onayı HELD. Regresyon:447eski test ve121BASEpin,16izinli yolun15i değişir; sponsor izinli olsa da baytça değişmez. RAWv87snapshot/v88/index113 mimari kapı beklenir.

## On kapanış katmanı

|katman|sonuç ve sınır|
|---|---|
|task|T021 yerel aday; bağımsız ilk/SOURCE/FINAL ve aynı baş CI bekler|
|feature|F1.9.2 yalnız ticari sunum sınırı; gerçek feed HELD|
|flow|FL1.9.2 PROPOSED/SCR-TBD onaysız; yeni flow kabulü yok|
|requirement|BR070071073 negatif sunum kanıtı; gerçek amaç doğrulaması değil|
|design|yedi sınırlı karşılaştırma; tam görsel/device/insan HELD|
|architecture|E1 render; E3/E5 otorite değişmez; public seam/YAML yok|
|data/migration|şema yok; eski sponsor model/kanıt subject korunur|
|release|yerel yalnız; SOURCE/FINAL CI-T3 ve olağan merge/main8 gerekir|
|product scenario|20 açık örnek; gerçek satıcı/satış/ödeme değildir|
|gap audit|feed/kimlik/router/fiziksel/insan/finaltokens/yayın HELD|

E3R1 REVIEW/E5 IN_PROGRESS ve önceki47/57/59/RET97 sınırları korunur. Üst ürün kabulü veya üretim hazır iddiası yok.

## RAW makbuzlar

modules/e01-app/internal/shell/lib/guide_discovery.dart LF SHA256 0cde53c96283d039c784a4d6cf6048274a44b045bb33afd1570db48cc07fa970.

modules/e01-app/internal/shell/lib/sponsored_marking.dart LF SHA256 9971fe5564ef3522a257c289fd0c53b7315b756288c083369eff0b530547df56.

modules/e01-app/internal/shell/lib/ranking_firewall.dart LF SHA256 1142d1485cf37b144b82db502bd635576e78ea91d21f1b2291f19d24db606de2.

modules/e01-app/internal/shell/test/ranking_firewall_test.dart LF SHA256 eb25606b20e11d542faad3e00dd7b8b7920bc324653f9bbbd9f9db9c36f03dbf.

modules/e01-app/internal/shell/test/fixtures/ranking_firewall_reading_questions.json LF SHA256 3cd276c0bee08555d7ed155cf03d23d52d9bd4d092b7e48fe9e11d2d3b6b5b19.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\target-r1.log RAW 1176 SHA256 cdc30ce2c4263b5cbf584a63205562fbcf1905d0bb8ff9e57e2a26b5ad0ee0dc.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\target-r2.log RAW 1176 SHA256 0d5758f408e8da868747c9d4107d2823e26b087f6bfb282671fdec68df2ab886.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\full-r1.log RAW 107341 SHA256 2b4879a784b68b26d002ed5adda8ffcf666fb4db5ca8a5876e9f404009bcf026.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\format-r1.log RAW 49 SHA256 6f3dfbaf4fb78c640357041f171a561bd3dffcd176a1cd5a79243475d7b327e1.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\analyze-r1.log RAW 385 SHA256 7b088f5767f80975f6bfd3fb4130a4c0b2dc0144cf43c196b6d9a6e39647e9ae.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r1.log RAW 1242 SHA256 ef39648e94bef15b711e33cfec572cd5dbd24a22e414bcbbda90a90ee494f096.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r1-manifest.txt RAW 5076 SHA256 e10f054925e25ff450635b745d6c7c7e7d2845c5da4e5c39869109feb0da0d25.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\attempt-r1-code.json RAW 50380 SHA256 dada489459cb9b21690c4ad268e3c2da02f5dd1e869eb360588b6723d0db6dd5.

C:\Users\Xpike\.codex\task-state\kavriva-e1021\scope-correction-command.txt RAW 599 SHA256 9d1706dae7c563ff70e9fba036d256f13c5504c3ec388a89815c3b004df5bbaa.

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|mixed|0|0.0/780.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-0.png|
|mixed|1|600.0/780.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-1.png|
|mixed|2|780.0/780.0|82242|093216cb5686a1bd1138a6cee8d2ba18849b61e8ee687065abebb9f3cf426484|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-2.png|
|only-sponsored|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-only-sponsored-0.png|
|only-sponsored|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-only-sponsored-1.png|
|only-sponsored|2|734.0/734.0|79445|d31630678118334caba9e42daebc2dc5d78cc0f17374d8ba75f7681ffcfa20b8|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-only-sponsored-2.png|
|unknown-disclosure|0|0.0/753.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-disclosure-0.png|
|unknown-disclosure|1|600.0/753.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-disclosure-1.png|
|unknown-disclosure|2|753.0/753.0|81479|d3fa2a8e68812a138d9f911fe78d68eac25ea54dbb87395d716782caf6974c3b|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-disclosure-2.png|
|missing-alternatives|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-alternatives-0.png|
|missing-alternatives|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-alternatives-1.png|
|missing-alternatives|2|734.0/734.0|79433|f41be991427f0fdc4577b45d633e1a1d1eb84e9a452b21a33fbaefa98718a8a9|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-alternatives-2.png|
|empty|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-empty-0.png|
|empty|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-empty-1.png|
|empty|2|734.0/734.0|79438|973f9383423f45b495c8a47f4b9f4bf59d9ab2a010ad0ce1e390e4d0c1600767|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-empty-2.png|
|loading|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-loading-0.png|
|loading|1|569.0/569.0|70580|9e1cb9cbd3c8b525ca70aafb215c3344a9199b293335bd0c509499c10faa4a7a|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-loading-1.png|
|failed|0|0.0/588.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-failed-0.png|
|failed|1|588.0/588.0|71019|02bb5a64e3dea66b2fcd8ccdabd931bff90eed36c5dad480a7aa7ca613bf29d8|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-failed-1.png|
|held|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-held-0.png|
|held|1|569.0/569.0|71765|be68eb89753e6edb61dd1c7c0253d126bbd62fc3e8615f8105ab9752ac399e80|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-held-1.png|
|missing-source|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-source-0.png|
|missing-source|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-source-1.png|
|missing-source|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-source-2.png|
|offline|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-offline-0.png|
|offline|1|569.0/569.0|72178|e99986e00520a868bb85da73737fcc94bae4e69177b88d6843dada9419c3ef58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-offline-1.png|
|stale|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-0.png|
|stale|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-1.png|
|stale|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-2.png|
|wrong-motorcycle|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-wrong-motorcycle-0.png|
|wrong-motorcycle|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-wrong-motorcycle-1.png|
|wrong-motorcycle|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-wrong-motorcycle-2.png|
|new-revision|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-new-revision-0.png|
|new-revision|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-new-revision-1.png|
|new-revision|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-new-revision-2.png|
|stale-scope|0|0.0/653.0|69394|2631815c59e5677970338e4b833e9030fcc20a169e8f9713afef0daa5424ffb8|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-scope-0.png|
|stale-scope|1|600.0/653.0|75564|97d9dea389dd57a9e47959301cf5f56559616aeb383be3af12dfc7d1164ca9c1|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-scope-1.png|
|stale-scope|2|653.0/653.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-scope-2.png|
|long|0|0.0/894.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-long-0.png|
|long|1|600.0/894.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-long-1.png|
|long|2|894.0/894.0|87048|edeead84df36930cbf4eb1eaf404576b65f25b4ef2a5c95c866d648d591f5a3e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-long-2.png|
|previous-default|0|0.0/153.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-previous-default-0.png|
|previous-default|1|153.0/153.0|63384|644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-previous-default-1.png|
|replaceGuide|0|0.0/401.0|66739|7f98f37cfc683606bb8c401cdf1632bda56a12a52a12b36e6ef1e68437cb539e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-replaceGuide-0.png|
|replaceGuide|1|401.0/401.0|70181|224ffe298e73e7abf1b00cc339d13946a36eb5b62b0d0f5692d03085f2b9223b|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-replaceGuide-1.png|
|salesTarget|0|0.0/401.0|66739|7f98f37cfc683606bb8c401cdf1632bda56a12a52a12b36e6ef1e68437cb539e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-salesTarget-0.png|
|salesTarget|1|401.0/401.0|69675|55fdccaf29a9a87477afc8114d292154f599068da5babd2754b17f19be60d98b|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-salesTarget-1.png|
|technicalRanking|0|0.0/401.0|66739|7f98f37cfc683606bb8c401cdf1632bda56a12a52a12b36e6ef1e68437cb539e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-technicalRanking-0.png|
|technicalRanking|1|401.0/401.0|70677|7f6d034b7dae00262ca6566cf43d35255e10ecb2cbc899533e8e9a529a562f04|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-technicalRanking-1.png|
|unknown|0|0.0/401.0|66739|7f98f37cfc683606bb8c401cdf1632bda56a12a52a12b36e6ef1e68437cb539e|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-0.png|
|unknown|1|401.0/401.0|70618|85b709fb41795f9b458711160d161d190a44c9eb76ecc7baca5a65abc92287a1|C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-1.png|

## İzlenebilir açık sınırlar

`vault/PACKS/P-E1-021.md` ve `vault/REGISTRY/T-E1-021.md`: HELD/TBD üst kapsam burada izlenir; üretim kabulü değildir. İlk graph-r1 açık sınır referansı eksik olduğu için FAIL; özgün kayıt korunur.

## İlk okuma ret bulgusu ve dar düzeltme — geçmiş korunur

R1 yalnız soru19 için CHANGES_REQUESTED: örnek teknik kararın gerçek motosiklet kararı olmadığı yeterince açık değildi. ranking_firewall_test.dart örnek reason metnine gerçek motosiklet kararı olmadığını belirten cümle eklendi. Ürün fit kararı/sponsor modeli/otorite/fixed20 değiştirilmedi. target-r3 7/full-r2 454/native-r3 8/format49zero PASS; graph-r1 açık referans FAIL korunur ve graph-r2 42test/worst0 PASS. Index113 REVIEW. Native R2 51PNG/22benzersiz/29alias. native-r2 komutu environment yerine dart-define kullandığı için yalnız7 test çalıştırdı, PNG üretmedi ve görsel kanıt sayılmaz; özgün log saklanır. Doğru environment native-r3 gerçek8/capture kanıtıdır. Bağımsız taze ilk okuma R2 beklenir; eski PASS olarak çevrilmez.

Özgün R1 raporu RAW5914 SHA 670519ed75fee2a5a4a00f8576aa8a94f4cadef1552994287d6debb976217e92. HTML normalize gösterim; TXT/Base64 bayt eşlik.
<pre>Bağımsız ilk okuma — native-r1
İnceleme sonucu: CHANGES_REQUESTED

Kapsam ve yöntem
Yalnızca native-r1-proof.json, unique-images.json, ranking_firewall_reading_questions.json ve kanıt dosyalarının gösterdiği PNG’ler okundu. Soru listesindeki 20 sabit soru, ekran görüntülerindeki ifadelerle yanıtlandı. 22 benzersiz PNG’nin her biri view_image ile açıldı. Bu rapor sınırlı ekran okumasıdır; üretim kabulü değildir.

Görüntülerden çıkarılabilen yanıtlar

1. Rehber, örnek bakım konusunun kapsamını tanıtıyor. Ticari bölüm diğer seçenekleri ve reklam bilgisini gösteriyor.
2. Hayır. Liste rehberin yerini alamaz.
3. Evet. Önce motosiklete uygunluk bilgisini okumak gerektiği yazıyor.
4. Hayır. Ücret veya sponsor desteği teknik uygunluğu ve bakım iznini değiştirmiyor.
5. Hayır. Satış hedefi rehberi değiştirmiyor; teknik uygunluğa etkisi olmadığı açık.
6. Hayır. Davranış ve satış ölçümleri teknik uygunluk seçimine katılmıyor.
7. Rehberin yerine geçmeye çalışan listede ticari ayrıntılar gösterilmiyor. Rehber ve uygunluk bilgisi yukarıda kalıyor.
8. Satışı artırma amacı taşıyan yönlendirme gösterilmediği belirtiliyor.
9. Ticari sıralama teknik uygunluk kararı gibi sunulmuyor; ticari ayrıntılar gösterilmiyor.
10. Kullanım amacı bilinmeyen listede amaç netleşene kadar ticari ayrıntılar gösterilmiyor.
11. Hayır. Liste engeli rehberi ve motosiklete uygunluk bilgisini gizlemiyor.
12. Rehber ve uygunluk bilgisi görünür kalıyor; hazırlık ve yeniden inceleme kontrolleri ekranda. Bazı kontrollerin kullanılamadığı ayrıca yazıyor; bu yüzden bütün yolların o anda çalıştığı sonucu çıkarılamaz.
13. Karma listede sponsorlu seçenek “ücretli reklam”, sponsor desteği olmayan seçenek ise kaynağa göre sponsor desteği yok etiketiyle ayrı gösteriliyor.
14. Sponsor bilgisi bilinmeyen seçenek reklamsız sayılmıyor; bilgi açıklanana kadar adı ve ticari ayrıntısı gösterilmiyor.
15. Hayır. Kaynak alternatif bilgisini vermediğinde bunun alternatif olmadığı anlamına gelmediği açıkça belirtiliyor. Boş kaynak için de aynı sınır yazıyor.
16. Motosiklet, rehber veya bilgi değişince eski listenin kullanılmaması ve kaynağın yeniden kontrol edilmesi isteniyor. Kaynak sürümü de gösteriliyor.
17. Hayır. Yüklemede eski liste güncelmiş gibi gösterilmiyor; hata, bekleme ve çevrimdışı durumlarında da eski listenin güncel kabul edilmediği veya kaynak kontrolü bitene kadar listenin gösterilmediği açıklanıyor.
18. Satın alma, ödeme veya servis rezervasyonu başlatılmıyor. Engelli durumda yeni bir uygulama izni de başlatılmıyor; okumak için hesap veya satın alma gerekmiyor.
19. Ticari seçenekler için hayır: kaynak “örnek gösterim” diyor ve gerçek satıcı veya teklif olmadığını açıkça belirtiyor. Teknik uygunluk tarafında kaynak “örnek teknik kaynak” diye adlandırılmış; ancak aynı ekranda “Uygunluk doğrulandı” ve “Kaynak durumu: güncel” de yazıyor. Kararın üretimde doğrulanmış gerçek bir karar olmadığı açıkça söylenmediği için bu sorunun ikinci kısmı kesin yanıtlanamıyor.
20. Alt çubukta Garaj, Bakım, AI Usta, Geçmiş ve Topluluk var. Alışveriş sekmesi görünmüyor.

Somut değişiklik isteği
Soru 19 için, uygunluk sonucu gösterilen ekrana kısa bir açıklama eklenmeli: bunun örnek ekran/verisi olduğu ve üretimde doğrulanmış gerçek teknik karar olmadığı açıkça belirtilmeli. “Uygunluk doğrulandı” ve “Kaynak durumu: güncel” ifadeleri, mevcut örnek kaynak etiketine rağmen gerçek karar izlenimi verebilir. Bu düzeltmeden sonra soru 19 yeniden ilk okumayla değerlendirilmelidir.

Görsel kanıt ve dosya ilişkileri
Proof içindeki 51 PNG kaydının dosya varlığı, byte sayısı ve SHA-256 değeri kontrol edildi; beklenen değerlerle uyuşmayan kayıt yok. 22 benzersiz dosyanın SHA değerleri birbirinden farklı. Proof’un aynı SHA altında topladığı beş alias grubu byte byte karşılaştırıldı; grup içindeki dosyalar eşit. Proof’taki 29 alias ilişkisi doğrulandı.

Açılan 22 benzersiz görüntü
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-0.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-mixed-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-only-sponsored-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-disclosure-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-alternatives-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-empty-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-loading-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-failed-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-held-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-source-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-missing-source-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-offline-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-scope-0.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-stale-scope-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-long-2.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-previous-default-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-replaceGuide-0.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-replaceGuide-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-salesTarget-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-technicalRanking-1.png
- C:/Users/Xpike/.codex/task-state/kavriva-e1021/native-r1-unknown-1.png
</pre>
RAWBase64 QmHEn8SxbXPEsXogaWxrIG9rdW1hIOKAlCBuYXRpdmUtcjEKxLBuY2VsZW1lIHNvbnVjdTogQ0hBTkdFU19SRVFVRVNURUQKCkthcHNhbSB2ZSB5w7ZudGVtCllhbG7EsXpjYSBuYXRpdmUtcjEtcHJvb2YuanNvbiwgdW5pcXVlLWltYWdlcy5qc29uLCByYW5raW5nX2ZpcmV3YWxsX3JlYWRpbmdfcXVlc3Rpb25zLmpzb24gdmUga2FuxLF0IGRvc3lhbGFyxLFuxLFuIGfDtnN0ZXJkacSfaSBQTkfigJlsZXIgb2t1bmR1LiBTb3J1IGxpc3Rlc2luZGVraSAyMCBzYWJpdCBzb3J1LCBla3JhbiBnw7Zyw7xudMO8bGVyaW5kZWtpIGlmYWRlbGVybGUgeWFuxLF0bGFuZMSxLiAyMiBiZW56ZXJzaXogUE5H4oCZbmluIGhlciBiaXJpIHZpZXdfaW1hZ2UgaWxlIGHDp8SxbGTEsS4gQnUgcmFwb3Igc8SxbsSxcmzEsSBla3JhbiBva3VtYXPEsWTEsXI7IMO8cmV0aW0ga2FidWzDvCBkZcSfaWxkaXIuCgpHw7Zyw7xudMO8bGVyZGVuIMOnxLFrYXLEsWxhYmlsZW4geWFuxLF0bGFyCgoxLiBSZWhiZXIsIMO2cm5layBiYWvEsW0ga29udXN1bnVuIGthcHNhbcSxbsSxIHRhbsSxdMSxeW9yLiBUaWNhcmkgYsO2bMO8bSBkacSfZXIgc2XDp2VuZWtsZXJpIHZlIHJla2xhbSBiaWxnaXNpbmkgZ8O2c3Rlcml5b3IuCjIuIEhhecSxci4gTGlzdGUgcmVoYmVyaW4geWVyaW5pIGFsYW1hei4KMy4gRXZldC4gw5ZuY2UgbW90b3Npa2xldGUgdXlndW5sdWsgYmlsZ2lzaW5pIG9rdW1hayBnZXJla3RpxJ9pIHlhesSxeW9yLgo0LiBIYXnEsXIuIMOcY3JldCB2ZXlhIHNwb25zb3IgZGVzdGXEn2kgdGVrbmlrIHV5Z3VubHXEn3UgdmUgYmFrxLFtIGl6bmluaSBkZcSfacWfdGlybWl5b3IuCjUuIEhhecSxci4gU2F0xLHFnyBoZWRlZmkgcmVoYmVyaSBkZcSfacWfdGlybWl5b3I7IHRla25payB1eWd1bmx1xJ9hIGV0a2lzaSBvbG1hZMSxxJ/EsSBhw6fEsWsuCjYuIEhhecSxci4gRGF2cmFuxLHFnyB2ZSBzYXTEscWfIMO2bMOnw7xtbGVyaSB0ZWtuaWsgdXlndW5sdWsgc2XDp2ltaW5lIGthdMSxbG3EsXlvci4KNy4gUmVoYmVyaW4geWVyaW5lIGdlw6dtZXllIMOnYWzEscWfYW4gbGlzdGVkZSB0aWNhcmkgYXlyxLFudMSxbGFyIGfDtnN0ZXJpbG1peW9yLiBSZWhiZXIgdmUgdXlndW5sdWsgYmlsZ2lzaSB5dWthcsSxZGEga2FsxLF5b3IuCjguIFNhdMSxxZ/EsSBhcnTEsXJtYSBhbWFjxLEgdGHFn8SxeWFuIHnDtm5sZW5kaXJtZSBnw7ZzdGVyaWxtZWRpxJ9pIGJlbGlydGlsaXlvci4KOS4gVGljYXJpIHPEsXJhbGFtYSB0ZWtuaWsgdXlndW5sdWsga2FyYXLEsSBnaWJpIHN1bnVsbXV5b3I7IHRpY2FyaSBheXLEsW50xLFsYXIgZ8O2c3RlcmlsbWl5b3IuCjEwLiBLdWxsYW7EsW0gYW1hY8SxIGJpbGlubWV5ZW4gbGlzdGVkZSBhbWHDpyBuZXRsZcWfZW5lIGthZGFyIHRpY2FyaSBheXLEsW50xLFsYXIgZ8O2c3RlcmlsbWl5b3IuCjExLiBIYXnEsXIuIExpc3RlIGVuZ2VsaSByZWhiZXJpIHZlIG1vdG9zaWtsZXRlIHV5Z3VubHVrIGJpbGdpc2luaSBnaXpsZW1peW9yLgoxMi4gUmVoYmVyIHZlIHV5Z3VubHVrIGJpbGdpc2kgZ8O2csO8bsO8ciBrYWzEsXlvcjsgaGF6xLFybMSxayB2ZSB5ZW5pZGVuIGluY2VsZW1lIGtvbnRyb2xsZXJpIGVrcmFuZGEuIEJhesSxIGtvbnRyb2xsZXJpbiBrdWxsYW7EsWxhbWFkxLHEn8SxIGF5csSxY2EgeWF6xLF5b3I7IGJ1IHnDvHpkZW4gYsO8dMO8biB5b2xsYXLEsW4gbyBhbmRhIMOnYWzEscWfdMSxxJ/EsSBzb251Y3Ugw6fEsWthcsSxbGFtYXouCjEzLiBLYXJtYSBsaXN0ZWRlIHNwb25zb3JsdSBzZcOnZW5layDigJzDvGNyZXRsaSByZWtsYW3igJ0sIHNwb25zb3IgZGVzdGXEn2kgb2xtYXlhbiBzZcOnZW5layBpc2Uga2F5bmHEn2EgZ8O2cmUgc3BvbnNvciBkZXN0ZcSfaSB5b2sgZXRpa2V0aXlsZSBheXLEsSBnw7ZzdGVyaWxpeW9yLgoxNC4gU3BvbnNvciBiaWxnaXNpIGJpbGlubWV5ZW4gc2XDp2VuZWsgcmVrbGFtc8SxeiBzYXnEsWxtxLF5b3I7IGJpbGdpIGHDp8Sxa2xhbmFuYSBrYWRhciBhZMSxIHZlIHRpY2FyaSBheXLEsW50xLFzxLEgZ8O2c3RlcmlsbWl5b3IuCjE1LiBIYXnEsXIuIEtheW5hayBhbHRlcm5hdGlmIGJpbGdpc2luaSB2ZXJtZWRpxJ9pbmRlIGJ1bnVuIGFsdGVybmF0aWYgb2xtYWTEscSfxLEgYW5sYW3EsW5hIGdlbG1lZGnEn2kgYcOnxLFrw6dhIGJlbGlydGlsaXlvci4gQm/FnyBrYXluYWsgacOnaW4gZGUgYXluxLEgc8SxbsSxciB5YXrEsXlvci4KMTYuIE1vdG9zaWtsZXQsIHJlaGJlciB2ZXlhIGJpbGdpIGRlxJ9pxZ9pbmNlIGVza2kgbGlzdGVuaW4ga3VsbGFuxLFsbWFtYXPEsSB2ZSBrYXluYcSfxLFuIHllbmlkZW4ga29udHJvbCBlZGlsbWVzaSBpc3Rlbml5b3IuIEtheW5hayBzw7xyw7xtw7wgZGUgZ8O2c3RlcmlsaXlvci4KMTcuIEhhecSxci4gWcO8a2xlbWVkZSBlc2tpIGxpc3RlIGfDvG5jZWxtacWfIGdpYmkgZ8O2c3RlcmlsbWl5b3I7IGhhdGEsIGJla2xlbWUgdmUgw6dldnJpbWTEscWfxLEgZHVydW1sYXLEsW5kYSBkYSBlc2tpIGxpc3RlbmluIGfDvG5jZWwga2FidWwgZWRpbG1lZGnEn2kgdmV5YSBrYXluYWsga29udHJvbMO8IGJpdGVuZSBrYWRhciBsaXN0ZW5pbiBnw7ZzdGVyaWxtZWRpxJ9pIGHDp8Sxa2xhbsSxeW9yLgoxOC4gU2F0xLFuIGFsbWEsIMO2ZGVtZSB2ZXlhIHNlcnZpcyByZXplcnZhc3lvbnUgYmHFn2xhdMSxbG3EsXlvci4gRW5nZWxsaSBkdXJ1bWRhIHllbmkgYmlyIHV5Z3VsYW1hIGl6bmkgZGUgYmHFn2xhdMSxbG3EsXlvcjsgb2t1bWFrIGnDp2luIGhlc2FwIHZleWEgc2F0xLFuIGFsbWEgZ2VyZWttaXlvci4KMTkuIFRpY2FyaSBzZcOnZW5la2xlciBpw6dpbiBoYXnEsXI6IGtheW5hayDigJzDtnJuZWsgZ8O2c3Rlcmlt4oCdIGRpeW9yIHZlIGdlcsOnZWsgc2F0xLFjxLEgdmV5YSB0ZWtsaWYgb2xtYWTEscSfxLFuxLEgYcOnxLFrw6dhIGJlbGlydGl5b3IuIFRla25payB1eWd1bmx1ayB0YXJhZsSxbmRhIGtheW5hayDigJzDtnJuZWsgdGVrbmlrIGtheW5ha+KAnSBkaXllIGFkbGFuZMSxcsSxbG3EscWfOyBhbmNhayBheW7EsSBla3JhbmRhIOKAnFV5Z3VubHVrIGRvxJ9ydWxhbmTEseKAnSB2ZSDigJxLYXluYWsgZHVydW11OiBnw7xuY2Vs4oCdIGRlIHlhesSxeW9yLiBLYXJhcsSxbiDDvHJldGltZGUgZG/En3J1bGFubcSxxZ8gZ2Vyw6dlayBiaXIga2FyYXIgb2xtYWTEscSfxLEgYcOnxLFrw6dhIHPDtnlsZW5tZWRpxJ9pIGnDp2luIGJ1IHNvcnVudW4gaWtpbmNpIGvEsXNtxLEga2VzaW4geWFuxLF0bGFuYW3EsXlvci4KMjAuIEFsdCDDp3VidWt0YSBHYXJhaiwgQmFrxLFtLCBBSSBVc3RhLCBHZcOnbWnFnyB2ZSBUb3BsdWx1ayB2YXIuIEFsxLHFn3ZlcmnFnyBzZWttZXNpIGfDtnLDvG5tw7x5b3IuCgpTb211dCBkZcSfacWfaWtsaWsgaXN0ZcSfaQpTb3J1IDE5IGnDp2luLCB1eWd1bmx1ayBzb251Y3UgZ8O2c3RlcmlsZW4gZWtyYW5hIGvEsXNhIGJpciBhw6fEsWtsYW1hIGVrbGVubWVsaTogYnVudW4gw7ZybmVrIGVrcmFuL3ZlcmlzaSBvbGR1xJ91IHZlIMO8cmV0aW1kZSBkb8SfcnVsYW5txLHFnyBnZXLDp2VrIHRla25payBrYXJhciBvbG1hZMSxxJ/EsSBhw6fEsWvDp2EgYmVsaXJ0aWxtZWxpLiDigJxVeWd1bmx1ayBkb8SfcnVsYW5kxLHigJ0gdmUg4oCcS2F5bmFrIGR1cnVtdTogZ8O8bmNlbOKAnSBpZmFkZWxlcmksIG1ldmN1dCDDtnJuZWsga2F5bmFrIGV0aWtldGluZSByYcSfbWVuIGdlcsOnZWsga2FyYXIgaXpsZW5pbWkgdmVyZWJpbGlyLiBCdSBkw7x6ZWx0bWVkZW4gc29ucmEgc29ydSAxOSB5ZW5pZGVuIGlsayBva3VtYXlsYSBkZcSfZXJsZW5kaXJpbG1lbGlkaXIuCgpHw7Zyc2VsIGthbsSxdCB2ZSBkb3N5YSBpbGnFn2tpbGVyaQpQcm9vZiBpw6dpbmRla2kgNTEgUE5HIGtheWTEsW7EsW4gZG9zeWEgdmFybMSxxJ/EsSwgYnl0ZSBzYXnEsXPEsSB2ZSBTSEEtMjU2IGRlxJ9lcmkga29udHJvbCBlZGlsZGk7IGJla2xlbmVuIGRlxJ9lcmxlcmxlIHV5dcWfbWF5YW4ga2F5xLF0IHlvay4gMjIgYmVuemVyc2l6IGRvc3lhbsSxbiBTSEEgZGXEn2VybGVyaSBiaXJiaXJpbmRlbiBmYXJrbMSxLiBQcm9vZuKAmXVuIGF5bsSxIFNIQSBhbHTEsW5kYSB0b3BsYWTEscSfxLEgYmXFnyBhbGlhcyBncnVidSBieXRlIGJ5dGUga2FyxZ/EsWxhxZ90xLFyxLFsZMSxOyBncnVwIGnDp2luZGVraSBkb3N5YWxhciBlxZ9pdC4gUHJvb2bigJl0YWtpIDI5IGFsaWFzIGlsacWfa2lzaSBkb8SfcnVsYW5kxLEuCgpBw6fEsWxhbiAyMiBiZW56ZXJzaXogZ8O2csO8bnTDvAotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLW1peGVkLTAucG5nCi0gQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAyMS9uYXRpdmUtcjEtbWl4ZWQtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1taXhlZC0yLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLW9ubHktc3BvbnNvcmVkLTIucG5nCi0gQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAyMS9uYXRpdmUtcjEtdW5rbm93bi1kaXNjbG9zdXJlLTIucG5nCi0gQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAyMS9uYXRpdmUtcjEtbWlzc2luZy1hbHRlcm5hdGl2ZXMtMi5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1lbXB0eS0yLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLWxvYWRpbmctMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1mYWlsZWQtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1oZWxkLTEucG5nCi0gQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAyMS9uYXRpdmUtcjEtbWlzc2luZy1zb3VyY2UtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1taXNzaW5nLXNvdXJjZS0yLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLW9mZmxpbmUtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1zdGFsZS1zY29wZS0wLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLXN0YWxlLXNjb3BlLTEucG5nCi0gQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAyMS9uYXRpdmUtcjEtbG9uZy0yLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLXByZXZpb3VzLWRlZmF1bHQtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1yZXBsYWNlR3VpZGUtMC5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1yZXBsYWNlR3VpZGUtMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS1zYWxlc1RhcmdldC0xLnBuZwotIEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMjEvbmF0aXZlLXIxLXRlY2huaWNhbFJhbmtpbmctMS5wbmcKLSBDOi9Vc2Vycy9YcGlrZS8uY29kZXgvdGFzay1zdGF0ZS9rYXZyaXZhLWUxMDIxL25hdGl2ZS1yMS11bmtub3duLTEucG5nCg==

C:\Users\Xpike\.codex\task-state\kavriva-e1021\target-r3.log RAW 1160 SHA ca003bf3b2213d36b90d0d0efae36fa1153477a7988cf112a87c71bb3ba49d90

C:\Users\Xpike\.codex\task-state\kavriva-e1021\full-r2.log RAW 105410 SHA 03e978c8c3fa0181800ac2b12b6be915d36529ff929ba85ecca35b60625d1e19

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3.log RAW 1225 SHA ed2df83cf7cfbdd6129ac38fb9ca75ebfa9e634779bee8e0ed3a7bf023b637ea

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-manifest.txt RAW 5076 SHA 1e0f4526af2ebfa8f07865fb90dc0c8a0757359c65ec057acb0db33ef9bb372d

C:\Users\Xpike\.codex\task-state\kavriva-e1021\format-r2.log RAW 48 SHA fc40e0c462519ba625c6e15281f0557950f51e069a69f669864873ae80060450

C:\Users\Xpike\.codex\task-state\kavriva-e1021\graph-r1.log RAW 8114 SHA c5a8c76269f1e9110de493bbbc3a37ac12b6323cc5fb66f81ddf356aa79820c3

C:\Users\Xpike\.codex\task-state\kavriva-e1021\graph-r2.log RAW 7960 SHA ce38d631d1cb94988562ebbe94adf50f3cb6eef4fd5c572fb491316d67b4ba96

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r2.log RAW 1160 SHA 553c5a0641b248f8ede77b99f1cc034c78eb5b67bace8ff491f33527d7abbe05

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|mixed|0|0.0/780.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-mixed-0.png|
|mixed|1|600.0/780.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-mixed-1.png|
|mixed|2|780.0/780.0|82242|093216cb5686a1bd1138a6cee8d2ba18849b61e8ee687065abebb9f3cf426484|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-mixed-2.png|
|only-sponsored|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-only-sponsored-0.png|
|only-sponsored|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-only-sponsored-1.png|
|only-sponsored|2|734.0/734.0|79445|d31630678118334caba9e42daebc2dc5d78cc0f17374d8ba75f7681ffcfa20b8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-only-sponsored-2.png|
|unknown-disclosure|0|0.0/753.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-unknown-disclosure-0.png|
|unknown-disclosure|1|600.0/753.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-unknown-disclosure-1.png|
|unknown-disclosure|2|753.0/753.0|81479|d3fa2a8e68812a138d9f911fe78d68eac25ea54dbb87395d716782caf6974c3b|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-unknown-disclosure-2.png|
|missing-alternatives|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-alternatives-0.png|
|missing-alternatives|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-alternatives-1.png|
|missing-alternatives|2|734.0/734.0|79433|f41be991427f0fdc4577b45d633e1a1d1eb84e9a452b21a33fbaefa98718a8a9|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-alternatives-2.png|
|empty|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-empty-0.png|
|empty|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-empty-1.png|
|empty|2|734.0/734.0|79438|973f9383423f45b495c8a47f4b9f4bf59d9ab2a010ad0ce1e390e4d0c1600767|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-empty-2.png|
|loading|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-loading-0.png|
|loading|1|569.0/569.0|70580|9e1cb9cbd3c8b525ca70aafb215c3344a9199b293335bd0c509499c10faa4a7a|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-loading-1.png|
|failed|0|0.0/588.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-failed-0.png|
|failed|1|588.0/588.0|71019|02bb5a64e3dea66b2fcd8ccdabd931bff90eed36c5dad480a7aa7ca613bf29d8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-failed-1.png|
|held|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-held-0.png|
|held|1|569.0/569.0|71765|be68eb89753e6edb61dd1c7c0253d126bbd62fc3e8615f8105ab9752ac399e80|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-held-1.png|
|missing-source|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-source-0.png|
|missing-source|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-source-1.png|
|missing-source|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-missing-source-2.png|
|offline|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-offline-0.png|
|offline|1|569.0/569.0|72178|e99986e00520a868bb85da73737fcc94bae4e69177b88d6843dada9419c3ef58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-offline-1.png|
|stale|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-0.png|
|stale|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-1.png|
|stale|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-2.png|
|wrong-motorcycle|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-wrong-motorcycle-0.png|
|wrong-motorcycle|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-wrong-motorcycle-1.png|
|wrong-motorcycle|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-wrong-motorcycle-2.png|
|new-revision|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-new-revision-0.png|
|new-revision|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-new-revision-1.png|
|new-revision|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-new-revision-2.png|
|stale-scope|0|0.0/653.0|69394|2631815c59e5677970338e4b833e9030fcc20a169e8f9713afef0daa5424ffb8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-scope-0.png|
|stale-scope|1|600.0/653.0|75564|97d9dea389dd57a9e47959301cf5f56559616aeb383be3af12dfc7d1164ca9c1|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-scope-1.png|
|stale-scope|2|653.0/653.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-stale-scope-2.png|
|long|0|0.0/894.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-long-0.png|
|long|1|600.0/894.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-long-1.png|
|long|2|894.0/894.0|87048|edeead84df36930cbf4eb1eaf404576b65f25b4ef2a5c95c866d648d591f5a3e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-long-2.png|
|previous-default|0|0.0/153.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-previous-default-0.png|
|previous-default|1|153.0/153.0|63384|644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-previous-default-1.png|
|replaceGuide|0|0.0/420.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-replaceGuide-0.png|
|replaceGuide|1|420.0/420.0|71385|9d3778ef113a59183d2e30c0d86f500ef05437d9988b52c2164dcf3cf5e8e52b|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-replaceGuide-1.png|
|salesTarget|0|0.0/420.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-salesTarget-0.png|
|salesTarget|1|420.0/420.0|70882|bcd5112bb583962117a9521edb538217ad25aff644876e97892a3731f694da56|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-salesTarget-1.png|
|technicalRanking|0|0.0/420.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-technicalRanking-0.png|
|technicalRanking|1|420.0/420.0|71864|fff3f7f5aa74ac74d6cdc17b8cf37ebac6ad2bf91f28a452c1106ee43c59ca88|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-technicalRanking-1.png|
|unknown|0|0.0/420.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-unknown-0.png|
|unknown|1|420.0/420.0|71807|f7e6303366bff4dbf386b0e4557d7d089e79fe7e5db21b289cd555bd97639217|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r3-unknown-1.png|

## İkinci ilk okuma ret bulgusu ve dar ürün metni düzeltmesi

R2 yalnız soru12 için CHANGES_REQUESTED. Sabit soru değiştirilmedi. Engellenen ticari alanda, önceden kullanılabilen rehber yollarının kapanmadığı ve kullanılamayan yolun ticari listeyle açılmadığı açıklandı. Fit, rehber hedefi ve callback davranışı değişmedi. Önceki CODE a7d9b356c88f407f40fa3f35db4ddef66b7b03a6 tarihsel adaydır; yeni kod ayrı başla doğrulanır. Target-r4 7/full-r3 454/format49zero/native-r4 8 PASS. Native 51/22/29; taze geçmişsiz ilk okuma beklenir. EDEV121 eski subject özeti önceki adayındı, son metnin LF SHA 03514fbdef7b2b643b19a3e840411d38abd41062bcbf34e20866c986bdd4c863 olarak ayrı güncellendi; eski gövde/raporlar saklanır. Ana109/97/206 değişmez.

Tam özgün R2 raporu7108bayt/SHA 91d684130e91cbcaa4e0bbb1de0dd028f1f5fb88cf27c36315525a16a0388660. HTML normalize gösterim; tam bayt TXT/Base64.
<pre>Bağımsız kör ilk okuma — R2
Karar: CHANGES_REQUESTED

Kapsam ve yöntem
Yalnızca izin verilen JSON kayıtları, sabit 20 soru ve onlarda belirtilen PNG dosyaları kullanıldı. unique-images-r3.json içindeki 22 PNG&#x27;nin her biri view_image ile ayrı ayrı açıldı. Kod, plan, paket, görev metni veya önceki değerlendirme okunmadı. Bu görsel ilk okuma üretim doğrulaması ya da insan/cihaz kabulü değildir.

Model etiketi
İstenen gpt-6-luna/max etiketi bu oturumun görünür çalışma zamanı bilgisinden bağımsız biçimde doğrulanamıyor. Bu rapor model/efor etiketinin doğrulandığını iddia etmez.

Ham dosya doğrulaması
native-r3-proof.json toplam 51 dosya kaydı ve 20 vaka bildiriyor. 51 dosyanın gerçek bayt uzunluğu, PNG IHDR piksel boyutu ve dosya SHA-256 özeti kayıttaki değerlerle eşleşti. Hesaplanan farklı SHA-256 sayısı 22; unique-images-r3.json da 22 kayıt içeriyor. Beş tekrar grubundaki dosyalar aynı SHA değerine ek olarak gerçek içerik byte dizisi bakımından da eşit. 29 takma kayıt doğrulandı. Uyumsuzluk yok.

Benzersiz PNG&#x27;ler: dosya — gerçek bayt — piksel boyutu — SHA-256
native-r3-mixed-0.png — 67762 — 390×844 — 551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58
native-r3-mixed-1.png — 75881 — 390×844 — 8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e
native-r3-mixed-2.png — 82242 — 390×844 — 093216cb5686a1bd1138a6cee8d2ba18849b61e8ee687065abebb9f3cf426484
native-r3-only-sponsored-2.png — 79445 — 390×844 — d31630678118334caba9e42daebc2dc5d78cc0f17374d8ba75f7681ffcfa20b8
native-r3-unknown-disclosure-2.png — 81479 — 390×844 — d3fa2a8e68812a138d9f911fe78d68eac25ea54dbb87395d716782caf6974c3b
native-r3-missing-alternatives-2.png — 79433 — 390×844 — f41be991427f0fdc4577b45d633e1a1d1eb84e9a452b21a33fbaefa98718a8a9
native-r3-empty-2.png — 79438 — 390×844 — 973f9383423f45b495c8a47f4b9f4bf59d9ab2a010ad0ce1e390e4d0c1600767
native-r3-loading-1.png — 70580 — 390×844 — 9e1cb9cbd3c8b525ca70aafb215c3344a9199b293335bd0c509499c10faa4a7a
native-r3-failed-1.png — 71019 — 390×844 — 02bb5a64e3dea66b2fcd8ccdabd931bff90eed36c5dad480a7aa7ca613bf29d8
native-r3-held-1.png — 71765 — 390×844 — be68eb89753e6edb61dd1c7c0253d126bbd62fc3e8615f8105ab9752ac399e80
native-r3-missing-source-1.png — 74745 — 390×844 — 871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40
native-r3-missing-source-2.png — 74501 — 390×844 — 869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65
native-r3-offline-1.png — 72178 — 390×844 — e99986e00520a868bb85da73737fcc94bae4e69177b88d6843dada9419c3ef58
native-r3-stale-scope-0.png — 69394 — 390×844 — 2631815c59e5677970338e4b833e9030fcc20a169e8f9713afef0daa5424ffb8
native-r3-stale-scope-1.png — 75564 — 390×844 — 97d9dea389dd57a9e47959301cf5f56559616aeb383be3af12dfc7d1164ca9c1
native-r3-long-2.png — 87048 — 390×844 — edeead84df36930cbf4eb1eaf404576b65f25b4ef2a5c95c866d648d591f5a3e
native-r3-previous-default-1.png — 63384 — 390×844 — 644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b
native-r3-replaceGuide-0.png — 70043 — 390×844 — 1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3
native-r3-replaceGuide-1.png — 71385 — 390×844 — 9d3778ef113a59183d2e30c0d86f500ef05437d9988b52c2164dcf3cf5e8e52b
native-r3-salesTarget-1.png — 70882 — 390×844 — bcd5112bb583962117a9521edb538217ad25aff644876e97892a3731f694da56
native-r3-technicalRanking-1.png — 71864 — 390×844 — fff3f7f5aa74ac74d6cdc17b8cf37ebac6ad2bf91f28a452c1106ee43c59ca88
native-r3-unknown-1.png — 71807 — 390×844 — f7e6303366bff4dbf386b0e4557d7d089e79fe7e5db21b289cd555bd97639217

Byte eşitliği doğrulanan tekrar grupları (dosya sayısı)
551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58 — 15
8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e — 6
869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65 — 5
871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40 — 4
1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3 — 4

Sabit 20 soruya görsellerden yanıt
1. Rehber örnek bakım konusunun kapsamını tanıtır; uygulama adımı değildir. Ticari bölüm, kaynaktaki örnek seçenekleri ve reklam bilgisini gösterir; gerçek satıcı veya teklif değildir.
2. Hayır. Ticari liste rehberin yerini almaz.
3. Evet. Ekran önce yukarıdaki motosiklet uygunluğu bilgisini okumayı söylüyor.
4. Hayır. Ücret veya sponsor desteği teknik uygunluğu değiştirmez.
5. Hayır. Satış hedefi rehberi değiştirmez.
6. Hayır. Davranış ve satış ölçümleri teknik uygunluk seçimine katılmaz.
7. Rehber yerine sunulmaya çalışılan listenin ticari ayrıntıları gösterilmez; rehber ve uygunluk bilgisi görünür kalır.
8. Hayır. Satış artırma amacı taşıyan yönlendirme gösterilmediği yazıyor.
9. Ticari sıralama teknik uygunluk kararı gibi sunulamaz; ticari ayrıntılar gösterilmez.
10. Hayır. Amaç netleşmeden ticari ayrıntılar gösterilmez.
11. Hayır. Engelleme rehberi ve motosiklet uygunluğu bilgisini gizlemiyor.
12. Rehber ve uygunluk bilgisi yukarıda okunabilir. Ancak “mevcut yollar”ın tamamının işlevsel kaldığı açık değil; ekranda ayrım kontrolünün açılamadığı da yazıyor. Ayrıntı aşağıdaki belirsizlikte.
13. Evet. Örnek sponsorlu seçenek ücretli reklam diye; sponsor desteği olmayan örnek seçenek ayrı etiketle gösteriliyor.
14. Hayır. Sponsor durumu bilinmeyen seçenek reklamsız sayılmıyor; açıklama gelene kadar adı ve ticari ayrıntısı gösterilmiyor.
15. Hayır. Kaynağın alternatifleri bildirmemesi, başka alternatif bulunmadığını göstermez.
16. Hayır. Motosiklet, rehber veya bilgi değişince eski liste kullanılmamalı; kaynak yeniden kontrol edilmeli.
17. Hayır. Yüklemede eski liste güncelmiş gibi gösterilmiyor; hata ve çevrimdışında kaynak yeniden kontrol edilene kadar eski liste güncel teklif sayılmıyor.
18. Hayır. Satın alma, ödeme, servis rezervasyonu veya yeni uygulama izni başlatılmıyor.
19. Hayır. Gösterim örnek; gerçek satıcı/teklif ya da gerçek motosiklete verilmiş karar değil.
20. Alt çubuk: Garaj, Bakım, AI Usta, Geçmiş, Topluluk. Alışveriş sekmesi görünmüyor.

Somut belirsizlik ve dar onarım
12. soru iki ayrı iddiayı tekleştiriyor: uygunluk bilgisinin okunabilir kalması ve “mevcut yollar”ın korunması. Görsel, bilginin gizlenmediğini ve okunabileceğini açıkça söylüyor; fakat tüm işlem yollarının çalışır kaldığını doğrulamıyor. “Ayrım kontrolü şu anda açılamıyor” yazısı bir yolun kullanılamadığını gösteriyor. Soruyu yalnızca uygunluk bilgisinin görünürlüğü/okunabilirliği hakkında daraltın veya hangi mevcut işlemlerin kullanılabilir kaldığını ekranda açıkça belirtin. Bu nedenle geçiş kararı CHANGES_REQUESTED.

Rapor kodlaması
UTF-8, BOM yok, satır sonları LF olarak kaydedildi.</pre>
RAWBase64 QmHEn8SxbXPEsXoga8O2ciBpbGsgb2t1bWEg4oCUIFIyCkthcmFyOiBDSEFOR0VTX1JFUVVFU1RFRAoKS2Fwc2FtIHZlIHnDtm50ZW0KWWFsbsSxemNhIGl6aW4gdmVyaWxlbiBKU09OIGthecSxdGxhcsSxLCBzYWJpdCAyMCBzb3J1IHZlIG9ubGFyZGEgYmVsaXJ0aWxlbiBQTkcgZG9zeWFsYXLEsSBrdWxsYW7EsWxkxLEuIHVuaXF1ZS1pbWFnZXMtcjMuanNvbiBpw6dpbmRla2kgMjIgUE5HJ25pbiBoZXIgYmlyaSB2aWV3X2ltYWdlIGlsZSBheXLEsSBheXLEsSBhw6fEsWxkxLEuIEtvZCwgcGxhbiwgcGFrZXQsIGfDtnJldiBtZXRuaSB2ZXlhIMO2bmNla2kgZGXEn2VybGVuZGlybWUgb2t1bm1hZMSxLiBCdSBnw7Zyc2VsIGlsayBva3VtYSDDvHJldGltIGRvxJ9ydWxhbWFzxLEgeWEgZGEgaW5zYW4vY2loYXoga2FidWzDvCBkZcSfaWxkaXIuCgpNb2RlbCBldGlrZXRpCsSwc3RlbmVuIGdwdC02LWx1bmEvbWF4IGV0aWtldGkgYnUgb3R1cnVtdW4gZ8O2csO8bsO8ciDDp2FsxLHFn21hIHphbWFuxLEgYmlsZ2lzaW5kZW4gYmHEn8SxbXPEsXogYmnDp2ltZGUgZG/En3J1bGFuYW3EsXlvci4gQnUgcmFwb3IgbW9kZWwvZWZvciBldGlrZXRpbmluIGRvxJ9ydWxhbmTEscSfxLFuxLEgaWRkaWEgZXRtZXouCgpIYW0gZG9zeWEgZG/En3J1bGFtYXPEsQpuYXRpdmUtcjMtcHJvb2YuanNvbiB0b3BsYW0gNTEgZG9zeWEga2F5ZMSxIHZlIDIwIHZha2EgYmlsZGlyaXlvci4gNTEgZG9zeWFuxLFuIGdlcsOnZWsgYmF5dCB1enVubHXEn3UsIFBORyBJSERSIHBpa3NlbCBib3l1dHUgdmUgZG9zeWEgU0hBLTI1NiDDtnpldGkga2F5xLF0dGFraSBkZcSfZXJsZXJsZSBlxZ9sZcWfdGkuIEhlc2FwbGFuYW4gZmFya2zEsSBTSEEtMjU2IHNhecSxc8SxIDIyOyB1bmlxdWUtaW1hZ2VzLXIzLmpzb24gZGEgMjIga2F5xLF0IGnDp2VyaXlvci4gQmXFnyB0ZWtyYXIgZ3J1YnVuZGFraSBkb3N5YWxhciBheW7EsSBTSEEgZGXEn2VyaW5lIGVrIG9sYXJhayBnZXLDp2VrIGnDp2VyaWsgYnl0ZSBkaXppc2kgYmFrxLFtxLFuZGFuIGRhIGXFn2l0LiAyOSB0YWttYSBrYXnEsXQgZG/En3J1bGFuZMSxLiBVeXVtc3V6bHVrIHlvay4KCkJlbnplcnNpeiBQTkcnbGVyOiBkb3N5YSDigJQgZ2Vyw6dlayBiYXl0IOKAlCBwaWtzZWwgYm95dXR1IOKAlCBTSEEtMjU2Cm5hdGl2ZS1yMy1taXhlZC0wLnBuZyDigJQgNjc3NjIg4oCUIDM5MMOXODQ0IOKAlCA1NTFlZGE1MzMyMGFiMjJjZDQ1NzI5MWI3NTk5YjhmOTM3MDJiODg1ODQxMjA3MDBjNTBiYmQzMjVlZGFmZjU4Cm5hdGl2ZS1yMy1taXhlZC0xLnBuZyDigJQgNzU4ODEg4oCUIDM5MMOXODQ0IOKAlCA4Y2ZkNmEzMWI4ZGMzODc4ZDg5N2M0NjY2NDYxOWUyODE0YzhmNmViNGFmMjM4ZmZkMTc3MTViZWIzZTM0ZTZlCm5hdGl2ZS1yMy1taXhlZC0yLnBuZyDigJQgODIyNDIg4oCUIDM5MMOXODQ0IOKAlCAwOTMyMTZjYjU2ODZhMWJkMTEzOGE2Y2VlOGQyYmExODg0OWI2MWU4ZWU2ODcwNjVhYmViYjlmM2NmNDI2NDg0Cm5hdGl2ZS1yMy1vbmx5LXNwb25zb3JlZC0yLnBuZyDigJQgNzk0NDUg4oCUIDM5MMOXODQ0IOKAlCBkMzE2MzA2NzgxMTgzMzRjYWJhOWU0MmRhZWJjMmRjNWQ3OGNjMGYxNzM3NGQ4YmE3NWY3NjgxZmZjZmEyMGI4Cm5hdGl2ZS1yMy11bmtub3duLWRpc2Nsb3N1cmUtMi5wbmcg4oCUIDgxNDc5IOKAlCAzOTDDlzg0NCDigJQgZDNmYTJhOGU2ODgxMmExMzhkOWY5MTFmZTc4ZDY4ZWFjMjVlYTU0ZGJiODczOTVkNzE2NzgyY2FmNjk3NGMzYgpuYXRpdmUtcjMtbWlzc2luZy1hbHRlcm5hdGl2ZXMtMi5wbmcg4oCUIDc5NDMzIOKAlCAzOTDDlzg0NCDigJQgZjQxYmU5OTE0MjdmMGZkYzQ1NzdiNDVkNjMzZTFhMWQxZWI4NGU5YTQ1MmIyMWEzM2ZiYWVmYTk4NzE4YThhOQpuYXRpdmUtcjMtZW1wdHktMi5wbmcg4oCUIDc5NDM4IOKAlCAzOTDDlzg0NCDigJQgOTczZjkzODM0MjNmNDViNDk1YzhhNDdmNGI5ZjRiZjU5ZDlhYjJhMDEwYWQwY2UxZTM5MGU0ZDBjMTYwMDc2NwpuYXRpdmUtcjMtbG9hZGluZy0xLnBuZyDigJQgNzA1ODAg4oCUIDM5MMOXODQ0IOKAlCA5ZTFjYjljYmQzYzhiNTI1Y2E3MGFhZmIyMTVjMzM0NGE5MTk5YjI5MzMzNWJkMGM1MDk0OTljMTBmYWE0YTdhCm5hdGl2ZS1yMy1mYWlsZWQtMS5wbmcg4oCUIDcxMDE5IOKAlCAzOTDDlzg0NCDigJQgMDJiYjVhNjRlM2RlYTY2YjJmY2Q4Y2NkYWJkOTMxYmZmOTBlZWQzNmM1ZGFkNDgwYTdhYTdjYTYxM2JmMjlkOApuYXRpdmUtcjMtaGVsZC0xLnBuZyDigJQgNzE3NjUg4oCUIDM5MMOXODQ0IOKAlCBiZTY4ZWI4OTc1M2U2ZWRiNjFkZDFjN2MwMjUzZDEyNmJiZDYyZmMzZTg2MTVmODEwNWFiOTc1MmFjMzk5ZTgwCm5hdGl2ZS1yMy1taXNzaW5nLXNvdXJjZS0xLnBuZyDigJQgNzQ3NDUg4oCUIDM5MMOXODQ0IOKAlCA4NzFiNGZlOTRmOTQ2ZDdhNDQyNDYzNzZiMGMzMDQ5OTBmZTBmNDJiYWE3ZTkyZTdlMzVhMGIwNjYxYzA4ZTQwCm5hdGl2ZS1yMy1taXNzaW5nLXNvdXJjZS0yLnBuZyDigJQgNzQ1MDEg4oCUIDM5MMOXODQ0IOKAlCA4NjlmYTVkNTYxMzhkODdlYWFlNWZhZTYwNzM4OWVkNDNjNzgyMGNhMTExNDE5OGI2NGQzYjMzMTgxMjkzYzY1Cm5hdGl2ZS1yMy1vZmZsaW5lLTEucG5nIOKAlCA3MjE3OCDigJQgMzkww5c4NDQg4oCUIGU5OTk4NmUwMDUyMGE4NjhiYjg1ZGE3MzczN2ZjYzk0YmFlNGU2OTE3N2I4OGQ2ODQzZGFkYTk0MTljM2VmNTgKbmF0aXZlLXIzLXN0YWxlLXNjb3BlLTAucG5nIOKAlCA2OTM5NCDigJQgMzkww5c4NDQg4oCUIDI2MzE4MTVjNTllNTY3Nzk3MDMzOGU0YjgzM2U5MDMwZmNjMjBhMTY5ZThmOTcxM2FmZWYwZGFhNTQyNGZmYjgKbmF0aXZlLXIzLXN0YWxlLXNjb3BlLTEucG5nIOKAlCA3NTU2NCDigJQgMzkww5c4NDQg4oCUIDk3ZDlkZWEzODlkZDU3YTllNDc5NTkzMDFjZjVmNTY1NTk2MTZhZWIzODNiZTNhZjEyZGZjN2QxMTY0Y2E5YzEKbmF0aXZlLXIzLWxvbmctMi5wbmcg4oCUIDg3MDQ4IOKAlCAzOTDDlzg0NCDigJQgZWRlZWFkODRkZjM2OTMwY2JmNGViMWVhZjQwNDU3NmI2NWYyNWI0ZWYyYTVjOTVjODY2ZDY0OGQ1OTFmNWEzZQpuYXRpdmUtcjMtcHJldmlvdXMtZGVmYXVsdC0xLnBuZyDigJQgNjMzODQg4oCUIDM5MMOXODQ0IOKAlCA2NDRlMWQ2OGM0NTg1N2M1YzQ1MTRlNDBkOTVjMDVlY2M1ZjVkZGE1ZTBhMWYzYzkxNTRiOTBjYWFjZDAzYzliCm5hdGl2ZS1yMy1yZXBsYWNlR3VpZGUtMC5wbmcg4oCUIDcwMDQzIOKAlCAzOTDDlzg0NCDigJQgMWExNWUyMWEzN2Q0MmVjMmRhY2Y3NGE2MmUwMzg5NWRhNDE1NmM1YWU4ZWU2NTAwNTg2MmE1NjdmNGQ5NTJmMwpuYXRpdmUtcjMtcmVwbGFjZUd1aWRlLTEucG5nIOKAlCA3MTM4NSDigJQgMzkww5c4NDQg4oCUIDlkMzc3OGVmMTEzYTU5MTgzZDJlMzBjMGQ4NmY1MDBlZjA1NDM3ZDk5ODhiNTJjMjE2NGRjZjNjZjVlOGU1MmIKbmF0aXZlLXIzLXNhbGVzVGFyZ2V0LTEucG5nIOKAlCA3MDg4MiDigJQgMzkww5c4NDQg4oCUIGJjZDUxMTJiYjU4Mzk2MjExN2E5NTIxZWRiNTM4MjE3YWQyNWFmZjY0NDg3NmU5Nzg5MmEzNzMxZjY5NGRhNTYKbmF0aXZlLXIzLXRlY2huaWNhbFJhbmtpbmctMS5wbmcg4oCUIDcxODY0IOKAlCAzOTDDlzg0NCDigJQgZmZmM2Y3ZjVhYTc0YWM3NGQ2Y2RjMTdiOGNmMzdlYmFjNmFkMmJmOTFmMjhhNDUyYzExMDZlZTQzYzU5Y2E4OApuYXRpdmUtcjMtdW5rbm93bi0xLnBuZyDigJQgNzE4MDcg4oCUIDM5MMOXODQ0IOKAlCBmN2U2MzAzMzY2YmZmNGRiZjM4NmIwZTQ1NTdkN2QwODllNzlmZTdlNWRiMjFiMjg5Y2Q1NTViZDk3NjM5MjE3CgpCeXRlIGXFn2l0bGnEn2kgZG/En3J1bGFuYW4gdGVrcmFyIGdydXBsYXLEsSAoZG9zeWEgc2F5xLFzxLEpCjU1MWVkYTUzMzIwYWIyMmNkNDU3MjkxYjc1OTliOGY5MzcwMmI4ODU4NDEyMDcwMGM1MGJiZDMyNWVkYWZmNTgg4oCUIDE1CjhjZmQ2YTMxYjhkYzM4NzhkODk3YzQ2NjY0NjE5ZTI4MTRjOGY2ZWI0YWYyMzhmZmQxNzcxNWJlYjNlMzRlNmUg4oCUIDYKODY5ZmE1ZDU2MTM4ZDg3ZWFhZTVmYWU2MDczODllZDQzYzc4MjBjYTExMTQxOThiNjRkM2IzMzE4MTI5M2M2NSDigJQgNQo4NzFiNGZlOTRmOTQ2ZDdhNDQyNDYzNzZiMGMzMDQ5OTBmZTBmNDJiYWE3ZTkyZTdlMzVhMGIwNjYxYzA4ZTQwIOKAlCA0CjFhMTVlMjFhMzdkNDJlYzJkYWNmNzRhNjJlMDM4OTVkYTQxNTZjNWFlOGVlNjUwMDU4NjJhNTY3ZjRkOTUyZjMg4oCUIDQKClNhYml0IDIwIHNvcnV5YSBnw7Zyc2VsbGVyZGVuIHlhbsSxdAoxLiBSZWhiZXIgw7ZybmVrIGJha8SxbSBrb251c3VudW4ga2Fwc2FtxLFuxLEgdGFuxLF0xLFyOyB1eWd1bGFtYSBhZMSxbcSxIGRlxJ9pbGRpci4gVGljYXJpIGLDtmzDvG0sIGtheW5ha3Rha2kgw7ZybmVrIHNlw6dlbmVrbGVyaSB2ZSByZWtsYW0gYmlsZ2lzaW5pIGfDtnN0ZXJpcjsgZ2Vyw6dlayBzYXTEsWPEsSB2ZXlhIHRla2xpZiBkZcSfaWxkaXIuCjIuIEhhecSxci4gVGljYXJpIGxpc3RlIHJlaGJlcmluIHllcmluaSBhbG1hei4KMy4gRXZldC4gRWtyYW4gw7ZuY2UgeXVrYXLEsWRha2kgbW90b3Npa2xldCB1eWd1bmx1xJ91IGJpbGdpc2luaSBva3VtYXnEsSBzw7Z5bMO8eW9yLgo0LiBIYXnEsXIuIMOcY3JldCB2ZXlhIHNwb25zb3IgZGVzdGXEn2kgdGVrbmlrIHV5Z3VubHXEn3UgZGXEn2nFn3Rpcm1lei4KNS4gSGF5xLFyLiBTYXTEscWfIGhlZGVmaSByZWhiZXJpIGRlxJ9pxZ90aXJtZXouCjYuIEhhecSxci4gRGF2cmFuxLHFnyB2ZSBzYXTEscWfIMO2bMOnw7xtbGVyaSB0ZWtuaWsgdXlndW5sdWsgc2XDp2ltaW5lIGthdMSxbG1hei4KNy4gUmVoYmVyIHllcmluZSBzdW51bG1heWEgw6dhbMSxxZ/EsWxhbiBsaXN0ZW5pbiB0aWNhcmkgYXlyxLFudMSxbGFyxLEgZ8O2c3RlcmlsbWV6OyByZWhiZXIgdmUgdXlndW5sdWsgYmlsZ2lzaSBnw7Zyw7xuw7xyIGthbMSxci4KOC4gSGF5xLFyLiBTYXTEscWfIGFydMSxcm1hIGFtYWPEsSB0YcWfxLF5YW4gecO2bmxlbmRpcm1lIGfDtnN0ZXJpbG1lZGnEn2kgeWF6xLF5b3IuCjkuIFRpY2FyaSBzxLFyYWxhbWEgdGVrbmlrIHV5Z3VubHVrIGthcmFyxLEgZ2liaSBzdW51bGFtYXo7IHRpY2FyaSBheXLEsW50xLFsYXIgZ8O2c3RlcmlsbWV6LgoxMC4gSGF5xLFyLiBBbWHDpyBuZXRsZcWfbWVkZW4gdGljYXJpIGF5csSxbnTEsWxhciBnw7ZzdGVyaWxtZXouCjExLiBIYXnEsXIuIEVuZ2VsbGVtZSByZWhiZXJpIHZlIG1vdG9zaWtsZXQgdXlndW5sdcSfdSBiaWxnaXNpbmkgZ2l6bGVtaXlvci4KMTIuIFJlaGJlciB2ZSB1eWd1bmx1ayBiaWxnaXNpIHl1a2FyxLFkYSBva3VuYWJpbGlyLiBBbmNhayDigJxtZXZjdXQgeW9sbGFy4oCdxLFuIHRhbWFtxLFuxLFuIGnFn2xldnNlbCBrYWxkxLHEn8SxIGHDp8SxayBkZcSfaWw7IGVrcmFuZGEgYXlyxLFtIGtvbnRyb2zDvG7DvG4gYcOnxLFsYW1hZMSxxJ/EsSBkYSB5YXrEsXlvci4gQXlyxLFudMSxIGHFn2HEn8SxZGFraSBiZWxpcnNpemxpa3RlLgoxMy4gRXZldC4gw5ZybmVrIHNwb25zb3JsdSBzZcOnZW5layDDvGNyZXRsaSByZWtsYW0gZGl5ZTsgc3BvbnNvciBkZXN0ZcSfaSBvbG1heWFuIMO2cm5layBzZcOnZW5layBheXLEsSBldGlrZXRsZSBnw7ZzdGVyaWxpeW9yLgoxNC4gSGF5xLFyLiBTcG9uc29yIGR1cnVtdSBiaWxpbm1leWVuIHNlw6dlbmVrIHJla2xhbXPEsXogc2F5xLFsbcSxeW9yOyBhw6fEsWtsYW1hIGdlbGVuZSBrYWRhciBhZMSxIHZlIHRpY2FyaSBheXLEsW50xLFzxLEgZ8O2c3RlcmlsbWl5b3IuCjE1LiBIYXnEsXIuIEtheW5hxJ/EsW4gYWx0ZXJuYXRpZmxlcmkgYmlsZGlybWVtZXNpLCBiYcWfa2EgYWx0ZXJuYXRpZiBidWx1bm1hZMSxxJ/EsW7EsSBnw7ZzdGVybWV6LgoxNi4gSGF5xLFyLiBNb3Rvc2lrbGV0LCByZWhiZXIgdmV5YSBiaWxnaSBkZcSfacWfaW5jZSBlc2tpIGxpc3RlIGt1bGxhbsSxbG1hbWFsxLE7IGtheW5hayB5ZW5pZGVuIGtvbnRyb2wgZWRpbG1lbGkuCjE3LiBIYXnEsXIuIFnDvGtsZW1lZGUgZXNraSBsaXN0ZSBnw7xuY2VsbWnFnyBnaWJpIGfDtnN0ZXJpbG1peW9yOyBoYXRhIHZlIMOnZXZyaW1kxLHFn8SxbmRhIGtheW5hayB5ZW5pZGVuIGtvbnRyb2wgZWRpbGVuZSBrYWRhciBlc2tpIGxpc3RlIGfDvG5jZWwgdGVrbGlmIHNhecSxbG3EsXlvci4KMTguIEhhecSxci4gU2F0xLFuIGFsbWEsIMO2ZGVtZSwgc2VydmlzIHJlemVydmFzeW9udSB2ZXlhIHllbmkgdXlndWxhbWEgaXpuaSBiYcWfbGF0xLFsbcSxeW9yLgoxOS4gSGF5xLFyLiBHw7ZzdGVyaW0gw7ZybmVrOyBnZXLDp2VrIHNhdMSxY8SxL3Rla2xpZiB5YSBkYSBnZXLDp2VrIG1vdG9zaWtsZXRlIHZlcmlsbWnFnyBrYXJhciBkZcSfaWwuCjIwLiBBbHQgw6d1YnVrOiBHYXJhaiwgQmFrxLFtLCBBSSBVc3RhLCBHZcOnbWnFnywgVG9wbHVsdWsuIEFsxLHFn3ZlcmnFnyBzZWttZXNpIGfDtnLDvG5tw7x5b3IuCgpTb211dCBiZWxpcnNpemxpayB2ZSBkYXIgb25hcsSxbQoxMi4gc29ydSBpa2kgYXlyxLEgaWRkaWF5xLEgdGVrbGXFn3Rpcml5b3I6IHV5Z3VubHVrIGJpbGdpc2luaW4gb2t1bmFiaWxpciBrYWxtYXPEsSB2ZSDigJxtZXZjdXQgeW9sbGFy4oCdxLFuIGtvcnVubWFzxLEuIEfDtnJzZWwsIGJpbGdpbmluIGdpemxlbm1lZGnEn2luaSB2ZSBva3VuYWJpbGVjZcSfaW5pIGHDp8Sxa8OnYSBzw7Z5bMO8eW9yOyBmYWthdCB0w7xtIGnFn2xlbSB5b2xsYXLEsW7EsW4gw6dhbMSxxZ/EsXIga2FsZMSxxJ/EsW7EsSBkb8SfcnVsYW3EsXlvci4g4oCcQXlyxLFtIGtvbnRyb2zDvCDFn3UgYW5kYSBhw6fEsWxhbcSxeW9y4oCdIHlhesSxc8SxIGJpciB5b2x1biBrdWxsYW7EsWxhbWFkxLHEn8SxbsSxIGfDtnN0ZXJpeW9yLiBTb3J1eXUgeWFsbsSxemNhIHV5Z3VubHVrIGJpbGdpc2luaW4gZ8O2csO8bsO8cmzDvMSfw7wvb2t1bmFiaWxpcmxpxJ9pIGhha2vEsW5kYSBkYXJhbHTEsW4gdmV5YSBoYW5naSBtZXZjdXQgacWfbGVtbGVyaW4ga3VsbGFuxLFsYWJpbGlyIGthbGTEscSfxLFuxLEgZWtyYW5kYSBhw6fEsWvDp2EgYmVsaXJ0aW4uIEJ1IG5lZGVubGUgZ2XDp2nFnyBrYXJhcsSxIENIQU5HRVNfUkVRVUVTVEVELgoKUmFwb3Iga29kbGFtYXPEsQpVVEYtOCwgQk9NIHlvaywgc2F0xLFyIHNvbmxhcsSxIExGIG9sYXJhayBrYXlkZWRpbGRpLg==

C:\Users\Xpike\.codex\task-state\kavriva-e1021\target-r4.log RAW 1160 SHA 553c5a0641b248f8ede77b99f1cc034c78eb5b67bace8ff491f33527d7abbe05

C:\Users\Xpike\.codex\task-state\kavriva-e1021\full-r3.log RAW 105847 SHA 34f2406e2a0ff25870aff343eeed6b1f9f23f1b72523bb0fc76bba7089bc4eb8

C:\Users\Xpike\.codex\task-state\kavriva-e1021\format-r3.log RAW 48 SHA 1585542f9556403fde1485481a3706cac8d86684bdcad1eb907bb03dcbfb5ef5

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4.log RAW 1225 SHA 77a4331844b7ed6ea50ccfad38e06b94d3bc1aab6c3ef8bd514cf2d4f5537866

C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-manifest.txt RAW 5076 SHA f26ce80f39adebee1d26c9869730aac09d44ad6f13e8045b653bdc90c4174119

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|mixed|0|0.0/780.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-mixed-0.png|
|mixed|1|600.0/780.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-mixed-1.png|
|mixed|2|780.0/780.0|82242|093216cb5686a1bd1138a6cee8d2ba18849b61e8ee687065abebb9f3cf426484|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-mixed-2.png|
|only-sponsored|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-only-sponsored-0.png|
|only-sponsored|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-only-sponsored-1.png|
|only-sponsored|2|734.0/734.0|79445|d31630678118334caba9e42daebc2dc5d78cc0f17374d8ba75f7681ffcfa20b8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-only-sponsored-2.png|
|unknown-disclosure|0|0.0/753.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-unknown-disclosure-0.png|
|unknown-disclosure|1|600.0/753.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-unknown-disclosure-1.png|
|unknown-disclosure|2|753.0/753.0|81479|d3fa2a8e68812a138d9f911fe78d68eac25ea54dbb87395d716782caf6974c3b|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-unknown-disclosure-2.png|
|missing-alternatives|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-alternatives-0.png|
|missing-alternatives|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-alternatives-1.png|
|missing-alternatives|2|734.0/734.0|79433|f41be991427f0fdc4577b45d633e1a1d1eb84e9a452b21a33fbaefa98718a8a9|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-alternatives-2.png|
|empty|0|0.0/734.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-empty-0.png|
|empty|1|600.0/734.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-empty-1.png|
|empty|2|734.0/734.0|79438|973f9383423f45b495c8a47f4b9f4bf59d9ab2a010ad0ce1e390e4d0c1600767|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-empty-2.png|
|loading|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-loading-0.png|
|loading|1|569.0/569.0|70580|9e1cb9cbd3c8b525ca70aafb215c3344a9199b293335bd0c509499c10faa4a7a|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-loading-1.png|
|failed|0|0.0/588.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-failed-0.png|
|failed|1|588.0/588.0|71019|02bb5a64e3dea66b2fcd8ccdabd931bff90eed36c5dad480a7aa7ca613bf29d8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-failed-1.png|
|held|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-held-0.png|
|held|1|569.0/569.0|71765|be68eb89753e6edb61dd1c7c0253d126bbd62fc3e8615f8105ab9752ac399e80|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-held-1.png|
|missing-source|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-source-0.png|
|missing-source|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-source-1.png|
|missing-source|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-missing-source-2.png|
|offline|0|0.0/569.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-offline-0.png|
|offline|1|569.0/569.0|72178|e99986e00520a868bb85da73737fcc94bae4e69177b88d6843dada9419c3ef58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-offline-1.png|
|stale|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-0.png|
|stale|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-1.png|
|stale|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-2.png|
|wrong-motorcycle|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-wrong-motorcycle-0.png|
|wrong-motorcycle|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-wrong-motorcycle-1.png|
|wrong-motorcycle|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-wrong-motorcycle-2.png|
|new-revision|0|0.0/607.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-new-revision-0.png|
|new-revision|1|600.0/607.0|74745|871b4fe94f946d7a44246376b0c304990fe0f42baa7e92e7e35a0b0661c08e40|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-new-revision-1.png|
|new-revision|2|607.0/607.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-new-revision-2.png|
|stale-scope|0|0.0/653.0|69394|2631815c59e5677970338e4b833e9030fcc20a169e8f9713afef0daa5424ffb8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-scope-0.png|
|stale-scope|1|600.0/653.0|75564|97d9dea389dd57a9e47959301cf5f56559616aeb383be3af12dfc7d1164ca9c1|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-scope-1.png|
|stale-scope|2|653.0/653.0|74501|869fa5d56138d87eaae5fae607389ed43c7820ca1114198b64d3b33181293c65|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-stale-scope-2.png|
|long|0|0.0/894.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-long-0.png|
|long|1|600.0/894.0|75881|8cfd6a31b8dc3878d897c46664619e2814c8f6eb4af238ffd17715beb3e34e6e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-long-1.png|
|long|2|894.0/894.0|87048|edeead84df36930cbf4eb1eaf404576b65f25b4ef2a5c95c866d648d591f5a3e|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-long-2.png|
|previous-default|0|0.0/153.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-previous-default-0.png|
|previous-default|1|153.0/153.0|63384|644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-previous-default-1.png|
|replaceGuide|0|0.0/477.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-replaceGuide-0.png|
|replaceGuide|1|477.0/477.0|72033|42ab07d29ac95346c1a0a9a830f659ee10b19489a11e3b663504e076c1c90ce8|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-replaceGuide-1.png|
|salesTarget|0|0.0/477.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-salesTarget-0.png|
|salesTarget|1|477.0/477.0|71528|b0fb3f7c412b894452e9b13852c69a1050bd578fcff3adc09c3482aa2e1091c5|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-salesTarget-1.png|
|technicalRanking|0|0.0/477.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-technicalRanking-0.png|
|technicalRanking|1|477.0/477.0|72519|cd5fb60fa4647cd524c10c22db8b6491ab717132a5202f84fb182d91f9170bdc|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-technicalRanking-1.png|
|unknown|0|0.0/477.0|70043|1a15e21a37d42ec2dacf74a62e03895da4156c5ae8ee65005862a567f4d952f3|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-unknown-0.png|
|unknown|1|477.0/477.0|72460|4d01ad51901a425e9452a8d097bfa69344271ec51e1c88f471497af18cbae080|C:\Users\Xpike\.codex\task-state\kavriva-e1021\native-r4-unknown-1.png|
