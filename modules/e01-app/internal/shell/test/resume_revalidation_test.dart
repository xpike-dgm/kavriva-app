import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/active_execution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/resume_revalidation.dart';
import 'package:kavriva_shell/variant_resolution.dart';

const _interrupt = 'interruption-new';
const _recheck = 'Yeniden kontrol iste';
const _resume = 'Güncel rehber adımını aç';
const _observe = 'Fotoğraf veya not ekleme yolunu aç';
const _close = 'Güvenli şekilde durdurma yolunu aç';
const _detail = 'Önceki bağlam ve kaynak ayrıntıları';
const _remap = 'Yeni rehbere eşleme yolunu aç';
const _checkLabel = 'Bu kontrolü yeniden iste';

ExecutionScope _scope({
  String bike = 'bike-a',
  String work = 'work-a',
  String guide = 'guide-a',
  String version = 'v2',
  String context = 'context-new',
  String evaluation = 'evaluation-new',
  String physical = 'physical-new',
}) => ExecutionScope(
  context: VariantContext(
    motorcycleId: bike,
    guideId: guide,
    contextRevision: context,
    motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
    guideLabel: 'Örnek bakım kontrolü',
  ),
  executionId: work,
  guideVersion: version,
  revision: evaluation,
  physicalRevision: physical,
);

InterruptedWorkSnapshot _saved({
  ExecutionScope? scope,
  List<String>? removed = const ['Örnek parça konumu kaydedilmiş'],
  bool missing = false,
}) => InterruptedWorkSnapshot(
  scope:
      scope ??
      _scope(
        context: 'context-old',
        evaluation: 'evaluation-old',
        physical: 'physical-old',
      ),
  savedAt: '2026-10-03',
  lastDefiniteStep: missing ? null : 'Örnek kesin adım 3 / 9',
  savedCurrentStep: missing ? null : 'Örnek kayıtlı adım 4 / 9',
  removedParts: removed,
  measurements: missing
      ? null
      : ['Örnek ölçüm notu; gerçek teknik değer değildir'],
  photosAndNotes: missing ? null : ['Örnek fotoğraf/not referansı'],
  safetyNotes: missing ? null : ['Örnek önceki güvenlik onayı'],
  preparationNotes: missing ? null : ['Örnek önceki hazırlık notu'],
);
ExecutionProof _proof(
  ExecutionProofKind kind, {
  ExecutionScope? scope,
  bool current = true,
  String? subject,
}) {
  final s = scope ?? _scope();
  return ExecutionProof(
    scope: s,
    kind: kind,
    subjectId: subject ?? s.executionId,
    evaluationId: 'proof-${kind.name}',
    source: 'Örnek yeniden değerlendirme kaynağı',
    version: 'kaynak-v2',
    location: 'Örnek kontrol bölümü',
    checkedAt: '2026-10-04',
    current: current,
  );
}

ResumeReference _ref(
  ExecutionProofKind kind, {
  String interruption = _interrupt,
  ExecutionScope? scope,
  bool current = true,
  String? subject,
  ResumeReferenceState state = ResumeReferenceState.confirmed,
}) => ResumeReference(
  interruptionId: interruption,
  proof: _proof(kind, scope: scope, current: current, subject: subject),
  state: state,
);
ResumeSafetyCheck _check({
  String interruption = _interrupt,
  ExecutionScope? scope,
  bool reviewed = true,
  bool verified = true,
  bool proof = true,
}) => ResumeSafetyCheck(
  interruptionId: interruption,
  check: ExecutionSafetyCheck(
    id: 'check-a',
    label: 'Örnek güncel çalışma alanı koşulu',
    risk: 'Bu koşul güncel olarak doğrulanmadan güvenli ilerleme sonucu kurulamaz.',
    prevention: 'Koşulu bu kesinti için güncel kaynakla açıkça kontrol ettir.',
    stopCondition: 'Koşul eksik veya belirsizse normal ilerleme durur.',
    verified: verified,
    explicitlyReviewed: reviewed,
    proof: proof
        ? _proof(
            ExecutionProofKind.safetyCheck,
            scope: scope,
            subject: 'check-a',
          )
        : null,
  ),
);
ResumeAssessment _assessment({
  ExecutionScope? scope,
  String interruption = _interrupt,
  Map<ExecutionProofKind, ResumeReference?> overrides = const {},
  List<ResumeSafetyCheck>? checks,
  bool changed = false,
  String reason = 'Normal devam yalnız güncel olumlu kaynak kararı ve bütün zorunlu kontrollerle açılır.',
}) {
  ResumeReference? ref(ExecutionProofKind kind) =>
      overrides.containsKey(kind) ? overrides[kind] : _ref(kind);
  return ResumeAssessment(
    scope: scope ?? _scope(),
    interruptionId: interruption,
    reason: reason,
    decision: ref(ExecutionProofKind.decision),
    physicalState: ref(ExecutionProofKind.content),
    fit: ref(ExecutionProofKind.fit),
    readiness: ref(ExecutionProofKind.readiness),
    materialGuideChange: changed,
    checks: checks ?? [_check()],
  );
}

Widget _view({
  ExecutionScope? scope,
  String interruption = _interrupt,
  InterruptedWorkSnapshot? saved,
  ResumeAssessment? assessment,
  bool busy = false,
  String? error,
  ValueChanged<ResumeRequest>? recheck,
  ValueChanged<ResumeRequest>? resume,
  ValueChanged<ResumeRequest>? observe,
  ValueChanged<ResumeRequest>? check,
  ValueChanged<ResumeRequest>? remap,
  ValueChanged<ResumeRequest>? close,
}) => ResumeRevalidationView(
  brand: const Text('Kavriva', style: TextStyle(fontWeight: FontWeight.w600)),
  scope: scope ?? _scope(),
  interruptionId: interruption,
  saved: saved,
  assessment: assessment,
  busy: busy,
  errorMessage: error,
  onCheckRequested: check,
  onObservationRequested: observe,
  onRevalidationRequested: recheck,
  onCurrentStepRequested: resume,
  onRemapRequested: remap,
  onSafeClosureRequested: close,
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

bool _enabled(WidgetTester t, String label) {
  final finder = find
      .ancestor(of: find.text(label), matching: find.byType(GestureDetector))
      .first;
  return t.widget<GestureDetector>(finder).onTap != null;
}

Future<void> _tap(WidgetTester t, String label) async {
  final f = find.text(label);
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pumpAndSettle();
}

void main() {
  test('Required IDs and histories are immutable; duplicate current check identity is rejected', () {
    expect(
      () => ResumeReference(
        interruptionId: ' ',
        proof: _proof(ExecutionProofKind.fit),
        state: ResumeReferenceState.unknown,
      ),
      throwsArgumentError,
    );
    expect(
      () => ResumeRequest(scope: _scope(), interruptionId: ''),
      throwsArgumentError,
    );
    expect(
      () => _assessment(checks: [_check(), _check()]),
      throwsArgumentError,
    );
    expect(() => _saved(removed: [' ']), throwsArgumentError);
    final input = ['note'];
    final saved = _saved(removed: input);
    input.clear();
    expect(saved.removedParts, ['note']);
    expect(() => saved.removedParts!.clear(), throwsUnsupportedError);
    expect(() => _assessment().checks.clear(), throwsUnsupportedError);
  });
  testWidgets(
    'Initial resume has no current confirmations; saved critical approval is history only and all requests carry new interruption',
    (t) async {
      final checks = <ResumeRequest>[];
      final resumes = <ResumeRequest>[];
      final s = _scope();
      await t.pumpWidget(
        _app(
          _view(
            scope: s,
            saved: _saved(),
            recheck: checks.add,
            resume: resumes.add,
          ),
        ),
      );
      expect(
        find.textContaining('Eski kritik onaylar otomatik geçerli değildir'),
        findsOneWidget,
      );
      expect(
        find.textContaining(
          'Mevcut fiziksel durum: Henüz olumlu olarak doğrulanmadı',
        ),
        findsOneWidget,
      );
      expect(_enabled(t, _resume), isFalse);
      await _tap(t, _resume);
      expect(resumes, isEmpty);
      expect(find.textContaining('Örnek önceki güvenlik onayı'), findsNothing);
      await _tap(t, _recheck);
      expect(checks.single.interruptionId, _interrupt);
      expect(identical(checks.single.scope, s), isTrue);
      expect(_enabled(t, _resume), isFalse);
      expect(find.text('Kaydedildi'), findsNothing);
      await _tap(t, _detail);
      expect(
        find.textContaining('Örnek önceki güvenlik onayı'),
        findsOneWidget,
      );
      expect(_enabled(t, _resume), isFalse);
    },
  );
  testWidgets(
    'Saved motorcycle guide step parts measurement media safety and preparation are preserved without becoming current proof',
    (t) async {
      await t.pumpWidget(_app(_view(saved: _saved())));
      await _tap(t, _detail);
      for (final text in [
        'Örnek kesin adım 3 / 9',
        'Örnek kayıtlı adım 4 / 9',
        'Örnek parça konumu kaydedilmiş',
        'Örnek ölçüm notu',
        'Örnek fotoğraf/not referansı',
        'Örnek önceki güvenlik onayı',
        'Örnek önceki hazırlık notu',
        'Kayıtlı rehber: Örnek bakım kontrolü · v2',
      ]) {
        expect(find.textContaining(text), findsOneWidget);
      }
      expect(_enabled(t, _resume), isFalse);
      await t.pumpWidget(
        _app(_view(saved: _saved(missing: true, removed: null))),
      );
      await _tap(t, _detail);
      expect(find.text('Son kesin adım: Bilinmiyor'), findsOneWidget);
      expect(
        find.text('Sökülen veya gevşetilen parçalar: Bilinmiyor'),
        findsOneWidget,
      );
      expect(find.text('Önceki hazırlık notları: Bilinmiyor'), findsOneWidget);
      expect(_enabled(t, _resume), isFalse);
    },
  );
  testWidgets(
    'Missing or foreign motorcycle/work history is hidden even if assessment claims ready; recheck uses current scope',
    (t) async {
      for (final saved in [
        null,
        _saved(scope: _scope(bike: 'foreign')),
        _saved(scope: _scope(work: 'foreign')),
      ]) {
        final sent = <ResumeRequest>[];
        final s = _scope();
        await t.pumpWidget(
          _app(
            _view(
              scope: s,
              saved: saved,
              assessment: _assessment(),
              recheck: sent.add,
              resume: (_) {},
            ),
          ),
        );
        expect(find.textContaining('Örnek kesin adım'), findsNothing);
        expect(find.text(_detail), findsNothing);
        expect(_enabled(t, _resume), isFalse);
        await _tap(t, _recheck);
        expect(identical(sent.single.scope, s), isTrue);
        expect(sent.single.interruptionId, _interrupt);
      }
    },
  );
  testWidgets(
    'Every current purpose needs current full-scope proof tied to this interruption; missing stale wrong-purpose and replay all block resume',
    (t) async {
      for (final kind in [
        ExecutionProofKind.decision,
        ExecutionProofKind.content,
        ExecutionProofKind.fit,
        ExecutionProofKind.readiness,
      ]) {
        for (final ref in [
          null,
          _ref(kind, current: false),
          _ref(kind, interruption: 'interruption-old'),
          _ref(kind, subject: 'other-work'),
          _ref(ExecutionProofKind.safeStop),
          _ref(kind, scope: _scope(physical: 'old')),
        ]) {
          await t.pumpWidget(
            _app(
              _view(
                saved: _saved(),
                assessment: _assessment(overrides: {kind: ref}),
                resume: (_) {},
              ),
            ),
          );
          expect(_enabled(t, _resume), isFalse);
        }
      }
    },
  );
  testWidgets(
    'Entire assessment scope and interruption replay rejected; old critical confirmations never transfer',
    (t) async {
      for (final a in [
        _assessment(interruption: 'interruption-old'),
        _assessment(scope: _scope(bike: 'foreign')),
        _assessment(scope: _scope(work: 'foreign')),
        _assessment(scope: _scope(context: 'old')),
        _assessment(scope: _scope(guide: 'foreign')),
        _assessment(scope: _scope(version: 'old')),
        _assessment(scope: _scope(evaluation: 'old')),
        _assessment(scope: _scope(physical: 'old')),
      ]) {
        await t.pumpWidget(
          _app(_view(saved: _saved(), assessment: a, resume: (_) {})),
        );
        expect(_enabled(t, _resume), isFalse);
        expect(find.textContaining('Zorunlu kontrol: Örnek'), findsNothing);
        expect(
          find.textContaining(
            'Mevcut fiziksel durum: Henüz olumlu olarak doğrulanmadı',
          ),
          findsOneWidget,
        );
      }
    },
  );
  testWidgets(
    'Mandatory checks require nonempty explicit current evidence for this interruption; check request is not confirmation',
    (t) async {
      for (final checks in <List<ResumeSafetyCheck>>[
        [],
        [_check(reviewed: false)],
        [_check(verified: false)],
        [_check(proof: false)],
        [_check(interruption: 'interruption-old')],
        [_check(scope: _scope(physical: 'old'))],
      ]) {
        final sent = <ResumeRequest>[];
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              assessment: _assessment(checks: checks),
              resume: (_) {},
              check: sent.add,
            ),
          ),
        );
        expect(_enabled(t, _resume), isFalse);
        if (checks.isNotEmpty) {
          expect(find.textContaining('Durma koşulu:'), findsOneWidget);
          await _tap(t, _checkLabel);
          expect(sent.single.checkId, 'check-a');
          expect(sent.single.interruptionId, _interrupt);
          expect(_enabled(t, _resume), isFalse);
        }
      }
    },
  );
  testWidgets(
    'Current but held or unknown provider outcome never opens resume; reason and safe retry remain',
    (t) async {
      for (final kind in [
        ExecutionProofKind.decision,
        ExecutionProofKind.content,
        ExecutionProofKind.fit,
        ExecutionProofKind.readiness,
      ]) {
        for (final state in [
          ResumeReferenceState.unknown,
          ResumeReferenceState.held,
        ]) {
          final sent = <ResumeRequest>[],
              rechecks = <ResumeRequest>[],
              closings = <ResumeRequest>[];
          await t.pumpWidget(
            _app(
              _view(
                saved: _saved(),
                assessment: _assessment(
                  overrides: {kind: _ref(kind, state: state)},
                  reason:
                      'Güncel ${kind.name} sonucu ${state.name}; olumlu yeniden başlama kararı yok.',
                ),
                resume: sent.add,
                recheck: rechecks.add,
                close: closings.add,
              ),
            ),
          );
          expect(
            _enabled(t, _resume),
            isFalse,
            reason:
                '${kind.name}/${state.name}: current source alone is not affirmative permission',
          );
          await _tap(t, _resume);
          expect(sent, isEmpty);
          expect(
            find.textContaining(
              'Güncel ${kind.name} sonucu ${state.name}; olumlu yeniden başlama kararı yok.',
            ),
            findsOneWidget,
          );
          await _tap(t, _recheck);
          expect(rechecks.single.interruptionId, _interrupt);
          await _tap(t, _close);
          expect(closings.single.interruptionId, _interrupt);
          expect(_enabled(t, _resume), isFalse);
        }
      }
    },
  );
  testWidgets(
    'Only current revalidated assessment opens current-step intent; never passes guessed prior step or completion',
    (t) async {
      final s = _scope();
      final sent = <ResumeRequest>[];
      await t.pumpWidget(
        _app(
          _view(
            scope: s,
            saved: _saved(),
            assessment: _assessment(),
            resume: sent.add,
          ),
        ),
      );
      expect(_enabled(t, _resume), isTrue);
      await _tap(t, _resume);
      expect(identical(sent.single.scope, s), isTrue);
      expect(sent.single.interruptionId, _interrupt);
      expect(sent.single.checkId, isNull);
      expect(find.text('Kaydedildi'), findsNothing);
      expect(find.text('İş tamamlandı'), findsNothing);
    },
  );
  testWidgets(
    'Changed guide identity/version or provider material change requires remap; history survives but old continuation stays closed',
    (t) async {
      for (final saved in [
        _saved(scope: _scope(version: 'v1')),
        _saved(scope: _scope(guide: 'guide-old')),
        _saved(),
      ]) {
        final sent = <ResumeRequest>[];
        final s = _scope();
        await t.pumpWidget(
          _app(
            _view(
              scope: s,
              saved: saved,
              assessment: _assessment(changed: true),
              resume: (_) {},
              remap: sent.add,
            ),
          ),
        );
        expect(find.textContaining('Rehber değişmiş'), findsOneWidget);
        expect(_enabled(t, _resume), isFalse);
        await _tap(t, _remap);
        expect(identical(sent.single.scope, s), isTrue);
        expect(sent.single.interruptionId, _interrupt);
        await _tap(t, _detail);
        expect(find.textContaining('Kayıtlı rehber:'), findsOneWidget);
        expect(_enabled(t, _resume), isFalse);
      }
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(scope: _scope(version: 'v1')),
            assessment: null,
            resume: (_) {},
            remap: (_) {},
          ),
        ),
      );
      expect(_enabled(t, _resume), isFalse);
      expect(_enabled(t, _remap), isTrue);
    },
  );
  testWidgets(
    'Busy error and absent handlers preserve safe closure; errors permit retry without opening normal progress',
    (t) async {
      var rechecks = 0, resumes = 0, observations = 0, closed = 0;
      Widget scene({bool busy = false, String? error}) => _view(
        saved: _saved(),
        assessment: _assessment(),
        busy: busy,
        error: error,
        recheck: (_) => rechecks++,
        resume: (_) => resumes++,
        observe: (_) => observations++,
        close: (_) => closed++,
      );
      await t.pumpWidget(_app(scene(busy: true)));
      for (final label in [_recheck, _resume, _observe]) {
        expect(_enabled(t, label), isFalse);
        await _tap(t, label);
      }
      await _tap(t, _close);
      expect(closed, 1);
      expect(rechecks + resumes + observations, 0);
      await t.pumpWidget(_app(scene(error: 'Örnek bağlantı hatası')));
      expect(_enabled(t, _resume), isFalse);
      await _tap(t, _recheck);
      expect(rechecks, 1);
      await _tap(t, _observe);
      expect(observations, 1);
      await _tap(t, _close);
      expect(closed, 2);
      expect(resumes, 0);
      await t.pumpWidget(
        _app(_view(saved: _saved(), assessment: _assessment())),
      );
      for (final label in [_recheck, _resume, _observe, _close])
        expect(_enabled(t, label), isFalse);
      expect(find.textContaining('gerçekleşmiş sayılmaz'), findsOneWidget);
    },
  );
  testWidgets(
    'Interruption scope or snapshot replacement resets historical expansion; no old intent escapes new context',
    (t) async {
      final saved = _saved();
      final a = _assessment();
      await t.pumpWidget(_app(_view(saved: saved, assessment: a)));
      await _tap(t, _detail);
      expect(
        find.textContaining('Örnek fotoğraf/not referansı'),
        findsOneWidget,
      );
      final sent = <ResumeRequest>[];
      await t.pumpWidget(
        _app(
          _view(
            saved: saved,
            assessment: a,
            interruption: 'another-interruption',
            recheck: sent.add,
            resume: (_) {},
          ),
        ),
      );
      expect(find.textContaining('Örnek fotoğraf/not referansı'), findsNothing);
      expect(_enabled(t, _resume), isFalse);
      await _tap(t, _recheck);
      expect(sent.single.interruptionId, 'another-interruption');
      await _tap(t, _detail);
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            assessment: a,
            interruption: 'another-interruption',
          ),
        ),
      );
      expect(find.textContaining('Örnek fotoğraf/not referansı'), findsNothing);
    },
  );
  testWidgets(
    'Real Tab Enter Space operate current focused observation and recheck; disabled normal resume has correct semantics',
    (t) async {
      var observed = 0, rechecked = 0;
      final handle = t.ensureSemantics();
      try {
        await t.pumpWidget(
          _app(
            _view(
              saved: null,
              observe: (_) => observed++,
              recheck: (_) => rechecked++,
            ),
          ),
        );
        await t.ensureVisible(find.text(_resume));
        await t.pumpAndSettle();
        expect(
          t.getSemantics(find.text(_resume)),
          matchesSemantics(
            hasEnabledState: true,
            isEnabled: false,
            isButton: true,
            label: _resume,
          ),
        );
        t
            .state<ScrollableState>(find.byType(Scrollable).first)
            .position
            .jumpTo(0);
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.enter);
        await t.pumpAndSettle();
        expect(observed, 1);
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.space);
        await t.pumpAndSettle();
        expect(rechecked, 1);
      } finally {
        handle.dispose();
      }
    },
  );
  testWidgets(
    'All resume states scroll at 320/390/768 and scale 1/2/3; all real targets are at least52 and safety is visible before details',
    (t) async {
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.resetDevicePixelRatio);
      addTearDown(t.view.resetPhysicalSize);
      for (final width in [320.0, 390.0, 768.0])
        for (final scale in [1.0, 2.0, 3.0])
          for (final a in [
            null,
            _assessment(),
            _assessment(checks: [_check(proof: false)]),
            _assessment(changed: true),
          ]) {
            t.view.physicalSize = Size(width, 844);
            await t.pumpWidget(
              _app(
                _view(
                  saved: _saved(),
                  assessment: a,
                  recheck: (_) {},
                  resume: (_) {},
                  observe: (_) {},
                  close: (_) {},
                  check: (_) {},
                  remap: (_) {},
                ),
                scale: scale,
              ),
            );
            await t.pumpAndSettle();
            for (final label in [
              _observe,
              _recheck,
              _resume,
              _close,
              _detail,
              if (a?.materialGuideChange ?? false) _remap,
              if (a != null &&
                  a.checks.any((c) => !c.matches(_scope(), _interrupt)))
                _checkLabel,
            ]) {
              final f = find.text(label);
              await t.ensureVisible(f);
              await t.pumpAndSettle();
              final target = find
                  .ancestor(of: f, matching: find.byType(GestureDetector))
                  .first;
              expect(t.getSize(target).height, greaterThanOrEqualTo(52));
              expect(t.takeException(), isNull);
            }
            if (a != null)
              expect(find.textContaining('Durma koşulu:'), findsOneWidget);
            expect(
              find.textContaining('Örnek önceki güvenlik onayı'),
              findsNothing,
            );
          }
    },
  );
  testWidgets(
    'Actual painted text and keyboard focus contrast; stop status has live region',
    (t) async {
      await t.pumpWidget(
        _app(_view(saved: _saved(), recheck: (_) {}, observe: (_) {})),
      );
      final primary = find.text(_recheck);
      await t.ensureVisible(primary);
      await t.pump();
      BoxDecoration decoration(Finder f) =>
          t
                  .widget<Container>(
                    find
                        .ancestor(of: f, matching: find.byType(Container))
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      double contrast(Color a, Color b) {
        final x = a.computeLuminance(), y = b.computeLuminance();
        return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
      }

      final text = t.renderObject<RenderParagraph>(primary).text as TextSpan;
      final body =
          t
                  .renderObject<RenderParagraph>(
                    find.text('Devam etmeden önce yeniden kontrol'),
                  )
                  .text
              as TextSpan;
      final canvas = t
          .widget<ColoredBox>(
            find.ancestor(of: primary, matching: find.byType(ColoredBox)).first,
          )
          .color;
      final background = decoration(primary).color!;
      expect(
        contrast(text.style!.color!, background),
        greaterThanOrEqualTo(4.5),
      );
      expect(contrast(body.style!.color!, canvas), greaterThanOrEqualTo(4.5));
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      final secondaryBorder = decoration(find.text(_observe)).border! as Border;
      expect(secondaryBorder.top.width, 3);
      expect(
        contrast(secondaryBorder.top.color, canvas),
        greaterThanOrEqualTo(3),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      final primaryBorder = decoration(primary).border! as Border;
      expect(primaryBorder.top.width, 3);
      expect(
        contrast(primaryBorder.top.color, background),
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
  testWidgets(
    'Ready outcome has clear next action; actual focused current-step text and border contrast and Enter intent',
    (t) async {
      final scope = _scope(), sent = <ResumeRequest>[];
      await t.pumpWidget(
        _app(
          _view(
            scope: scope,
            saved: _saved(),
            assessment: _assessment(),
            observe: (_) {},
            recheck: (_) {},
            resume: sent.add,
          ),
        ),
      );
      expect(find.text('Güncel kontroller doğrulandı'), findsOneWidget);
      expect(find.text('Devam etmeden önce yeniden kontrol'), findsNothing);
      expect(
        find.textContaining(
          'yarım kalan işte nerede kaldığını hatırlaman için korunur',
        ),
        findsOneWidget,
      );
      final f = find.text(_resume);
      await t.ensureVisible(f);
      await t.pump();
      final paragraph = t.renderObject<RenderParagraph>(f).text as TextSpan;
      BoxDecoration decoration() =>
          t
                  .widget<Container>(
                    find
                        .ancestor(of: f, matching: find.byType(Container))
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      double contrast(Color a, Color b) {
        final x = a.computeLuminance(), y = b.computeLuminance();
        return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
      }

      final background = decoration().color!;
      expect(
        contrast(paragraph.style!.color!, background),
        greaterThanOrEqualTo(4.5),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      final border = decoration().border! as Border;
      expect(border.top.width, 3);
      expect(contrast(border.top.color, background), greaterThanOrEqualTo(3));
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(identical(sent.single.scope, scope), isTrue);
      expect(sent.single.interruptionId, _interrupt);
      expect(find.text('İş tamamlandı'), findsNothing);
    },
  );
  final capture = Platform.environment['KAVRIVA_RESUME_PREVIEW'];
  if (capture != null)
    testWidgets('Capture actual full held ready and changed resume views', (
      t,
    ) async {
      final fontFile = Platform.environment['KAVRIVA_RESUME_FONT'];
      String? font;
      if (fontFile != null) {
        font = 'ResumePreview';
        await t.runAsync(() async {
          final bytes = await File(fontFile).readAsBytes();
          final loader = FontLoader(font!)
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
      }
      t.view.physicalSize = const Size(390, 844);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      for (final entry in {
        'held': null,
        'provider-held': _assessment(
          overrides: {
            ExecutionProofKind.fit: _ref(
              ExecutionProofKind.fit,
              state: ResumeReferenceState.held,
            ),
          },
          reason: 'Bu motosiklet için güncel uygunluk sonucu ilerlemeyi durduruyor. Uygunluğu yeniden kontrol ettirmeden rehber adımına geçme.',
        ),
        'provider-unknown': _assessment(
          overrides: {
            ExecutionProofKind.content: _ref(
              ExecutionProofKind.content,
              state: ResumeReferenceState.unknown,
            ),
          },
          reason: 'Motosikletin şu anki fiziksel durumu doğrulanamadı. Güncel durum kontrolü istenmeden kayıtlı adımdan devam etme.',
        ),
        'pending': _assessment(checks: [_check(proof: false)]),
        'ready': _assessment(),
        'changed': _assessment(changed: true),
        'history': null,
      }.entries) {
        final key = GlobalKey();
        await t.pumpWidget(
          _app(
            RepaintBoundary(
              key: key,
              child: ColoredBox(
                color: const Color(0xFFF8FAFC),
                child: _view(
                  saved: _saved(),
                  assessment: entry.value,
                  check: (_) {},
                  observe: (_) {},
                  recheck: (_) {},
                  resume: (_) {},
                  remap: (_) {},
                  close: (_) {},
                ),
              ),
            ),
            font: font,
          ),
        );
        await t.pumpAndSettle();
        final position = t
            .state<ScrollableState>(find.byType(Scrollable).first)
            .position;
        if (entry.key == 'history') {
          await _tap(t, _detail);
          position.jumpTo(0);
          await t.pumpAndSettle();
        }
        var index = 0;
        while (true) {
          final boundary =
              key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
          await t.runAsync(() async {
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
          await t.pump();
        }
      }
    });
}
