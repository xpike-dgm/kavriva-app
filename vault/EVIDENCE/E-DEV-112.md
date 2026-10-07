---
test_id: E-DEV-112
version: 1
purpose: Motosiklet pasifleştirme aktarım ve silme kapsamını açık sunmak
domain: motorcycle-lifecycle
module: e01-app
owner: E1
implements: [ADR-001, ADR-004, ADR-005, C1.7, F1.7.1, SCR-031, SCR-032, SCR-033, BR-103, BR-111, BR-117, BR-118, BR-134, BR-135, BR-136, BR-137, CON-001, CON-002, CON-003, R-001, R-003, R-004, R-007, R-009, R-013, R-014]
public_contracts: []
internal_scope: lifecycle-presentation
tasks: [T-E1-014a]
tests: [modules/e01-app/internal/shell/test/lifecycle_test.dart, modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-07
depends_on: [V-E1-LIFECYCLE-001]
used_by: [V-E1-LIFECYCLE-001, P-E1-014a, T-E1-014a]
evidence: []
supersedes: []
status: RECORDED
contract_id_version: "SCR031032033 C1.7/F1.7.1/FL1.7.1 lifecycle v1 GATE"
subject_file: modules/e01-app/internal/shell/lib/lifecycle.dart
subject_digest: 63e782afa5d3ea55f6b04a50d9930c998dfed848b147c752fb2c2b570d3db72c
result: "F-01 yerel299normal/1native PASS; R1ret korunur; yeni bağımsız ilkoku/bütünkaynak/CI-T3 bekleniyor"
gate_verdict: "FAIL GATE R1 F-01; aynı PR dar düzeltme ve bağımsız re-review bekleniyor"
reviewer: /root/e1014a_whole_review
timestamp: 2026-10-07
evidence_links: [vault/PROFILES/lifecycle-render.md, vault/PACKS/P-E1-014a.md, vault/REGISTRY/T-E1-014a.md, vault/EVIDENCE/SNAPSHOTS/E-DEV-111-E10-GOVERNED-PATHS-FOR-T-E1-014a.md.snapshot, modules/e01-app/internal/shell/lib/lifecycle.dart, modules/e01-app/internal/shell/test/lifecycle_test.dart, modules/e01-app/internal/shell/test/fixtures/lifecycle_reading_questions.json]
---

# Motosiklet pasiflik, aktarım ve silme kapsamı

T-E1-014a SCR031/032/033/C1.7/F1.7.1/FL1.7.1, plan fa914f013fdcd032faed876689092da245989459. Kanonik ACCEPTANCE_MATRIX Validation assignment yöntemi GATE (HELD-acceptance evaluation); eski NONE satırı ve önceki görev SIMULATION yöntemi bu görevin yerine kullanılmaz. Tek sert bağımlılık T-E1-001 gerçekDONE. Kabul edilmiş main 1d113afae5bfeca7626d4ca1fc7b333effeace6e, gerçek100DONE106kalan206; bu branch ve yerel test yeniDONE değildir.

## Sunum kapısı değerlendirmesi

| Kapı / kanonik kaynak | Yerel gözlenen sonuç | Açık sınır |
|---|---|---|
| SCR031/BR103 pasiflik ve yeniden etkinlik | Ayrı seçilen işlemi gözden geçir adımı; pasiflik geçmiş/kanıt/düzeltme korur, fiziksel uygunluk üretmez | Gerçek etkinlik yazıcısı ve revalidation üreticisi HELD |
| SCR032/BR117118136137 aktarım | Kısmi geçmiş, seçilen dönem, boşluk/hariç özel içerik, her sahiplik dönemi/kaynak/atıf ve uyuşmazlık ayrı; kapsam onayı aktarım değildir | Hedef kişi, gerçek aktarım ve kimlik/yetki sistemi HELD |
| SCR033/BR111 silme | Kendi uygulanabilir kapsamı ve bağımsız aktörlerin kopya/kanıt/atıf sınırı önce; açık onay olmadan etki yok; koruyan alternatif | Gerçek silme, hukuk, saklama ve yedek sonucu HELD |
| DEC0053 hak şekli | 1 ücretsiz, abonelikle toplam3, aynıanda1 seçili tamrehber; başka seçim hakkı taşır | Fiyat/paket/billing/switch/antiabuse/trial/wrong-selection HELD; SCR037 başka görev |
| Güncel okuma kapısı | Plan ve kapsam otoritesi, dört read ve on alan tam scope/request/subject/purpose/current bağında; yok/eski/yabancı/unknown/HELD özel metni kapatır | Olumlu referanslar açık test girdisi; üretim bağlayıcısı yok |
| Etki kapısı | Her eylem altı motorcycle/source/authorization/policy/operationIntent/audit bağı; handler tek başına ALLOW değil | Gerçek E3/E5 commit anı yetkilendirmesi burada uygulanmaz |
| Aynı istek ve sonuca dönüş | Aynı scope/request gönderim/sorgu kilidi içerik değişince açılmaz; eski callback güncel izin ödünç alamaz; failed/unknown/kanıtsızreceived aynıistek sorgusu | Makbuz yalnız isteğin alındığı; silme/aktarım/etkinlik tamamlanması değildir |

Bu değerlendirme üretim kapılarını HELD tutar. Yerel olumlu sunum, gerçek kullanıcıya işlem izni değildir; bağımsız görev hükmü ve aynı-head CI/T3 henüz beklenir. Üretim kapısının kapanması veya tamamlanmış ürün iddiası yok.

## Girdi ve etkileşim sınırı

LifecyclePlan bütün içerik, plan/revizyon ve pasiflik değerini kayıpsız UTF16 uzunluk kodlamasıyla tam subject'e bağlar. Immutable değerler/haritalar değişmez. Kabul edilmiş aynıE1 HistoryScope/Reference private sunum tipleri korunur; yeni publicseam yok. Ekran ve request işlemi uyuşmazsa constructor reddeder. SCR031 seçim/gözden geçirme yerel sunumdur. Başka işlemin gözden geçirilmesi onun mevcut request iznini ödünç alamaz; güncel üretici o işleme yeni bağlam sağlamalıdır. SCR032 yalnız kapsam onayı niyeti; transfer hedefi seçimi/gerçek aktarım yok. SCR033 açık onay kapsam/request/operation veya okuma değişince sıfırlanır. Destek/vazgeç niyeti özel subject taşımaz.

## Gerçek yerel kanıt

Kodöncesi c5e5411ea96957a8534780c9346452fcde383cf6; kod d1916bc7b9149f21156a922028533157681144d1. Kilitli pubget geçti; strictformat32/0, analyze0. Önceki277 normal değişmeden, yeni20 ile297normal aynı koşuda PASS. Native ayrı1PASS; 298normal koşu iddiası yok. 28durum×320390768×123 yazı =252gerçek tamkaydırma düzeni. Bütün boyanmış52hedef, sonVazgeç gerçektap/fatalpointer, TabEnterSpace/başlık/checked/disabledbutton/liveRegion ve çizilmiş metin4.5/odak3 doğrulandı. Native48PNG390×844tamkaydırma; Root29benzersizoriginal açtı,19RAW eşitliği okunanlara doğrulandı. Root48yenioriginal açtı iddiası yok. J02J03J04 actual887×1774original Root karşılaştırıldı; transferlong ikinci parça alt içerik hizalanınca normal transfer parçayla RAW eşit.

## Hata ve dar onarım geçmişi

İlk format komutu uygulama gövdesindeki faz mesajında fazla kapanan parantezi yakaladı; parantez giderildi. Ekran/istek tutarlılık korumasının ilk patch'i yanlış constructor'a yerleşti; hemen source okunup LifecycleSnapshot'a taşındı, bu ara sürüm çalıştırılmadı veya kabul edilmedi. R1hedef20test:19PASS1FAIL gerçek mavi birincil odak kenarı kontrastı2.7166<3. Kabul edilmiş E1 birincilbeyaz/ikincilikoyu odak davranışı uygulamada kullanıldı; test eşiği gevşetilmedi. R2hedef20PASS; R3tam297PASS. Mevcutresponsive test anlamlı biçimde tümkaydırmaofset/bütünhedef52 denetimiyle güçlendirildi; R4tam297PASS/native1PASS/R2format32-0/analyze0. Bir format çağrısı shellcwd altında repo-relative yolu aradı ve dosya bulamadı; lib/test doğru bağıl yollarıyla format başarıyla tamamlandı. Özgün R1başarısız günlük korunur, ret veya fiziksel hata diye uydurulmaz.

## Yedi E10 tasarım kapısı

| Kapı | Gerçek karşılaştırma |
|---|---|
| Bütün ekran |48tamkaydırma parçası;29rootoriginal+19RAW eşit, son güvenli çıkış açık |
| Ekranlar arası |J02 seçilen işlemi gözden geçir, J03 kısmi kapsam/boşluk/iz, J04 silme kapsamı/bağımsızkayıt/alternatif/açıkonay; mevcut E1 çalışanDNA |
| Durum |28örnek:active/inactive/review/transferlong/deleteack/alternative/offline/missing/source-scope-stale-held-unknown-foreign/fieldprivate/handler/effect/busy/sent/failed/query/bareALLOW/received |
| Duyarlı |252gerçek düzen/620adım tümkaydırma/52hedef/fatalpointer; native390×844; gerçekdevice/window HELD |
| Erişilebilir |GerçekTabEnterSpace/header/checked/disabledbutton/liveRegion/metin4.5/odak3; OS/screenreader/darkmode HELD |
| Regresyon |Önceki277 aynı297koşudaPASS;50basepin/hamv78/eskiesasgövde/SDK/YAML/deps korunur |
| Kaynak/varyasyon |REF-LIFECYCLE-001/FAM07/J02J03J04 çalışma hiyerarşisi; DEC0053 sonraki şekil geçerli, fiyat/hukuk/modalite/token kararı yok |

Çalışan32/22/16/52/640 değerleri önceki kabul edilmiş E1 çalışmaDNA'sıdır; görselden yeni nihai token çıkarılmaz. Logo/ikon/font/router/modalite/nav/üretim/release HELD; nativeSDKRoboto testfontu nihaiürünfontu değildir. İnline localreview yeni route/modality kararı değildir.

## Bağımsız inceleme beklemede

17soru koddan önce sabit. Geçmişsiz gpt6luna/max yalnız48PNG/17soruyu okuyor. Henüz rapor/bağımsız kabul yok. AI ilkokuma insan/telefon/CON004closure değildir. Tekgörev/tekPR DEC0068; kullanıcı kabulü DEC0069 ve oturumdaki sürekli açık yetki. BirleşmemişDEC0070 otorite değildir. Bütün bağımsız kaynak hükmü ve aynı gerçekCI-T3; ayrıson6metadata/aynısonCI-T3; normalmerge/fetchedmain8 gereklidir. Ana100DONE106kalan206 korunur. E3R1REVIEW/E5IN_PROGRESS/Supabase47-57-59/RET97/runtime/kimlik/cihaz/yayın engelleri bu sunumla kapanmaz.

## Sabit kimlikler

KodLF 4f73d24e885e0ddabe43216d9deda9846c39e87636359152342f30d4ece94e5b; testLF a0eed838a07c788de75b84f6bb86726a695d45c5ecb255d464476ad3ee69b061;17soruLF 8149f48ef78635cf557ae29fc288e754f481e88bf34b6bd79ce2f30e4c69d228. Hamv78 210540bayt/RAW SHA256 345841ec2885e56a4bd7bcb36a56985f69c23598f66c0901c53242554b936e75.

## Native RAW kimlikler

- kavriva_e1014a_native_R1-manage-active-0.png / manage-active / RAW SHA256 d2b4066986605a544f741af54a7bf9c24194a56266bfcd7d5d01ed497f661000 / 76572bayt /390×844 /offset 0.0/end 272.0
- kavriva_e1014a_native_R1-manage-active-1.png / manage-active / RAW SHA256 537d1af400ca952617f5d8db34f166692ad0d1b9ad8c44dd4eed15559106fa00 / 68367bayt /390×844 /offset 272.0/end 272.0
- kavriva_e1014a_native_R1-manage-inactive-0.png / manage-inactive / RAW SHA256 0e42fe9b685cc5632efa2598aacc44d1d2193e53ef3d9372fc415869cebe400d / 76867bayt /390×844 /offset 0.0/end 272.0
- kavriva_e1014a_native_R1-manage-inactive-1.png / manage-inactive / RAW SHA256 8b8e170bc55c0f86b9c8c637520f5c064b5cab3dcf26efc25fe638b37321a81b / 68364bayt /390×844 /offset 272.0/end 272.0
- kavriva_e1014a_native_R1-deactivation-review-0.png / deactivation-review / RAW SHA256 c6746d7ede760419fa87393756bc77a1fc2c1fc64ba4c731dd26ca5191d7670b / 87067bayt /390×844 /offset 0.0/end 273.0
- kavriva_e1014a_native_R1-deactivation-review-1.png / deactivation-review / RAW SHA256 9c0f88be3d9903ecc0a0bd59fafc49169026ebae0a693d770a65cf832ddba430 / 79405bayt /390×844 /offset 273.0/end 273.0
- kavriva_e1014a_native_R1-reactivation-review-0.png / reactivation-review / RAW SHA256 e0386da7a2aa4945abcd728720047c08d1dd4618f4084bd5a0e137c621598a5b / 87557bayt /390×844 /offset 0.0/end 273.0
- kavriva_e1014a_native_R1-reactivation-review-1.png / reactivation-review / RAW SHA256 70f5f9c6adaaae41fa6446fe84b45b494a8db7d90fec2cecfc98dbcf4ce5dd61 / 79322bayt /390×844 /offset 273.0/end 273.0
- kavriva_e1014a_native_R1-transfer-0.png / transfer / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 454.0
- kavriva_e1014a_native_R1-transfer-1.png / transfer / RAW SHA256 fd9ef2d9c3019d8de333c3aa5fab9c43cff026c51d81c8312749029f082465cd / 79235bayt /390×844 /offset 454.0/end 454.0
- kavriva_e1014a_native_R1-transfer-long-0.png / transfer-long / RAW SHA256 2db88095c13be7597aefc399baa9309cff83dc65e549cb59de7651157fbf4ba1 / 82857bayt /390×844 /offset 0.0/end 546.0
- kavriva_e1014a_native_R1-transfer-long-1.png / transfer-long / RAW SHA256 fd9ef2d9c3019d8de333c3aa5fab9c43cff026c51d81c8312749029f082465cd / 79235bayt /390×844 /offset 546.0/end 546.0
- kavriva_e1014a_native_R1-delete-unacknowledged-0.png / delete-unacknowledged / RAW SHA256 b8a402fa20b56c918cb1a9f415d932050a29d347bc7d1d564751b542720f52ca / 85181bayt /390×844 /offset 0.0/end 297.0
- kavriva_e1014a_native_R1-delete-unacknowledged-1.png / delete-unacknowledged / RAW SHA256 eaf92c5e238be2918b4f77e92f0c0a602f2363d5ffeb0ff3e6b7aa0ba9b39d7b / 75845bayt /390×844 /offset 297.0/end 297.0
- kavriva_e1014a_native_R1-delete-acknowledged-0.png / delete-acknowledged / RAW SHA256 1a860a0a3076805cbac2fc2e1e684da1a8994784378cea2be3190526a8e942b2 / 85630bayt /390×844 /offset 0.0/end 212.0
- kavriva_e1014a_native_R1-delete-acknowledged-1.png / delete-acknowledged / RAW SHA256 88219a62b88cb5f6cea2a36629bf655c3e84cd3fad202399e37241a1a17df31f / 77228bayt /390×844 /offset 212.0/end 212.0
- kavriva_e1014a_native_R1-delete-alternative-0.png / delete-alternative / RAW SHA256 c6746d7ede760419fa87393756bc77a1fc2c1fc64ba4c731dd26ca5191d7670b / 87067bayt /390×844 /offset 0.0/end 358.0
- kavriva_e1014a_native_R1-delete-alternative-1.png / delete-alternative / RAW SHA256 d9abd842f179ea577872367bb86d1e8ad4983a9cb51d0ac9ec711c1d75e339d2 / 76402bayt /390×844 /offset 358.0/end 358.0
- kavriva_e1014a_native_R1-transfer-offline-0.png / transfer-offline / RAW SHA256 905f7a6d3ba1d41f84460a88304b2a3b216736a3ba35b7214f14c867ff01bbae / 84062bayt /390×844 /offset 0.0/end 601.0
- kavriva_e1014a_native_R1-transfer-offline-1.png / transfer-offline / RAW SHA256 da80d75bf0d7a6c27a43dc1c816da504f3cbb94ca77a8926f823471b67b97c62 / 75121bayt /390×844 /offset 601.0/end 601.0
- kavriva_e1014a_native_R1-delete-offline-0.png / delete-offline / RAW SHA256 1096d5c188c89d1a8d51e6e7cd22bb108849a4cc4879422ff1ece6cf4918563b / 87086bayt /390×844 /offset 0.0/end 359.0
- kavriva_e1014a_native_R1-delete-offline-1.png / delete-offline / RAW SHA256 eaf92c5e238be2918b4f77e92f0c0a602f2363d5ffeb0ff3e6b7aa0ba9b39d7b / 75845bayt /390×844 /offset 359.0/end 359.0
- kavriva_e1014a_native_R1-missing-0.png / missing / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-source-missing-0.png / source-missing / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-scope-missing-0.png / scope-missing / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-source-stale-0.png / source-stale / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-source-held-0.png / source-held / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-source-unknown-0.png / source-unknown / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-source-foreign-0.png / source-foreign / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-private-period-0.png / private-period / RAW SHA256 de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 / 27377bayt /390×844 /offset 0.0/end 0.0
- kavriva_e1014a_native_R1-no-handler-0.png / no-handler / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 539.0
- kavriva_e1014a_native_R1-no-handler-1.png / no-handler / RAW SHA256 9324f1506e12d0c7cae4603d0a96ff64cc351d9939d08196ff6c77ef723b281a / 75123bayt /390×844 /offset 539.0/end 539.0
- kavriva_e1014a_native_R1-operation-held-0.png / operation-held / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 539.0
- kavriva_e1014a_native_R1-operation-held-1.png / operation-held / RAW SHA256 da80d75bf0d7a6c27a43dc1c816da504f3cbb94ca77a8926f823471b67b97c62 / 75121bayt /390×844 /offset 539.0/end 539.0
- kavriva_e1014a_native_R1-delete-busy-0.png / delete-busy / RAW SHA256 1383e4a19f353a9c336980c67d0043acf33bfc87e268e8a49960a313c539c2f4 / 76604bayt /390×844 /offset 0.0/end 62.0
- kavriva_e1014a_native_R1-delete-busy-1.png / delete-busy / RAW SHA256 37b2acb90bbb9d15ca9d259388dafe397b3fb6b712e2f9740a1b63e0d33738fa / 71077bayt /390×844 /offset 62.0/end 62.0
- kavriva_e1014a_native_R1-transfer-sent-0.png / transfer-sent / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 452.0
- kavriva_e1014a_native_R1-transfer-sent-1.png / transfer-sent / RAW SHA256 48ccdf12d1d09696205d5f3a7d9162be683a7cef8728bd53d5c2c9cce2bb6ae0 / 78837bayt /390×844 /offset 452.0/end 452.0
- kavriva_e1014a_native_R1-delete-failed-0.png / delete-failed / RAW SHA256 1e013964fcbf15bebd183dbc3d3c2e03edc8366ac9f9ad1bebcff0c80f4b0eab / 82028bayt /390×844 /offset 0.0/end 126.0
- kavriva_e1014a_native_R1-delete-failed-1.png / delete-failed / RAW SHA256 a080ed8da38ddf2922de2d1b67533fe8832e11b910b982d99d9abfa24980e500 / 75458bayt /390×844 /offset 126.0/end 126.0
- kavriva_e1014a_native_R1-transfer-unknown-0.png / transfer-unknown / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 516.0
- kavriva_e1014a_native_R1-transfer-unknown-1.png / transfer-unknown / RAW SHA256 b1b4531003fab245500d0c3f887972c153fb90c7fd985f628a4b489632a46923 / 77243bayt /390×844 /offset 516.0/end 516.0
- kavriva_e1014a_native_R1-transfer-query-0.png / transfer-query / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 516.0
- kavriva_e1014a_native_R1-transfer-query-1.png / transfer-query / RAW SHA256 4baa1fdb0364e93769086ea96f9d079896f593ef958a3d75c46b4b93b9bc2bb7 / 75233bayt /390×844 /offset 516.0/end 516.0
- kavriva_e1014a_native_R1-delete-bare-allow-0.png / delete-bare-allow / RAW SHA256 1e013964fcbf15bebd183dbc3d3c2e03edc8366ac9f9ad1bebcff0c80f4b0eab / 82028bayt /390×844 /offset 0.0/end 126.0
- kavriva_e1014a_native_R1-delete-bare-allow-1.png / delete-bare-allow / RAW SHA256 a080ed8da38ddf2922de2d1b67533fe8832e11b910b982d99d9abfa24980e500 / 75458bayt /390×844 /offset 126.0/end 126.0
- kavriva_e1014a_native_R1-transfer-received-0.png / transfer-received / RAW SHA256 d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf / 83391bayt /390×844 /offset 0.0/end 475.0
- kavriva_e1014a_native_R1-transfer-received-1.png / transfer-received / RAW SHA256 2ca9325a14f50757e5d7f65794751a9cc245d19f309d2a8457e3aeb3140324c7 / 77356bayt /390×844 /offset 475.0/end 475.0

## Ham günlükler

- kavriva_e1014a_locked_pub.log / RAW SHA256 0f6f606fe6106606054e3e430c19492c9b51de46c4a608eef235b1e595dc13d4 / 287bayt
- kavriva_e1014a_native_R1.log / RAW SHA256 f1f1ec742fe7502d74ddbfb4ad5b59e4d1b678530a8d20c50695ff072b3f8bad / 546bayt
- kavriva_e1014a_R1_analyze.log / RAW SHA256 96ca7b81931b25fe0c5a184f87798a2456a80d78dc5c940d93b77fd2e7dee7e9 / 98bayt
- kavriva_e1014a_R1_target.log / RAW SHA256 11fe3bb5288bf49d104856e5e736ea6932392df2e4cc3f65f4489ddd482d9972 / 4154bayt
- kavriva_e1014a_R2_analyze.log / RAW SHA256 ce80326d9bd8e03a6c128f3621cdfa9f62900db13372bb67c5b26a23996e278a / 98bayt
- kavriva_e1014a_R2_format.log / RAW SHA256 c4ed0b6b7bdeff42e5b06e1448e79f10eb20d925214034282186e7521f52875a / 49bayt
- kavriva_e1014a_R2_target.log / RAW SHA256 edfb16089b37180787a64abdae102871d6e0bf2a21d12f1ee3bb92e4ac05b7d3 / 2088bayt
- kavriva_e1014a_R3_full_tests.log / RAW SHA256 9fde3b4fe0e818e8de714103700053233b8b18620fc0044dbc5a1ac29408740a / 65547bayt
- kavriva_e1014a_R4_full_tests.log / RAW SHA256 f475a90ef0dcf9b98aa9068430924295ebd5f1a4c3ae95fea1eaf10da47d8650 / 65412bayt

## Pinned kaynak görseller

[
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1014a_readahead_J02-SCR-031-Motorcycle-Lifecycle.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/J02-SCR-031-Motorcycle-Lifecycle.png",
    "sha256": "57f4da88271e52c13f98f2f0e274de2562fe71e879582db5c6f0444bd814b0c1",
    "bytes": 1676679,
    "rootActualOpened": true,
    "dimensions": [
      887,
      1774
    ]
  },
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1014a_readahead_J03-SCR-032-Transfer-Scope-Coverage.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/J03-SCR-032-Transfer-Scope-Coverage.png",
    "sha256": "960143ad73f32168cbb28de3b45b0415b111dff7a5e314f45b1553d3aeec50a8",
    "bytes": 1779165,
    "rootActualOpened": true,
    "dimensions": [
      887,
      1774
    ]
  },
  {
    "path": "C:\\Users\\Xpike\\AppData\\Local\\Temp\\kavriva_e1014a_readahead_J04-SCR-033-Delete-Scope-Warning.png",
    "source": "fa914f013fdcd032faed876689092da245989459:refernces/J04-SCR-033-Delete-Scope-Warning.png",
    "sha256": "ce436058e2f6c8ddc310121252da2e4b3cfa07418ddb89a4386553fef8f2f1e2",
    "bytes": 1995164,
    "rootActualOpened": true,
    "dimensions": [
      887,
      1774
    ]
  }
]


`vault/PROFILES/lifecycle-render.md`; `vault/PACKS/P-E1-014a.md`; `vault/REGISTRY/T-E1-014a.md`; `vault/EVIDENCE/E-DEV-112.md`.

## R1 graph bulgusu ve kaynaklı düzeltme

İlk run_all 12kontrolden check_links görevde referanssızHELD ve check_conformance yeni serbest GATE verdict metnini kapalı küme dışında reddetti. ÜretimHELD silinmedi: task’a EDEV112/pack/E3R1/E5 kaynak linkleri eklendi; evidence gate_verdict RECORDED ile başlayan kaynaklı kapı değerlendirmesi olarak yazıldı. Checker/eşik değişmedi. İlk başarısız günlük RAW SHA256 1349e9e95970f21d14e285017798e0b73638ca9236c55654b5f9ea1dbcfea147.

## Bağımsız geçmişsiz R1 ilk ekran okuması

/root/e1014a_first_reading; istenen gpt-6-luna/max; yalnız48orijinalPNG/17soru, kod/plan/kanıt/önceki cevap okunmadı. Root tam3727bayt raporu okudu; RAW SHA256 3420814a18da4d712b212eda8bcc2ddec6d2d07ce88a4f9c2dfca40226becbbc. On yedi yanıt anlamca doğru, UNCLEAR yok/ALL CLEAR. İnsan/telefon/üretim/hukuk/CON004closure değildir. Bütün kaynak/T3 hükmü henüz yok.

### Özgün tam rapor

Kavriva E01-014a — bağımsız ilk ekran okuması (R1)
Tarih: 2026-10-07

İnceleme kapsamı
Manifestte listelenen 48 PNG'nin 48'i de tools.view_image ile orijinal boyutta (390 × 844) açıldı; her görüntü image() ile inceleme bağlamına aktarıldı. Görseller 28 duruma aitti. Aşağıdaki yanıtlar yalnız ekrandaki görünür anlamı kendi sözlerimle özetler.
İstenen ayar: gpt-6-luna / max

Yanıtlar

1. Hayır. “Etkin değil” yapmak silmek değildir; geçmiş, kanıtlar ve düzeltmeler saklanır. Yeniden etkinleştirme aynı geçmişi geri açar.

2. Hayır. Geçmişi aktarmak kaydın doğruluğunu veya bakımın gerçekten doğru yapıldığını onaylamaz.

3. Hayır, motosikletin tüm geçmişi aktarılmaz; yalnız seçilen dönem aktarım kapsamındadır. Önceki seçilmemiş sahiplik dönemi aktarılmaz. Seçili dönemde eksik olan kayıtlar da tamamlanmış bakım sayılmaz.

4. Özel notlar ve hassas görseller aktarıma dahil değildir; aktarılmayan özel içerik yeni sahibin geçmişinde görünmez.

5. Kaynak ve kanıt bilgisi, önceki katkı ve atıflar, düzeltmeler ve uyuşmazlıklar korunur. Önceki sahiplerin katkı izleriyle sahiplik dönemleri ve boşlukların kaynakları ayrı ayrı izlenir.

6. Hayır. Başkalarının bağımsız kanıtları, önceden aktarılmış kopyalar ve geçmiş atıfları silme isteğiyle otomatik olarak kaldırılmaz.

7. Önce silinecek kapsamı kontrol et: motosiklete ait bilgiler, kendi notların ve görsellerin, bağlı hatırlatmalar ve yalnız sana ait uygulanabilir kayıt kopyaları. Bu kapsamı ve geri alınamayabileceğini açıkça onayladıktan sonra yalnız bu kapsam için silme isteği gönderilebilir. Bağımsız kayıtlar ile önceki kopya ve atıfların kapsam dışında kaldığı belirtiliyor.

8. Geçmişi korumak için motosikleti etkin değil yapabilirsin. Bu seçenek silme değildir; geçmiş ve kanıtlar korunur.

9. Hayır, bunlar paket değişikliğine bağlanmıyor: geçmiş, bağımsız kanıtlar ve düzeltmeler korunuyor; kritik düzeltmeler ile başlamış işin güvenli dönüşü paket değişince kilitlenmiyor. Yeniden etkinleştirince güncel kilometre, kullanım ve fiziksel durum yeniden değerlendirilmeli; yarım kalan iş eski onaylarla devam etmez.

10. Hayır. Yeniden etkinleştirmek fiziksel uygunluğu kendiliğinden doğrulamaz; güncel kilometre, kullanım ve fiziksel durum yeniden değerlendirilmelidir.

11. Bir motosiklet ücretsizdir. Abonelikle toplam üç motosiklet eklenebilir. Tam rehber aynı anda yalnız seçili bir motosiklette açılır.

12. Hayır. Başka motosiklet seçmek mevcut hakkı taşır; üst üste yeni hak eklemez.

13. Hayır. Güncel kapsam veya erişim bilgisi yoksa özel ayrıntılar kapalıdır; silme ya da aktarım isteği gönderilemez.

14. Hayır. Çevrimdışıyken yeni istek gönderilemez. Sonuç kesinleşmemişse aynı isteği yeniden göndermek yerine aynı isteğin sonucunu sorgulamak gerekir.

15. Hayır. İsteğin alındığı bildirimi silmenin, aktarımın veya etkinlik değişikliğinin tamamlandığını kanıtlamaz.

16. Hayır. Bu ekranlardan saklama, yedeklerin silinmesi veya hukuki sonuçlar hakkında kesin sonuç çıkarılamaz; bu konuların doğrulanmadığı açıkça belirtiliyor.

17. Hayır. Aktarım kapsamını onaylamak yalnız kapsamı onaylama isteğini hazırlar. Hedef kişi sonraki adımda seçilir ve bu ekrandaki onay aktarımı tamamlamaz.

Belirsizlik ve hüküm
UNCLEAR: Yok.
ALL CLEAR — 17 sorunun tamamı, ekrandaki anlamdan yardım almadan yanıtlanabildi.

Bu, yalnızca ekranların AI tarafından yapılan ilk okumasıdır; insan, telefon, üretim sistemi veya hukuki doğrulama değildir.


### Özgün RAW Base64

```base64
S2F2cml2YSBFMDEtMDE0YSDigJQgYmHEn8SxbXPEsXogaWxrIGVrcmFuIG9rdW1hc8SxIChSMSkKVGFyaWg6IDIwMjYtMTAtMDcKCsSwbmNlbGVtZSBrYXBzYW3EsQpNYW5pZmVzdHRlIGxpc3RlbGVuZW4gNDggUE5HJ25pbiA0OCdpIGRlIHRvb2xzLnZpZXdfaW1hZ2UgaWxlIG9yaWppbmFsIGJveXV0dGEgKDM5MCDDlyA4NDQpIGHDp8SxbGTEsTsgaGVyIGfDtnLDvG50w7wgaW1hZ2UoKSBpbGUgaW5jZWxlbWUgYmHEn2xhbcSxbmEgYWt0YXLEsWxkxLEuIEfDtnJzZWxsZXIgMjggZHVydW1hIGFpdHRpLiBBxZ9hxJ/EsWRha2kgeWFuxLF0bGFyIHlhbG7EsXogZWtyYW5kYWtpIGfDtnLDvG7DvHIgYW5sYW3EsSBrZW5kaSBzw7Z6bGVyaW1sZSDDtnpldGxlci4KxLBzdGVuZW4gYXlhcjogZ3B0LTYtbHVuYSAvIG1heAoKWWFuxLF0bGFyCgoxLiBIYXnEsXIuIOKAnEV0a2luIGRlxJ9pbOKAnSB5YXBtYWsgc2lsbWVrIGRlxJ9pbGRpcjsgZ2XDp21pxZ8sIGthbsSxdGxhciB2ZSBkw7x6ZWx0bWVsZXIgc2FrbGFuxLFyLiBZZW5pZGVuIGV0a2lubGXFn3Rpcm1lIGF5bsSxIGdlw6dtacWfaSBnZXJpIGHDp2FyLgoKMi4gSGF5xLFyLiBHZcOnbWnFn2kgYWt0YXJtYWsga2F5ZMSxbiBkb8SfcnVsdcSfdW51IHZleWEgYmFrxLFtxLFuIGdlcsOnZWt0ZW4gZG/En3J1IHlhcMSxbGTEscSfxLFuxLEgb25heWxhbWF6LgoKMy4gSGF5xLFyLCBtb3Rvc2lrbGV0aW4gdMO8bSBnZcOnbWnFn2kgYWt0YXLEsWxtYXo7IHlhbG7EsXogc2XDp2lsZW4gZMO2bmVtIGFrdGFyxLFtIGthcHNhbcSxbmRhZMSxci4gw5ZuY2VraSBzZcOnaWxtZW1pxZ8gc2FoaXBsaWsgZMO2bmVtaSBha3RhcsSxbG1hei4gU2XDp2lsaSBkw7ZuZW1kZSBla3NpayBvbGFuIGthecSxdGxhciBkYSB0YW1hbWxhbm3EscWfIGJha8SxbSBzYXnEsWxtYXouCgo0LiDDlnplbCBub3RsYXIgdmUgaGFzc2FzIGfDtnJzZWxsZXIgYWt0YXLEsW1hIGRhaGlsIGRlxJ9pbGRpcjsgYWt0YXLEsWxtYXlhbiDDtnplbCBpw6dlcmlrIHllbmkgc2FoaWJpbiBnZcOnbWnFn2luZGUgZ8O2csO8bm1lei4KCjUuIEtheW5hayB2ZSBrYW7EsXQgYmlsZ2lzaSwgw7ZuY2VraSBrYXRrxLEgdmUgYXTEsWZsYXIsIGTDvHplbHRtZWxlciB2ZSB1eXXFn21hemzEsWtsYXIga29ydW51ci4gw5ZuY2VraSBzYWhpcGxlcmluIGthdGvEsSBpemxlcml5bGUgc2FoaXBsaWsgZMO2bmVtbGVyaSB2ZSBib8WfbHVrbGFyxLFuIGtheW5ha2xhcsSxIGF5csSxIGF5csSxIGl6bGVuaXIuCgo2LiBIYXnEsXIuIEJhxZ9rYWxhcsSxbsSxbiBiYcSfxLFtc8SxeiBrYW7EsXRsYXLEsSwgw7ZuY2VkZW4gYWt0YXLEsWxtxLHFnyBrb3B5YWxhciB2ZSBnZcOnbWnFnyBhdMSxZmxhcsSxIHNpbG1lIGlzdGXEn2l5bGUgb3RvbWF0aWsgb2xhcmFrIGthbGTEsXLEsWxtYXouCgo3LiDDlm5jZSBzaWxpbmVjZWsga2Fwc2FtxLEga29udHJvbCBldDogbW90b3Npa2xldGUgYWl0IGJpbGdpbGVyLCBrZW5kaSBub3RsYXLEsW4gdmUgZ8O2cnNlbGxlcmluLCBiYcSfbMSxIGhhdMSxcmxhdG1hbGFyIHZlIHlhbG7EsXogc2FuYSBhaXQgdXlndWxhbmFiaWxpciBrYXnEsXQga29weWFsYXLEsS4gQnUga2Fwc2FtxLEgdmUgZ2VyaSBhbMSxbmFtYXlhYmlsZWNlxJ9pbmkgYcOnxLFrw6dhIG9uYXlsYWTEsWt0YW4gc29ucmEgeWFsbsSxeiBidSBrYXBzYW0gacOnaW4gc2lsbWUgaXN0ZcSfaSBnw7ZuZGVyaWxlYmlsaXIuIEJhxJ/EsW1zxLF6IGthecSxdGxhciBpbGUgw7ZuY2VraSBrb3B5YSB2ZSBhdMSxZmxhcsSxbiBrYXBzYW0gZMSxxZ/EsW5kYSBrYWxkxLHEn8SxIGJlbGlydGlsaXlvci4KCjguIEdlw6dtacWfaSBrb3J1bWFrIGnDp2luIG1vdG9zaWtsZXRpIGV0a2luIGRlxJ9pbCB5YXBhYmlsaXJzaW4uIEJ1IHNlw6dlbmVrIHNpbG1lIGRlxJ9pbGRpcjsgZ2XDp21pxZ8gdmUga2FuxLF0bGFyIGtvcnVudXIuCgo5LiBIYXnEsXIsIGJ1bmxhciBwYWtldCBkZcSfacWfaWtsacSfaW5lIGJhxJ9sYW5txLF5b3I6IGdlw6dtacWfLCBiYcSfxLFtc8SxeiBrYW7EsXRsYXIgdmUgZMO8emVsdG1lbGVyIGtvcnVudXlvcjsga3JpdGlrIGTDvHplbHRtZWxlciBpbGUgYmHFn2xhbcSxxZ8gacWfaW4gZ8O8dmVubGkgZMO2bsO8xZ/DvCBwYWtldCBkZcSfacWfaW5jZSBraWxpdGxlbm1peW9yLiBZZW5pZGVuIGV0a2lubGXFn3RpcmluY2UgZ8O8bmNlbCBraWxvbWV0cmUsIGt1bGxhbsSxbSB2ZSBmaXppa3NlbCBkdXJ1bSB5ZW5pZGVuIGRlxJ9lcmxlbmRpcmlsbWVsaTsgeWFyxLFtIGthbGFuIGnFnyBlc2tpIG9uYXlsYXJsYSBkZXZhbSBldG1lei4KCjEwLiBIYXnEsXIuIFllbmlkZW4gZXRraW5sZcWfdGlybWVrIGZpemlrc2VsIHV5Z3VubHXEn3Uga2VuZGlsacSfaW5kZW4gZG/En3J1bGFtYXo7IGfDvG5jZWwga2lsb21ldHJlLCBrdWxsYW7EsW0gdmUgZml6aWtzZWwgZHVydW0geWVuaWRlbiBkZcSfZXJsZW5kaXJpbG1lbGlkaXIuCgoxMS4gQmlyIG1vdG9zaWtsZXQgw7xjcmV0c2l6ZGlyLiBBYm9uZWxpa2xlIHRvcGxhbSDDvMOnIG1vdG9zaWtsZXQgZWtsZW5lYmlsaXIuIFRhbSByZWhiZXIgYXluxLEgYW5kYSB5YWxuxLF6IHNlw6dpbGkgYmlyIG1vdG9zaWtsZXR0ZSBhw6fEsWzEsXIuCgoxMi4gSGF5xLFyLiBCYcWfa2EgbW90b3Npa2xldCBzZcOnbWVrIG1ldmN1dCBoYWtrxLEgdGHFn8Sxcjsgw7xzdCDDvHN0ZSB5ZW5pIGhhayBla2xlbWV6LgoKMTMuIEhhecSxci4gR8O8bmNlbCBrYXBzYW0gdmV5YSBlcmnFn2ltIGJpbGdpc2kgeW9rc2Egw7Z6ZWwgYXlyxLFudMSxbGFyIGthcGFsxLFkxLFyOyBzaWxtZSB5YSBkYSBha3RhcsSxbSBpc3RlxJ9pIGfDtm5kZXJpbGVtZXouCgoxNC4gSGF5xLFyLiDDh2V2cmltZMSxxZ/EsXlrZW4geWVuaSBpc3RlayBnw7ZuZGVyaWxlbWV6LiBTb251w6cga2VzaW5sZcWfbWVtacWfc2UgYXluxLEgaXN0ZcSfaSB5ZW5pZGVuIGfDtm5kZXJtZWsgeWVyaW5lIGF5bsSxIGlzdGXEn2luIHNvbnVjdW51IHNvcmd1bGFtYWsgZ2VyZWtpci4KCjE1LiBIYXnEsXIuIMSwc3RlxJ9pbiBhbMSxbmTEscSfxLEgYmlsZGlyaW1pIHNpbG1lbmluLCBha3RhcsSxbcSxbiB2ZXlhIGV0a2lubGlrIGRlxJ9pxZ9pa2xpxJ9pbmluIHRhbWFtbGFuZMSxxJ/EsW7EsSBrYW7EsXRsYW1hei4KCjE2LiBIYXnEsXIuIEJ1IGVrcmFubGFyZGFuIHNha2xhbWEsIHllZGVrbGVyaW4gc2lsaW5tZXNpIHZleWEgaHVrdWtpIHNvbnXDp2xhciBoYWtrxLFuZGEga2VzaW4gc29udcOnIMOnxLFrYXLEsWxhbWF6OyBidSBrb251bGFyxLFuIGRvxJ9ydWxhbm1hZMSxxJ/EsSBhw6fEsWvDp2EgYmVsaXJ0aWxpeW9yLgoKMTcuIEhhecSxci4gQWt0YXLEsW0ga2Fwc2FtxLFuxLEgb25heWxhbWFrIHlhbG7EsXoga2Fwc2FtxLEgb25heWxhbWEgaXN0ZcSfaW5pIGhhesSxcmxhci4gSGVkZWYga2nFn2kgc29ucmFraSBhZMSxbWRhIHNlw6dpbGlyIHZlIGJ1IGVrcmFuZGFraSBvbmF5IGFrdGFyxLFtxLEgdGFtYW1sYW1hei4KCkJlbGlyc2l6bGlrIHZlIGjDvGvDvG0KVU5DTEVBUjogWW9rLgpBTEwgQ0xFQVIg4oCUIDE3IHNvcnVudW4gdGFtYW3EsSwgZWtyYW5kYWtpIGFubGFtZGFuIHlhcmTEsW0gYWxtYWRhbiB5YW7EsXRsYW5hYmlsZGkuCgpCdSwgeWFsbsSxemNhIGVrcmFubGFyxLFuIEFJIHRhcmFmxLFuZGFuIHlhcMSxbGFuIGlsayBva3VtYXPEsWTEsXI7IGluc2FuLCB0ZWxlZm9uLCDDvHJldGltIHNpc3RlbWkgdmV5YSBodWt1a2kgZG/En3J1bGFtYSBkZcSfaWxkaXIuCg==
```

## Güncel kayıt kontrolü ve bağımsız ilk okuma

R2run_all 12kontrol/42koruma-iztesti PASS/worst0; RAW SHA256 50a5a5d321e31b2d12f1a8ed735488626bc6ffd8a92ab24acefa2b64817220f9. İlkR1graphFAIL ve onarımı EDEV112 içinde korunur. Geçmişsiz R1ilkoku /root/e1014a_first_reading 48original/17soru ALL CLEAR; Root özgün3727bayt raporun tamamını okudu, RAW SHA256 3420814a18da4d712b212eda8bcc2ddec6d2d07ce88a4f9c2dfca40226becbbc. Bütün bağımsız kaynakGATE hükmü ve aynıCI-T3 henüz yok; görevREVIEW,100DONE106kalan206.

## Tek görev PR114 kaynak adayı

[PR114](https://github.com/xpike-dgm/kavriva-app/pull/114) OPEN/DRAFT/t3-privileged; ilk hazırlanmışd1e1373d28a937a1e962bbbdccd4798fe0256410 kabul kaynağı değildir. Etiket GitHubdan doğrulandıktan sonra bu kaynak kaydı eklenir; gerçek kaynakCI-T3 ayrı başta toplanacak. Bağımsız bütün GATE hükmü henüz yok; taskREVIEW/ana100 korunur.


## Bağımsız bütün kaynak R1 reddi ve F-01 kodöncesi düzeltme kapsamı

2026-10-07 /root/e1014a_whole_review; istenen gpt-6-luna/max, geçmişsiz bağımsız inceleme. Kaynak f9c7eb7db299d0653b55a5e44d4f2deb4b5d1cfa, PR114. Hüküm CHANGES REQUESTED; tek kabul engeli F-01: alternatif SCR031 seçimi dış üreticiye yeni işlem bağlamı talebi iletmiyor. Root özgün raporun tamamını okudu; RAW 11372bayt SHA256 74cf98c0b0bf01dab42c554e3613bba0079ef094ab69f43db4b85e6410b68397. Önceki kaynak16CI/gerçek PR-T3 yeşil olması bu reddi kapatmaz. Ana100DONE106kalan206; görev CHANGES_REQUESTED.

Dar düzeltme önceden tanımlanır: aynı14adres/50tabanpin/17soru korunur. Yeni yalnız-okuma bağlam talebi niyeti, seçilen işlemi mevcut scope/request/plan subject ile dış üreticiye iletir; mutasyon veya yeni yetki üretmez. Mevcut işlemden farklı seçimde yeni güncel bağlam gelene kadar mutasyon kapalıdır. Talep callback'i eski scope/request/plan/phase/seçim, kaybolmuş okuma, offline veya eksik handler altında çalışamaz; aynı bağlam/seçim için çift talep engellenir. Silme ekranındaki koruyan alternatif de kendi pasiflik bağlamını ister. Eşleşen yeni request/operation ve bütün güncel okuma/altı etki bağı gelmeden işlem açılmaz; yeni bağlam açık silme onayını sıfırlar. Eksik/eski/yabancı yeni bağlam kapalı kalır. Testler gerçek seçim→talep→dışarıdan yeni bağlam→ayrı açık işlem niyetini ve eski callback/çift talep/handler yok negatiflerini göstermelidir. Kaynak/PNG/ilkoku ve aynı-yeni-head CI/T3 sonrası taze bağımsız bütün inceleme gerekir.

Sorgu kilidi ikinci ret bulgusu değildir: bağımsız rapor mevcut tek-sorgu sözleşmesini açıkça korur. Belirsiz sonucun gerçek üreticide çözülmesi kanıtlanmamış üretim recovery sınırıdır; yeniden sorgu/resend protokolü bu F-01 düzeltmesinde genişletilmez. Gerçek lifecycle writer/kimlik/yetki/hukuk/saklama/yedek/cihaz/yayın HELD kalır; SCR037 ayrı görevdir.

### Özgün R1 bütün rapor — tam metnin HTML karakter kodlaması

<pre>
T-E1-014a — Bağımsız bütün-kaynak incelemesi
Tarih: 2026-10-07

HÜKÜM: CHANGES REQUESTED — GATE’in sınırlı sunum kabulü şu kaynakta henüz karşılanmıyor.

Hüküm, aşağıdaki SCR031 işlem-seçimi/bağlam geçişi bulgusuna dayanır. Bu, gerçek lifecycle writer/auth/legal/retention/backup veya cihaz kanıtı istemek değildir. O üretim katmanları plan ve kaynakta HELD kalır; bu inceleme onları kapatmaz. Kaynakta güvensiz bir silme/aktarım yetkisi açılmıyor; engel, kullanıcının gösterilen alternatif işlemi yeni ve güncel bağlama ulaştıramamasıdır.

1. İnceleme sabitleri ve sınır

- PR: https://github.com/xpike-dgm/kavriva-app/pull/114 — açık ve draft; kaynak head &#96;f9c7eb7db299d0653b55a5e44d4f2deb4b5d1cfa&#96;.
- Karşılaştırma tabanı: &#96;1d113afae5bfeca7626d4ca1fc7b333effeace6e&#96;.
- Plan kaynağı: &#96;C:/Users/Xpike/Desktop/Kavriva-plan&#96;, yalnız &#96;fa914f013fdcd032faed876689092da245989459:&lt;path&gt;&#96; blob’ları. Çalışma ağacındaki sonraki, birleşmemiş DEC0070 kullanılmadı.
- App checkout: &#96;C:/Users/Xpike/.codex/worktrees/e4-required-auto-transfer/kavriva-app&#96;; &#96;HEAD&#96; tam kaynak SHA’sı ve çalışma ağacı temiz.
- Taban→kaynak diff’i tam 14 izinli dosya. SCR008, önceki diagnosis/history/dispute/correction/SDK/dependency/YAML/public-contract içerikleri değişmemiş.
- Sınır ve kaynaklar: &#96;vault/REGISTRY/T-E1-014a.md&#96;, &#96;vault/PACKS/P-E1-014a.md&#96;, &#96;vault/PROFILES/lifecycle-render.md&#96;, &#96;vault/EVIDENCE/E-DEV-112.md&#96;, &#96;vault/EVIDENCE/E-DEV-111.md&#96;, &#96;vault/INVENTORIES/E10-GOVERNED-PATHS.md&#96;, &#96;vault/EVIDENCE/SNAPSHOTS/E-DEV-111-E10-GOVERNED-PATHS-FOR-T-E1-014a.md.snapshot&#96;, &#96;.github/workflows/CI_PLAN.md&#96;, &#96;modules/e01-app/MANIFEST.md&#96;, &#96;vault/INDEX/registry.json&#96;, &#96;vault/INDEX/routing.json&#96;, &#96;modules/e01-app/internal/shell/lib/lifecycle.dart&#96;, &#96;modules/e01-app/internal/shell/test/lifecycle_test.dart&#96;, &#96;modules/e01-app/internal/shell/test/fixtures/lifecycle_reading_questions.json&#96;.
- Tamper/custody doğrulaması: 50 base pinin Git blob SHA’ları kabul edilmiş base ile eşleşiyor; kaynak committe 44 pin aynı, yalnız altı kayıt/girdi dosyası değişmiş (EDEV111, inventory, manifest, CI_PLAN, registry, routing). Ham v78 inventory snapshot base inventory blob’uyla byte-byte aynı: 210,540 bayt, SHA-256 &#96;345841ec2885e56a4bd7bcb36a56985f69c23598f66c0901c53242554b936e75&#96;. Kaynak diff’inde v79 inventory ve 104 üretilmiş kayıt adayı bulunması tek başına DONE veya gate kabulü değildir.

2. Kanonik kabul yöntemi

Bu iş SIMULATION değildir. Plan &#96;ACCEPTANCE_MATRIX.md&#96; doğrulama atamasında F1.7.1, FL1.7.1 ve T-E1-014a için GATE / HELD-acceptance evaluation der. &#96;TASK_INDEX.md&#96; T-E1-014a kapsamı SCR031/032/033, C1.7/F1.7.1, SCR008 hariç, “States shown” ve DEC0053 şeklidir. Eski matriks &#96;NONE&#96; satırı ya da önceki görev yöntemi bu atamayı değiştirmez.

DEC0053 sabit şekli ekranda doğru: bir ücretsiz motosiklet; abonelikle toplam üç; tam rehber aynı anda bir seçili motosiklette, başka motosiklete taşınır ve haklar birikmez. Fiyat, paket adı, dönem ve değiştirme kuralı HELD. SCR008’in kapsam dışında bırakıldığı ve önceki app contract’larının değişmediği doğrulandı.

3. Kabul engeli

F-01 — SCR031’de alternatif seçimi güncel işlem bağlamına taşıyan yol yok.

&#96;modules/e01-app/internal/shell/lib/lifecycle.dart:219-222&#96; yerel seçimi daima &#96;snapshot.operation&#96; değerinden başlatıyor. SCR031’deki “Etkin değil yap / Geçmişi aktar / Motosikleti sil” düğmeleri yalnız yerel &#96;selected&#96; değerini değiştiriyor (&#96;:409-454&#96;); “Seçilen işlemi gözden geçir” ekranı yerel olarak açıyor, fakat &#96;onIntent&#96; çağırmıyor. &#96;LifecycleAction&#96;/&#96;LifecycleIntent&#96; yalnız işlem etkisi, aynı-istek reconcile, destek ve çıkış taşıyor (&#96;:23-31&#96;, &#96;:185-198&#96;, &#96;:590-603&#96;); yeni işlem için güncel okuma/kapsam talebi yok.

Buna karşılık her gerçek işlem için &#96;_canSend&#96; &#96;selected == s.operation&#96; şartını arıyor (&#96;:256-269&#96;). Bu, başka işlemin mevcut plan/request yetkisini ödünç almamasını doğru biçimde sağlıyor; ancak kullanıcı mevcut &#96;deactivate&#96; bağlamında “Geçmişi aktar” ya da “Motosikleti sil” seçip inceleme ekranını açınca hedef işlem gönderilemiyor. Widget dışındaki üreticiye hangi işlemin seçildiği de iletilmiyor. &#96;test/lifecycle_test.dart:423-432&#96; bu durumu doğrudan doğruluyor: transfer seçilip gözden geçiriliyor, &#96;calls&#96; boş kalıyor ve kapsam onayı callback’i null. Eşleşen &#96;operation&#96; ile dışarıdan verilmiş transfer/delete snapshot’ı testleri (:434-459, :463-480) ayrı ekranın çalışabildiğini gösteriyor; fakat kullanıcı seçiminden o yeni bağlama ulaşan bir yol göstermiyor. Native &#96;operation-held&#96; görüntüsünde ana düğme kapalı, yardım/çıkış açık ve “bu işlem için güncel kapsam…” yazıyor.

Bu güvenli fail-closed davranış tek başına yeterli kabul kanıtı değil: ekranda etkin seçim ve “gözden geçir” ana eylemi sunuluyor, ancak kullanıcının seçtiği diğer SCR031 akışına devam edebilmesi için gerekli bağlam talebi bulunmuyor. Bunu gerçek yetki/işlem uygulamadan çözmek mümkün: seçimi dış üreticiye ileten, yalnız yeni güncel bağlam isteyen bir niyet/arayüz veya bu bağlam hazır olana kadar seçeneği gerçekten kullanılamaz kılan açık ürün davranışı gerekir. Mevcut kaynak bunlardan hiçbirini yapmıyor. Bu nedenle sınırlı ekran/sunum kabulü de henüz tam değil.

4. Aynı-istek kilidi ve unknown durumu

Mevcut exact request/scope guard ve altı ayrı effect boyutu güvenli: alan/subject/scope/operation/phase değişiminde eski callback güncel izni ödünç almıyor; delete ayrı açık onay istiyor; gönderim ve reconcile aynı widget örneğinde request başına bir kez kilitleniyor. Failed/unknown/kanıtsız-received durumunda yalnız aynı-request reconcile callback’i açılıyor. Bu davranış testlerde, aynı request’te plan değişince ikinci query’yi kapatarak kasıtlı olarak korunmuş (&#96;test/lifecycle_test.dart:781-818&#96;).

Sınırlama: query bir kez işaretlendikten sonra aynı request hâlâ belirsizse yeni query kapalı kalıyor ve ekran “sonuç sorgulanıyor” metnini kullanıyor (&#96;lifecycle.dart:260&#96;, &#96;:541-548&#96;). Test/ürün sözleşmesi bunu tek-sorgu kilidi olarak tanımlıyor; ben bu incelemede yeni query veya resend talebi önermiyorum. Ancak bu kanıt yalnız bir reconcile niyetinin gönderilebildiğini gösterir; belirsiz sonucun gerçek üreticide çözüldüğünü ya da tekrar-sorgu davranışını kanıtlamaz. Bu davranış üretim recovery’si olarak sunulmamalıdır.

5. Kaynak ve ekran içeriği — geçen kontroller

- &#96;BR103&#96;: pasiflik silme değildir; geçmiş/kanıt/düzeltme korunur, yeniden etkinleşme fiziksel uygunluk kanıtı sayılmaz.
- &#96;BR111&#96;: yalnız kullanıcının kendi kaldırılabilir kapsamı; bağımsız kanıtlar, aktarılmış kopyalar ve diğer kişilerin kayıtları otomatik silinmez. Saklama/yedek/hukuk garantisi yok; korunma alternatifi ve açık onay var.
- &#96;BR117/118/136/137&#96;: aktarım kısmi dönemdir; boşluklar ve dahil edilmeyen özel içerik görünür; geçmiş/atıf/kaynak/uyuşmazlıklar ayrı korunur; aktarım doğrulama veya tamamlanma değildir; sessiz overwrite yok.
- &#96;BR134/135&#96;: motosiklet başına izolasyon ve premium şeklin temel izolasyonu kaldırmaması sunumda korunuyor.
- Planın J02/J03/J04 referansları tam 887×1774 özgünlerden karşılaştırıldı. Mevcut 48 native PNG’nin her bir raw byte boyutu ve SHA-256’sı manifest ile eşleşiyor; 28 state, 29 farklı ham görsel içerik ve 19 byte-eş kopya. 29 farklı içeriğin tam kaydırmalı görüntüleri açılıp incelendi. J02’nin ayrı pasifleştirme/aktarım/silme hiyerarşisi, J03’ün dönem/boşluk/özel içerik/atıf sınırları ve J04’ün kendi kapsamı/bağımsız kopyalar/alternatif/açık onay görünür. Ekranlar gerçek app chrome, son tasarım token’ı veya üretim rotası iddiasında değil.
- E10 yedi tasarım kapısı için kaynak kanıtı: 48 tam kaydırma parçası; 28 state; 320/390/768 genişlik × üç metin ölçeğinde 252 düzen; 620px adımlı tam kaydırma; 52 hedef ve fatal pointer kontrolü; Tab/Enter/Space, header, checked/disabled/liveRegion; metin kontrastı ≥4.5, odak kenarı kontrastı ≥3 ve kenar kalınlığı 3. Gerçek cihaz, OS/screenreader, dark mode ve nihai font/modalite HELD.
- Ekran dışı ve belirsiz girdilerde missing/stale/foreign/unknown/HELD/yanlış subject/request/field/effect/audit detayları kapalı tutuyor. Altı effect boyutu birbirinden ayrı; çıplak &#96;ALLOW&#96;, handler tek başına veya yanlış bağlam yetki üretmiyor. Receipt yalnız exact request’in alındığı anlamına geliyor. Sessiz silme, seçim kazanımı, doğrulama, target identity veya hukuk/saklama sözü yok.
- İlk R1 fokus kontrastı 2.7166&lt;3 başarısızlığı kaynak günlükte korunuyor. R2 odak rengi düzeltmesiyle 20 hedef testi geçti; eşikler gevşetilmedi. R4 297 normal test ve ayrı 1 native test başarılı; önceki 277 test aynı koşuda korunmuş. Strict format 32 dosyada sıfır değişiklik, analyze temiz. R1 graph başarısızlığı geçmiş kanıt olarak tutulmuş; güncel graph run_all 12 kontrol +42 koruma testi, worst=0.
- Gerçek source CI kanıtı: aynı head için 16 workflow run ve 16 raw log (8 PR, 8 push) receipt’te kayıtlı; log boyut/SHA kontrolleri 16/16 eşleşti. PR E1 ve PR T3 adımları başarılı; mimari doğrulama başarılı. Push T3 job’unun skipped oluşu kabul kanıtı sayılmadı. E1 ham CI günlüğü format/analyze ve 297 test sonucunu destekliyor. PR CI makbuzu kaynakta belirtilen PR yorumunda mevcut.
- EDEV111’in önceki gövdesi korunmuş; değişiklik yalnız ilişki metadata’sı ve append edilmiş ikincil makbuz. Manifest/CI_PLAN temel içerikleri korunup lifecycle kayıtları eklenmiş; eski 277 baseline değişmemiş. EDEV112 içindeki first-reader tam Base64 içeriği çözüldü ve &#96;C:/Users/Xpike/AppData/Local/Temp/kavriva_e1014a_R1_first_reading.txt&#96; ile byte-byte aynı: 3,727 bayt, SHA-256 &#96;3420814a18da4d712b212eda8bcc2ddec6d2d07ce88a4f9c2dfca40226becbbc&#96;. Sabit 17 sorunun raporu ALL CLEAR. Bu raporda istenen model ayarı gpt-6-luna/max olarak yazılmış; bağımsız runtime metadata görünmediğinden gerçek çalışma zamanı doğrulandı denmiyor.

6. Kapanış ve kapsam dışı kalan hüküm

F-01 kapanmadan T-E1-014a için bu bağımsız GATE sunum kabulü verilmemeli. Kapatma kanıtı, alternatif SCR031 seçiminin mevcut yetkiyi kullanmadan doğru yeni bağlamı isteyebildiğini (ve o bağlam gelene kadar gönderimin kapalı kaldığını) gösteren kaynak/test/görsel güncellemesi veya kullanıcının ekranda yanlış beklentiye girmediğini sağlayan kabul edilmiş UI davranışı olmalı.

Bu rapor yalnız frozen source &#96;f9c7eb7db299d0653b55a5e44d4f2deb4b5d1cfa&#96; içindir. Final metadata, source-to-final diff, final CI, merge ve fetched-main8 bu incelemenin dışında ve henüz değerlendirilmedi. E3R1REVIEW, E5_IN_PROGRESS, Supabase 47/57/59, RET97, runtime/identity, gerçek cihaz ve yayın hold’ları açıktır; bu bounded GATE hükmü bunları kapatmaz. PR’a yorum/approval verilmedi, repo veya PR değiştirilmedi.
</pre>

### Özgün R1 RAW Base64

```base64
VC1FMS0wMTRhIOKAlCBCYcSfxLFtc8SxeiBiw7x0w7xuLWtheW5hayBpbmNlbGVtZXNpClRhcmloOiAyMDI2LTEwLTA3CgpIw5xLw5xNOiBDSEFOR0VTIFJFUVVFU1RFRCDigJQgR0FUReKAmWluIHPEsW7EsXJsxLEgc3VudW0ga2FidWzDvCDFn3Uga2F5bmFrdGEgaGVuw7x6IGthcsWfxLFsYW5txLF5b3IuCgpIw7xrw7xtLCBhxZ9hxJ/EsWRha2kgU0NSMDMxIGnFn2xlbS1zZcOnaW1pL2JhxJ9sYW0gZ2XDp2nFn2kgYnVsZ3VzdW5hIGRheWFuxLFyLiBCdSwgZ2Vyw6dlayBsaWZlY3ljbGUgd3JpdGVyL2F1dGgvbGVnYWwvcmV0ZW50aW9uL2JhY2t1cCB2ZXlhIGNpaGF6IGthbsSxdMSxIGlzdGVtZWsgZGXEn2lsZGlyLiBPIMO8cmV0aW0ga2F0bWFubGFyxLEgcGxhbiB2ZSBrYXluYWt0YSBIRUxEIGthbMSxcjsgYnUgaW5jZWxlbWUgb25sYXLEsSBrYXBhdG1hei4gS2F5bmFrdGEgZ8O8dmVuc2l6IGJpciBzaWxtZS9ha3RhcsSxbSB5ZXRraXNpIGHDp8SxbG3EsXlvcjsgZW5nZWwsIGt1bGxhbsSxY8SxbsSxbiBnw7ZzdGVyaWxlbiBhbHRlcm5hdGlmIGnFn2xlbWkgeWVuaSB2ZSBnw7xuY2VsIGJhxJ9sYW1hIHVsYcWfdMSxcmFtYW1hc8SxZMSxci4KCjEuIMSwbmNlbGVtZSBzYWJpdGxlcmkgdmUgc8SxbsSxcgoKLSBQUjogaHR0cHM6Ly9naXRodWIuY29tL3hwaWtlLWRnbS9rYXZyaXZhLWFwcC9wdWxsLzExNCDigJQgYcOnxLFrIHZlIGRyYWZ0OyBrYXluYWsgaGVhZCBgZjljN2ViN2RiMjk5ZDA2NTNiNTVhNWU0NGQ0ZjJkZWI0YjVkMWNmYWAuCi0gS2FyxZ/EsWxhxZ90xLFybWEgdGFiYW7EsTogYDFkMTEzYWZhZTViZmVjYTc2MjZkNGNhMWZjN2IzMzNlZmZlYWNlNmVgLgotIFBsYW4ga2F5bmHEn8SxOiBgQzovVXNlcnMvWHBpa2UvRGVza3RvcC9LYXZyaXZhLXBsYW5gLCB5YWxuxLF6IGBmYTkxNGYwMTNmZGNkMDMyZmFlZDg3NjY4OTA5MmRhMjQ1OTg5NDU5OjxwYXRoPmAgYmxvYuKAmWxhcsSxLiDDh2FsxLHFn21hIGHEn2FjxLFuZGFraSBzb25yYWtpLCBiaXJsZcWfbWVtacWfIERFQzAwNzAga3VsbGFuxLFsbWFkxLEuCi0gQXBwIGNoZWNrb3V0OiBgQzovVXNlcnMvWHBpa2UvLmNvZGV4L3dvcmt0cmVlcy9lNC1yZXF1aXJlZC1hdXRvLXRyYW5zZmVyL2thdnJpdmEtYXBwYDsgYEhFQURgIHRhbSBrYXluYWsgU0hB4oCZc8SxIHZlIMOnYWzEscWfbWEgYcSfYWPEsSB0ZW1pei4KLSBUYWJhbuKGkmtheW5hayBkaWZm4oCZaSB0YW0gMTQgaXppbmxpIGRvc3lhLiBTQ1IwMDgsIMO2bmNla2kgZGlhZ25vc2lzL2hpc3RvcnkvZGlzcHV0ZS9jb3JyZWN0aW9uL1NESy9kZXBlbmRlbmN5L1lBTUwvcHVibGljLWNvbnRyYWN0IGnDp2VyaWtsZXJpIGRlxJ9pxZ9tZW1pxZ8uCi0gU8SxbsSxciB2ZSBrYXluYWtsYXI6IGB2YXVsdC9SRUdJU1RSWS9ULUUxLTAxNGEubWRgLCBgdmF1bHQvUEFDS1MvUC1FMS0wMTRhLm1kYCwgYHZhdWx0L1BST0ZJTEVTL2xpZmVjeWNsZS1yZW5kZXIubWRgLCBgdmF1bHQvRVZJREVOQ0UvRS1ERVYtMTEyLm1kYCwgYHZhdWx0L0VWSURFTkNFL0UtREVWLTExMS5tZGAsIGB2YXVsdC9JTlZFTlRPUklFUy9FMTAtR09WRVJORUQtUEFUSFMubWRgLCBgdmF1bHQvRVZJREVOQ0UvU05BUFNIT1RTL0UtREVWLTExMS1FMTAtR09WRVJORUQtUEFUSFMtRk9SLVQtRTEtMDE0YS5tZC5zbmFwc2hvdGAsIGAuZ2l0aHViL3dvcmtmbG93cy9DSV9QTEFOLm1kYCwgYG1vZHVsZXMvZTAxLWFwcC9NQU5JRkVTVC5tZGAsIGB2YXVsdC9JTkRFWC9yZWdpc3RyeS5qc29uYCwgYHZhdWx0L0lOREVYL3JvdXRpbmcuanNvbmAsIGBtb2R1bGVzL2UwMS1hcHAvaW50ZXJuYWwvc2hlbGwvbGliL2xpZmVjeWNsZS5kYXJ0YCwgYG1vZHVsZXMvZTAxLWFwcC9pbnRlcm5hbC9zaGVsbC90ZXN0L2xpZmVjeWNsZV90ZXN0LmRhcnRgLCBgbW9kdWxlcy9lMDEtYXBwL2ludGVybmFsL3NoZWxsL3Rlc3QvZml4dHVyZXMvbGlmZWN5Y2xlX3JlYWRpbmdfcXVlc3Rpb25zLmpzb25gLgotIFRhbXBlci9jdXN0b2R5IGRvxJ9ydWxhbWFzxLE6IDUwIGJhc2UgcGluaW4gR2l0IGJsb2IgU0hB4oCZbGFyxLEga2FidWwgZWRpbG1pxZ8gYmFzZSBpbGUgZcWfbGXFn2l5b3I7IGtheW5hayBjb21taXR0ZSA0NCBwaW4gYXluxLEsIHlhbG7EsXogYWx0xLEga2F5xLF0L2dpcmRpIGRvc3lhc8SxIGRlxJ9pxZ9tacWfIChFREVWMTExLCBpbnZlbnRvcnksIG1hbmlmZXN0LCBDSV9QTEFOLCByZWdpc3RyeSwgcm91dGluZykuIEhhbSB2NzggaW52ZW50b3J5IHNuYXBzaG90IGJhc2UgaW52ZW50b3J5IGJsb2LigJl1eWxhIGJ5dGUtYnl0ZSBheW7EsTogMjEwLDU0MCBiYXl0LCBTSEEtMjU2IGAzNDU4NDFlYzI4ODVlNTZhNGJkN2JjYjM2YTU2OTg1ZjY5YzIzNTk4ZjY2YzA5MDFjNTMyNDI1NTRiOTM2ZTc1YC4gS2F5bmFrIGRpZmbigJlpbmRlIHY3OSBpbnZlbnRvcnkgdmUgMTA0IMO8cmV0aWxtacWfIGthecSxdCBhZGF5xLEgYnVsdW5tYXPEsSB0ZWsgYmHFn8SxbmEgRE9ORSB2ZXlhIGdhdGUga2FidWzDvCBkZcSfaWxkaXIuCgoyLiBLYW5vbmlrIGthYnVsIHnDtm50ZW1pCgpCdSBpxZ8gU0lNVUxBVElPTiBkZcSfaWxkaXIuIFBsYW4gYEFDQ0VQVEFOQ0VfTUFUUklYLm1kYCBkb8SfcnVsYW1hIGF0YW1hc8SxbmRhIEYxLjcuMSwgRkwxLjcuMSB2ZSBULUUxLTAxNGEgacOnaW4gR0FURSAvIEhFTEQtYWNjZXB0YW5jZSBldmFsdWF0aW9uIGRlci4gYFRBU0tfSU5ERVgubWRgIFQtRTEtMDE0YSBrYXBzYW3EsSBTQ1IwMzEvMDMyLzAzMywgQzEuNy9GMS43LjEsIFNDUjAwOCBoYXJpw6csIOKAnFN0YXRlcyBzaG93buKAnSB2ZSBERUMwMDUzIMWfZWtsaWRpci4gRXNraSBtYXRyaWtzIGBOT05FYCBzYXTEsXLEsSB5YSBkYSDDtm5jZWtpIGfDtnJldiB5w7ZudGVtaSBidSBhdGFtYXnEsSBkZcSfacWfdGlybWV6LgoKREVDMDA1MyBzYWJpdCDFn2VrbGkgZWtyYW5kYSBkb8SfcnU6IGJpciDDvGNyZXRzaXogbW90b3Npa2xldDsgYWJvbmVsaWtsZSB0b3BsYW0gw7zDpzsgdGFtIHJlaGJlciBheW7EsSBhbmRhIGJpciBzZcOnaWxpIG1vdG9zaWtsZXR0ZSwgYmHFn2thIG1vdG9zaWtsZXRlIHRhxZ/EsW7EsXIgdmUgaGFrbGFyIGJpcmlrbWV6LiBGaXlhdCwgcGFrZXQgYWTEsSwgZMO2bmVtIHZlIGRlxJ9pxZ90aXJtZSBrdXJhbMSxIEhFTEQuIFNDUjAwOOKAmWluIGthcHNhbSBkxLHFn8SxbmRhIGLEsXJha8SxbGTEscSfxLEgdmUgw7ZuY2VraSBhcHAgY29udHJhY3TigJlsYXLEsW7EsW4gZGXEn2nFn21lZGnEn2kgZG/En3J1bGFuZMSxLgoKMy4gS2FidWwgZW5nZWxpCgpGLTAxIOKAlCBTQ1IwMzHigJlkZSBhbHRlcm5hdGlmIHNlw6dpbWkgZ8O8bmNlbCBpxZ9sZW0gYmHEn2xhbcSxbmEgdGHFn8SxeWFuIHlvbCB5b2suCgpgbW9kdWxlcy9lMDEtYXBwL2ludGVybmFsL3NoZWxsL2xpYi9saWZlY3ljbGUuZGFydDoyMTktMjIyYCB5ZXJlbCBzZcOnaW1pIGRhaW1hIGBzbmFwc2hvdC5vcGVyYXRpb25gIGRlxJ9lcmluZGVuIGJhxZ9sYXTEsXlvci4gU0NSMDMx4oCZZGVraSDigJxFdGtpbiBkZcSfaWwgeWFwIC8gR2XDp21pxZ9pIGFrdGFyIC8gTW90b3Npa2xldGkgc2ls4oCdIGTDvMSfbWVsZXJpIHlhbG7EsXogeWVyZWwgYHNlbGVjdGVkYCBkZcSfZXJpbmkgZGXEn2nFn3Rpcml5b3IgKGA6NDA5LTQ1NGApOyDigJxTZcOnaWxlbiBpxZ9sZW1pIGfDtnpkZW4gZ2XDp2ly4oCdIGVrcmFuxLEgeWVyZWwgb2xhcmFrIGHDp8SxeW9yLCBmYWthdCBgb25JbnRlbnRgIMOnYcSfxLFybcSxeW9yLiBgTGlmZWN5Y2xlQWN0aW9uYC9gTGlmZWN5Y2xlSW50ZW50YCB5YWxuxLF6IGnFn2xlbSBldGtpc2ksIGF5bsSxLWlzdGVrIHJlY29uY2lsZSwgZGVzdGVrIHZlIMOnxLFrxLHFnyB0YcWfxLF5b3IgKGA6MjMtMzFgLCBgOjE4NS0xOThgLCBgOjU5MC02MDNgKTsgeWVuaSBpxZ9sZW0gacOnaW4gZ8O8bmNlbCBva3VtYS9rYXBzYW0gdGFsZWJpIHlvay4KCkJ1bmEga2FyxZ/EsWzEsWsgaGVyIGdlcsOnZWsgacWfbGVtIGnDp2luIGBfY2FuU2VuZGAgYHNlbGVjdGVkID09IHMub3BlcmF0aW9uYCDFn2FydMSxbsSxIGFyxLF5b3IgKGA6MjU2LTI2OWApLiBCdSwgYmHFn2thIGnFn2xlbWluIG1ldmN1dCBwbGFuL3JlcXVlc3QgeWV0a2lzaW5pIMO2ZMO8bsOnIGFsbWFtYXPEsW7EsSBkb8SfcnUgYmnDp2ltZGUgc2HEn2zEsXlvcjsgYW5jYWsga3VsbGFuxLFjxLEgbWV2Y3V0IGBkZWFjdGl2YXRlYCBiYcSfbGFtxLFuZGEg4oCcR2XDp21pxZ9pIGFrdGFy4oCdIHlhIGRhIOKAnE1vdG9zaWtsZXRpIHNpbOKAnSBzZcOnaXAgaW5jZWxlbWUgZWtyYW7EsW7EsSBhw6fEsW5jYSBoZWRlZiBpxZ9sZW0gZ8O2bmRlcmlsZW1peW9yLiBXaWRnZXQgZMSxxZ/EsW5kYWtpIMO8cmV0aWNpeWUgaGFuZ2kgacWfbGVtaW4gc2XDp2lsZGnEn2kgZGUgaWxldGlsbWl5b3IuIGB0ZXN0L2xpZmVjeWNsZV90ZXN0LmRhcnQ6NDIzLTQzMmAgYnUgZHVydW11IGRvxJ9ydWRhbiBkb8SfcnVsdXlvcjogdHJhbnNmZXIgc2XDp2lsaXAgZ8O2emRlbiBnZcOnaXJpbGl5b3IsIGBjYWxsc2AgYm/FnyBrYWzEsXlvciB2ZSBrYXBzYW0gb25hecSxIGNhbGxiYWNr4oCZaSBudWxsLiBFxZ9sZcWfZW4gYG9wZXJhdGlvbmAgaWxlIGTEscWfYXLEsWRhbiB2ZXJpbG1pxZ8gdHJhbnNmZXIvZGVsZXRlIHNuYXBzaG904oCZxLEgdGVzdGxlcmkgKDo0MzQtNDU5LCA6NDYzLTQ4MCkgYXlyxLEgZWtyYW7EsW4gw6dhbMSxxZ9hYmlsZGnEn2luaSBnw7ZzdGVyaXlvcjsgZmFrYXQga3VsbGFuxLFjxLEgc2XDp2ltaW5kZW4gbyB5ZW5pIGJhxJ9sYW1hIHVsYcWfYW4gYmlyIHlvbCBnw7ZzdGVybWl5b3IuIE5hdGl2ZSBgb3BlcmF0aW9uLWhlbGRgIGfDtnLDvG50w7xzw7xuZGUgYW5hIGTDvMSfbWUga2FwYWzEsSwgeWFyZMSxbS/Dp8Sxa8SxxZ8gYcOnxLFrIHZlIOKAnGJ1IGnFn2xlbSBpw6dpbiBnw7xuY2VsIGthcHNhbeKApuKAnSB5YXrEsXlvci4KCkJ1IGfDvHZlbmxpIGZhaWwtY2xvc2VkIGRhdnJhbsSxxZ8gdGVrIGJhxZ/EsW5hIHlldGVybGkga2FidWwga2FuxLF0xLEgZGXEn2lsOiBla3JhbmRhIGV0a2luIHNlw6dpbSB2ZSDigJxnw7Z6ZGVuIGdlw6dpcuKAnSBhbmEgZXlsZW1pIHN1bnVsdXlvciwgYW5jYWsga3VsbGFuxLFjxLFuxLFuIHNlw6d0acSfaSBkacSfZXIgU0NSMDMxIGFrxLHFn8SxbmEgZGV2YW0gZWRlYmlsbWVzaSBpw6dpbiBnZXJla2xpIGJhxJ9sYW0gdGFsZWJpIGJ1bHVubXV5b3IuIEJ1bnUgZ2Vyw6dlayB5ZXRraS9pxZ9sZW0gdXlndWxhbWFkYW4gw6fDtnptZWsgbcO8bWvDvG46IHNlw6dpbWkgZMSxxZ8gw7xyZXRpY2l5ZSBpbGV0ZW4sIHlhbG7EsXogeWVuaSBnw7xuY2VsIGJhxJ9sYW0gaXN0ZXllbiBiaXIgbml5ZXQvYXJhecO8eiB2ZXlhIGJ1IGJhxJ9sYW0gaGF6xLFyIG9sYW5hIGthZGFyIHNlw6dlbmXEn2kgZ2Vyw6dla3RlbiBrdWxsYW7EsWxhbWF6IGvEsWxhbiBhw6fEsWsgw7xyw7xuIGRhdnJhbsSxxZ/EsSBnZXJla2lyLiBNZXZjdXQga2F5bmFrIGJ1bmxhcmRhbiBoacOnYmlyaW5pIHlhcG3EsXlvci4gQnUgbmVkZW5sZSBzxLFuxLFybMSxIGVrcmFuL3N1bnVtIGthYnVsw7wgZGUgaGVuw7x6IHRhbSBkZcSfaWwuCgo0LiBBeW7EsS1pc3RlayBraWxpZGkgdmUgdW5rbm93biBkdXJ1bXUKCk1ldmN1dCBleGFjdCByZXF1ZXN0L3Njb3BlIGd1YXJkIHZlIGFsdMSxIGF5csSxIGVmZmVjdCBib3l1dHUgZ8O8dmVubGk6IGFsYW4vc3ViamVjdC9zY29wZS9vcGVyYXRpb24vcGhhc2UgZGXEn2nFn2ltaW5kZSBlc2tpIGNhbGxiYWNrIGfDvG5jZWwgaXpuaSDDtmTDvG7DpyBhbG3EsXlvcjsgZGVsZXRlIGF5csSxIGHDp8SxayBvbmF5IGlzdGl5b3I7IGfDtm5kZXJpbSB2ZSByZWNvbmNpbGUgYXluxLEgd2lkZ2V0IMO2cm5lxJ9pbmRlIHJlcXVlc3QgYmHFn8SxbmEgYmlyIGtleiBraWxpdGxlbml5b3IuIEZhaWxlZC91bmtub3duL2thbsSxdHPEsXotcmVjZWl2ZWQgZHVydW11bmRhIHlhbG7EsXogYXluxLEtcmVxdWVzdCByZWNvbmNpbGUgY2FsbGJhY2vigJlpIGHDp8SxbMSxeW9yLiBCdSBkYXZyYW7EscWfIHRlc3RsZXJkZSwgYXluxLEgcmVxdWVzdOKAmXRlIHBsYW4gZGXEn2nFn2luY2UgaWtpbmNpIHF1ZXJ54oCZeWkga2FwYXRhcmFrIGthc8SxdGzEsSBvbGFyYWsga29ydW5tdcWfIChgdGVzdC9saWZlY3ljbGVfdGVzdC5kYXJ0Ojc4MS04MThgKS4KClPEsW7EsXJsYW1hOiBxdWVyeSBiaXIga2V6IGnFn2FyZXRsZW5kaWt0ZW4gc29ucmEgYXluxLEgcmVxdWVzdCBow6Jsw6IgYmVsaXJzaXpzZSB5ZW5pIHF1ZXJ5IGthcGFsxLEga2FsxLF5b3IgdmUgZWtyYW4g4oCcc29udcOnIHNvcmd1bGFuxLF5b3LigJ0gbWV0bmluaSBrdWxsYW7EsXlvciAoYGxpZmVjeWNsZS5kYXJ0OjI2MGAsIGA6NTQxLTU0OGApLiBUZXN0L8O8csO8biBzw7Z6bGXFn21lc2kgYnVudSB0ZWstc29yZ3Uga2lsaWRpIG9sYXJhayB0YW7EsW1sxLF5b3I7IGJlbiBidSBpbmNlbGVtZWRlIHllbmkgcXVlcnkgdmV5YSByZXNlbmQgdGFsZWJpIMO2bmVybWl5b3J1bS4gQW5jYWsgYnUga2FuxLF0IHlhbG7EsXogYmlyIHJlY29uY2lsZSBuaXlldGluaW4gZ8O2bmRlcmlsZWJpbGRpxJ9pbmkgZ8O2c3RlcmlyOyBiZWxpcnNpeiBzb251Y3VuIGdlcsOnZWsgw7xyZXRpY2lkZSDDp8O2esO8bGTDvMSfw7xuw7wgeWEgZGEgdGVrcmFyLXNvcmd1IGRhdnJhbsSxxZ/EsW7EsSBrYW7EsXRsYW1hei4gQnUgZGF2cmFuxLHFnyDDvHJldGltIHJlY292ZXJ54oCZc2kgb2xhcmFrIHN1bnVsbWFtYWzEsWTEsXIuCgo1LiBLYXluYWsgdmUgZWtyYW4gacOnZXJpxJ9pIOKAlCBnZcOnZW4ga29udHJvbGxlcgoKLSBgQlIxMDNgOiBwYXNpZmxpayBzaWxtZSBkZcSfaWxkaXI7IGdlw6dtacWfL2thbsSxdC9kw7x6ZWx0bWUga29ydW51ciwgeWVuaWRlbiBldGtpbmxlxZ9tZSBmaXppa3NlbCB1eWd1bmx1ayBrYW7EsXTEsSBzYXnEsWxtYXouCi0gYEJSMTExYDogeWFsbsSxeiBrdWxsYW7EsWPEsW7EsW4ga2VuZGkga2FsZMSxcsSxbGFiaWxpciBrYXBzYW3EsTsgYmHEn8SxbXPEsXoga2FuxLF0bGFyLCBha3RhcsSxbG3EscWfIGtvcHlhbGFyIHZlIGRpxJ9lciBracWfaWxlcmluIGthecSxdGxhcsSxIG90b21hdGlrIHNpbGlubWV6LiBTYWtsYW1hL3llZGVrL2h1a3VrIGdhcmFudGlzaSB5b2s7IGtvcnVubWEgYWx0ZXJuYXRpZmkgdmUgYcOnxLFrIG9uYXkgdmFyLgotIGBCUjExNy8xMTgvMTM2LzEzN2A6IGFrdGFyxLFtIGvEsXNtaSBkw7ZuZW1kaXI7IGJvxZ9sdWtsYXIgdmUgZGFoaWwgZWRpbG1leWVuIMO2emVsIGnDp2VyaWsgZ8O2csO8bsO8cjsgZ2XDp21pxZ8vYXTEsWYva2F5bmFrL3V5dcWfbWF6bMSxa2xhciBheXLEsSBrb3J1bnVyOyBha3RhcsSxbSBkb8SfcnVsYW1hIHZleWEgdGFtYW1sYW5tYSBkZcSfaWxkaXI7IHNlc3NpeiBvdmVyd3JpdGUgeW9rLgotIGBCUjEzNC8xMzVgOiBtb3Rvc2lrbGV0IGJhxZ/EsW5hIGl6b2xhc3lvbiB2ZSBwcmVtaXVtIMWfZWtsaW4gdGVtZWwgaXpvbGFzeW9udSBrYWxkxLFybWFtYXPEsSBzdW51bWRhIGtvcnVudXlvci4KLSBQbGFuxLFuIEowMi9KMDMvSjA0IHJlZmVyYW5zbGFyxLEgdGFtIDg4N8OXMTc3NCDDtnpnw7xubGVyZGVuIGthcsWfxLFsYcWfdMSxcsSxbGTEsS4gTWV2Y3V0IDQ4IG5hdGl2ZSBQTkfigJluaW4gaGVyIGJpciByYXcgYnl0ZSBib3l1dHUgdmUgU0hBLTI1NuKAmXPEsSBtYW5pZmVzdCBpbGUgZcWfbGXFn2l5b3I7IDI4IHN0YXRlLCAyOSBmYXJrbMSxIGhhbSBnw7Zyc2VsIGnDp2VyaWsgdmUgMTkgYnl0ZS1lxZ8ga29weWEuIDI5IGZhcmtsxLEgacOnZXJpxJ9pbiB0YW0ga2F5ZMSxcm1hbMSxIGfDtnLDvG50w7xsZXJpIGHDp8SxbMSxcCBpbmNlbGVuZGkuIEowMuKAmW5pbiBheXLEsSBwYXNpZmxlxZ90aXJtZS9ha3RhcsSxbS9zaWxtZSBoaXllcmFyxZ9pc2ksIEowM+KAmcO8biBkw7ZuZW0vYm/Fn2x1ay/DtnplbCBpw6dlcmlrL2F0xLFmIHPEsW7EsXJsYXLEsSB2ZSBKMDTigJnDvG4ga2VuZGkga2Fwc2FtxLEvYmHEn8SxbXPEsXoga29weWFsYXIvYWx0ZXJuYXRpZi9hw6fEsWsgb25heSBnw7Zyw7xuw7xyLiBFa3JhbmxhciBnZXLDp2VrIGFwcCBjaHJvbWUsIHNvbiB0YXNhcsSxbSB0b2tlbuKAmcSxIHZleWEgw7xyZXRpbSByb3Rhc8SxIGlkZGlhc8SxbmRhIGRlxJ9pbC4KLSBFMTAgeWVkaSB0YXNhcsSxbSBrYXDEsXPEsSBpw6dpbiBrYXluYWsga2FuxLF0xLE6IDQ4IHRhbSBrYXlkxLFybWEgcGFyw6dhc8SxOyAyOCBzdGF0ZTsgMzIwLzM5MC83NjggZ2VuacWfbGlrIMOXIMO8w6cgbWV0aW4gw7Zsw6dlxJ9pbmRlIDI1MiBkw7x6ZW47IDYyMHB4IGFkxLFtbMSxIHRhbSBrYXlkxLFybWE7IDUyIGhlZGVmIHZlIGZhdGFsIHBvaW50ZXIga29udHJvbMO8OyBUYWIvRW50ZXIvU3BhY2UsIGhlYWRlciwgY2hlY2tlZC9kaXNhYmxlZC9saXZlUmVnaW9uOyBtZXRpbiBrb250cmFzdMSxIOKJpTQuNSwgb2RhayBrZW5hcsSxIGtvbnRyYXN0xLEg4omlMyB2ZSBrZW5hciBrYWzEsW5sxLHEn8SxIDMuIEdlcsOnZWsgY2loYXosIE9TL3NjcmVlbnJlYWRlciwgZGFyayBtb2RlIHZlIG5paGFpIGZvbnQvbW9kYWxpdGUgSEVMRC4KLSBFa3JhbiBkxLHFn8SxIHZlIGJlbGlyc2l6IGdpcmRpbGVyZGUgbWlzc2luZy9zdGFsZS9mb3JlaWduL3Vua25vd24vSEVMRC95YW5sxLHFnyBzdWJqZWN0L3JlcXVlc3QvZmllbGQvZWZmZWN0L2F1ZGl0IGRldGF5bGFyxLEga2FwYWzEsSB0dXR1eW9yLiBBbHTEsSBlZmZlY3QgYm95dXR1IGJpcmJpcmluZGVuIGF5csSxOyDDp8SxcGxhayBgQUxMT1dgLCBoYW5kbGVyIHRlayBiYcWfxLFuYSB2ZXlhIHlhbmzEscWfIGJhxJ9sYW0geWV0a2kgw7xyZXRtaXlvci4gUmVjZWlwdCB5YWxuxLF6IGV4YWN0IHJlcXVlc3TigJlpbiBhbMSxbmTEscSfxLEgYW5sYW3EsW5hIGdlbGl5b3IuIFNlc3NpeiBzaWxtZSwgc2XDp2ltIGthemFuxLFtxLEsIGRvxJ9ydWxhbWEsIHRhcmdldCBpZGVudGl0eSB2ZXlhIGh1a3VrL3Nha2xhbWEgc8O2esO8IHlvay4KLSDEsGxrIFIxIGZva3VzIGtvbnRyYXN0xLEgMi43MTY2PDMgYmHFn2FyxLFzxLF6bMSxxJ/EsSBrYXluYWsgZ8O8bmzDvGt0ZSBrb3J1bnV5b3IuIFIyIG9kYWsgcmVuZ2kgZMO8emVsdG1lc2l5bGUgMjAgaGVkZWYgdGVzdGkgZ2XDp3RpOyBlxZ9pa2xlciBnZXbFn2V0aWxtZWRpLiBSNCAyOTcgbm9ybWFsIHRlc3QgdmUgYXlyxLEgMSBuYXRpdmUgdGVzdCBiYcWfYXLEsWzEsTsgw7ZuY2VraSAyNzcgdGVzdCBheW7EsSBrb8WfdWRhIGtvcnVubXXFny4gU3RyaWN0IGZvcm1hdCAzMiBkb3N5YWRhIHPEsWbEsXIgZGXEn2nFn2lrbGlrLCBhbmFseXplIHRlbWl6LiBSMSBncmFwaCBiYcWfYXLEsXPEsXpsxLHEn8SxIGdlw6dtacWfIGthbsSxdCBvbGFyYWsgdHV0dWxtdcWfOyBnw7xuY2VsIGdyYXBoIHJ1bl9hbGwgMTIga29udHJvbCArNDIga29ydW1hIHRlc3RpLCB3b3JzdD0wLgotIEdlcsOnZWsgc291cmNlIENJIGthbsSxdMSxOiBheW7EsSBoZWFkIGnDp2luIDE2IHdvcmtmbG93IHJ1biB2ZSAxNiByYXcgbG9nICg4IFBSLCA4IHB1c2gpIHJlY2VpcHTigJl0ZSBrYXnEsXRsxLE7IGxvZyBib3l1dC9TSEEga29udHJvbGxlcmkgMTYvMTYgZcWfbGXFn3RpLiBQUiBFMSB2ZSBQUiBUMyBhZMSxbWxhcsSxIGJhxZ9hcsSxbMSxOyBtaW1hcmkgZG/En3J1bGFtYSBiYcWfYXLEsWzEsS4gUHVzaCBUMyBqb2LigJl1bnVuIHNraXBwZWQgb2x1xZ91IGthYnVsIGthbsSxdMSxIHNhecSxbG1hZMSxLiBFMSBoYW0gQ0kgZ8O8bmzDvMSfw7wgZm9ybWF0L2FuYWx5emUgdmUgMjk3IHRlc3Qgc29udWN1bnUgZGVzdGVrbGl5b3IuIFBSIENJIG1ha2J1enUga2F5bmFrdGEgYmVsaXJ0aWxlbiBQUiB5b3J1bXVuZGEgbWV2Y3V0LgotIEVERVYxMTHigJlpbiDDtm5jZWtpIGfDtnZkZXNpIGtvcnVubXXFnzsgZGXEn2nFn2lrbGlrIHlhbG7EsXogaWxpxZ9raSBtZXRhZGF0YeKAmXPEsSB2ZSBhcHBlbmQgZWRpbG1pxZ8gaWtpbmNpbCBtYWtidXouIE1hbmlmZXN0L0NJX1BMQU4gdGVtZWwgacOnZXJpa2xlcmkga29ydW51cCBsaWZlY3ljbGUga2F5xLF0bGFyxLEgZWtsZW5tacWfOyBlc2tpIDI3NyBiYXNlbGluZSBkZcSfacWfbWVtacWfLiBFREVWMTEyIGnDp2luZGVraSBmaXJzdC1yZWFkZXIgdGFtIEJhc2U2NCBpw6dlcmnEn2kgw6fDtnrDvGxkw7wgdmUgYEM6L1VzZXJzL1hwaWtlL0FwcERhdGEvTG9jYWwvVGVtcC9rYXZyaXZhX2UxMDE0YV9SMV9maXJzdF9yZWFkaW5nLnR4dGAgaWxlIGJ5dGUtYnl0ZSBheW7EsTogMyw3MjcgYmF5dCwgU0hBLTI1NiBgMzQyMDgxNGExOGRhNGQ3MTJiMjEyZWRhOGJjYzJkZGVjNmQyZDA3Y2U4OGE0ZjljMmRmY2E0MDIyNmJlY2JiY2AuIFNhYml0IDE3IHNvcnVudW4gcmFwb3J1IEFMTCBDTEVBUi4gQnUgcmFwb3JkYSBpc3RlbmVuIG1vZGVsIGF5YXLEsSBncHQtNi1sdW5hL21heCBvbGFyYWsgeWF6xLFsbcSxxZ87IGJhxJ/EsW1zxLF6IHJ1bnRpbWUgbWV0YWRhdGEgZ8O2csO8bm1lZGnEn2luZGVuIGdlcsOnZWsgw6dhbMSxxZ9tYSB6YW1hbsSxIGRvxJ9ydWxhbmTEsSBkZW5taXlvci4KCjYuIEthcGFuxLHFnyB2ZSBrYXBzYW0gZMSxxZ/EsSBrYWxhbiBow7xrw7xtCgpGLTAxIGthcGFubWFkYW4gVC1FMS0wMTRhIGnDp2luIGJ1IGJhxJ/EsW1zxLF6IEdBVEUgc3VudW0ga2FidWzDvCB2ZXJpbG1lbWVsaS4gS2FwYXRtYSBrYW7EsXTEsSwgYWx0ZXJuYXRpZiBTQ1IwMzEgc2XDp2ltaW5pbiBtZXZjdXQgeWV0a2l5aSBrdWxsYW5tYWRhbiBkb8SfcnUgeWVuaSBiYcSfbGFtxLEgaXN0ZXllYmlsZGnEn2luaSAodmUgbyBiYcSfbGFtIGdlbGVuZSBrYWRhciBnw7ZuZGVyaW1pbiBrYXBhbMSxIGthbGTEscSfxLFuxLEpIGfDtnN0ZXJlbiBrYXluYWsvdGVzdC9nw7Zyc2VsIGfDvG5jZWxsZW1lc2kgdmV5YSBrdWxsYW7EsWPEsW7EsW4gZWtyYW5kYSB5YW5sxLHFnyBiZWtsZW50aXllIGdpcm1lZGnEn2luaSBzYcSfbGF5YW4ga2FidWwgZWRpbG1pxZ8gVUkgZGF2cmFuxLHFn8SxIG9sbWFsxLEuCgpCdSByYXBvciB5YWxuxLF6IGZyb3plbiBzb3VyY2UgYGY5YzdlYjdkYjI5OWQwNjUzYjU1YTVlNDRkNGYyZGViNGI1ZDFjZmFgIGnDp2luZGlyLiBGaW5hbCBtZXRhZGF0YSwgc291cmNlLXRvLWZpbmFsIGRpZmYsIGZpbmFsIENJLCBtZXJnZSB2ZSBmZXRjaGVkLW1haW44IGJ1IGluY2VsZW1lbmluIGTEscWfxLFuZGEgdmUgaGVuw7x6IGRlxJ9lcmxlbmRpcmlsbWVkaS4gRTNSMVJFVklFVywgRTVfSU5fUFJPR1JFU1MsIFN1cGFiYXNlIDQ3LzU3LzU5LCBSRVQ5NywgcnVudGltZS9pZGVudGl0eSwgZ2Vyw6dlayBjaWhheiB2ZSB5YXnEsW4gaG9sZOKAmWxhcsSxIGHDp8Sxa3TEsXI7IGJ1IGJvdW5kZWQgR0FURSBow7xrbcO8IGJ1bmxhcsSxIGthcGF0bWF6LiBQUuKAmWEgeW9ydW0vYXBwcm92YWwgdmVyaWxtZWRpLCByZXBvIHZleWEgUFIgZGXEn2nFn3RpcmlsbWVkaS4=
```


R1 kodöncesi graph ilk koşusu tam rapordaki kısa plan dosya adlarını app içi bağlantı sanarak FAIL verdi. Özgün RAW Base64 değişmeden korunur; tam okunabilir rapor HTML karakter kodlamasıyla arşivlendi, denetleyici değiştirilmedi. F-01 kodöncesi kapsam commit 1fdab3f; bu bağlantı sunumu onarımı yerel kaynak onarımıdır, kabul değildir.


## F-01 yerel dar onarımı — henüz bağımsız kabul yok

Kodöncesi ret/düzeltme kapsamı 1fdab3f. requestContext yalnız seçilen operation için yeni okuma bağlamı ister; scope/request/subject açıkça taşınır, gerçek silme/aktarma/pasiflik uygulamaz. Alternatif seçimin gözden geçirilmesi ve silmeden koruyan alternatife geçiş yeni talep üretir. Aynı seçim talebi iki kez gönderilmez; eski callback kapsam/request/plan/phase/seçim/ekran/okuma/handler/offline değişiminde göndermez. Yeni işlem için eski request bağlamı yeniden kullanılamaz; farklı request, eşleşen operation, güncel dört okuma/on alan/iki otorite ve ayrı altı etki bağı gerekir. Silme yeni bağlamda tekrar açık onay ister.

Güncel kod LF SHA256 63e782afa5d3ea55f6b04a50d9930c998dfed848b147c752fb2c2b570d3db72c; test LF SHA256 7c9c6453b32bdcc9369b1c29fcc708205a85b347d605efdb190724377a977f51. Önceki277 normal değiştirilmeden ilk20 ve iki yeni davranış testiyle299 normal aynı son koşuda PASS. Strictformat32/0, analyze0; ayrı native1PASS. 30durum×3genişlik×3metinölçeği=270tamkaydırma düzeni. Native53PNG; Root yeni5 farklıoriginal gerçekten açtı,48RAW birebir daha önce okunmuş içeriklere eş doğrulandı;53 yenioriginal açıldı iddiası yok. 17soru aynı LFhash, yeni geçmişsiz ilkokuma ve bütün kaynakGATE/aynı-yeni-headCI-T3 henüz bekleniyor. GörevCHANGES_REQUESTED, ana100DONE106kalan206.

F01ilk hedef22test21PASS1FAIL: özel okuma tümü kapalı olduğunda olmayan CTA'yı test helper aradı. Negatif test gerçek ürün durumunu denetleyecek biçimde unreadable→CTA yok/özelmetin yok, readable-etkikapalı→callbacknull olarak düzeltildi; uygulama kapısı gevşetilmedi. F01R2hedef22PASS. İlkF01graph1 kısa plan adlarını danglinglink gördü; tam raporun HTML karakter sunumu+değişmeyenRAWBase64 arşivi ile giderildi. F01graph2 yalnız yeni kodun henüz eski kanıt subjectdigest'i olduğunu reddetti; aşağıdaki güncel özet açık onarım kaydıdır. R1ret/ilkoku/eski16CI/başarısızloglar korunur; hiçbiri yeni kaynak kabulü yerine kullanılmaz. Sorgu tek-istek kilidi değiştirilmedi; gerçek recovery sonucu halen kanıtlanmadı. Üretimkimlik/yetki/lifecycle/saklama/hukuk/yedek/cihaz/yayın HELD.

### F01 ham yerel günlükler

| Günlük | RAW bayt | SHA256 |
|---|---:|---|
| F01_precode_graph.log | 8077 | 0e3ffab254524bf7fd1dac2dc26b329887f99b1a9aad5d197dbb377bd17645e2 |
| F01_graph_R2.log | 8061 | b581f1ae70a0acf0b9ac66b3274e82b8b09c1dbd4525fed28e33b81445a91f1c |
| F01_target_R1.log | 4506 | 4e37f8ae2c5f9c03d8002dbcffb51df0103adb641c9f34f2167bba36c3c7b2a4 |
| F01_target_R2.log | 2250 | cfa99a6b234e7ff75f893c5b3261f6d8bd6f4701720b8ca128b19e5ba5951908 |
| F01_full_tests.log | 67139 | 8f504183fed7cebf6b49fdb8be2b5310b4ede288ec876cabf616cae41fdcfdb7 |
| F01_R2_full_tests.log | 65060 | b71ff4dee82a2eeead61f030078997b9136a1ac58b55424f053180560c857d5b |
| F01_R3_full_tests.log | 65957 | 06a7cdda67536a735cdb209d677422ef5532af75510e90b073692b28349c5c9d |
| F01_final_format.log | 49 | 19ea5cab376e2116ed939d60b455117f4b7577878196117ec74555ada49d2e09 |
| F01_final_analyze.log | 98 | b7f52d8e18b9c39a3b1d5448719751d6d9546dca1faab03a35f216c3049226c1 |
| native_R2.log | 259 | 1629b16c8b85c786b69abc45f72248e81b34327e0b4337e6b81393d6297a5a25 |

### R2 özgün native görüntü makbuzu

| Durum | Parça | Offset/end | RAW bayt | SHA256 |
|---|---:|---|---:|---|
| manage-active | 0 | 0.0/272.0 | 76572 | d2b4066986605a544f741af54a7bf9c24194a56266bfcd7d5d01ed497f661000 |
| manage-active | 1 | 272.0/272.0 | 68367 | 537d1af400ca952617f5d8db34f166692ad0d1b9ad8c44dd4eed15559106fa00 |
| manage-inactive | 0 | 0.0/272.0 | 76867 | 0e42fe9b685cc5632efa2598aacc44d1d2193e53ef3d9372fc415869cebe400d |
| manage-inactive | 1 | 272.0/272.0 | 68364 | 8b8e170bc55c0f86b9c8c637520f5c064b5cab3dcf26efc25fe638b37321a81b |
| deactivation-review | 0 | 0.0/273.0 | 87067 | c6746d7ede760419fa87393756bc77a1fc2c1fc64ba4c731dd26ca5191d7670b |
| deactivation-review | 1 | 273.0/273.0 | 79405 | 9c0f88be3d9903ecc0a0bd59fafc49169026ebae0a693d770a65cf832ddba430 |
| reactivation-review | 0 | 0.0/273.0 | 87557 | e0386da7a2aa4945abcd728720047c08d1dd4618f4084bd5a0e137c621598a5b |
| reactivation-review | 1 | 273.0/273.0 | 79322 | 70f5f9c6adaaae41fa6446fe84b45b494a8db7d90fec2cecfc98dbcf4ce5dd61 |
| transfer-context-requested | 0 | 0.0/624.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer-context-requested | 1 | 620.0/624.0 | 75536 | fa6220a2d6f412aad508ff8c8172d789b7afc182ceb8d6373a9b2936a0f7686e |
| transfer-context-requested | 2 | 624.0/624.0 | 74738 | 08af788e08bcebad4ac26b203a3f9e66c20c0e4f14082a55468e608fb001bd47 |
| delete-context-requested | 0 | 0.0/382.0 | 85010 | c9281e34669a71ada8b2f05ac979eeaa5ad266549e531d2633520c37e5e8a82c |
| delete-context-requested | 1 | 382.0/382.0 | 73368 | 2bcf8e3e9d0caa069d77c83333a0fc44f6083b578c9a489c89ce4755343631c8 |
| transfer | 0 | 0.0/454.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer | 1 | 454.0/454.0 | 79235 | fd9ef2d9c3019d8de333c3aa5fab9c43cff026c51d81c8312749029f082465cd |
| transfer-long | 0 | 0.0/546.0 | 82857 | 2db88095c13be7597aefc399baa9309cff83dc65e549cb59de7651157fbf4ba1 |
| transfer-long | 1 | 546.0/546.0 | 79235 | fd9ef2d9c3019d8de333c3aa5fab9c43cff026c51d81c8312749029f082465cd |
| delete-unacknowledged | 0 | 0.0/297.0 | 85181 | b8a402fa20b56c918cb1a9f415d932050a29d347bc7d1d564751b542720f52ca |
| delete-unacknowledged | 1 | 297.0/297.0 | 75845 | eaf92c5e238be2918b4f77e92f0c0a602f2363d5ffeb0ff3e6b7aa0ba9b39d7b |
| delete-acknowledged | 0 | 0.0/212.0 | 85630 | 1a860a0a3076805cbac2fc2e1e684da1a8994784378cea2be3190526a8e942b2 |
| delete-acknowledged | 1 | 212.0/212.0 | 77228 | 88219a62b88cb5f6cea2a36629bf655c3e84cd3fad202399e37241a1a17df31f |
| delete-alternative | 0 | 0.0/443.0 | 87067 | c6746d7ede760419fa87393756bc77a1fc2c1fc64ba4c731dd26ca5191d7670b |
| delete-alternative | 1 | 443.0/443.0 | 74820 | 901e7a49b94ec521665e5597d6c693e2c416a2cfb5cef4e8d69ea819b84fd8d6 |
| transfer-offline | 0 | 0.0/601.0 | 84062 | 905f7a6d3ba1d41f84460a88304b2a3b216736a3ba35b7214f14c867ff01bbae |
| transfer-offline | 1 | 601.0/601.0 | 75121 | da80d75bf0d7a6c27a43dc1c816da504f3cbb94ca77a8926f823471b67b97c62 |
| delete-offline | 0 | 0.0/359.0 | 87086 | 1096d5c188c89d1a8d51e6e7cd22bb108849a4cc4879422ff1ece6cf4918563b |
| delete-offline | 1 | 359.0/359.0 | 75845 | eaf92c5e238be2918b4f77e92f0c0a602f2363d5ffeb0ff3e6b7aa0ba9b39d7b |
| missing | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| source-missing | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| scope-missing | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| source-stale | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| source-held | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| source-unknown | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| source-foreign | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| private-period | 0 | 0.0/0.0 | 27377 | de3242fdc6b96e8d6504b87bdf592785f29eef9b06eb624f1266594ca75849b3 |
| no-handler | 0 | 0.0/539.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| no-handler | 1 | 539.0/539.0 | 75123 | 9324f1506e12d0c7cae4603d0a96ff64cc351d9939d08196ff6c77ef723b281a |
| operation-held | 0 | 0.0/539.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| operation-held | 1 | 539.0/539.0 | 75121 | da80d75bf0d7a6c27a43dc1c816da504f3cbb94ca77a8926f823471b67b97c62 |
| delete-busy | 0 | 0.0/62.0 | 76604 | 1383e4a19f353a9c336980c67d0043acf33bfc87e268e8a49960a313c539c2f4 |
| delete-busy | 1 | 62.0/62.0 | 71077 | 37b2acb90bbb9d15ca9d259388dafe397b3fb6b712e2f9740a1b63e0d33738fa |
| transfer-sent | 0 | 0.0/452.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer-sent | 1 | 452.0/452.0 | 78837 | 48ccdf12d1d09696205d5f3a7d9162be683a7cef8728bd53d5c2c9cce2bb6ae0 |
| delete-failed | 0 | 0.0/126.0 | 82028 | 1e013964fcbf15bebd183dbc3d3c2e03edc8366ac9f9ad1bebcff0c80f4b0eab |
| delete-failed | 1 | 126.0/126.0 | 75458 | a080ed8da38ddf2922de2d1b67533fe8832e11b910b982d99d9abfa24980e500 |
| transfer-unknown | 0 | 0.0/516.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer-unknown | 1 | 516.0/516.0 | 77243 | b1b4531003fab245500d0c3f887972c153fb90c7fd985f628a4b489632a46923 |
| transfer-query | 0 | 0.0/516.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer-query | 1 | 516.0/516.0 | 75233 | 4baa1fdb0364e93769086ea96f9d079896f593ef958a3d75c46b4b93b9bc2bb7 |
| delete-bare-allow | 0 | 0.0/126.0 | 82028 | 1e013964fcbf15bebd183dbc3d3c2e03edc8366ac9f9ad1bebcff0c80f4b0eab |
| delete-bare-allow | 1 | 126.0/126.0 | 75458 | a080ed8da38ddf2922de2d1b67533fe8832e11b910b982d99d9abfa24980e500 |
| transfer-received | 0 | 0.0/475.0 | 83391 | d0541f29dd84f0bde735d1030a47a5af61f93cf3e82c194d74ae10f4a0c13caf |
| transfer-received | 1 | 475.0/475.0 | 77356 | 2ca9325a14f50757e5d7f65794751a9cc245d19f309d2a8457e3aeb3140324c7 |
