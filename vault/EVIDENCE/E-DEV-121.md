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
result: "Bağımsız bütün SOURCE PASS; ayrı FINAL kabulü bekleniyor"
gate_verdict: "PASS sınırlı ticari yönlendirme sınırı; üretim kapıları HELD"
reviewer: "/root/e1021_source_whole_review; requested gpt-6-luna/max"
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

## Root gerçek görsel kontrolü ve bağımsız ilk okuma

Root önceki22benzersiz doğalPNG ve approvedD02yi gerçekten açtı; son22 için4değişmişPNG açıldı ve18önceki açık PNG ile gerçekbyteeşliği doğrulandı;51RAW/29bayteşalias/20durum tamkaydırma. Fit önce, yardımcı reklam bilgisi sonra; bütün metinler ve kabuk5 okunur. Kenarda kısmen görünen satırlar komşu kaydırma parçasında tam okunur; kalıcı taşma gözlenmedi. D02 bu yardımcı kaynak metnini çizmez, tam pixel/order/device kabulü iddia edilmez.

Geçmişsiz /root/e1021_blind_r3, istenen gpt-6-luna/max, yalnız sabit20soru ve doğal51PNG/20durum makbuzu aldı. Tam özgün rapor Root tarafından okundu ve byte/SHA doğrulandı;20anlam için dar PASS. Kod 649d3ed27052e3c0d3ce936292a72ff94ab162b8; özgün5147bayt/SHA256 a486ee377fa54071ef47298e21ee9e61feebf9bdd28adcb1f154a960e6eed303. Gerçek insan/cihaz/üretim kabulü değildir. Yerel454/49format0/analyze0/42graphworst0/180tamkaydırma/native8; tam15/121BASEpin/RAWv87snapshot/index113 korunur. İlk amaç model denemesi ve soru19/soru12 CHANGES_REQUESTED/graph-r1 referans FAIL özgün saklanır; dar fixture ve referans düzeltmeleri sonrası kanıt alınır. Bütün SOURCE ve aynı gerçek CI-T3/FINAL6 taze review-CI/olağanmerge-main8 gerekir; gerçek109/97/206 değişmez.

## Tam özgün ilk okuma raporu

HTML yalnız okunabilir normalize gösterimdir; tam byte/SHA eşliği yalnız özgün TXT/RAWBase64 arasındadır.

<pre>T-E1-021 — bağımsız ilk okuma r3

Karar: PASS

Kapsam ve yöntem
- İlk okuma geçmişsiz yapıldı. Yalnız izin verilen native-r4-proof.json, unique-images-r4.json, ranking_firewall_reading_questions.json ve 51 PNG dosyası okundu.
- Sabit 20 soru, aşağıda yalnız görüntülerde okunan içeriğe dayanarak yanıtlandı.
- İstenen profil gpt-6-luna/max. Bu çalışma ortamında gerçek çalışma zamanı model etiketi bana gösterilmediğinden, model etiketinin eşleşmesini bağımsız doğrulayamıyorum.
- Bu rapor görsel ilk okuma değerlendirmesidir; üretim doğrulaması veya insan/cihaz kabulü değildir.

Görsel ve dosya bütünlüğü
- native-r4-proof.json: 51 satır, 20 vaka, 22 farklı SHA grubu, 29 alias.
- unique-images-r4.json: 22 temsilci görüntü. Bu listedeki her kayıt proof dosyasındaki aynı yol ve meta verilerle eşleşti.
- 51 PNG’nin tamamında gerçek byte uzunluğu ve SHA-256, proof kaydıyla eşleşti; gerçek PNG ölçüleri her dosyada 390 × 844.
- 29 alias bağlantısının tamamı dosya byte’ları karşılaştırılarak doğrulandı. Fark veya tutarsızlık yok.
- Her benzersiz görsel aşağıdaki sırayla view_image ile açıldı:
  native-r4-mixed-0.png
  native-r4-mixed-1.png
  native-r4-mixed-2.png
  native-r4-only-sponsored-2.png
  native-r4-unknown-disclosure-2.png
  native-r4-missing-alternatives-2.png
  native-r4-empty-2.png
  native-r4-loading-1.png
  native-r4-failed-1.png
  native-r4-held-1.png
  native-r4-missing-source-1.png
  native-r4-missing-source-2.png
  native-r4-offline-1.png
  native-r4-stale-scope-0.png
  native-r4-stale-scope-1.png
  native-r4-long-2.png
  native-r4-previous-default-1.png
  native-r4-replaceGuide-0.png
  native-r4-replaceGuide-1.png
  native-r4-salesTarget-1.png
  native-r4-technicalRanking-1.png
  native-r4-unknown-1.png

Sabit sorular — görüntüdeki kanıtla yanıtlar
1. Rehber, örnek bakım konusunun kapsamını ve bakım bilgisini gösteriyor; ticari liste diğer seçenekleri ve kaynakta görünen reklam bilgisini ayrı bir bilgi olarak sunuyor.
2. Hayır. Liste rehberin yerini alamaz; teknik olarak en iyi seçeneği kanıtlamaz.
3. Evet. Motosiklet uygunluğu ve rehber bilgisi ticari liste içeriğinden önce gösteriliyor; liste metni önce yukarıdaki uygunluk bilgisinin okunmasını söylüyor.
4. Hayır. Ücret veya sponsor desteğinin teknik uygunluğu değiştirmediği açıkça yazıyor.
5. Hayır. Satışı artırmak için rehberin değiştirilmediği; satış hedefli yönlendirmenin gösterilmediği yazıyor.
6. Hayır. Davranış ve satış ölçümleri teknik uygunluk seçimine katılmıyor.
7. Rehber yerine geçmeye çalışan listede ticari ayrıntılar gösterilmiyor. Rehber ve uygunluk bilgisi ile önce kullanılabilen rehber yolları korunuyor.
8. Hayır. Satış artırma amacı taşıyan yönlendirme gösterilmediği açıkça yazıyor.
9. Ticari sıralama teknik uygunluk kararı gibi sunulmuyor; ticari ayrıntılar gösterilmiyor.
10. Liste amacı bilinmiyorsa amaç netleşene kadar ticari ayrıntılar gösterilmiyor.
11. Hayır. Engel rehberi ve motosiklet uygunluğu bilgisini gizlemiyor.
12. Evet. Uygunluk bilgisi okunabiliyor; önceki kullanılabilir rehber yolları engelle kapanmıyor. Satın alma veya yeni uygulama izni başlatılmıyor.
13. Evet. Örnek sponsorlu seçenek “Sponsorlu · ücretli reklam”, sponsor desteği bulunmayan seçenek ise “Kaynağa göre sponsor desteği yok” diye ayrı etiketleniyor.
14. Hayır. Sponsor bilgisi bilinmeyen seçenek reklamsız sayılmıyor; bilgi açıklanana kadar adı ve ticari ayrıntısı gösterilmiyor.
15. Hayır. Kaynak alternatif bilgisi vermediğinde alternatif olmadığı sonucu çıkarılamayacağı açıkça yazıyor.
16. Eski listenin motosiklet, rehber veya bilginin değişmesinden sonra kullanılmaması ve kaynağın yeniden kontrol edilmesi gerektiği yazıyor. Eski kapsam bilgisiyle hazırlığa geçilemiyor.
17. Eski liste yükleme sırasında güncelmiş gibi gösterilmiyor; hata halinde kaynak yeniden kontrol edilmeli; bekletme halinde kaynak kontrolü bitmeden güncel liste gösterilmiyor; çevrimdışında eski liste güncel teklif sayılmıyor.
18. Satın alma, ödeme veya servis rezervasyonu başlatılmıyor. Okumak hesap veya satın alma gerektirmiyor; görünüm motosiklette uygulama adımı değil.
19. Hayır. Gösterimin örnek olduğu, gerçek satıcı veya teklif olmadığı ve gerçek motosiklet için karar verilmediği yazıyor. Ticari liste teknik karardan türetilmemiş.
20. Alt çubukta Garaj, Bakım, AI Usta, Geçmiş ve Topluluk var; alışveriş sekmesi görünmüyor.

Okunurluk ve belirsizlik
- Yirmi sorunun anlamını değiştirecek çözülmemiş okunurluk belirsizliği yok; karar PASS.
- Bazı PNG’ler kaydırılmış sayfa kesitleri. İlgili yükleme, hata, çevrimdışı, sponsor açıklaması ve engel metinleri açılan görüntülerde okunabiliyor.
- “Örnek” niteliği görsellerde açık. Ekranlar gerçek satıcı/teklif veya üretimde doğrulanmış motosiklet kararı göstermiyor; bu okuma üretim ya da cihaz kabulü oluşturmaz.</pre>

RAWBase64: VC1FMS0wMjEg4oCUIGJhxJ/EsW1zxLF6IGlsayBva3VtYSByMwoKS2FyYXI6IFBBU1MKCkthcHNhbSB2ZSB5w7ZudGVtCi0gxLBsayBva3VtYSBnZcOnbWnFn3NpeiB5YXDEsWxkxLEuIFlhbG7EsXogaXppbiB2ZXJpbGVuIG5hdGl2ZS1yNC1wcm9vZi5qc29uLCB1bmlxdWUtaW1hZ2VzLXI0Lmpzb24sIHJhbmtpbmdfZmlyZXdhbGxfcmVhZGluZ19xdWVzdGlvbnMuanNvbiB2ZSA1MSBQTkcgZG9zeWFzxLEgb2t1bmR1LgotIFNhYml0IDIwIHNvcnUsIGHFn2HEn8SxZGEgeWFsbsSxeiBnw7Zyw7xudMO8bGVyZGUgb2t1bmFuIGnDp2VyacSfZSBkYXlhbmFyYWsgeWFuxLF0bGFuZMSxLgotIMSwc3RlbmVuIHByb2ZpbCBncHQtNi1sdW5hL21heC4gQnUgw6dhbMSxxZ9tYSBvcnRhbcSxbmRhIGdlcsOnZWsgw6dhbMSxxZ9tYSB6YW1hbsSxIG1vZGVsIGV0aWtldGkgYmFuYSBnw7ZzdGVyaWxtZWRpxJ9pbmRlbiwgbW9kZWwgZXRpa2V0aW5pbiBlxZ9sZcWfbWVzaW5pIGJhxJ/EsW1zxLF6IGRvxJ9ydWxheWFtxLF5b3J1bS4KLSBCdSByYXBvciBnw7Zyc2VsIGlsayBva3VtYSBkZcSfZXJsZW5kaXJtZXNpZGlyOyDDvHJldGltIGRvxJ9ydWxhbWFzxLEgdmV5YSBpbnNhbi9jaWhheiBrYWJ1bMO8IGRlxJ9pbGRpci4KCkfDtnJzZWwgdmUgZG9zeWEgYsO8dMO8bmzDvMSfw7wKLSBuYXRpdmUtcjQtcHJvb2YuanNvbjogNTEgc2F0xLFyLCAyMCB2YWthLCAyMiBmYXJrbMSxIFNIQSBncnVidSwgMjkgYWxpYXMuCi0gdW5pcXVlLWltYWdlcy1yNC5qc29uOiAyMiB0ZW1zaWxjaSBnw7Zyw7xudMO8LiBCdSBsaXN0ZWRla2kgaGVyIGthecSxdCBwcm9vZiBkb3N5YXPEsW5kYWtpIGF5bsSxIHlvbCB2ZSBtZXRhIHZlcmlsZXJsZSBlxZ9sZcWfdGkuCi0gNTEgUE5H4oCZbmluIHRhbWFtxLFuZGEgZ2Vyw6dlayBieXRlIHV6dW5sdcSfdSB2ZSBTSEEtMjU2LCBwcm9vZiBrYXlkxLF5bGEgZcWfbGXFn3RpOyBnZXLDp2VrIFBORyDDtmzDp8O8bGVyaSBoZXIgZG9zeWFkYSAzOTAgw5cgODQ0LgotIDI5IGFsaWFzIGJhxJ9sYW50xLFzxLFuxLFuIHRhbWFtxLEgZG9zeWEgYnl0ZeKAmWxhcsSxIGthcsWfxLFsYcWfdMSxcsSxbGFyYWsgZG/En3J1bGFuZMSxLiBGYXJrIHZleWEgdHV0YXJzxLF6bMSxayB5b2suCi0gSGVyIGJlbnplcnNpeiBnw7Zyc2VsIGHFn2HEn8SxZGFraSBzxLFyYXlsYSB2aWV3X2ltYWdlIGlsZSBhw6fEsWxkxLE6CiAgbmF0aXZlLXI0LW1peGVkLTAucG5nCiAgbmF0aXZlLXI0LW1peGVkLTEucG5nCiAgbmF0aXZlLXI0LW1peGVkLTIucG5nCiAgbmF0aXZlLXI0LW9ubHktc3BvbnNvcmVkLTIucG5nCiAgbmF0aXZlLXI0LXVua25vd24tZGlzY2xvc3VyZS0yLnBuZwogIG5hdGl2ZS1yNC1taXNzaW5nLWFsdGVybmF0aXZlcy0yLnBuZwogIG5hdGl2ZS1yNC1lbXB0eS0yLnBuZwogIG5hdGl2ZS1yNC1sb2FkaW5nLTEucG5nCiAgbmF0aXZlLXI0LWZhaWxlZC0xLnBuZwogIG5hdGl2ZS1yNC1oZWxkLTEucG5nCiAgbmF0aXZlLXI0LW1pc3Npbmctc291cmNlLTEucG5nCiAgbmF0aXZlLXI0LW1pc3Npbmctc291cmNlLTIucG5nCiAgbmF0aXZlLXI0LW9mZmxpbmUtMS5wbmcKICBuYXRpdmUtcjQtc3RhbGUtc2NvcGUtMC5wbmcKICBuYXRpdmUtcjQtc3RhbGUtc2NvcGUtMS5wbmcKICBuYXRpdmUtcjQtbG9uZy0yLnBuZwogIG5hdGl2ZS1yNC1wcmV2aW91cy1kZWZhdWx0LTEucG5nCiAgbmF0aXZlLXI0LXJlcGxhY2VHdWlkZS0wLnBuZwogIG5hdGl2ZS1yNC1yZXBsYWNlR3VpZGUtMS5wbmcKICBuYXRpdmUtcjQtc2FsZXNUYXJnZXQtMS5wbmcKICBuYXRpdmUtcjQtdGVjaG5pY2FsUmFua2luZy0xLnBuZwogIG5hdGl2ZS1yNC11bmtub3duLTEucG5nCgpTYWJpdCBzb3J1bGFyIOKAlCBnw7Zyw7xudMO8ZGVraSBrYW7EsXRsYSB5YW7EsXRsYXIKMS4gUmVoYmVyLCDDtnJuZWsgYmFrxLFtIGtvbnVzdW51biBrYXBzYW3EsW7EsSB2ZSBiYWvEsW0gYmlsZ2lzaW5pIGfDtnN0ZXJpeW9yOyB0aWNhcmkgbGlzdGUgZGnEn2VyIHNlw6dlbmVrbGVyaSB2ZSBrYXluYWt0YSBnw7Zyw7xuZW4gcmVrbGFtIGJpbGdpc2luaSBheXLEsSBiaXIgYmlsZ2kgb2xhcmFrIHN1bnV5b3IuCjIuIEhhecSxci4gTGlzdGUgcmVoYmVyaW4geWVyaW5pIGFsYW1hejsgdGVrbmlrIG9sYXJhayBlbiBpeWkgc2XDp2VuZcSfaSBrYW7EsXRsYW1hei4KMy4gRXZldC4gTW90b3Npa2xldCB1eWd1bmx1xJ91IHZlIHJlaGJlciBiaWxnaXNpIHRpY2FyaSBsaXN0ZSBpw6dlcmnEn2luZGVuIMO2bmNlIGfDtnN0ZXJpbGl5b3I7IGxpc3RlIG1ldG5pIMO2bmNlIHl1a2FyxLFkYWtpIHV5Z3VubHVrIGJpbGdpc2luaW4gb2t1bm1hc8SxbsSxIHPDtnlsw7x5b3IuCjQuIEhhecSxci4gw5xjcmV0IHZleWEgc3BvbnNvciBkZXN0ZcSfaW5pbiB0ZWtuaWsgdXlndW5sdcSfdSBkZcSfacWfdGlybWVkacSfaSBhw6fEsWvDp2EgeWF6xLF5b3IuCjUuIEhhecSxci4gU2F0xLHFn8SxIGFydMSxcm1hayBpw6dpbiByZWhiZXJpbiBkZcSfacWfdGlyaWxtZWRpxJ9pOyBzYXTEscWfIGhlZGVmbGkgecO2bmxlbmRpcm1lbmluIGfDtnN0ZXJpbG1lZGnEn2kgeWF6xLF5b3IuCjYuIEhhecSxci4gRGF2cmFuxLHFnyB2ZSBzYXTEscWfIMO2bMOnw7xtbGVyaSB0ZWtuaWsgdXlndW5sdWsgc2XDp2ltaW5lIGthdMSxbG3EsXlvci4KNy4gUmVoYmVyIHllcmluZSBnZcOnbWV5ZSDDp2FsxLHFn2FuIGxpc3RlZGUgdGljYXJpIGF5csSxbnTEsWxhciBnw7ZzdGVyaWxtaXlvci4gUmVoYmVyIHZlIHV5Z3VubHVrIGJpbGdpc2kgaWxlIMO2bmNlIGt1bGxhbsSxbGFiaWxlbiByZWhiZXIgeW9sbGFyxLEga29ydW51eW9yLgo4LiBIYXnEsXIuIFNhdMSxxZ8gYXJ0xLFybWEgYW1hY8SxIHRhxZ/EsXlhbiB5w7ZubGVuZGlybWUgZ8O2c3RlcmlsbWVkacSfaSBhw6fEsWvDp2EgeWF6xLF5b3IuCjkuIFRpY2FyaSBzxLFyYWxhbWEgdGVrbmlrIHV5Z3VubHVrIGthcmFyxLEgZ2liaSBzdW51bG11eW9yOyB0aWNhcmkgYXlyxLFudMSxbGFyIGfDtnN0ZXJpbG1peW9yLgoxMC4gTGlzdGUgYW1hY8SxIGJpbGlubWl5b3JzYSBhbWHDpyBuZXRsZcWfZW5lIGthZGFyIHRpY2FyaSBheXLEsW50xLFsYXIgZ8O2c3RlcmlsbWl5b3IuCjExLiBIYXnEsXIuIEVuZ2VsIHJlaGJlcmkgdmUgbW90b3Npa2xldCB1eWd1bmx1xJ91IGJpbGdpc2luaSBnaXpsZW1peW9yLgoxMi4gRXZldC4gVXlndW5sdWsgYmlsZ2lzaSBva3VuYWJpbGl5b3I7IMO2bmNla2kga3VsbGFuxLFsYWJpbGlyIHJlaGJlciB5b2xsYXLEsSBlbmdlbGxlIGthcGFubcSxeW9yLiBTYXTEsW4gYWxtYSB2ZXlhIHllbmkgdXlndWxhbWEgaXpuaSBiYcWfbGF0xLFsbcSxeW9yLgoxMy4gRXZldC4gw5ZybmVrIHNwb25zb3JsdSBzZcOnZW5layDigJxTcG9uc29ybHUgwrcgw7xjcmV0bGkgcmVrbGFt4oCdLCBzcG9uc29yIGRlc3RlxJ9pIGJ1bHVubWF5YW4gc2XDp2VuZWsgaXNlIOKAnEtheW5hxJ9hIGfDtnJlIHNwb25zb3IgZGVzdGXEn2kgeW9r4oCdIGRpeWUgYXlyxLEgZXRpa2V0bGVuaXlvci4KMTQuIEhhecSxci4gU3BvbnNvciBiaWxnaXNpIGJpbGlubWV5ZW4gc2XDp2VuZWsgcmVrbGFtc8SxeiBzYXnEsWxtxLF5b3I7IGJpbGdpIGHDp8Sxa2xhbmFuYSBrYWRhciBhZMSxIHZlIHRpY2FyaSBheXLEsW50xLFzxLEgZ8O2c3RlcmlsbWl5b3IuCjE1LiBIYXnEsXIuIEtheW5hayBhbHRlcm5hdGlmIGJpbGdpc2kgdmVybWVkacSfaW5kZSBhbHRlcm5hdGlmIG9sbWFkxLHEn8SxIHNvbnVjdSDDp8Sxa2FyxLFsYW1heWFjYcSfxLEgYcOnxLFrw6dhIHlhesSxeW9yLgoxNi4gRXNraSBsaXN0ZW5pbiBtb3Rvc2lrbGV0LCByZWhiZXIgdmV5YSBiaWxnaW5pbiBkZcSfacWfbWVzaW5kZW4gc29ucmEga3VsbGFuxLFsbWFtYXPEsSB2ZSBrYXluYcSfxLFuIHllbmlkZW4ga29udHJvbCBlZGlsbWVzaSBnZXJla3RpxJ9pIHlhesSxeW9yLiBFc2tpIGthcHNhbSBiaWxnaXNpeWxlIGhhesSxcmzEscSfYSBnZcOnaWxlbWl5b3IuCjE3LiBFc2tpIGxpc3RlIHnDvGtsZW1lIHPEsXJhc8SxbmRhIGfDvG5jZWxtacWfIGdpYmkgZ8O2c3RlcmlsbWl5b3I7IGhhdGEgaGFsaW5kZSBrYXluYWsgeWVuaWRlbiBrb250cm9sIGVkaWxtZWxpOyBiZWtsZXRtZSBoYWxpbmRlIGtheW5hayBrb250cm9sw7wgYml0bWVkZW4gZ8O8bmNlbCBsaXN0ZSBnw7ZzdGVyaWxtaXlvcjsgw6dldnJpbWTEscWfxLFuZGEgZXNraSBsaXN0ZSBnw7xuY2VsIHRla2xpZiBzYXnEsWxtxLF5b3IuCjE4LiBTYXTEsW4gYWxtYSwgw7ZkZW1lIHZleWEgc2VydmlzIHJlemVydmFzeW9udSBiYcWfbGF0xLFsbcSxeW9yLiBPa3VtYWsgaGVzYXAgdmV5YSBzYXTEsW4gYWxtYSBnZXJla3Rpcm1peW9yOyBnw7Zyw7xuw7xtIG1vdG9zaWtsZXR0ZSB1eWd1bGFtYSBhZMSxbcSxIGRlxJ9pbC4KMTkuIEhhecSxci4gR8O2c3RlcmltaW4gw7ZybmVrIG9sZHXEn3UsIGdlcsOnZWsgc2F0xLFjxLEgdmV5YSB0ZWtsaWYgb2xtYWTEscSfxLEgdmUgZ2Vyw6dlayBtb3Rvc2lrbGV0IGnDp2luIGthcmFyIHZlcmlsbWVkacSfaSB5YXrEsXlvci4gVGljYXJpIGxpc3RlIHRla25payBrYXJhcmRhbiB0w7xyZXRpbG1lbWnFny4KMjAuIEFsdCDDp3VidWt0YSBHYXJhaiwgQmFrxLFtLCBBSSBVc3RhLCBHZcOnbWnFnyB2ZSBUb3BsdWx1ayB2YXI7IGFsxLHFn3ZlcmnFnyBzZWttZXNpIGfDtnLDvG5tw7x5b3IuCgpPa3VudXJsdWsgdmUgYmVsaXJzaXpsaWsKLSBZaXJtaSBzb3J1bnVuIGFubGFtxLFuxLEgZGXEn2nFn3RpcmVjZWsgw6fDtnrDvGxtZW1pxZ8gb2t1bnVybHVrIGJlbGlyc2l6bGnEn2kgeW9rOyBrYXJhciBQQVNTLgotIEJhesSxIFBOR+KAmWxlciBrYXlkxLFyxLFsbcSxxZ8gc2F5ZmEga2VzaXRsZXJpLiDEsGxnaWxpIHnDvGtsZW1lLCBoYXRhLCDDp2V2cmltZMSxxZ/EsSwgc3BvbnNvciBhw6fEsWtsYW1hc8SxIHZlIGVuZ2VsIG1ldGlubGVyaSBhw6fEsWxhbiBnw7Zyw7xudMO8bGVyZGUgb2t1bmFiaWxpeW9yLgotIOKAnMOWcm5la+KAnSBuaXRlbGnEn2kgZ8O2cnNlbGxlcmRlIGHDp8Sxay4gRWtyYW5sYXIgZ2Vyw6dlayBzYXTEsWPEsS90ZWtsaWYgdmV5YSDDvHJldGltZGUgZG/En3J1bGFubcSxxZ8gbW90b3Npa2xldCBrYXJhcsSxIGfDtnN0ZXJtaXlvcjsgYnUgb2t1bWEgw7xyZXRpbSB5YSBkYSBjaWhheiBrYWJ1bMO8IG9sdcWfdHVybWF6Lgo=

## Bağımsız bütün SOURCE kabulü — sınırlı FINAL adayı

SOURCE dc180e9d35ec609ddfc12e6d9794350280b5ba76; BASE 3e04c8033781358cec3bcf450218bc52374f4fba. Sahip tarafından kabul edilen geçmişsiz /root/e1021_source_whole_review, istenen gpt-6-luna/max (reviewer model etiketi görünmediğini kaydeder), bütün15/121BASEpin/RAWv87snapshot, kod/test/sabit20/ilk okuma/native/tasarım/kapanış kapsamına PASS verdi. Root özgün tam raporu okudu ve byte/SHA doğruladı. Aynı SOURCE gerçekCI sekiz ailesi ve gerçekPRT3 başarılı; pushT3skip0 ayrı. Yerel454=447korunan+7yeni;49format0/analyze0/42graphworst0/index113;20durum180tamkaydırma/51PNG22benzersiz29alias. Native8 ayrı koşu, normal toplamına eklenmez. İlk soru19/soru12 CHANGES_REQUESTED ve graph referans FAIL özgün saklanır; dar fixture/metin/referans düzeltmesi sonrası gerçekPASS.

FINAL yalnız dört kayıt ve registry/routing olmak üzere altı metadata dosyasıdır. Kod/test/sabit20/RAWsnapshot/pin kümesi ve YAML/SDK/deps değişmez. Profil/paketACTIVE, T021DONE yalnız dalın ticari yönlendirme sınırı kabul adayıdır. Ayrı geçmişsiz FINAL review ve sameFINAL gerçekCI/T3/olağanmerge/fetchedmain8 olmadan gerçek109DONE97kalan206 değişmez. Tam feature/flow/designfinal/üretimfeed/SCR-TBD/insan/cihaz/physical/releaseHELD; E3R1REVIEW/E5IN_PROGRESS korunur.

## Tam özgün bütün SOURCE raporu

Özgün13303bayt/SHA256 76d2085364ce6d476c0f2a46dbdf58569db8a86177495aa94d103a7147d25e5d. HTML okunabilir normalize gösterimdir; byteeşlik yalnız TXT/Base64.

<pre>T-E1-021 — SOURCE bağımsız bütün incelemesi

Tarih: 2026-10-13

HÜKÜM

SINIRLI PASS. Exact SOURCE başı için incelediğim mevcut E1 sunum diliminde engelleyici veya düzeltilmesi gereken bulgu saptamadım. Bu hüküm yalnız T-E1-021’in aday sunum davranışına ilişkindir. Ürün, üretim feed’i, onaylı flow, final tasarım, insan/cihaz kabulü, release veya merge kabulü anlamına gelmez.

İnceleme notu: Amaç enumu çağıranın beyanıdır. GuideScopePreview.commercialPurpose varsayılanı supplement olduğu için parametreyi atlayan bir çağrı ticari çocuğu görünür kılar. Bu, önceki bilgi gösterimini koruma kararıyla uyumludur ve bu depoda GuideScopePreview için üretim çağrı noktası bulunmadığından bu SOURCE kapsamını durduran bir hata saymadım. Gelecekte gerçek kaynağa bağlanırken amaç beyanının doğru kaynaktan geldiğini doğrulayan üst katman ayrıca kurulmalıdır. Şimdiki kod bu doğrulamayı iddia etmez.

KİMLİK VE YETKİ

İncelenen depo: C:\Users\Xpike\.codex\worktrees\e4-required-auto-transfer\kavriva-app
Dal: codex/e1-ranking-firewall
Exact HEAD/SOURCE: dc180e9d35ec609ddfc12e6d9794350280b5ba76
BASE: 3e04c8033781358cec3bcf450218bc52374f4fba
PRECODE: df70046a62a7f008cccd4ccb39b47f44eba505e2
CODE: 649d3ed27052e3c0d3ce936292a72ff94ab162b8
Plan otoritesi: yalnız C:\Users\Xpike\Desktop\Kavriva-plan içindeki origin/main fa914f013fdcd032faed876689092da245989459.
PR: #123, open, draft, merged=false; base SHA BASE ve head SHA SOURCE ile eşleşiyor.

Checkout HEAD’i exact SOURCE idi ve inceleme başında çalışma ağacı temizdi. BASE→SOURCE değişiklikleri scope.json’daki 16 izinli yolun 15’iyle birebir eşleşti; izin dışı dosya yok. sponsored_marking.dart izinli yollar arasında kaldı fakat değişmedi. Bu dosyanın BASE ve SOURCE baytları aynı; SHA-256 9971fe5564ef3522a257c289fd0c53b7315b756288c083369eff0b530547df56.

KOD VE ÜRÜN DAVRANIŞI

ranking_firewall.dart, supplement, replaceGuide, salesTarget, technicalRanking ve unknown değerlerinden oluşan kapalı bir sunum enumu tanımlar. RankingFirewallView, ticari alt bileşeni yalnız supplement olduğunda ağaca ekler. Diğer dört amaçta ticari isim/ayrıntı gizlenir ve amaca uygun gerekçe gösterilir. Ekrandaki metin rehber ve motosiklete uygunluk alanının üstte kaldığını, listenin bunların yerini almadığını, satış veya davranış ölçümlerinin teknik seçime katılmadığını açıklar.

GuideScopePreview, mevcut MotorcycleFitView’ı aynı bağlam ve aynı FitPresentation ile önce kurar; ticari sunum alanını onun sonrasına koyar. commercial == null olduğunda yeni alan oluşmaz. Ticari sıra veya amaç değişimi teknik fit nesnesini değiştirmez. Yeni route, sekme, katalog, provider, ağ/DB çağrısı, analytics callback’i, ödeme, satın alma veya hazırlık izni üretimi eklenmemiştir. Mevcut sponsor modeli de değiştirilmemiştir.

Amaç değerinin kendisi gerçek niyet doğrulaması değildir; kod yorumu ve kayıtlar bunu açıkça sınırlar. Testlerde gösterilen örnek fit kaynağı ve örnek satıcı metni gerçek bir motosiklet kararı gibi sunulmuyor. Bu sunum parçası, doğrulanmış üretim feed’i veya tek başına güvenlik/policy kapısı olarak değerlendirilemez.

FIT VE HAZIRLIK CALLBACK’İ

Mevcut fit alanında hazırlık görünümü ancak sonuç bağlamı hedefle eşleştiğinde, kanıt güncel ve aynı bağlamda olduğunda, sonuç confirmed olduğunda, ekran meşgul değilken ve hata yokken açılır. Callback hedef olarak MotorcycleFitView’ın kendi context değerini iletir.

Odaklı testler tüm beş ticari amaç için şunları karşılaştırıyor:

- Geçerli aynı hedefte sponsor seçeneklerinin sırası ileri/ters çevrildiğinde ve amaç değiştiğinde fit nesnesi aynı kalıyor; hazırlık callback’i on kez aynı hedef VariantContext nesnesini alıyor.
- Eksik fit, missingDistinction, eski kanıt, başka motosiklete ait kanıt bağlamı ve başka rehber/motosiklet hedefli fit durumlarında hazırlık eylemi görünmüyor ve callback çağrılmıyor.
- Meşgul/hata/çevrimdışı durumları, eski veya eşleşmeyen scope’lar ve bağlam değişimleri ticari isimleri geri getirmiyor.
- Amaç değişince önceki ticari liste sızmıyor; rehber ve geçerli fit korunuyor. Tab/Enter/Space erişim testleri aynı hedefe gidiyor.

Bu negatifler T021’in ticari amaç ve mevcut hazırlık yolu sınırını kod düzeyinde destekliyor. Hazırlık callback’inin sonraki dış davranışı veya gerçek ürün yetkisi bu E1 sınırında test edilmiş sayılmaz.

KAYITLAR VE GEÇMİŞ KORUMASI

scope.json içindeki BASE pinlerinin 121’inin tamamını BASE Git blob’larından tekrar hesapladım; uyuşmazlık sıfır. Değişiklik listesi 15/16 izinli yol. E-DEV-120 önceki kaydı yeni tüketiciye bağlanan frontmatter referansı ve append-only inceleme ekiyle genişletiyor; eski subject kanıtı ve önceki raporlar silinmemiş. Korunan sponsored_marking.dart baytı eski subject kaydıyla eşleşiyor.

T021 paketi PRECODE ve SOURCE’ta 1’den 14’e kadar 14 zorunlu alanı içeriyor. Kapsam düzeltme commit’i 298d4fdd08cbda28a7f70c72491165c0549855bf; düzeltme öncesi başarısız komutun kaydı da saklanmış. Sabit 20 soruluk fixture PRECODE→SOURCE baytça aynı: 1.530 bayt, SHA-256 3cd276c0bee08555d7ed155cf03d23d52d9bd4d092b7e48fe9e11d2d3b6b5b19.

RAWv87 snapshot’ın güncel bayt uzunluğu 228.034 ve SHA-256’sı 83b24f66d3cdc91f4c195c984c26627d2a62e6fa3be7889ad2b67ba20b25d636; scope kaydıyla eşleşiyor. Güncel inventory v88 ve generated index 113 satır. CI’nin index üretim adımı da exact SOURCE’ta 113 rows -&gt; registry.json sonucunu verdi.

Tarihsel denemeler ayrı tutulmuş: modelin ilk yerleşim adayı ve target-r1, kapsam düzeltmesindeki AssertionError, graph-r1 başarısızlığı, native-r2 içinde yakalama yapmadan yalnız yedi test koşulması, R1’in soru 19 ve R2’nin soru 12 için retleri. Bunların hiçbiri güncel PASS kanıtı olarak kullanılmadı. İki metin düzeltmesinden sonra üretilen R3 ilk okuma raporu 5.147 bayt ve SHA-256 a486ee377fa54071ef47298e21ee9e61feebf9bdd28adcb1f154a960e6eed303; raporun kendisi PASS der ve mevcut görsel soru setini cevaplar. Model için gpt-6-luna/max istenmiş; bu incelemede güvenilir runtime etiketi görünmediğinden bu modelin çalıştığını doğrulanmış saymıyorum.

GERÇEK GÖRÜNTÜ VE TASARIM KARŞILAŞTIRMASI

native-r4-proof.json içindeki 51 PNG kaydının her bir dosya boyutunu ve SHA-256’sını yeniden karşılaştırdım: 51/51 eşleşti. Makbuz 22 benzersiz içerik ve 29 bayt-eş alias veriyor; 22 benzersiz doğal Flutter ekranını tek tek açıp inceledim. E-1019’daki D02 D02-SCR-010-Guide-Scope-Fit.png dosyasını da gerçekten açtım. Görsellerin ölçüsü 390×844; test akışı 20 görünüm durumunun doğal tam kaydırma parçalarını içeriyor. Fit ve rehber alanı üstte; yardımcı ticari alan ve engel gerekçeleri aşağıda. Soru 19’u hedefleyen örnek kaynak metni gerçek motosiklet kararı olmadığını söylüyor. Soru 12’yi hedefleyen engel metni önceden kullanılabilen rehber yolunun açık kaldığını, mevcut olmayan yolun ticari listeyle açılmadığını söylüyor. Görsellerde kalıcı kırpılma veya taşma gözlemedim.

D02 kanonik tasarımında bu yeni yardımcı alan yer almıyor. Kaynak, SCR-010/J-012 bağlamında mevcut fit alanı altına eklenen sınırlı sunum türevi olarak kalıyor. Bu karşılaştırma son piksel/tasarım onayı değildir.

Yedi tasarım karşılaştırmasının sonucu:

1. Tam ekran: mevcut rehber kapsamı ve fit ilk sırada; ticari sunum sonrasında.
2. Komşu/önceki ekran: commercial == null ve varsayılan amaç eski bilgi gösterimini koruyor; yeni ekran veya route yok.
3. Durumlar: 20 sabit örnek; sponsorlu/sponsorsuz, bilinmeyen, eksik alternatif/kaynak, loading/error/held/offline/stale ve amaç engelleri.
4. Duyarlı düzen: 20 durum × 320/390/768 genişlik × 1/2/3 yazı ölçeği = 180 tam kaydırma kombinasyonu. Fiziksel cihaz kabulü değil.
5. Erişilebilirlik: headless semantics, odak, Tab/Enter/Space, hit alanı ve kontrast kontrolleri. Gerçek kullanıcı/ekran okuyucu cihaz kabulü değil.
6. Kanonik eşleşme: SCR-010, D02 ve J-012 ile alan yeri/rolü karşılaştırıldı. SCR-TBD, token/piksel/son akış onayı HELD.
7. Regresyon: 447 korunmuş test + 7 yeni odak testi; 121 BASE pin; 15/16 izinli yol; sponsor dosyası baytça korunmuş; index 113 ve v87 snapshot kaydı eşleşiyor.

ON KAPANIŞ KATMANI VE ÜST SINIRLAR

1. Görev: T-E1-021 yerel aday; registry REVIEW.
2. Feature: F1.9.2’nin yalnız bu sunum dilimi ele alındı.
3. Flow: FL1.9.2 PROPOSED ve SCR-TBD onaysız/HELD.
4. Requirement: BR-070/071/073 için sunum negatifleri kanıtlı; gerçek kaynak amacı doğrulanmış değil.
5. Design: yedi sınırlı karşılaştırma yapıldı; final tasarım/insan/cihaz kabulü HELD.
6. Architecture: E1 iç render kapsamı; E3/E5 yetkisi, public seam veya YAML değişikliği yok. E3R1 REVIEW, E5 IN_PROGRESS.
7. Data/migration: şema veya veri göçü yok; mevcut kayıt/model korunmuş.
8. Release: exact SOURCE CI/T3 başarılı; olağan merge, main doğrulaması ve ürün release’i bu hükümle kapanmıyor.
9. Product scenario: sabit 20 ekran örneği; gerçek satıcı, teklif, satış veya ödeme senaryosu yok.
10. Gap audit: gerçek feed/kimlik, router, cihaz/insan, son tasarım tokenları ve yayın kanıtı HELD.

GERÇEK CI VE PR DOĞRULAMASI

source-ci.json SHA-256 81009c271cbdcd8d7f6cad14803e114ca941b8700c8989a559d0415d48e2411b. Kayıttaki 17 koşunun her biri için yerel source-&lt;run&gt;.log ham dosyasını okudum; boyut ve SHA-256 makbuzuyla eşleşti. Her koşunun headSha değeri exact SOURCE. Dağılım 8 push ve 9 pull_request; sekiz workflow ailesi e1 shell, e3 authorization, e3 live auth, e4 offline composition, e5 current authority, e6 release policy, e9 bounded proposal ve architecture. Makbuz toplam 20 job ve 117 step içeriyor; tüm step’ler tamamlanmış/başarılı. Tüm job’lar başarılı, tek ayrım push architecture koşusundaki T3 işinin skipped olmasıdır.

Exact SOURCE E1 push run 38315992035 ve PR run 38315998140 içinde format 49 files (0 changed), analiz No issues found, widget/native headless suite +454: All tests passed yazıyor. E3 live-auth PR run 38315998160 gerçek izole Supabase Auth signup/session/guard/logout kontrolünü PASS; doğrudan Data API/private Storage/client-role bypass kontrolleri de PASS olarak kaydediyor. Bunlar T021’in gerçek üretim doğrulaması değildir.

PR #123’te 38315998138 run’ının t3-gate job’ı 115032645318, 38315998544 run’ının t3-gate job’ı 115032646473: her ikisi de tamamlandı/başarılı ve beş adımın tamamı başarılı. İki raw log exact SOURCE’u, check-conformance: 120 evidence records scanned ve check-identity: 384 IDs indexed, 491 files scanned sonuçlarını içeriyor. İlgili architecture job’ları generated index’in 113 satırını da yeniden üretiyor. Push run 38315992252 için t3-gate job’ı skipped; bu PR T3 başarılarına dahil edilmedi. PR API okuması açık/taslak/unmerged durumunu ve aynı BASE→SOURCE başlarını gösteriyor.

Yerel doğrulama kayıtları ayrıca full-r3.log içinde 454 test PASS (log 105.847 bayt; SHA-256 34f2406e2a0ff25870aff343eeed6b1f9f23f1b72523bb0fc76bba7089bc4eb8), target-r4.log içinde 7/7, format-r3.log içinde 49 dosya/0 değişiklik, analyze-r1.log içinde No issues found ve graph-r4.log içinde 42 test/worst exit = 0 sonucunu içeriyor. native-r4.log sekiz ayrı capture/test kontrolünü PASS gösteriyor; bu koşu 454 normal test sayısına eklenmez. Aynı SOURCE’daki CI ham logları exact head için bağımsız bir tekrar sağlar. Bu incelemede Flutter veya başka test komutu çalıştırmadım.

OKUNAN KAPSAM VE SINIRLAR

SOURCE diff’indeki 15 gerçek yolu, ilgili kod ve testleri, tam 14 alanlı P-E1-021 paketini, T-E1-021 kayıt/profil/metinlerini, manifest ve CI_PLAN tüketim kayıtlarını, E-DEV-120/121 koruma tarihçesini, snapshot/inventory/index değerlerini inceledim. Yedi tasarım karşılaştırmasının tümünü ve on kapanış katmanını okudum. İlk okuma R1/R2/R3 tam özgün raporlarını ve loglarını; full-r1/r2/r3, target-r1/r2/r3/r4, format/analyze, graph-r1/r2/r3/r4 ve native-r1/r2/r3/r4 kayıtlarını inceledim. 22 benzersiz r4 PNG’nin tamamını ve D02’yi açtım. Exact SOURCE CI makbuzundaki tüm 17 ham log hash’ini eşledim; canlı PR ve iki PR T3 job’ını ayrıca okudum.

Bu incelemenin sonucu ürün doğrulaması veya bağımsız gerçek insan/cihaz kabulü değildir. Feed, satıcı, kaynak kimliği, amaç beyanının yetkili yerden geldiği, SCR-TBD, onaylı son ekran/flow, gerçek ekran okuyucu/cihaz, fiziksel uygulama ve release kanıtı yoktur. İstenen reviewer model etiketi runtime kanıtıyla desteklenmedi. Üst feature/flow/design/production/human/device/physical/release kapıları HELD kalır.

Çalışma ağacına veya PR’a yazmadım, commit/merge yapmadım. Yalnız bu rapor dosyasını state klasörüne UTF-8 BOM’suz ve LF sonlandırmalı olarak kaydediyorum.</pre>

RAWBase64: VC1FMS0wMjEg4oCUIFNPVVJDRSBiYcSfxLFtc8SxeiBiw7x0w7xuIGluY2VsZW1lc2kKClRhcmloOiAyMDI2LTEwLTEzCgpIw5xLw5xNCgpTSU5JUkxJIFBBU1MuIEV4YWN0IFNPVVJDRSBiYcWfxLEgacOnaW4gaW5jZWxlZGnEn2ltIG1ldmN1dCBFMSBzdW51bSBkaWxpbWluZGUgZW5nZWxsZXlpY2kgdmV5YSBkw7x6ZWx0aWxtZXNpIGdlcmVrZW4gYnVsZ3Ugc2FwdGFtYWTEsW0uIEJ1IGjDvGvDvG0geWFsbsSxeiBULUUxLTAyMeKAmWluIGFkYXkgc3VudW0gZGF2cmFuxLHFn8SxbmEgaWxpxZ9raW5kaXIuIMOccsO8biwgw7xyZXRpbSBmZWVk4oCZaSwgb25heWzEsSBmbG93LCBmaW5hbCB0YXNhcsSxbSwgaW5zYW4vY2loYXoga2FidWzDvCwgcmVsZWFzZSB2ZXlhIG1lcmdlIGthYnVsw7wgYW5sYW3EsW5hIGdlbG1lei4KCsSwbmNlbGVtZSBub3R1OiBBbWHDpyBlbnVtdSDDp2HEn8SxcmFuxLFuIGJleWFuxLFkxLFyLiBHdWlkZVNjb3BlUHJldmlldy5jb21tZXJjaWFsUHVycG9zZSB2YXJzYXnEsWxhbsSxIHN1cHBsZW1lbnQgb2xkdcSfdSBpw6dpbiBwYXJhbWV0cmV5aSBhdGxheWFuIGJpciDDp2HEn3LEsSB0aWNhcmkgw6dvY3XEn3UgZ8O2csO8bsO8ciBrxLFsYXIuIEJ1LCDDtm5jZWtpIGJpbGdpIGfDtnN0ZXJpbWluaSBrb3J1bWEga2FyYXLEsXlsYSB1eXVtbHVkdXIgdmUgYnUgZGVwb2RhIEd1aWRlU2NvcGVQcmV2aWV3IGnDp2luIMO8cmV0aW0gw6dhxJ9yxLEgbm9rdGFzxLEgYnVsdW5tYWTEscSfxLFuZGFuIGJ1IFNPVVJDRSBrYXBzYW3EsW7EsSBkdXJkdXJhbiBiaXIgaGF0YSBzYXltYWTEsW0uIEdlbGVjZWt0ZSBnZXLDp2VrIGtheW5hxJ9hIGJhxJ9sYW7EsXJrZW4gYW1hw6cgYmV5YW7EsW7EsW4gZG/En3J1IGtheW5ha3RhbiBnZWxkacSfaW5pIGRvxJ9ydWxheWFuIMO8c3Qga2F0bWFuIGF5csSxY2Ega3VydWxtYWzEsWTEsXIuIMWeaW1kaWtpIGtvZCBidSBkb8SfcnVsYW1hecSxIGlkZGlhIGV0bWV6LgoKS8SwTUzEsEsgVkUgWUVUS8SwCgrEsG5jZWxlbmVuIGRlcG86IEM6XFVzZXJzXFhwaWtlXC5jb2RleFx3b3JrdHJlZXNcZTQtcmVxdWlyZWQtYXV0by10cmFuc2ZlclxrYXZyaXZhLWFwcApEYWw6IGNvZGV4L2UxLXJhbmtpbmctZmlyZXdhbGwKRXhhY3QgSEVBRC9TT1VSQ0U6IGRjMTgwZTlkMzVlYzYwOWRkZmMxMmU2ZDk3OTQzNTAyODBiNWJhNzYKQkFTRTogM2UwNGM4MDMzNzgxMzU4Y2VjM2JjZjQ1MDIxOGJjNTIzNzRmNGZiYQpQUkVDT0RFOiBkZjcwMDQ2YTYyYTdmMDA4Y2NjZDRjY2IzOWI0N2Y0NGViYTUwNWUyCkNPREU6IDY0OWQzZWQyNzA1MmUzYzBkM2NlOTM2MjkyYTcyZmY5NGFiMTYyYjgKUGxhbiBvdG9yaXRlc2k6IHlhbG7EsXogQzpcVXNlcnNcWHBpa2VcRGVza3RvcFxLYXZyaXZhLXBsYW4gacOnaW5kZWtpIG9yaWdpbi9tYWluIGZhOTE0ZjAxM2ZkY2QwMzJmYWVkODc2Njg5MDkyZGEyNDU5ODk0NTkuClBSOiAjMTIzLCBvcGVuLCBkcmFmdCwgbWVyZ2VkPWZhbHNlOyBiYXNlIFNIQSBCQVNFIHZlIGhlYWQgU0hBIFNPVVJDRSBpbGUgZcWfbGXFn2l5b3IuCgpDaGVja291dCBIRUFE4oCZaSBleGFjdCBTT1VSQ0UgaWRpIHZlIGluY2VsZW1lIGJhxZ/EsW5kYSDDp2FsxLHFn21hIGHEn2FjxLEgdGVtaXpkaS4gQkFTReKGklNPVVJDRSBkZcSfacWfaWtsaWtsZXJpIHNjb3BlLmpzb27igJlkYWtpIDE2IGl6aW5saSB5b2x1biAxNeKAmWl5bGUgYmlyZWJpciBlxZ9sZcWfdGk7IGl6aW4gZMSxxZ/EsSBkb3N5YSB5b2suIHNwb25zb3JlZF9tYXJraW5nLmRhcnQgaXppbmxpIHlvbGxhciBhcmFzxLFuZGEga2FsZMSxIGZha2F0IGRlxJ9pxZ9tZWRpLiBCdSBkb3N5YW7EsW4gQkFTRSB2ZSBTT1VSQ0UgYmF5dGxhcsSxIGF5bsSxOyBTSEEtMjU2IDk5NzFmZTU1NjRlZjM1MjJhMjU3YzI4OWZkMGM1M2I3MzE1Yjc1NjI4OGMwODMzNjllZmYwYjUzMDU0N2RmNTYuCgpLT0QgVkUgw5xSw5xOIERBVlJBTknFnkkKCnJhbmtpbmdfZmlyZXdhbGwuZGFydCwgc3VwcGxlbWVudCwgcmVwbGFjZUd1aWRlLCBzYWxlc1RhcmdldCwgdGVjaG5pY2FsUmFua2luZyB2ZSB1bmtub3duIGRlxJ9lcmxlcmluZGVuIG9sdcWfYW4ga2FwYWzEsSBiaXIgc3VudW0gZW51bXUgdGFuxLFtbGFyLiBSYW5raW5nRmlyZXdhbGxWaWV3LCB0aWNhcmkgYWx0IGJpbGXFn2VuaSB5YWxuxLF6IHN1cHBsZW1lbnQgb2xkdcSfdW5kYSBhxJ9hY2EgZWtsZXIuIERpxJ9lciBkw7ZydCBhbWHDp3RhIHRpY2FyaSBpc2ltL2F5csSxbnTEsSBnaXpsZW5pciB2ZSBhbWFjYSB1eWd1biBnZXJla8OnZSBnw7ZzdGVyaWxpci4gRWtyYW5kYWtpIG1ldGluIHJlaGJlciB2ZSBtb3Rvc2lrbGV0ZSB1eWd1bmx1ayBhbGFuxLFuxLFuIMO8c3R0ZSBrYWxkxLHEn8SxbsSxLCBsaXN0ZW5pbiBidW5sYXLEsW4geWVyaW5pIGFsbWFkxLHEn8SxbsSxLCBzYXTEscWfIHZleWEgZGF2cmFuxLHFnyDDtmzDp8O8bWxlcmluaW4gdGVrbmlrIHNlw6dpbWUga2F0xLFsbWFkxLHEn8SxbsSxIGHDp8Sxa2xhci4KCkd1aWRlU2NvcGVQcmV2aWV3LCBtZXZjdXQgTW90b3JjeWNsZUZpdFZpZXfigJnEsSBheW7EsSBiYcSfbGFtIHZlIGF5bsSxIEZpdFByZXNlbnRhdGlvbiBpbGUgw7ZuY2Uga3VyYXI7IHRpY2FyaSBzdW51bSBhbGFuxLFuxLEgb251biBzb25yYXPEsW5hIGtveWFyLiBjb21tZXJjaWFsID09IG51bGwgb2xkdcSfdW5kYSB5ZW5pIGFsYW4gb2x1xZ9tYXouIFRpY2FyaSBzxLFyYSB2ZXlhIGFtYcOnIGRlxJ9pxZ9pbWkgdGVrbmlrIGZpdCBuZXNuZXNpbmkgZGXEn2nFn3Rpcm1lei4gWWVuaSByb3V0ZSwgc2VrbWUsIGthdGFsb2csIHByb3ZpZGVyLCBhxJ8vREIgw6dhxJ9yxLFzxLEsIGFuYWx5dGljcyBjYWxsYmFja+KAmWksIMO2ZGVtZSwgc2F0xLFuIGFsbWEgdmV5YSBoYXrEsXJsxLFrIGl6bmkgw7xyZXRpbWkgZWtsZW5tZW1pxZ90aXIuIE1ldmN1dCBzcG9uc29yIG1vZGVsaSBkZSBkZcSfacWfdGlyaWxtZW1pxZ90aXIuCgpBbWHDpyBkZcSfZXJpbmluIGtlbmRpc2kgZ2Vyw6dlayBuaXlldCBkb8SfcnVsYW1hc8SxIGRlxJ9pbGRpcjsga29kIHlvcnVtdSB2ZSBrYXnEsXRsYXIgYnVudSBhw6fEsWvDp2Egc8SxbsSxcmxhci4gVGVzdGxlcmRlIGfDtnN0ZXJpbGVuIMO2cm5layBmaXQga2F5bmHEn8SxIHZlIMO2cm5layBzYXTEsWPEsSBtZXRuaSBnZXLDp2VrIGJpciBtb3Rvc2lrbGV0IGthcmFyxLEgZ2liaSBzdW51bG11eW9yLiBCdSBzdW51bSBwYXLDp2FzxLEsIGRvxJ9ydWxhbm3EscWfIMO8cmV0aW0gZmVlZOKAmWkgdmV5YSB0ZWsgYmHFn8SxbmEgZ8O8dmVubGlrL3BvbGljeSBrYXDEsXPEsSBvbGFyYWsgZGXEn2VybGVuZGlyaWxlbWV6LgoKRklUIFZFIEhBWklSTElLIENBTExCQUNL4oCZxLAKCk1ldmN1dCBmaXQgYWxhbsSxbmRhIGhhesSxcmzEsWsgZ8O2csO8bsO8bcO8IGFuY2FrIHNvbnXDpyBiYcSfbGFtxLEgaGVkZWZsZSBlxZ9sZcWfdGnEn2luZGUsIGthbsSxdCBnw7xuY2VsIHZlIGF5bsSxIGJhxJ9sYW1kYSBvbGR1xJ91bmRhLCBzb251w6cgY29uZmlybWVkIG9sZHXEn3VuZGEsIGVrcmFuIG1lxZ9ndWwgZGXEn2lsa2VuIHZlIGhhdGEgeW9ra2VuIGHDp8SxbMSxci4gQ2FsbGJhY2sgaGVkZWYgb2xhcmFrIE1vdG9yY3ljbGVGaXRWaWV34oCZxLFuIGtlbmRpIGNvbnRleHQgZGXEn2VyaW5pIGlsZXRpci4KCk9kYWtsxLEgdGVzdGxlciB0w7xtIGJlxZ8gdGljYXJpIGFtYcOnIGnDp2luIMWfdW5sYXLEsSBrYXLFn8SxbGHFn3TEsXLEsXlvcjoKCi0gR2XDp2VybGkgYXluxLEgaGVkZWZ0ZSBzcG9uc29yIHNlw6dlbmVrbGVyaW5pbiBzxLFyYXPEsSBpbGVyaS90ZXJzIMOnZXZyaWxkacSfaW5kZSB2ZSBhbWHDpyBkZcSfacWfdGnEn2luZGUgZml0IG5lc25lc2kgYXluxLEga2FsxLF5b3I7IGhhesSxcmzEsWsgY2FsbGJhY2vigJlpIG9uIGtleiBheW7EsSBoZWRlZiBWYXJpYW50Q29udGV4dCBuZXNuZXNpbmkgYWzEsXlvci4KLSBFa3NpayBmaXQsIG1pc3NpbmdEaXN0aW5jdGlvbiwgZXNraSBrYW7EsXQsIGJhxZ9rYSBtb3Rvc2lrbGV0ZSBhaXQga2FuxLF0IGJhxJ9sYW3EsSB2ZSBiYcWfa2EgcmVoYmVyL21vdG9zaWtsZXQgaGVkZWZsaSBmaXQgZHVydW1sYXLEsW5kYSBoYXrEsXJsxLFrIGV5bGVtaSBnw7Zyw7xubcO8eW9yIHZlIGNhbGxiYWNrIMOnYcSfcsSxbG3EsXlvci4KLSBNZcWfZ3VsL2hhdGEvw6dldnJpbWTEscWfxLEgZHVydW1sYXLEsSwgZXNraSB2ZXlhIGXFn2xlxZ9tZXllbiBzY29wZeKAmWxhciB2ZSBiYcSfbGFtIGRlxJ9pxZ9pbWxlcmkgdGljYXJpIGlzaW1sZXJpIGdlcmkgZ2V0aXJtaXlvci4KLSBBbWHDpyBkZcSfacWfaW5jZSDDtm5jZWtpIHRpY2FyaSBsaXN0ZSBzxLF6bcSxeW9yOyByZWhiZXIgdmUgZ2XDp2VybGkgZml0IGtvcnVudXlvci4gVGFiL0VudGVyL1NwYWNlIGVyacWfaW0gdGVzdGxlcmkgYXluxLEgaGVkZWZlIGdpZGl5b3IuCgpCdSBuZWdhdGlmbGVyIFQwMjHigJlpbiB0aWNhcmkgYW1hw6cgdmUgbWV2Y3V0IGhhesSxcmzEsWsgeW9sdSBzxLFuxLFyxLFuxLEga29kIGTDvHpleWluZGUgZGVzdGVrbGl5b3IuIEhhesSxcmzEsWsgY2FsbGJhY2vigJlpbmluIHNvbnJha2kgZMSxxZ8gZGF2cmFuxLHFn8SxIHZleWEgZ2Vyw6dlayDDvHLDvG4geWV0a2lzaSBidSBFMSBzxLFuxLFyxLFuZGEgdGVzdCBlZGlsbWnFnyBzYXnEsWxtYXouCgpLQVlJVExBUiBWRSBHRcOHTcSwxZ4gS09SVU1BU0kKCnNjb3BlLmpzb24gacOnaW5kZWtpIEJBU0UgcGlubGVyaW5pbiAxMjHigJlpbmluIHRhbWFtxLFuxLEgQkFTRSBHaXQgYmxvYuKAmWxhcsSxbmRhbiB0ZWtyYXIgaGVzYXBsYWTEsW07IHV5dcWfbWF6bMSxayBzxLFmxLFyLiBEZcSfacWfaWtsaWsgbGlzdGVzaSAxNS8xNiBpemlubGkgeW9sLiBFLURFVi0xMjAgw7ZuY2VraSBrYXlkxLEgeWVuaSB0w7xrZXRpY2l5ZSBiYcSfbGFuYW4gZnJvbnRtYXR0ZXIgcmVmZXJhbnPEsSB2ZSBhcHBlbmQtb25seSBpbmNlbGVtZSBla2l5bGUgZ2VuacWfbGV0aXlvcjsgZXNraSBzdWJqZWN0IGthbsSxdMSxIHZlIMO2bmNla2kgcmFwb3JsYXIgc2lsaW5tZW1pxZ8uIEtvcnVuYW4gc3BvbnNvcmVkX21hcmtpbmcuZGFydCBiYXl0xLEgZXNraSBzdWJqZWN0IGtheWTEsXlsYSBlxZ9sZcWfaXlvci4KClQwMjEgcGFrZXRpIFBSRUNPREUgdmUgU09VUkNF4oCZdGEgMeKAmWRlbiAxNOKAmWUga2FkYXIgMTQgem9ydW5sdSBhbGFuxLEgacOnZXJpeW9yLiBLYXBzYW0gZMO8emVsdG1lIGNvbW1pdOKAmWkgMjk4ZDRmZGQwOGNiZGEyOGE3ZjcwYzcyNDkxMTY1YzA1NDk4NTViZjsgZMO8emVsdG1lIMO2bmNlc2kgYmHFn2FyxLFzxLF6IGtvbXV0dW4ga2F5ZMSxIGRhIHNha2xhbm3EscWfLiBTYWJpdCAyMCBzb3J1bHVrIGZpeHR1cmUgUFJFQ09EReKGklNPVVJDRSBiYXl0w6dhIGF5bsSxOiAxLjUzMCBiYXl0LCBTSEEtMjU2IDNjZDI3NmMwYmVlMDg1NTVkN2VkMTU1Y2YwM2QyM2Q1MmQ5YmQ0ZDA5MmI3ZTQ4ZmU5ZTExZDJkM2I2YjViMTkuCgpSQVd2ODcgc25hcHNob3TigJnEsW4gZ8O8bmNlbCBiYXl0IHV6dW5sdcSfdSAyMjguMDM0IHZlIFNIQS0yNTbigJlzxLEgODNiMjRmNjZkM2NkYzkxZjRjMTk1Yzk4NGMyNjYyN2QyYTYyZTZmYTNiZTc4ODlhZDJiNjdiYTIwYjI1ZDYzNjsgc2NvcGUga2F5ZMSxeWxhIGXFn2xlxZ9peW9yLiBHw7xuY2VsIGludmVudG9yeSB2ODggdmUgZ2VuZXJhdGVkIGluZGV4IDExMyBzYXTEsXIuIENJ4oCZbmluIGluZGV4IMO8cmV0aW0gYWTEsW3EsSBkYSBleGFjdCBTT1VSQ0XigJl0YSAxMTMgcm93cyAtPiByZWdpc3RyeS5qc29uIHNvbnVjdW51IHZlcmRpLgoKVGFyaWhzZWwgZGVuZW1lbGVyIGF5csSxIHR1dHVsbXXFnzogbW9kZWxpbiBpbGsgeWVybGXFn2ltIGFkYXnEsSB2ZSB0YXJnZXQtcjEsIGthcHNhbSBkw7x6ZWx0bWVzaW5kZWtpIEFzc2VydGlvbkVycm9yLCBncmFwaC1yMSBiYcWfYXLEsXPEsXpsxLHEn8SxLCBuYXRpdmUtcjIgacOnaW5kZSB5YWthbGFtYSB5YXBtYWRhbiB5YWxuxLF6IHllZGkgdGVzdCBrb8WfdWxtYXPEsSwgUjHigJlpbiBzb3J1IDE5IHZlIFIy4oCZbmluIHNvcnUgMTIgacOnaW4gcmV0bGVyaS4gQnVubGFyxLFuIGhpw6diaXJpIGfDvG5jZWwgUEFTUyBrYW7EsXTEsSBvbGFyYWsga3VsbGFuxLFsbWFkxLEuIMSwa2kgbWV0aW4gZMO8emVsdG1lc2luZGVuIHNvbnJhIMO8cmV0aWxlbiBSMyBpbGsgb2t1bWEgcmFwb3J1IDUuMTQ3IGJheXQgdmUgU0hBLTI1NiBhNDg2ZWUzNzdmYTU0MDcxZWY0NzI5OGUyMWVlOWU2MWZlZWJmOWJkZDI4YWRjYjFmMTU0YTk2MGU2ZWVkMzAzOyByYXBvcnVuIGtlbmRpc2kgUEFTUyBkZXIgdmUgbWV2Y3V0IGfDtnJzZWwgc29ydSBzZXRpbmkgY2V2YXBsYXIuIE1vZGVsIGnDp2luIGdwdC02LWx1bmEvbWF4IGlzdGVubWnFnzsgYnUgaW5jZWxlbWVkZSBnw7x2ZW5pbGlyIHJ1bnRpbWUgZXRpa2V0aSBnw7Zyw7xubWVkacSfaW5kZW4gYnUgbW9kZWxpbiDDp2FsxLHFn3TEscSfxLFuxLEgZG/En3J1bGFubcSxxZ8gc2F5bcSxeW9ydW0uCgpHRVLDh0VLIEfDllLDnE5Uw5wgVkUgVEFTQVJJTSBLQVLFnklMQcWeVElSTUFTSQoKbmF0aXZlLXI0LXByb29mLmpzb24gacOnaW5kZWtpIDUxIFBORyBrYXlkxLFuxLFuIGhlciBiaXIgZG9zeWEgYm95dXR1bnUgdmUgU0hBLTI1NuKAmXPEsW7EsSB5ZW5pZGVuIGthcsWfxLFsYcWfdMSxcmTEsW06IDUxLzUxIGXFn2xlxZ90aS4gTWFrYnV6IDIyIGJlbnplcnNpeiBpw6dlcmlrIHZlIDI5IGJheXQtZcWfIGFsaWFzIHZlcml5b3I7IDIyIGJlbnplcnNpeiBkb8SfYWwgRmx1dHRlciBla3JhbsSxbsSxIHRlayB0ZWsgYcOnxLFwIGluY2VsZWRpbS4gRS0xMDE54oCZZGFraSBEMDIgRDAyLVNDUi0wMTAtR3VpZGUtU2NvcGUtRml0LnBuZyBkb3N5YXPEsW7EsSBkYSBnZXLDp2VrdGVuIGHDp3TEsW0uIEfDtnJzZWxsZXJpbiDDtmzDp8O8c8O8IDM5MMOXODQ0OyB0ZXN0IGFrxLHFn8SxIDIwIGfDtnLDvG7DvG0gZHVydW11bnVuIGRvxJ9hbCB0YW0ga2F5ZMSxcm1hIHBhcsOnYWxhcsSxbsSxIGnDp2VyaXlvci4gRml0IHZlIHJlaGJlciBhbGFuxLEgw7xzdHRlOyB5YXJkxLFtY8SxIHRpY2FyaSBhbGFuIHZlIGVuZ2VsIGdlcmVrw6dlbGVyaSBhxZ9hxJ/EsWRhLiBTb3J1IDE54oCZdSBoZWRlZmxleWVuIMO2cm5layBrYXluYWsgbWV0bmkgZ2Vyw6dlayBtb3Rvc2lrbGV0IGthcmFyxLEgb2xtYWTEscSfxLFuxLEgc8O2eWzDvHlvci4gU29ydSAxMuKAmXlpIGhlZGVmbGV5ZW4gZW5nZWwgbWV0bmkgw7ZuY2VkZW4ga3VsbGFuxLFsYWJpbGVuIHJlaGJlciB5b2x1bnVuIGHDp8SxayBrYWxkxLHEn8SxbsSxLCBtZXZjdXQgb2xtYXlhbiB5b2x1biB0aWNhcmkgbGlzdGV5bGUgYcOnxLFsbWFkxLHEn8SxbsSxIHPDtnlsw7x5b3IuIEfDtnJzZWxsZXJkZSBrYWzEsWPEsSBrxLFycMSxbG1hIHZleWEgdGHFn21hIGfDtnpsZW1lZGltLgoKRDAyIGthbm9uaWsgdGFzYXLEsW3EsW5kYSBidSB5ZW5pIHlhcmTEsW1jxLEgYWxhbiB5ZXIgYWxtxLF5b3IuIEtheW5haywgU0NSLTAxMC9KLTAxMiBiYcSfbGFtxLFuZGEgbWV2Y3V0IGZpdCBhbGFuxLEgYWx0xLFuYSBla2xlbmVuIHPEsW7EsXJsxLEgc3VudW0gdMO8cmV2aSBvbGFyYWsga2FsxLF5b3IuIEJ1IGthcsWfxLFsYcWfdMSxcm1hIHNvbiBwaWtzZWwvdGFzYXLEsW0gb25hecSxIGRlxJ9pbGRpci4KClllZGkgdGFzYXLEsW0ga2FyxZ/EsWxhxZ90xLFybWFzxLFuxLFuIHNvbnVjdToKCjEuIFRhbSBla3JhbjogbWV2Y3V0IHJlaGJlciBrYXBzYW3EsSB2ZSBmaXQgaWxrIHPEsXJhZGE7IHRpY2FyaSBzdW51bSBzb25yYXPEsW5kYS4KMi4gS29txZ91L8O2bmNla2kgZWtyYW46IGNvbW1lcmNpYWwgPT0gbnVsbCB2ZSB2YXJzYXnEsWxhbiBhbWHDpyBlc2tpIGJpbGdpIGfDtnN0ZXJpbWluaSBrb3J1eW9yOyB5ZW5pIGVrcmFuIHZleWEgcm91dGUgeW9rLgozLiBEdXJ1bWxhcjogMjAgc2FiaXQgw7ZybmVrOyBzcG9uc29ybHUvc3BvbnNvcnN1eiwgYmlsaW5tZXllbiwgZWtzaWsgYWx0ZXJuYXRpZi9rYXluYWssIGxvYWRpbmcvZXJyb3IvaGVsZC9vZmZsaW5lL3N0YWxlIHZlIGFtYcOnIGVuZ2VsbGVyaS4KNC4gRHV5YXJsxLEgZMO8emVuOiAyMCBkdXJ1bSDDlyAzMjAvMzkwLzc2OCBnZW5pxZ9saWsgw5cgMS8yLzMgeWF6xLEgw7Zsw6dlxJ9pID0gMTgwIHRhbSBrYXlkxLFybWEga29tYmluYXN5b251LiBGaXppa3NlbCBjaWhheiBrYWJ1bMO8IGRlxJ9pbC4KNS4gRXJpxZ9pbGViaWxpcmxpazogaGVhZGxlc3Mgc2VtYW50aWNzLCBvZGFrLCBUYWIvRW50ZXIvU3BhY2UsIGhpdCBhbGFuxLEgdmUga29udHJhc3Qga29udHJvbGxlcmkuIEdlcsOnZWsga3VsbGFuxLFjxLEvZWtyYW4gb2t1eXVjdSBjaWhheiBrYWJ1bMO8IGRlxJ9pbC4KNi4gS2Fub25payBlxZ9sZcWfbWU6IFNDUi0wMTAsIEQwMiB2ZSBKLTAxMiBpbGUgYWxhbiB5ZXJpL3JvbMO8IGthcsWfxLFsYcWfdMSxcsSxbGTEsS4gU0NSLVRCRCwgdG9rZW4vcGlrc2VsL3NvbiBha8SxxZ8gb25hecSxIEhFTEQuCjcuIFJlZ3Jlc3lvbjogNDQ3IGtvcnVubXXFnyB0ZXN0ICsgNyB5ZW5pIG9kYWsgdGVzdGk7IDEyMSBCQVNFIHBpbjsgMTUvMTYgaXppbmxpIHlvbDsgc3BvbnNvciBkb3N5YXPEsSBiYXl0w6dhIGtvcnVubXXFnzsgaW5kZXggMTEzIHZlIHY4NyBzbmFwc2hvdCBrYXlkxLEgZcWfbGXFn2l5b3IuCgpPTiBLQVBBTknFniBLQVRNQU5JIFZFIMOcU1QgU0lOSVJMQVIKCjEuIEfDtnJldjogVC1FMS0wMjEgeWVyZWwgYWRheTsgcmVnaXN0cnkgUkVWSUVXLgoyLiBGZWF0dXJlOiBGMS45LjLigJluaW4geWFsbsSxeiBidSBzdW51bSBkaWxpbWkgZWxlIGFsxLFuZMSxLgozLiBGbG93OiBGTDEuOS4yIFBST1BPU0VEIHZlIFNDUi1UQkQgb25heXPEsXovSEVMRC4KNC4gUmVxdWlyZW1lbnQ6IEJSLTA3MC8wNzEvMDczIGnDp2luIHN1bnVtIG5lZ2F0aWZsZXJpIGthbsSxdGzEsTsgZ2Vyw6dlayBrYXluYWsgYW1hY8SxIGRvxJ9ydWxhbm3EscWfIGRlxJ9pbC4KNS4gRGVzaWduOiB5ZWRpIHPEsW7EsXJsxLEga2FyxZ/EsWxhxZ90xLFybWEgeWFwxLFsZMSxOyBmaW5hbCB0YXNhcsSxbS9pbnNhbi9jaWhheiBrYWJ1bMO8IEhFTEQuCjYuIEFyY2hpdGVjdHVyZTogRTEgacOnIHJlbmRlciBrYXBzYW3EsTsgRTMvRTUgeWV0a2lzaSwgcHVibGljIHNlYW0gdmV5YSBZQU1MIGRlxJ9pxZ9pa2xpxJ9pIHlvay4gRTNSMSBSRVZJRVcsIEU1IElOX1BST0dSRVNTLgo3LiBEYXRhL21pZ3JhdGlvbjogxZ9lbWEgdmV5YSB2ZXJpIGfDtsOnw7wgeW9rOyBtZXZjdXQga2F5xLF0L21vZGVsIGtvcnVubXXFny4KOC4gUmVsZWFzZTogZXhhY3QgU09VUkNFIENJL1QzIGJhxZ9hcsSxbMSxOyBvbGHEn2FuIG1lcmdlLCBtYWluIGRvxJ9ydWxhbWFzxLEgdmUgw7xyw7xuIHJlbGVhc2XigJlpIGJ1IGjDvGvDvG1sZSBrYXBhbm3EsXlvci4KOS4gUHJvZHVjdCBzY2VuYXJpbzogc2FiaXQgMjAgZWtyYW4gw7ZybmXEn2k7IGdlcsOnZWsgc2F0xLFjxLEsIHRla2xpZiwgc2F0xLHFnyB2ZXlhIMO2ZGVtZSBzZW5hcnlvc3UgeW9rLgoxMC4gR2FwIGF1ZGl0OiBnZXLDp2VrIGZlZWQva2ltbGlrLCByb3V0ZXIsIGNpaGF6L2luc2FuLCBzb24gdGFzYXLEsW0gdG9rZW5sYXLEsSB2ZSB5YXnEsW4ga2FuxLF0xLEgSEVMRC4KCkdFUsOHRUsgQ0kgVkUgUFIgRE/EnlJVTEFNQVNJCgpzb3VyY2UtY2kuanNvbiBTSEEtMjU2IDgxMDA5YzI3MWNiZGNkOGQ3ZjZjYWQxNDgwM2UxMTRjYTk0MWI4NzAwYzg5ODlhNTU5ZDA0MTVkNDhlMjQxMWIuIEthecSxdHRha2kgMTcga2/Fn3VudW4gaGVyIGJpcmkgacOnaW4geWVyZWwgc291cmNlLTxydW4+LmxvZyBoYW0gZG9zeWFzxLFuxLEgb2t1ZHVtOyBib3l1dCB2ZSBTSEEtMjU2IG1ha2J1enV5bGEgZcWfbGXFn3RpLiBIZXIga2/Fn3VudW4gaGVhZFNoYSBkZcSfZXJpIGV4YWN0IFNPVVJDRS4gRGHEn8SxbMSxbSA4IHB1c2ggdmUgOSBwdWxsX3JlcXVlc3Q7IHNla2l6IHdvcmtmbG93IGFpbGVzaSBlMSBzaGVsbCwgZTMgYXV0aG9yaXphdGlvbiwgZTMgbGl2ZSBhdXRoLCBlNCBvZmZsaW5lIGNvbXBvc2l0aW9uLCBlNSBjdXJyZW50IGF1dGhvcml0eSwgZTYgcmVsZWFzZSBwb2xpY3ksIGU5IGJvdW5kZWQgcHJvcG9zYWwgdmUgYXJjaGl0ZWN0dXJlLiBNYWtidXogdG9wbGFtIDIwIGpvYiB2ZSAxMTcgc3RlcCBpw6dlcml5b3I7IHTDvG0gc3RlcOKAmWxlciB0YW1hbWxhbm3EscWfL2JhxZ9hcsSxbMSxLiBUw7xtIGpvYuKAmWxhciBiYcWfYXLEsWzEsSwgdGVrIGF5csSxbSBwdXNoIGFyY2hpdGVjdHVyZSBrb8WfdXN1bmRha2kgVDMgacWfaW5pbiBza2lwcGVkIG9sbWFzxLFkxLFyLgoKRXhhY3QgU09VUkNFIEUxIHB1c2ggcnVuIDM4MzE1OTkyMDM1IHZlIFBSIHJ1biAzODMxNTk5ODE0MCBpw6dpbmRlIGZvcm1hdCA0OSBmaWxlcyAoMCBjaGFuZ2VkKSwgYW5hbGl6IE5vIGlzc3VlcyBmb3VuZCwgd2lkZ2V0L25hdGl2ZSBoZWFkbGVzcyBzdWl0ZSArNDU0OiBBbGwgdGVzdHMgcGFzc2VkIHlhesSxeW9yLiBFMyBsaXZlLWF1dGggUFIgcnVuIDM4MzE1OTk4MTYwIGdlcsOnZWsgaXpvbGUgU3VwYWJhc2UgQXV0aCBzaWdudXAvc2Vzc2lvbi9ndWFyZC9sb2dvdXQga29udHJvbMO8bsO8IFBBU1M7IGRvxJ9ydWRhbiBEYXRhIEFQSS9wcml2YXRlIFN0b3JhZ2UvY2xpZW50LXJvbGUgYnlwYXNzIGtvbnRyb2xsZXJpIGRlIFBBU1Mgb2xhcmFrIGtheWRlZGl5b3IuIEJ1bmxhciBUMDIx4oCZaW4gZ2Vyw6dlayDDvHJldGltIGRvxJ9ydWxhbWFzxLEgZGXEn2lsZGlyLgoKUFIgIzEyM+KAmXRlIDM4MzE1OTk4MTM4IHJ1buKAmcSxbsSxbiB0My1nYXRlIGpvYuKAmcSxIDExNTAzMjY0NTMxOCwgMzgzMTU5OTg1NDQgcnVu4oCZxLFuxLFuIHQzLWdhdGUgam9i4oCZxLEgMTE1MDMyNjQ2NDczOiBoZXIgaWtpc2kgZGUgdGFtYW1sYW5kxLEvYmHFn2FyxLFsxLEgdmUgYmXFnyBhZMSxbcSxbiB0YW1hbcSxIGJhxZ9hcsSxbMSxLiDEsGtpIHJhdyBsb2cgZXhhY3QgU09VUkNF4oCZdSwgY2hlY2stY29uZm9ybWFuY2U6IDEyMCBldmlkZW5jZSByZWNvcmRzIHNjYW5uZWQgdmUgY2hlY2staWRlbnRpdHk6IDM4NCBJRHMgaW5kZXhlZCwgNDkxIGZpbGVzIHNjYW5uZWQgc29udcOnbGFyxLFuxLEgacOnZXJpeW9yLiDEsGxnaWxpIGFyY2hpdGVjdHVyZSBqb2LigJlsYXLEsSBnZW5lcmF0ZWQgaW5kZXjigJlpbiAxMTMgc2F0xLFyxLFuxLEgZGEgeWVuaWRlbiDDvHJldGl5b3IuIFB1c2ggcnVuIDM4MzE1OTkyMjUyIGnDp2luIHQzLWdhdGUgam9i4oCZxLEgc2tpcHBlZDsgYnUgUFIgVDMgYmHFn2FyxLFsYXLEsW5hIGRhaGlsIGVkaWxtZWRpLiBQUiBBUEkgb2t1bWFzxLEgYcOnxLFrL3Rhc2xhay91bm1lcmdlZCBkdXJ1bXVudSB2ZSBheW7EsSBCQVNF4oaSU09VUkNFIGJhxZ9sYXLEsW7EsSBnw7ZzdGVyaXlvci4KClllcmVsIGRvxJ9ydWxhbWEga2F5xLF0bGFyxLEgYXlyxLFjYSBmdWxsLXIzLmxvZyBpw6dpbmRlIDQ1NCB0ZXN0IFBBU1MgKGxvZyAxMDUuODQ3IGJheXQ7IFNIQS0yNTYgMzRmMjQwNmUyYTBmZjI1ODcwYWZmMzQzZWVlZDZiMWY5ZjIzZjFiNzI1MjNiYjBmYzc2YmJhNzA4OWJjNGViOCksIHRhcmdldC1yNC5sb2cgacOnaW5kZSA3LzcsIGZvcm1hdC1yMy5sb2cgacOnaW5kZSA0OSBkb3N5YS8wIGRlxJ9pxZ9pa2xpaywgYW5hbHl6ZS1yMS5sb2cgacOnaW5kZSBObyBpc3N1ZXMgZm91bmQgdmUgZ3JhcGgtcjQubG9nIGnDp2luZGUgNDIgdGVzdC93b3JzdCBleGl0ID0gMCBzb251Y3VudSBpw6dlcml5b3IuIG5hdGl2ZS1yNC5sb2cgc2VraXogYXlyxLEgY2FwdHVyZS90ZXN0IGtvbnRyb2zDvG7DvCBQQVNTIGfDtnN0ZXJpeW9yOyBidSBrb8WfdSA0NTQgbm9ybWFsIHRlc3Qgc2F5xLFzxLFuYSBla2xlbm1lei4gQXluxLEgU09VUkNF4oCZZGFraSBDSSBoYW0gbG9nbGFyxLEgZXhhY3QgaGVhZCBpw6dpbiBiYcSfxLFtc8SxeiBiaXIgdGVrcmFyIHNhxJ9sYXIuIEJ1IGluY2VsZW1lZGUgRmx1dHRlciB2ZXlhIGJhxZ9rYSB0ZXN0IGtvbXV0dSDDp2FsxLHFn3TEsXJtYWTEsW0uCgpPS1VOQU4gS0FQU0FNIFZFIFNJTklSTEFSCgpTT1VSQ0UgZGlmZuKAmWluZGVraSAxNSBnZXLDp2VrIHlvbHUsIGlsZ2lsaSBrb2QgdmUgdGVzdGxlcmksIHRhbSAxNCBhbGFubMSxIFAtRTEtMDIxIHBha2V0aW5pLCBULUUxLTAyMSBrYXnEsXQvcHJvZmlsL21ldGlubGVyaW5pLCBtYW5pZmVzdCB2ZSBDSV9QTEFOIHTDvGtldGltIGthecSxdGxhcsSxbsSxLCBFLURFVi0xMjAvMTIxIGtvcnVtYSB0YXJpaMOnZXNpbmksIHNuYXBzaG90L2ludmVudG9yeS9pbmRleCBkZcSfZXJsZXJpbmkgaW5jZWxlZGltLiBZZWRpIHRhc2FyxLFtIGthcsWfxLFsYcWfdMSxcm1hc8SxbsSxbiB0w7xtw7xuw7wgdmUgb24ga2FwYW7EscWfIGthdG1hbsSxbsSxIG9rdWR1bS4gxLBsayBva3VtYSBSMS9SMi9SMyB0YW0gw7Z6Z8O8biByYXBvcmxhcsSxbsSxIHZlIGxvZ2xhcsSxbsSxOyBmdWxsLXIxL3IyL3IzLCB0YXJnZXQtcjEvcjIvcjMvcjQsIGZvcm1hdC9hbmFseXplLCBncmFwaC1yMS9yMi9yMy9yNCB2ZSBuYXRpdmUtcjEvcjIvcjMvcjQga2F5xLF0bGFyxLFuxLEgaW5jZWxlZGltLiAyMiBiZW56ZXJzaXogcjQgUE5H4oCZbmluIHRhbWFtxLFuxLEgdmUgRDAy4oCZeWkgYcOndMSxbS4gRXhhY3QgU09VUkNFIENJIG1ha2J1enVuZGFraSB0w7xtIDE3IGhhbSBsb2cgaGFzaOKAmWluaSBlxZ9sZWRpbTsgY2FubMSxIFBSIHZlIGlraSBQUiBUMyBqb2LigJnEsW7EsSBheXLEsWNhIG9rdWR1bS4KCkJ1IGluY2VsZW1lbmluIHNvbnVjdSDDvHLDvG4gZG/En3J1bGFtYXPEsSB2ZXlhIGJhxJ/EsW1zxLF6IGdlcsOnZWsgaW5zYW4vY2loYXoga2FidWzDvCBkZcSfaWxkaXIuIEZlZWQsIHNhdMSxY8SxLCBrYXluYWsga2ltbGnEn2ksIGFtYcOnIGJleWFuxLFuxLFuIHlldGtpbGkgeWVyZGVuIGdlbGRpxJ9pLCBTQ1ItVEJELCBvbmF5bMSxIHNvbiBla3Jhbi9mbG93LCBnZXLDp2VrIGVrcmFuIG9rdXl1Y3UvY2loYXosIGZpemlrc2VsIHV5Z3VsYW1hIHZlIHJlbGVhc2Uga2FuxLF0xLEgeW9rdHVyLiDEsHN0ZW5lbiByZXZpZXdlciBtb2RlbCBldGlrZXRpIHJ1bnRpbWUga2FuxLF0xLF5bGEgZGVzdGVrbGVubWVkaS4gw5xzdCBmZWF0dXJlL2Zsb3cvZGVzaWduL3Byb2R1Y3Rpb24vaHVtYW4vZGV2aWNlL3BoeXNpY2FsL3JlbGVhc2Uga2FwxLFsYXLEsSBIRUxEIGthbMSxci4KCsOHYWzEscWfbWEgYcSfYWPEsW5hIHZleWEgUFLigJlhIHlhem1hZMSxbSwgY29tbWl0L21lcmdlIHlhcG1hZMSxbS4gWWFsbsSxeiBidSByYXBvciBkb3N5YXPEsW7EsSBzdGF0ZSBrbGFzw7Zyw7xuZSBVVEYtOCBCT03igJlzdXogdmUgTEYgc29ubGFuZMSxcm1hbMSxIG9sYXJhayBrYXlkZWRpeW9ydW0uCg==

## Aynı SOURCE gerçek CI makbuzu

38315998173 e9-bounded-proposal-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998173 RAW 18384 SHA256 f6fe6fb62f21235f408f787d2565f2b94bd82de6a2e1dc0976b1d5a0203f251d
- 115032644816 e9-tests success; Set up job=success, Checkout Kavriva=success, Test E9 internal proposals=success, Post Checkout Kavriva=success, Complete job=success

38315998138 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998138 RAW 47585 SHA256 94370aa794836f27cb1be21a6b6bbb7595b8f27e5abaa0cb5a78a6c55d767f30
- 115032644938 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 115032645318 t3-gate success; Set up job=success, Checkout kavriva-app=success, T3 conformance + identity gate=success, Post Checkout kavriva-app=success, Complete job=success

38315998192 e4-offline-composition-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998192 RAW 56246 SHA256 671323141fc31f88bfd3e0a1ae705084ab59202567d20b3127750e89b05808d1
- 115032645290 e4-tests success; Set up job=success, Checkout Kavriva=success, Test E4 internal composition=success, Post Checkout Kavriva=success, Complete job=success

38315998544 architecture-checks pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998544 RAW 47582 SHA256 8f7594b4fac4395a328370c6c8846727217d7522044057bf6bd1c9019b9dbed2
- 115032646153 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 115032646473 t3-gate success; Set up job=success, Checkout kavriva-app=success, T3 conformance + identity gate=success, Post Checkout kavriva-app=success, Complete job=success

38315998139 e6-release-policy-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998139 RAW 28050 SHA256 494cc21d7ec5d8201ea6c6a8bbb15109a63bc8a8dcdbdfc21b0422a79b53e52d
- 115032645248 e6-tests success; Set up job=success, Checkout Kavriva=success, Test E6 release policies=success, Post Checkout Kavriva=success, Complete job=success

38315998152 e5-current-authority-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998152 RAW 35654 SHA256 83d9c6225b2a302eef85a83ee702bced36a0cd6a67c6b0f906165c00f02bc185
- 115032645040 e5-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E5 current authority decision=success, Post Checkout kavriva-app=success, Complete job=success

38315998166 e3-commit-authorization-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998166 RAW 67284 SHA256 a24318d087f72cdda1f7a987631ea9dc86f8ecd6efac2f446a718c7b501d7b94
- 115032645011 e3-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E3 commit authorization gate=success, Post Checkout kavriva-app=success, Complete job=success

38315998160 e3-live-auth-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998160 RAW 25642 SHA256 4a949191972dcb676fe0c7f9e4817b730ace625d6b4a8c34cbdd038aae01e44e
- 115032645087 live-auth success; Set up job=success, Checkout Kavriva=success, Install pinned PostgreSQL test dependencies=success, Start isolated local Supabase Auth and apply migrations=success, Verify real Auth signup, current session, guarded effect and logout=success, Reject direct database and private Storage bypasses=success, Post Checkout Kavriva=success, Complete job=success

38315998140 e1-shell-widget-tests pull_request https://github.com/xpike-dgm/kavriva-app/actions/runs/38315998140 RAW 164101 SHA256 b4b5c65fc5a32fb3910e4285258e105c1f126b9a2a93ac7600503944c1e25a65
- 115032645245 e1-shell-tests success; Set up job=success, Checkout kavriva-app=success, Install exact Flutter source and verify effective SDK=success, Resolve only locked widget dependencies=success, Verify Dart format and analyze presentation=success, Run headless shell behavior and accessibility checks=success, Post Checkout kavriva-app=success, Complete job=success

38315992087 e9-bounded-proposal-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992087 RAW 17046 SHA256 3b6ed1ecc0cd0345ac774ffe75db88b67c0b70da9ee1f956af84953e1f7d21e1
- 115032625278 e9-tests success; Set up job=success, Checkout Kavriva=success, Test E9 internal proposals=success, Post Checkout Kavriva=success, Complete job=success

38315992156 e4-offline-composition-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992156 RAW 54906 SHA256 5ad93bc7034fdb89f2b6e2ca4d0cd70a474ce3aa18825cb48674eb0866edbbfa
- 115032625147 e4-tests success; Set up job=success, Checkout Kavriva=success, Test E4 internal composition=success, Post Checkout Kavriva=success, Complete job=success

38315992063 e6-release-policy-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992063 RAW 26703 SHA256 f91e8017bb86aff10f158e78908e9b56d8bf0cf1eab2ed86475812e8d69ffbaf
- 115032625029 e6-tests success; Set up job=success, Checkout Kavriva=success, Test E6 release policies=success, Post Checkout Kavriva=success, Complete job=success

38315992279 e3-commit-authorization-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992279 RAW 64725 SHA256 9965c966dc8eeacdbe99c4e3393b8ffd00ff158f2699b3e4f5e45a9c5e939f31
- 115032626325 e3-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E3 commit authorization gate=success, Post Checkout kavriva-app=success, Complete job=success

38315992252 architecture-checks push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992252 RAW 31032 SHA256 e3e940f89385f35347235a1af5d41825d033662c1ae9cf815d417e53504fa09d
- 115032625642 checks success; Set up job=success, Checkout kavriva-app=success, Run architecture suite (CI mode)=success, Secret-pattern scan (OUT-3 B-23; no keys/secrets may land in the tree)=success, Rebuild generated index (proof that generation is reproducible)=success, Post Checkout kavriva-app=success, Complete job=success
- 115032626972 t3-gate skipped

38315992138 e5-current-authority-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992138 RAW 34257 SHA256 921831f5d8fa9401e9360d8bde0f513a1bd9dda8ed0c755c2adaa06e6b55a73b
- 115032625487 e5-tests success; Set up job=success, Checkout kavriva-app=success, Install pinned PostgreSQL test dependencies=success, Test E5 current authority decision=success, Post Checkout kavriva-app=success, Complete job=success

38315992097 e3-live-auth-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992097 RAW 24283 SHA256 f2d4a9caf5015a628f54c523af6b068797c1984467b4dbb5b81c8574c8ca415d
- 115032624970 live-auth success; Set up job=success, Checkout Kavriva=success, Install pinned PostgreSQL test dependencies=success, Start isolated local Supabase Auth and apply migrations=success, Verify real Auth signup, current session, guarded effect and logout=success, Reject direct database and private Storage bypasses=success, Post Checkout Kavriva=success, Complete job=success

38315992035 e1-shell-widget-tests push https://github.com/xpike-dgm/kavriva-app/actions/runs/38315992035 RAW 161745 SHA256 35563aa9f7598cd5648396247e54e988b31ad1f5afdcdcd67d807818fdc997e5
- 115032625004 e1-shell-tests success; Set up job=success, Checkout kavriva-app=success, Install exact Flutter source and verify effective SDK=success, Resolve only locked widget dependencies=success, Verify Dart format and analyze presentation=success, Run headless shell behavior and accessibility checks=success, Post Checkout kavriva-app=success, Complete job=success
