import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/active_execution.dart';
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
    motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
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
  int number = 4,
  int count = 9,
}) {
  ExecutionProof? p(ExecutionProofKind kind) =>
      overrides.containsKey(kind) ? overrides[kind] : _proof(kind);
  return ActiveStepPresentation(
    scope: scope ?? _scope(),
    stepId: 'step-a',
    title: title,
    instruction: 'İşaretli örnek konuma ait kontrol sonucunu bildir.',
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

RecoveryPresentation _recovery({
  ExecutionScope? scope,
  bool proof = true,
  ExecutionProof? reference,
}) => RecoveryPresentation(
  scope: scope ?? _scope(),
  stepId: 'step-a',
  reason: 'Örnek zorunlu kontrol sonucu uyumsuz.',
  remediation: 'Güncel koşul ve gözlem bilgisiyle yeniden değerlendirme iste.',
  observationHint: 'Gördüğün uyumsuzluğu açıklayan fotoğraf veya not isteğini kullanabilirsin.',
  safetyGuidance: 'Bu örnek durum netleşmeden normal adıma devam etme.',
  proof: proof ? reference ?? _proof(ExecutionProofKind.content) : null,
);
OutcomePresentation _result({
  ExecutionScope? scope,
  bool complete = true,
  bool safe = true,
  ExecutionProof? completion,
  ExecutionProof? safeStop,
  List<ExecutionSafetyCheck>? checks,
}) => OutcomePresentation(
  scope: scope ?? _scope(),
  completion: complete
      ? completion ?? _proof(ExecutionProofKind.completion)
      : null,
  safeStop: safe ? safeStop ?? _proof(ExecutionProofKind.safeStop) : null,
  finalChecks: checks ?? [_check()],
);
Widget _active({
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
Widget _recover({
  ExecutionScope? scope,
  RecoveryPresentation? result,
  bool busy = false,
  String? error,
  ValueChanged<ExecutionRequest>? observation,
  ValueChanged<ExecutionRequest>? recheck,
  ValueChanged<ExecutionRequest>? close,
}) => RecoveryView(
  brand: const Text('Kavriva', style: TextStyle(fontWeight: FontWeight.w600)),
  scope: scope ?? _scope(),
  recovery: result,
  busy: busy,
  errorMessage: error,
  onObservationRequested: observation,
  onRecheckRequested: recheck,
  onSafeClosureRequested: close,
);
Widget _outcome({
  ExecutionScope? scope,
  OutcomePresentation? result,
  bool busy = false,
  String? error,
  ValueChanged<OutcomeRequest>? record,
  ValueChanged<ExecutionRequest>? close,
  ValueChanged<ExecutionScope>? back,
}) => WorkOutcomeView(
  brand: const Text('Kavriva', style: TextStyle(fontWeight: FontWeight.w600)),
  scope: scope ?? _scope(),
  result: result,
  busy: busy,
  errorMessage: error,
  onRecordRequested: record,
  onSafeClosureRequested: close,
  onBackRequested: back,
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

const _completeLabel = 'Tamamlandı — zorunlu son kontroller doğrulandı';
const _partialLabel = 'Kısmen tamamlandı / sonuç doğrulanmadı';
const _safeLabel =
    'Güvenli şekilde durduruldu — güncel güvenlik kontrolü mevcut';
const _saveLabel = 'Belirttiğim sonucu kaydet';
const _closeLabel = 'Güvenli şekilde durdurma yolunu aç';

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
  test('Execution data rejects missing identities, invalid focus, duplicate checks and invalid step order', () {
    expect(() => _scope(work: ' '), throwsArgumentError);
    expect(() => _step(number: 0), throwsArgumentError);
    expect(() => _step(number: 10, count: 9), throwsArgumentError);
    expect(
      () => _visual(region: const Rect.fromLTWH(-.1, 0, .3, .3)),
      throwsArgumentError,
    );
    expect(() => _visual(region: Rect.zero), throwsArgumentError);
    expect(() => _step(checks: [_check(), _check()]), throwsArgumentError);
    expect(
      () => _proof(ExecutionProofKind.fit, subject: ''),
      throwsArgumentError,
    );
    final checks = [_check()];
    final s = _step(checks: checks);
    checks.clear();
    expect(s.safetyChecks.length, 1);
    expect(() => s.safetyChecks.clear(), throwsUnsupportedError);
  });
  testWidgets(
    'Current active step shows one focus and critical safety before collapsed detail; report is an immutable intent',
    (tester) async {
      final sent = <ExecutionRequest>[];
      final problems = <ExecutionRequest>[];
      await tester.pumpWidget(
        _app(
          _active(
            step: _step(),
            reported: sent.add,
            problem: problems.add,
            close: (_) {},
          ),
        ),
      );
      expect(find.byType(RawImage), findsOneWidget);
      expect(find.text('Kavriva'), findsOneWidget);
      expect(
        tester.getTopLeft(find.text('Kavriva')).dy,
        lessThan(tester.getTopLeft(find.text('Adım 4 / 9')).dy),
      );
      expect(find.text('İşaretli örnek bölgeye bak'), findsOneWidget);
      expect(find.textContaining('Durma koşulu:'), findsOneWidget);
      expect(find.textContaining('Kaynak:'), findsNothing);
      expect(find.text('Güncel durumu yeniden kontrol et'), findsNothing);
      await _tap(tester, 'Ayrıntılar');
      expect(find.textContaining('Kaynak:'), findsNWidgets(4));
      await _tap(tester, 'Ayrıntıları kapat');
      await _tap(tester, 'Kontrolü tamamladım');
      expect(sent.single.scope.matches(_scope()), isTrue);
      expect(sent.single.stepId, 'step-a');
      expect(sent.single.scope.physicalRevision, 'physical-r1');
      expect(sent.single.scope.guideVersion, 'guide-v2');
      expect(find.text('Adım 4 / 9'), findsOneWidget);
      await _tap(tester, 'Sorun var');
      expect(problems.single.stepId, 'step-a');
      expect(sent.length, 1);
      expect(find.text('Adım 5 / 9'), findsNothing);
    },
  );
  testWidgets(
    'Bare active, missing or stale purpose/subject/context proof cannot open instructions or report',
    (tester) async {
      var calls = 0;
      for (final kind in [
        ExecutionProofKind.decision,
        ExecutionProofKind.fit,
        ExecutionProofKind.readiness,
        ExecutionProofKind.content,
        ExecutionProofKind.visual,
      ]) {
        for (final proof in <ExecutionProof?>[
          null,
          _proof(kind, current: false),
          _proof(kind, subject: 'other'),
          _proof(kind, scope: _scope(physical: 'old')),
          _proof(ExecutionProofKind.safeStop),
        ]) {
          final step = _step(overrides: {kind: proof});
          await tester.pumpWidget(
            _app(_active(step: step, reported: (_) => calls++, close: (_) {})),
          );
          expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
          expect(find.text(step.instruction), findsNothing);
          expect(find.byType(RawImage), findsNothing);
          await _tap(tester, 'Kontrolü tamamladım');
          await _tap(tester, 'Ayrıntılar');
          expect(find.text(step.detail), findsNothing);
          await _tap(tester, 'Ayrıntıları kapat');
        }
      }
      expect(calls, 0);
    },
  );
  testWidgets(
    'Missing visual, empty safety, saved/voice-only/foreign critical confirmation and explicit holds block progression',
    (tester) async {
      for (final step in [
        _step(visual: false),
        _step(checks: []),
        _step(checks: [_check(verified: false)]),
        _step(checks: [_check(reviewed: false)]),
        _step(checks: [_check(proof: false)]),
        _step(
          checks: [
            _check(
              reference: _proof(
                ExecutionProofKind.safetyCheck,
                scope: _scope(guideVersion: 'old'),
              ),
            ),
          ],
        ),
        _step(state: ExecutionDisplayState.held),
        _step(state: ExecutionDisplayState.mismatch),
      ]) {
        await tester.pumpWidget(_app(_active(step: step, reported: (_) {})));
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        expect(find.text(step.instruction), findsNothing);
        expect(find.textContaining('İlerleme kapalı:'), findsOneWidget);
      }
    },
  );
  testWidgets(
    'Foreign motorcycle, guide, context, work, version and physical state never leak instruction or visual; requests use current scope',
    (tester) async {
      for (final old in [
        _scope(bike: 'other'),
        _scope(guide: 'other'),
        _scope(contextRevision: 'old'),
        _scope(work: 'old'),
        _scope(guideVersion: 'old'),
        _scope(revision: 'old'),
        _scope(physical: 'old'),
      ]) {
        final sent = <ExecutionRequest>[];
        await tester.pumpWidget(
          _app(
            _active(
              step: _step(scope: old, title: 'FOREIGN'),
              recheck: sent.add,
            ),
          ),
        );
        expect(find.text('FOREIGN'), findsNothing);
        expect(find.byType(RawImage), findsNothing);
        expect(find.textContaining('Zorunlu güvenlik:'), findsNothing);
        await _tap(tester, 'Güncel durumu yeniden kontrol et');
        expect(sent.single.scope.matches(_scope()), isTrue);
        expect(sent.single.stepId, isNull);
      }
    },
  );
  testWidgets(
    'Busy/error and absent handler block step report; safe information remains reachable',
    (tester) async {
      var calls = 0, safety = 0;
      for (final view in [
        _active(
          step: _step(),
          busy: true,
          reported: (_) => calls++,
          close: (_) => safety++,
        ),
        _active(
          step: _step(),
          error: 'Örnek hata',
          reported: (_) => calls++,
          close: (_) => safety++,
        ),
        _active(step: _step(), close: (_) => safety++),
      ]) {
        await tester.pumpWidget(_app(view));
        expect(_enabled(tester, 'Kontrolü tamamladım'), isFalse);
        await _tap(tester, 'Kontrolü tamamladım');
        await _tap(tester, _closeLabel);
      }
      expect(calls, 0);
      expect(safety, 3);
      await tester.pumpWidget(
        _app(_active(step: _step(), reported: (_) => calls++)),
      );
      await _tap(tester, 'Kontrolü tamamladım');
      expect(calls, 1);
    },
  );
  testWidgets(
    'Recovery observation and recheck never create normal progression; safe closure is independent',
    (tester) async {
      final observed = <ExecutionRequest>[],
          checked = <ExecutionRequest>[],
          closed = <ExecutionRequest>[];
      await tester.pumpWidget(
        _app(
          _recover(
            result: _recovery(),
            observation: observed.add,
            recheck: checked.add,
            close: closed.add,
          ),
        ),
      );
      expect(find.text('Sorun var — ilerleme durdu'), findsOneWidget);
      expect(find.text('Kontrolü tamamladım'), findsNothing);
      await _tap(tester, 'Fotoğraf veya not ekleme yolunu aç');
      await _tap(tester, 'Durumu yeniden kontrol et');
      await _tap(tester, _closeLabel);
      expect(observed.single.scope.matches(_scope()), isTrue);
      expect(checked.single.stepId, 'step-a');
      expect(closed.single.scope.matches(_scope()), isTrue);
      expect(find.text('Sorun var — ilerleme durdu'), findsOneWidget);
      await tester.pumpWidget(
        _app(
          _recover(
            result: _recovery(),
            busy: true,
            recheck: checked.add,
            close: closed.add,
          ),
        ),
      );
      await _tap(tester, 'Durumu yeniden kontrol et');
      await _tap(tester, _closeLabel);
      expect(checked.length, 1);
      expect(closed.length, 2);
    },
  );
  testWidgets(
    'Old/missing recovery safety instructions are hidden and foreign recovery does not supply an old step identity',
    (tester) async {
      for (final r in <RecoveryPresentation?>[
        null,
        _recovery(scope: _scope(bike: 'other')),
        _recovery(
          reference: _proof(ExecutionProofKind.content, current: false),
        ),
      ]) {
        final sent = <ExecutionRequest>[];
        await tester.pumpWidget(_app(_recover(result: r, recheck: sent.add)));
        expect(
          find.text('Bu örnek durum netleşmeden normal adıma devam etme.'),
          findsNothing,
        );
        await _tap(tester, 'Durumu yeniden kontrol et');
        expect(sent.single.scope.matches(_scope()), isTrue);
        if (r == null || !r.scope.matches(_scope()))
          expect(sent.single.stepId, isNull);
      }
    },
  );
  testWidgets(
    'No default success; partial and safely stopped record distinct immutable outcomes without completion or saved state',
    (tester) async {
      final sent = <OutcomeRequest>[];
      await tester.pumpWidget(
        _app(_outcome(result: _result(), record: sent.add)),
      );
      expect(_enabled(tester, _saveLabel), isFalse);
      await _tap(tester, _partialLabel);
      await _tap(tester, _saveLabel);
      expect(sent.single.outcome, WorkOutcome.partialUnresolved);
      expect(sent.single.scope.matches(_scope()), isTrue);
      expect(find.text('Kaydedildi'), findsNothing);
      await _tap(tester, _safeLabel);
      await _tap(tester, _saveLabel);
      expect(sent.last.outcome, WorkOutcome.safelyStopped);
      await _tap(tester, _completeLabel);
      await _tap(tester, _saveLabel);
      expect(sent.last.outcome, WorkOutcome.completed);
      expect(sent.length, 3);
      expect(find.text('Kaydedildi'), findsNothing);
    },
  );
  testWidgets(
    'Missing/stale/foreign/wrong-purpose completion or mandatory final check keeps complete closed, partial available',
    (tester) async {
      for (final r in [
        _result(complete: false),
        _result(checks: []),
        _result(checks: [_check(reviewed: false)]),
        _result(checks: [_check(proof: false)]),
        _result(
          completion: _proof(ExecutionProofKind.completion, current: false),
        ),
        _result(
          completion: _proof(
            ExecutionProofKind.completion,
            scope: _scope(physical: 'old'),
          ),
        ),
        _result(completion: _proof(ExecutionProofKind.safeStop)),
      ]) {
        final sent = <OutcomeRequest>[];
        await tester.pumpWidget(_app(_outcome(result: r, record: sent.add)));
        expect(_enabled(tester, _completeLabel), isFalse);
        await _tap(tester, _completeLabel);
        expect(_enabled(tester, _saveLabel), isFalse);
        await _tap(tester, _partialLabel);
        await _tap(tester, _saveLabel);
        expect(sent.single.outcome, WorkOutcome.partialUnresolved);
      }
    },
  );
  testWidgets(
    'Absent or foreign outcome permits only a current-scope unresolved user report, never verified success or safe stop',
    (tester) async {
      final current = _scope();
      for (final result in <OutcomePresentation?>[
        null,
        _result(scope: _scope(bike: 'other-bike')),
        _result(scope: _scope(work: 'other-work')),
        _result(scope: _scope(guideVersion: 'old-guide')),
        _result(scope: _scope(revision: 'old-evaluation')),
        _result(scope: _scope(physical: 'old-physical')),
      ]) {
        final sent = <OutcomeRequest>[];
        final closed = <ExecutionRequest>[];
        await tester.pumpWidget(
          _app(
            _outcome(
              scope: current,
              result: result,
              record: sent.add,
              close: closed.add,
            ),
          ),
        );
        expect(_enabled(tester, _saveLabel), isFalse);
        expect(_enabled(tester, _completeLabel), isFalse);
        expect(_enabled(tester, _safeLabel), isFalse);
        expect(_enabled(tester, _partialLabel), isTrue);
        await _tap(tester, _completeLabel);
        await _tap(tester, _safeLabel);
        expect(_enabled(tester, _saveLabel), isFalse);
        await _tap(tester, _partialLabel);
        await _tap(tester, _saveLabel);
        expect(sent.single.outcome, WorkOutcome.partialUnresolved);
        expect(identical(sent.single.scope, current), isTrue);
        expect(find.text('Kaydedildi'), findsNothing);
        expect(find.textContaining('Son kontrol:'), findsNothing);
        await _tap(tester, _closeLabel);
        expect(identical(closed.single.scope, current), isTrue);
        expect(closed.single.stepId, isNull);
        expect(sent.length, 1);
      }
    },
  );
  testWidgets(
    'Unverified safe stop stays distinct from freely accessible safe closure request and unresolved record',
    (tester) async {
      final closed = <ExecutionRequest>[];
      final sent = <OutcomeRequest>[];
      await tester.pumpWidget(
        _app(
          _outcome(
            result: _result(safe: false, complete: false),
            record: sent.add,
            close: closed.add,
          ),
        ),
      );
      expect(_enabled(tester, _safeLabel), isFalse);
      await _tap(tester, _safeLabel);
      expect(_enabled(tester, _saveLabel), isFalse);
      await _tap(tester, _closeLabel);
      expect(closed.single.scope.matches(_scope()), isTrue);
      expect(sent, isEmpty);
      await _tap(tester, _partialLabel);
      await _tap(tester, _saveLabel);
      expect(sent.single.outcome, WorkOutcome.partialUnresolved);
      expect(
        find.textContaining('ödeme veya tamamlandı seçimi gerekmez'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Scope/result replacement clears selected outcome and expanded details; stale parent state cannot be submitted',
    (tester) async {
      final first = _result();
      final sent = <OutcomeRequest>[];
      await tester.pumpWidget(_app(_outcome(result: first, record: sent.add)));
      await _tap(tester, _completeLabel);
      await tester.pumpWidget(
        _app(
          _outcome(
            scope: _scope(physical: 'new'),
            result: first,
            record: sent.add,
          ),
        ),
      );
      expect(_enabled(tester, _saveLabel), isFalse);
      await _tap(tester, _saveLabel);
      expect(sent, isEmpty);
      final step = _step();
      await tester.pumpWidget(_app(_active(step: step)));
      await _tap(tester, 'Ayrıntılar');
      await tester.pumpWidget(
        _app(
          _active(
            scope: _scope(physical: 'new'),
            step: step,
          ),
        ),
      );
      expect(find.textContaining('Kaynak:'), findsNothing);
      expect(find.text(step.detail), findsNothing);
    },
  );
  testWidgets(
    'Busy/error and absent record handler cannot claim saved; read-only closure and back still work',
    (tester) async {
      var record = 0, close = 0, back = 0;
      final result = _result();
      await tester.pumpWidget(
        _app(_outcome(result: result, record: (_) => record++)),
      );
      await _tap(tester, _partialLabel);
      await tester.pumpWidget(
        _app(
          _outcome(
            result: result,
            busy: true,
            record: (_) => record++,
            close: (_) => close++,
            back: (_) => back++,
          ),
        ),
      );
      await _tap(tester, _saveLabel);
      await _tap(tester, _closeLabel);
      await _tap(tester, 'Kaydetmeden geri dön');
      expect(record, 0);
      expect(close, 1);
      expect(back, 1);
      await tester.pumpWidget(
        _app(
          _outcome(
            result: result,
            error: 'Örnek hata',
            record: (_) => record++,
          ),
        ),
      );
      expect(_enabled(tester, _saveLabel), isFalse);
      expect(find.textContaining('Kaydedildi sayılmaz'), findsOneWidget);
      await tester.pumpWidget(_app(_outcome(result: result)));
      expect(_enabled(tester, _saveLabel), isFalse);
    },
  );
  testWidgets(
    'Actual Tab Enter Space use the focused detail and recovery intent; disabled report semantics are explicit',
    (tester) async {
      final semantics = tester.ensureSemantics();
      try {
        final sent = <ExecutionRequest>[];
        await tester.pumpWidget(
          _app(_active(step: _step(), reported: sent.add)),
        );
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();
        expect(find.text('Ayrıntıları kapat'), findsOneWidget);
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();
        expect(find.text('Ayrıntılar'), findsOneWidget);
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();
        expect(sent.length, 2);
        await tester.pumpWidget(
          _app(_active(step: _step(state: ExecutionDisplayState.held))),
        );
        final f = find.text('Kontrolü tamamladım');
        await tester.ensureVisible(f);
        await tester.pump();
        final node = tester.getSemantics(
          find.ancestor(of: f, matching: find.byType(Semantics)).first,
        );
        expect(
          node,
          matchesSemantics(
            isButton: true,
            hasEnabledState: true,
            isEnabled: false,
            label: 'Kontrolü tamamladım',
          ),
        );
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets(
    'Active recovery outcome and held states fully scroll across 320/390/768 with text scale 1/2/3 and controls at least 52',
    (tester) async {
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      for (final width in [320.0, 390.0, 768.0]) {
        tester.view.physicalSize = Size(width, 844);
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final view in [
            _active(step: _step(), reported: (_) {}, close: (_) {}),
            _active(
              step: _step(state: ExecutionDisplayState.held),
              close: (_) {},
            ),
            _recover(result: _recovery(), recheck: (_) {}, close: (_) {}),
            _outcome(
              result: _result(),
              record: (_) {},
              close: (_) {},
              back: (_) {},
            ),
          ]) {
            await tester.pumpWidget(_app(view, scale: scale));
            await tester.pump();
            final controls = find.byWidgetPredicate(
              (w) => w is Semantics && w.properties.button == true,
            );
            for (final element in controls.evaluate().toList()) {
              final f = find.byWidget(element.widget);
              await tester.ensureVisible(f);
              await tester.pump();
              expect(tester.getSize(f).height, greaterThanOrEqualTo(52));
            }
            final scroll = tester.state<ScrollableState>(
              find.byType(Scrollable).first,
            );
            scroll.position.jumpTo(scroll.position.maxScrollExtent);
            await tester.pump();
            expect(tester.takeException(), isNull);
          }
        }
      }
    },
  );
  testWidgets(
    'Painted primary text, focus and inherited body contrast meet thresholds; stop meanings have live regions',
    (tester) async {
      await tester.pumpWidget(_app(_active(step: _step(), reported: (_) {})));
      final f = find.text('Kontrolü tamamladım');
      await tester.ensureVisible(f);
      await tester.pump();
      final text = tester.renderObject<RenderParagraph>(f).text as TextSpan;
      final body =
          tester
                  .renderObject<RenderParagraph>(
                    find.text(
                      'Motosikletim: Örnek motosiklet · kullanıcı beyanı',
                    ),
                  )
                  .text
              as TextSpan;
      double contrast(Color a, Color b) {
        final x = a.computeLuminance(), y = b.computeLuminance();
        return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
      }

      BoxDecoration decoration(Finder text) =>
          tester
                  .widget<Container>(
                    find
                        .ancestor(of: text, matching: find.byType(Container))
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      final primaryBackground = decoration(f).color!;
      final canvas = tester
          .widget<ColoredBox>(
            find.ancestor(of: f, matching: find.byType(ColoredBox)).first,
          )
          .color;
      expect(
        contrast(text.style!.color!, primaryBackground),
        greaterThanOrEqualTo(4.5),
      );
      expect(contrast(body.style!.color!, canvas), greaterThanOrEqualTo(4.5));
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      final detail = find.text('Ayrıntılar');
      final detailBorder = decoration(detail).border! as Border;
      expect(detailBorder.top.width, 3);
      expect(contrast(detailBorder.top.color, canvas), greaterThanOrEqualTo(3));
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      final primaryBorder = decoration(f).border! as Border;
      expect(primaryBorder.top.width, 3);
      expect(
        contrast(primaryBorder.top.color, primaryBackground),
        greaterThanOrEqualTo(3),
      );
      expect(
        find.byWidgetPredicate(
          (w) => w is Semantics && w.properties.liveRegion == true,
        ),
        findsWidgets,
      );
    },
  );

  final capture = Platform.environment['KAVRIVA_EXECUTION_PREVIEW'];
  if (capture != null)
    testWidgets(
      'Capture actual complete active/recovery/closure Flutter views',
      (tester) async {
        final fontFile = Platform.environment['KAVRIVA_EXECUTION_FONT'];
        String? font;
        if (fontFile != null) {
          font = 'ExecutionPreview';
          await tester.runAsync(() async {
            final bytes = await File(fontFile).readAsBytes();
            final loader = FontLoader(font!)
              ..addFont(Future.value(ByteData.sublistView(bytes)));
            await loader.load();
          });
        }
        tester.view.physicalSize = const Size(390, 844);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final scenes = {
          'active': _active(
            step: _step(),
            reported: (_) {},
            problem: (_) {},
            close: (_) {},
            recheck: (_) {},
            teaching: (_) {},
          ),
          'recovery': _recover(
            result: _recovery(),
            observation: (_) {},
            recheck: (_) {},
            close: (_) {},
          ),
          'closure': _outcome(
            result: _result(),
            record: (_) {},
            close: (_) {},
            back: (_) {},
          ),
          'unverifiedClosure': _outcome(
            record: (_) {},
            close: (_) {},
            back: (_) {},
          ),
        };
        for (final entry in scenes.entries) {
          final key = GlobalKey();
          await tester.pumpWidget(
            _app(
              RepaintBoundary(
                key: key,
                child: ColoredBox(
                  color: const Color(0xFFF8FAFC),
                  child: entry.value,
                ),
              ),
              font: font,
            ),
          );
          await tester.pumpAndSettle();
          if (entry.key == 'closure' || entry.key == 'unverifiedClosure') {
            await _tap(
              tester,
              entry.key == 'closure' ? _safeLabel : _partialLabel,
            );
            final scroll = tester.state<ScrollableState>(
              find.byType(Scrollable).first,
            );
            scroll.position.jumpTo(0);
            await tester.pump();
          }
          final position = tester
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position;
          var index = 0;
          while (true) {
            final boundary =
                key.currentContext!.findRenderObject()!
                    as RenderRepaintBoundary;
            await tester.runAsync(() async {
              final image = await boundary.toImage(pixelRatio: 1);
              final bytes = await image.toByteData(
                format: ui.ImageByteFormat.png,
              );
              await File('$capture-${entry.key}-$index.png')
                  .writeAsBytes(bytes!.buffer.asUint8List());
              image.dispose();
            });
            index++;
            if (position.pixels >= position.maxScrollExtent) break;
            position.jumpTo(
              (position.pixels + 620).clamp(0, position.maxScrollExtent),
            );
            await tester.pump();
          }
        }
      },
    );
}
