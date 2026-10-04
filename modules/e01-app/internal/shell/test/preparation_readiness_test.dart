import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/preparation_readiness.dart';
import 'package:kavriva_shell/variant_resolution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

VariantContext _context({
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
ReadinessEvidenceReference _evidence({
  String? id,
  VariantContext? context,
  String revision = 'evaluation-r2',
  bool current = true,
}) => ReadinessEvidenceReference(
  context: context ?? _context(),
  evaluationRevision: revision,
  conditionId: id,
  source: 'Örnek hazırlık kaynağı',
  version: 'kaynak-r3',
  location: 'Örnek kontrol listesi',
  checkedAt: '2026-10-04',
  current: current,
);
PreparationCondition _condition({
  String id = 'tool',
  String label = 'Örnek zorunlu araç kontrolü',
  PreparationImportance importance = PreparationImportance.mandatory,
  PreparationConditionState state = PreparationConditionState.verified,
  ReadinessEvidenceReference? evidence,
  bool proof = true,
}) => PreparationCondition(
  id: id,
  label: label,
  importance: importance,
  state: state,
  reason: importance == PreparationImportance.optional
      ? 'Bu bilgi hazırlığı açıklamaya yardımcı olur; zorunlu koşul değildir.'
      : 'Bu koşul doğrulanmadan ilgili fiziksel işe başlanamaz.',
  remediation:
      'Kaynağın istediği koşulu tamamlayıp yeni bilgiyle yeniden kontrol iste.',
  evidence: proof ? evidence ?? _evidence(id: id) : null,
);
List<PreparationCondition> _conditions() => [
  _condition(
    id: 'area',
    label: 'Örnek çalışma alanı kontrolü',
    importance: PreparationImportance.critical,
  ),
  _condition(),
  _condition(
    id: 'extra',
    label: 'Örnek ek bilgi',
    importance: PreparationImportance.optional,
    state: PreparationConditionState.missing,
    proof: false,
  ),
];
SafetyPreparation _risk() => SafetyPreparation(
  risk: 'Çalışma alanı ön koşulu eksikse güvenli başlangıç doğrulanamaz.',
  prevention: 'Kaynakta istenen çalışma alanı kontrolünü tamamlat.',
  stopCondition: 'Güncel güvenlik kontrolü yoksa fiziksel işe başlama.',
);
ReadinessPresentation _result({
  VariantContext? context,
  String revision = 'evaluation-r2',
  ReadinessDisplayStatus status = ReadinessDisplayStatus.ready,
  ReadinessEvidenceReference? evidence,
  bool proof = true,
  List<PreparationCondition>? conditions,
  List<SafetyPreparation>? risks,
}) => ReadinessPresentation(
  context: context ?? _context(),
  revision: revision,
  status: status,
  evidence: proof ? evidence ?? _evidence() : null,
  conditions: conditions ?? _conditions(),
  risks: risks ?? [_risk()],
);
FitEvidenceReference _fitEvidence({
  VariantContext? context,
  bool current = true,
}) => FitEvidenceReference(
  context: context ?? _context(),
  source: 'Örnek teknik kaynak',
  version: 'fit-r3',
  location: 'Örnek kaynak bölümü',
  checkedAt: '2026-10-04',
  current: current,
);
FitPresentation _fit({
  VariantContext? context,
  FitDisplayStatus status = FitDisplayStatus.confirmed,
  FitEvidenceReference? evidence,
  bool proof = true,
}) => FitPresentation(
  context: context ?? _context(),
  status: status,
  reason: 'Yalnız bu motosiklet ve rehber için örnek uygunluk.',
  evidence: proof ? evidence ?? _fitEvidence() : null,
);
Widget _view({
  VariantContext? context,
  ReadinessPresentation? result,
  FitPresentation? fit,
  bool busy = false,
  String? error,
  ValueChanged<ReadinessPresentation>? start,
  ValueChanged<ReadinessRecheckRequest>? recheck,
  ValueChanged<VariantContext>? teach,
}) => PreparationReadinessView(
  context: context ?? _context(),
  result: result,
  fit: fit,
  busy: busy,
  errorMessage: error,
  onStartRequested: start,
  onRecheckRequested: recheck,
  onTeachingRequested: teach,
);
Widget _hold({
  ReadinessPresentation? result,
  FitPresentation? fit,
  ValueChanged<ReadinessRecheckRequest>? recheck,
  ValueChanged<VariantContext>? teach,
  ValueChanged<ReadinessPresentation>? prepare,
}) => ReadinessHoldView(
  context: _context(),
  result: result,
  fit: fit,
  busy: false,
  errorMessage: null,
  onRecheckRequested: recheck,
  onTeachingRequested: teach,
  onPreparationRequested: prepare,
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

void main() {
  test('Hazırlık verisi boş/tekrar kimliği reddeder ve listeleri dondurur', () {
    expect(() => _result(revision: ' '), throwsArgumentError);
    expect(() => _evidence(id: ' '), throwsArgumentError);
    expect(() => _condition(label: ' '), throwsArgumentError);
    expect(
      () => SafetyPreparation(risk: ' ', prevention: 'p', stopCondition: 's'),
      throwsArgumentError,
    );
    expect(
      () => _result(conditions: [_condition(), _condition()]),
      throwsArgumentError,
    );
    final cs = _conditions();
    final rs = [_risk()];
    final p = _result(conditions: cs, risks: rs);
    cs.clear();
    rs.clear();
    expect(p.conditions.length, 3);
    expect(p.risks.length, 1);
    expect(() => p.conditions.clear(), throwsUnsupportedError);
    expect(() => p.risks.clear(), throwsUnsupportedError);
  });
  testWidgets(
    'Güncel fit ve her zorunlu kanıt ile yalnız start niyeti gönderilir',
    (t) async {
      final p = _result();
      ReadinessPresentation? request;
      await t.pumpWidget(
        _app(_view(result: p, fit: _fit(), start: (r) => request = r)),
      );
      expect(find.text('Uygulamaya hazır'), findsOneWidget);
      await _tap(t, 'Rehberi başlat');
      expect(identical(request, p), true);
      expect(p.status, ReadinessDisplayStatus.ready);
      expect(find.text('Başarıyla tamamlandı'), findsNothing);
    },
  );
  testWidgets(
    'Her zorunlu pending missing unknown stale failed hazır yolunu kapatır',
    (t) async {
      for (final state in PreparationConditionState.values.where(
        (s) => s != PreparationConditionState.verified,
      )) {
        await t.pumpWidget(
          _app(
            _view(
              result: _result(conditions: [_condition(state: state)]),
              fit: _fit(),
              start: (_) => fail('İzin verildi'),
            ),
          ),
        );
        expect(find.text('Uygulamaya hazır'), findsNothing);
        expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
        expect(find.text('Durum: ${state.label}'), findsOneWidget);
      }
    },
  );
  testWidgets(
    'Summary ready yalnızlığı, boş zorunlu veya güvenlik listesi hazır üretmez',
    (t) async {
      for (final p in [
        _result(proof: false),
        _result(status: ReadinessDisplayStatus.held),
        _result(conditions: []),
        _result(
          conditions: [_condition(importance: PreparationImportance.optional)],
        ),
        _result(risks: []),
        _result(evidence: _evidence(current: false)),
        _result(evidence: _evidence(id: 'tool')),
        _result(evidence: _evidence(revision: 'old')),
        _result(
          evidence: _evidence(context: _context(bike: 'other')),
        ),
      ]) {
        await t.pumpWidget(
          _app(
            _view(result: p, fit: _fit(), start: (_) => fail('Summary bypass')),
          ),
        );
        expect(find.text('Uygulamaya hazır'), findsNothing);
        expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
      }
    },
  );
  testWidgets(
    'Tek koşulun eksik eski yanlış bağlam sürüm veya kimlik kanıtı reddedilir',
    (t) async {
      for (final e in <ReadinessEvidenceReference?>[
        null,
        _evidence(id: 'tool', current: false),
        _evidence(id: 'other'),
        _evidence(id: 'tool', revision: 'old'),
        _evidence(
          id: 'tool',
          context: _context(bike: 'other'),
        ),
        _evidence(
          id: 'tool',
          context: _context(guide: 'other'),
        ),
        _evidence(
          id: 'tool',
          context: _context(revision: 'other'),
        ),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              result: _result(
                conditions: [_condition(proof: e != null, evidence: e)],
              ),
              fit: _fit(),
              start: (_) => fail('Koşul bypass'),
            ),
          ),
        );
        expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
        expect(
          find.text('Durum: Doğrulama güncel veya bu koşula ait değil'),
          findsOneWidget,
        );
      }
    },
  );
  testWidgets(
    'Hazırlık ready olsa bile fit yok eski veya başka bağlam olumlu yolu kapatır',
    (t) async {
      for (final f in <FitPresentation?>[
        null,
        _fit(proof: false),
        _fit(status: FitDisplayStatus.missingDistinction),
        _fit(evidence: _fitEvidence(current: false)),
        _fit(context: _context(bike: 'other')),
        _fit(context: _context(guide: 'other')),
        _fit(context: _context(revision: 'other')),
        _fit(
          evidence: _fitEvidence(context: _context(bike: 'other')),
        ),
        _fit(
          evidence: _fitEvidence(context: _context(guide: 'other')),
        ),
        _fit(
          evidence: _fitEvidence(context: _context(revision: 'other')),
        ),
      ]) {
        await t.pumpWidget(
          _app(
            _view(result: _result(), fit: f, start: (_) => fail('Fit bypass')),
          ),
        );
        expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
        expect(
          find.text(
            'Motosiklete uygunluk eksik veya güncel değil; işe başlama kapalı.',
          ),
          findsOneWidget,
        );
      }
    },
  );
  testWidgets('İsteğe bağlı eksik kritik veya zorunlu kontrol gibi davranmaz', (
    t,
  ) async {
    await t.pumpWidget(
      _app(_view(result: _result(), fit: _fit(), start: (_) {})),
    );
    expect(
      find.text('Kritik ve zorunlu: Örnek çalışma alanı kontrolü'),
      findsOneWidget,
    );
    expect(find.text('Zorunlu: Örnek zorunlu araç kontrolü'), findsOneWidget);
    expect(find.text('İsteğe bağlı: Örnek ek bilgi'), findsOneWidget);
    expect(find.text('Uygulamaya hazır'), findsOneWidget);
  });
  testWidgets(
    'Hold koşul neden çözüm recheck görünür, istek doğrulama sayılmaz',
    (t) async {
      final p = _result(
        status: ReadinessDisplayStatus.held,
        conditions: [_condition(state: PreparationConditionState.missing)],
      );
      ReadinessRecheckRequest? request;
      await t.pumpWidget(
        _app(_hold(result: p, fit: _fit(), recheck: (r) => request = r)),
      );
      expect(find.text('Durum: Eksik'), findsOneWidget);
      expect(
        find.text('Neden önemli: ${p.conditions.first.reason}'),
        findsOneWidget,
      );
      expect(
        find.text('Eksikliği giderme yolu: ${p.conditions.first.remediation}'),
        findsOneWidget,
      );
      await _tap(t, 'Örnek zorunlu araç kontrolü: yeniden kontrol iste');
      expect(request!.conditionId, 'tool');
      expect(request!.evaluationRevision, p.revision);
      expect(request!.context.matches(p.context), true);
      expect(request!.kind, ReadinessCheckKind.fresh);
      expect(p.conditions.first.state, PreparationConditionState.missing);
      expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
    },
  );
  testWidgets(
    'Yeni fotoğraf ölçüm alternatif ve fresh istekleri doğru kapsamla gider',
    (t) async {
      final requests = <ReadinessRecheckRequest>[];
      final p = _result(status: ReadinessDisplayStatus.held);
      await t.pumpWidget(
        _app(_hold(result: p, fit: _fit(), recheck: requests.add)),
      );
      for (final label in [
        'Güncel hazırlık kontrolü iste',
        'Fotoğrafla yeniden kontrol iste',
        'Ölçümle yeniden kontrol iste',
        'Başka bir kontrolle yeniden değerlendir',
      ]) {
        await _tap(t, label);
      }
      expect(requests.map((r) => r.kind), ReadinessCheckKind.values);
      expect(
        requests.every(
          (r) =>
              r.context.matches(_context()) &&
              r.evaluationRevision == p.revision &&
              r.conditionId == null,
        ),
        true,
      );
      expect(find.text('Uygulamaya hazır'), findsNothing);
      expect(find.bySemanticsLabel('Devam et'), findsNothing);
      expect(find.bySemanticsLabel('Yine de devam et'), findsNothing);
    },
  );
  testWidgets(
    'Başka motor rehber veya revizyon bilgisi taşınmaz, recheck current bağlamda',
    (t) async {
      for (final c in [
        _context(bike: 'other'),
        _context(guide: 'other'),
        _context(revision: 'old'),
      ]) {
        ReadinessRecheckRequest? request;
        await t.pumpWidget(
          _app(
            _view(
              result: _result(context: c),
              fit: _fit(),
              start: (_) => fail('Foreign'),
              recheck: (r) => request = r,
            ),
          ),
        );
        expect(find.text('Zorunlu: Örnek zorunlu araç kontrolü'), findsNothing);
        expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
        await _tap(t, 'Güncel hazırlık kontrolü iste');
        expect(request!.context.matches(_context()), true);
        expect(request!.evaluationRevision, isNull);
      }
    },
  );
  testWidgets(
    'Çözülmüş hold yalnız hazırlığa döner, otomatik uygulama başlamaz',
    (t) async {
      final p = _result();
      ReadinessPresentation? request;
      await t.pumpWidget(
        _app(_hold(result: p, fit: _fit(), prepare: (r) => request = r)),
      );
      expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
      expect(request, isNull);
      await _tap(t, 'Hazırlık ekranına dön');
      expect(identical(request, p), true);
    },
  );
  testWidgets(
    'Callback olmayan eylemler disabled ve açık, öğrenme uygulama değil',
    (t) async {
      final semantics = t.ensureSemantics();
      await t.pumpWidget(_app(_view(result: _result(), fit: _fit())));
      expect(
        t
            .getSemantics(find.bySemanticsLabel('Rehberi başlat'))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(find.text('Rehber şu anda başlatılamıyor.'), findsOneWidget);
      expect(
        t
            .getSemantics(
              find.bySemanticsLabel('Güncel hazırlık kontrolü iste'),
            )
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(
        find.text(
          'Yeniden kontrol şu anda kullanılamıyor; eksik koşul geçmiş sayılmaz.',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Öğrenme görünümü yalnız bilgi içindir; motosiklette uygulama adımı değildir.',
        ),
        findsOneWidget,
      );
      semantics.dispose();
    },
  );
  testWidgets(
    'Busy olumlu yol ve recheck kapatır; hata retryye izin verir ama ready değil',
    (t) async {
      var count = 0;
      await t.pumpWidget(
        _app(
          _view(
            result: _result(),
            fit: _fit(),
            busy: true,
            start: (_) => fail('Busy start'),
            recheck: (_) => count++,
            teach: (_) => count++,
          ),
        ),
      );
      expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
      await _tap(t, 'Güncel hazırlık kontrolü iste');
      await _tap(t, 'Öğrenme görünümünü aç');
      expect(count, 0);
      await t.pumpWidget(
        _app(
          _view(
            result: _result(),
            fit: _fit(),
            error: 'Kontrol tamamlanamadı; yeniden dene.',
            start: (_) => fail('Error start'),
            recheck: (_) => count++,
          ),
        ),
      );
      expect(find.text('Kontrol tamamlanamadı; yeniden dene.'), findsOneWidget);
      expect(find.text('Uygulamaya hazır'), findsNothing);
      await _tap(t, 'Güncel hazırlık kontrolü iste');
      expect(count, 1);
    },
  );
  testWidgets(
    'Klavye Tab Enter Space doğru koşul için kontrol isteği gönderir',
    (t) async {
      final requests = <ReadinessRecheckRequest>[];
      await t.pumpWidget(
        _app(_view(result: _result(), fit: _fit(), recheck: requests.add)),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pump();
      expect(requests, hasLength(1));
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pump();
      expect(requests, hasLength(2));
      for (final request in requests) {
        expect(request.conditionId, 'extra');
        expect(request.kind, ReadinessCheckKind.fresh);
        expect(request.context.matches(_context()), isTrue);
        expect(request.evaluationRevision, 'evaluation-r2');
      }
    },
  );
  testWidgets(
    'Hazırlık ve hold uzun Türkçe büyük yazıyla kayar; bütün kontroller en az52',
    (t) async {
      for (final width in [320.0, 390.0, 768.0]) {
        await t.binding.setSurfaceSize(Size(width, 844));
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final w in [
            _view(
              result: _result(),
              fit: _fit(),
              start: (_) {},
              recheck: (_) {},
              teach: (_) {},
            ),
            _hold(
              result: _result(
                status: ReadinessDisplayStatus.held,
                conditions: [
                  _condition(state: PreparationConditionState.unknown),
                ],
              ),
              fit: _fit(),
              recheck: (_) {},
              teach: (_) {},
            ),
          ]) {
            await t.pumpWidget(_app(w, scale: scale));
            await t.ensureVisible(
              find.bySemanticsLabel('Öğrenme görünümünü aç'),
            );
            await t.pumpAndSettle();
            final controls = find.byWidgetPredicate(
              (widget) =>
                  widget is Semantics && widget.properties.button == true,
            );
            expect(controls.evaluate(), isNotEmpty);
            for (final control in controls.evaluate()) {
              expect(
                t.getSize(find.byWidget(control.widget)).height,
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
    'Gerçek painted kontrol kenarı zemin ve metin kontrastı yeterli',
    (t) async {
      await t.pumpWidget(
        _app(_view(result: _result(), fit: _fit(), start: (_) {})),
      );
      var count = 0;
      for (final element in find.byType(Container).evaluate()) {
        final widget = element.widget as Container;
        if (widget.decoration is! BoxDecoration) continue;
        final border = (widget.decoration as BoxDecoration).border;
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
        final dark = border.top.color.computeLuminance();
        expect((light + .05) / (dark + .05), greaterThanOrEqualTo(3));
        final ink = DefaultTextStyle.of(element).style.color!
            .computeLuminance();
        expect((light + .05) / (ink + .05), greaterThanOrEqualTo(4.5));
      }
      expect(count, greaterThanOrEqualTo(6));
    },
  );
  testWidgets(
    'Parent yeni bağlamda eski hazır sonuç görünmez, öğrenme doğru bağlamdadır',
    (t) async {
      final old = _result();
      VariantContext? requested;
      await t.pumpWidget(_app(_view(result: old, fit: _fit(), start: (_) {})));
      expect(find.text('Uygulamaya hazır'), findsOneWidget);
      final next = _context(bike: 'bike-b', revision: 'r2');
      await t.pumpWidget(
        _app(
          _view(
            context: next,
            result: old,
            fit: _fit(),
            start: (_) => fail('Old start'),
            teach: (c) => requested = c,
          ),
        ),
      );
      expect(find.bySemanticsLabel('Rehberi başlat'), findsNothing);
      await _tap(t, 'Öğrenme görünümünü aç');
      expect(identical(requested, next), true);
    },
  );
  final prefix = Platform.environment['KAVRIVA_READINESS_PREVIEW'];
  if (prefix != null) {
    testWidgets('Yalnız yerel üç hazırlık hali bütün kaydırma görüntüleri', (
      t,
    ) async {
      final loader = FontLoader('ReadinessPreview');
      loader.addFont(
        Future.value(
          ByteData.sublistView(
            File(Platform.environment['KAVRIVA_READINESS_FONT']!)
                .readAsBytesSync(),
          ),
        ),
      );
      await t.runAsync(loader.load);
      await t.binding.setSurfaceSize(const Size(390, 844));
      for (final page in [
        (
          'ready',
          _view(
            result: _result(),
            fit: _fit(),
            start: (_) {},
            recheck: (_) {},
            teach: (_) {},
          ),
        ),
        (
          'hold',
          _hold(
            result: _result(
              status: ReadinessDisplayStatus.held,
              conditions: [
                _condition(
                  id: 'area',
                  label: 'Örnek çalışma alanı kontrolü',
                  importance: PreparationImportance.critical,
                  state: PreparationConditionState.missing,
                ),
              ],
            ),
            fit: _fit(),
            recheck: (_) {},
            teach: (_) {},
          ),
        ),
        (
          'unknown',
          _view(
            result: _result(evidence: _evidence(current: false)),
            fit: _fit(),
            recheck: (_) {},
            teach: (_) {},
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
            font: 'ReadinessPreview',
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
