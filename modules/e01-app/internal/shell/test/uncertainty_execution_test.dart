import 'dart:convert';
import 'dart:collection';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart' show RenderRepaintBoundary;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/active_execution.dart';
import 'package:kavriva_shell/condensed_execution.dart';
import 'package:kavriva_shell/uncertainty_execution.dart';

import 'package:kavriva_shell/offline_safety_status.dart';

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
  String holdReason =
      'Güncel kaynak, uygunluk veya zorunlu güvenlik koşulu doğrulanmadı.',
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
    holdReason: holdReason,
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

Map<String, dynamic> _wire() => jsonDecode(
  File('test/fixtures/offline_safety_status_wire.json').readAsStringSync(),
) as Map<String, dynamic>;

UncertaintyExecutionView _view({
  required Object? wire,
  ActiveStepView? full,
  CondensedInstruction? short,
}) => UncertaintyExecutionView(
  full: full ?? _active(step: _step()),
  condensed: short ?? _short(),
  offlineStatus: wire,
);

ScrollPosition _position(WidgetTester tester) => tester
    .state<ScrollableState>(
      find
          .descendant(
            of: find.byKey(const ValueKey('condensed-scroll')),
            matching: find.byType(Scrollable),
          )
          .first,
    )
    .position;

class _ThrowingMap extends MapBase<String, Object?> {
  @override
  Iterable<String> get keys => const [
    'schema',
    'context',
    'authority',
    'physicalProgression',
    'reason',
    'retainedContexts',
  ];
  @override
  Object? operator [](Object? key) => throw StateError('unavailable');
  @override
  void operator []=(String key, Object? value) => throw UnimplementedError();
  @override
  void clear() => throw UnimplementedError();
  @override
  Object? remove(Object? key) => throw UnimplementedError();
}

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

  test('Actual E4 negative producer wire is immutable and binds every current display axis', () {
    final raw = _wire();
    final status = OfflineSafetyStatus.tryDecode(raw)!;
    expect(status.authority, 'NONE');
    expect(status.permitsPhysicalProgression, isFalse);
    expect(
      status.matches(Map<String, String>.from(raw['context'] as Map)),
      isTrue,
    );
    expect(() => status.context['stepId'] = 'foreign', throwsUnsupportedError);
    for (final key in OfflineSafetyStatus.contextKeys) {
      final target = Map<String, String>.from(raw['context'] as Map);
      target[key] = 'foreign';
      expect(status.matches(target), isFalse, reason: key);
    }
    (raw['context'] as Map)['stepId'] = 'mutated-wire';
    expect(status.context['stepId'], 'step-a');
  });

  test('Malformed positive stale-schema and missing-tuple payloads or throwing maps fail closed', () {
    final base = _wire();
    for (final changed in [
      {'schema': 'old'},
      {'authority': 'ALLOW'},
      {'physicalProgression': true},
      {'physicalProgression': 0},
      {'physicalProgression': 'false'},
      {'reason': 'ALLOW'},
      {'retainedContexts': <String>[]},
      {
        'retainedContexts': ['TEACHING_HISTORY'],
      },
      {'extra': 'mixed-version'},
      {'context': 'invalid'},
    ]) {
      expect(OfflineSafetyStatus.tryDecode({...base, ...changed}), isNull);
    }
    for (final key in OfflineSafetyStatus.contextKeys) {
      final missing = Map<String, dynamic>.from(base['context'] as Map)
        ..remove(key);
      expect(
        OfflineSafetyStatus.tryDecode({...base, 'context': missing}),
        isNull,
      );
      for (final value in [null, '', ' padded ', false]) {
        final malformed = {
          ...Map<String, dynamic>.from(base['context'] as Map),
          key: value,
        };
        expect(
          OfflineSafetyStatus.tryDecode({...base, 'context': malformed}),
          isNull,
        );
      }
    }
    for (final input in [
      null,
      false,
      0,
      'ALLOW',
      <dynamic>[],
      _ThrowingMap(),
    ]) {
      expect(OfflineSafetyStatus.tryDecode(input), isNull);
    }
  });

  testWidgets(
    'Banner remains in its viewport slot across full short and every body offset',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(390, 844);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPhysicalSize);
      final step = _step();
      await tester.pumpWidget(
        _app(
          _view(
            wire: _wire(),
            full: _active(step: step),
          ),
        ),
      );
      final initial = tester.getRect(
        find.byKey(const ValueKey('uncertainty-band')),
      );
      for (final mode in ['full', 'short', 'full']) {
        if (mode == 'short') await _tap(tester, 'Kısa anlatımı aç');
        if (mode == 'full' &&
            find.text('Tam anlatıma dön').evaluate().isNotEmpty) {
          await _tap(tester, 'Tam anlatıma dön');
        }
        final rendered = tester.widget<ActiveStepView>(
          find.byType(ActiveStepView),
        );
        expect(rendered.step!.state, ExecutionDisplayState.held);
        expect(rendered.step!.stepCount, 9);
        expect(rendered.step!.stepNumber, 4);
        expect(identical(rendered.step!.visual, step.visual), isTrue);
        expect(rendered.step!.safetyChecks, orderedEquals(step.safetyChecks));
        final pos = _position(tester);
        for (final offset in [
          0.0,
          pos.maxScrollExtent / 2,
          pos.maxScrollExtent,
        ]) {
          pos.jumpTo(offset);
          await tester.pump();
          expect(
            tester.getRect(find.byKey(const ValueKey('uncertainty-band'))),
            initial,
          );
          expect(initial.top >= 0 && initial.bottom <= 844, isTrue);
          expect(
            find.text('Güvenlik belirsizliği var. İlerleme kapalı.'),
            findsOneWidget,
          );
          expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        }
      }
    },
  );

  testWidgets(
    'Normal report never sends; recovery requests carry current tuple and do not save outcome',
    (tester) async {
      final scope = _scope(), step = _step();
      final reports = <ExecutionRequest>[], recovery = <ExecutionRequest>[];
      final teaching = <VariantContext>[];
      await tester.pumpWidget(
        _app(
          _view(
            wire: _wire(),
            full: _active(
              scope: scope,
              step: step,
              reported: reports.add,
              problem: recovery.add,
              recheck: recovery.add,
              close: recovery.add,
              teaching: teaching.add,
            ),
          ),
        ),
      );
      for (final mode in ['full', 'short']) {
        if (mode == 'short') await _tap(tester, 'Kısa anlatımı aç');
        await _tap(tester, 'Kontrolü tamamladım');
        expect(reports, isEmpty);
        for (final label in [
          'Sorun var',
          'Güncel durumu yeniden kontrol et',
          'Güvenli şekilde durdurma yolunu aç',
        ])
          await _tap(tester, label);
        await _tap(tester, 'Yalnız öğrenme bilgisine dön');
        expect(find.byType(WorkOutcomeView), findsNothing);
        expect(
          find.textContaining("sonucu 'güvenli' diye kaydetmez"),
          findsOneWidget,
        );
        expect(find.textContaining('izin değildir'), findsOneWidget);
      }
      expect(recovery.length, 6);
      expect(
        recovery.every(
          (e) => identical(e.scope, scope) && e.stepId == 'step-a',
        ),
        isTrue,
      );
      expect(teaching.length, 2);
      expect(teaching.every((e) => identical(e, scope.context)), isTrue);
      expect(step.state, ExecutionDisplayState.active);
    },
  );

  testWidgets(
    'Same source keeps mode on parent refresh; changed wire or scope resets old selection',
    (tester) async {
      final scope = _scope(), step = _step(), short = _short(), wire = _wire();
      final full = _active(scope: scope, step: step);
      await tester.pumpWidget(
        _app(_view(wire: wire, full: full, short: short)),
      );
      await _tap(tester, 'Kısa anlatımı aç');
      await tester.pumpWidget(
        _app(
          _view(
            wire: _wire(),
            full: _active(scope: scope, step: step, busy: true),
            short: short,
          ),
        ),
      );
      expect(find.text('Kısa anlatım'), findsOneWidget);
      expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
      final foreign = {
        ..._wire(),
        'context': {
          ...Map<String, dynamic>.from(wire['context'] as Map),
          'stepId': 'foreign-step',
        },
      };
      await tester.pumpWidget(
        _app(_view(wire: foreign, full: full, short: short)),
      );
      expect(find.text('Tam anlatım'), findsOneWidget);
      expect(
        find.textContaining('seçili motosiklet ve adıma ait değil'),
        findsOneWidget,
      );
      await _tap(tester, 'Kısa anlatımı aç');
      await tester.pumpWidget(
        _app(
          _view(
            wire: foreign,
            full: _active(
              scope: _scope(bike: 'other-bike'),
              step: step,
            ),
            short: short,
          ),
        ),
      );
      expect(find.text('Tam anlatım'), findsOneWidget);
      expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
    },
  );

  testWidgets(
    'Missing wrong-context and each negative E4 reason cannot become a client permit',
    (tester) async {
      final raw = _wire();
      final inputs = <Object?>[
        null,
        {'reason': 'ALLOW'},
        {...raw, 'physicalProgression': true},
        for (final reason in OfflineSafetyStatus.reasons)
          {...raw, 'reason': reason},
        for (final key in OfflineSafetyStatus.contextKeys)
          {
            ...raw,
            'context': {
              ...Map<String, dynamic>.from(raw['context'] as Map),
              key: 'foreign',
            },
          },
      ];
      var calls = 0;
      for (final wire in inputs) {
        await tester.pumpWidget(
          _app(
            _view(
              wire: wire,
              full: _active(step: _step(), reported: (_) => calls++),
            ),
          ),
        );
        await _tap(tester, 'Kontrolü tamamladım');
        await _tap(tester, 'Kısa anlatımı aç');
        await _tap(tester, 'Kontrolü tamamladım');
        expect(calls, 0);
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        expect(tester.takeException(), isNull);
      }
    },
  );

  testWidgets(
    'Busy error no handler and original held or mismatched state stay truthful',
    (tester) async {
      var reports = 0;
      final steps = [
        _step(),
        _step(state: ExecutionDisplayState.held),
        _step(state: ExecutionDisplayState.mismatch),
        null,
        _step(visual: false),
        _step(checks: []),
      ];
      for (final step in steps) {
        for (final condition in ['busy', 'error', 'no-handler']) {
          final full = _active(
            step: step,
            busy: condition == 'busy',
            error: condition == 'error' ? 'Örnek işlem gönderilemedi' : null,
            reported: condition == 'no-handler' ? null : (_) => reports++,
          );
          await tester.pumpWidget(_app(_view(wire: _wire(), full: full)));
          expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
          if (step != null && step.state != ExecutionDisplayState.active) {
            expect(
              tester
                  .widget<ActiveStepView>(find.byType(ActiveStepView))
                  .step!
                  .state,
              step.state,
            );
          }
          if (condition != 'no-handler') {
            expect(
              find.textContaining('yeni adım bildirimi gönderilemez'),
              findsOneWidget,
            );
          }
          await _tap(tester, 'Kontrolü tamamladım');
          expect(reports, 0);
          expect(tester.takeException(), isNull);
        }
      }
    },
  );

  testWidgets(
    'Keyboard full short switches preserve a live fixed warning and closed report',
    (tester) async {
      final handle = tester.ensureSemantics();
      try {
        await tester.pumpWidget(_app(_view(wire: _wire())));
        final bandText = find.text(
          'Güvenlik belirsizliği var. İlerleme kapalı.',
        );
        expect(
          tester
              .getSemantics(bandText)
              .getSemanticsData()
              .flagsCollection
              .isLiveRegion,
          isTrue,
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();
        expect(find.text('Kısa anlatım'), findsOneWidget);
        expect(
          tester
              .getSize(
                find
                    .ancestor(
                      of: find.text('Tam anlatıma dön'),
                      matching: find.byType(GestureDetector),
                    )
                    .first,
              )
              .height,
          greaterThanOrEqualTo(52),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();
        expect(find.text('Tam anlatım'), findsOneWidget);
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        expect(bandText, findsOneWidget);
        expect(tester.takeException(), isNull);
      } finally {
        handle.dispose();
      }
    },
  );

  testWidgets(
    'Full short long Turkish and held cases scroll at three widths and three text scales',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPhysicalSize);
      for (final width in [320.0, 390.0, 768.0]) {
        tester.view.physicalSize = Size(width, 844);
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final kind in ['normal', 'missing', 'unknown', 'long']) {
            for (final short in [false, true]) {
              final step = kind == 'missing'
                  ? null
                  : _step(
                      state: kind == 'long'
                          ? ExecutionDisplayState.held
                          : ExecutionDisplayState.active,
                      holdReason: kind == 'long'
                          ? 'Bu uzun bekleme açıklaması bir örnektir. Güncel güvenlik bilgisi doğrulanmadığı için uygulama kapalı; yeniden kontrol gerekir. ' *
                                6
                          : 'Güncel kaynak, uygunluk veya zorunlu güvenlik koşulu doğrulanmadı.',
                    );
              await tester.pumpWidget(
                _app(
                  _view(
                    wire: kind == 'unknown' ? null : _wire(),
                    full: _active(step: step),
                  ),
                  scale: scale,
                ),
              );
              if (short && step != null) await _tap(tester, 'Kısa anlatımı aç');
              final initial = tester.getRect(
                find.byKey(const ValueKey('uncertainty-band')),
              );
              final pos = _position(tester);
              for (
                var offset = 0.0;
                offset < pos.maxScrollExtent;
                offset += 450
              ) {
                pos.jumpTo(offset);
                await tester.pump();
                expect(
                  tester.getRect(
                    find.byKey(const ValueKey('uncertainty-band')),
                  ),
                  initial,
                );
                expect(
                  tester.takeException(),
                  isNull,
                  reason: '$width/$scale/$kind/$short',
                );
              }
              pos.jumpTo(pos.maxScrollExtent);
              await tester.pump();
              expect(
                tester.getRect(find.byKey(const ValueKey('uncertainty-band'))),
                initial,
              );
              expect(initial.bottom < 844, isTrue);
              expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
              expect(tester.takeException(), isNull);
            }
          }
        }
      }
    },
  );
  final capture = Platform.environment['KAVRIVA_UNCERTAINTY_PREVIEW'];
  if (capture != null) {
    testWidgets(
      'Optional natural whole viewport capture with a fixed uncertainty band',
      (tester) async {
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = const Size(390, 844);
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.view.resetPhysicalSize);
        final fontPath = Platform.environment['KAVRIVA_UNCERTAINTY_FONT']!;
        final fontBytes = await tester.runAsync(
          () => File(fontPath).readAsBytes(),
        );
        final loader = FontLoader('KavrivaUncertaintyPreview')
          ..addFont(Future.value(fontBytes!.buffer.asByteData()));
        await loader.load();
        final raw = _wire();
        Object status(String reason) => {...raw, 'reason': reason};
        ActiveStepView full(
          ActiveStepPresentation? step, {
          bool busy = false,
          String? error,
          bool handlers = true,
        }) => _active(
          step: step,
          busy: busy,
          error: error,
          reported: handlers ? (_) {} : null,
          problem: handlers ? (_) {} : null,
          recheck: handlers ? (_) {} : null,
          close: handlers ? (_) {} : null,
          teaching: handlers ? (_) {} : null,
        );
        final long = _step(
          state: ExecutionDisplayState.held,
          holdReason:
              'Bu uzun bekleme açıklaması bir örnektir. Güncel güvenlik bilgisi doğrulanmadığı için uygulama kapalı; yeniden kontrol gerekir. ' *
              6,
        );
        final cases = [
          (
            name: 'full',
            full: full(_step()),
            wire: raw,
            select: false,
            scale: 1.0,
          ),
          (
            name: 'short',
            full: full(_step()),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'missing-reader',
            full: full(_step()),
            wire: null,
            select: false,
            scale: 1.0,
          ),
          (
            name: 'forged-allow',
            full: full(_step()),
            wire: {...raw, 'physicalProgression': true},
            select: false,
            scale: 1.0,
          ),
          (
            name: 'foreign-tuple',
            full: full(_step()),
            wire: {
              ...raw,
              'context': {
                ...Map<String, dynamic>.from(raw['context'] as Map),
                'motorcycleId': 'foreign',
              },
            },
            select: false,
            scale: 1.0,
          ),
          (
            name: 'cached-restriction',
            full: full(_step()),
            wire: status('BLOCKED_CACHED_NEGATIVE_RESTRICTION'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'cached-generation',
            full: full(_step()),
            wire: status('BLOCKED_CACHED_NEGATIVE_GENERATION'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'untrusted-package',
            full: full(_step()),
            wire: status('HELD_UNTRUSTED_OFFLINE_CONTEXT'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'stale-dependency',
            full: full(_step()),
            wire: status('HELD_UNCERTAIN_RISK_DEPENDENCY'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'unknown-risk',
            full: full(_step()),
            wire: status('HELD_UNCLASSIFIED_RISK'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'reader-error',
            full: full(_step()),
            wire: status('HELD_OFFLINE_SAFETY_READER_FAILED'),
            select: true,
            scale: 1.0,
          ),
          (
            name: 'missing-step',
            full: full(null),
            wire: raw,
            select: false,
            scale: 1.0,
          ),
          (
            name: 'original-held',
            full: full(_step(state: ExecutionDisplayState.held)),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'missing-safety',
            full: full(_step(checks: [])),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'missing-visual',
            full: full(_step(visual: false)),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'busy-short',
            full: full(_step(), busy: true),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'error-short',
            full: full(_step(), error: 'Örnek işlem gönderilemedi'),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'no-handler',
            full: full(_step(), handlers: false),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'long-full',
            full: full(long),
            wire: raw,
            select: false,
            scale: 1.0,
          ),
          (
            name: 'long-short',
            full: full(long),
            wire: raw,
            select: true,
            scale: 1.0,
          ),
          (
            name: 'large-full',
            full: full(long),
            wire: raw,
            select: false,
            scale: 3.0,
          ),
          (
            name: 'large-short',
            full: full(long),
            wire: raw,
            select: true,
            scale: 3.0,
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
                  child: _view(wire: item.wire, full: item.full),
                ),
              ),
              font: 'KavrivaUncertaintyPreview',
              scale: item.scale,
            ),
          );
          await tester.pumpAndSettle();
          if (item.select) await _tap(tester, 'Kısa anlatımı aç');
          final pos = _position(tester);
          pos.jumpTo(0);
          await tester.pump();
          final band = tester.getRect(
            find.byKey(const ValueKey('uncertainty-band')),
          );
          var index = 0;
          while (true) {
            final file =
                capture + '-' + item.name + '-' + index.toString() + '.png';
            final offset = pos.pixels, extent = pos.maxScrollExtent;
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
            final now = tester.getRect(
              find.byKey(const ValueKey('uncertainty-band')),
            );
            expect(now, band);
            expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
            entries.add({
              'case': item.name,
              'file': file,
              'index': index,
              'offset': offset,
              'maxScrollExtent': extent,
              'width': 390,
              'height': 844,
              'scale': item.scale,
              'selectedShort': item.select,
              'bandTop': now.top,
              'bandBottom': now.bottom,
            });
            expect(tester.takeException(), isNull);
            if (offset >= extent) break;
            pos.jumpTo((offset + 600).clamp(0, extent));
            await tester.pump();
            index++;
          }
        }
        await tester.runAsync(
          () => File('$capture-manifest.json').writeAsString(
            jsonEncode({
              'method': 'natural full-scroll 390x844; fixed uncertainty band; Roboto; example only',
              'entries': entries,
            }),
          ),
        );
      },
    );
  }
}
