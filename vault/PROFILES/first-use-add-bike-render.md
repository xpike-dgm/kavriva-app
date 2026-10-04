---
record_id: V-E1-FIRSTUSE-001
version: 1
purpose: İlk kullanım niyetini ve motosiklet ekleme formunu hesap zorlamadan sunmak
domain: first-use
module: e01-app
owner: E1
implements: [ADR-008, C1.1, F1.1.1, SCR-001, SCR-002, BR-105, BR-106, BR-107, BR-134, BR-135, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: first-use-presentation
tasks: [T-E1-003]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E1-001, M-E3-001, M-E5-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-003, T-E1-003, E-DEV-099]
evidence: [E-DEV-099]
supersedes: []
status: ACTIVE
---

# İlk kullanım ve motosiklet ekleme sunumu

T-E1-003 canonical Value before account; creation form; SCR001002/C1.1/F1.1.1/FL1.1.1. Üç niyet known-task/symptom/record-first sade Türkçe açıklamayla gösterilir; hesap/notification/uzun profil veya promo dayatılmaz. FirstValueEntry yalnız doğru niyet callback isteği verir; navigation/auth/physicalinstruction başlatmaz. Callback yoksa açık kullanılamaz metni ve disabledsemantics vardır; hesap çözüm diye zorlanmaz.

Marka/model/yıl alanları REF-FIRSTUSE-001 partialreview açık girdileridir. MotorcycleDraft immutable kullanıcı beyanı; gerçek motorID/canonicalrecord/verifiedvariant/fit kararı değildir. Marka/model boş değil, yıl sayıyla pozitif veya kullanıcı açıkça bilmiyor. Yıl için bilinmeyen kabul edilir; tarih aralığı/yakınmodel/donanım/VIN/technicalcode zorunluluğu uydurulmaz. Bilinmeyen yıl seçimi mevcut yıl yazısını payload’a taşımaz; tekrar bilinen seçilirse eski yerel yazı korunur. Teknik varyant/fit ayrımı T-E1-004 dış kapsam; uygunluk separatelyverified olmadan physicalapplication yok.

AddMotorcycleForm yerel TextEditingController taslağıdır; çağıran busy/error/callback sağlar. Submit yalnız immutableistek; kendi başına success/DBwrite/garagecontextselection/route değişimi yok. Busy yeni gönderimi engeller, alanlar readonly; hata veya geri callback taslağı silmez. Brand/model/yıl tek yeni motosiklet beyanına aittir; eski motosikletin history/warning/work alanı bu modelde yok. Snapshot/account/authority taşımaz. Yerel widget state kalıcıstore/sync/crossdevice/devicekillrestore kanıtı değil. Focus/controller dispose kaynakları kapatır. E1renders/E3serves/E5authorizes/E4truth dışarı; newseam/privateimport yok.

Türkçe metin, scroll, büyüyen metin/320390768×1/2/3, min52kontrol, alan semantik adları, TabEnter ve yılDone/aynıvalidation. Empty/invalid/error/busy/unknownyear/uibeyanıvsverified/disabled/back callback negatifleri anlamlı testlerde. ActualContainerborder/nearestColoredBox/DefaultTextStyle kontrastı ölçülür. Yeni görüntü/sesvideoasset yok, captionvoice gerçekdevicea11y gate HELD. SDK/lock/önceki shellgarage/workflowsunchanged; ilkglobalfont/token/ikon seçimi yok. İlklanding/bar görünürlüğü productionpolicyseçilmedi; PNGfixtureactualshellnavfalseyalnız bu test.

Yerel36PASS (firstuse12+shell10+garage13+optionalPNG1), CIcapturekapalı35. lockedpubgetPASS, formatter6dosya0değişim.08s, analyze0sorun10.8s. Actual390×844 iki TempPNG açıkzemin/koyumetin/3intent veya3formalanı+unknownyear+Devam/Geri; taşma yok. AsılmanagerchatPNGbinary repoda yok, birebirpixel fidelity iddiası yok. İlkformatterparantezFAIL ve ilk34PASS/1FAILsemanticsfinder historykanıtta.

Bütün kanonik bağımsızgpt6luna/max exactsourceincelemesi + gerçeksourceCI/T3 ve boundedfinalmetadata+exactfinalCI ayrıca zorunlu. Sahip sürekliçalışma onayı bu reviewer/gatesi kaldırmaz. ProductE3R1REVIEW/E5-003IN_PROGRESS/PR47-57-59/retliPR97/proddevicephysicalreleaseMISSINGHELD değişmez. Sırf belge/fixture varlığı DONE değil.

Pack `vault/PACKS/P-E1-003.md`; görev `vault/REGISTRY/T-E1-003.md`; kanıt `vault/EVIDENCE/E-DEV-099.md`.

İlkwholeb762CHANGES_REQUESTED/P2 unknownyearModelNextno-op. Dar düzeltme bilinmeyenyılda ModelDone→aynıvalidation, bilinen yılda Next→yıl; readonlyunknownyear focus atlanır. Yeni anlamlıklavye testi dahil36localPASS, yeniwhole exactsourceincelemeveCI beklenir; ilkbekleyiş/failurehistory kanıtta korunur.

## İlk kullanım görevinin bütün kaynak kabulü

Bağımsız /root/e1003_first_use_full_review gpt-6-luna/max ayrı görevlendirme, exact 6732dd3a4e48c44b2b73661988b2e72fde5a0e77 FULL PASS; önceki unknown-year Model Next P2 kapalı. Görevlendirme model ayarı runtime attestation değildir. Reviewer kod yazmadı/testCIağ çalıştırmadı; sahip DEC0069 ve açık sürekli sohbet yetkisiyle alt ajanı kabul etti. Aynı kaynak16/16actualCI/T3five/checksseven SUCCESS. Ayrıntılıkanit `vault/EVIDENCE/E-DEV-099.md`.

Yalnız canonical Value before account; creation form sunumu kabul edilir. Gerçekcreate/fit/authDB/native/cihaz/physicalwork/release MISSINGHELD. Son boundedmetadataincelemesi ve aynı finalheadCI/T3 ayrıca zorunlu, henüzmergeyok. Eski bekleyişler yazıldığıan tarihidir, failurehistorysilinmez; kabulmain sayacı actualnormalmatchedmerge öncesi ilerletilmez.
