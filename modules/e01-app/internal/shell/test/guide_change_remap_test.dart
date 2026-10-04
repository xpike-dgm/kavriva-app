import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/active_execution.dart';
import 'package:kavriva_shell/kavriva_shell.dart';
import 'package:kavriva_shell/resume_revalidation.dart'
    show InterruptedWorkSnapshot;
import 'package:kavriva_shell/guide_change_remap.dart';
import 'package:kavriva_shell/variant_resolution.dart';

const _change = 'guide-change-new';
const _map = 'Mevcut durumu yeniden eşle';
const _step = 'Yeni rehberdeki doğrulanmış adımı aç';
const _observe = 'Güncel fotoğraf veya not ekleme yolunu aç';
const _close = 'Güvenli şekilde durdurma yolunu aç';
const _detail = 'Önceki bağlam ve kaynak ayrıntıları';
const _target = 'provider-new-step';
ExecutionScope _scope({
  String bike = 'bike-a',
  String work = 'work-a',
  String guide = 'guide-a',
  String version = 'v3',
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
        version: 'v2',
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

ExecutionScope _oldScope() => _saved().scope;
GuideRemapEvidence _evidence({
  ExecutionScope? scope,
  ExecutionScope? old,
  String change = _change,
  GuideRemapPurpose purpose = GuideRemapPurpose.mapping,
  String subject = _target,
  bool current = true,
}) => GuideRemapEvidence(
  fromScope: old ?? _oldScope(),
  scope: scope ?? _scope(),
  changeId: change,
  purpose: purpose,
  subjectId: subject,
  source: 'Örnek rehber değerlendirme kaynağı',
  version: 'kaynak-v3',
  location: 'Örnek değişim ve kontrol bölümü',
  checkedAt: '2026-10-04',
  current: current,
);
GuideChangeNotice _notice({
  GuideRemapEvidence? evidence,
  List<String>? changes,
}) => GuideChangeNotice(
  evidence:
      evidence ??
      _evidence(purpose: GuideRemapPurpose.changeNotice, subject: _change),
  changes:
      changes ??
      [
        'Örnek rehberin sürümü değişti; eski adımın geçerliliği yeniden değerlendirilmeli.',
      ],
  importance: 'Önceki devam kararı yeni rehber sürümünü kapsamıyor.',
  safetyImpact: 'Yeni rehberdeki güncel güvenlik ve hazırlık koşulları yeniden kontrol edilmeli.',
  stopImpact: 'Güncel fiziksel durum eşlenmeden eski devam yolu kapalı kalır.',
);
RemapReference _ref(
  ExecutionProofKind kind, {
  RemapReferenceState state = RemapReferenceState.confirmed,
  String change = _change,
  ExecutionScope? scope,
  bool current = true,
  String? subject,
}) => RemapReference(
  changeId: change,
  state: state,
  proof: _proof(kind, scope: scope, current: current, subject: subject),
);
GuideMappingResult _mapping({
  GuideMappingState state = GuideMappingState.mapped,
  GuideRemapEvidence? evidence,
  bool missingProof = false,
  String? target = _target,
  String? label = 'Örnek güncel rehber kontrol adımı',
}) => GuideMappingResult(
  state: state,
  evidence: missingProof
      ? null
      : evidence ??
            _evidence(
              subject: state == GuideMappingState.unmappable
                  ? _scope().executionId
                  : target ?? _target,
            ),
  targetStepId: target,
  targetStepLabel: label,
);
GuideRemapSafetyCheck _check({
  String change = _change,
  ExecutionScope? scope,
  bool verified = true,
  bool reviewed = true,
  bool proof = true,
}) => GuideRemapSafetyCheck(
  changeId: change,
  check: ExecutionSafetyCheck(
    id: 'check-a',
    label: 'Örnek güncel çalışma alanı koşulu',
    risk: 'Güncel koşul doğrulanmadan fiziksel ilerleme sonucu kurulamaz.',
    prevention: 'Koşulu bu rehber değişimi için güncel kaynakla kontrol ettir.',
    stopCondition: 'Koşul eksik veya belirsizse normal devam durur.',
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
GuideRemapAssessment _assessment({
  ExecutionScope? scope,
  ExecutionScope? old,
  String change = _change,
  Map<ExecutionProofKind, RemapReference?> overrides = const {},
  GuideMappingResult? mapping,
  bool missingMapping = false,
  List<GuideRemapSafetyCheck>? checks,
  String reason = 'Güncel eşleme ve bütün zorunlu kontroller olumlu doğrulanmadan normal devam açılamaz.',
}) {
  RemapReference? ref(ExecutionProofKind kind) =>
      overrides.containsKey(kind) ? overrides[kind] : _ref(kind);
  return GuideRemapAssessment(
    fromScope: old ?? _oldScope(),
    scope: scope ?? _scope(),
    changeId: change,
    reason: reason,
    physicalState: ref(ExecutionProofKind.content),
    fit: ref(ExecutionProofKind.fit),
    readiness: ref(ExecutionProofKind.readiness),
    decision: ref(ExecutionProofKind.decision),
    mapping: missingMapping ? null : mapping ?? _mapping(),
    checks: checks ?? [_check()],
  );
}

Widget _view({
  ExecutionScope? scope,
  String change = _change,
  InterruptedWorkSnapshot? saved,
  GuideChangeNotice? notice,
  GuideRemapAssessment? assessment,
  bool busy = false,
  String? error,
  GuideRemapRequestError? requestError,
  ValueChanged<GuideRemapRequest>? map,
  ValueChanged<GuideRemapRequest>? step,
  ValueChanged<GuideRemapRequest>? observe,
  ValueChanged<GuideRemapRequest>? check,
  ValueChanged<GuideRemapRequest>? close,
}) => GuideChangeRemapView(
  brand: const Text('Kavriva', style: TextStyle(fontWeight: FontWeight.w600)),
  scope: scope ?? _scope(),
  changeId: change,
  saved: saved,
  notice: notice,
  assessment: assessment,
  busy: busy,
  error:
      requestError ??
      (error == null
          ? null
          : GuideRemapRequestError(
              scope: scope ?? _scope(),
              changeId: change,
              kind: GuideRemapRequestKind.mapping,
              message: error,
            )),
  onObservationRequested: observe,
  onMappingRequested: map,
  onCheckRequested: check,
  onCurrentStepRequested: step,
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
  test('Kimlikler ve kaynak açıklamaları zorunlu; listeler değişmez', () {
    expect(() => _evidence(change: ' '), throwsArgumentError);
    expect(() => _notice(changes: []), throwsArgumentError);
    expect(() => _notice(changes: [' ']), throwsArgumentError);
    expect(
      () => GuideRemapRequest(scope: _scope(), changeId: ''),
      throwsArgumentError,
    );
    expect(() => _mapping(target: ' '), throwsArgumentError);
    expect(
      () => GuideRemapRequestError(
        scope: _scope(),
        changeId: ' ',
        kind: GuideRemapRequestKind.mapping,
        message: 'Örnek hata',
      ),
      throwsArgumentError,
    );
    expect(
      () => GuideRemapRequestError(
        scope: _scope(),
        changeId: _change,
        kind: GuideRemapRequestKind.mapping,
        message: ' ',
      ),
      throwsArgumentError,
    );
    expect(
      () => _assessment(checks: [_check(), _check()]),
      throwsArgumentError,
    );
    final values = ['Örnek değişim'];
    final notice = _notice(changes: values);
    values.clear();
    expect(notice.changes, ['Örnek değişim']);
    expect(() => notice.changes.clear(), throwsUnsupportedError);
    expect(() => _assessment().checks.clear(), throwsUnsupportedError);
  });
  testWidgets('Başlangıçta kaynak yok; istek eşleme ve tamamlanma üretmez', (
    t,
  ) async {
    final sent = <GuideRemapRequest>[];
    final s = _scope();
    await t.pumpWidget(
      _app(
        _view(
          scope: s,
          saved: _saved(),
          map: sent.add,
          observe: sent.add,
          step: sent.add,
          close: sent.add,
        ),
      ),
    );
    expect(_enabled(t, _step), isFalse);
    expect(
      find.textContaining('değişimi ve etkisi henüz doğrulanmadı'),
      findsOneWidget,
    );
    for (final label in [_observe, _map, _close]) await _tap(t, label);
    expect(sent, hasLength(3));
    expect(
      sent.every(
        (r) =>
            identical(r.scope, s) &&
            r.changeId == _change &&
            r.targetStepId == null,
      ),
      isTrue,
    );
    expect(_enabled(t, _step), isFalse);
    expect(find.text('İş tamamlandı'), findsNothing);
    expect(find.text('Güvenli durduruldu'), findsNothing);
  });
  testWidgets(
    'Değişim, önem, güvenlik ve durma etkisi açık; geçmiş güncel kanıt değildir',
    (t) async {
      await t.pumpWidget(
        _app(
          _view(saved: _saved(), notice: _notice(), map: (_) {}, close: (_) {}),
        ),
      );
      expect(find.text('Ne değişti?'), findsOneWidget);
      expect(
        find.textContaining(
          'Önceki devam kararı yeni rehber sürümünü kapsamıyor',
        ),
        findsOneWidget,
      );
      expect(find.textContaining('Güvenlik etkisi:'), findsOneWidget);
      expect(find.textContaining('Durma etkisi:'), findsOneWidget);
      expect(
        find.textContaining('nerede kaldığını hatırlamak için korunur'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Bu değişim için olumlu olarak doğrulandı'),
        findsNothing,
      );
      expect(_enabled(t, _step), isFalse);
      await _tap(t, _detail);
      for (final value in [
        'Örnek parça konumu kaydedilmiş',
        'Örnek ölçüm notu',
        'Örnek fotoğraf/not referansı',
        'Örnek önceki güvenlik onayı',
        'Örnek önceki hazırlık notu',
      ]) {
        expect(find.textContaining(value), findsOneWidget);
      }
      expect(find.textContaining('Son kontrol: 2026-10-04'), findsOneWidget);
    },
  );
  testWidgets('Tam olumlu eşleme yalnız kaynağın yeni adım yolunu açar', (
    t,
  ) async {
    final sent = <GuideRemapRequest>[];
    final s = _scope();
    await t.pumpWidget(
      _app(
        _view(
          scope: s,
          saved: _saved(),
          notice: _notice(),
          assessment: _assessment(),
          map: (_) {},
          step: sent.add,
          close: (_) {},
        ),
      ),
    );
    expect(_enabled(t, _step), isTrue);
    expect(find.text('Yeni rehberle eşleme doğrulandı'), findsOneWidget);
    expect(find.textContaining('Kaynakta eşlenen yeni adım:'), findsOneWidget);
    await _tap(t, _step);
    expect(sent.single.targetStepId, _target);
    expect(identical(sent.single.scope, s), isTrue);
    expect(sent.single.changeId, _change);
    expect(sent.single.targetStepId, isNot(_saved().savedCurrentStep));
    expect(find.text('İş tamamlandı'), findsNothing);
  });
  testWidgets(
    'Dört amaçtaki current held ve unknown normal yolu açmaz; neden ve yeniden eşleme görünür',
    (t) async {
      for (final purpose in [
        ExecutionProofKind.content,
        ExecutionProofKind.fit,
        ExecutionProofKind.readiness,
        ExecutionProofKind.decision,
      ]) {
        for (final state in [
          RemapReferenceState.unknown,
          RemapReferenceState.held,
        ]) {
          final sent = <GuideRemapRequest>[];
          await t.pumpWidget(
            _app(
              _view(
                saved: _saved(),
                notice: _notice(),
                assessment: _assessment(
                  overrides: {purpose: _ref(purpose, state: state)},
                  reason: 'Güncel gerekli değerlendirme olumlu sonuçlanmadı; yeniden kontrol gerekli.',
                ),
                map: sent.add,
                step: sent.add,
                close: sent.add,
              ),
            ),
          );
          expect(_enabled(t, _step), isFalse, reason: '$purpose/$state');
          expect(
            find.textContaining('Neden kapalı? Güncel gerekli değerlendirme'),
            findsOneWidget,
          );
          expect(
            find.textContaining('Kaynakta eşlenen yeni adım:'),
            findsNothing,
          );
          await _tap(t, _map);
          await _tap(t, _close);
          expect(sent, hasLength(2));
          expect(
            sent.every((r) => r.targetStepId == null && r.changeId == _change),
            isTrue,
          );
        }
      }
    },
  );
  final wrongScopes = [
    _scope(bike: 'foreign-bike'),
    _scope(work: 'foreign-work'),
    _scope(guide: 'foreign-guide'),
    _scope(version: 'v4'),
    _scope(context: 'other-context'),
    _scope(evaluation: 'other-evaluation'),
    _scope(physical: 'other-physical'),
  ];
  testWidgets(
    'Her kapsam alanı yanlışsa değerlendirme ve özel nedeni saklanır',
    (t) async {
      for (final wrong in wrongScopes) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(
                scope: wrong,
                reason: 'FOREIGN PRIVATE REASON',
              ),
              step: (_) {},
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        expect(find.textContaining('FOREIGN PRIVATE REASON'), findsNothing);
        expect(
          find.textContaining('Örnek güncel çalışma alanı koşulu'),
          findsNothing,
        );
      }
      for (final a in [
        _assessment(change: 'old-change'),
        _assessment(old: _scope(version: 'v1')),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: a,
              step: (_) {},
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
      }
    },
  );
  testWidgets(
    'Her kaynak amacı tam kapsam, güncellik, değişim ve konu gerektirir',
    (t) async {
      for (final purpose in [
        ExecutionProofKind.content,
        ExecutionProofKind.fit,
        ExecutionProofKind.readiness,
        ExecutionProofKind.decision,
      ]) {
        for (final bad in [
          ...wrongScopes.map((s) => _ref(purpose, scope: s)),
          _ref(purpose, current: false),
          _ref(purpose, change: 'old-change'),
          _ref(purpose, subject: 'other-subject'),
          _ref(ExecutionProofKind.completion),
          null,
        ]) {
          await t.pumpWidget(
            _app(
              _view(
                saved: _saved(),
                notice: _notice(),
                assessment: _assessment(overrides: {purpose: bad}),
                step: (_) {},
              ),
            ),
          );
          expect(_enabled(t, _step), isFalse, reason: '$purpose/$bad');
        }
      }
    },
  );
  testWidgets(
    'Bildirim eski yeni kapsam, amaç, konu ve değişime bağlı; yanlış teknik metin gizli',
    (t) async {
      for (final bad in [
        ...wrongScopes.map(
          (s) => _evidence(
            scope: s,
            purpose: GuideRemapPurpose.changeNotice,
            subject: _change,
          ),
        ),
        _evidence(
          old: _scope(version: 'v1'),
          purpose: GuideRemapPurpose.changeNotice,
          subject: _change,
        ),
        _evidence(
          current: false,
          purpose: GuideRemapPurpose.changeNotice,
          subject: _change,
        ),
        _evidence(
          change: 'old-change',
          purpose: GuideRemapPurpose.changeNotice,
          subject: _change,
        ),
        _evidence(
          subject: 'other-subject',
          purpose: GuideRemapPurpose.changeNotice,
        ),
        _evidence(subject: _change),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(
                evidence: bad,
                changes: ['FOREIGN PRIVATE CHANGE'],
              ),
              assessment: _assessment(),
              step: (_) {},
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        expect(find.text('FOREIGN PRIVATE CHANGE'), findsNothing);
        expect(find.textContaining('Neden önemli?'), findsNothing);
      }
    },
  );
  testWidgets(
    'Olumlu eşleme de eski yeni tam kapsam, amaç, güncellik ve hedef kanıtını gerektirir',
    (t) async {
      for (final bad in [
        ...wrongScopes.map((s) => _mapping(evidence: _evidence(scope: s))),
        _mapping(
          evidence: _evidence(old: _scope(version: 'v1')),
        ),
        _mapping(evidence: _evidence(change: 'old-change')),
        _mapping(evidence: _evidence(current: false)),
        _mapping(evidence: _evidence(purpose: GuideRemapPurpose.changeNotice)),
        _mapping(evidence: _evidence(subject: 'wrong-target')),
        _mapping(missingProof: true),
        _mapping(target: null),
        _mapping(label: null),
        _mapping(state: GuideMappingState.unknown),
        _mapping(state: GuideMappingState.held),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(mapping: bad),
              step: (_) {},
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        expect(
          find.textContaining('Kaynakta eşlenen yeni adım:'),
          findsNothing,
        );
      }
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            notice: _notice(),
            assessment: _assessment(missingMapping: true),
            step: (_) {},
          ),
        ),
      );
      expect(_enabled(t, _step), isFalse);
    },
  );
  testWidgets(
    'Kritik kontroller yeni değişim için açık olumlu kanıt ister; boş liste yetmez',
    (t) async {
      for (final checks in <List<GuideRemapSafetyCheck>>[
        [],
        [_check(verified: false)],
        [_check(reviewed: false)],
        [_check(proof: false)],
        [_check(change: 'old-change')],
        ...wrongScopes.map((s) => [_check(scope: s)]),
        [
          GuideRemapSafetyCheck(
            changeId: _change,
            check: ExecutionSafetyCheck(
              id: 'different-check',
              label: 'Örnek kontrol',
              risk: 'Örnek risk',
              prevention: 'Örnek önleme',
              stopCondition: 'Eksikse dur',
              verified: true,
              explicitlyReviewed: true,
              proof: _proof(ExecutionProofKind.safetyCheck, subject: 'check-a'),
            ),
          ),
        ],
      ]) {
        final sent = <GuideRemapRequest>[];
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(checks: checks),
              step: (_) {},
              check: sent.add,
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        if (checks.isNotEmpty) {
          await _tap(t, 'Bu kontrolü yeniden iste');
          expect(sent.single.changeId, _change);
          expect(sent.single.checkId, checks.single.check.id);
          expect(sent.single.targetStepId, isNull);
        } else
          expect(
            find.textContaining('Boş liste bütün koşullar'),
            findsOneWidget,
          );
      }
    },
  );
  testWidgets(
    'Eksik veya yabancı geçmiş ve değişmemiş rehber normal yolu açmaz',
    (t) async {
      for (final saved in [
        null,
        _saved(scope: _scope(bike: 'foreign-bike')),
        _saved(scope: _scope(work: 'foreign-work')),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              saved: saved,
              notice: _notice(),
              assessment: _assessment(),
              step: (_) {},
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        expect(find.textContaining('Örnek kesin adım'), findsNothing);
        expect(find.text('Ne değişti?'), findsNothing);
      }
      final s = _oldScope();
      await t.pumpWidget(
        _app(
          _view(
            scope: s,
            saved: _saved(),
            notice: _notice(
              evidence: _evidence(
                scope: s,
                purpose: GuideRemapPurpose.changeNotice,
                subject: _change,
              ),
            ),
            assessment: _assessment(scope: s),
            step: (_) {},
          ),
        ),
      );
      expect(_enabled(t, _step), isFalse);
      expect(find.text('Ne değişti?'), findsNothing);
      await t.pumpWidget(
        _app(
          _view(saved: _saved(missing: true), notice: _notice(), step: (_) {}),
        ),
      );
      expect(find.text('Son kesin adım: Bilinmiyor'), findsOneWidget);
      await _tap(t, _detail);
      expect(
        find.text('Fotoğraf ve not referansları: Bilinmiyor'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Eşlenemeyen gerçek sonuç ücretsiz kapanış yolunu öne çıkarır; yeniden deneme tamamlanma değildir',
    (t) async {
      final sent = <GuideRemapRequest>[];
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            notice: _notice(),
            assessment: _assessment(
              mapping: _mapping(state: GuideMappingState.unmappable),
              reason: 'Güncel fiziksel durum yeni rehberde güvenli bir devam adımıyla eşlenemedi.',
            ),
            map: sent.add,
            close: sent.add,
            step: sent.add,
          ),
        ),
      );
      expect(find.text('Mevcut durum yeni rehbere eşlenemedi'), findsOneWidget);
      expect(_enabled(t, _step), isFalse);
      await _tap(t, _close);
      await _tap(t, _map);
      expect(sent, hasLength(2));
      expect(sent.every((r) => r.targetStepId == null), isTrue);
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            notice: _notice(),
            assessment: _assessment(
              mapping: _mapping(
                state: GuideMappingState.unmappable,
                missingProof: true,
              ),
            ),
            step: (_) {},
          ),
        ),
      );
      expect(find.text('Mevcut durum yeni rehbere eşlenemedi'), findsNothing);
      expect(_enabled(t, _step), isFalse);
    },
  );
  testWidgets(
    'Busy, hata ve eksik handler normal geçişi kapatır; kapanış bilgisi bağımsızdır',
    (t) async {
      for (final busy in [false, true]) {
        final sent = <GuideRemapRequest>[];
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(),
              busy: busy,
              error: 'Örnek istek hatası',
              map: sent.add,
              observe: sent.add,
              step: sent.add,
              close: sent.add,
            ),
          ),
        );
        expect(_enabled(t, _step), isFalse);
        expect(_enabled(t, _map), !busy);
        expect(_enabled(t, _observe), !busy);
        expect(_enabled(t, _close), isTrue);
        await _tap(t, _close);
        expect(sent.single.targetStepId, isNull);
        if (!busy) {
          await _tap(t, _map);
          expect(sent, hasLength(2));
        }
      }
      await t.pumpWidget(
        _app(
          _view(saved: _saved(), notice: _notice(), assessment: _assessment()),
        ),
      );
      for (final label in [_map, _step, _observe, _close])
        expect(_enabled(t, label), isFalse);
      expect(
        find.textContaining('İlgili yol şu anda kullanılamıyor'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Hata, güncel kaynak değerlendirmesi ve son isteğin sonucu açıkça ayrılır',
    (t) async {
      for (final busy in [false, true]) {
        final sent = <GuideRemapRequest>[];
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(),
              busy: busy,
              error: 'Örnek istek sonucu alınamadı',
              map: sent.add,
              step: sent.add,
              close: sent.add,
            ),
          ),
        );
        expect(find.text('Son isteğin sonucu doğrulanamadı'), findsOneWidget);
        expect(find.text('Kaynağın güncel değerlendirmesi'), findsOneWidget);
        expect(find.text('Yeni rehberle eşleme doğrulandı'), findsNothing);
        expect(
          find.text('Yeni rehbere eşleme: Güncel kaynakla doğrulandı'),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            'Eşleme veya fiziksel işlem gerçekleşmiş sayılmaz',
          ),
          findsNothing,
        );
        expect(
          find.textContaining(
            'Yeni bir eşleme veya fiziksel işlem sonucu bu hatadan çıkarılamaz',
          ),
          findsOneWidget,
        );
        expect(_enabled(t, _step), isFalse);
        expect(_enabled(t, _map), !busy);
        expect(_enabled(t, _close), isTrue);
        await _tap(t, _close);
        expect(sent.single.targetStepId, isNull);
      }
    },
  );
  testWidgets(
    'Hata türü gösterilir; eski yabancı hata ayrıntısı gizlenir ve olumlu kaynak korunur',
    (t) async {
      for (final kind in GuideRemapRequestKind.values) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(),
              requestError: GuideRemapRequestError(
                scope: _scope(),
                changeId: _change,
                kind: kind,
                message: 'Yalnız bu güncel isteğe ait açıklama',
              ),
              step: (_) {},
              close: (_) {},
              map: (_) {},
            ),
          ),
        );
        expect(
          find.textContaining('${kind.label} isteğinin sonucu doğrulanamadı'),
          findsOneWidget,
        );
        expect(
          find.text('Yeni rehbere eşleme: Güncel kaynakla doğrulandı'),
          findsOneWidget,
        );
        expect(_enabled(t, _step), isFalse);
      }
      for (final scope in [
        _scope(bike: 'foreign'),
        _scope(work: 'foreign'),
        _scope(guide: 'foreign'),
        _scope(version: 'old'),
        _scope(context: 'old'),
        _scope(evaluation: 'old'),
        _scope(physical: 'old'),
      ]) {
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: _notice(),
              assessment: _assessment(),
              requestError: GuideRemapRequestError(
                scope: scope,
                changeId: _change,
                kind: GuideRemapRequestKind.mapping,
                message: 'YABANCI ÖZEL HATA',
              ),
              step: (_) {},
              close: (_) {},
            ),
          ),
        );
        expect(find.textContaining('YABANCI ÖZEL HATA'), findsNothing);
        expect(
          find.textContaining('Hata bilgisi bu motosiklet'),
          findsOneWidget,
        );
        expect(_enabled(t, _step), isFalse);
        expect(_enabled(t, _close), isTrue);
      }
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            notice: _notice(),
            assessment: _assessment(),
            requestError: GuideRemapRequestError(
              scope: _scope(),
              changeId: 'previous-change',
              kind: GuideRemapRequestKind.mapping,
              message: 'ESKİ DEĞİŞİM HATASI',
            ),
            step: (_) {},
          ),
        ),
      );
      expect(find.textContaining('ESKİ DEĞİŞİM HATASI'), findsNothing);
      expect(_enabled(t, _step), isFalse);
    },
  );
  testWidgets('Yeni kapsam, değişim veya kayıt değişince açık geçmiş kapanır', (
    t,
  ) async {
    final saved = _saved();
    final notice = _notice();
    for (final replacement in [
      _view(
        saved: saved,
        notice: notice,
        scope: _scope(physical: 'new-physical'),
      ),
      _view(saved: saved, notice: notice, change: 'new-change'),
      _view(saved: _saved(missing: true), notice: notice),
      _view(saved: saved, notice: _notice()),
    ]) {
      await t.pumpWidget(_app(_view(saved: saved, notice: notice)));
      await _tap(t, _detail);
      expect(
        find.textContaining('Sökülen veya gevşetilen parçalar:'),
        findsOneWidget,
      );
      await t.pumpWidget(_app(replacement));
      await t.pumpAndSettle();
      expect(
        find.textContaining('Sökülen veya gevşetilen parçalar:'),
        findsNothing,
      );
    }
  });
  testWidgets(
    'Gerçek Tab Enter Space ve kapalı buton semantics; eylemler yalnız istek',
    (t) async {
      final sent = <GuideRemapRequest>[];
      await t.pumpWidget(
        _app(
          _view(
            saved: _saved(),
            notice: _notice(),
            observe: sent.add,
            map: sent.add,
            step: sent.add,
            close: sent.add,
          ),
        ),
      );
      await t.ensureVisible(find.text(_step));
      await t.pumpAndSettle();
      final semantics = t.ensureSemantics();
      final node = t.getSemantics(
        find
            .ancestor(of: find.text(_step), matching: find.byType(Semantics))
            .first,
      );
      expect(
        node,
        matchesSemantics(
          hasEnabledState: true,
          isEnabled: false,
          isButton: true,
          label: _step,
        ),
      );
      semantics.dispose();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(sent, hasLength(2));
      expect(
        sent.every((r) => r.targetStepId == null && r.changeId == _change),
        isTrue,
      );
    },
  );
  testWidgets(
    'Bütün durumlar 320 390 768 ve 1 2 3 yazı ölçeğinde kayar; en az52 hedef',
    (t) async {
      addTearDown(t.view.resetPhysicalSize);
      addTearDown(t.view.resetDevicePixelRatio);
      t.view.devicePixelRatio = 1;
      for (final width in [320.0, 390.0, 768.0])
        for (final scale in [1.0, 2.0, 3.0]) {
          t.view.physicalSize = Size(width, 844);
          for (final entry in _states().entries) {
            await t.pumpWidget(
              _app(
                _view(
                  saved: _saved(),
                  notice: entry.key == 'notice-unknown' ? null : _notice(),
                  assessment: entry.value,
                  error: entry.key.endsWith('error')
                      ? 'Örnek istek sonucu alınamadı'
                      : null,
                  busy: entry.key == 'busy-error',
                  observe: (_) {},
                  map: (_) {},
                  step: (_) {},
                  close: (_) {},
                  check: (_) {},
                ),
                scale: scale,
              ),
            );
            await t.pumpAndSettle();
            expect(t.takeException(), isNull);
            await t.ensureVisible(find.text(_close));
            await t.pumpAndSettle();
            expect(t.takeException(), isNull);
            for (final label in [_map, _observe, _step, _close]) {
              final box = find
                  .ancestor(
                    of: find.text(label),
                    matching: find.byType(Container),
                  )
                  .first;
              expect(t.getSize(box).height, greaterThanOrEqualTo(52));
            }
            final pos = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            expect(pos.maxScrollExtent, greaterThan(0));
          }
        }
    },
  );
  testWidgets(
    'Gerçek boyalı ana eylem ve klavye odak kontrastı; durum liveRegion',
    (t) async {
      for (final entry in {
        'pending': null,
        'ready': _assessment(),
        'error': _assessment(),
        'unmappable': _assessment(
          mapping: _mapping(state: GuideMappingState.unmappable),
        ),
      }.entries) {
        await t.pumpWidget(const SizedBox());
        await t.pump();
        await t.pumpWidget(
          _app(
            _view(
              saved: _saved(),
              notice: entry.key == 'notice-unknown' ? null : _notice(),
              assessment: entry.value,
              error: entry.key == 'error'
                  ? 'Örnek istek sonucu alınamadı'
                  : null,
              observe: (_) {},
              map: (_) {},
              step: (_) {},
              close: (_) {},
            ),
          ),
        );
        final label = entry.key == 'ready'
            ? _step
            : entry.key == 'unmappable'
            ? _close
            : _map;
        final f = find.text(label);
        await t.ensureVisible(f);
        await t.pumpAndSettle();
        BoxDecoration decoration() =>
            t
                    .widget<Container>(
                      find
                          .ancestor(of: f, matching: find.byType(Container))
                          .first,
                    )
                    .decoration!
                as BoxDecoration;
        final paragraph = t.renderObject<RenderParagraph>(f).text as TextSpan;
        double contrast(Color a, Color b) {
          final x = a.computeLuminance(), y = b.computeLuminance();
          return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
        }

        final bg = decoration().color!;
        expect(
          contrast(paragraph.style!.color!, bg),
          greaterThanOrEqualTo(4.5),
        );
        final tabs = entry.key == 'unmappable' ? 3 : 2;
        for (var i = 0; i < tabs; i++) {
          await t.sendKeyEvent(LogicalKeyboardKey.tab);
          await t.pump();
        }
        final border = decoration().border! as Border;
        expect(border.top.width, 3, reason: entry.key);
        expect(contrast(border.top.color, bg), greaterThanOrEqualTo(3));
        expect(
          find.byWidgetPredicate(
            (w) => w is Semantics && w.properties.liveRegion == true,
          ),
          findsWidgets,
        );
      }
    },
  );
  testWidgets('Sağlayıcı sonucu değişince klavye odağı aynı istekte kalır', (
    t,
  ) async {
    final saved = _saved(), notice = _notice(), scope = _scope();
    final mappings = <GuideRemapRequest>[], steps = <GuideRemapRequest>[];
    await t.pumpWidget(
      _app(
        _view(
          scope: scope,
          saved: saved,
          notice: notice,
          observe: (_) {},
          map: mappings.add,
          step: steps.add,
          close: (_) {},
        ),
      ),
    );
    await t.ensureVisible(find.text(_map));
    await t.pumpAndSettle();
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump();
    await t.sendKeyEvent(LogicalKeyboardKey.tab);
    await t.pump();
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pumpAndSettle();
    expect(mappings, hasLength(1));
    await t.pumpWidget(
      _app(
        _view(
          scope: scope,
          saved: saved,
          notice: notice,
          assessment: _assessment(),
          observe: (_) {},
          map: mappings.add,
          step: steps.add,
          close: (_) {},
        ),
      ),
    );
    await t.pumpAndSettle();
    final decoration =
        t
                .widget<Container>(
                  find
                      .ancestor(
                        of: find.text(_map),
                        matching: find.byType(Container),
                      )
                      .first,
                )
                .decoration!
            as BoxDecoration;
    expect((decoration.border! as Border).top.width, 3);
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pumpAndSettle();
    expect(mappings, hasLength(2));
    expect(steps, isEmpty);
    await t.pumpWidget(
      _app(
        _view(
          saved: saved,
          notice: notice,
          assessment: _assessment(),
          error: 'Örnek istek sonucu alınamadı',
          map: mappings.add,
          step: steps.add,
        ),
      ),
    );
    await t.pumpAndSettle();
    final errorDecoration =
        t
                .widget<Container>(
                  find
                      .ancestor(
                        of: find.text(_map),
                        matching: find.byType(Container),
                      )
                      .first,
                )
                .decoration!
            as BoxDecoration;
    expect((errorDecoration.border! as Border).top.width, 3);
    expect(_enabled(t, _step), isFalse);
    await t.sendKeyEvent(LogicalKeyboardKey.enter);
    await t.pumpAndSettle();
    expect(mappings, hasLength(3));
    expect(steps, isEmpty);
  });
  final capture = Platform.environment['KAVRIVA_REMAP_PREVIEW'];
  if (capture != null)
    testWidgets(
      'Capture genuine full remap views including explicit held unknown and failure',
      (t) async {
        final fontPath = Platform.environment['KAVRIVA_REMAP_FONT'];
        String? font;
        if (fontPath != null) {
          font = 'RemapPreview';
          await t.runAsync(() async {
            final bytes = await File(fontPath).readAsBytes();
            final loader = FontLoader(font!)
              ..addFont(Future.value(ByteData.sublistView(bytes)));
            await loader.load();
          });
        }
        t.view.physicalSize = const Size(390, 844);
        t.view.devicePixelRatio = 1;
        addTearDown(t.view.resetPhysicalSize);
        addTearDown(t.view.resetDevicePixelRatio);
        for (final entry in {..._states(), 'history': null}.entries) {
          final key = GlobalKey();
          await t.pumpWidget(
            _app(
              RepaintBoundary(
                key: key,
                child: ColoredBox(
                  color: const Color(0xFFF8FAFC),
                  child: _view(
                    saved: _saved(),
                    notice: entry.key == 'notice-unknown' ? null : _notice(),
                    assessment: entry.value,
                    error: entry.key.endsWith('error')
                        ? 'Örnek istek sonucu alınamadı'
                        : null,
                    busy: entry.key == 'busy-error',
                    observe: (_) {},
                    map: (_) {},
                    step: (_) {},
                    close: (_) {},
                    check: (_) {},
                  ),
                ),
              ),
              font: font,
            ),
          );
          await t.pumpAndSettle();
          if (entry.key == 'notice-unknown') {
            expect(find.text('Ne değişti?'), findsNothing);
            expect(
              find.textContaining('değişimi ve etkisi henüz doğrulanmadı'),
              findsOneWidget,
            );
          }
          if (entry.key.endsWith('error')) {
            expect(
              find.text('Son isteğin sonucu doğrulanamadı'),
              findsOneWidget,
            );
            expect(
              find.text('Kaynağın güncel değerlendirmesi'),
              findsOneWidget,
            );
            expect(find.text('Yeni rehberle eşleme doğrulandı'), findsNothing);
            expect(_enabled(t, _step), isFalse);
            expect(_enabled(t, _close), isTrue);
          }
          final pos = t
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position;
          if (entry.key == 'history') {
            await _tap(t, _detail);
            pos.jumpTo(0);
            await t.pumpAndSettle();
          }
          var index = 0;
          while (true) {
            final boundary =
                key.currentContext!.findRenderObject()!
                    as RenderRepaintBoundary;
            await t.runAsync(() async {
              final img = await boundary.toImage(pixelRatio: 1);
              final bytes = await img.toByteData(
                format: ui.ImageByteFormat.png,
              );
              await File('$capture-${entry.key}-$index.png')
                  .writeAsBytes(bytes!.buffer.asUint8List());
              img.dispose();
            });
            index++;
            if (pos.pixels >= pos.maxScrollExtent) break;
            pos.jumpTo((pos.pixels + 620).clamp(0, pos.maxScrollExtent));
            await t.pump();
          }
        }
      },
    );
}

Map<String, GuideRemapAssessment?> _states() => {
  'notice-unknown': null,
  'initial': null,
  'provider-held': _assessment(
    overrides: {
      ExecutionProofKind.fit: _ref(
        ExecutionProofKind.fit,
        state: RemapReferenceState.held,
      ),
    },
    reason: 'Bu motosikletin yeni rehbere uygunluğu olumlu doğrulanmadı. Uygunluk yeniden kontrol edilmeden devam etme.',
  ),
  'provider-unknown': _assessment(
    overrides: {
      ExecutionProofKind.content: _ref(
        ExecutionProofKind.content,
        state: RemapReferenceState.unknown,
      ),
    },
    reason: 'Motosikletin şu anki fiziksel durumu doğrulanamadı. Güncel durum yeniden kontrol edilmeden eski adımdan devam etme.',
  ),
  'mapping-held': _assessment(
    mapping: _mapping(state: GuideMappingState.held),
    reason: 'Güncel fiziksel durum için yeni rehberle eşleme henüz olumlu değil. Yeniden eşleme iste; eski adım kullanılmaz.',
  ),
  'mapping-unknown': _assessment(
    mapping: _mapping(state: GuideMappingState.unknown),
    reason: 'Yeni rehberde hangi adıma geçilebileceği doğrulanamadı. Güncel durumun yeniden eşlenmesini iste.',
  ),
  'pending-check': _assessment(checks: [_check(proof: false)]),
  'ready': _assessment(),
  'request-error': _assessment(),
  'busy-error': _assessment(),
  'unmappable': _assessment(
    mapping: _mapping(state: GuideMappingState.unmappable),
    reason: 'Güncel fiziksel durum yeni rehberde güvenli bir devam adımıyla eşlenemedi. Normal devam durur; güvenli durdurma bilgisine erişebilirsin.',
  ),
};
