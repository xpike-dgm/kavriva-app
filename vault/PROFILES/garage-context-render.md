---
record_id: V-E1-GARAGE-001
version: 1
purpose: Seçili motosiklet bağlamını ve değiştirme/yönetim girişlerini yalnız sunum olarak göstermek
domain: garage-context
module: e01-app
owner: E1
implements: [ADR-008, C1.0, F1.0.1, SCR-005, SCR-008, BR-045, BR-106, BR-107, BR-134, BR-135, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: garage-context-presentation
tasks: [T-E1-002]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E1-001, M-E3-001, M-E5-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-002, T-E1-002, E-DEV-098]
evidence: [E-DEV-098]
supersedes: []
status: ACTIVE
---

# Garaj bağlamı sunumu

Kanonik T-E1-002: **Display/switch; lifecycle entry; no hub**. SCR-005/008 ve FL1.0.2; E1 renders, E3 serves, E5 authorizes, E4 canonical truth dışarıda. Önkoşul T-E1-001 gerçek PR99 ile birleşti. Bu yalnız sunum bileşeni kabul adayıdır; üretim kaynakları veya native uygulama kurulmuş değildir.

## Girdi ve ayrı motosiklet bağlamları

GarageSnapshot çağıranın immutable sunum girdisidir. Boş/çift kimlik, listede olmayan seçilim ve başka motosiklete bağlı kritik/yarım iş bildirimi release modunda da ArgumentError üretir. Seçili kimlik nullable ve açık zorunlu girdidir; ilk motosiklet seçilmez. Motosiklet listesi immutable kopyadır; dış listenin değişimi sessiz seçilim üretmez. Şemadaki alanlar internal E1 presentation bilgisi, yeni canonical store veya cross-capsule contract değildir.

Değiştirme, yönetim, geçmiş, kritik düzeltme ve yarım iş girişleri yalnız doğru motosiklet kimliğiyle istek verir. Ekran değişimi çağıran yeni snapshot verince olur; yerel kod aktive etmez, premium/entitlement/fit/authority kararı üretmez, DB veya API çağırmaz. Motosiklet değişince eski motosikletin uyarı ve yarım iş ayrıntısı diğer motosiklete taşınmaz. Liste yalnız motosiklet ad/durum ve uyarı varlığı gösterir; geçmiş/reminder/mileage/aktif iş verileri birleştirilmez. Temel izolasyon premium olarak sunulmaz. E3/E5 gerçek kaynağı henüz bağlanmadı, test verisi gerçek kayıt değildir.

## Sunum kapsamı ve güvenlik

Seçili ad, açık aktif/inaktif etiketi ve varsa varyant açıklaması; bilinmeyen varyant açıkça bilinmiyor kalır. Uygulama uygunluğu ayrıca kontrol edilir. Cache güncel durum/izin sayılmaz. Boş veya unavailable durumları motosiklet veya hesap şartı üretmez. Lifecycle yalnız yönetim girişidir; archive/transfer/delete ve gerçek aktivasyon başka tasklarda.

Inaktif motosikletin geçmiş/güvenlik/yarım iş girişleri etkin callback varsa erişilebilir kalır; active flag bunları kapatmaz. Kritik düzeltme yönetimden önce açık metin başlığıyla görünür; sadece renk değildir. Diğer motosikletin kritik uyarı varlığı seçme satırında görünür, ayrıntısı seçili motosikletin ayrıntısı gibi gösterilmez. Interrupted work saved progress fiziksel proof veya devam izni sayılmaz. Kaynak/handler yokken uyarı metni kaybolmaz ve açma girişinin kullanılamadığı açıkça söylenir. Profil, dashboard/KPI/card-stack, maintenance/history/community ana hub veya yeni fiziksel instruction yok.

## Türkçe ve erişilebilirlik

Etiketler Türkçe; numeric/mileage/reminder kaynağı yoksa değer veya birim uydurulmaz. Text büyür ve scroll ile okunur; maxLines/ellipsis yok. Label/button/enabled/selected semantics ve doğal Tab/Enter klavye, en az48 dokunma kontrolü ve dokuz320/390/768×1/2/3 metin ölçeği testleri mevcut. Görsel varlık/audio/video eklenmedi; caption/voice implementation veya gerçek cihaz a11y kabulü iddia edilmez. Mevcut shell çalışma renkleri ve caller fontu kullanılır; final token/font/ikon ailesi seçilmez. İlk landing ve aktif-iş bar davranışı HELD.

## Doğrulama ve kalan kaynaklar

Yerel son paket format4dosya0değişim, analyze0sorun10.3s, 24 widgetPASS (13garage+10shell+1optionalTempPNGcapture). CI capture açmaz, 23 davranış testi çalıştıracak. Gerçek390x844 PNG açık zeminde seçili denemeB, iki motosiklet satırı, yönetim/geçmiş girişleri ve beş sekme gösterir; üretim ekranı/verisi/yayın kanıtı değildir. SDK3.47/engine/Dart3.13/24lockeddeps ve bütün mevcut lock/workflow/shell kod/test kaynakları değişmez. İlk analyze/test/PNGQA başarısızlıkları kanıtta korunur.

Bütün canonical kaynak ve exactsourceCI/T3 bağımsız Luna Max incelemesi beklenir; sırf fixture veya belge varlığı DONE sayılmaz. E3R1 REVIEW/E5-003 IN_PROGRESS/PR47-57-59/retliPR97, gerçek producer/authority/cihaz/physical safety/yayın HELD değişmez. Boş public_contracts yeni runtime seam yokluğunu; boş supersedes önceki record değiştirilmediğini belirtir.

Pack `vault/PACKS/P-E1-002.md`; görev `vault/REGISTRY/T-E1-002.md`; kanıt `vault/EVIDENCE/E-DEV-098.md`.

İlk kaynak bb994 bağımsız CHANGES_REQUESTED/P2 kontrol işareti kontrastı; aynı görevde normal sınır belirginleştirildi. Gerçek shell üzerindeki boya/yazı/zemin ve klavye odağı ölçümü yeni teste eklendi. Güncel 24 yerel PASS, yeni bütün kaynak incelemesi ve aynı kaynak CI bekleniyor; önceki 17 yeşil yalnız bb994 makbuzudur. Geçmiş kanıtta korunur.

## Garaj görevinin kaynak kabulü

Bağımsız /root/e1002_luna_max_rereview, insanın istediği gpt-6-luna/max ayarıyla ayrı görevlendirildi. Tam kaynak 3b930263616aafb363eb44728a8db3309863583d FULL PASS; önceki bb994 kontrast P2 kapalı, yeni bulgu yok. Bu ayar görevlendirme metadata kaydıdır, bağımsız runtime model attestation değildir. İncelemeci kod yazmadı/test/CI/ağ çalıştırmadı. Sahip bağımsız alt ajanı DEC-0069 ve sohbet yetkisiyle kabul etti; implementer self-PASS değildir. Aynı kaynak16/16 gerçek CI SUCCESS, PR T3beş/checksyedi adım SUCCESS. Ayrıntılı kanıt `vault/EVIDENCE/E-DEV-098.md`.

Bu yalnız kanonik Display/switch; lifecycle entry; no hub, motosiklet ayrımı ve Türkçe/erişilebilirlik Garaj sunumunun kabulüdür. Üretim veri/kimlik/authority, native/gerçek cihaz, fiziksel iş/güvenlik ve yayın MISSING/HELD değişmez. Önceki bekleyişler tarihsel yazım anlarını gösterir. Sınırlı son kayıt adayı: bağımsız son metadata incelemesi ve aynı son başlık CI/T3 ayrıca beklenir; merge henüz yapılmadı. Sahibin son talimatı bu görev tamamlanınca güvenli durmaktır; sonraki görev başlatılmayacak.
