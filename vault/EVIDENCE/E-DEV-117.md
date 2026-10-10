---
test_id: E-DEV-117
version: 1
purpose: Kaynaklı deneyime bağlı süre aralığını ve tarihini karar vermeden sunmak
domain: duration-range
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, ADR-008, ADR-014, C1.2, F1.2.2, FL1.2.2, SCR-010, BR-063, BR-064, BR-007, CON-004, R-001, R-003, R-004, R-007, R-009, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: duration-range-presentation
tasks: [T-E1-018]
tests: [modules/e01-app/internal/shell/test/duration_range_test.dart, modules/e01-app/internal/shell/test/guide_discovery_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-10
depends_on: [V-E1-RANGE-001]
used_by: [V-E1-RANGE-001, P-E1-018, T-E1-018]
evidence: []
supersedes: []
status: RECORDED

contract_id_version: "C1.2 F1.2.2 FL1.2.2 BR063/064 v1 REVIEW validation method"
subject_file: modules/e01-app/internal/shell/lib/duration_range.dart
subject_digest: abed66a606d4a1d76e1de0b2914193994bd43b74f691ce7bc7ae29ba0bf8adad
result: "Yerel415 PASS; bağımsız REVIEW bekleniyor"
gate_verdict: "RECORDED yerel test; bağımsız REVIEW ve üretim HELD"
reviewer: none
timestamp: 2026-10-10
evidence_links: [vault/PROFILES/duration-range-render.md, vault/PACKS/P-E1-018.md, vault/REGISTRY/T-E1-018.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-116-E10-GOVERNED-PATHS-FOR-T-E1-018.md.snapshot, modules/e01-app/internal/shell/lib/duration_range.dart, modules/e01-app/internal/shell/test/duration_range_test.dart, modules/e01-app/internal/shell/test/fixtures/duration_range_reading_questions.json, modules/e01-app/internal/shell/lib/guide_discovery.dart, vault/EVIDENCE/SNAPSHOTS/E-DEV-101-GUIDE-DISCOVERY-FOR-T-E1-018.dart.snapshot, vault/EVIDENCE/E-DEV-101.md]
---

# Kaynaklı süre aralığı — sınırlı SCR010 sunumu

Planfa914f013fdcd032faed876689092da245989459, T-E1-018/BR063064/C1.2/F1.2.2/FL1.2.2 REVIEW doğrulama yöntemi. T005a gerçekDONE. BASEcbfc954d09f808ee8e43369312843144befc5d3e, PR118 normalmerge ve ana8/tree doğrulandı; gerçek105 sınırlıDONE/101kalan/206. Bu aday sayımı ilerletmez.

## Kaynak ve sınır

Süre, rehber kapsamındaki salt bilgi altbölümüdür. Approved SCREEN_COVERAGE_TRACEABILITY BR063064→010011; SCR010/D02 bilgi/fit/trust hiyerarşisi ve DP01/02/06/13/14. Yeni ekran/route/tab/modal/catalog/picker/icon veya genel tasarım dili yok; FL1.2.2 SCR-TBD ayrı ekran önerisi onaysız/HELD kalır. Gerçek D02 RAW941×1672 SHAde9487dbcd342f9c29dfb890560ada92efa6a178193cbc8daf26531552836f2c Root açtı; eski referans deposu dışındadır, kalıcı task-state RAW kopyası aynıdır. Tahmin üreticisi/kaynak feed HELD; E1 kaynağı doğrulamaz veya süre hesaplamaz. bool current/confirmed çağıran beyanı, üretim otoritesi değil.

DurationExperience çağıranın beyanıdır; kimlik/revizyon/etiket dolu ve karakterleri kayıpsızdır. Motosiklet/rehber/contextRevision, belge revizyonu, deneyim id/rev/label aynı değilse eski aralık/tarih/kaynak görünmez. Scope eksik/eski/busy/error veya offline/currentfalse/confirmedfalse da aralığı kapatır. Kaynaklı pozitif alt<üst dakika dışında point/sıfır/negatif/ters değer oluşturulamaz; gerçek takvim günü ve informationDate<=checkedDate gereklidir. Kaynak/name/version/documentRevision boş olamaz. E1 başka deneyim için sayı üretmez, tahmini süreyi azaltmaz veya tarihe bugün damgası vurmaz.

Ready yalnız dolu aralığı gösterir. Null aralık/unknown bilinmiyor; loading/failed/held ayrı anlaşılır durumdur, hazır aralık veya tamamlanma olmaz. Uygun kaynak durumu varsa bilgi tarihi/sürüm/kontrol tarihi görünür; uydurma kaynak yok. Fixture değerleri açık örnek etiketi taşır. Kesin bitiş sözü/başarı/fit/hazırlık/fiziksel izin yok; deneyim güvenlik kontrollerini kaldırmaz, hesap gerekmez. Maliyet ayrımı/istisna/varsayımlar ayrı T019a/b; bu görevde rakam uydurulmaz.

GuideScopePreview yalnız opsiyonel duration/import ekler; null halinde eski görünüm/fit/callback davranışı değişmez. ConfirmedFit ve mevcut current-evidence kaynaklı preparation talebi süre bilinmiyor olsa da korunur; süreye dayanarak uygunluk/hazırlık açılmaz. Komşu405 test/shell/variant/SDK/YAML/publiccontract/router/identity/DB/provider değişmez. E1 renders/E3serves/E5authorizes sınırları korunur.

## Gerçek yerel doğrulama

Koddan önce35272df4721ae800253b8dbd249229183fc26019 tam15/sabit20 ve88BASELFpin sabitlendi. İlk target-r1 8PASS1FAIL: test route builder eski content closure tuttu; gerçek parent güncellemelerini takip eden mevcut test yaklaşımı Inherited input ile düzeltildi, beklenen stale gizleme zayıflatılmadı. target-r2 9PASS; sonra gerçek klavye/odak/fit ayrımı ve fatal son sekme tap eklendi. target-r3 9PASS1FAIL: görünüm dışındaki klavye hedefi görünür yapılmadan odak karşılaştırılmıştı; ensureVisible sonra aynı Tab/Enter/Space ve mavi2border/contrast şartları keyboard-r1 1PASS. Güncel normalfull 415=405korunan+10yeni PASS;42format0/analyze0. Özgün başarısız loglar korunur. Ayrı native1PASS normal415 sayımına eklenmez.19durum×320390768×scale1/2/3=171 gerçek tam kaydırma, sonToplulukhit/fatalpointer/52kontroller/shell5; en az bir enabled fit yolunda gerçek klavye mevcut callback ve doğrucontext doğrulandı. Salt bilgi yeni focusable control üretmez.

Native 38 PNG/18 unique/20 ham eş alias;19durum390×844 tam kaydırma. Tam RAW boyut/SHA/dim/offset-end/bayt eşliği doğrulandı; gerçek Root görsel açma ve bağımsız ilk okuma henüz kaydedilmedi. Görsel karşılaştırma/ilkokuma/whole review ve exactSOURCECI-T3/FINAL6reviewCI/normalmerge-main8 henüz gerekir; bu yerel kanıt bağımsız PASS değildir.

## Yedi tasarım karşılaştırması ve kapanış sınırı

Tam ekran: rehber/motosiklet/kapsam/salt süre/fit sırası ve son5nav, crop-only değil. Komşu: null default ve korunan GuideScope/MotorcycleFitView, aynı E1 ölçü/type/renk; doğal default-case karşılaştırması ileride kaydedilir. Durum:19kaynak/deneyim/held/error/offline/long/default; unknown kayıp olarak saklanmaz. Duyarlı:171tamkaydırma ve gerçek son hedef. Erişilebilirlik: başlık/liveRegion/mevcutfitTabEnterSpace/mavi2pxfocus/gerçekçizilenmetin4.5focus3/52. Kanonik: D02/SCR010/BR063 ve mevcut sade20başlık/16metin/20pad/8space; workingDNA nonfinaltoken. Regresyon:405korunan test,88BASEpin/izinli15/indexrepro/RAWv83. Hükümler yalnız çalışılan bağlam; gerçek insan/cihaz/OSassistive/fonttoken/window/release kanıtı değildir.

V-E10-CLOSE001 v1 templates/CLOSURE_MATRIX_TEMPLATE.md 10katman: task ≠feature/flow/designfinal/production/release. E3R1 REVIEW/E5IN_PROGRESS/PR47/57/59/RET97/productionAuth/feed/router/physical/device/releaseHELD. Genel dış devir template kaynağı eksikse ayrıhandoff MISSING; bu iş sınırlı PRkanıtıdır. Sharedblindspot stale deneyim/rehber kaynağı veya estimate==permission karışması bağımsız incelemede karşılaştırılmalıdır.

## RAW makbuzlar

RAWv83snapshot SHA256 7bb52c3dbc53bc4d8e160f87f09dc92ab63f94f7884423aebca5055e8a12e165.

modules/e01-app/internal/shell/lib/duration_range.dart LF SHA256 abed66a606d4a1d76e1de0b2914193994bd43b74f691ce7bc7ae29ba0bf8adad.

modules/e01-app/internal/shell/test/duration_range_test.dart LF SHA256 1d5a37cb6a5bc6705d2bbfa24fd4342604cb34c686365474746d6c01f2cc6c8c.

modules/e01-app/internal/shell/test/fixtures/duration_range_reading_questions.json LF SHA256 7fa4638f7bc44aed4220adbf14baa85809cacd702e525dc7cf63bab2215fcf81.

modules/e01-app/internal/shell/lib/guide_discovery.dart LF SHA256 48f978d516e2ba17ee59b045ee603c11b141eb8c3c5b1cf541cb365e9c33aa3c.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\target-r1.log RAW 3378 SHA256 6ec69866ceccc8f6d900813b5c52f89cce442503fc79e923d626e54fdc30ebc8.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\target-r2.log RAW 1055 SHA256 ec433b943dd3e1ff4f2c109200d5327a7bef44401dfd86d6e92f7bc91da0eb1b.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\target-r3.log RAW 3390 SHA256 33cf9a163fa947ead8573e280c3f5d4e96e212eb2539cde3b1e852707d064166.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\keyboard-r1.log RAW 310 SHA256 3fc489790473c544af1e6873cdfc1cd2fbe543518fbc665377979037eb8c204a.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\full-r1.log RAW 93869 SHA256 82b031452cadc651d4363363e379a85b807f901fafbb89a21638c6f95fbcbb09.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\format-r1.log RAW 49 SHA256 08c0f3cbf3b8217e5d8b733d0e62f082d6987b02c6b6ac71afb0e1c5c996afde.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\analyze-r1.log RAW 98 SHA256 613444afe0ee55b22782bd1c9b56396bb73d80fc5e10fca45615ebeff5d54ba6.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\native-r1.log RAW 231 SHA256 441593d4b80e1ab5895de80eb2bf4d005440fe82345fc6cadc74ef92f4912448.

C:\Users\Xpike\.codex\task-state\kavriva-e1018\native-r1-manifest.txt RAW 3771 SHA256 7303f4aa9ab8e80cc5e00a3d22f09d76ee7046ebba9897e3593535c9f9f50bfb.

|durum|parça|offset/end|bayt|SHA256|RAWdosya|
|---|---|---|---|---|---|
|beginner|0|0.0/491.0|75610|600396a4bf0489695b54637d1c5354da127215029d5c0a0af9bb16e77aa78cf5|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-beginner-0.png|
|beginner|1|491.0/491.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-beginner-1.png|
|familiar|0|0.0/491.0|75771|a5fa1b84970b03d97e870edcd18c546998c256a875606c2d8f473c29a8de2a02|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-familiar-0.png|
|familiar|1|491.0/491.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-familiar-1.png|
|unknown|0|0.0/510.0|75783|ae22b74f85c51bceec48687480be2c2ce7bd15467e9a06cd104a89bd0cda60cf|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-unknown-0.png|
|unknown|1|510.0/510.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-unknown-1.png|
|loading|0|0.0/510.0|75566|4e2e2ff4a9d57e4de0d87d6753fc87eda49165d66dcc219ff168b55c8fe28206|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-loading-0.png|
|loading|1|510.0/510.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-loading-1.png|
|failed|0|0.0/510.0|76590|6bdb1a70403de10e728bcd88df9da0d4f27c5cf3107a641d0dc40f13ecb48c64|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-failed-0.png|
|failed|1|510.0/510.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-failed-1.png|
|held|0|0.0/510.0|77156|a59315c434a7d28728c8cd469df5307cdea1c0a3f45f38f87d10df9e4381d331|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-held-0.png|
|held|1|510.0/510.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-held-1.png|
|missing-source|0|0.0/426.0|75977|89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-source-0.png|
|missing-source|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-source-1.png|
|missing-experience|0|0.0/407.0|77591|26ae16e7b47d55a97a27510271bee0c013262a94a6a83d4c2316ac9dc00d5036|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-experience-0.png|
|missing-experience|1|407.0/407.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-experience-1.png|
|stale|0|0.0/426.0|75977|89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-stale-0.png|
|stale|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-stale-1.png|
|unconfirmed|0|0.0/426.0|75977|89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-unconfirmed-0.png|
|unconfirmed|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-unconfirmed-1.png|
|offline|0|0.0/472.0|75974|43415b8f000ad5c1feb7e4567a7949f0e05f00569ffba8204e9aa24cbc7c0009|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-offline-0.png|
|offline|1|472.0/472.0|66466|fc8b9bfd85b5b4aaa86ded33af11cbb08a7d3f5fc41daaa65a87ed91e6b85771|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-offline-1.png|
|wrong-motorcycle|0|0.0/426.0|75977|89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-wrong-motorcycle-0.png|
|wrong-motorcycle|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-wrong-motorcycle-1.png|
|new-document|0|0.0/426.0|75977|89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-new-document-0.png|
|new-document|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-new-document-1.png|
|new-experience|0|0.0/426.0|76141|44884a91b4d5be67ed9625b5f80b5a858d320191e3ba6f925cb752c3b7d5634b|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-new-experience-0.png|
|new-experience|1|426.0/426.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-new-experience-1.png|
|missing-range|0|0.0/510.0|75783|ae22b74f85c51bceec48687480be2c2ce7bd15467e9a06cd104a89bd0cda60cf|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-range-0.png|
|missing-range|1|510.0/510.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-range-1.png|
|stale-scope|0|0.0/472.0|76410|77f1fe7157e150e291b6ed517dc6602eae7e6a67141e01fe6f71800e8b4ea6d5|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-stale-scope-0.png|
|stale-scope|1|472.0/472.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-stale-scope-1.png|
|missing-scope|0|0.0/354.0|78669|ec8b7c26dbeca146ade814e62201e15c4cba38c1436b0110152741b7cb8e4d34|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-scope-0.png|
|missing-scope|1|354.0/354.0|67127|f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-missing-scope-1.png|
|long-context|0|0.0/529.0|78325|bcb2214fc8104413d917a7aba2714ad2c6475cdd223ca0fb2cfedc85a1613e6a|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-long-context-0.png|
|long-context|1|529.0/529.0|67531|c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-long-context-1.png|
|previous-default|0|0.0/153.0|67762|551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-previous-default-0.png|
|previous-default|1|153.0/153.0|63384|644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b|C:/Users/Xpike/.codex/task-state/kavriva-e1018/native-r1-previous-default-1.png|

## Güncel gerçek görsel okuma ve kaynak düzeltmesi

Root 18 farklı doğal Flutter PNG orijinalini gerçekten açtı; diğer20alias tamRAW byte/SHAeşliğiyle doğrulandı, ayrı ekran açılmış gibi sayılmadı. Bütün19durum38parça/fullscroll; 171duyarlı ve415normal PASS. Beginner40–80 ve familiar20–45 kaynaklıörnek/tarih/deneyim, missing/unknown/offline/held durumları; D02 referans ile rehber-context/scope/trust ve hazırlıktan önce bilgi ayrımı korunur. Previous-default üst/alt mevcut alanın kapalı halinde eski sade widget hiyerarşisini gösterir; eski gerçek görüntü kayıpsız eşlik iddiası yoktur. Üretim/insan/cihaz/releaseHELD. Exact17 controlled scope; önceki graph-r1FAIL ve eski EDEV101 kabulü korunur. Eski kaynak RAWbyte-eş snapshot `vault/EVIDENCE/SNAPSHOTS/E-DEV-101-GUIDE-DISCOVERY-FOR-T-E1-018.dart.snapshot`, eski kabul `vault/EVIDENCE/E-DEV-101.md`; yeni aday `vault/EVIDENCE/E-DEV-117.md` ve `vault/PACKS/P-E1-018.md`. Bağımsız ilkokuma/whole henüz gerekir.

## Güncel yerel mimari onarım kanıtı

Graph-r2 bütün12kontrol ve42test PASS/worst0; eski graph-r1 FAIL tarihçesi korunur. RAW7960bayt/SHA256 0e1ef3a273d3a58c638d13b43db6424b9b102d7b17009cfcc1f37d43714a5ac9. Eski EDEV101 subject payload gerçek BASE RAWsnapshot ile korundu; yeni kod eski PASS ile kabul edilmedi. Tam17adres bağımsız ilkokuma/whole ve gerçekCI-T3 henüz beklenir; yerel415/42formatzero/analyze0/native1/19durum171fullscroll/38PNG18unique20alias. Gerçek105/101/206 ve üretimHELD. `vault/EVIDENCE/E-DEV-117.md`; `vault/PACKS/P-E1-018.md`.

## Bağımsız ilk ekran okuması — SOURCE adayı

Geçmişsiz `/root/e1018_blind_reading`, sahibin istediği gpt-6-luna/max, yalnız sabit20soru ve doğal38PNG/19durum ham makbuzu. Kod/plan/pack/cevapanahtarı verilmedi. Özgün rapor Root tarafından tümüyle okundu; 20 anlam için sınırlı PASS, gerçek insan/cihaz/ürün kabulü değildir. Kod0ea177804bc82eed8ed00831fd0d1339b1abfb67. RAW11887bayt/SHA256 133931e3cc484c9c2e0b26365a61dabaf9c9dbf55019cd599753218f71e9d712. Bütün görev incelemesi, aynıSOURCECI-T3/FINAL6freshreviewCI/normalmerge-main8 bekleniyor. Gerçek105/101/206 değişmedi; üretim ve ayrıSCR-TBD HELD. `vault/EVIDENCE/E-DEV-117.md`; `vault/PACKS/P-E1-018.md`.

### Özgün bağımsız ilk okuma raporu

<pre># T-E1-018 — Kör ilk okuma raporu

## Kapsam ve yöntem

Yalnız izinli girdileri kullandım: `native-r1-proof.json`, `native-r1-manifest.txt`, bu manifestin işaret ettiği 38 gerçek PNG ve sabit 20 soruluk `duration_range_reading_questions.json`. Kod, plan, başka rapor veya cevap anahtarı okunmadı. Ekranları, teknik görev adlarının ve metaverinin ne anlama geldiğini önceden bilmiyormuşum gibi yorumladım.

Manifestteki 38 satır 19 durumun ikişer kaydırma parçası. İçerik baytlarıyla doğrulanmış 18 farklı PNG&#x27;yi `view_image` ile açtım. Aynı baytlı yolları ayrı birer ekran diye saymadım; aşağıda alias gruplarını ve açtığım dosyaları listeliyorum. Her durumun iki kaydırma parçasının metnini, aynı baytlı temsili üzerinden birlikte okudum.

## Dosya bütünlüğü

Manifestte 38 satır, proof dosyasında 38 satır var; durum, yol, parça sırası ve kaydırma aralığı eşleşiyor. Her PNG için gerçek dosya uzunluğunu, SHA-256&#x27;yı ve PNG IHDR boyutunu yeniden hesapladım. 38 dosyanın tamamı proof/manifest ile eşleşti: fark yok. Tüm boyutlar 390×844 piksel. Aynı SHA gruplarında baytların kendisini de karşılaştırdım: 18 ayrı içerik, 20 alias, bayt karşılaştırma hatası yok.

### Gerçekten açılan 18 özgün PNG

`C:/Users/Xpike/.codex/task-state/kavriva-e1018/` altında:

- `native-r1-beginner-0.png`
- `native-r1-beginner-1.png`
- `native-r1-familiar-0.png`
- `native-r1-unknown-0.png`
- `native-r1-loading-0.png`
- `native-r1-failed-0.png`
- `native-r1-held-0.png`
- `native-r1-missing-source-0.png`
- `native-r1-missing-source-1.png`
- `native-r1-missing-experience-0.png`
- `native-r1-offline-0.png`
- `native-r1-offline-1.png`
- `native-r1-new-experience-0.png`
- `native-r1-stale-scope-0.png`
- `native-r1-missing-scope-0.png`
- `native-r1-long-context-0.png`
- `native-r1-previous-default-0.png`
- `native-r1-previous-default-1.png`

### 38 dosyanın gerçek boyut, SHA-256 ve piksel ölçüleri

Tüm yolların ortak dizini: `C:/Users/Xpike/.codex/task-state/kavriva-e1018/`. Aşağıdaki bayt uzunluğu ve SHA-256 değerleri gerçek dosyalardan yeniden hesaplandı; her satırın boyutu 390×844&#x27;tür.

| Dosya | Bayt | SHA-256 |
|---|---:|---|
| native-r1-beginner-0.png | 75610 | 600396a4bf0489695b54637d1c5354da127215029d5c0a0af9bb16e77aa78cf5 |
| native-r1-beginner-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-familiar-0.png | 75771 | a5fa1b84970b03d97e870edcd18c546998c256a875606c2d8f473c29a8de2a02 |
| native-r1-familiar-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-unknown-0.png | 75783 | ae22b74f85c51bceec48687480be2c2ce7bd15467e9a06cd104a89bd0cda60cf |
| native-r1-unknown-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-loading-0.png | 75566 | 4e2e2ff4a9d57e4de0d87d6753fc87eda49165d66dcc219ff168b55c8fe28206 |
| native-r1-loading-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-failed-0.png | 76590 | 6bdb1a70403de10e728bcd88df9da0d4f27c5cf3107a641d0dc40f13ecb48c64 |
| native-r1-failed-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-held-0.png | 77156 | a59315c434a7d28728c8cd469df5307cdea1c0a3f45f38f87d10df9e4381d331 |
| native-r1-held-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-missing-source-0.png | 75977 | 89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e |
| native-r1-missing-source-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-missing-experience-0.png | 77591 | 26ae16e7b47d55a97a27510271bee0c013262a94a6a83d4c2316ac9dc00d5036 |
| native-r1-missing-experience-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-stale-0.png | 75977 | 89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e |
| native-r1-stale-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-unconfirmed-0.png | 75977 | 89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e |
| native-r1-unconfirmed-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-offline-0.png | 75974 | 43415b8f000ad5c1feb7e4567a7949f0e05f00569ffba8204e9aa24cbc7c0009 |
| native-r1-offline-1.png | 66466 | fc8b9bfd85b5b4aaa86ded33af11cbb08a7d3f5fc41daaa65a87ed91e6b85771 |
| native-r1-wrong-motorcycle-0.png | 75977 | 89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e |
| native-r1-wrong-motorcycle-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-new-document-0.png | 75977 | 89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e |
| native-r1-new-document-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-new-experience-0.png | 76141 | 44884a91b4d5be67ed9625b5f80b5a858d320191e3ba6f925cb752c3b7d5634b |
| native-r1-new-experience-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-missing-range-0.png | 75783 | ae22b74f85c51bceec48687480be2c2ce7bd15467e9a06cd104a89bd0cda60cf |
| native-r1-missing-range-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-stale-scope-0.png | 76410 | 77f1fe7157e150e291b6ed517dc6602eae7e6a67141e01fe6f71800e8b4ea6d5 |
| native-r1-stale-scope-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-missing-scope-0.png | 78669 | ec8b7c26dbeca146ade814e62201e15c4cba38c1436b0110152741b7cb8e4d34 |
| native-r1-missing-scope-1.png | 67127 | f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6 |
| native-r1-long-context-0.png | 78325 | bcb2214fc8104413d917a7aba2714ad2c6475cdd223ca0fb2cfedc85a1613e6a |
| native-r1-long-context-1.png | 67531 | c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c |
| native-r1-previous-default-0.png | 67762 | 551eda53320ab22cd457291b7599b8f93702b88584120700c50bbd325edaff58 |
| native-r1-previous-default-1.png | 63384 | 644e1d68c45857c5c4514e40d95c05ecc5f5dda5e0a1f3c9154b90caacd03c9b |

### Aynı RAW baytlı alias grupları

Her grupta listedeki dosyalar aynı uzunlukta, aynı SHA-256&#x27;da ve bayt bayt eşit:

- SHA `c7d6a884218bbc5f8cbce54536d76dd5b78a8c3a81e829dc1aacaefbb765ad4c`, 67.531 bayt: `native-r1-beginner-1.png`, `native-r1-familiar-1.png`, `native-r1-unknown-1.png`, `native-r1-loading-1.png`, `native-r1-failed-1.png`, `native-r1-held-1.png`, `native-r1-missing-range-1.png`, `native-r1-long-context-1.png`.
- SHA `ae22b74f85c51bceec48687480be2c2ce7bd15467e9a06cd104a89bd0cda60cf`, 75.783 bayt: `native-r1-unknown-0.png`, `native-r1-missing-range-0.png`.
- SHA `89e9e602d0da7e3cec2e00e8d0d49a40a351760f76e4a3d21061438e4ff9184e`, 75.977 bayt: `native-r1-missing-source-0.png`, `native-r1-stale-0.png`, `native-r1-unconfirmed-0.png`, `native-r1-wrong-motorcycle-0.png`, `native-r1-new-document-0.png`.
- SHA `f66c7a07ba3c578eaec661ac4687cda4d56b4f332c94a72183206b1073511fa6`, 67.127 bayt: `native-r1-missing-source-1.png`, `native-r1-missing-experience-1.png`, `native-r1-stale-1.png`, `native-r1-unconfirmed-1.png`, `native-r1-wrong-motorcycle-1.png`, `native-r1-new-document-1.png`, `native-r1-new-experience-1.png`, `native-r1-stale-scope-1.png`, `native-r1-missing-scope-1.png`.

## Sabit 20 soruya ilk okuma yanıtları

1. **Bu alanda gösterilen bilgi ne için kullanılabilir?** Planlama için yaklaşık süre bilgisi. Ekran “uygulama izni değildir” diyor.
2. **Süre tek bir kesin sayı mı, bir aralık mı?** Aralık: örneğin `beginner-0` ekranında 40–80 dakika, `familiar-0` ekranında 20–45 dakika.
3. **Gösterilen aralık hangi deneyim bilgisine aittir?** Kullanıcının kendi beyanına: örneğin ilk kez yapması veya daha önce yapmış olması. Bu bilgi aralığın hemen üstünde.
4. **Bilginin hangi tarihe ait olduğunu nereden anlarsın?** “Bilgi tarihi” satırı (örnek: 01.10.2026). “Kaynak kontrol tarihi” ayrı ve açık etiketli.
5. **Bu süre kesin bir bitiş sözü veriyor mu?** Hayır; “Kesin bitiş sözü değildir” yazıyor ve sürenin koşullara göre değişebileceği belirtiliyor.
6. **Deneyim bilgisi yoksa sana bir seviye atanmış mı?** Hayır. `missing-experience-0`: “Deneyim bilgisi yok; sana bir seviye atanmadı.”
7. **Süre kaynağı yoksa ekranda bir sayı hesaplanıyor mu?** Hayır. `unknown-0`/`missing-range-0`: deneyim için aralık olmadığı ve sürenin bilinmediği yazıyor.
8. **Eski veya başka motosiklete ait tahmin güncel bilgi olarak gösteriliyor mu?** Hayır. `missing-source-0` görünümünde sayı yok; güncel kaynak olmadığı açıkça söyleniyor.
9. **Rehber veya bağlam değişince önceki tahmin kullanılabilir mi?** Hayır. `stale-scope-0`: kapsam bilgisinin güncel olmadığı, yeniden kontrol etmeden hazırlığa geçilemeyeceği ve sürenin bilinmediği yazıyor.
10. **Deneyim bilgisi değişince önceki aralık geçerli sayılıyor mu?** Hayır. `new-experience-0`: güncel süre yok ve güncel bilgi gelmeden tahmin kullanmama uyarısı var.
11. **Çevrimdışı eski bilgiyle güncel tahmin varmış gibi davranılıyor mu?** Hayır. `offline-0`: “Eski bilgi güncel süre tahmini sayılmaz.”
12. **Bilgi yüklenirken süre hazırmış gibi gösteriliyor mu?** Hayır. `loading-0`: “Hazır bir tahmin henüz yok.”
13. **Bilgi alınamazsa bu işin tamamlandığı söyleniyor mu?** Hayır. `failed-0`: bilgi alınamadı, süre bilinmiyor, güncel kaynağın yeniden kontrol edilmesi gerektiği yazıyor.
14. **Süre aralığı motosikletin uygunluğunu kanıtlıyor mu?** Hayır. Ekran süreyi planlama bilgisi sayıyor; motosiklet uygunluğu ve hazırlığın ayrıca değerlendirileceğini söylüyor.
15. **Süreyi görmek hazırlık kontrollerini atlamana izin veriyor mu?** Hayır. Ekran, rehber görünümünün hazır olma durumu yaratmadığını ve deneyimin güvenlik kontrollerini kaldırmadığını söylüyor.
16. **Bu alan teknik uygulama adımları veya parça değiştirme önerisi veriyor mu?** Hayır. “Neleri kapsamaz?” altında fiziksel müdahale adımları olmadığı; görünümün motosiklette uygulama adımı olmadığı yazıyor.
17. **Bu bilgi için hesap açman gerekiyor mu?** Hayır. “Bu bilgiyi okumak için hesap gerekmez.”
18. **Örnek ekranın değerleri gerçek motosiklet için doğrulanmış tahmin mi?** Hayır. Örnek değerlerin gerçek motosiklet için doğrulanmış tahmin olmadığı yazıyor.
19. **Alt çubukta hangi bölümler var; ayrı bir süre sekmesi var mı?** Garaj, Bakım, AI Usta, Geçmiş, Topluluk. Ayrı süre sekmesi görünmüyor.
20. **Bir süre bilinmiyorsa ne eksik ve bu belirsizlik görünür mü?** Evet, belirsizlik açık. `missing-range-0` eksik deneyim aralığını ve bilinmeyen süreyi söylüyor; diğer koşullu ekranlarda eksik güncel kaynak veya yükleme/alınamama nedeni belirtiliyor.

## Somut bulgu ve hüküm

Bu 20 sorunun her biri, ilgili koşulun görünür ekran metninden yardım almadan cevaplanabiliyor. Süre yokken sayı gösterilmiyor; bilinmeme nedeni ve sonraki adım (“güncel bilgi gelmeden kullanma”, “yeniden kontrol et” gibi) ilgili durumlarda görünür. “Motosiklete uygunluk” ayrı gösteriliyor ve süre bilgisinin uygunluk ya da hazırlık onayı olmadığı açıkça yazıyor. Bu incelemede soruların cevabını değiştiren belirsiz veya yanıltıcı bir görünür metin bulmadım.

**Hüküm: scoped PASS.** Bu sonuç yalnızca verilen ekran ve sabit soruların anlam açıklığı içindir; üretim, gerçek cihaz veya insan kullanılabilirliği testi değildir. Repo dosyası değiştirilmedi.
</pre>

RAWBase64: IyBULUUxLTAxOCDigJQgS8O2ciBpbGsgb2t1bWEgcmFwb3J1CgojIyBLYXBzYW0gdmUgecO2bnRlbQoKWWFsbsSxeiBpemlubGkgZ2lyZGlsZXJpIGt1bGxhbmTEsW06IGBuYXRpdmUtcjEtcHJvb2YuanNvbmAsIGBuYXRpdmUtcjEtbWFuaWZlc3QudHh0YCwgYnUgbWFuaWZlc3RpbiBpxZ9hcmV0IGV0dGnEn2kgMzggZ2Vyw6dlayBQTkcgdmUgc2FiaXQgMjAgc29ydWx1ayBgZHVyYXRpb25fcmFuZ2VfcmVhZGluZ19xdWVzdGlvbnMuanNvbmAuIEtvZCwgcGxhbiwgYmHFn2thIHJhcG9yIHZleWEgY2V2YXAgYW5haHRhcsSxIG9rdW5tYWTEsS4gRWtyYW5sYXLEsSwgdGVrbmlrIGfDtnJldiBhZGxhcsSxbsSxbiB2ZSBtZXRhdmVyaW5pbiBuZSBhbmxhbWEgZ2VsZGnEn2luaSDDtm5jZWRlbiBiaWxtaXlvcm11xZ91bSBnaWJpIHlvcnVtbGFkxLFtLgoKTWFuaWZlc3R0ZWtpIDM4IHNhdMSxciAxOSBkdXJ1bXVuIGlracWfZXIga2F5ZMSxcm1hIHBhcsOnYXPEsS4gxLDDp2VyaWsgYmF5dGxhcsSxeWxhIGRvxJ9ydWxhbm3EscWfIDE4IGZhcmtsxLEgUE5HJ3lpIGB2aWV3X2ltYWdlYCBpbGUgYcOndMSxbS4gQXluxLEgYmF5dGzEsSB5b2xsYXLEsSBheXLEsSBiaXJlciBla3JhbiBkaXllIHNheW1hZMSxbTsgYcWfYcSfxLFkYSBhbGlhcyBncnVwbGFyxLFuxLEgdmUgYcOndMSxxJ/EsW0gZG9zeWFsYXLEsSBsaXN0ZWxpeW9ydW0uIEhlciBkdXJ1bXVuIGlraSBrYXlkxLFybWEgcGFyw6dhc8SxbsSxbiBtZXRuaW5pLCBheW7EsSBiYXl0bMSxIHRlbXNpbGkgw7x6ZXJpbmRlbiBiaXJsaWt0ZSBva3VkdW0uCgojIyBEb3N5YSBiw7x0w7xubMO8xJ/DvAoKTWFuaWZlc3R0ZSAzOCBzYXTEsXIsIHByb29mIGRvc3lhc8SxbmRhIDM4IHNhdMSxciB2YXI7IGR1cnVtLCB5b2wsIHBhcsOnYSBzxLFyYXPEsSB2ZSBrYXlkxLFybWEgYXJhbMSxxJ/EsSBlxZ9sZcWfaXlvci4gSGVyIFBORyBpw6dpbiBnZXLDp2VrIGRvc3lhIHV6dW5sdcSfdW51LCBTSEEtMjU2J3nEsSB2ZSBQTkcgSUhEUiBib3l1dHVudSB5ZW5pZGVuIGhlc2FwbGFkxLFtLiAzOCBkb3N5YW7EsW4gdGFtYW3EsSBwcm9vZi9tYW5pZmVzdCBpbGUgZcWfbGXFn3RpOiBmYXJrIHlvay4gVMO8bSBib3l1dGxhciAzOTDDlzg0NCBwaWtzZWwuIEF5bsSxIFNIQSBncnVwbGFyxLFuZGEgYmF5dGxhcsSxbiBrZW5kaXNpbmkgZGUga2FyxZ/EsWxhxZ90xLFyZMSxbTogMTggYXlyxLEgacOnZXJpaywgMjAgYWxpYXMsIGJheXQga2FyxZ/EsWxhxZ90xLFybWEgaGF0YXPEsSB5b2suCgojIyMgR2Vyw6dla3RlbiBhw6fEsWxhbiAxOCDDtnpnw7xuIFBORwoKYEM6L1VzZXJzL1hwaWtlLy5jb2RleC90YXNrLXN0YXRlL2thdnJpdmEtZTEwMTgvYCBhbHTEsW5kYToKCi0gYG5hdGl2ZS1yMS1iZWdpbm5lci0wLnBuZ2AKLSBgbmF0aXZlLXIxLWJlZ2lubmVyLTEucG5nYAotIGBuYXRpdmUtcjEtZmFtaWxpYXItMC5wbmdgCi0gYG5hdGl2ZS1yMS11bmtub3duLTAucG5nYAotIGBuYXRpdmUtcjEtbG9hZGluZy0wLnBuZ2AKLSBgbmF0aXZlLXIxLWZhaWxlZC0wLnBuZ2AKLSBgbmF0aXZlLXIxLWhlbGQtMC5wbmdgCi0gYG5hdGl2ZS1yMS1taXNzaW5nLXNvdXJjZS0wLnBuZ2AKLSBgbmF0aXZlLXIxLW1pc3Npbmctc291cmNlLTEucG5nYAotIGBuYXRpdmUtcjEtbWlzc2luZy1leHBlcmllbmNlLTAucG5nYAotIGBuYXRpdmUtcjEtb2ZmbGluZS0wLnBuZ2AKLSBgbmF0aXZlLXIxLW9mZmxpbmUtMS5wbmdgCi0gYG5hdGl2ZS1yMS1uZXctZXhwZXJpZW5jZS0wLnBuZ2AKLSBgbmF0aXZlLXIxLXN0YWxlLXNjb3BlLTAucG5nYAotIGBuYXRpdmUtcjEtbWlzc2luZy1zY29wZS0wLnBuZ2AKLSBgbmF0aXZlLXIxLWxvbmctY29udGV4dC0wLnBuZ2AKLSBgbmF0aXZlLXIxLXByZXZpb3VzLWRlZmF1bHQtMC5wbmdgCi0gYG5hdGl2ZS1yMS1wcmV2aW91cy1kZWZhdWx0LTEucG5nYAoKIyMjIDM4IGRvc3lhbsSxbiBnZXLDp2VrIGJveXV0LCBTSEEtMjU2IHZlIHBpa3NlbCDDtmzDp8O8bGVyaQoKVMO8bSB5b2xsYXLEsW4gb3J0YWsgZGl6aW5pOiBgQzovVXNlcnMvWHBpa2UvLmNvZGV4L3Rhc2stc3RhdGUva2F2cml2YS1lMTAxOC9gLiBBxZ9hxJ/EsWRha2kgYmF5dCB1enVubHXEn3UgdmUgU0hBLTI1NiBkZcSfZXJsZXJpIGdlcsOnZWsgZG9zeWFsYXJkYW4geWVuaWRlbiBoZXNhcGxhbmTEsTsgaGVyIHNhdMSxcsSxbiBib3l1dHUgMzkww5c4NDQndMO8ci4KCnwgRG9zeWEgfCBCYXl0IHwgU0hBLTI1NiB8CnwtLS18LS0tOnwtLS18CnwgbmF0aXZlLXIxLWJlZ2lubmVyLTAucG5nIHwgNzU2MTAgfCA2MDAzOTZhNGJmMDQ4OTY5NWI1NDYzN2QxYzUzNTRkYTEyNzIxNTAyOWQ1YzBhMGFmOWJiMTZlNzdhYTc4Y2Y1IHwKfCBuYXRpdmUtcjEtYmVnaW5uZXItMS5wbmcgfCA2NzUzMSB8IGM3ZDZhODg0MjE4YmJjNWY4Y2JjZTU0NTM2ZDc2ZGQ1Yjc4YThjM2E4MWU4MjlkYzFhYWNhZWZiYjc2NWFkNGMgfAp8IG5hdGl2ZS1yMS1mYW1pbGlhci0wLnBuZyB8IDc1NzcxIHwgYTVmYTFiODQ5NzBiMDNkOTdlODcwZWRjZDE4YzU0Njk5OGMyNTZhODc1NjA2YzJkOGY0NzNjMjlhOGRlMmEwMiB8CnwgbmF0aXZlLXIxLWZhbWlsaWFyLTEucG5nIHwgNjc1MzEgfCBjN2Q2YTg4NDIxOGJiYzVmOGNiY2U1NDUzNmQ3NmRkNWI3OGE4YzNhODFlODI5ZGMxYWFjYWVmYmI3NjVhZDRjIHwKfCBuYXRpdmUtcjEtdW5rbm93bi0wLnBuZyB8IDc1NzgzIHwgYWUyMmI3NGY4NWM1MWJjZWVjNDg2ODc0ODBiZTJjMmNlN2JkMTU0NjdlOWEwNmNkMTA0YTg5YmQwY2RhNjBjZiB8CnwgbmF0aXZlLXIxLXVua25vd24tMS5wbmcgfCA2NzUzMSB8IGM3ZDZhODg0MjE4YmJjNWY4Y2JjZTU0NTM2ZDc2ZGQ1Yjc4YThjM2E4MWU4MjlkYzFhYWNhZWZiYjc2NWFkNGMgfAp8IG5hdGl2ZS1yMS1sb2FkaW5nLTAucG5nIHwgNzU1NjYgfCA0ZTJlMmZmNGE5ZDU3ZTRkZTBkODdkNjc1M2ZjODdlZGE0OTE2NWQ2NmRjYzIxOWZmMTY4YjU1YzhmZTI4MjA2IHwKfCBuYXRpdmUtcjEtbG9hZGluZy0xLnBuZyB8IDY3NTMxIHwgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0YyB8CnwgbmF0aXZlLXIxLWZhaWxlZC0wLnBuZyB8IDc2NTkwIHwgNmJkYjFhNzA0MDNkZTEwZTcyOGJjZDg4ZGY5ZGEwZDRmMjdjNWNmMzEwN2E2NDFkMGRjNDBmMTNlY2I0OGM2NCB8CnwgbmF0aXZlLXIxLWZhaWxlZC0xLnBuZyB8IDY3NTMxIHwgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0YyB8CnwgbmF0aXZlLXIxLWhlbGQtMC5wbmcgfCA3NzE1NiB8IGE1OTMxNWM0MzRhN2QyODcyOGM4Y2Q0NjlkZjUzMDdjZGVhMWMwYTNmNDVmMzhmODdkMTBkZjllNDM4MWQzMzEgfAp8IG5hdGl2ZS1yMS1oZWxkLTEucG5nIHwgNjc1MzEgfCBjN2Q2YTg4NDIxOGJiYzVmOGNiY2U1NDUzNmQ3NmRkNWI3OGE4YzNhODFlODI5ZGMxYWFjYWVmYmI3NjVhZDRjIHwKfCBuYXRpdmUtcjEtbWlzc2luZy1zb3VyY2UtMC5wbmcgfCA3NTk3NyB8IDg5ZTllNjAyZDBkYTdlM2NlYzJlMDBlOGQwZDQ5YTQwYTM1MTc2MGY3NmU0YTNkMjEwNjE0MzhlNGZmOTE4NGUgfAp8IG5hdGl2ZS1yMS1taXNzaW5nLXNvdXJjZS0xLnBuZyB8IDY3MTI3IHwgZjY2YzdhMDdiYTNjNTc4ZWFlYzY2MWFjNDY4N2NkYTRkNTZiNGYzMzJjOTRhNzIxODMyMDZiMTA3MzUxMWZhNiB8CnwgbmF0aXZlLXIxLW1pc3NpbmctZXhwZXJpZW5jZS0wLnBuZyB8IDc3NTkxIHwgMjZhZTE2ZTdiNDdkNTVhOTdhMjc1MTAyNzFiZWUwYzAxMzI2MmE5NGE2YTgzZDRjMjMxNmFjOWRjMDBkNTAzNiB8CnwgbmF0aXZlLXIxLW1pc3NpbmctZXhwZXJpZW5jZS0xLnBuZyB8IDY3MTI3IHwgZjY2YzdhMDdiYTNjNTc4ZWFlYzY2MWFjNDY4N2NkYTRkNTZiNGYzMzJjOTRhNzIxODMyMDZiMTA3MzUxMWZhNiB8CnwgbmF0aXZlLXIxLXN0YWxlLTAucG5nIHwgNzU5NzcgfCA4OWU5ZTYwMmQwZGE3ZTNjZWMyZTAwZThkMGQ0OWE0MGEzNTE3NjBmNzZlNGEzZDIxMDYxNDM4ZTRmZjkxODRlIHwKfCBuYXRpdmUtcjEtc3RhbGUtMS5wbmcgfCA2NzEyNyB8IGY2NmM3YTA3YmEzYzU3OGVhZWM2NjFhYzQ2ODdjZGE0ZDU2YjRmMzMyYzk0YTcyMTgzMjA2YjEwNzM1MTFmYTYgfAp8IG5hdGl2ZS1yMS11bmNvbmZpcm1lZC0wLnBuZyB8IDc1OTc3IHwgODllOWU2MDJkMGRhN2UzY2VjMmUwMGU4ZDBkNDlhNDBhMzUxNzYwZjc2ZTRhM2QyMTA2MTQzOGU0ZmY5MTg0ZSB8CnwgbmF0aXZlLXIxLXVuY29uZmlybWVkLTEucG5nIHwgNjcxMjcgfCBmNjZjN2EwN2JhM2M1NzhlYWVjNjYxYWM0Njg3Y2RhNGQ1NmI0ZjMzMmM5NGE3MjE4MzIwNmIxMDczNTExZmE2IHwKfCBuYXRpdmUtcjEtb2ZmbGluZS0wLnBuZyB8IDc1OTc0IHwgNDM0MTViOGYwMDBhZDVjMWZlYjdlNDU2N2E3OTQ5ZjBlMDVmMDA1NjlmZmJhODIwNGU5YWEyNGNiYzdjMDAwOSB8CnwgbmF0aXZlLXIxLW9mZmxpbmUtMS5wbmcgfCA2NjQ2NiB8IGZjOGI5YmZkODViNWI0YWFhODZkZWQzM2FmMTFjYmIwOGE3ZDNmNWZjNDFkYWFhNjVhODdlZDkxZTZiODU3NzEgfAp8IG5hdGl2ZS1yMS13cm9uZy1tb3RvcmN5Y2xlLTAucG5nIHwgNzU5NzcgfCA4OWU5ZTYwMmQwZGE3ZTNjZWMyZTAwZThkMGQ0OWE0MGEzNTE3NjBmNzZlNGEzZDIxMDYxNDM4ZTRmZjkxODRlIHwKfCBuYXRpdmUtcjEtd3JvbmctbW90b3JjeWNsZS0xLnBuZyB8IDY3MTI3IHwgZjY2YzdhMDdiYTNjNTc4ZWFlYzY2MWFjNDY4N2NkYTRkNTZiNGYzMzJjOTRhNzIxODMyMDZiMTA3MzUxMWZhNiB8CnwgbmF0aXZlLXIxLW5ldy1kb2N1bWVudC0wLnBuZyB8IDc1OTc3IHwgODllOWU2MDJkMGRhN2UzY2VjMmUwMGU4ZDBkNDlhNDBhMzUxNzYwZjc2ZTRhM2QyMTA2MTQzOGU0ZmY5MTg0ZSB8CnwgbmF0aXZlLXIxLW5ldy1kb2N1bWVudC0xLnBuZyB8IDY3MTI3IHwgZjY2YzdhMDdiYTNjNTc4ZWFlYzY2MWFjNDY4N2NkYTRkNTZiNGYzMzJjOTRhNzIxODMyMDZiMTA3MzUxMWZhNiB8CnwgbmF0aXZlLXIxLW5ldy1leHBlcmllbmNlLTAucG5nIHwgNzYxNDEgfCA0NDg4NGE5MWI0ZDViZTY3ZWQ5NjI1YjVmODBiNWE4NThkMzIwMTkxZTNiYTZmOTI1Y2I3NTJjM2I3ZDU2MzRiIHwKfCBuYXRpdmUtcjEtbmV3LWV4cGVyaWVuY2UtMS5wbmcgfCA2NzEyNyB8IGY2NmM3YTA3YmEzYzU3OGVhZWM2NjFhYzQ2ODdjZGE0ZDU2YjRmMzMyYzk0YTcyMTgzMjA2YjEwNzM1MTFmYTYgfAp8IG5hdGl2ZS1yMS1taXNzaW5nLXJhbmdlLTAucG5nIHwgNzU3ODMgfCBhZTIyYjc0Zjg1YzUxYmNlZWM0ODY4NzQ4MGJlMmMyY2U3YmQxNTQ2N2U5YTA2Y2QxMDRhODliZDBjZGE2MGNmIHwKfCBuYXRpdmUtcjEtbWlzc2luZy1yYW5nZS0xLnBuZyB8IDY3NTMxIHwgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0YyB8CnwgbmF0aXZlLXIxLXN0YWxlLXNjb3BlLTAucG5nIHwgNzY0MTAgfCA3N2YxZmU3MTU3ZTE1MGUyOTFiNmVkNTE3ZGM2NjAyZWFlN2U2YTY3MTQxZTAxZmU2ZjcxODAwZThiNGVhNmQ1IHwKfCBuYXRpdmUtcjEtc3RhbGUtc2NvcGUtMS5wbmcgfCA2NzEyNyB8IGY2NmM3YTA3YmEzYzU3OGVhZWM2NjFhYzQ2ODdjZGE0ZDU2YjRmMzMyYzk0YTcyMTgzMjA2YjEwNzM1MTFmYTYgfAp8IG5hdGl2ZS1yMS1taXNzaW5nLXNjb3BlLTAucG5nIHwgNzg2NjkgfCBlYzhiN2MyNmRiZWNhMTQ2YWRlODE0ZTYyMjAxZTE1YzRjYmEzOGMxNDM2YjAxMTAxNTI3NDFiN2NiOGU0ZDM0IHwKfCBuYXRpdmUtcjEtbWlzc2luZy1zY29wZS0xLnBuZyB8IDY3MTI3IHwgZjY2YzdhMDdiYTNjNTc4ZWFlYzY2MWFjNDY4N2NkYTRkNTZiNGYzMzJjOTRhNzIxODMyMDZiMTA3MzUxMWZhNiB8CnwgbmF0aXZlLXIxLWxvbmctY29udGV4dC0wLnBuZyB8IDc4MzI1IHwgYmNiMjIxNGZjODEwNDQxM2Q5MTdhN2FiYTI3MTRhZDJjNjQ3NWNkZDIyM2NhMGZiMmNmZWRjODVhMTYxM2U2YSB8CnwgbmF0aXZlLXIxLWxvbmctY29udGV4dC0xLnBuZyB8IDY3NTMxIHwgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0YyB8CnwgbmF0aXZlLXIxLXByZXZpb3VzLWRlZmF1bHQtMC5wbmcgfCA2Nzc2MiB8IDU1MWVkYTUzMzIwYWIyMmNkNDU3MjkxYjc1OTliOGY5MzcwMmI4ODU4NDEyMDcwMGM1MGJiZDMyNWVkYWZmNTggfAp8IG5hdGl2ZS1yMS1wcmV2aW91cy1kZWZhdWx0LTEucG5nIHwgNjMzODQgfCA2NDRlMWQ2OGM0NTg1N2M1YzQ1MTRlNDBkOTVjMDVlY2M1ZjVkZGE1ZTBhMWYzYzkxNTRiOTBjYWFjZDAzYzliIHwKCiMjIyBBeW7EsSBSQVcgYmF5dGzEsSBhbGlhcyBncnVwbGFyxLEKCkhlciBncnVwdGEgbGlzdGVkZWtpIGRvc3lhbGFyIGF5bsSxIHV6dW5sdWt0YSwgYXluxLEgU0hBLTI1NidkYSB2ZSBiYXl0IGJheXQgZcWfaXQ6CgotIFNIQSBgYzdkNmE4ODQyMThiYmM1ZjhjYmNlNTQ1MzZkNzZkZDViNzhhOGMzYTgxZTgyOWRjMWFhY2FlZmJiNzY1YWQ0Y2AsIDY3LjUzMSBiYXl0OiBgbmF0aXZlLXIxLWJlZ2lubmVyLTEucG5nYCwgYG5hdGl2ZS1yMS1mYW1pbGlhci0xLnBuZ2AsIGBuYXRpdmUtcjEtdW5rbm93bi0xLnBuZ2AsIGBuYXRpdmUtcjEtbG9hZGluZy0xLnBuZ2AsIGBuYXRpdmUtcjEtZmFpbGVkLTEucG5nYCwgYG5hdGl2ZS1yMS1oZWxkLTEucG5nYCwgYG5hdGl2ZS1yMS1taXNzaW5nLXJhbmdlLTEucG5nYCwgYG5hdGl2ZS1yMS1sb25nLWNvbnRleHQtMS5wbmdgLgotIFNIQSBgYWUyMmI3NGY4NWM1MWJjZWVjNDg2ODc0ODBiZTJjMmNlN2JkMTU0NjdlOWEwNmNkMTA0YTg5YmQwY2RhNjBjZmAsIDc1Ljc4MyBiYXl0OiBgbmF0aXZlLXIxLXVua25vd24tMC5wbmdgLCBgbmF0aXZlLXIxLW1pc3NpbmctcmFuZ2UtMC5wbmdgLgotIFNIQSBgODllOWU2MDJkMGRhN2UzY2VjMmUwMGU4ZDBkNDlhNDBhMzUxNzYwZjc2ZTRhM2QyMTA2MTQzOGU0ZmY5MTg0ZWAsIDc1Ljk3NyBiYXl0OiBgbmF0aXZlLXIxLW1pc3Npbmctc291cmNlLTAucG5nYCwgYG5hdGl2ZS1yMS1zdGFsZS0wLnBuZ2AsIGBuYXRpdmUtcjEtdW5jb25maXJtZWQtMC5wbmdgLCBgbmF0aXZlLXIxLXdyb25nLW1vdG9yY3ljbGUtMC5wbmdgLCBgbmF0aXZlLXIxLW5ldy1kb2N1bWVudC0wLnBuZ2AuCi0gU0hBIGBmNjZjN2EwN2JhM2M1NzhlYWVjNjYxYWM0Njg3Y2RhNGQ1NmI0ZjMzMmM5NGE3MjE4MzIwNmIxMDczNTExZmE2YCwgNjcuMTI3IGJheXQ6IGBuYXRpdmUtcjEtbWlzc2luZy1zb3VyY2UtMS5wbmdgLCBgbmF0aXZlLXIxLW1pc3NpbmctZXhwZXJpZW5jZS0xLnBuZ2AsIGBuYXRpdmUtcjEtc3RhbGUtMS5wbmdgLCBgbmF0aXZlLXIxLXVuY29uZmlybWVkLTEucG5nYCwgYG5hdGl2ZS1yMS13cm9uZy1tb3RvcmN5Y2xlLTEucG5nYCwgYG5hdGl2ZS1yMS1uZXctZG9jdW1lbnQtMS5wbmdgLCBgbmF0aXZlLXIxLW5ldy1leHBlcmllbmNlLTEucG5nYCwgYG5hdGl2ZS1yMS1zdGFsZS1zY29wZS0xLnBuZ2AsIGBuYXRpdmUtcjEtbWlzc2luZy1zY29wZS0xLnBuZ2AuCgojIyBTYWJpdCAyMCBzb3J1eWEgaWxrIG9rdW1hIHlhbsSxdGxhcsSxCgoxLiAqKkJ1IGFsYW5kYSBnw7ZzdGVyaWxlbiBiaWxnaSBuZSBpw6dpbiBrdWxsYW7EsWxhYmlsaXI/KiogUGxhbmxhbWEgacOnaW4geWFrbGHFn8SxayBzw7xyZSBiaWxnaXNpLiBFa3JhbiDigJx1eWd1bGFtYSBpem5pIGRlxJ9pbGRpcuKAnSBkaXlvci4KMi4gKipTw7xyZSB0ZWsgYmlyIGtlc2luIHNhecSxIG3EsSwgYmlyIGFyYWzEsWsgbcSxPyoqIEFyYWzEsWs6IMO2cm5lxJ9pbiBgYmVnaW5uZXItMGAgZWtyYW7EsW5kYSA0MOKAkzgwIGRha2lrYSwgYGZhbWlsaWFyLTBgIGVrcmFuxLFuZGEgMjDigJM0NSBkYWtpa2EuCjMuICoqR8O2c3RlcmlsZW4gYXJhbMSxayBoYW5naSBkZW5leWltIGJpbGdpc2luZSBhaXR0aXI/KiogS3VsbGFuxLFjxLFuxLFuIGtlbmRpIGJleWFuxLFuYTogw7ZybmXEn2luIGlsayBrZXogeWFwbWFzxLEgdmV5YSBkYWhhIMO2bmNlIHlhcG3EscWfIG9sbWFzxLEuIEJ1IGJpbGdpIGFyYWzEscSfxLFuIGhlbWVuIMO8c3TDvG5kZS4KNC4gKipCaWxnaW5pbiBoYW5naSB0YXJpaGUgYWl0IG9sZHXEn3VudSBuZXJlZGVuIGFubGFyc8Sxbj8qKiDigJxCaWxnaSB0YXJpaGnigJ0gc2F0xLFyxLEgKMO2cm5lazogMDEuMTAuMjAyNikuIOKAnEtheW5hayBrb250cm9sIHRhcmloaeKAnSBheXLEsSB2ZSBhw6fEsWsgZXRpa2V0bGkuCjUuICoqQnUgc8O8cmUga2VzaW4gYmlyIGJpdGnFnyBzw7Z6w7wgdmVyaXlvciBtdT8qKiBIYXnEsXI7IOKAnEtlc2luIGJpdGnFnyBzw7Z6w7wgZGXEn2lsZGly4oCdIHlhesSxeW9yIHZlIHPDvHJlbmluIGtvxZ91bGxhcmEgZ8O2cmUgZGXEn2nFn2ViaWxlY2XEn2kgYmVsaXJ0aWxpeW9yLgo2LiAqKkRlbmV5aW0gYmlsZ2lzaSB5b2tzYSBzYW5hIGJpciBzZXZpeWUgYXRhbm3EscWfIG3EsT8qKiBIYXnEsXIuIGBtaXNzaW5nLWV4cGVyaWVuY2UtMGA6IOKAnERlbmV5aW0gYmlsZ2lzaSB5b2s7IHNhbmEgYmlyIHNldml5ZSBhdGFubWFkxLEu4oCdCjcuICoqU8O8cmUga2F5bmHEn8SxIHlva3NhIGVrcmFuZGEgYmlyIHNhecSxIGhlc2FwbGFuxLF5b3IgbXU/KiogSGF5xLFyLiBgdW5rbm93bi0wYC9gbWlzc2luZy1yYW5nZS0wYDogZGVuZXlpbSBpw6dpbiBhcmFsxLFrIG9sbWFkxLHEn8SxIHZlIHPDvHJlbmluIGJpbGlubWVkacSfaSB5YXrEsXlvci4KOC4gKipFc2tpIHZleWEgYmHFn2thIG1vdG9zaWtsZXRlIGFpdCB0YWhtaW4gZ8O8bmNlbCBiaWxnaSBvbGFyYWsgZ8O2c3RlcmlsaXlvciBtdT8qKiBIYXnEsXIuIGBtaXNzaW5nLXNvdXJjZS0wYCBnw7Zyw7xuw7xtw7xuZGUgc2F5xLEgeW9rOyBnw7xuY2VsIGtheW5hayBvbG1hZMSxxJ/EsSBhw6fEsWvDp2Egc8O2eWxlbml5b3IuCjkuICoqUmVoYmVyIHZleWEgYmHEn2xhbSBkZcSfacWfaW5jZSDDtm5jZWtpIHRhaG1pbiBrdWxsYW7EsWxhYmlsaXIgbWk/KiogSGF5xLFyLiBgc3RhbGUtc2NvcGUtMGA6IGthcHNhbSBiaWxnaXNpbmluIGfDvG5jZWwgb2xtYWTEscSfxLEsIHllbmlkZW4ga29udHJvbCBldG1lZGVuIGhhesSxcmzEscSfYSBnZcOnaWxlbWV5ZWNlxJ9pIHZlIHPDvHJlbmluIGJpbGlubWVkacSfaSB5YXrEsXlvci4KMTAuICoqRGVuZXlpbSBiaWxnaXNpIGRlxJ9pxZ9pbmNlIMO2bmNla2kgYXJhbMSxayBnZcOnZXJsaSBzYXnEsWzEsXlvciBtdT8qKiBIYXnEsXIuIGBuZXctZXhwZXJpZW5jZS0wYDogZ8O8bmNlbCBzw7xyZSB5b2sgdmUgZ8O8bmNlbCBiaWxnaSBnZWxtZWRlbiB0YWhtaW4ga3VsbGFubWFtYSB1eWFyxLFzxLEgdmFyLgoxMS4gKirDh2V2cmltZMSxxZ/EsSBlc2tpIGJpbGdpeWxlIGfDvG5jZWwgdGFobWluIHZhcm3EscWfIGdpYmkgZGF2cmFuxLFsxLF5b3IgbXU/KiogSGF5xLFyLiBgb2ZmbGluZS0wYDog4oCcRXNraSBiaWxnaSBnw7xuY2VsIHPDvHJlIHRhaG1pbmkgc2F5xLFsbWF6LuKAnQoxMi4gKipCaWxnaSB5w7xrbGVuaXJrZW4gc8O8cmUgaGF6xLFybcSxxZ8gZ2liaSBnw7ZzdGVyaWxpeW9yIG11PyoqIEhhecSxci4gYGxvYWRpbmctMGA6IOKAnEhhesSxciBiaXIgdGFobWluIGhlbsO8eiB5b2su4oCdCjEzLiAqKkJpbGdpIGFsxLFuYW1henNhIGJ1IGnFn2luIHRhbWFtbGFuZMSxxJ/EsSBzw7Z5bGVuaXlvciBtdT8qKiBIYXnEsXIuIGBmYWlsZWQtMGA6IGJpbGdpIGFsxLFuYW1hZMSxLCBzw7xyZSBiaWxpbm1peW9yLCBnw7xuY2VsIGtheW5hxJ/EsW4geWVuaWRlbiBrb250cm9sIGVkaWxtZXNpIGdlcmVrdGnEn2kgeWF6xLF5b3IuCjE0LiAqKlPDvHJlIGFyYWzEscSfxLEgbW90b3Npa2xldGluIHV5Z3VubHXEn3VudSBrYW7EsXRsxLF5b3IgbXU/KiogSGF5xLFyLiBFa3JhbiBzw7xyZXlpIHBsYW5sYW1hIGJpbGdpc2kgc2F5xLF5b3I7IG1vdG9zaWtsZXQgdXlndW5sdcSfdSB2ZSBoYXrEsXJsxLHEn8SxbiBheXLEsWNhIGRlxJ9lcmxlbmRpcmlsZWNlxJ9pbmkgc8O2eWzDvHlvci4KMTUuICoqU8O8cmV5aSBnw7ZybWVrIGhhesSxcmzEsWsga29udHJvbGxlcmluaSBhdGxhbWFuYSBpemluIHZlcml5b3IgbXU/KiogSGF5xLFyLiBFa3JhbiwgcmVoYmVyIGfDtnLDvG7DvG3DvG7DvG4gaGF6xLFyIG9sbWEgZHVydW11IHlhcmF0bWFkxLHEn8SxbsSxIHZlIGRlbmV5aW1pbiBnw7x2ZW5saWsga29udHJvbGxlcmluaSBrYWxkxLFybWFkxLHEn8SxbsSxIHPDtnlsw7x5b3IuCjE2LiAqKkJ1IGFsYW4gdGVrbmlrIHV5Z3VsYW1hIGFkxLFtbGFyxLEgdmV5YSBwYXLDp2EgZGXEn2nFn3Rpcm1lIMO2bmVyaXNpIHZlcml5b3IgbXU/KiogSGF5xLFyLiDigJxOZWxlcmkga2Fwc2FtYXo/4oCdIGFsdMSxbmRhIGZpemlrc2VsIG3DvGRhaGFsZSBhZMSxbWxhcsSxIG9sbWFkxLHEn8SxOyBnw7Zyw7xuw7xtw7xuIG1vdG9zaWtsZXR0ZSB1eWd1bGFtYSBhZMSxbcSxIG9sbWFkxLHEn8SxIHlhesSxeW9yLgoxNy4gKipCdSBiaWxnaSBpw6dpbiBoZXNhcCBhw6dtYW4gZ2VyZWtpeW9yIG11PyoqIEhhecSxci4g4oCcQnUgYmlsZ2l5aSBva3VtYWsgacOnaW4gaGVzYXAgZ2VyZWttZXou4oCdCjE4LiAqKsOWcm5layBla3JhbsSxbiBkZcSfZXJsZXJpIGdlcsOnZWsgbW90b3Npa2xldCBpw6dpbiBkb8SfcnVsYW5txLHFnyB0YWhtaW4gbWk/KiogSGF5xLFyLiDDlnJuZWsgZGXEn2VybGVyaW4gZ2Vyw6dlayBtb3Rvc2lrbGV0IGnDp2luIGRvxJ9ydWxhbm3EscWfIHRhaG1pbiBvbG1hZMSxxJ/EsSB5YXrEsXlvci4KMTkuICoqQWx0IMOndWJ1a3RhIGhhbmdpIGLDtmzDvG1sZXIgdmFyOyBheXLEsSBiaXIgc8O8cmUgc2VrbWVzaSB2YXIgbcSxPyoqIEdhcmFqLCBCYWvEsW0sIEFJIFVzdGEsIEdlw6dtacWfLCBUb3BsdWx1ay4gQXlyxLEgc8O8cmUgc2VrbWVzaSBnw7Zyw7xubcO8eW9yLgoyMC4gKipCaXIgc8O8cmUgYmlsaW5taXlvcnNhIG5lIGVrc2lrIHZlIGJ1IGJlbGlyc2l6bGlrIGfDtnLDvG7DvHIgbcO8PyoqIEV2ZXQsIGJlbGlyc2l6bGlrIGHDp8Sxay4gYG1pc3NpbmctcmFuZ2UtMGAgZWtzaWsgZGVuZXlpbSBhcmFsxLHEn8SxbsSxIHZlIGJpbGlubWV5ZW4gc8O8cmV5aSBzw7Z5bMO8eW9yOyBkacSfZXIga2/Fn3VsbHUgZWtyYW5sYXJkYSBla3NpayBnw7xuY2VsIGtheW5hayB2ZXlhIHnDvGtsZW1lL2FsxLFuYW1hbWEgbmVkZW5pIGJlbGlydGlsaXlvci4KCiMjIFNvbXV0IGJ1bGd1IHZlIGjDvGvDvG0KCkJ1IDIwIHNvcnVudW4gaGVyIGJpcmksIGlsZ2lsaSBrb8WfdWx1biBnw7Zyw7xuw7xyIGVrcmFuIG1ldG5pbmRlbiB5YXJkxLFtIGFsbWFkYW4gY2V2YXBsYW5hYmlsaXlvci4gU8O8cmUgeW9ra2VuIHNhecSxIGfDtnN0ZXJpbG1peW9yOyBiaWxpbm1lbWUgbmVkZW5pIHZlIHNvbnJha2kgYWTEsW0gKOKAnGfDvG5jZWwgYmlsZ2kgZ2VsbWVkZW4ga3VsbGFubWHigJ0sIOKAnHllbmlkZW4ga29udHJvbCBldOKAnSBnaWJpKSBpbGdpbGkgZHVydW1sYXJkYSBnw7Zyw7xuw7xyLiDigJxNb3Rvc2lrbGV0ZSB1eWd1bmx1a+KAnSBheXLEsSBnw7ZzdGVyaWxpeW9yIHZlIHPDvHJlIGJpbGdpc2luaW4gdXlndW5sdWsgeWEgZGEgaGF6xLFybMSxayBvbmF5xLEgb2xtYWTEscSfxLEgYcOnxLFrw6dhIHlhesSxeW9yLiBCdSBpbmNlbGVtZWRlIHNvcnVsYXLEsW4gY2V2YWLEsW7EsSBkZcSfacWfdGlyZW4gYmVsaXJzaXogdmV5YSB5YW7EsWx0xLFjxLEgYmlyIGfDtnLDvG7DvHIgbWV0aW4gYnVsbWFkxLFtLgoKKipIw7xrw7xtOiBzY29wZWQgUEFTUy4qKiBCdSBzb251w6cgeWFsbsSxemNhIHZlcmlsZW4gZWtyYW4gdmUgc2FiaXQgc29ydWxhcsSxbiBhbmxhbSBhw6fEsWtsxLHEn8SxIGnDp2luZGlyOyDDvHJldGltLCBnZXLDp2VrIGNpaGF6IHZleWEgaW5zYW4ga3VsbGFuxLFsYWJpbGlybGnEn2kgdGVzdGkgZGXEn2lsZGlyLiBSZXBvIGRvc3lhc8SxIGRlxJ9pxZ90aXJpbG1lZGkuCg==
