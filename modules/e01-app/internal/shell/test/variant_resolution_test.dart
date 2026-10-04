import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/variant_resolution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

VariantContext _context({
  String bike = 'bike-a',
  String guide = 'guide-a',
  String revision = 'context-r1',
}) => VariantContext(
  motorcycleId: bike,
  guideId: guide,
  contextRevision: revision,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
  guideLabel: 'Örnek kontrol rehberi',
);
DistinctionOption _option(String id) =>
    DistinctionOption(id: id, label: 'Gözlem $id');
DistinctionQuestion _question({
  VariantContext? context,
  String revision = 'question-r1',
  List<DistinctionOption>? options,
}) => DistinctionQuestion(
  context: context ?? _context(),
  id: 'question-a',
  revision: revision,
  prompt: 'Gördüğün özellik hangisi?',
  observationHint:
      'Yalnız görülebilen özelliği kontrol et; sökme veya uygulama yapma.',
  options: options ?? [_option('a'), _option('b')],
);
FitEvidenceReference _evidence({
  VariantContext? context,
  bool current = true,
}) => FitEvidenceReference(
  context: context ?? _context(),
  source: 'Örnek kaynak',
  version: 'kaynak-r3',
  location: 'Bölüm 2 · sayfa 5',
  checkedAt: '2026-10-04',
  current: current,
);
FitPresentation _result({
  VariantContext? context,
  FitDisplayStatus status = FitDisplayStatus.confirmed,
  FitEvidenceReference? evidence,
}) => FitPresentation(
  context: context ?? _context(),
  status: status,
  reason: 'Çağıranın örnek uygunluk açıklaması',
  evidence: evidence,
);
Widget _questionView({
  VariantContext? context,
  DistinctionQuestion? question,
  bool busy = false,
  String? error,
  ValueChanged<DistinctionAnswerRequest>? answer,
  ValueChanged<DistinctionQuestion>? photo,
  ValueChanged<VariantContext>? edit,
}) => VariantDistinctionView(
  context: context ?? _context(),
  question: question,
  busy: busy,
  errorMessage: error,
  onAnswerRequested: answer,
  onPhotoRequested: photo,
  onEditRequested: edit,
);
Widget _fit({
  VariantContext? context,
  FitPresentation? result,
  bool busy = false,
  String? error,
  ValueChanged<VariantContext>? prepare,
  ValueChanged<VariantContext>? resolve,
  ValueChanged<VariantContext>? teach,
  ValueChanged<VariantContext>? edit,
}) => MotorcycleFitView(
  context: context ?? _context(),
  result: result,
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

void main() {
  test('bağlam ve sorular boş/çift kimliği reddeder, seçenekler immutable', () {
    expect(
      () => VariantContext(
        motorcycleId: '',
        guideId: 'g',
        contextRevision: 'r',
        motorcycleLabel: 'm',
        guideLabel: 'g',
      ),
      throwsArgumentError,
    );
    expect(() => _question(options: []), throwsArgumentError);
    expect(
      () => _question(options: [_option('a'), _option('a')]),
      throwsArgumentError,
    );
    final options = [_option('a')];
    final q = _question(options: options);
    options.add(_option('b'));
    expect(q.options.length, 1);
    expect(() => q.options.add(_option('b')), throwsUnsupportedError);
    expect(_context().matches(_context(revision: 'r2')), isFalse);
    expect(
      () => FitEvidenceReference(
        context: _context(),
        source: ' ',
        version: 'r',
        location: 'p',
        checkedAt: 'd',
        current: true,
      ),
      throwsArgumentError,
    );
  });
  testWidgets(
    'tek soru ve doğru kapsamlı beyan; Emin değilim uygunluk üretmez',
    (t) async {
      final q = _question();
      final answers = <DistinctionAnswerRequest>[];
      await t.pumpWidget(_app(_questionView(question: q, answer: answers.add)));
      expect(find.text(q.prompt), findsOneWidget);
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      await _tap(t, 'Gözlem a');
      expect(answers.single.question, same(q));
      expect(answers.single.option, same(q.options.first));
      await _tap(t, 'Emin değilim');
      expect(answers.last.option, isNull);
      expect(answers.last.question.revision, 'question-r1');
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      expect(find.textContaining('kendiliğinden doğrulamaz'), findsOneWidget);
    },
  );
  testWidgets('fotoğraf yalnız destek isteği; teknik onay veya upload yok', (
    t,
  ) async {
    final requests = <DistinctionQuestion>[];
    final q = _question();
    await t.pumpWidget(_app(_questionView(question: q, photo: requests.add)));
    await _tap(t, 'Fotoğrafla destekle');
    expect(requests.single, same(q));
    expect(
      find.textContaining('tek başına teknik doğrulama değildir'),
      findsOneWidget,
    );
    expect(find.text('Uygunluk doğrulandı'), findsNothing);
  });
  testWidgets(
    'busy/hata korunur; disabled yanıt yok, tekrar gerçek aynı soruya gider',
    (t) async {
      final answers = <DistinctionAnswerRequest>[];
      final q = _question();
      final semantics = t.ensureSemantics();
      await t.pumpWidget(
        _app(
          _questionView(
            question: q,
            busy: true,
            error: 'Bağlantı kurulamadı',
            answer: answers.add,
          ),
        ),
      );
      await _tap(t, 'Gözlem a');
      await _tap(t, 'Emin değilim');
      expect(answers, isEmpty);
      expect(
        t
            .getSemantics(find.bySemanticsLabel('Emin değilim'))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(find.text('Bağlantı kurulamadı'), findsOneWidget);
      expect(find.text(q.prompt), findsOneWidget);
      await t.pumpWidget(_app(_questionView(question: q, answer: answers.add)));
      await _tap(t, 'Gözlem b');
      expect(answers.single.question, same(q));
      semantics.dispose();
    },
  );
  testWidgets(
    'soru değişiminde eski cevap yok; motor/rehber/revizyon uyuşmazlığı soruyu kapatır',
    (t) async {
      final answers = <DistinctionAnswerRequest>[];
      await t.pumpWidget(
        _app(_questionView(question: _question(), answer: answers.add)),
      );
      await _tap(t, 'Gözlem a');
      final next = _question(revision: 'question-r2', options: [_option('c')]);
      await t.pumpWidget(
        _app(_questionView(question: next, answer: answers.add)),
      );
      expect(find.text('Gözlem a'), findsNothing);
      await _tap(t, 'Gözlem c');
      expect(answers.last.question, same(next));
      for (final context in [
        _context(bike: 'b'),
        _context(guide: 'g2'),
        _context(revision: 'context-r2'),
      ]) {
        await t.pumpWidget(
          _app(
            _questionView(
              context: context,
              question: next,
              answer: answers.add,
            ),
          ),
        );
        expect(find.text('Gözlem c'), findsNothing);
        expect(find.text('Emin değilim'), findsNothing);
        expect(find.textContaining('güncel ayrım sorusu yok'), findsOneWidget);
      }
      expect(answers.length, 2);
    },
  );
  testWidgets(
    'uygunluk yalnız güncel kaynakla sunulur; tek hazırlık isteği, uygulama yok',
    (t) async {
      final requests = <VariantContext>[];
      final context = _context();
      await t.pumpWidget(
        _app(
          _fit(
            context: context,
            result: _result(evidence: _evidence()),
            prepare: requests.add,
          ),
        ),
      );
      expect(find.text('Uygunluk doğrulandı'), findsOneWidget);
      expect(find.text('Ayrım henüz yeterli değil'), findsNothing);
      expect(find.text('Kaynak: Örnek kaynak'), findsOneWidget);
      expect(find.textContaining('Bölüm 2 · sayfa 5'), findsOneWidget);
      expect(find.textContaining('garanti etmez'), findsOneWidget);
      expect(
        find.textContaining('güvenlik kontrolleri ayrıca'),
        findsOneWidget,
      );
      await _tap(t, 'Hazırlığı görüntüle');
      expect(requests.single, same(context));
      for (final label in [
        'Uygulamaya geç',
        'Hazırım',
        'Rehberi başlat',
        'Öğrenme görünümünü aç',
      ]) {
        expect(find.text(label), findsNothing);
      }
    },
  );
  testWidgets('eksik/eski/yanlış kaynak veya hata/busy olumlu yolu açmaz', (
    t,
  ) async {
    final requests = <VariantContext>[];
    final cases = <(VariantContext, FitPresentation?, bool, String?)>[
      (_context(), null, false, null),
      (_context(), _result(), false, null),
      (_context(), _result(evidence: _evidence(current: false)), false, null),
      (
        _context(),
        _result(
          evidence: _evidence(context: _context(bike: 'b')),
        ),
        false,
        null,
      ),
      (
        _context(),
        _result(
          evidence: _evidence(context: _context(guide: 'g2')),
        ),
        false,
        null,
      ),
      (
        _context(),
        _result(
          evidence: _evidence(context: _context(revision: 'r2')),
        ),
        false,
        null,
      ),
      (_context(bike: 'b'), _result(evidence: _evidence()), false, null),
      (_context(guide: 'g2'), _result(evidence: _evidence()), false, null),
      (_context(revision: 'r2'), _result(evidence: _evidence()), false, null),
      (
        _context(),
        _result(
          status: FitDisplayStatus.missingDistinction,
          evidence: _evidence(),
        ),
        false,
        null,
      ),
      (_context(), _result(evidence: _evidence()), true, null),
      (
        _context(),
        _result(evidence: _evidence()),
        false,
        'Kontrol tamamlanamadı',
      ),
    ];
    for (final c in cases) {
      await t.pumpWidget(
        _app(
          _fit(
            context: c.$1,
            result: c.$2,
            busy: c.$3,
            error: c.$4,
            prepare: requests.add,
          ),
        ),
      );
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
      expect(find.text('Ayrım henüz yeterli değil'), findsOneWidget);
      expect(find.textContaining('uygulama kapalı'), findsOneWidget);
    }
    expect(requests, isEmpty);
  });
  testWidgets(
    'eksik ayrım yolları farklıdır, kimliği korur, öğrenme uygulama değildir',
    (t) async {
      final actions = <String>[];
      final requests = <VariantContext>[];
      final c = _context();
      void collect(String action, VariantContext context) {
        actions.add(action);
        requests.add(context);
      }

      await t.pumpWidget(
        _app(
          _fit(
            context: c,
            resolve: (c) => collect('resolve', c),
            teach: (c) => collect('teach', c),
            edit: (c) => collect('edit', c),
          ),
        ),
      );
      await _tap(t, 'Ayrımı yeniden çöz');
      await _tap(t, 'Öğrenme görünümünü aç');
      await _tap(t, 'Motosiklet bilgilerini düzenle');
      expect(actions, ['resolve', 'teach', 'edit']);
      expect(requests.every((r) => identical(r, c)), isTrue);
      expect(find.textContaining('yalnız bilgi içindir'), findsOneWidget);
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text('Hazırlığı görüntüle'), findsNothing);
    },
  );
  testWidgets(
    'yeni bağlamda eski fit görünmez; yeniden değerlendirme istekleri yeni bağlamdadır',
    (t) async {
      final requests = <VariantContext>[];
      await t.pumpWidget(
        _app(
          _fit(
            result: _result(evidence: _evidence()),
            resolve: requests.add,
          ),
        ),
      );
      await _tap(t, 'Ayrımı yeniden gözden geçir');
      expect(requests.single.motorcycleId, 'bike-a');
      final next = _context(bike: 'bike-b');
      await t.pumpWidget(
        _app(
          _fit(
            context: next,
            result: _result(evidence: _evidence()),
            resolve: requests.add,
          ),
        ),
      );
      expect(find.text('Uygunluk doğrulandı'), findsNothing);
      expect(find.text('Kaynak: Örnek kaynak'), findsNothing);
      await _tap(t, 'Ayrımı yeniden çöz');
      expect(requests.last, same(next));
    },
  );
  testWidgets(
    'eksik callback açık ve disabled; hesap/teknik kod zorlaması yok',
    (t) async {
      final s = t.ensureSemantics();
      await t.pumpWidget(_app(_questionView(question: _question())));
      expect(
        t
            .getSemantics(find.bySemanticsLabel('Emin değilim'))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(find.textContaining('Yanıt gönderme şu anda'), findsOneWidget);
      await t.pumpWidget(_app(_fit(result: _result(evidence: _evidence()))));
      expect(
        t
            .getSemantics(find.bySemanticsLabel('Hazırlığı görüntüle'))
            .flagsCollection
            .isEnabled,
        ui.Tristate.isFalse,
      );
      expect(find.textContaining('Hazırlık görünümü şu anda'), findsOneWidget);
      expect(find.byType(EditableText), findsNothing);
      expect(find.text('Hesap aç'), findsNothing);
      s.dispose();
    },
  );
  testWidgets('klavye Tab/Enter/Space doğru isteği verir', (t) async {
    final requests = <DistinctionAnswerRequest>[];
    await t.pumpWidget(
      _app(_questionView(question: _question(), answer: requests.add)),
    );
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump();
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pump();
    expect(requests.single.option!.id, 'a');
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump();
    await t.sendKeyEvent(LogicalKeyboardKey.space);
    await t.pump();
    expect(requests.last.option!.id, 'b');
  });
  testWidgets('üç görünüm büyük metinle kayar, son eylem en az48', (t) async {
    for (final width in [320.0, 390.0, 768.0]) {
      for (final scale in [1.0, 2.0, 3.0]) {
        await t.binding.setSurfaceSize(Size(width, 844));
        for (final page in [
          _questionView(question: _question(), edit: (_) {}),
          _fit(result: _result(evidence: _evidence())),
          _fit(),
        ]) {
          await t.pumpWidget(_app(page, scale: scale));
          await t.pump();
          expect(t.takeException(), isNull, reason: '$width/$scale');
          final action = find.bySemanticsLabel(
            page is VariantDistinctionView
                ? 'Motosiklet bilgilerini düzenle'
                : page is MotorcycleFitView && page.result != null
                ? 'Ayrımı yeniden gözden geçir'
                : 'Motosiklet bilgilerini düzenle',
          );
          await t.ensureVisible(action);
          await t.pumpAndSettle();
          expect(t.getSize(action).height, greaterThanOrEqualTo(48));
          expect(t.takeException(), isNull);
        }
      }
    }
    await t.binding.setSurfaceSize(null);
  });
  testWidgets(
    'gerçek kontrol kenarı ve metin zemin üzerinde yeterli kontrastta',
    (t) async {
      await t.pumpWidget(
        _app(_questionView(question: _question(), answer: (_) {})),
      );
      final controls = t
          .widgetList<Container>(find.byType(Container))
          .where((w) => w.decoration is BoxDecoration)
          .toList();
      expect(controls.length, 5);
      for (final control in controls) {
        final element = t.element(find.byWidget(control));
        Color? bg;
        element.visitAncestorElements((a) {
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
        final ink = DefaultTextStyle.of(element).style.color!
            .computeLuminance();
        expect((light + .05) / (ink + .05), greaterThanOrEqualTo(4.5));
      }
    },
  );
  final preview = Platform.environment['KAVRIVA_VARIANT_PREVIEW'];
  if (preview != null) {
    testWidgets('yalnız yerel ayrım/uygun/eksik görselleri', (t) async {
      final loader = FontLoader('VariantPreview');
      loader.addFont(
        Future.value(
          ByteData.sublistView(
            File(Platform.environment['KAVRIVA_VARIANT_FONT']!)
                .readAsBytesSync(),
          ),
        ),
      );
      await t.runAsync(loader.load);
      await t.binding.setSurfaceSize(const Size(390, 844));
      for (final page in [
        (
          'question',
          _questionView(
            question: _question(),
            answer: (_) {},
            photo: (_) {},
            edit: (_) {},
          ),
        ),
        (
          'confirmed',
          _fit(
            result: _result(evidence: _evidence()),
            prepare: (_) {},
            resolve: (_) {},
          ),
        ),
        ('missing', _fit(resolve: (_) {}, teach: (_) {}, edit: (_) {})),
      ]) {
        final key = GlobalKey();
        await t.pumpWidget(
          _app(
            RepaintBoundary(
              key: key,
              child: KavrivaShell(
                selectedSection: KavrivaSection.garage,
                showNavigation: false,
                onSectionRequested: null,
                pages: {
                  KavrivaSection.garage: page.$2,
                  for (final s in KavrivaSection.values.where(
                    (s) => s != KavrivaSection.garage,
                  ))
                    s: const SizedBox.shrink(),
                },
              ),
            ),
            font: 'VariantPreview',
          ),
        );
        await t.pumpAndSettle();
        await t.runAsync(() async {
          final image =
              await (key.currentContext!.findRenderObject()!
                      as RenderRepaintBoundary)
                  .toImage();
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          await File('$preview-${page.$1}.png')
              .writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
      }
      await t.binding.setSurfaceSize(null);
    }, timeout: const Timeout(Duration(seconds: 30)));
  }
}
