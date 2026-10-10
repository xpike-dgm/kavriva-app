---
test_id: E-DEV-118
version: 1
purpose: Kaynaklı maliyet ayrımını ve dahil olmayan giderleri karar vermeden sunmak
domain: cost-split
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, ADR-014, C1.2, F1.2.2, FL1.2.2, SCR-010, BR-063, BR-064, BR-007, CON-004, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: cost-split-presentation
tasks: [T-E1-019a]
tests: [modules/e01-app/internal/shell/test/cost_split_test.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e01-app/internal/shell/test/duration_range_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-10
depends_on: [V-E1-COST-001]
used_by: [V-E1-COST-001, P-E1-019a, T-E1-019a]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.2 F1.2.2 FL1.2.2 BR063/064 v1 REVIEW validation method"
subject_file: modules/e01-app/internal/shell/lib/cost_split.dart
subject_digest: 835603b36a9aef53dac4f0cd4d74614f18d17f0121159c9154cd54b463e69acb
result: "Yerel427 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-10
evidence_links: [vault/PROFILES/cost-split-render.md, vault/PACKS/P-E1-019a.md, vault/REGISTRY/T-E1-019a.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-117-E10-GOVERNED-PATHS-FOR-T-E1-019a.md.snapshot, modules/e01-app/internal/shell/lib/cost_split.dart, modules/e01-app/internal/shell/test/cost_split_test.dart, modules/e01-app/internal/shell/test/fixtures/cost_split_reading_questions.json, modules/e01-app/internal/shell/lib/guide_discovery.dart]
---

# Kaynaklı maliyet ayrımı — sınırlı SCR010 sunumu

Planfa914f013fdcd032faed876689092da245989459, T-E1-019a/BR063064/C1.2/F1.2.2/FL1.2.2 REVIEW doğrulama yöntemi. T018 gerçekDONE/PR119 normalmerge BASEb9cb56529fece0b84e2901294a79b4d0de3e5f7a; fetched tree=FINAL ve ana8 doğrulandı. Gerçek106 sınırlıDONE/100kalan/206; bu aday sayımı ilerletmez. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## Kaynak ve ürün sınırı

Approved SCREEN_COVERAGE_TRACEABILITY BR063064→010011. Maliyet mevcut SCR010 rehber kapsamı içinde isteğe bağlı salt bilgi altbölümüdür; D02 scope/bilgi/fit/trust ve DP01/02/06/13/14 hiyerarşisi korunur. Ayrı SCR-TBD onaysız/HELD, fiyat feed/üreticisi HELD. Yeni ekran/route/tab/modal/picker/catalog/token/ikon yok. E1 renders/E3serves/E5authorizes; bu görev kaynağı doğrulamaz, ödeme başlatmaz, maliyet hesaplamaz ve bakım izni vermez. current/confirmed boolları çağıran sunum beyanıdır; üretim otoritesi değildir.

CostSplitSource aynı motosiklet/rehber/contextRevision/docRevision ve çağıranın DurationExperience id/revision/label bağlamındadır. Scope eksik/eski/busy/error; offline veya yanlış/eski/onaysız kaynakta tutarlar ve kaynağın hariç/varsayım/tarih bilgisi gizlenir. Kaynaklı ready durumunda dört kalem Parça/Sarf malzemesi/Alet/İşçilik ayrı görünür. Eksik kalem null ve bilinmiyor; yalnız açık kaynak sıfırı sıfırdır. Kaynak tamsayı alt/üst minor tutarlar negatif/ters olamaz; nokta veya aralık yalnız kaynaktan gelir. Para birimi ve0..6ondalık hassasiyet çağıranın girdisidir; string biçimleme ile korunur, float/kur çevrimi/toplamlama/tahmin hesabı yok. Yeni fiyat hassasiyeti/para standardı otoritesi verilmez; üretim payload doğrulaması ayrı kaynaktır.

Fiyat/kontrol tarihi gerçek YYYY-MM-DD takvim günü ve fiyat tarihi<=kontrol tarihi; kaynağın adı/sürümü/docrev/birim boş olamaz. Bugün damgası eklenmez. Kalem haritası/hariçler/varsayımlar kopyalanır ve değiştirilemez; dış çağıranın sonradan mutasyonu kabul edilmiş görüntüyü değiştirmez. Loading/failed/held/unknown/ready-without-amounts tahmin veya tamamlanmaya dönüştürülmez. Eksik hariçler tüm giderler dahil olmaz; açık boş hariç listesi de kapsama garantisi değildir. Kaynak varsayımları varsa aynen görünür, eksikse bilinmiyor; T019b ayrıntılı varsayım/no-fabrication kabulü ayrı görevdir. BR064 kısıtı şimdiden uygulanır, T019b DONE iddiası yok.

Fixture tutarları açık örnek etiketiyle gösterilir. Kesin fiyat/toplam/ödeme sözü/uygunluk/hazırlık/fiziksel izin yok; okumak hesap gerektirmez. GuideScopePreview yalnız opsiyonel cost/import ekler; duration/null varsayılanı ve mevcut fit/preparation koşulları değişmez. Kaynaklı süre maliyet yokluğunu doldurmaz; maliyet süre/fit kanıtı olmaz. Yeni test mevcut değişmemiş duration_range_test yardımcı harness'ını yeniden kullanır; eski main çağrılmaz, eski415 test gerçekten çalışır, çift sayılmaz.

## Gerçek yerel doğrulama

Koddan önced055111f582e459ef049666940e6378fce5dadc1 tam15/sabit20 ve97BASELFpin sabitlendi. Target-r1 12PASS. Full normal427=415korunan+12yeni PASS;44format0/analyze0. Ayrı native1PASS normal427 toplamına eklenmez.22durum×320390768×scale1/2/3=198 gerçek tamkaydırma; sonTopluluk hit/fatalpointer/52/shell5. Validfit yalnız mevcut gerçek kanıt fixture'ından, güncel ve eksik maliyet için TabEnterSpace/2pxmavi focus/contrast>=3/text>=4.5 gerçek widget ve dörtcontextcallback doğrulandı; maliyet tekbaşına hazırlık alanı açamaz.

Native 65PNG/34benzersiz/31byteeşalias,22durum390×844 tamkaydırma. RAW boyut/SHA/IHDR/offset-end/bayt alias eşliği doğrulandı. Root gerçek görsel açma ve geçmişsiz ilk ekran okuması henüz kaydedilmedi. Bu yerel test bağımsız kabul değildir; bütün SOURCE/aynıCI-T3/FINAL6freshreviewCI/normalmerge/main8 henüz gerekir.

## Yedi tasarım karşılaştırması ve kapanış

Tam ekran: rehber/motor/kapsam/opsiyonel süre/maliyet/fit/shell5; crop-only değil. Komşu: null cost varsayılanı ve süre birlikte, mevcut hiyerarşi ve doğal default karşılaştırması henüz bağımsız okunmadı. Durum:22pozitif/partial/unknown/loading/error/held/missing/offline/stale/long/default. Duyarlı:198 tamkaydırma. Erişilebilirlik: header/liveRegion, mevcut fit gerçek klavye/focus/kontrast/52. Kanonik: approved D02/SCR010 ve mevcut20başlık16metin20pad8gap, workingDNA nonfinaltoken. Regresyon:415korunan/97BASEpin/tam15/RAWv84/index110repro bekleniyor. D02 orijinal RAW941×1672 SHAde9487dbcd342f9c29dfb890560ada92efa6a178193cbc8daf26531552836f2c önceki görevde Root gerçekten açtı; yeni alanla karşılaştırma henüz gerekir.

V-E10-CLOSE001 templates/CLOSURE_MATRIX_TEMPLATE.md10katman task ≠feature/flow/designfinal/production/release. E3R1 REVIEW/E5IN_PROGRESS/PR47/57/59/RET97/kimlik/fiyatfeed/router/physical/human/device/OSassistive/finaltokens/window/release HELD; ayrı genel devir template eksikse MISSING. Ortak körnokta eski kalem/hariç liste bütünlüğü veya price==permission karışması, ayrı incelemede denetlenir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## RAW makbuzlar

RAWv84snapshot SHA256 ee4c0a8efc8e28b6c5a5df1f31870df4e5f559ba76f7f2919224655535871832.

modules/e01-app/internal/shell/lib/cost_split.dart LF SHA256 835603b36a9aef53dac4f0cd4d74614f18d17f0121159c9154cd54b463e69acb.

modules/e01-app/internal/shell/test/cost_split_test.dart LF SHA256 1fb0aab5aac0617b453549425c5a4e26aa17ad02f4099f5cd0baf0942e3b762c.

modules/e01-app/internal/shell/test/fixtures/cost_split_reading_questions.json LF SHA256 5b186110b2900a00a15a94a2f3c8c9a264fedfe94998a4e6c973b677078b5e67.

modules/e01-app/internal/shell/lib/guide_discovery.dart LF SHA256 a0bea6b3f27af4bfe36e7b910a04bb5075c26eb518516351067ac1ae2c2a5f5b.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\target-r1.log RAW 1708 SHA256 36744ae99a004d70e2428642000f2f5ae3dfc23f0e6aa137eba9a9a040a88cd3.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\full-r1.log RAW 99833 SHA256 785d933b9052cbe69e4b8c3d797a2457cb0066c0fbcc3b8f5b1dd46b5ef5be16.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\format-r1.log RAW 49 SHA256 be33382491d4feec6ab79ffbdce2a6265b1cd32b105b960e370bffca684bfdce.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\analyze-r1.log RAW 98 SHA256 f2d26002ff683ea04a23fe20305d5aca4b6e8cba0c89927a6e0a81338de78ebd.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\native-r1.log RAW 514 SHA256 8538e5ab83b986e400081384d2a38bb2fc5321e5cdc50fd7643930da375a83c8.

C:\Users\Xpike\.codex\task-state\kavriva-e1019a\native-r1-manifest.txt RAW 6633 SHA256 718b7dc80a2bd32df29b2888e9e450186740db1b55ecce647891a34e67239e78.

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|ready|0|0.0/756.0|76489|9a47e8bbff4f0008163a5db620cf0c9a2d77b25c07874083b5db92c9eac21b61|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-ready-0.png|
|ready|1|600.0/756.0|72481|05c4c97cd4ab491e5aff24eb1b1e5b6fe73e2ceeca2f625bff5622588e0e27c4|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-ready-1.png|
|ready|2|756.0/756.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-ready-2.png|
|partial|0|0.0/813.0|76219|ac545ea0c0a2a89f525b65f03deac15fe241815f3c5493aa987ce452282c57b1|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-partial-0.png|
|partial|1|600.0/813.0|73872|0f7a28f75cb62bbea8ec258b6fae2821a8057c6f6b67db0ca2066fef42c4cc0b|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-partial-1.png|
|partial|2|813.0/813.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-partial-2.png|
|unknown|0|0.0/832.0|75732|c8c57cf38e16bba379d79b254416170873f5b5434fb6d9638565f49567735feb|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unknown-0.png|
|unknown|1|600.0/832.0|73682|a16c33253e30613a5694bebe3df255a16a16e3d14b99bfa545e94554ed608aa9|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unknown-1.png|
|unknown|2|832.0/832.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unknown-2.png|
|loading|0|0.0/832.0|75979|529afa1dce733b40304c68809c652b7fcdb6c068f0696649146c497bba61c910|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-loading-0.png|
|loading|1|600.0/832.0|73682|a16c33253e30613a5694bebe3df255a16a16e3d14b99bfa545e94554ed608aa9|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-loading-1.png|
|loading|2|832.0/832.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-loading-2.png|
|failed|0|0.0/832.0|77183|542307ed8bf3df4b2a04a0dbcf7274501f20fd82892980371c98ca4fdacf0a24|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-failed-0.png|
|failed|1|600.0/832.0|73682|a16c33253e30613a5694bebe3df255a16a16e3d14b99bfa545e94554ed608aa9|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-failed-1.png|
|failed|2|832.0/832.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-failed-2.png|
|held|0|0.0/832.0|77528|d875e8fef351db245037a590a91f54aaa64d3fde53780fc5b09fd88df5418d7a|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-held-0.png|
|held|1|600.0/832.0|73682|a16c33253e30613a5694bebe3df255a16a16e3d14b99bfa545e94554ed608aa9|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-held-1.png|
|held|2|832.0/832.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-held-2.png|
|missing-source|0|0.0/729.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-source-0.png|
|missing-source|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-source-1.png|
|missing-source|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-source-2.png|
|missing-experience|0|0.0/710.0|79516|90be207540ebc68204e37901f31eace8581ce30d3b9fbafdb04f7dacd9c6df27|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-experience-0.png|
|missing-experience|1|600.0/710.0|69229|9cf5efbd4d2ae015fa1b77bf66762d69c6df043d4028aca2ab711a7b166c81a8|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-experience-1.png|
|missing-experience|2|710.0/710.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-experience-2.png|
|missing-exclusions|0|0.0/756.0|76644|780e1a732cf3586782e07c681c229e4c673cf7fb6a24148547fb7262ed859a55|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-exclusions-0.png|
|missing-exclusions|1|600.0/756.0|73159|f29f1637fe3cb37643362e9809ec273a426ce434b137f6d343f224a95f7070df|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-exclusions-1.png|
|missing-exclusions|2|756.0/756.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-exclusions-2.png|
|empty-exclusions|0|0.0/756.0|77770|075911f79e972f3f0e500f0cf56c987c2fdfe238d54da1c24b54bfd1961a6513|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-empty-exclusions-0.png|
|empty-exclusions|1|600.0/756.0|73861|2d08e5f661d9f454f244ddfd7262e7e3dce3830f1ecb5f69a160e167219ad3bd|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-empty-exclusions-1.png|
|empty-exclusions|2|756.0/756.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-empty-exclusions-2.png|
|missing-assumptions|0|0.0/756.0|77085|cc2b5a3356ef7cd7499becc10282e4b2057909e92d2065831e7d5a0be8ef9926|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-assumptions-0.png|
|missing-assumptions|1|600.0/756.0|73064|2c3f01684c3014b66aaf209ef5faedabb03de0e5a86bcc92b09726eb345c7525|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-assumptions-1.png|
|missing-assumptions|2|756.0/756.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-assumptions-2.png|
|stale|0|0.0/729.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-0.png|
|stale|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-1.png|
|stale|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-2.png|
|unconfirmed|0|0.0/729.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unconfirmed-0.png|
|unconfirmed|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unconfirmed-1.png|
|unconfirmed|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-unconfirmed-2.png|
|offline|0|0.0/756.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-offline-0.png|
|offline|1|600.0/756.0|71552|61efdb26594a140a86d69e8d2ed5631a92953c5c0e920a95eb3a29d34805cbc4|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-offline-1.png|
|offline|2|756.0/756.0|65724|71bbb1a6f98204bea5c651c87f829593869d9b0d4b99a5f73b2ae6b7a10f9b47|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-offline-2.png|
|wrong-motorcycle|0|0.0/729.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-wrong-motorcycle-0.png|
|wrong-motorcycle|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-wrong-motorcycle-1.png|
|wrong-motorcycle|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-wrong-motorcycle-2.png|
|new-document|0|0.0/729.0|77230|674e6e58e1907cf1bcefc97dc452039db8e07fee611c2a9d2c23e729421390ac|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-document-0.png|
|new-document|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-document-1.png|
|new-document|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-document-2.png|
|new-experience|0|0.0/729.0|77393|7fbd86c8f323e838937c90e1b5617ce2db637dbc5796db4d19d9cb3f535d3df1|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-experience-0.png|
|new-experience|1|600.0/729.0|70403|f95fa3a0ac177f71b5756129e1ddac0ccce539b2b769d8dd3489b0d636d7b494|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-experience-1.png|
|new-experience|2|729.0/729.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-new-experience-2.png|
|stale-scope|0|0.0/775.0|77905|4009869615b2ca718a6134436e9f5ac8d13481d820033d83b535bdb130aea8b5|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-scope-0.png|
|stale-scope|1|600.0/775.0|71610|c83448a3779168a3bcbba723834f93607a913ef432923e6c35751e5d842f812e|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-scope-1.png|
|stale-scope|2|775.0/775.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-stale-scope-2.png|
|missing-scope|0|0.0/657.0|82084|8123c7c9fffd314c7da3666ace58d57e28950c1914c7e60c8320639e5703c6d3|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-scope-0.png|
|missing-scope|1|600.0/657.0|70867|7b07e59fc3c1a7052e9cc36a1802405b3bb20e66bfacff6871fd45118885d40c|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-scope-1.png|
|missing-scope|2|657.0/657.0|65833|d06041164e746ce6dd33e77c7fff2caf29baa3af9273127cd798e08294ad49da|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-missing-scope-2.png|
|long-context|0|0.0/851.0|77879|47c37600df1393baf60bb26d9481fad52f9ae9705351294ad96a34bc564ef103|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-long-context-0.png|
|long-context|1|600.0/851.0|79101|ccb0950cb0463d38ea07537c3a344cc06f36dd39c3bcdf4daf5bc743d1f7ddf3|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-long-context-1.png|
|long-context|2|851.0/851.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-long-context-2.png|
|with-duration|0|0.0/1094.0|78286|afa4f93ebb5bc640cf13b931416cf3108b543fa415bf9c9d51a51286d0505529|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-with-duration-0.png|
|with-duration|1|600.0/1094.0|76336|7bea3f7443836c1b59fc7d03c44ac99f982abd7ec0ecc2b4895b25c3a03e1c40|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-with-duration-1.png|
|with-duration|2|1094.0/1094.0|66443|5132734c63c5affffcf6e350152d1f4a49e3cf77f7f777424398ed5b9c7d52d0|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-with-duration-2.png|
|previous-default|0|0.0/491.0|75610|600396a4bf0489695b54637d1c5354da127215029d5c0a0af9bb16e77aa78cf5|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-previous-default-0.png|
|previous-default|1|491.0/491.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1019a/native-r1-previous-default-1.png|

## Gerçek Root görsel okuması

Root approved D02 orijinalini ve34farklı doğal Flutter PNG orijinalini gerçekten açtı. Diğer31alias tamRAW boyut/SHA/bayt eşliğiyle kapsandı, ayrı ekran açımı sayılmadı. 65parça22durum/fullscroll;198responsive/427normal PASS. Dört kaynaklı kalem ve kaynak sıfırı ayrı; partial bilinmiyor, unknown/loading/error/held/offline/stale kaynak kapalı. Hariçler null/boş/uzun koşulları görünür, tüm giderler dahil garantisi yok. Süre+maliyet birlikte ve nullcost önceki süre alanı yan yana hiyerarşi karşılaştırıldı; aynı çalışma typography/shell korunur. D02 daha yüksek görsel sadakatli referanstır; bu mevcut görevin semantik kaynak karşılaştırmasıdır, finaltoken/pixel-eşlik/üretim/insan/cihaz/release kabulü değildir. Sabit20 bağımsız ilk okuma ve bütün inceleme henüz gerekir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.

## Gerçek indeks sayımı düzeltmesi

Kod öncesi d055111 kaydındaki113satır beklentisi yanlıştı: registry yalnız görev satırlarını içeriyor, dört yeni kayıt türünün tümünü satır saymıyor. Gerçek build-index110satır üretti (önceki109 + T019a). Önceki tahmin özgün precode Git geçmişinde korunur; güncel113iddiası geri çekilir ve110kullanılır. Ürün kapsamı/tam15/sabit20/97BASEpin değişmez. İlk graph-r1 gerçek12kontrol42test/worst0, indeks üretimi ve routing başarıyla koştu; bu testin eski113öngörüsünü doğruladığı iddia edilmez. Gerçek106DONE100kalan206; bağımsız ilk okuma/bütün inceleme/exactCI henüz gerekir. `vault/PACKS/P-E1-019a.md`; `vault/EVIDENCE/E-DEV-118.md`.
