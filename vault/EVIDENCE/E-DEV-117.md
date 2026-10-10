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
