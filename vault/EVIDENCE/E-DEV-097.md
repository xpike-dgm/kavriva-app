---
test_id: E-DEV-097
contract_id_version: "ADR008 D2+D8; C1.0/F1.0.1/FL1.0.1 shell v1"
subject_file: modules/e01-app/internal/shell/lib/kavriva_shell.dart
subject_digest: da27ef521cceb276cae4137375510b10f2a0c283c71af8be0d23e41aca2a03bb
result: "RECORDED gerçek headless widget sonuçları; bağımsız kabul bekleniyor"
evidence_links:
  - "vault/PROFILES/app-shell-boundary.md"
  - "vault/PACKS/P-E1-001.md"
  - "vault/REGISTRY/T-E1-001.md"
  - "modules/e01-app/internal/shell/lib/kavriva_shell.dart"
  - "modules/e01-app/internal/shell/test/shell_test.dart"
  - "modules/e01-app/internal/shell/pubspec.lock"
  - "modules/e01-app/internal/shell/toolchain.lock.json"
  - "vault/EVIDENCE/SNAPSHOTS/E-DEV-096-E10-GOVERNED-PATHS-FOR-T-E1-001.md.snapshot"
  - ".github/workflows/e1-tests.yml"
gate_verdict: "RECORDED kabuk REVIEW; aktif-iş/cihaz/ürün/yayın HELD"
reviewer: none
timestamp: 2026-10-04
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
depends_on: [V-E1-SHELL-001]
used_by: [V-E1-SHELL-001, P-E1-001, T-E1-001]
evidence: []
supersedes: []
status: RECORDED
---

# E-DEV-097 — beş bölümlü kabuk

Artifact öncesi pack b82113028a2c9dbe618c1b84d46b20e03417adaa; taban f301195c59022758bcdc0fc9a51c0ddce990e501/v63, plan fa914f013fdcd032faed876689092da245989459. Kaynak kod LF SHA256 da27ef521cceb276cae4137375510b10f2a0c283c71af8be0d23e41aca2a03bb, test LF 69dc7a0589b88e043f2a9ac9db177a2e57bf5c3baf78a6b35139997b0116610b, pub lock LF 31bea7713638489095ebe69ef458941398b3063e7067f91d4d80039cf988ec18, toolchain LF 73b4f014b9537e08724d9dc62e23c904a0c650a9ca0621eb3d54890ae18359ec. Ham v63 arşivi 189824 bayt, raw SHA256 87599d44c79518aa5021e30bc67af15f1d94f16a045a6961b07f4e4193c62d21; taban Git blobuyla bayt eşit. Önceki E-DEV-096 birincil özet/inceleme/hüküm/geçmiş değişmez; yalnız tüketici ve gerçek PR98 ikincil makbuzu eklenir. v64/89 görünüme kabul adayını eklemek eski katalog401/79 veya pending13-23-25 yollarını çözmez.

## Gerçek yazar kontrolleri

Windows gerçek SDK3.47.0/framework4cf24164269a5ebf0c16a028a00727d0e77bbb05/engine5f77625673248ee5846fbcaf5d3e1a3878386fd7/Dart3.13.0 doğrulandı; SDK tracked worktree temiz. pub get --enforce-lockfile başarılı; 24 paket/21 hosted SHA/3SDK lock. Dart format iki dosya0değişim; analyze no issues11.0s. Son widget koşusu 11/11PASS (10 anlamlı kontrol + yerel capture), yaklaşık1s test aşaması. Seçili/sıra/istek-vs-karar/state/gizli semantics-focus/klavye/kapalı gezinme/büyük metin9kombinasyon/dokunma alanı/kontrast ölçüldü. PNG gerçekten üretildi; 390x844, SHA256 a2cb240f4e86cc79937864a645450096cc36b58230e3e6260748edbfed3e0065; yerel görsel incelemesinde beş tam Türkçe etiket, seçili Bakım, açık zemin, koyu okunabilir yazı ve taşmayan yerleşim görüldü. Bu test harness çizimi; gerçek motor/record/hesap yok. PNG yalnız geliştirme Temp’te, üretim asset’i değil.

Bu sonuç gerçek Android/iOS cihaz, native build/signing/store, aktif fiziksel iş veya restore/recall/audit/authorization kabulü değildir. SDK native test binary özetleri yalnız gözlenen Windows byte’larını tanımlar; bütün platformlar veya provider-independent clean-room eşitliği kanıtlanmaz.

# T-E1-001 hazırlık ve doğrulama geçmişi

Pack-only b821130, taban f301195; 14 alan/9 sabit kaynak/18 yol. SDK kaynağı gerçek3.47tag4cf24164269a5ebf0c16a028a00727d0e77bbb05, engine5f77625673248ee5846fbcaf5d3e1a3878386fd7; gerçek araç3.47/Dart3.13.0. Tag checkout user-branch olarak raporlanır; stable branch varmış gibi yazılmaz. Resmî release-list JSON404; GitHub tag ve engine API, sonra gerçek clone SHA eşleşti. Flutter analytics kaynakta doğrulanmış env ile bastırıldı. İlk SDK bootstrap kendi olağan dependency çözümünü yaptı; sonraki paket işlemlerinde PUB_CACHE SDK bin/cache/kavriva-pub olarak sınırlandı.

İlk analyze dört eski API kullanımı nedeniyle exit1 verdi (hasFlag3/pipelineOwner1). Güncel SDK flagsCollection ve rootPipelineOwner ağacı kullanılarak düzeltildi. Bir format çağrısı paket yerine repo kökünde çalıştı, lib/test bulunamadı ve dosya formatlamadı; bu sonuç paket format kabulü sayılmadı. Paket dizininde gerçek formatter2dosya ve analyze0issues yeniden doğrulandı.

İlk widget denemesi tamamlanmış başarı değildir: 7 geçiş, 3 hata (semantics handle iki testte kapanıştan önce bırakılmalı; klavye fixture'ındaki pasif Focus öğesi isteği yakalıyordu). PNG capture fake-async içinde beklediği için kendi test süreci Ctrl-C ile güvenli durduruldu, exit1. Gerçek PNG başarı iddiası yok. SDK kaynağından testWidgets semanticsEnabled=true doğrulandı; fazladan iki manuel handle kaldırıldı, gerçek semantics kontrolleri korundu. Pasif fixture odağı kapatıldı; klavye Enter ve Space ile iki bölüm isteği ölçülüyor. Görsel capture native async işlemleri runAsync içine alındı, 30s test süresi sınırı eklendi. Bütünlük, fiziksel aktif-iş veya üretim testi yerine geçmez. Sonuç yeniden bekleniyor.

İkinci widget denemesi10geçiş/1klavyehatası exit1; PNG gerçekten üretildi. Önceki “pasif Focus sebep” açıklaması tek başına doğrulanmadı; Focus fixture daraltması ilk Tab her zaman Garajdır varsayımını düzeltmedi. Çağıran sayfada ScrollView gibi doğal odak durakları olabilir; test görevin kilitlemediği global focus sırasını seçiyordu. Test gerçek erişilebilirlik ağacında Garaj ve Bakım odağına bounded Tab traversal ile ulaşıldığını, ardından Enter/Space isteklerini ölçer; üretim klavye eylemi veya semantics kontrolleri kaldırılmadı. Sonuç yeniden bekleniyor.

Bounded keyboard denemesi1test başarısız; ardından dar teşhis1test başarısız. Gerçek focus ağacı beş navigation FocusNode focusable gösterdi ama primaryFocus=null idi. Dolayısıyla önceki pasif Focus/ScrollView varsayımları sorunu açıklamıyor; teşhis onları düzeltiyor. Widget fixture WidgetsApp.builder ile Navigator/route focus scope başlatmıyordu. Standart WidgetsApp.onGenerateRoute/PageRouteBuilder hostuna geçildi; üretim kabuğuna ilk odak/ilk sekme/aktif-iş davranışı eklenmedi. Geçici debug çıktısı kaynaktan kaldırıldı. Sonuç yeniden bekleniyor.

## Son kabul sınırı

Bütün canonical TASK_INDEX/feature/flow/acceptance/shell source qualifiers incelemeci tarafından okunmalı; taskı sırf fixture yeşil diye daraltmak veya aktif alt-bar/ilk landing kararını seçmek yasak. Bağımsız bütün görev hükmü, aynı sourcehead CI ve sınırlı son kayıt/CI incelemesi bekleniyor. Graph ve kaynak manuel doğrulaması henüz aşağıda gerçek sonuçla eklenecek.

## Kaynak bağlantısı ve graph düzeltmesi

İlk graph koşusunda 11/12 kontrol geçti; check_links, HELD kaydının gövdede çözülen kaynak bağlantısı bulunmadığı için exit1 verdi. 42 regresyon geçti (.418s); bu koşu genel başarı değildir. Açık ürün/cihaz/aktif-iş sınırlarının kaynağı `vault/PACKS/P-E1-001.md` ve `vault/PROFILES/app-shell-boundary.md`; görev `vault/REGISTRY/T-E1-001.md`. Gerçek kaynak bağlantıları eklendi; kontrol bastırılmadı. Dar klavye testi ardından son tam koşu 11/11 geçti; geçici teşhis çıktıları kaldırıldı.

Son kaynak kontrolu: dogru checks/run_all.py adresinde 12/12 kontrol ve 42 regresyon PASS (.402s), worst exit0. Onceki yanlis run_all.py adresi dosya bulunamadi exit2; test sonucu sayilmadi. Manuel 18/18 izinli yol, 9/9 taban pin, ham v63 bayt esitligi, onceki EDEV096 birincil govde korunumu ve pub kilit ozeti dogrulandi. SDK sabitli CI Linux sonucu henuz bekleniyor.
