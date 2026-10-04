import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/teaching_only.dart';
import 'package:kavriva_shell/variant_resolution.dart';

VariantContext _context({
  String bike = 'bike-a',
  String guide = 'guide-a',
  String revision = 'r1',
}) => VariantContext(
  motorcycleId: bike,
  guideId: guide,
  contextRevision: revision,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
  guideLabel: 'Örnek konu kapsamı',
);
TeachingSourceReference _source({
  TeachingFreshness freshness = TeachingFreshness.current,
}) => TeachingSourceReference(
  source: 'Örnek öğrenme kaynağı',
  version: 'kaynak-r3',
  location: 'Bölüm 2 · sayfa 5',
  checkedAt: '2026-10-04',
  freshness: freshness,
);
TeachingConcept _concept({
  String id = 'scope',
  String title = 'Konu kapsamı neden önemlidir?',
}) => TeachingConcept(
  id: id,
  title: title,
  explanation: 'Bir açıklamanın hangi konuyu anlattığı ile hangi motosiklete uygulanabileceği ayrı bilgilerdir. Genel açıklama seçili motosikletin güncel uygunluk ve hazırlık değerlendirmesinin yerine geçmez.',
);
TeachingTopic _topic({
  TeachingScope scope = TeachingScope.generalReference,
  VariantContext? context,
  TeachingSourceReference? source,
  bool proof = true,
  List<TeachingConcept>? concepts,
}) => TeachingTopic(
  id: 'topic-a',
  revision: 'topic-r2',
  title: 'Örnek konuya giriş',
  purpose:
      'Konu kapsamı ile motosiklete uygulanabilirlik arasındaki farkı anlamak.',
  applicationUnavailableReason: 'Seçili motosiklet için güncel uygunluk ve zorunlu hazırlık koşulları ayrıca değerlendirilmelidir.',
  scope: scope,
  context: scope == TeachingScope.motorcycleContext
      ? context ?? _context()
      : context,
  source: proof ? source ?? _source() : null,
  concepts: concepts ?? [_concept()],
);
Widget _view({
  VariantContext? context,
  TeachingTopic? topic,
  bool offline = false,
  bool busy = false,
  String? error,
  ValueChanged<TeachingRecheckRequest>? recheck,
  ValueChanged<VariantContext>? back,
}) => TeachingOnlyView(
  context: context ?? _context(),
  topic: topic,
  offline: offline,
  busy: busy,
  errorMessage: error,
  onRecheckRequested: recheck,
  onBackRequested: back,
);
Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFFFFFFF),
    onGenerateRoute: (_) =>
        PageRouteBuilder<void>(pageBuilder: (_, __, ___) => const _Scene()),
  ),
);

class _Input extends InheritedWidget {
  const _Input({
    required this.content,
    required this.scale,
    required this.font,
    required super.child,
  });
  final Widget content;
  final double scale;
  final String? font;
  @override
  bool updateShouldNotify(_Input old) =>
      content != old.content || scale != old.scale || font != old.font;
}

class _Scene extends StatelessWidget {
  const _Scene();
  @override
  Widget build(BuildContext context) {
    final i = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(i.scale)),
      child: ColoredBox(
        color: const Color(0xFFF8FAFC),
        child: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF101827),
            fontFamily: i.font,
          ),
          child: i.content,
        ),
      ),
    );
  }
}

Future<void> _tap(WidgetTester t, String label) async {
  final f = find.bySemanticsLabel(label);
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pump();
}

const _recheck = 'Uygunluğu ve hazırlığı yeniden kontrol et';
const _back = 'Önceki ekrana dön';
Finder _buttons() => find.byWidgetPredicate(
  (w) => w is Semantics && w.properties.button == true,
);
void _noPhysicalControls() {
  expect(_buttons(), findsNWidgets(2));
  for (final label in [
    'Rehberi başlat',
    'Adımı tamamladım',
    'Tamamlandı',
    'Yine de devam et',
    'Hazırım',
  ]) {
    expect(find.bySemanticsLabel(label), findsNothing);
  }
}

void main() {
  test('boş kaynak/kavram/konu, çift kavram ve genel-özel karışımı reddedilir; liste değişmez', () {
    expect(
      () => TeachingConcept(id: ' ', title: 'başlık', explanation: 'açıklama'),
      throwsArgumentError,
    );
    expect(
      () => TeachingSourceReference(
        source: ' ',
        version: 'v',
        location: 'b',
        checkedAt: 't',
        freshness: TeachingFreshness.unknown,
      ),
      throwsArgumentError,
    );
    expect(() => _topic(concepts: []), throwsArgumentError);
    expect(
      () => _topic(concepts: [_concept(), _concept()]),
      throwsArgumentError,
    );
    expect(() => _topic(context: _context()), throwsArgumentError);
    expect(
      () => TeachingTopic(
        id: 'a',
        revision: 'r',
        title: 't',
        purpose: 'p',
        applicationUnavailableReason: 'n',
        scope: TeachingScope.motorcycleContext,
        context: null,
        source: null,
        concepts: [_concept()],
      ),
      throwsArgumentError,
    );
    final concepts = [_concept()];
    final topic = _topic(concepts: concepts);
    concepts.clear();
    expect(topic.concepts, hasLength(1));
    expect(() => topic.concepts.clear(), throwsUnsupportedError);
  });
  testWidgets(
    'genel konu ve kaynak görünür; recheck ve geri yalnız doğru bağlamlı niyettir',
    (t) async {
      final context = _context();
      final topic = _topic();
      TeachingRecheckRequest? requested;
      VariantContext? returned;
      await t.pumpWidget(
        _app(
          _view(
            context: context,
            topic: topic,
            recheck: (r) => requested = r,
            back: (c) => returned = c,
          ),
        ),
      );
      expect(find.text('Yalnız öğrenme ve bilgi'), findsOneWidget);
      expect(
        find.textContaining('Genel öğrenme bilgisi; bu motosiklete özel'),
        findsOneWidget,
      );
      expect(find.text('Kaynak: Örnek öğrenme kaynağı'), findsOneWidget);
      expect(find.text('Sürüm: kaynak-r3 · Bölüm 2 · sayfa 5'), findsOneWidget);
      expect(find.text('Kontrol zamanı: 2026-10-04'), findsOneWidget);
      _noPhysicalControls();
      await _tap(t, _recheck);
      expect(identical(requested!.context, context), isTrue);
      expect(requested!.topicId, 'topic-a');
      expect(requested!.topicRevision, 'topic-r2');
      await _tap(t, _back);
      expect(identical(returned, context), isTrue);
      expect(find.text('Yalnız öğrenme ve bilgi'), findsOneWidget);
      _noPhysicalControls();
    },
  );
  testWidgets(
    'eski/bilinmeyen/kaynaksız ve çevrimdışı açıklama okunur; uygulama açılmaz',
    (t) async {
      for (final offline in [false, true]) {
        for (final source in [
          _source(),
          _source(freshness: TeachingFreshness.stale),
          _source(freshness: TeachingFreshness.unknown),
          null,
        ]) {
          await t.pumpWidget(
            _app(
              _view(
                topic: _topic(
                  scope: TeachingScope.motorcycleContext,
                  source: source,
                  proof: source != null,
                ),
                offline: offline,
                recheck: (_) {},
                back: (_) {},
              ),
            ),
          );
          expect(find.text(_concept().explanation), findsOneWidget);
          _noPhysicalControls();
          expect(find.textContaining('Uygulama kapalı:'), findsOneWidget);
          if (offline)
            expect(find.textContaining('Çevrimdışısın.'), findsOneWidget);
          if (source == null)
            expect(
              find.textContaining('Kaynak bilgisi eksik;'),
              findsOneWidget,
            );
          if (source?.freshness == TeachingFreshness.stale)
            expect(find.textContaining('Kaynak bilgisi eski.'), findsOneWidget);
          if (source?.freshness == TeachingFreshness.unknown)
            expect(
              find.textContaining('Kaynağın güncelliği bilinmiyor'),
              findsOneWidget,
            );
          await _tap(t, _recheck);
          _noPhysicalControls();
        }
      }
    },
  );
  testWidgets(
    'eksik/yabancı motor-rehber-revizyon konu ve kaynak gizlenir, mevcut bağlam kontrol edilir',
    (t) async {
      final context = _context();
      TeachingRecheckRequest? request;
      for (final topic in [
        null,
        for (final foreign in [
          _context(bike: 'other'),
          _context(guide: 'other'),
          _context(revision: 'other'),
        ])
          _topic(scope: TeachingScope.motorcycleContext, context: foreign),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              context: context,
              topic: topic,
              recheck: (r) => request = r,
              back: (_) {},
            ),
          ),
        );
        expect(find.text('Bu bağlam için açıklama yok'), findsOneWidget);
        expect(find.text(_concept().explanation), findsNothing);
        expect(find.text('Kaynak: Örnek öğrenme kaynağı'), findsNothing);
        await _tap(t, _recheck);
        expect(identical(request!.context, context), isTrue);
        expect(request!.topicId, isNull);
        expect(request!.topicRevision, isNull);
        _noPhysicalControls();
      }
    },
  );
  testWidgets(
    'handler yok disabled; busy niyetleri kapatır, hata açıklamayı korur ve yeniden denemeye izin verir',
    (t) async {
      final semantics = t.ensureSemantics();
      try {
        final topic = _topic();
        var calls = 0;
        await t.pumpWidget(_app(_view(topic: topic)));
        for (final label in [_recheck, _back]) {
          await t.ensureVisible(find.bySemanticsLabel(label));
          await t.pumpAndSettle();
          expect(
            t.getSemantics(find.bySemanticsLabel(label)),
            matchesSemantics(
              isButton: true,
              hasEnabledState: true,
              isEnabled: false,
              label: label,
            ),
          );
          await _tap(t, label);
        }
        expect(
          find.textContaining('Yeniden kontrol şu anda kullanılamıyor'),
          findsOneWidget,
        );
        await t.pumpWidget(
          _app(
            _view(
              topic: topic,
              busy: true,
              recheck: (_) => calls++,
              back: (_) => calls++,
            ),
          ),
        );
        await _tap(t, _recheck);
        await _tap(t, _back);
        expect(calls, 0);
        expect(find.text(_concept().explanation), findsOneWidget);
        await t.pumpWidget(
          _app(
            _view(
              topic: topic,
              error: 'Değerlendirme tamamlanamadı; yeniden deneyebilirsin.',
              recheck: (_) => calls++,
              back: (_) => calls++,
            ),
          ),
        );
        expect(find.text(_concept().explanation), findsOneWidget);
        expect(
          find.textContaining('Değerlendirme tamamlanamadı'),
          findsOneWidget,
        );
        await _tap(t, _recheck);
        expect(calls, 1);
        _noPhysicalControls();
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets(
    'Tab Enter Space iki recheck ve doğru geri dönüş niyeti gönderir',
    (t) async {
      final requests = <TeachingRecheckRequest>[];
      VariantContext? returned;
      final context = _context();
      await t.pumpWidget(
        _app(
          _view(
            context: context,
            topic: _topic(),
            recheck: requests.add,
            back: (c) => returned = c,
          ),
        ),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pump();
      expect(requests, hasLength(2));
      for (final r in requests) {
        expect(identical(r.context, context), isTrue);
        expect(r.topicRevision, 'topic-r2');
      }
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      expect(identical(returned, context), isTrue);
      _noPhysicalControls();
    },
  );
  testWidgets(
    'uzun Türkçe bütün durumlarda büyük yazıyla kayar; bütün niyet hedefleri en az52',
    (t) async {
      for (final width in [320.0, 390.0, 768.0]) {
        await t.binding.setSurfaceSize(Size(width, 844));
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final topic in [
            _topic(),
            _topic(source: _source(freshness: TeachingFreshness.stale)),
            null,
          ]) {
            await t.pumpWidget(
              _app(
                _view(
                  topic: topic,
                  offline: true,
                  recheck: (_) {},
                  back: (_) {},
                ),
                scale: scale,
              ),
            );
            await t.ensureVisible(find.bySemanticsLabel(_back));
            await t.pumpAndSettle();
            expect(_buttons(), findsNWidgets(2));
            for (final element in _buttons().evaluate()) {
              expect(
                t.getSize(find.byWidget(element.widget)).height,
                greaterThanOrEqualTo(52),
              );
            }
            expect(t.takeException(), isNull);
          }
        }
      }
      await t.binding.setSurfaceSize(null);
    },
  );
  testWidgets(
    'gerçek painted kenar ve metin kontrastı, uyarı liveRegion semantiği',
    (t) async {
      await t.pumpWidget(
        _app(_view(topic: _topic(), recheck: (_) {}, back: (_) {})),
      );
      var count = 0;
      for (final element in find.byType(Container).evaluate()) {
        final w = element.widget as Container;
        if (w.decoration is! BoxDecoration) continue;
        final border = (w.decoration as BoxDecoration).border;
        if (border is! Border) continue;
        count++;
        Color? background;
        element.visitAncestorElements((a) {
          if (a.widget is ColoredBox) {
            background = (a.widget as ColoredBox).color;
            return false;
          }
          return true;
        });
        expect(background, isNotNull);
        final light = background!.computeLuminance();
        expect(
          (light + .05) / (border.top.color.computeLuminance() + .05),
          greaterThanOrEqualTo(3),
        );
        expect(
          (light + .05) /
              (DefaultTextStyle.of(element).style.color!.computeLuminance() +
                  .05),
          greaterThanOrEqualTo(4.5),
        );
      }
      expect(count, 2);
      expect(
        find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.liveRegion == true,
        ),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'parent bağlam değişiminde eski özel konu gizlenir; genel konu özel fit olmaz',
    (t) async {
      final old = _topic(scope: TeachingScope.motorcycleContext);
      TeachingRecheckRequest? request;
      final next = _context(bike: 'bike-b', revision: 'r2');
      await t.pumpWidget(_app(_view(topic: old, recheck: (r) => request = r)));
      expect(find.text(old.title), findsOneWidget);
      await t.pumpWidget(
        _app(_view(context: next, topic: old, recheck: (r) => request = r)),
      );
      expect(find.text(old.title), findsNothing);
      await _tap(t, _recheck);
      expect(identical(request!.context, next), isTrue);
      expect(request!.topicRevision, isNull);
      await t.pumpWidget(_app(_view(context: next, topic: _topic())));
      expect(find.textContaining('Genel öğrenme bilgisi;'), findsOneWidget);
      _noPhysicalControls();
    },
  );
  final prefix = Platform.environment['KAVRIVA_TEACHING_PREVIEW'];
  if (prefix != null) {
    testWidgets('yerel üç öğretim halinin tam kaydırma görüntüleri', (t) async {
      final loader = FontLoader('TeachingPreview');
      loader.addFont(
        Future.value(
          ByteData.sublistView(
            File(Platform.environment['KAVRIVA_TEACHING_FONT']!)
                .readAsBytesSync(),
          ),
        ),
      );
      await loader.load();
      await t.binding.setSurfaceSize(const Size(390, 844));
      for (final page in [
        ('reference', _view(topic: _topic(), recheck: (_) {}, back: (_) {})),
        (
          'stale-offline',
          _view(
            topic: _topic(
              scope: TeachingScope.motorcycleContext,
              source: _source(freshness: TeachingFreshness.stale),
            ),
            offline: true,
            recheck: (_) {},
            back: (_) {},
          ),
        ),
        (
          'missing',
          _view(
            topic: _topic(
              scope: TeachingScope.motorcycleContext,
              context: _context(bike: 'other'),
            ),
            recheck: (_) {},
            back: (_) {},
          ),
        ),
      ]) {
        final key = GlobalKey();
        await t.pumpWidget(
          _app(
            RepaintBoundary(
              key: key,
              child: KavrivaShell(
                selectedSection: KavrivaSection.assistance,
                showNavigation: false,
                onSectionRequested: null,
                pages: {
                  KavrivaSection.assistance: page.$2,
                  for (final s in KavrivaSection.values.where(
                    (s) => s != KavrivaSection.assistance,
                  ))
                    s: const SizedBox.shrink(),
                },
              ),
            ),
            font: 'TeachingPreview',
          ),
        );
        await t.pumpAndSettle();
        final scroll = t
            .state<ScrollableState>(find.byType(Scrollable).first)
            .position;
        scroll.jumpTo(0);
        await t.pumpAndSettle();
        var index = 0;
        while (true) {
          await t.runAsync(() async {
            final picture =
                await (key.currentContext!.findRenderObject()!
                        as RenderRepaintBoundary)
                    .toImage();
            final bytes = await picture.toByteData(
              format: ui.ImageByteFormat.png,
            );
            await File('$prefix-${page.$1}-$index.png')
                .writeAsBytes(bytes!.buffer.asUint8List());
            picture.dispose();
          });
          if (scroll.pixels >= scroll.maxScrollExtent) break;
          scroll.jumpTo(
            (scroll.pixels + 844 * .8).clamp(0, scroll.maxScrollExtent),
          );
          index++;
          await t.pumpAndSettle();
        }
      }
      await t.binding.setSurfaceSize(null);
    }, timeout: const Timeout(Duration(seconds: 45)));
  }
}
