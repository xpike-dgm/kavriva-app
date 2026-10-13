import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/active_execution.dart';
import 'package:kavriva_shell/condensed_execution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/variant_resolution.dart';

late ui.Image _image;
ExecutionScope _scope({
  String bike = 'bike-a',
  String guide = 'guide-a',
  String contextRevision = 'context-r1',
  String work = 'work-a',
  String guideVersion = 'guide-v2',
  String revision = 'eval-r1',
  String physical = 'physical-r1',
}) => ExecutionScope(
  context: VariantContext(
    motorcycleId: bike,
    guideId: guide,
    contextRevision: contextRevision,
    motorcycleLabel: 'Örnek ekran · gerçek motosiklet kararı değildir',
    guideLabel: 'Örnek konum kontrolü',
  ),
  executionId: work,
  guideVersion: guideVersion,
  revision: revision,
  physicalRevision: physical,
);
ExecutionProof _proof(
  ExecutionProofKind kind, {
  ExecutionScope? scope,
  String? subject,
  bool current = true,
  String source = 'Örnek değerlendirme kaynağı',
}) {
  final s = scope ?? _scope();
  return ExecutionProof(
    scope: s,
    kind: kind,
    subjectId:
        subject ??
        switch (kind) {
          ExecutionProofKind.content || ExecutionProofKind.visual => 'step-a',
          ExecutionProofKind.safetyCheck => 'safety-a',
          _ => s.executionId,
        },
    evaluationId: 'proof-${kind.name}',
    source: source,
    version: 'kaynak-v2',
    location: 'Örnek kontrol bölümü · sayfa 3',
    checkedAt: '2026-10-04',
    current: current,
  );
}

ExecutionSafetyCheck _check({
  String id = 'safety-a',
  bool verified = true,
  bool reviewed = true,
  bool proof = true,
  ExecutionProof? reference,
}) => ExecutionSafetyCheck(
  id: id,
  label: 'Örnek zorunlu güvenlik koşulu',
  risk:
      'Bu örnek koşul kontrol edilmezse güvenli ilerleme sonucu doğrulanamaz.',
  prevention: 'İlgili koşulu güncel kaynakla açıkça kontrol ettir.',
  stopCondition: 'Koşul eksik, belirsiz veya uyumsuzsa normal ilerleme durur.',
  verified: verified,
  explicitlyReviewed: reviewed,
  proof: proof
      ? reference ?? _proof(ExecutionProofKind.safetyCheck, subject: id)
      : null,
);
ExecutionVisual _visual({
  ExecutionProof? proof,
  bool referencePresent = true,
  Rect region = const Rect.fromLTWH(.25, .2, .5, .6),
}) => ExecutionVisual(
  image: _image,
  focusRegion: region,
  description: 'Örnek konum şeması; gerçek motosiklet fotoğrafı değildir.',
  focus: 'İşaretli örnek bölgeye bak',
  proof: referencePresent ? proof ?? _proof(ExecutionProofKind.visual) : null,
);
ActiveStepPresentation _step({
  ExecutionScope? scope,
  ExecutionDisplayState state = ExecutionDisplayState.active,
  Map<ExecutionProofKind, ExecutionProof?> overrides = const {},
  List<ExecutionSafetyCheck>? checks,
  bool visual = true,
  String title = 'Örnek konum kontrolü',
  String instruction = 'İşaretli örnek konuma ait kontrol sonucunu bildir.',
  int number = 4,
  int count = 9,
}) {
  ExecutionProof? p(ExecutionProofKind kind) =>
      overrides.containsKey(kind) ? overrides[kind] : _proof(kind);
  return ActiveStepPresentation(
    scope: scope ?? _scope(),
    stepId: 'step-a',
    title: title,
    instruction: instruction,
    detail: 'Bu örnek adımın kaynak, değerlendirme ve güncellik bilgilerini kontrol edebilirsin.',
    stepNumber: number,
    stepCount: count,
    state: state,
    holdReason:
        'Güncel kaynak, uygunluk veya zorunlu güvenlik koşulu doğrulanmadı.',
    decision: p(ExecutionProofKind.decision),
    fit: p(ExecutionProofKind.fit),
    readiness: p(ExecutionProofKind.readiness),
    contentProof: p(ExecutionProofKind.content),
    visual: visual
        ? _visual(
            proof: p(ExecutionProofKind.visual),
            referencePresent: p(ExecutionProofKind.visual) != null,
          )
        : null,
    safetyChecks: checks ?? [_check()],
  );
}

ActiveStepView _active({
  ExecutionScope? scope,
  ActiveStepPresentation? step,
  bool busy = false,
  String? error,
  ValueChanged<ExecutionRequest>? reported,
  ValueChanged<ExecutionRequest>? problem,
  ValueChanged<ExecutionRequest>? check,
  ValueChanged<ExecutionRequest>? recheck,
  ValueChanged<ExecutionRequest>? close,
  ValueChanged<VariantContext>? teaching,
}) => ActiveStepView(
  brand: const Text('Kavriva', style: TextStyle(fontWeight: FontWeight.w600)),
  scope: scope ?? _scope(),
  step: step,
  busy: busy,
  errorMessage: error,
  onStepReported: reported,
  onProblemRequested: problem,
  onCheckRequested: check,
  onRecheckRequested: recheck,
  onSafeClosureRequested: close,
  onTeachingRequested: teaching,
);
Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFF8FAFC),
    debugShowCheckedModeBanner: false,
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
    final input = context.dependOnInheritedWidgetOfExactType<_Input>()!;
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: TextScaler.linear(input.scale)),
      child: DefaultTextStyle(
        style: TextStyle(
          color: const Color(0xFF101827),
          fontSize: 16,
          fontFamily: input.font,
        ),
        child: KavrivaShell(
          pages: {
            for (final section in KavrivaSection.values)
              section: section == KavrivaSection.assistance
                  ? input.content
                  : const SizedBox(),
          },
          selectedSection: KavrivaSection.assistance,
          showNavigation: false,
          onSectionRequested: null,
        ),
      ),
    );
  }
}

Future<void> _tap(WidgetTester tester, String label) async {
  final f = find.text(label);
  await tester.ensureVisible(f);
  await tester.pump();
  await tester.tap(f);
  await tester.pump();
}

bool _enabled(WidgetTester tester, String label) {
  final f = find.ancestor(
    of: find.text(label),
    matching: find.byType(Semantics),
  );
  return f
      .evaluate()
      .map((x) => x.widget as Semantics)
      .any((s) => s.properties.button == true && s.properties.enabled == true);
}

CondensedInstruction _short({
  ExecutionScope? scope,
  String stepId = 'step-a',
  ExecutionProof? proof,
}) {
  final s = scope ?? _scope();
  return CondensedInstruction(
    scope: s,
    stepId: stepId,
    instruction: 'Örnek işaretli konumun sonucunu bildir.',
    proof:
        proof ?? _proof(ExecutionProofKind.content, scope: s, subject: stepId),
  );
}

CondensedExecutionView _view({
  ActiveStepView? full,
  CondensedInstruction? short,
}) => CondensedExecutionView(
  full: full ?? _active(step: _step()),
  condensed: short,
);
void main() {
  setUpAll(() async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 320, 180),
      Paint()..color = const Color(0xFFE4EAF2),
    );
    canvas.drawRect(
      const Rect.fromLTWH(80, 36, 160, 108),
      Paint()..color = const Color(0xFF5E6E81),
    );
    canvas.drawCircle(
      const Offset(160, 90),
      30,
      Paint()..color = const Color(0xFFF8FAFC),
    );
    final picture = recorder.endRecording();
    _image = await picture.toImage(320, 180);
    picture.dispose();
  });
  tearDownAll(() => _image.dispose());

  test('Short data rejects empty IDs and empty text', () {
    expect(
      () => CondensedInstruction(
        scope: _scope(),
        stepId: '',
        instruction: 'Metin',
        proof: null,
      ),
      throwsArgumentError,
    );
    expect(
      () => CondensedInstruction(
        scope: _scope(),
        stepId: 'step-a',
        instruction: ' ',
        proof: null,
      ),
      throwsArgumentError,
    );
  });

  testWidgets(
    'Explicit short choice preserves physical step, safety, visual and callback targets',
    (tester) async {
      final scope = _scope();
      final step = _step(scope: scope);
      final events = <ExecutionRequest>[];
      final full = _active(
        scope: scope,
        step: step,
        reported: events.add,
        problem: events.add,
        close: events.add,
      );
      final short = _short(scope: scope);
      await tester.pumpWidget(_app(_view(full: full, short: short)));
      expect(find.text('Tam anlatım'), findsOneWidget);
      expect(find.textContaining('Bu ekran ilk açıldığında'), findsOneWidget);
      expect(find.textContaining('telefonunuzda daha hızlı'), findsOneWidget);
      expect(
        find.textContaining("sonucu 'güvenli' diye kaydetmez"),
        findsOneWidget,
      );
      expect(find.text(step.instruction), findsOneWidget);
      expect(find.text(short.instruction), findsNothing);
      await _tap(tester, 'Kısa anlatımı aç');
      final rendered = tester.widget<ActiveStepView>(
        find.byType(ActiveStepView),
      );
      expect(rendered.step!.instruction, short.instruction);
      expect(find.textContaining('Bu ekran ilk açıldığında'), findsOneWidget);
      expect(find.textContaining('telefonunuzda daha hızlı'), findsOneWidget);
      expect(
        find.textContaining("sonucu 'güvenli' diye kaydetmez"),
        findsOneWidget,
      );
      expect(rendered.step!.stepCount, step.stepCount);
      expect(rendered.step!.stepNumber, step.stepNumber);
      expect(identical(rendered.step!.visual, step.visual), isTrue);
      expect(
        identical(rendered.step!.safetyChecks.first, step.safetyChecks.first),
        isTrue,
      );
      expect(identical(rendered.step!.contentProof, step.contentProof), isTrue);
      expect(find.text('Adım 4 / 9'), findsOneWidget);
      for (final label in [
        'Kontrolü tamamladım',
        'Sorun var',
        'Güvenli şekilde durdurma yolunu aç',
      ]) {
        await _tap(tester, label);
      }
      expect(events.length, 3);
      expect(
        tester.widget<ActiveStepView>(find.byType(ActiveStepView)).step!.state,
        step.state,
      );
      expect(
        events.every(
          (e) => identical(e.scope, scope) && e.stepId == step.stepId,
        ),
        isTrue,
      );
      expect(find.textContaining('Sürüşe güvenli olduğu'), findsOneWidget);
      expect(find.textContaining('Zorunlu güvenlik:'), findsOneWidget);
      expect(find.textContaining('Risk:'), findsOneWidget);
      expect(find.textContaining('Önleme:'), findsOneWidget);
      expect(find.textContaining('Durma koşulu:'), findsOneWidget);
      await _tap(tester, 'Tam anlatıma dön');
      expect(find.text(step.instruction), findsOneWidget);
      expect(find.text(short.instruction), findsNothing);
      expect(events.length, 3);
    },
  );

  testWidgets(
    'Task title visual and instruction precede explanations in the first phone viewport',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final step = _step();
      final short = _short();
      await tester.pumpWidget(
        _app(
          _view(
            full: _active(step: step),
            short: short,
          ),
        ),
      );
      for (final instruction in [step.instruction, short.instruction]) {
        final titleRect = tester.getRect(find.text(step.title));
        final visualRect = tester.getRect(find.byType(RawImage));
        final instructionRect = tester.getRect(find.text(instruction));
        expect(titleRect.top, greaterThanOrEqualTo(0));
        expect(titleRect.bottom, lessThan(visualRect.top));
        expect(visualRect.bottom, lessThan(instructionRect.top));
        expect(instructionRect.bottom, lessThanOrEqualTo(844));
        expect(
          tester.getRect(find.textContaining('Anlatım kısalır')).top,
          greaterThan(instructionRect.bottom),
        );
        if (instruction == step.instruction) {
          await _tap(tester, 'Kısa anlatımı aç');
        }
      }
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'Missing stale wrong-purpose or foreign short source never replaces full instruction',
    (tester) async {
      final step = _step();
      final foreigners = [
        _scope(bike: 'other'),
        _scope(guide: 'other'),
        _scope(contextRevision: 'other'),
        _scope(work: 'other'),
        _scope(guideVersion: 'other'),
        _scope(revision: 'other'),
        _scope(physical: 'other'),
      ];
      final sources = <CondensedInstruction?>[
        CondensedInstruction(
          scope: _scope(),
          stepId: 'step-a',
          instruction: 'x' * step.instruction.runes.length,
          proof: _proof(ExecutionProofKind.content),
        ),
        CondensedInstruction(
          scope: _scope(),
          stepId: 'step-a',
          instruction: 'x' * (step.instruction.runes.length + 1),
          proof: _proof(ExecutionProofKind.content),
        ),
        null,
        _short(proof: _proof(ExecutionProofKind.content, current: false)),
        _short(proof: _proof(ExecutionProofKind.visual)),
        _short(stepId: 'other-step'),
        CondensedInstruction(
          scope: _scope(),
          stepId: 'step-a',
          instruction: 'Kısa',
          proof: null,
        ),
        CondensedInstruction(
          scope: _scope(),
          stepId: 'step-a',
          instruction: step.instruction,
          proof: _proof(ExecutionProofKind.content),
        ),
        for (final s in foreigners) _short(scope: s),
        for (final s in foreigners)
          _short(proof: _proof(ExecutionProofKind.content, scope: s)),
      ];
      for (final short in sources) {
        await tester.pumpWidget(
          _app(
            _view(
              full: _active(step: step),
              short: short,
            ),
          ),
        );
        expect(find.textContaining('başka adıma ait'), findsOneWidget);
        expect(_enabled(tester, 'Kısa anlatımı aç'), isFalse);
        await _tap(tester, 'Kısa anlatımı aç');
        expect(find.text(step.instruction), findsOneWidget);
        expect(find.text('Tam anlatım'), findsOneWidget);
      }
    },
  );

  testWidgets(
    'Short content never replaces missing active safety or canonical progress gates',
    (tester) async {
      final sent = <ExecutionRequest>[];
      final bad = [
        _step(state: ExecutionDisplayState.held),
        _step(checks: []),
        _step(checks: [_check(reviewed: false)]),
        _step(checks: [_check(verified: false)]),
        _step(checks: [_check(proof: false)]),
        _step(
          checks: [
            _check(
              reference: _proof(
                ExecutionProofKind.safetyCheck,
                subject: 'safety-a',
                current: false,
              ),
            ),
          ],
        ),
        _step(visual: false),
        for (final k in [
          ExecutionProofKind.decision,
          ExecutionProofKind.fit,
          ExecutionProofKind.readiness,
          ExecutionProofKind.content,
          ExecutionProofKind.visual,
        ])
          _step(overrides: {k: null}),
        _step(scope: _scope(physical: 'foreign')),
      ];
      for (final step in bad) {
        await tester.pumpWidget(
          _app(
            _view(
              full: _active(step: step, reported: sent.add, close: sent.add),
              short: _short(),
            ),
          ),
        );
        if (_enabled(tester, 'Kısa anlatımı aç'))
          await _tap(tester, 'Kısa anlatımı aç');
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        await _tap(tester, 'Kontrolü tamamladım');
        expect(sent, isEmpty);
        expect(find.text(_short().instruction), findsNothing);
        expect(find.textContaining('Sürüşe güvenli olduğu'), findsOneWidget);
        expect(_enabled(tester, 'Güvenli şekilde durdurma yolunu aç'), isTrue);
      }
    },
  );

  testWidgets(
    'Scope step and replacement short source reset prior choice without automatic effects',
    (tester) async {
      final sent = <ExecutionRequest>[];
      final full = _active(step: _step(), reported: sent.add);
      final short = _short();
      await tester.pumpWidget(_app(_view(full: full, short: short)));
      await _tap(tester, 'Kısa anlatımı aç');
      await tester.pumpWidget(_app(_view(full: full, short: _short())));
      expect(find.text('Tam anlatım'), findsOneWidget);
      await _tap(tester, 'Kısa anlatımı aç');
      await tester.pumpWidget(
        _app(
          _view(
            full: _active(
              scope: _scope(physical: 'new'),
              step: _step(),
            ),
            short: short,
          ),
        ),
      );
      expect(find.text('Tam anlatım'), findsOneWidget);
      expect(_enabled(tester, 'Kısa anlatımı aç'), isFalse);
      expect(find.text(short.instruction), findsNothing);
      expect(sent, isEmpty);
    },
  );

  testWidgets(
    'Busy error and absent handlers cannot report a step in either form',
    (tester) async {
      final sent = <ExecutionRequest>[];
      for (final full in [
        _active(step: _step(), busy: true, reported: sent.add),
        _active(
          step: _step(),
          error: 'İstek gönderilemedi',
          reported: sent.add,
        ),
        _active(step: _step()),
      ]) {
        await tester.pumpWidget(_app(_view(full: full, short: _short())));
        await _tap(tester, 'Kısa anlatımı aç');
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        await _tap(tester, 'Kontrolü tamamladım');
        expect(sent, isEmpty);
        if (full.busy || full.errorMessage != null)
          expect(
            find.textContaining('yeni adım bildirimi gönderilemez'),
            findsOneWidget,
          );
        await _tap(tester, 'Tam anlatıma dön');
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        if (full.busy || full.errorMessage != null)
          expect(
            find.textContaining('yeni adım bildirimi gönderilemez'),
            findsOneWidget,
          );
      }
    },
  );

  testWidgets(
    'Mode control supports real Tab Enter Space focus and readable touch target',
    (tester) async {
      final semantics = tester.ensureSemantics();
      try {
        await tester.pumpWidget(
          _app(
            _view(
              full: _active(step: _step()),
              short: _short(),
            ),
          ),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();
        expect(find.text('Kısa anlatım'), findsOneWidget);
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();
        expect(find.text('Tam anlatım'), findsOneWidget);
        final box = find
            .ancestor(
              of: find.text('Kısa anlatımı aç'),
              matching: find.byType(GestureDetector),
            )
            .first;
        expect(tester.getSize(box).height, greaterThanOrEqualTo(52));
        expect(_enabled(tester, 'Kısa anlatımı aç'), isTrue);
      } finally {
        semantics.dispose();
      }
    },
  );

  testWidgets(
    'Full scrolling preserves all safety and recovery at varied widths and text scales',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final width in [320.0, 390.0, 768.0]) {
        tester.view.physicalSize = Size(width, 844);
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final step in [
            _step(),
            _step(state: ExecutionDisplayState.held),
            _step(checks: [_check(reviewed: false)]),
            _step(
              instruction:
                  'Bu uzun açıklama yalnız bir örnektir; gerçek motosiklet talimatı değildir. ' *
                  8,
            ),
          ]) {
            final short = _short();
            final full = _active(step: step, close: (_) {});
            await tester.pumpWidget(
              _app(
                _view(full: full, short: short),
                scale: scale,
              ),
            );
            for (final mode in [false, true]) {
              if (mode) await _tap(tester, 'Kısa anlatımı aç');
              final outer = find
                  .descendant(
                    of: find.byKey(const ValueKey('condensed-scroll')),
                    matching: find.byType(Scrollable),
                  )
                  .first;
              final pos = tester.state<ScrollableState>(outer).position;
              for (double y = 0; y < pos.maxScrollExtent; y += 400) {
                pos.jumpTo(y);
                await tester.pump();
                expect(tester.takeException(), isNull);
              }
              await _tap(tester, 'Güvenli şekilde durdurma yolunu aç');
              expect(tester.takeException(), isNull);
              for (final label in ['Risk:', 'Önleme:', 'Durma koşulu:'])
                expect(find.textContaining(label), findsOneWidget);
            }
          }
        }
      }
    },
  );

  testWidgets(
    'M-CONDENSED-01 v2 measures paired user-invoked headless render intervals without speed bounds',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final step = _step();
      final short = _short();
      final full = _active(step: step);
      await tester.pumpWidget(_app(_view(full: full, short: short)));
      await _tap(tester, 'Kısa anlatımı aç');
      await _tap(tester, 'Tam anlatıma dön');
      final samples = <Map<String, Object>>[];
      for (var i = 0; i < 3; i++) {
        for (final mode in ['short', 'full']) {
          final label = mode == 'short'
              ? 'Kısa anlatımı aç'
              : 'Tam anlatıma dön';
          await tester.ensureVisible(find.text(label));
          await tester.pump();
          final watch = Stopwatch()..start();
          await tester.tap(find.text(label));
          await tester.pump();
          watch.stop();
          final rendered = tester.widget<ActiveStepView>(
            find.byType(ActiveStepView),
          );
          expect(rendered.step!.stepCount, step.stepCount);
          expect(rendered.step!.stepNumber, step.stepNumber);
          expect(
            rendered.step!.instruction,
            mode == 'short' ? short.instruction : step.instruction,
          );
          samples.add({
            'pair': i,
            'mode': mode,
            'wallMicroseconds': watch.elapsedMicroseconds,
            'stepNumber': rendered.step!.stepNumber,
            'stepCount': rendered.step!.stepCount,
            'instructionCharacters': rendered.step!.instruction.runes.length,
          });
        }
      }
      final receipt = {
        'method': 'M-CONDENSED-01 v2',
        'viewport': [390, 844],
        'scale': 1,
        'interval': 'tester.tap through tester.pump; excludes ensureVisible; includes pointer/build/layout/paint/harness',
        'warmupPairs': 1,
        'pairs': 3,
        'deviceProof': false,
        'bounds': 'HELD',
        'samples': samples,
      };
      final encoded = jsonEncode(receipt);
      // Actual samples, not fixed expected durations or a performance threshold.
      print('CONDENSED-MEASUREMENT ' + encoded);
      final path = Platform.environment['KAVRIVA_CONDENSED_MEASUREMENT'];
      if (path != null)
        await tester.runAsync(
          () async => File(path).writeAsString(encoded + '\n'),
        );
    },
  );

  final capture = Platform.environment['KAVRIVA_CONDENSED_PREVIEW'];
  if (capture != null)
    testWidgets(
      'Optional natural full-scroll capture, not included in ordinary CI count',
      (tester) async {
        const font = 'KavrivaCondensedCapture';
        final fontPath = Platform.environment['KAVRIVA_CONDENSED_FONT'];
        if (fontPath == null)
          throw StateError('Capture requires actual fixed font');
        await tester.runAsync(() async {
          final bytes = await File(fontPath).readAsBytes();
          final loader = FontLoader(font)
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final callbacks = <ExecutionRequest>[];
        ActiveStepView full(
          ActiveStepPresentation? step, {
          bool busy = false,
          String? error,
          bool handlers = true,
        }) => _active(
          step: step,
          busy: busy,
          error: error,
          reported: handlers ? callbacks.add : null,
          problem: callbacks.add,
          check: callbacks.add,
          recheck: callbacks.add,
          close: callbacks.add,
          teaching: (_) {},
        );
        final cases =
            <
              ({
                String name,
                ActiveStepView full,
                CondensedInstruction? short,
                bool select,
              })
            >[
              (
                name: 'full',
                full: full(_step()),
                short: _short(),
                select: false,
              ),
              (
                name: 'short',
                full: full(_step()),
                short: _short(),
                select: true,
              ),
              (
                name: 'missing-short',
                full: full(_step()),
                short: null,
                select: false,
              ),
              (
                name: 'stale-short',
                full: full(_step()),
                short: _short(
                  proof: _proof(ExecutionProofKind.content, current: false),
                ),
                select: false,
              ),
              (
                name: 'foreign-bike',
                full: full(_step()),
                short: _short(scope: _scope(bike: 'other')),
                select: false,
              ),
              (
                name: 'foreign-step',
                full: full(_step()),
                short: _short(stepId: 'other-step'),
                select: false,
              ),
              (
                name: 'wrong-purpose',
                full: full(_step()),
                short: _short(proof: _proof(ExecutionProofKind.visual)),
                select: false,
              ),
              (
                name: 'missing-short-proof',
                full: full(_step()),
                short: CondensedInstruction(
                  scope: _scope(),
                  stepId: 'step-a',
                  instruction: 'Örnek kısa metin',
                  proof: null,
                ),
                select: false,
              ),
              (
                name: 'missing-active',
                full: full(null),
                short: _short(),
                select: false,
              ),
              (
                name: 'held-active',
                full: full(_step(state: ExecutionDisplayState.held)),
                short: _short(),
                select: true,
              ),
              (
                name: 'missing-fit',
                full: full(_step(overrides: {ExecutionProofKind.fit: null})),
                short: _short(),
                select: true,
              ),
              (
                name: 'missing-readiness',
                full: full(
                  _step(overrides: {ExecutionProofKind.readiness: null}),
                ),
                short: _short(),
                select: true,
              ),
              (
                name: 'missing-safety',
                full: full(_step(checks: [])),
                short: _short(),
                select: true,
              ),
              (
                name: 'unreviewed-safety',
                full: full(_step(checks: [_check(reviewed: false)])),
                short: _short(),
                select: true,
              ),
              (
                name: 'stale-safety',
                full: full(
                  _step(
                    checks: [
                      _check(
                        reference: _proof(
                          ExecutionProofKind.safetyCheck,
                          subject: 'safety-a',
                          current: false,
                        ),
                      ),
                    ],
                  ),
                ),
                short: _short(),
                select: true,
              ),
              (
                name: 'missing-visual',
                full: full(_step(visual: false)),
                short: _short(),
                select: true,
              ),
              (
                name: 'busy-short',
                full: full(_step(), busy: true),
                short: _short(),
                select: true,
              ),
              (
                name: 'error-short',
                full: full(_step(), error: 'Örnek istek gönderilemedi'),
                short: _short(),
                select: true,
              ),
              (
                name: 'no-handler-short',
                full: full(_step(), handlers: false),
                short: _short(),
                select: true,
              ),
              (
                name: 'long-full',
                full: full(
                  _step(
                    instruction:
                        'Bu uzun açıklama yalnız bir örnektir; gerçek motosiklet talimatı değildir. ' *
                        8,
                  ),
                ),
                short: _short(),
                select: false,
              ),
              (
                name: 'long-short',
                full: full(
                  _step(
                    instruction:
                        'Bu uzun açıklama yalnız bir örnektir; gerçek motosiklet talimatı değildir. ' *
                        8,
                  ),
                ),
                short: _short(),
                select: true,
              ),
            ];
        final entries = <Map<String, Object>>[];
        for (final item in cases) {
          final key = GlobalKey();
          await tester.pumpWidget(
            _app(
              RepaintBoundary(
                key: key,
                child: ColoredBox(
                  color: const Color(0xFFF8FAFC),
                  child: _view(full: item.full, short: item.short),
                ),
              ),
              font: font,
            ),
          );
          await tester.pumpAndSettle();
          if (item.select) await _tap(tester, 'Kısa anlatımı aç');
          final pos = tester
              .state<ScrollableState>(
                find
                    .descendant(
                      of: find.byKey(const ValueKey('condensed-scroll')),
                      matching: find.byType(Scrollable),
                    )
                    .first,
              )
              .position;
          pos.jumpTo(0);
          await tester.pump();
          var index = 0;
          while (true) {
            final file =
                capture + '-' + item.name + '-' + index.toString() + '.png';
            final offset = pos.pixels;
            final extent = pos.maxScrollExtent;
            final boundary =
                key.currentContext!.findRenderObject()!
                    as RenderRepaintBoundary;
            await tester.runAsync(() async {
              final image = await boundary.toImage(pixelRatio: 1);
              final data = await image.toByteData(
                format: ui.ImageByteFormat.png,
              );
              await File(file).writeAsBytes(data!.buffer.asUint8List());
              image.dispose();
            });
            entries.add({
              'case': item.name,
              'file': file,
              'index': index,
              'offset': offset,
              'maxScrollExtent': extent,
              'width': 390,
              'height': 844,
              'selectedShort': item.select,
            });
            index++;
            if (pos.pixels >= pos.maxScrollExtent) break;
            pos.jumpTo((pos.pixels + 600).clamp(0, pos.maxScrollExtent));
            await tester.pump();
            expect(tester.takeException(), isNull);
          }
        }
        expect(callbacks, isEmpty);
        await tester.runAsync(
          () async => File(capture + '-manifest.json').writeAsString(
            jsonEncode({
                  'cases': cases.length,
                  'font': fontPath,
                  'scope': 'natural headless presentation fixtures; no human/device/production proof',
                  'entries': entries,
                }) +
                '\n',
          ),
        );
      },
    );
}
