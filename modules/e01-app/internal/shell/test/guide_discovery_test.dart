import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/guide_discovery.dart';
import 'package:kavriva_shell/variant_resolution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

DiscoveryContext _context({String bike = 'bike-a', String revision = 'r1'}) =>
    DiscoveryContext(
      motorcycleId: bike,
      revision: revision,
      label: 'Örnek motosiklet · kullanıcı beyanı',
    );
VariantContext _guide({
  String bike = 'bike-a',
  String guide = 'guide-a',
  String revision = 'r1',
}) => VariantContext(
  motorcycleId: bike,
  guideId: guide,
  contextRevision: revision,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
  guideLabel: 'Örnek bakım kontrolü',
);
GuideCandidate _candidate({VariantContext? context}) => GuideCandidate(
  context: context ?? _guide(),
  description: 'Bu işin amacını ve kapsamını tanı.',
);
DiscoveryResults _results({
  DiscoveryContext? context,
  String query = 'kontrol',
  bool current = true,
  List<GuideCandidate>? candidates,
}) => DiscoveryResults(
  context: context ?? _context(),
  query: query,
  current: current,
  candidates: candidates ?? [_candidate()],
);
Widget _search({
  DiscoveryContext? context,
  String initial = 'kontrol',
  DiscoveryResults? results,
  bool busy = false,
  String? error,
  ValueChanged<TaskSearchRequest>? search,
  ValueChanged<GuideCandidate>? preview,
}) => TaskDiscoveryView(
  context: context ?? _context(),
  initialQuery: initial,
  results: results,
  busy: busy,
  errorMessage: error,
  onSearchRequested: search,
  onPreviewRequested: preview,
);
FitEvidenceReference _evidence({
  VariantContext? context,
  bool current = true,
}) => FitEvidenceReference(
  context: context ?? _guide(),
  source: 'Örnek teknik kaynak',
  version: 'kaynak-r3',
  location: 'Bölüm 2 · sayfa 5',
  checkedAt: '2026-10-04',
  current: current,
);
FitPresentation _fit({
  VariantContext? context,
  FitDisplayStatus status = FitDisplayStatus.confirmed,
  FitEvidenceReference? evidence,
}) => FitPresentation(
  context: context ?? _guide(),
  status: status,
  reason: 'Bu örnek sonuç yalnız seçili motosiklet ve rehber içindir.',
  evidence: evidence,
);
GuideScope _scope({VariantContext? context, bool current = true}) => GuideScope(
  context: context ?? _guide(),
  includes: 'Kontrolün amacını ve hangi bilgilerin gerekli olduğunu tanıtır.',
  excludes: 'Parça değiştirme veya motosiklette işlem yapma adımları içermez.',
  current: current,
);
Widget _preview({
  VariantContext? context,
  GuideScope? scope,
  FitPresentation? fit,
  bool busy = false,
  String? error,
  ValueChanged<VariantContext>? prepare,
  ValueChanged<VariantContext>? resolve,
  ValueChanged<VariantContext>? teach,
  ValueChanged<VariantContext>? edit,
}) => GuideScopePreview(
  context: context ?? _guide(),
  scope: scope,
  fit: fit,
  busy: busy,
  errorMessage: error,
  onPreparationRequested: prepare,
  onDistinctionRequested: resolve,
  onTeachingRequested: teach,
  onEditRequested: edit,
);

Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFFFFFFF),
    onGenerateRoute: (_) =>
        PageRouteBuilder<void>(pageBuilder: (_, _, _) => const _Scene()),
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

const _previewLabel = 'Örnek bakım kontrolü: kapsamını gör';
void main() {
  test('arama/rehber girdileri boş ve çift kimliği reddeder; sonuç listesi immutable', () {
    expect(
      () => TaskSearchRequest(context: _context(), query: ' '),
      throwsArgumentError,
    );
    expect(
      () => DiscoveryContext(motorcycleId: '', revision: 'r', label: 'm'),
      throwsArgumentError,
    );
    expect(
      () => _results(candidates: [_candidate(), _candidate()]),
      throwsArgumentError,
    );
    final candidates = [_candidate()];
    final r = _results(candidates: candidates);
    candidates.clear();
    expect(r.candidates.length, 1);
    expect(() => r.candidates.clear(), throwsUnsupportedError);
    expect(
      () => GuideScope(
        context: _guide(),
        includes: ' ',
        excludes: 'x',
        current: true,
      ),
      throwsArgumentError,
    );
  });
  testWidgets(
    'plain iş arama trimmed istektir, kendiliğinden sonuç veya fit yok',
    (t) async {
      final requests = <TaskSearchRequest>[];
      final context = _context();
      await t.pumpWidget(
        _app(_search(context: context, initial: '', search: requests.add)),
      );
      await t.enterText(
        find.byKey(const ValueKey('task-query')),
        '  kontrol  ',
      );
      await _tap(t, 'İşi ara');
      expect(requests.single.query, 'kontrol');
      expect(requests.single.context, same(context));
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text(_previewLabel), findsNothing);
      expect(find.textContaining('kendi sözlerinle'), findsOneWidget);
      expect(find.text('Hesap aç'), findsNothing);
    },
  );
  testWidgets('boş arama gönderilmez; IME search aynı doğrulamayı kullanır', (
    t,
  ) async {
    final requests = <TaskSearchRequest>[];
    await t.pumpWidget(_app(_search(initial: ' ', search: requests.add)));
    await _tap(t, 'İşi ara');
    expect(requests, isEmpty);
    expect(find.textContaining('Yapmak istediğin işi yaz;'), findsOneWidget);
    await t.enterText(find.byKey(const ValueKey('task-query')), 'kayıt');
    await t.testTextInput.receiveAction(TextInputAction.search);
    await t.pump();
    expect(requests.single.query, 'kayıt');
    expect(find.textContaining('Yapmak istediğin işi yaz;'), findsNothing);
  });
  testWidgets(
    'sonuç seçimi doğru immutable adayı önizler, fit/hazırlık/hak üretmez',
    (t) async {
      final requests = <GuideCandidate>[];
      final candidate = _candidate();
      await t.pumpWidget(
        _app(
          _search(
            results: _results(candidates: [candidate]),
            preview: requests.add,
          ),
        ),
      );
      await _tap(t, _previewLabel);
      expect(requests.single, same(candidate));
      expect(find.textContaining('yalnız kapsamını açar'), findsOneWidget);
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
    },
  );
  testWidgets(
    'sorgu değişince eski sonuç açılmaz, aynı güncel sorgu tekrar gösterir',
    (t) async {
      final requests = <GuideCandidate>[];
      await t.pumpWidget(
        _app(_search(results: _results(), preview: requests.add)),
      );
      await t.enterText(find.byKey(const ValueKey('task-query')), 'başka iş');
      await t.pump();
      expect(find.text(_previewLabel), findsNothing);
      expect(find.textContaining('güncel sonuç yok'), findsOneWidget);
      await t.enterText(find.byKey(const ValueKey('task-query')), 'kontrol');
      await t.pump();
      await _tap(t, _previewLabel);
      expect(requests.length, 1);
    },
  );
  testWidgets(
    'eski/motor-revizyonu farklı sonuç veya busy/error hiçbir aday açmaz',
    (t) async {
      for (final page in [
        _search(results: _results(current: false)),
        _search(
          results: _results(context: _context(bike: 'b')),
        ),
        _search(
          results: _results(context: _context(revision: 'r2')),
        ),
        _search(results: _results(), busy: true),
        _search(results: _results(), error: 'Arama tamamlanamadı'),
      ]) {
        await t.pumpWidget(_app(page));
        expect(find.text(_previewLabel), findsNothing);
      }
      expect(find.text('Arama tamamlanamadı'), findsOneWidget);
    },
  );
  testWidgets(
    'yanlış motosiklet/revizyon adayı gizlenir, mevcut iyi adayı etkileyemez',
    (t) async {
      final candidates = [
        _candidate(),
        _candidate(
          context: _guide(bike: 'b', guide: 'g2'),
        ),
        _candidate(
          context: _guide(guide: 'g3', revision: 'r2'),
        ),
      ];
      final requests = <GuideCandidate>[];
      await t.pumpWidget(
        _app(
          _search(
            results: _results(candidates: candidates),
            preview: requests.add,
          ),
        ),
      );
      expect(find.text(_previewLabel), findsOneWidget);
      expect(
        find.textContaining('Bir sonuç bu motosikletin'),
        findsNWidgets(2),
      );
      await _tap(t, _previewLabel);
      expect(requests.single, same(candidates.first));
    },
  );
  testWidgets(
    'error/busy taslağı korur, context değişimi eski sorgu ve sonucu taşımaz',
    (t) async {
      final requests = <TaskSearchRequest>[];
      await t.pumpWidget(_app(_search(initial: '', search: requests.add)));
      await t.enterText(
        find.byKey(const ValueKey('task-query')),
        'yazdığım iş',
      );
      await t.pumpWidget(
        _app(
          _search(
            initial: 'üstten başka metin',
            busy: true,
            error: 'Tekrar dene',
            search: requests.add,
          ),
        ),
      );
      var input = t.widget<EditableText>(
        find.byKey(const ValueKey('task-query')),
      );
      expect(input.controller.text, 'yazdığım iş');
      expect(input.readOnly, isTrue);
      await _tap(t, 'İşi ara');
      expect(requests, isEmpty);
      await t.pumpWidget(
        _app(
          _search(
            context: _context(bike: 'b'),
            initial: '',
            results: _results(),
            search: requests.add,
          ),
        ),
      );
      input = t.widget<EditableText>(find.byKey(const ValueKey('task-query')));
      expect(input.controller.text, isEmpty);
      expect(find.text(_previewLabel), findsNothing);
    },
  );
  testWidgets(
    'empty/unavailable anlaşılır; disabled semantics ve taslak korunur',
    (t) async {
      final s = t.ensureSemantics();
      await t.pumpWidget(_app(_search(results: _results(candidates: []))));
      expect(find.textContaining('iş bulunamadı'), findsOneWidget);
      expect(find.textContaining('farklı sözlerle'), findsOneWidget);
      expect(
        t
            .getSemantics(find.bySemanticsLabel('İşi ara'))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      await t.pumpWidget(_app(_search(results: _results())));
      expect(
        t
            .getSemantics(find.bySemanticsLabel(_previewLabel))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(find.textContaining('Rehber kapsamı şu anda'), findsOneWidget);
      s.dispose();
    },
  );
  testWidgets(
    'scope/fit ayrı görünür, current confirmed yalnız hazırlık isteği',
    (t) async {
      final requests = <VariantContext>[];
      final context = _guide();
      await t.pumpWidget(
        _app(
          _preview(
            context: context,
            scope: _scope(),
            fit: _fit(evidence: _evidence()),
            prepare: requests.add,
          ),
        ),
      );
      expect(find.text('Neleri kapsar?'), findsOneWidget);
      expect(find.text('Neleri kapsamaz?'), findsOneWidget);
      expect(find.textContaining('Parça değiştirme'), findsOneWidget);
      expect(find.textContaining('garanti etmez'), findsOneWidget);
      await _tap(t, 'Hazırlığı görüntüle');
      expect(requests.single, same(context));
      for (final label in ['Hazırım', 'Uygulamaya geç', 'Rehberi başlat']) {
        expect(find.text(label), findsNothing);
      }
    },
  );
  testWidgets(
    'scope yok/eski/mismatch olumlu fit olsa bile hazırlığa geçirmez',
    (t) async {
      for (final scope in [
        null,
        _scope(current: false),
        _scope(context: _guide(bike: 'b')),
        _scope(context: _guide(guide: 'g2')),
        _scope(context: _guide(revision: 'r2')),
      ]) {
        await t.pumpWidget(
          _app(
            _preview(
              scope: scope,
              fit: _fit(evidence: _evidence()),
              prepare: (_) {},
            ),
          ),
        );
        expect(find.text('Hazırlığı görüntüle'), findsNothing);
        expect(find.text('Uygunluk doğrulandı'), findsNothing);
        expect(find.text('Ayrımı yeniden çöz'), findsOneWidget);
      }
    },
  );
  testWidgets(
    'current scope ama fit eksik/eski/başka bağlam/error/busy uygulama açmaz',
    (t) async {
      final cases = <(FitPresentation?, bool, String?)>[
        (null, false, null),
        (_fit(), false, null),
        (_fit(evidence: _evidence(current: false)), false, null),
        (
          _fit(
            context: _guide(bike: 'b'),
            evidence: _evidence(),
          ),
          false,
          null,
        ),
        (
          _fit(
            evidence: _evidence(context: _guide(revision: 'r2')),
          ),
          false,
          null,
        ),
        (
          _fit(
            status: FitDisplayStatus.missingDistinction,
            evidence: _evidence(),
          ),
          false,
          null,
        ),
        (_fit(evidence: _evidence()), true, null),
        (_fit(evidence: _evidence()), false, 'Kaynak kontrol edilemedi'),
      ];
      final actions = <String>[];
      for (final c in cases) {
        await t.pumpWidget(
          _app(
            _preview(
              scope: _scope(),
              fit: c.$1,
              busy: c.$2,
              error: c.$3,
              prepare: (_) => actions.add('prepare'),
            ),
          ),
        );
        expect(find.text('Hazırlığı görüntüle'), findsNothing);
        expect(find.textContaining('uygulama kapalı'), findsOneWidget);
      }
      expect(actions, isEmpty);
      await t.pumpWidget(
        _app(
          _preview(
            scope: _scope(),
            resolve: (_) => actions.add('resolve'),
            teach: (_) => actions.add('teach'),
            edit: (_) => actions.add('edit'),
          ),
        ),
      );
      await _tap(t, 'Ayrımı yeniden çöz');
      await _tap(t, 'Öğrenme görünümünü aç');
      await _tap(t, 'Motosiklet bilgilerini düzenle');
      expect(actions, ['resolve', 'teach', 'edit']);
      expect(find.textContaining('yalnız bilgi içindir'), findsOneWidget);
    },
  );
  testWidgets('Tab/Enter aday önizleme talebini doğru gönderir', (t) async {
    final requests = <GuideCandidate>[];
    await t.pumpWidget(
      _app(_search(results: _results(), preview: requests.add)),
    );
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump(); // query
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump(); // disabled search atlanır
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pump();
    expect(requests.length, 1);
  });
  testWidgets('arama ve iki preview büyük metinde kayar, kontroller en az48', (
    t,
  ) async {
    for (final width in [320.0, 390.0, 768.0]) {
      for (final scale in [1.0, 2.0, 3.0]) {
        await t.binding.setSurfaceSize(Size(width, 844));
        for (final item in [
          (_search(results: _results(), preview: (_) {}), _previewLabel),
          (
            _preview(
              scope: _scope(),
              fit: _fit(evidence: _evidence()),
            ),
            'Ayrımı yeniden gözden geçir',
          ),
          (_preview(scope: _scope()), 'Motosiklet bilgilerini düzenle'),
        ]) {
          await t.pumpWidget(_app(item.$1, scale: scale));
          await t.pump();
          expect(t.takeException(), isNull, reason: '$width/$scale');
          final f = find.bySemanticsLabel(item.$2);
          await t.ensureVisible(f);
          await t.pumpAndSettle();
          expect(t.getSize(f).height, greaterThanOrEqualTo(48));
          expect(t.takeException(), isNull);
        }
      }
    }
    await t.binding.setSurfaceSize(null);
  });
  testWidgets(
    'arama alanı ve butonun gerçek kenar/zemin/metin kontrastı yeterli',
    (t) async {
      await t.pumpWidget(_app(_search(results: _results(), preview: (_) {})));
      final controls = t
          .widgetList<Container>(find.byType(Container))
          .where((w) => w.decoration is BoxDecoration)
          .toList();
      expect(controls.length, 3);
      for (final control in controls) {
        final e = t.element(find.byWidget(control));
        Color? bg;
        e.visitAncestorElements((a) {
          if (a.widget case ColoredBox(:final color)) {
            bg = color;
            return false;
          }
          return true;
        });
        expect(bg, isNotNull);
        final border = (control.decoration! as BoxDecoration).border! as Border;
        final light = bg!.computeLuminance();
        final edge = border.top.color.computeLuminance();
        expect((light + .05) / (edge + .05), greaterThanOrEqualTo(3));
        final ink = DefaultTextStyle.of(e).style.color!.computeLuminance();
        expect((light + .05) / (ink + .05), greaterThanOrEqualTo(4.5));
      }
    },
  );
  final preview = Platform.environment['KAVRIVA_DISCOVERY_PREVIEW'];
  if (preview != null) {
    testWidgets(
      'yalnız yerel üç görünüm, gerçek scroll üst/alt okuma görüntüsü',
      (t) async {
        final loader = FontLoader('DiscoveryPreview');
        loader.addFont(
          Future.value(
            ByteData.sublistView(
              File(Platform.environment['KAVRIVA_DISCOVERY_FONT']!)
                  .readAsBytesSync(),
            ),
          ),
        );
        await t.runAsync(loader.load);
        await t.binding.setSurfaceSize(const Size(390, 844));
        for (final page in [
          (
            'discovery',
            _search(results: _results(), search: (_) {}, preview: (_) {}),
            _previewLabel,
          ),
          (
            'current-preview',
            _preview(
              scope: _scope(),
              fit: _fit(evidence: _evidence()),
              prepare: (_) {},
              resolve: (_) {},
            ),
            'Ayrımı yeniden gözden geçir',
          ),
          (
            'missing-preview',
            _preview(
              scope: _scope(),
              fit: _fit(
                status: FitDisplayStatus.missingDistinction,
                evidence: _evidence(current: false),
              ),
              resolve: (_) {},
              teach: (_) {},
              edit: (_) {},
            ),
            'Motosiklet bilgilerini düzenle',
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
              font: 'DiscoveryPreview',
            ),
          );
          await t.pumpAndSettle();
          for (final position in ['top', 'bottom']) {
            if (position == 'bottom') {
              await t.ensureVisible(find.bySemanticsLabel(page.$3));
              await t.pumpAndSettle();
            }
            await t.runAsync(() async {
              final image =
                  await (key.currentContext!.findRenderObject()!
                          as RenderRepaintBoundary)
                      .toImage();
              final bytes = await image.toByteData(
                format: ui.ImageByteFormat.png,
              );
              await File('$preview-${page.$1}-$position.png')
                  .writeAsBytes(bytes!.buffer.asUint8List());
              image.dispose();
            });
          }
        }
        await t.binding.setSurfaceSize(null);
      },
      timeout: const Timeout(Duration(seconds: 30)),
    );
  }
}
