import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/diagnosis.dart';
import 'package:kavriva_shell/kavriva_shell.dart';

// Bu dosyadaki bütün kaynaklar test örneğidir; gerçek E3/E9 üreticisi yoktur.
const _request = 'request-example';
DiagnosisScope _scope({
  String bike = 'bike-example',
  String context = 'context-r1',
  String flow = 'flow-example',
  String observations = 'observations-r1',
}) => DiagnosisScope(
  motorcycleId: bike,
  contextRevision: context,
  flowId: flow,
  observationRevision: observations,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
);
List<DiagnosisScope> _foreign() => [
  _scope(bike: 'other'),
  _scope(context: 'old'),
  _scope(flow: 'other'),
  _scope(observations: 'old'),
];
DiagnosisReference _ref(
  String purpose,
  String subject, {
  DiagnosisScope? scope,
  String request = _request,
  DiagnosisReferenceState state = DiagnosisReferenceState.confirmed,
  bool current = true,
  String version = 'örnek-r1',
  String source = 'Örnek değerlendirme kaynağı',
}) => DiagnosisReference(
  scope: scope ?? _scope(),
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: source,
  version: version,
  location: 'Örnek bölüm · test verisi',
  checkedAt: '2026-10-04',
  current: current,
  state: state,
  reason: 'Yalnız bu sunum testinin örnek değerlendirmesi.',
);
DiagnosisCheck _check({
  DiagnosisScope? scope,
  String request = _request,
  String revision = 'question-r1',
  String question = 'Ses ne zaman oluyor?',
  DiagnosisReference? authority,
  bool missing = false,
  List<DiagnosisChoice>? choices,
  DiagnosisPhotoRequest? photoRequest,
}) => DiagnosisCheck(
  scope: scope ?? _scope(),
  requestId: request,
  id: 'check-example',
  revision: revision,
  question: question,
  why: 'Bu örnek gözlem, olasılıkları ayırmaya yardımcı olur; fiziksel test talimatı değildir.',
  authority: missing
      ? null
      : authority ?? _ref('diagnosis-check', 'check-example/$revision'),
  photoRequest: photoRequest,
  choices:
      choices ??
      [
        DiagnosisChoice(id: 'braking', label: 'Yalnız fren yaparken'),
        DiagnosisChoice(id: 'released', label: 'Fren bırakıldığında da'),
        DiagnosisChoice(id: 'moving', label: 'Hareket ederken sürekli'),
      ],
);
DiagnosisPhotoRequest _photo({
  DiagnosisScope? scope,
  String request = _request,
  String check = 'check-example',
  String revision = 'question-r1',
  bool useful = true,
  bool alreadyProvided = false,
  DiagnosisReference? authority,
  bool missing = false,
}) => DiagnosisPhotoRequest(
  scope: scope ?? _scope(),
  requestId: request,
  checkId: check,
  checkRevision: revision,
  reason: 'Örnek kaynak, gözlemin hangi bölgeye ait olduğunu ayırmak için görsel bilgiyi yararlı buluyor. Bu yalnız test verisidir.',
  materiallyUseful: useful,
  evidenceAlreadyProvided: alreadyProvided,
  authority: missing
      ? null
      : authority ?? _ref('diagnosis-photo', 'check-example/$revision'),
);
DiagnosisCheck _photoCheck({DiagnosisPhotoRequest? request}) => _check(
  question: 'Gözlemin hangi bölgeye ait olduğundan emin misin?',
  choices: [
    DiagnosisChoice(id: 'identified', label: 'Bölgeyi ayırt edebiliyorum'),
    DiagnosisChoice(id: 'unclear', label: 'Bölgeyi ayırt edemiyorum'),
  ],
  photoRequest: request ?? _photo(),
);
DiagnosisResult _result({
  DiagnosisScope? scope,
  String request = _request,
  DiagnosisOutcome outcome = DiagnosisOutcome.supported,
  DiagnosisReference? authority,
  bool missingAuthority = false,
  Map<DiagnosisDimension, DiagnosisReference?> overrides = const {},
  List<String>? known,
  String? guide = 'guide-example',
  String? guideLabel = 'Örnek gözlem rehberi',
}) => DiagnosisResult(
  scope: scope ?? _scope(),
  requestId: request,
  id: 'result-example',
  outcome: outcome,
  authority: missingAuthority
      ? null
      : authority ?? _ref('diagnosis-result', 'result-example'),
  checks: {
    for (final d in DiagnosisDimension.values)
      if (!overrides.containsKey(d) || overrides[d] != null)
        d: overrides.containsKey(d)
            ? overrides[d]!
            : _ref('diagnosis-${d.name}', 'result-example'),
  },
  explanation: outcome == DiagnosisOutcome.supported
      ? 'Örnek kaynak, gözlemlerin fren bölgesindeki olasılıkların ayrılmasını desteklediğini bildiriyor; kesin arıza değil.'
      : 'Örnek kaynak, mevcut gözlemlerin tek bir sonucu desteklemeye yetmediğini bildiriyor.',
  known: known ?? ['Kayıtlı örnek gözlem: ses yalnız fren yaparken duyulmuş.'],
  unknown: ['Sesin kesin nedeni henüz belirlenmedi.'],
  alternatives: ['Başka bir olasılık da olabilir; fiziksel doğrulama gerekir.'],
  guideId: guide,
  guideLabel: guideLabel,
);
DiagnosisProposal _proposal({
  DiagnosisScope? scope,
  String request = _request,
  DiagnosisProposalKind kind = DiagnosisProposalKind.symptomFlow,
  bool current = true,
}) => DiagnosisProposal(
  scope: scope ?? _scope(),
  requestId: request,
  current: current,
  kind: kind,
  id: 'proposal-example',
  explanation: 'Örnek öneri: bir gözlem daha gerekebilir.',
);
UnknownDiagnosisRequest _unknown({
  DiagnosisScope? scope,
  String request = _request,
}) => UnknownDiagnosisRequest(
  scope: scope ?? _scope(),
  requestId: request,
  kind: DiagnosisRequestKind.observation,
);
DiagnosisRequestError _error({
  DiagnosisScope? scope,
  String request = _request,
}) => DiagnosisRequestError(
  scope: scope ?? _scope(),
  requestId: request,
  kind: DiagnosisRequestKind.observation,
  message: 'Örnek yanıt alınamadı',
);
DiagnosisView _view({
  DiagnosisScope? scope,
  String request = _request,
  DiagnosisStage stage = DiagnosisStage.result,
  DiagnosisCheck? check,
  DiagnosisResult? result,
  DiagnosisProposal? proposal,
  bool busy = false,
  UnknownDiagnosisRequest? unknown,
  DiagnosisRequestError? error,
  bool safe = true,
  DiagnosisSafetyDeclaration? declaration,
  void Function(DiagnosisRequest)? record,
  Map<DiagnosisRequestKind, ValueChanged<DiagnosisRequest>>? handlers,
}) => DiagnosisView(
  brand: const Text('Kavriva · test örneği'),
  scope: scope ?? _scope(),
  requestId: request,
  stage: stage,
  safety:
      declaration ??
      (safe
          ? DiagnosisSafetyDeclaration(
              scope: scope ?? _scope(),
              answer: DiagnosisSafety.yes,
            )
          : null),
  proposal: proposal,
  check: check,
  result: result,
  busy: busy,
  unknownRequest: unknown,
  error: error,
  handlers:
      handlers ??
      {for (final kind in DiagnosisRequestKind.values) kind: record ?? (_) {}},
);
Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFF7FAFC),
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
          fontSize: 16,
          fontFamily: input.font,
          color: const Color(0xFF172033),
        ),
        child: KavrivaShell(
          pages: {
            for (final s in KavrivaSection.values)
              s: s == KavrivaSection.assistance
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

Finder _action(DiagnosisRequestKind kind) => find.byKey(ValueKey(kind));
bool _enabled(WidgetTester t, DiagnosisRequestKind kind) => t
    .widget<FocusableActionDetector>(
      find.descendant(
        of: _action(kind),
        matching: find.byType(FocusableActionDetector),
      ),
    )
    .enabled;
Future<void> _tap(WidgetTester t, Finder f) async {
  await t.pumpAndSettle();
  await t.ensureVisible(f);
  await t.pumpAndSettle();
  await t.tap(f);
  await t.pumpAndSettle();
}

Future<void> _pump(WidgetTester t, Widget view, {double scale = 1}) async {
  await t.pumpWidget(_app(view, scale: scale));
  await t.pumpAndSettle();
}

Map<String, DiagnosisView> _states() => {
  'symptom': _view(stage: DiagnosisStage.symptom),
  'symptom-yes': _view(stage: DiagnosisStage.symptom),
  'danger-no': _view(stage: DiagnosisStage.symptom),
  'danger-unsure': _view(stage: DiagnosisStage.symptom),
  'check': _view(stage: DiagnosisStage.check, check: _check()),
  'check-unsure': _view(stage: DiagnosisStage.check, check: _check()),
  'photo-useful': _view(stage: DiagnosisStage.check, check: _photoCheck()),
  'photo-reuse': _view(
    stage: DiagnosisStage.check,
    check: _photoCheck(request: _photo(alreadyProvided: true)),
  ),
  'photo-held': _view(
    stage: DiagnosisStage.check,
    check: _photoCheck(
      request: _photo(
        authority: _ref(
          'diagnosis-photo',
          'check-example/question-r1',
          state: DiagnosisReferenceState.held,
        ),
      ),
    ),
  ),
  'photo-foreign': _view(
    stage: DiagnosisStage.check,
    check: _photoCheck(
      request: _photo(scope: _scope(bike: 'other')),
    ),
  ),
  'check-held': _view(
    stage: DiagnosisStage.check,
    check: _check(
      authority: _ref(
        'diagnosis-check',
        'check-example/question-r1',
        state: DiagnosisReferenceState.held,
      ),
    ),
  ),
  'check-foreign': _view(
    stage: DiagnosisStage.check,
    check: _check(scope: _scope(bike: 'other')),
  ),
  'supported': _view(result: _result()),
  'safety-unknown-result': _view(result: _result(), safe: false),
  'safety-no-check': _view(
    stage: DiagnosisStage.check,
    check: _check(),
    safe: false,
    declaration: DiagnosisSafetyDeclaration(
      scope: _scope(),
      answer: DiagnosisSafety.no,
    ),
  ),
  'supported-held': _view(
    result: _result(
      overrides: {
        DiagnosisDimension.readiness: _ref(
          'diagnosis-readiness',
          'result-example',
          state: DiagnosisReferenceState.held,
        ),
      },
    ),
  ),
  'unresolved': _view(result: _result(outcome: DiagnosisOutcome.unresolved)),
  'provider-held': _view(
    result: _result(
      authority: _ref(
        'diagnosis-result',
        'result-example',
        state: DiagnosisReferenceState.held,
      ),
    ),
  ),
  'proposal-only': _view(proposal: _proposal()),
  'outcome-unknown': _view(result: _result(), unknown: _unknown()),
  'unknown-foreign': _view(
    result: _result(),
    unknown: _unknown(scope: _scope(bike: 'other')),
  ),
  'busy-supported': _view(result: _result(), busy: true),
  'error-supported': _view(result: _result(), error: _error()),
  'error-foreign': _view(
    result: _result(),
    error: _error(scope: _scope(flow: 'other')),
  ),
};
Future<void> _prepareState(WidgetTester t, String state) async {
  if (state.startsWith('symptom-') || state.startsWith('danger-')) {
    await t.enterText(
      find.byKey(const ValueKey('symptom-input')),
      'Ön taraftan alışılmadık bir ses duydum.',
    );
    await _tap(
      t,
      find.byKey(
        ValueKey(
          'safety-${state == 'danger-no'
              ? 'no'
              : state == 'danger-unsure'
              ? 'unsure'
              : 'yes'}',
        ),
      ),
    );
    expect(_enabled(t, DiagnosisRequestKind.symptom), state == 'symptom-yes');
  }
  if (state == 'check-unsure')
    await _tap(t, find.byKey(const ValueKey('choice-unsure')));
  if (state == 'check-unsure')
    expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  testWidgets('Belirsiz istek uyarısı olumlu kaynak sonucundan önce görünür', (
    t,
  ) async {
    await _pump(t, _view(result: _result(), unknown: _unknown()));
    expect(
      t.getTopLeft(find.text('İsteğin sonucu henüz belli değil')).dy,
      lessThan(t.getTopLeft(find.text('Bulgular bir yönü destekliyor')).dy),
    );
  });
  test('Boş kimlik ve kaynak reddedilir; seçenek ve kaynak listeleri dış mutasyondan korunur', () {
    expect(() => _scope(bike: ' '), throwsArgumentError);
    expect(() => _ref(' ', 'result'), throwsArgumentError);
    expect(() => _ref('purpose', 'result', request: ' '), throwsArgumentError);
    expect(() => _ref('purpose', 'result', source: ''), throwsArgumentError);
    expect(() => _check(request: ''), throwsArgumentError);
    expect(() => _result(request: ''), throwsArgumentError);
    expect(() => _proposal(request: ''), throwsArgumentError);
    expect(() => _unknown(request: ''), throwsArgumentError);
    expect(() => _error(request: ''), throwsArgumentError);
    expect(
      () => DiagnosisChoice(id: 'unsure', label: 'Yanlış kopya'),
      throwsArgumentError,
    );
    expect(() => _check(choices: []), throwsArgumentError);
    expect(
      () => _check(
        choices: [
          DiagnosisChoice(id: 'a', label: 'a'),
          DiagnosisChoice(id: 'a', label: 'b'),
        ],
      ),
      throwsArgumentError,
    );
    final choices = [DiagnosisChoice(id: 'a', label: 'Örnek')];
    final check = _check(choices: choices);
    choices.clear();
    expect(check.choices, hasLength(1));
    expect(() => check.choices.clear(), throwsUnsupportedError);
    final result = _result();
    expect(() => result.known.clear(), throwsUnsupportedError);
    expect(() => result.checks.clear(), throwsUnsupportedError);
  });
  testWidgets(
    'Sade belirti boşken ve güvenlik yanıtı yokken niyet gönderilmez',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(t, _view(stage: DiagnosisStage.symptom, record: sent.add));
      expect(
        find.text('Teknik terim kullanmadan anlatabilirsin.'),
        findsOneWidget,
      );
      expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
      await t.enterText(find.byKey(const ValueKey('symptom-input')), '  ');
      await _tap(t, find.byKey(const ValueKey('safety-yes')));
      expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
      expect(sent, isEmpty);
    },
  );
  testWidgets(
    'Olumlu kullanıcı beyanı yalnız güncel belirti isteği taşır; fiziksel sonuç üretmez',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(t, _view(stage: DiagnosisStage.symptom, record: sent.add));
      await t.enterText(
        find.byKey(const ValueKey('symptom-input')),
        '  Ses duydum.  ',
      );
      await _tap(t, find.byKey(const ValueKey('safety-yes')));
      expect(_enabled(t, DiagnosisRequestKind.symptom), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.symptom));
      expect(sent.single.kind, DiagnosisRequestKind.symptom);
      expect(sent.single.symptom, 'Ses duydum.');
      expect(sent.single.safety, DiagnosisSafety.yes);
      expect(sent.single.scope.matches(_scope()), isTrue);
      expect(sent.single.requestId, _request);
      expect(sent.single.guideId, isNull);
      expect(find.textContaining('güvenliği kanıtlamaz'), findsOneWidget);
    },
  );
  testWidgets(
    'Hayır ve emin değilim tehlike sınırı normal belirti yolunu kapatır; güvenli destek bağımsızdır',
    (t) async {
      final sent = <DiagnosisRequest>[];
      for (final answer in ['no', 'unsure']) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(stage: DiagnosisStage.symptom, record: sent.add));
        await t.enterText(find.byKey(const ValueKey('symptom-input')), 'Ses');
        await _tap(t, find.byKey(ValueKey('safety-$answer')));
        expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
        expect(find.textContaining('tanıya devam etme'), findsOneWidget);
        expect(_enabled(t, DiagnosisRequestKind.safeSupport), isTrue);
        await _tap(t, _action(DiagnosisRequestKind.safeSupport));
      }
      expect(
        sent.map((v) => v.kind),
        everyElement(DiagnosisRequestKind.safeSupport),
      );
    },
  );
  testWidgets(
    'Tek kontrolün emin değilim yanıtı geçerlidir; fotoğraf zorunlu değildir',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(stage: DiagnosisStage.check, check: _check(), record: sent.add),
      );
      expect(find.text('Ses ne zaman oluyor?'), findsOneWidget);
      expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
      await _tap(t, find.byKey(const ValueKey('choice-unsure')));
      expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.observation));
      expect(sent.single.choiceId, 'unsure');
      expect(sent.single.checkId, 'check-example');
      expect(sent.single.checkRevision, 'question-r1');
      expect(sent.single.kind, DiagnosisRequestKind.observation);
      expect(sent.single.requestId, _request);
      expect(_action(DiagnosisRequestKind.photo), findsNothing);
    },
  );
  testWidgets(
    'Seçilen gerçek gözlem ayrı kimliğiyle taşınır; tek seçim diğerini kaldırır',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(stage: DiagnosisStage.check, check: _check(), record: sent.add),
      );
      await _tap(t, find.byKey(const ValueKey('choice-braking')));
      await _tap(t, find.byKey(const ValueKey('choice-released')));
      expect(find.text('Seçili: Fren bırakıldığında da'), findsOneWidget);
      expect(find.text('Seçili: Yalnız fren yaparken'), findsNothing);
      await _tap(t, _action(DiagnosisRequestKind.observation));
      expect(sent.single.choiceId, 'released');
    },
  );
  testWidgets(
    'Eksik yanlış ve güncel olmayan soru kaynağı özel içeriği ve yanıt yolunu açmaz',
    (t) async {
      final checks = [
        _check(missing: true),
        for (final foreign in _foreign()) _check(scope: foreign),
        _check(request: 'other'),
        _check(authority: _ref('wrong-purpose', 'check-example/question-r1')),
        _check(authority: _ref('diagnosis-check', 'wrong-subject')),
        _check(
          authority: _ref(
            'diagnosis-check',
            'check-example/question-r1',
            request: 'old',
          ),
        ),
        _check(
          authority: _ref(
            'diagnosis-check',
            'check-example/question-r1',
            current: false,
          ),
        ),
        for (final state in [
          DiagnosisReferenceState.held,
          DiagnosisReferenceState.unknown,
        ])
          _check(
            authority: _ref(
              'diagnosis-check',
              'check-example/question-r1',
              state: state,
            ),
          ),
      ];
      for (final check in checks) {
        await _pump(t, _view(stage: DiagnosisStage.check, check: check));
        expect(find.text('Ses ne zaman oluyor?'), findsNothing);
        expect(_action(DiagnosisRequestKind.observation), findsNothing);
        expect(_enabled(t, DiagnosisRequestKind.safeSupport), isTrue);
      }
    },
  );
  testWidgets(
    'Eksik olumsuz belirsiz veya yabancı güvenlik beyanıyla gözlem seçilemez',
    (t) async {
      for (final declaration in [
        null,
        DiagnosisSafetyDeclaration(scope: _scope(), answer: DiagnosisSafety.no),
        DiagnosisSafetyDeclaration(
          scope: _scope(),
          answer: DiagnosisSafety.unsure,
        ),
        for (final s in _foreign())
          DiagnosisSafetyDeclaration(scope: s, answer: DiagnosisSafety.yes),
      ]) {
        await _pump(
          t,
          _view(
            stage: DiagnosisStage.check,
            check: _photoCheck(),
            safe: false,
            declaration: declaration,
          ),
        );
        await _tap(t, find.byKey(const ValueKey('choice-unsure')));
        expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.photo), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.safeSupport), isTrue);
      }
    },
  );
  testWidgets(
    'Değişen kapsam ve istek eski belirti ile güvenlik seçimini sıfırlar',
    (t) async {
      for (final s in _foreign()) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(stage: DiagnosisStage.symptom));
        await t.enterText(
          find.byKey(const ValueKey('symptom-input')),
          'Eski belirti',
        );
        await _tap(t, find.byKey(const ValueKey('safety-yes')));
        await _pump(t, _view(stage: DiagnosisStage.symptom, scope: s));
        expect(
          t.widget<EditableText>(find.byType(EditableText)).controller.text,
          isEmpty,
        );
        expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
      }
      await t.enterText(
        find.byKey(const ValueKey('symptom-input')),
        'Bir belirti',
      );
      await _tap(t, find.byKey(const ValueKey('safety-yes')));
      await _pump(
        t,
        _view(stage: DiagnosisStage.symptom, request: 'new-request'),
      );
      expect(
        t.widget<EditableText>(find.byType(EditableText)).controller.text,
        isEmpty,
      );
      expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
    },
  );
  testWidgets(
    'Soru revizyonu ve aynı kimlikli değişen anlam eski seçimi yeniden kullanmaz',
    (t) async {
      for (final next in [
        _check(revision: 'question-r2'),
        _check(question: 'Başka örnek gözlem?'),
        _check(
          choices: [DiagnosisChoice(id: 'braking', label: 'Değişmiş anlam')],
        ),
        _check(missing: true),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(stage: DiagnosisStage.check, check: _check()));
        await _tap(t, find.byKey(const ValueKey('choice-braking')));
        expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
        await _pump(t, _view(stage: DiagnosisStage.check, check: next));
        if (next.valid(_scope(), _request))
          expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
        expect(find.text('Seçili: Yalnız fren yaparken'), findsNothing);
      }
    },
  );
  testWidgets(
    'Desteklenmiş güncel sonuç yalnız doğrulanmış rehber önizlemesi niyeti üretir',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(t, _view(result: _result(), record: sent.add));
      expect(find.text('Bulgular bir yönü destekliyor'), findsOneWidget);
      expect(_enabled(t, DiagnosisRequestKind.preview), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.preview));
      expect(sent.single.kind, DiagnosisRequestKind.preview);
      expect(sent.single.resultId, 'result-example');
      expect(sent.single.guideId, 'guide-example');
      expect(sent.single.scope.matches(_scope()), isTrue);
      expect(sent.single.requestId, _request);
      expect(
        find.textContaining('doğrudan tamire başlama değildir'),
        findsOneWidget,
      );
      expect(find.textContaining('uygunluk ve hazırlık'), findsOneWidget);
    },
  );
  testWidgets(
    'Altı boyutun her birindeki eksik held unknown veya yanlış referans önizlemeyi kapatır',
    (t) async {
      for (final d in DiagnosisDimension.values) {
        final bad = <DiagnosisReference?>[
          null,
          for (final state in [
            DiagnosisReferenceState.held,
            DiagnosisReferenceState.unknown,
          ])
            _ref('diagnosis-${d.name}', 'result-example', state: state),
          _ref('diagnosis-${d.name}', 'result-example', current: false),
          _ref('wrong', 'result-example'),
          _ref('diagnosis-${d.name}', 'other'),
          _ref('diagnosis-${d.name}', 'result-example', request: 'other'),
          for (final s in _foreign())
            _ref('diagnosis-${d.name}', 'result-example', scope: s),
        ];
        for (final ref in bad) {
          await _pump(t, _view(result: _result(overrides: {d: ref})));
          expect(
            _enabled(t, DiagnosisRequestKind.preview),
            isFalse,
            reason: d.name,
          );
        }
      }
    },
  );
  testWidgets(
    'Yanlış güncel sonuç bağlamı amacı konusu ve isteği özel içeriği göstermez',
    (t) async {
      final bad = [
        for (final s in _foreign()) _result(scope: s),
        _result(request: 'other'),
        _result(missingAuthority: true),
        _result(authority: _ref('wrong', 'result-example')),
        _result(authority: _ref('diagnosis-result', 'other')),
        _result(
          authority: _ref(
            'diagnosis-result',
            'result-example',
            request: 'other',
          ),
        ),
        _result(
          authority: _ref('diagnosis-result', 'result-example', current: false),
        ),
        for (final s in _foreign())
          _result(
            authority: _ref('diagnosis-result', 'result-example', scope: s),
          ),
        for (final state in [
          DiagnosisReferenceState.held,
          DiagnosisReferenceState.unknown,
        ])
          _result(
            authority: _ref('diagnosis-result', 'result-example', state: state),
          ),
      ];
      for (final result in bad) {
        await _pump(t, _view(result: result));
        expect(find.text('Bulgular bir yönü destekliyor'), findsNothing);
        expect(find.textContaining('Kayıtlı örnek gözlem:'), findsNothing);
        expect(_action(DiagnosisRequestKind.preview), findsNothing);
      }
    },
  );
  testWidgets(
    'Salt beş öneri kategorisi ve yabancı öneri olumlu kaynak yerine geçmez',
    (t) async {
      for (final kind in DiagnosisProposalKind.values) {
        await _pump(t, _view(proposal: _proposal(kind: kind)));
        expect(find.text('Öneri, kesin sonuç değildir'), findsOneWidget);
        expect(_action(DiagnosisRequestKind.preview), findsNothing);
        expect(
          find.textContaining('AI önerisi tek başına onay'),
          findsOneWidget,
        );
      }
      for (final proposal in [
        for (final s in _foreign()) _proposal(scope: s),
        _proposal(request: 'other'),
        _proposal(current: false),
      ]) {
        await _pump(t, _view(proposal: proposal));
        expect(
          find.text('Örnek öneri: bir gözlem daha gerekebilir.'),
          findsNothing,
        );
      }
    },
  );
  testWidgets(
    'Boş destek gözlemi veya eksik rehber hedefi olumlu sonuçtan yol üretmez',
    (t) async {
      for (final result in [
        _result(known: []),
        _result(guide: null),
        _result(guideLabel: null),
      ]) {
        await _pump(t, _view(result: result));
        expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
      }
      await _pump(t, _view(result: _result(), safe: false));
      expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
    },
  );
  testWidgets(
    'Çözülemeyen sonuç bilinen ve bilinmeyeni korur; ek gözlem ve özet tamir sayılmaz',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(
          result: _result(outcome: DiagnosisOutcome.unresolved),
          record: sent.add,
        ),
      );
      expect(find.text('Şu ana kadar bilinenler'), findsOneWidget);
      expect(find.text('Henüz bilinmeyenler'), findsOneWidget);
      expect(find.textContaining('rastgele parça değiştirme'), findsOneWidget);
      expect(_action(DiagnosisRequestKind.preview), findsNothing);
      await _tap(t, _action(DiagnosisRequestKind.moreObservation));
      await _tap(t, _action(DiagnosisRequestKind.summary));
      expect(sent.map((v) => v.kind), [
        DiagnosisRequestKind.moreObservation,
        DiagnosisRequestKind.summary,
      ]);
      expect(sent.last.resultId, 'result-example');
      expect(sent.every((v) => v.guideId == null), isTrue);
    },
  );
  testWidgets(
    'Olumsuz sonuçta ek gözlem fiziksel devamı açmaz; destek ve özet okunabilir',
    (t) async {
      await _pump(t, _view(result: _result(outcome: DiagnosisOutcome.held)));
      expect(find.text('Tanıya devam şu anda kapalı'), findsOneWidget);
      expect(_enabled(t, DiagnosisRequestKind.moreObservation), isFalse);
      expect(_enabled(t, DiagnosisRequestKind.summary), isTrue);
      expect(_enabled(t, DiagnosisRequestKind.safeSupport), isTrue);
    },
  );
  testWidgets('Basit gözlem fotoğraf yolu istemez', (t) async {
    await _pump(t, _view(stage: DiagnosisStage.check, check: _check()));
    expect(_action(DiagnosisRequestKind.photo), findsNothing);
  });
  testWidgets('Fotoğraf yalnız ayrı güncel istek taşır ve kontrolü onaylamaz', (
    t,
  ) async {
    final sent = <DiagnosisRequest>[];
    await _pump(
      t,
      _view(
        stage: DiagnosisStage.check,
        check: _photoCheck(),
        record: sent.add,
      ),
    );
    expect(find.textContaining('Fotoğraf isteğe bağlıdır'), findsOneWidget);
    await _tap(t, _action(DiagnosisRequestKind.photo));
    expect(sent.single.kind, DiagnosisRequestKind.photo);
    expect(sent.single.scope.matches(_scope()), isTrue);
    expect(sent.single.requestId, _request);
    expect(sent.single.checkId, 'check-example');
    expect(sent.single.checkRevision, 'question-r1');
    expect(sent.single.choiceId, isNull);
    expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
  });
  testWidgets('Fotoğrafın yararlılık kaynağı tam güncel soruya bağlıdır', (
    t,
  ) async {
    for (final request in [
      for (final scope in _foreign()) _photo(scope: scope),
      _photo(request: 'foreign-request'),
      _photo(check: 'foreign-check'),
      _photo(revision: 'old-question'),
      _photo(useful: false),
      _photo(missing: true),
      for (final scope in _foreign())
        _photo(
          authority: _ref(
            'diagnosis-photo',
            'check-example/question-r1',
            scope: scope,
          ),
        ),
      _photo(
        authority: _ref(
          'diagnosis-photo',
          'check-example/question-r1',
          request: 'foreign-request',
        ),
      ),
      _photo(authority: _ref('diagnosis-check', 'check-example/question-r1')),
      _photo(authority: _ref('diagnosis-photo', 'other-check/question-r1')),
      _photo(authority: _ref('diagnosis-photo', 'check-example/old-question')),
      _photo(
        authority: _ref(
          'diagnosis-photo',
          'check-example/question-r1',
          current: false,
        ),
      ),
      for (final state in [
        DiagnosisReferenceState.held,
        DiagnosisReferenceState.unknown,
      ])
        _photo(
          authority: _ref(
            'diagnosis-photo',
            'check-example/question-r1',
            state: state,
          ),
        ),
    ]) {
      await _pump(
        t,
        _view(
          stage: DiagnosisStage.check,
          check: _photoCheck(request: request),
        ),
      );
      expect(_action(DiagnosisRequestKind.photo), findsNothing);
      expect(
        find.textContaining('görsel bilgiyi yararlı buluyor'),
        findsNothing,
      );
      expect(find.textContaining('Fotoğraf bu gözleme'), findsNothing);
      await _tap(t, find.byKey(const ValueKey('choice-unsure')));
      expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
    }
  });
  testWidgets(
    'Önceki fotoğraf mevcutsa yeniden istenmez ve gözlem tamamlanmaz',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(
          stage: DiagnosisStage.check,
          check: _photoCheck(request: _photo(alreadyProvided: true)),
          record: sent.add,
        ),
      );
      expect(_action(DiagnosisRequestKind.photo), findsNothing);
      expect(
        find.textContaining('Yeniden fotoğraf istenmiyor'),
        findsOneWidget,
      );
      expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
      expect(sent, isEmpty);
      await _tap(t, find.byKey(const ValueKey('choice-unsure')));
      expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.observation));
      expect(sent.single.kind, DiagnosisRequestKind.observation);
      expect(sent.single.choiceId, 'unsure');
    },
  );
  testWidgets('Güncel fotoğraf nedeni hata ve işleyici yokluğunu aşamaz', (
    t,
  ) async {
    for (final view in [
      _view(stage: DiagnosisStage.check, check: _photoCheck(), error: _error()),
      _view(stage: DiagnosisStage.check, check: _photoCheck(), handlers: {}),
      _view(stage: DiagnosisStage.check, check: _photoCheck(), busy: true),
    ]) {
      await _pump(t, view);
      expect(_enabled(t, DiagnosisRequestKind.photo), isFalse);
      expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
    }
  });
  testWidgets(
    'OUTCOME_UNKNOWN olumlu eski değerlendirmeyi başarı veya yeniden uygulama saymaz',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(result: _result(), unknown: _unknown(), record: sent.add),
      );
      expect(find.text('İsteğin sonucu henüz belli değil'), findsOneWidget);
      expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
      expect(_enabled(t, DiagnosisRequestKind.reconcile), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.reconcile));
      expect(sent.single.kind, DiagnosisRequestKind.reconcile);
      expect(sent.single.originalKind, DiagnosisRequestKind.observation);
      expect(sent.single.requestId, _request);
      expect(sent.single.scope.matches(_scope()), isTrue);
      expect(sent.single.guideId, isNull);
      expect(find.textContaining('İşlem tekrar uygulanmaz'), findsOneWidget);
    },
  );
  testWidgets(
    'Yabancı veya eski belirsiz istek uzlaştırma için yeniden kullanılmaz',
    (t) async {
      for (final unknown in [
        for (final s in _foreign()) _unknown(scope: s),
        _unknown(request: 'other'),
      ]) {
        final sent = <DiagnosisRequest>[];
        await _pump(
          t,
          _view(result: _result(), unknown: unknown, record: sent.add),
        );
        expect(_enabled(t, DiagnosisRequestKind.reconcile), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
        await _tap(t, _action(DiagnosisRequestKind.safeSupport));
        expect(sent.single.kind, DiagnosisRequestKind.safeSupport);
        expect(
          find.textContaining('Yabancı istek yeniden kullanılmaz'),
          findsOneWidget,
        );
      }
    },
  );
  testWidgets(
    'Belirsiz veya işlenen gözlemde yeni seçim yanıt ve fotoğraf kapalıdır',
    (t) async {
      for (final busy in [false, true]) {
        await _pump(
          t,
          _view(
            stage: DiagnosisStage.check,
            check: _photoCheck(),
            unknown: _unknown(),
            busy: busy,
          ),
        );
        await _tap(t, find.byKey(const ValueKey('choice-unsure')));
        expect(_enabled(t, DiagnosisRequestKind.observation), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.photo), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.reconcile), !busy);
        expect(_enabled(t, DiagnosisRequestKind.exit), isTrue);
      }
    },
  );
  testWidgets(
    'Hata son istekten söz eder; olumlu kaynak ile fiziksel sonuç çelişkisi üretmez',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(result: _result(), error: _error(), record: sent.add),
      );
      expect(find.text('Bulgular bir yönü destekliyor'), findsOneWidget);
      expect(find.text('Son isteğin sonucu doğrulanamadı'), findsOneWidget);
      expect(
        find.textContaining('yapıldığını ya da yapılmadığını kanıtlamaz'),
        findsOneWidget,
      );
      expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
      await _tap(t, _action(DiagnosisRequestKind.reconcile));
      expect(sent.single.originalKind, DiagnosisRequestKind.observation);
      expect(sent.single.kind, DiagnosisRequestKind.reconcile);
    },
  );
  testWidgets(
    'Yabancı hata ayrıntısı gizlenir ve hata kontrolü yabancı istekle yapılmaz',
    (t) async {
      for (final error in [
        for (final s in _foreign()) _error(scope: s),
        _error(request: 'other'),
      ]) {
        await _pump(t, _view(result: _result(), error: error));
        expect(find.textContaining('Örnek yanıt alınamadı'), findsNothing);
        expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.reconcile), isFalse);
        expect(_enabled(t, DiagnosisRequestKind.exit), isTrue);
      }
    },
  );
  testWidgets(
    'Busy ve handler yokluğu normal yolu açmaz; ücret ve normal izin olmadan çıkış bilgisi erişilir',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(t, _view(result: _result(), busy: true, record: sent.add));
      expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
      expect(_enabled(t, DiagnosisRequestKind.safeSupport), isTrue);
      await _tap(t, _action(DiagnosisRequestKind.exit));
      expect(sent.single.kind, DiagnosisRequestKind.exit);
      await _pump(t, _view(result: _result(), handlers: {}));
      for (final kind in [
        DiagnosisRequestKind.preview,
        DiagnosisRequestKind.summary,
        DiagnosisRequestKind.safeSupport,
        DiagnosisRequestKind.exit,
      ])
        expect(_enabled(t, kind), isFalse);
      expect(
        find.textContaining('ücret ve normal devam onayı gerektirmez'),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Gerçek klavye seçim ve gönderimi doğru taşır; disabled düğme etkinlik üretmez',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(
        t,
        _view(stage: DiagnosisStage.check, check: _check(), record: sent.add),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(find.text('Seçili: Yalnız fren yaparken'), findsOneWidget);
      for (var i = 0; i < 4; i++) {
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
      }
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(sent.single.kind, DiagnosisRequestKind.observation);
      expect(sent.single.choiceId, 'braking');
      await _pump(
        t,
        _view(
          stage: DiagnosisStage.check,
          check: _check(),
          busy: true,
          record: sent.add,
        ),
      );
      await _tap(t, _action(DiagnosisRequestKind.observation));
      expect(sent, hasLength(1));
    },
  );
  testWidgets(
    'Aynı eylemin etiketi değişirken odak korunur ve Enter yeni hedefi ister',
    (t) async {
      final sent = <DiagnosisRequest>[];
      await _pump(t, _view(result: _result(), record: sent.add));
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      final node = FocusManager.instance.primaryFocus;
      await _pump(
        t,
        _view(
          result: _result(guide: 'new-guide', guideLabel: 'Yeni örnek rehber'),
          record: sent.add,
        ),
      );
      expect(FocusManager.instance.primaryFocus, same(node));
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(sent.single.guideId, 'new-guide');
    },
  );
  testWidgets('Disabled Semantics ve canlı belirsizlik alanı görünürdür', (
    t,
  ) async {
    final semantics = t.ensureSemantics();
    try {
      await _pump(t, _view(result: _result(), unknown: _unknown()));
      final button = t.getSemantics(
        find
            .descendant(
              of: _action(DiagnosisRequestKind.preview),
              matching: find.byType(Semantics),
            )
            .first,
      );
      expect(
        button.getSemanticsData().flagsCollection.isEnabled,
        ui.Tristate.isFalse,
      );
      final statuses = t
          .widgetList<Semantics>(find.byType(Semantics))
          .where((v) => v.properties.liveRegion == true);
      expect(statuses, isNotEmpty);
    } finally {
      semantics.dispose();
    }
  });
  testWidgets(
    'Gerçek boyanmış metin ve odak renkleri kontrast sınırını geçer',
    (t) async {
      double luminance(Color c) => c.computeLuminance();
      double contrast(Color a, Color b) {
        final x = luminance(a), y = luminance(b);
        return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
      }

      await _pump(t, _view(result: _result()));
      for (final kind in [
        DiagnosisRequestKind.preview,
        DiagnosisRequestKind.summary,
        DiagnosisRequestKind.safeSupport,
      ]) {
        final paragraph = t.renderObject<RenderParagraph>(
          find
              .descendant(of: _action(kind), matching: find.byType(RichText))
              .first,
        );
        final color = (paragraph.text as TextSpan).style!.color!;
        final container = t.widget<Container>(
          find
              .descendant(of: _action(kind), matching: find.byType(Container))
              .first,
        );
        final bg =
            (container.decoration as BoxDecoration).color ??
            const Color(0xFFF7FAFC);
        expect(contrast(color, bg), greaterThanOrEqualTo(4.5));
      }
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      final container = t.widget<Container>(
        find
            .descendant(
              of: _action(DiagnosisRequestKind.preview),
              matching: find.byType(Container),
            )
            .first,
      );
      final decoration = container.decoration as BoxDecoration;
      final border = decoration.border! as Border;
      expect(border.top.width, 3);
      expect(
        contrast(border.top.color, decoration.color!),
        greaterThanOrEqualTo(3),
      );
    },
  );
  testWidgets(
    'Bütün durumlar küçük genişlik ve büyük Türkçe yazıda kaydırılır; hedefler en az 52',
    (t) async {
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.resetDevicePixelRatio);
      addTearDown(t.view.resetPhysicalSize);
      for (final width in [320.0, 390.0, 768.0])
        for (final scale in [1.0, 2.0, 3.0])
          for (final entry in _states().entries) {
            await t.pumpWidget(const SizedBox());
            t.view.physicalSize = Size(width, 844);
            await _pump(t, entry.value, scale: scale);
            await _prepareState(t, entry.key);
            final pos = t
                .state<ScrollableState>(find.byType(Scrollable).first)
                .position;
            pos.jumpTo(pos.maxScrollExtent);
            await t.pumpAndSettle();
            expect(
              t.takeException(),
              isNull,
              reason: '${entry.key}/$width/$scale',
            );
            for (final f in find.byType(FocusableActionDetector).evaluate())
              expect(
                (f.findRenderObject()! as RenderBox).size.height,
                greaterThanOrEqualTo(52),
              );
            expect(pos.pixels, pos.maxScrollExtent);
            expect(_action(DiagnosisRequestKind.exit), findsOneWidget);
          }
    },
  );
  final capture = Platform.environment['KAVRIVA_DIAGNOSIS_PREVIEW'];
  if (capture != null)
    testWidgets(
      'Capture genuine complete diagnosis views and explicit uncertainty',
      (t) async {
        final fontPath = Platform.environment['KAVRIVA_DIAGNOSIS_FONT'];
        String? font;
        if (fontPath != null) {
          font = 'DiagnosisPreview';
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
        for (final entry in _states().entries) {
          await t.pumpWidget(const SizedBox());
          final key = GlobalKey();
          await t.pumpWidget(
            _app(
              RepaintBoundary(key: key, child: entry.value),
              font: font,
            ),
          );
          await t.pumpAndSettle();
          await _prepareState(t, entry.key);
          if (entry.key == 'symptom-yes')
            expect(_enabled(t, DiagnosisRequestKind.symptom), isTrue);
          if (entry.key.startsWith('danger-'))
            expect(_enabled(t, DiagnosisRequestKind.symptom), isFalse);
          if (entry.key == 'check-unsure')
            expect(_enabled(t, DiagnosisRequestKind.observation), isTrue);
          if (entry.key == 'check' || entry.key == 'check-unsure')
            expect(_action(DiagnosisRequestKind.photo), findsNothing);
          if (entry.key == 'photo-useful')
            expect(_enabled(t, DiagnosisRequestKind.photo), isTrue);
          if (entry.key.startsWith('photo-') && entry.key != 'photo-useful')
            expect(_action(DiagnosisRequestKind.photo), findsNothing);
          if (entry.key == 'supported')
            expect(_enabled(t, DiagnosisRequestKind.preview), isTrue);
          if (entry.key == 'outcome-unknown') {
            expect(_enabled(t, DiagnosisRequestKind.preview), isFalse);
            expect(_enabled(t, DiagnosisRequestKind.reconcile), isTrue);
          }
          final pos = t
              .state<ScrollableState>(find.byType(Scrollable).first)
              .position;
          pos.jumpTo(0);
          await t.pumpAndSettle();
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
