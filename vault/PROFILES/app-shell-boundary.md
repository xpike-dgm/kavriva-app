---
record_id: V-E1-SHELL-001
version: 1
purpose: Beş bölümlü Flutter sunum kabuğunu alan verisi ve kararlarından ayrı oluşturmak
domain: app-shell
module: e01-app
owner: E1
implements: [ADR-008, C1.0, F1.0.1, R-001, R-003, R-004, R-007, R-011, R-012, R-013, R-014]
public_contracts: []
internal_scope: shell-presentation
tasks: [T-E1-001]
tests: [modules/e10-graph/checks/check_registration.py, modules/e10-graph/checks/check_links.py]
superseded_by: []
last_verified: 2026-10-04
depends_on: [M-E1-001, M-E3-001, M-E5-001, M-E4-001, I-E10-PATHS-001, V-CI-001]
used_by: [P-E1-001, T-E1-001, E-DEV-097]
evidence: [E-DEV-097]
supersedes: []
status: ACTIVE
---

# Beş bölümlü sunum kabuğu

Kanonik T-E1-001: **Five tabs; bottom-bar HELD; no dashboard/KPI/card-stack**. C1.0/F1.0.1/FL1.0.1 yalnız sunum kabuğudur, SCR-005 motor bağlamı T-E1-002’de ayrı. Beş sıra Garaj · Bakım · AI Usta · Geçmiş · Topluluk. Yeni route, dashboard, skor, kart yığını, motor verisi veya A1 ayrıntı akışı eklenmedi. İlk landing sekmesi ve aktif fiziksel işte alt-bar görünürlüğü/etkileşimi kesinleştirilmedi; kaynak hükmü HELD korunur.

## Bileşenin sınırı

`modules/e01-app/internal/shell/lib/kavriva_shell.dart` beş çağıran görünümü taşıyan iç E1 bileşenidir. Seçili sekme ve gezinme görünürlüğü zorunlu girdidir; varsayılan ilk sekme yok. onSectionRequested yalnız istek bildirir; seçimi kendisi uygulamaz ve hiçbir etkiye izin vermez. İstek callback’i yoksa kontrol etkinleşmez. Eksik görünüm release modunda da ArgumentError üretir. Bileşen bir uygulama entrypoint’i, hesap veya kanonik veri deposu değildir; native mobil proje/Runner oluşturulmadı.

Beş görünüm aynı anahtarlı IndexedStack altında tutulur; testte yerel editör taslağı sekme çıkış/dönüşünde kaybolmaz. Gizli çocuklar semantics/focus/ticker dışında kalır. Bu yalnız widget state korunumu; kalıcı defter, restore, güncel fiziksel durum, güvenlik veya yetki kanıtı değildir. DP05 fiziksel durumun rota devamlılığından üstünlüğü değişmez. Aktif fiziksel iş akışı bu bileşenin test fixture’ıyla açılmaz.

E1 yalnız gösterir; E3 sunar/doğrular, E5 yetkilendirir; E4 kalıcı paket/defter gerçeği çerçeve dışında. E9→E1 öneri hattı değişmez, hiçbir private import veya yeni seam yok. Kitaplık yalnız Flutter widgets/services SDK kullanır; SDK içindeki bağımlılıklar kilit dosyasında kayıtlı, ek ürün plugin’i/Material UI paketi/provider/SDK seçilmedi.

## Sunum ve erişilebilirlik

Türkçe etiketler hesap veya profil istemez. Girdilerde sayısal değer gösterilmedi; yeni birim/ayar ekranı seçilmedi. Yalnız çalışma yönüne uygun açık zemin/koyu yazı/sınırlı mavi kullanılır, üretim token/font/ikon ailesi onayı değildir. Stil çağıranın fontunu miras alır. Seçili/etkin/button/focus semantics, Tab/Enter/Space, 320/390/768 genişlik ve 1/2/3 metin ölçeği testleri vardır; yazı kısaltılmaz. R012 public/classification kuralı, gerçek cihaz erişilebilirliği yerine geçmez. R01–R05 görüntüleri repoda yok; birebir ekran sadakati veya üretim görüntü varlığı iddiası yok. Test PNG’si SDK Roboto ile yalnız fixture çizimidir.

## Araç ve üretim sınırı

`modules/e01-app/internal/shell/toolchain.lock.json` gerçek SDK source/engine/Dart3.13, 24 bağımlılık (21 hosted hash ve 3 SDK), SDK workspace kilidi ve yerelde gözlenen Windows test-engine dosya özetlerini kaydeder. SDK 3.47.0 release tag’i detached çekildi; channel çıktısı user-branch, stable checkout diye sunulmaz. Windows binary özetleri yerel gözlemdir; Linux binary eşitliği veya signed release provenance değildir. Proje içinde platform plugin/registrant/Android Runner/Gradle/iOS/Xcode çıktısı yok. Yeni CI yalnız headless widget geliştirici kontrolüdür; Android/iOS derleme, gerçek cihaz, signing/store/release veya clean-room kabulü değildir. T-E7-001 fiziksel sekiz koşulu HELD kalır.

## Negatifler ve açık işler

Eksik görünüm, otomatik ilk sekme, seçim isteğini onay sayma, saklı ekran odağı/semantics sızması, büyük metnin kesilmesi, yerel state’i fiziksel gerçek sayma reddedilir. Callerin gerçek güvenlik/restore/recall akışları bu fixture’da uygulanmış değildir. Aktif-iş alt-bar, gerçek cihaz/a11y/novice comprehension, E3 kimlik/yazıcı, E5 current authorization ve bütün yayın gate’leri HELD; E3R1 REVIEW/E5-003 IN_PROGRESS/PR47-57-59/retli PR97 değişmez.

Kaynaklar plan fa914f013fdcd032faed876689092da245989459 ve taban f301195c59022758bcdc0fc9a51c0ddce990e501; 14 alan/9 sabit app pin/18 repo yolu pack’te. Boş public_contracts yeni modüller arası contract olmadığını, supersedes boşluğu başka kaydın yerini almadığını gösterir. Kanıt `vault/EVIDENCE/E-DEV-097.md`; görev `vault/REGISTRY/T-E1-001.md`; pack `vault/PACKS/P-E1-001.md`.

## Sınırlı shell kabul kaydı

Bağımsız /root/e1001_shell_full_review (gpt-6-luna/max) bütün kaynak 0a1bd18b5da7c4d39b110d98a27017be1c3af083 için FULL PASS; önceki P2 kapalı. Gerçek aynı kaynak 16/16 CI SUCCESS ve PR T3 beş adım SUCCESS. Ayrıntılı makbuz `vault/EVIDENCE/E-DEV-097.md`. Bu yalnız T-E1-001 shell kabulüdür; gerçek cihaz/native/yayın/aktif-iş/üretim kaynakları HELD kalır. Sınırlı son kayıt metadata incelemesi ve son başlık CI ayrıca zorunlu; merge henüz yapılmadı.
