import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/history.dart';
import 'package:kavriva_shell/record_dispute.dart';

// Açık sunum fixture'ları; üretim kimliği/kanıt doğrulaması/yazıcı değildir.
const _request = 'record-example-request';
HistoryScope _scope({
  String bike = 'bike-example',
  String revision = 'catalog-r1',
}) => HistoryScope(
  motorcycleId: bike,
  contextRevision: 'context-r1',
  catalogId: 'record-catalog',
  catalogRevision: revision,
  motorcycleLabel: 'Örnek motosiklet A · kullanıcı beyanı',
);
HistoryReference _ref(
  String purpose,
  String subject, {
  HistoryScope? scope,
  String request = _request,
  bool current = true,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
}) => HistoryReference(
  scope: scope ?? _scope(),
  requestId: request,
  purpose: purpose,
  subjectId: subject,
  source: 'Örnek kaynak · test verisi',
  version: 'example-r1',
  location: 'Örnek kayıt bölümü',
  checkedAt: '2026-10-06',
  reason: 'Yalnız sunum testine ait örnek karar.',
  current: current,
  state: state,
);
RecordDraft _draft({
  String id = 'draft-example',
  String revision = 'draft-r1',
  String title = 'Yağ bakımı',
  String date = '2026-10-04',
  String odometer = '12500',
  RecordActor? actor = RecordActor.service,
  RecordOutcome? outcome = RecordOutcome.partial,
  String note = 'Filtre değişimi açık kaldı.',
  String service = 'Örnek dış servis · örnek belge bilgisi',
  bool evidence = true,
}) => RecordDraft(
  id: id,
  revision: revision,
  title: title,
  performedOn: date,
  odometer: odometer,
  actor: actor,
  outcome: outcome,
  note: note,
  serviceInfo: service,
  evidenceLabels: evidence
      ? ['Örnek servis belgesi · kullanıcı beyanı, incelenmedi']
      : [],
);
HistoryRecord _row({
  String id = 'case-example',
  String revision = 'record-r1',
  String eval = 'eval-r1',
  String classification = 'class-r1',
  String actor = 'Motosiklet sahibi · örnek aktör',
  String outcome = 'İki ayrı iddia ve kanıt kaynağı var.',
  HistoryMeaning meaning = HistoryMeaning.disputed,
  bool risk = false,
  bool versions = false,
  bool privateVersion = false,
  bool missingVersionRead = false,
  bool noEvaluation = false,
  bool noSource = false,
  Set<HistoryField> denied = const {},
  HistoryScope? scope,
  String request = _request,
}) {
  final own = scope ?? _scope();
  final values = <HistoryField, String>{
    HistoryField.title: risk
        ? 'Fren bakımı · örnek önemli iddia'
        : 'Yağ bakımı',
    HistoryField.date: '04.10.2026 · örnek tarih',
    HistoryField.actor: actor,
    HistoryField.outcome: outcome,
    HistoryField.source: 'Örnek bakım kaydı · test verisi',
    HistoryField.evidence: actor.contains('Dış servis')
        ? 'Örnek servis belgesi · incelenmedi'
        : 'Kullanıcı notu ve örnek fotoğraf · beyan',
    HistoryField.evaluation: meaning == HistoryMeaning.withdrawn
        ? 'Örnek kanıt geri çekildi; eski iz ve bağımsız kayıtlar korunur.'
        : meaning == HistoryMeaning.reviewed
        ? 'Örnek inceleme yalnız belirtilen iddia ve kanıt kapsamını destekliyor.'
        : meaning == HistoryMeaning.documented
        ? 'Belge bulunması işi kendiliğinden doğrulamaz.'
        : meaning == HistoryMeaning.reported
        ? 'Bu bilgi kullanıcı beyanıdır; işin yapıldığı doğrulanmadı.'
        : 'Sonuç beyanları çelişiyor; itiraz sürüyor, kullanılabilir sonuç belirlenmedi.',
    HistoryField.corrections: 'Eski ve yeni bilgi, zaman ve gerekçe korunur.',
    HistoryField.reviewer: 'Örnek inceleyen · test verisi',
    HistoryField.uncertainty:
        'İşçilik ve fiziksel güvenlik sonucu kesinleşmedi.',
    HistoryField.contact: 'PRIVATE_CONTACT_CANARY',
    HistoryField.notes: 'PRIVATE_NOTE_CANARY',
  };
  final initial = HistoryRevision(
    id: 'version-example',
    revision: 'version-r1',
    field: privateVersion ? HistoryField.contact : HistoryField.outcome,
    classificationRevision: 'version-class-r1',
    before: privateVersion
        ? 'OLD_PRIVATE_CANARY'
        : 'İşlem tamamlandı diye bildirildi.',
    after: privateVersion
        ? 'NEW_PRIVATE_CANARY'
        : 'İşlem kısmi kaldı diye açıklandı.',
    changedAt: '05.10.2026 · örnek düzeltme zamanı',
    reason: privateVersion
        ? 'PRIVATE_REASON_CANARY'
        : 'İlk beyanın kapsamı açıklandı.',
  );
  HistoryRecord build(
    List<HistoryRevision> revisions,
    Map<HistoryReadDimension, HistoryReference?> dims,
    Map<HistoryField, HistoryReference?> fields,
    HistoryReference? authority,
    HistoryReference? evaluation,
    HistoryReference? history,
  ) => HistoryRecord(
    scope: own,
    id: id,
    revision: revision,
    evaluationId: 'evaluation-example',
    evaluationRevision: eval,
    classificationRevision: classification,
    meaning: meaning,
    highRisk: risk,
    values: values,
    revisions: revisions,
    readDimensions: dims,
    fieldReferences: fields,
    authority: authority,
    evaluationAuthority: evaluation,
    revisionAuthority: history,
  );
  final seed = build(versions ? [initial] : [], {}, {}, null, null, null);
  final version = HistoryRevision(
    id: initial.id,
    revision: initial.revision,
    field: initial.field,
    classificationRevision: initial.classificationRevision,
    before: initial.before,
    after: initial.after,
    changedAt: initial.changedAt,
    reason: initial.reason,
    readAuthority: missingVersionRead
        ? null
        : _ref(
            'history-revision-field',
            '${seed.readSubject}/version:${initial.subject}',
            scope: own,
            request: request,
          ),
  );
  return build(
    versions ? [version] : [],
    {
      for (final d in HistoryReadDimension.values)
        d: _ref(
          'history-read',
          '${seed.readSubject}/${d.name}',
          scope: own,
          request: request,
        ),
    },
    {
      for (final f in HistoryField.values)
        f:
            denied.contains(f) ||
                f == HistoryField.contact ||
                f == HistoryField.notes
            ? null
            : _ref(
                'history-read-field',
                '${seed.readSubject}/${f.name}',
                scope: own,
                request: request,
              ),
    },
    noSource
        ? null
        : _ref('history-record', seed.subject, scope: own, request: request),
    noEvaluation
        ? null
        : _ref(
            'history-evaluation',
            seed.evaluationSubject,
            scope: own,
            request: request,
          ),
    _ref(
      'history-revisions',
      seed.revisionSubject,
      scope: own,
      request: request,
    ),
  );
}

RecordDispute _dispute({
  HistoryRecord? row,
  bool noSource = false,
  bool noEvaluation = false,
  bool own = true,
  bool evidenceRead = true,
  bool noClaims = false,
  bool duplicateClaims = false,
  HistoryScope? scope,
  String request = _request,
}) {
  final ownScope = scope ?? _scope();
  final target =
      row ??
      _row(
        scope: ownScope,
        request: request,
        outcome: noClaims
            ? 'Bu kaynakta karşılaştırılabilir iddia sunulmadı.'
            : 'İki ayrı iddia ve kanıt kaynağı var.',
      );
  final claims = noClaims
      ? <HistoryRecord>[]
      : [
          _row(
            id: 'owner-claim',
            actor: 'Motosiklet sahibi · örnek aktör',
            outcome: 'İşlem kısmi kaldı.',
            meaning: HistoryMeaning.reported,
            scope: ownScope,
            request: request,
          ),
          _row(
            id: duplicateClaims ? 'owner-claim' : 'service-claim',
            actor: 'Dış servis · örnek aktör',
            outcome: 'İşlem tamamlandı diye bildirildi.',
            meaning: HistoryMeaning.documented,
            scope: ownScope,
            request: request,
          ),
        ];
  final seeds = [
    RecordEvidence(
      id: 'own-evidence',
      revision: 'evidence-r1',
      classificationRevision: 'evidence-class-r1',
      label: 'Kendi örnek fotoğrafım',
    ),
    RecordEvidence(
      id: 'service-evidence',
      revision: 'evidence-r1',
      classificationRevision: 'evidence-class-r1',
      label: 'Dış servisin örnek belgesi',
    ),
  ];
  final seed = RecordDispute(target: target, claims: claims, evidence: seeds);
  final evidence = [
    for (final e in seeds)
      RecordEvidence(
        id: e.id,
        revision: e.revision,
        classificationRevision: e.classificationRevision,
        label: e.label,
        readAuthority: evidenceRead
            ? _ref(
                'record-evidence-read',
                '${seed.subject}/${e.subject}',
                scope: ownScope,
                request: request,
              )
            : null,
        ownershipAuthority: own && e.id == 'own-evidence'
            ? _ref(
                'record-own-evidence',
                '${seed.subject}/${e.subject}',
                scope: ownScope,
                request: request,
              )
            : null,
      ),
  ];
  return RecordDispute(
    target: target,
    claims: claims,
    evidence: evidence,
    authority: noSource
        ? null
        : _ref(
            'record-dispute',
            seed.subject,
            scope: ownScope,
            request: request,
          ),
    evaluationAuthority: noEvaluation
        ? null
        : _ref(
            'record-dispute-evaluation',
            seed.subject,
            scope: ownScope,
            request: request,
          ),
  );
}

RecordSnapshot _snapshot({
  RecordDraft? draft,
  RecordDispute? dispute,
  HistoryScope? scope,
  String request = _request,
  bool noDraftSource = false,
  bool inactive = false,
  bool stale = false,
  bool held = false,
  HistoryOrigin origin = HistoryOrigin.canonicalSnapshot,
  HistoryReadDimension? deniedRead,
  String? deniedField,
  RecordEffectDimension? deniedEffect,
  Map<RecordAction, Map<RecordEffectDimension, HistoryReference?>>? effects,
}) {
  final own = scope ?? _scope(),
      d = draft ?? _draft(),
      caseData = dispute ?? _dispute(scope: scope, request: request);
  final grants =
      <RecordAction, Map<RecordEffectDimension, HistoryReference?>>{};
  for (final action in [
    RecordAction.saveStandalone,
    RecordAction.addDraftEvidence,
    RecordAction.addEvidence,
    RecordAction.proposeCorrection,
    RecordAction.withdrawOwnEvidence,
  ]) {
    final subject =
        action == RecordAction.saveStandalone ||
            action == RecordAction.addDraftEvidence
        ? d.subject
        : action == RecordAction.withdrawOwnEvidence
        ? '${caseData.subject}/${caseData.evidence.first.subject}'
        : caseData.subject;
    grants[action] = {
      for (final dim in RecordEffectDimension.values)
        dim: dim == deniedEffect
            ? null
            : _ref(
                'record-effect',
                '${action.name}/$subject/${dim.name}',
                scope: own,
                request: request,
              ),
    };
  }
  return RecordSnapshot(
    scope: own,
    requestId: request,
    origin: origin,
    draft: d,
    dispute: caseData,
    draftAuthority: noDraftSource
        ? null
        : _ref(
            'record-draft',
            d.subject,
            scope: own,
            request: request,
            current: !stale,
            state: held
                ? HistoryReferenceState.held
                : HistoryReferenceState.confirmed,
          ),
    draftReadDimensions: {
      for (final dim in HistoryReadDimension.values)
        dim: dim == deniedRead
            ? null
            : _ref(
                'record-draft-read',
                '${d.subject}/${dim.name}',
                scope: own,
                request: request,
              ),
    },
    draftFieldReferences: {
      for (final f in [
        'title',
        'date',
        'odometer',
        'actor',
        'outcome',
        'note',
        'service',
        'evidence',
      ])
        f: f == deniedField
            ? null
            : _ref(
                'record-draft-field',
                '${d.subject}/$f',
                scope: own,
                request: request,
              ),
    },
    effects: effects ?? grants,
    inactiveMotorcycle: inactive,
  );
}

RecordDisputeView _view({
  RecordPage page = RecordPage.standalone,
  RecordSnapshot? snapshot,
  bool missing = false,
  bool noHandler = false,
  RecordPhase phase = RecordPhase.idle,
  HistoryScope? scope,
  String request = _request,
  HistoryReference? receipt,
  ValueChanged<RecordIntent>? record,
  ValueChanged<RecordDraftChange>? change,
  Key? key,
}) => RecordDisputeView(
  key: key,
  scope: scope ?? _scope(),
  requestId: request,
  page: page,
  snapshot: missing ? null : snapshot ?? _snapshot(),
  phase: phase,
  receipt: receipt,
  onIntent: noHandler ? null : record ?? (_) {},
  onDraftChanged: change,
);

class _Input extends InheritedWidget {
  const _Input({
    required this.content,
    required this.scale,
    this.font,
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
      child: RepaintBoundary(
        key: const ValueKey('record-capture'),
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: input.font,
            color: const Color(0xFF172033),
          ),
          child: input.content,
        ),
      ),
    );
  }
}

Future<void> _pump(
  WidgetTester t,
  Widget content, {
  double width = 390,
  double scale = 1,
  String? font,
}) async {
  t.view.physicalSize = Size(width, 844);
  t.view.devicePixelRatio = 1;
  await t.pumpWidget(
    _Input(
      content: content,
      scale: scale,
      font: font,
      child: WidgetsApp(
        color: const Color(0xFFFFFFFF),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (_) =>
            PageRouteBuilder<void>(pageBuilder: (_, __, ___) => const _Scene()),
      ),
    ),
  );
  await t.pumpAndSettle();
}

Future<void> _tap(WidgetTester t, String key) async {
  final finder = find.byKey(ValueKey(key));
  await t.ensureVisible(finder);
  await t.pumpAndSettle();
  await t.tap(finder);
  await t.pumpAndSettle();
}

VoidCallback? _callback(WidgetTester t, String key) =>
    (t.widget(find.byKey(ValueKey(key))) as dynamic).onPressed as VoidCallback?;
String _text(WidgetTester t) => [
  ...t
      .widgetList<Text>(find.byType(Text))
      .map((w) => w.data ?? w.textSpan?.toPlainText() ?? ''),
  ...t
      .widgetList<EditableText>(find.byType(EditableText))
      .map((w) => w.controller.text),
].join('\n');
ScrollableState _scroll(WidgetTester t) => t.state<ScrollableState>(
  find
      .descendant(
        of: find.byKey(const ValueKey('record-scroll')),
        matching: find.byType(Scrollable),
      )
      .first,
);

Map<String, RecordDisputeView> _cases() {
  final valid = _draft(), data = _dispute();
  final long = _draft(
    title: 'Rehber dışında gerçekleştirilen bakımın kapsamını ve açık kalan fiziksel işi açıklayan uzun Türkçe kullanıcı beyanı',
    note: 'Filtrenin değişimi tamamlanmadı; kaynaktaki belirsizlik korunacak. Bu açıklama fiziksel güvenliği veya kusursuz işçiliği kanıtlamaz.',
  );
  return {
    'form-self': _view(
      snapshot: _snapshot(
        draft: _draft(
          actor: RecordActor.self,
          outcome: RecordOutcome.completed,
          evidence: false,
        ),
      ),
    ),
    'form-hobby': _view(
      snapshot: _snapshot(
        draft: _draft(actor: RecordActor.hobby, evidence: false),
      ),
    ),
    'form-service': _view(),
    'form-unresolved': _view(
      snapshot: _snapshot(draft: _draft(outcome: RecordOutcome.unresolved)),
    ),
    'form-empty': _view(
      snapshot: _snapshot(
        draft: _draft(
          title: '',
          date: '',
          odometer: '',
          actor: null,
          outcome: null,
          note: '',
          service: '',
          evidence: false,
        ),
      ),
    ),
    'form-invalid-date': _view(
      snapshot: _snapshot(draft: _draft(date: '2026-02-30')),
    ),
    'form-edited': _view(),
    'form-sent': _view(),
    'form-no-handler': _view(noHandler: true),
    'form-no-source': _view(snapshot: _snapshot(noDraftSource: true)),
    'form-stale': _view(snapshot: _snapshot(stale: true)),
    'form-held': _view(snapshot: _snapshot(held: true)),
    'form-foreign': _view(
      snapshot: _snapshot(scope: _scope(bike: 'other')),
    ),
    'form-copy': _view(
      snapshot: _snapshot(origin: HistoryOrigin.historicalCopy),
    ),
    'form-inactive': _view(snapshot: _snapshot(inactive: true)),
    'form-submitting': _view(phase: RecordPhase.submitting),
    'form-failed': _view(phase: RecordPhase.failed),
    'form-unknown': _view(phase: RecordPhase.outcomeUnknown),
    'form-recorded': _view(
      phase: RecordPhase.recorded,
      receipt: _ref('record-result', valid.subject),
    ),
    'form-unproven-result': _view(phase: RecordPhase.recorded),
    'form-long': _view(snapshot: _snapshot(draft: long)),
    'dispute-unresolved': _view(page: RecordPage.dispute),
    'dispute-reviewed': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(
        dispute: _dispute(row: _row(meaning: HistoryMeaning.reviewed)),
      ),
    ),
    'dispute-withdrawn': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(
        dispute: _dispute(row: _row(meaning: HistoryMeaning.withdrawn)),
      ),
    ),
    'dispute-highrisk': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(row: _row(risk: true))),
    ),
    'dispute-versions': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(row: _row(versions: true))),
    ),
    'dispute-private-version': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(
        dispute: _dispute(row: _row(versions: true, privateVersion: true)),
      ),
    ),
    'dispute-no-evaluation': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(noEvaluation: true)),
    ),
    'dispute-no-source': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(noSource: true)),
    ),
    'dispute-field-denied': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(
        dispute: _dispute(row: _row(denied: {HistoryField.outcome})),
      ),
    ),
    'dispute-no-claims': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(noClaims: true)),
    ),
    'dispute-own-revoked': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(own: false)),
    ),
    'dispute-private-evidence': _view(
      page: RecordPage.dispute,
      snapshot: _snapshot(dispute: _dispute(evidenceRead: false)),
    ),
    'dispute-sent': _view(page: RecordPage.dispute),
    'dispute-submitting': _view(
      page: RecordPage.dispute,
      phase: RecordPhase.submitting,
    ),
    'dispute-failed': _view(
      page: RecordPage.dispute,
      phase: RecordPhase.failed,
    ),
    'dispute-unknown': _view(
      page: RecordPage.dispute,
      phase: RecordPhase.outcomeUnknown,
    ),
    'dispute-recorded': _view(
      page: RecordPage.dispute,
      phase: RecordPhase.recorded,
      receipt: _ref('record-result', data.subject),
    ),
    'dispute-unproven-result': _view(
      page: RecordPage.dispute,
      phase: RecordPhase.recorded,
    ),
    'missing-snapshot': _view(missing: true),
  };
}

Future<void> _prepare(WidgetTester t, String state) async {
  if (state == 'form-edited') {
    final f = find.byKey(const ValueKey('record-field-title'));
    await t.ensureVisible(f);
    await t.enterText(f, 'Kullanıcının güncel düzenlediği iş');
    await t.pumpAndSettle();
    expect(_callback(t, 'record-save'), isNull);
  }
  if (state == 'form-sent' || state == 'dispute-sent') {
    await _tap(t, state == 'form-sent' ? 'record-save' : 'record-add-evidence');
    expect(_text(t), contains('İstek gönderildi; sonuç bekleniyor'));
    expect(
      _callback(
        t,
        state == 'form-sent' ? 'record-save' : 'record-add-evidence',
      ),
      isNull,
    );
    expect(
      t
          .widgetList<Semantics>(find.byType(Semantics))
          .any((s) => s.properties.liveRegion == true),
      isTrue,
    );
  }
  if (state == 'dispute-versions' || state == 'dispute-private-version')
    await _tap(t, 'record-versions');
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  tearDown(() {
    TestWidgetsFlutterBinding.instance.platformDispatcher.clearAllTestValues();
  });
  test('değişmez alanlar ve kayıpsız kimlik bağları yetki üretmez', () {
    final d = _draft();
    expect(() => d.evidenceLabels.add('changed'), throwsUnsupportedError);
    final s = _snapshot();
    expect(() => s.effects.clear(), throwsUnsupportedError);
    expect(
      () => s.effects[RecordAction.saveStandalone]!.clear(),
      throwsUnsupportedError,
    );
    expect(() => _dispute().claims.clear(), throwsUnsupportedError);
    expect(() => _draft(id: ' '), throwsArgumentError);
    expect(
      _draft(id: 'a/b', revision: 'c').subject,
      isNot(_draft(id: 'a', revision: 'b/c').subject),
    );
    expect(
      _draft(id: String.fromCharCode(0xd800)).subject,
      isNot(_draft(id: '%uD800').subject),
    );
    expect(_draft(title: '', date: '', actor: null).validation, isNotNull);
    expect(_draft(date: '2026-02-30').validation, isNotNull);
    expect(_draft(odometer: '-1').validation, isNotNull);
    expect(_draft(odometer: '10000001').validation, isNotNull);
    expect(
      _draft(
        actor: RecordActor.hobby,
        note: '',
        outcome: RecordOutcome.partial,
      ).validation,
      isNotNull,
    );
    expect(_draft(service: '').validation, isNotNull);
  });
  testWidgets(
    'rehber dışı servis/hobi ve gerçek sonuçlar doğrulanmış işe yükselmez',
    (t) async {
      for (final actor in RecordActor.values) {
        await _pump(
          t,
          _view(
            key: ValueKey(actor),
            snapshot: _snapshot(draft: _draft(actor: actor)),
          ),
        );
        expect(_text(t), contains('rehber adımını tamamlamaz'));
        expect(_text(t), contains('otomatik doğrulamaz'));
        expect(_text(t), contains('Kısmi kaldı'));
        expect(_text(t), contains('Çözülemedi'));
        expect(_callback(t, 'record-save'), isNotNull);
      }
    },
  );
  testWidgets(
    'iki çelişen iddia ve kanıt ayrı kalır, sayaç ve kazanan uydurulmaz',
    (t) async {
      await _pump(t, _view(page: RecordPage.dispute));
      final text = _text(t);
      expect(text, contains('Henüz çözümlenmedi'));
      expect(text, contains('İşlem kısmi kaldı.'));
      expect(text, contains('İşlem tamamlandı diye bildirildi.'));
      expect(text, contains('Kullanıcı notu'));
      expect(text, contains('Örnek servis belgesi'));
      expect(text, contains('Bir taraf kendiliğinden kesin doğru'));
      expect(text, contains('bakım sayacını'));
      expect(text, contains('Açık kalan'));
      await _pump(
        t,
        _view(
          page: RecordPage.dispute,
          snapshot: _snapshot(dispute: _dispute(noClaims: true)),
        ),
      );
      expect(
        _text(t),
        contains('Bu kaynakta karşılaştırılabilir iddia sunulmadı.'),
      );
      expect(_text(t), isNot(contains('İki ayrı iddia ve kanıt kaynağı var.')));
    },
  );
  testWidgets(
    'düzeltme eski yeni zaman gerekçeyi korur; özel eski alan sızmaz',
    (t) async {
      for (final private in [false, true]) {
        await _pump(
          t,
          _view(
            key: ValueKey(private),
            page: RecordPage.dispute,
            snapshot: _snapshot(
              dispute: _dispute(
                row: _row(versions: true, privateVersion: private),
              ),
            ),
          ),
        );
        await _tap(t, 'record-versions');
        final text = _text(t);
        if (!private) {
          expect(text, contains('Önceki bilgi: İşlem tamamlandı'));
          expect(text, contains('Yeni bilgi: İşlem kısmi'));
          expect(text, contains('05.10.2026'));
          expect(text, contains('Gerekçe: İlk beyan'));
        }
        expect(text, isNot(contains('PRIVATE')));
      }
    },
  );
  testWidgets('yüksek risk ve geri çekilmiş kanıt bağımsız izi silmez', (
    t,
  ) async {
    await _pump(
      t,
      _view(
        page: RecordPage.dispute,
        snapshot: _snapshot(dispute: _dispute(row: _row(risk: true))),
      ),
    );
    expect(_text(t), contains('İnceleyen: Örnek inceleyen'));
    expect(_text(t), contains('Bilinmeyenler:'));
    await _pump(
      t,
      _view(
        page: RecordPage.dispute,
        snapshot: _snapshot(
          dispute: _dispute(row: _row(meaning: HistoryMeaning.withdrawn)),
        ),
      ),
    );
    expect(_text(t), contains('Kanıt geri çekildi'));
    expect(_text(t), contains('bağımsız kayıtlar korunur'));
    expect(_text(t), contains('Dış servis'));
    expect(_text(t), contains('Motosiklet sahibi'));
  });
  testWidgets(
    'alan/başka motosiklet/kopya/eski kaynak boyanmış ve semantik içerikte kapanır',
    (t) async {
      final handle = t.ensureSemantics();
      try {
        final cases = [
          _view(snapshot: _snapshot(noDraftSource: true)),
          _view(snapshot: _snapshot(stale: true)),
          _view(
            snapshot: _snapshot(scope: _scope(bike: 'foreign')),
          ),
          _view(snapshot: _snapshot(origin: HistoryOrigin.historicalCopy)),
          _view(
            page: RecordPage.dispute,
            snapshot: _snapshot(
              dispute: _dispute(row: _row(denied: {HistoryField.outcome})),
            ),
          ),
        ];
        for (var i = 0; i < cases.length; i++) {
          await _pump(t, KeyedSubtree(key: ValueKey(i), child: cases[i]));
          expect(_text(t), isNot(contains('Örnek dış servis')));
          expect(_text(t), isNot(contains('Yağ bakımı')));
          expect(
            t
                .getSemantics(find.byKey(const ValueKey('record-capture')))
                .toStringDeep(),
            isNot(contains('PRIVATE')),
          );
        }
      } finally {
        handle.dispose();
      }
    },
  );
  test(
    'dört okuma boyutunun ve her draft alanının eksikliği kapıyı kapatır',
    () {
      for (final d in HistoryReadDimension.values)
        expect(
          _snapshot(deniedRead: d).draftReadable(_scope(), _request),
          isFalse,
        );
      for (final f in [
        'title',
        'date',
        'odometer',
        'actor',
        'outcome',
        'note',
        'service',
        'evidence',
      ])
        expect(
          _snapshot(deniedField: f).draftReadable(_scope(), _request),
          isFalse,
        );
      expect(
        _snapshot(request: 'old').draftReadable(_scope(), _request),
        isFalse,
      );
      expect(
        _dispute(duplicateClaims: true).readable(_scope(), _request),
        isFalse,
      );
    },
  );
  testWidgets(
    'altı güncel etki boyutunun her biri oluşturma ve öneriyi kapatır',
    (t) async {
      for (final d in RecordEffectDimension.values) {
        await _pump(
          t,
          _view(
            key: ValueKey('form-$d'),
            snapshot: _snapshot(deniedEffect: d),
          ),
        );
        expect(_callback(t, 'record-save'), isNull);
        await _pump(
          t,
          _view(
            key: ValueKey('dispute-$d'),
            page: RecordPage.dispute,
            snapshot: _snapshot(deniedEffect: d),
          ),
        );
        expect(_callback(t, 'record-add-evidence'), isNull);
        expect(_callback(t, 'record-correction'), isNull);
        expect(_callback(t, 'record-withdraw-own-evidence'), isNull);
      }
    },
  );
  testWidgets(
    'form düzenlemesi eski izni kullanmaz; dış üretici güncel girdiyi bağlar',
    (t) async {
      final changes = <RecordDraftChange>[], intents = <RecordIntent>[];
      await _pump(t, _view(record: intents.add, change: changes.add));
      final stale = _callback(t, 'record-save')!;
      final field = find.byKey(const ValueKey('record-field-title'));
      await t.ensureVisible(field);
      await t.enterText(field, 'Kullanıcının başka işi');
      await t.pumpAndSettle();
      expect(changes.single.draft.title, 'Kullanıcının başka işi');
      expect(changes.single.requestId, _request);
      expect(_callback(t, 'record-save'), isNull);
      stale();
      await t.pump();
      expect(intents, isEmpty);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(draft: changes.single.draft),
          record: intents.add,
          change: changes.add,
        ),
      );
      await _tap(t, 'record-save');
      expect(intents.single.draft!.title, 'Kullanıcının başka işi');
      expect(intents.single.action, RecordAction.saveStandalone);
      expect(intents.single.subject, changes.single.draft.subject);
    },
  );
  testWidgets(
    'eski metin callbacki sayfa ve taslak girdisi değişince kapanır',
    (t) async {
      final changes = <RecordDraftChange>[];
      final field = find.byKey(const ValueKey('record-field-title'));
      await _pump(t, _view(change: changes.add));
      final oldPage = t.widget<EditableText>(field).onChanged!;
      await _pump(t, _view(page: RecordPage.dispute, change: changes.add));
      oldPage('Eski sayfadan gelen değişiklik');
      await t.pumpAndSettle();
      expect(changes, isEmpty);
      await _pump(t, _view(change: changes.add));
      final oldInput = t.widget<EditableText>(field).onChanged!;
      await t.ensureVisible(field);
      await t.enterText(field, 'Güncel kullanıcı işi');
      await t.pumpAndSettle();
      expect(changes, hasLength(1));
      oldInput('Eski taslaktan gelen değişiklik');
      await t.pumpAndSettle();
      expect(changes, hasLength(1));
      expect(changes.single.draft.title, 'Güncel kullanıcı işi');
      final liveField = t.widget<EditableText>(field);
      liveField.controller.text = 'Hızlı ilk';
      liveField.onChanged!('Hızlı ilk');
      liveField.controller.text = 'Hızlı ikinci';
      liveField.onChanged!('Hızlı ikinci');
      expect(changes, hasLength(3));
      expect(changes.last.draft.title, 'Hızlı ikinci');
      await t.pumpAndSettle();
      liveField.onChanged!('Yeniden çizimden önceki olay');
      expect(changes, hasLength(3));
    },
  );
  testWidgets(
    'geri çekilme değerlendirme olsa da sayaç rehber sınırını kaldırmaz',
    (t) async {
      for (final meaning in [
        HistoryMeaning.withdrawn,
        HistoryMeaning.reviewed,
      ]) {
        await _pump(
          t,
          _view(
            page: RecordPage.dispute,
            snapshot: _snapshot(
              dispute: _dispute(row: _row(meaning: meaning)),
            ),
          ),
        );
        expect(
          _text(t),
          contains(
            'Çözülmemiş tamamlanma iddiası bakım sayacını veya sonraki rehberi doğrulanmış bilgi gibi ilerletmez.',
          ),
        );
        expect(_text(t), contains('İşlem kısmi kaldı.'));
        expect(_text(t), contains('İşlem tamamlandı diye bildirildi.'));
        expect(
          _text(t),
          contains(
            meaning == HistoryMeaning.withdrawn
                ? 'Kanıt geri çekildi'
                : 'Bugünkü kayıt durumu',
          ),
        );
        expect(_text(t), isNot(contains('Kesin doğru')));
      }
    },
  );
  testWidgets(
    'yalnız güncel kendi kanıtı geri çekilebilir; eski ownership ödünç alınamaz',
    (t) async {
      final intents = <RecordIntent>[];
      await _pump(t, _view(page: RecordPage.dispute, record: intents.add));
      expect(_callback(t, 'record-withdraw-service-evidence'), isNull);
      final old = _callback(t, 'record-withdraw-own-evidence')!;
      await _pump(
        t,
        _view(
          page: RecordPage.dispute,
          record: intents.add,
          snapshot: _snapshot(dispute: _dispute(own: false)),
        ),
      );
      expect(_callback(t, 'record-withdraw-own-evidence'), isNull);
      old();
      await t.pump();
      expect(intents, isEmpty);
      await _pump(t, _view(page: RecordPage.dispute, record: intents.add));
      await _tap(t, 'record-withdraw-own-evidence');
      expect(intents.single.evidenceId, 'own-evidence');
      expect(intents.single.evidenceRevision, 'evidence-r1');
      expect(intents.single.action, RecordAction.withdrawOwnEvidence);
      expect(intents.single.draft, isNull);
    },
  );
  testWidgets(
    'eski kapsam istek veya sınıflandırma callbacki yeni kaydı etkileyemez',
    (t) async {
      final intents = <RecordIntent>[];
      for (final changed in [
        _view(
          scope: _scope(bike: 'new'),
          snapshot: _snapshot(scope: _scope(bike: 'new')),
          record: intents.add,
        ),
        _view(
          request: 'new',
          snapshot: _snapshot(request: 'new'),
          record: intents.add,
        ),
        _view(
          snapshot: _snapshot(
            dispute: _dispute(row: _row(classification: 'new-class')),
          ),
          page: RecordPage.dispute,
          record: intents.add,
        ),
      ]) {
        await _pump(t, _view(page: changed.page, record: intents.add));
        final old = _callback(
          t,
          changed.page == RecordPage.dispute
              ? 'record-correction'
              : 'record-save',
        )!;
        await _pump(t, changed);
        old();
        await t.pump();
        expect(intents, isEmpty);
      }
    },
  );
  testWidgets('çift gönderim kaynak yenilense de aynı istekte kilitli kalır', (
    t,
  ) async {
    final intents = <RecordIntent>[];
    await _pump(t, _view(record: intents.add));
    final click = _callback(t, 'record-save')!;
    click();
    click();
    await t.pumpAndSettle();
    expect(intents, hasLength(1));
    await _pump(t, _view(record: intents.add));
    expect(_callback(t, 'record-save'), isNull);
    expect(_text(t), contains('İstek gönderildi; sonuç bekleniyor'));
    await _pump(
      t,
      _view(
        request: 'new',
        snapshot: _snapshot(request: 'new'),
        record: intents.add,
      ),
    );
    await _tap(t, 'record-save');
    expect(intents, hasLength(2));
  });
  testWidgets('failed unknown ve kanıtsız sonuç yalnız aynı isteği sorgular', (
    t,
  ) async {
    final intents = <RecordIntent>[];
    for (final phase in [
      RecordPhase.failed,
      RecordPhase.outcomeUnknown,
      RecordPhase.recorded,
    ]) {
      await _pump(
        t,
        _view(key: ValueKey(phase), phase: phase, record: intents.add),
      );
      expect(_callback(t, 'record-save'), isNull);
      await _tap(t, 'record-reconcile');
      expect(intents.last.action, RecordAction.reconcile);
      expect(intents.last.requestId, _request);
      expect(intents.last.draft, isNull);
      expect(intents.last.subject, isNull);
    }
    final old = _callback(t, 'record-reconcile')!;
    await _pump(
      t,
      _view(
        request: 'new',
        snapshot: _snapshot(request: 'new'),
        phase: RecordPhase.failed,
        record: intents.add,
      ),
    );
    old();
    await t.pump();
    expect(intents, hasLength(3));
    await _pump(t, _view(phase: RecordPhase.idle, record: intents.add));
    old();
    await t.pump();
    expect(intents, hasLength(3));
  });
  testWidgets(
    'çıplak sonuç veya handler başarı yaratmaz, bağlı receipt fiziksel doğrulama değildir',
    (t) async {
      await _pump(
        t,
        _view(
          phase: RecordPhase.recorded,
          receipt: _ref('ALLOW', _draft().subject),
        ),
      );
      expect(_text(t), contains('Sonuç henüz bilinmiyor'));
      expect(_text(t), isNot(contains('Kayıt sonucu alındı')));
      await _pump(
        t,
        _view(
          phase: RecordPhase.recorded,
          receipt: _ref('record-result', _draft().subject),
        ),
      );
      expect(_text(t), contains('Kayıt sonucu alındı'));
      expect(_text(t), contains('fiziksel işin yapıldığını'));
      expect(_callback(t, 'record-save'), isNull);
      await _pump(t, _view(phase: RecordPhase.failed, noHandler: true));
      expect(_callback(t, 'record-reconcile'), isNull);
    },
  );
  testWidgets('değerlendirme yoksa son claim kazanmaz; öneriler kapalıdır', (
    t,
  ) async {
    await _pump(
      t,
      _view(
        page: RecordPage.dispute,
        snapshot: _snapshot(dispute: _dispute(noEvaluation: true)),
      ),
    );
    expect(_text(t), contains('Bugünkü değerlendirme bilinmiyor'));
    expect(_callback(t, 'record-correction'), isNull);
    expect(_text(t), contains('İşlem kısmi kaldı.'));
    expect(_text(t), contains('İşlem tamamlandı diye bildirildi.'));
  });
  testWidgets('pasif motosiklet ve paket temel itiraz erişimini silmez', (
    t,
  ) async {
    await _pump(
      t,
      _view(page: RecordPage.dispute, snapshot: _snapshot(inactive: true)),
    );
    expect(_text(t), contains('Motosiklet pasif'));
    expect(_text(t), contains('geriye dönük kapanmaz'));
    expect(_text(t), contains('İddialar ve kanıtlar'));
  });
  testWidgets('gerçek klavye odağı seçimi ve kapalı düğme Semantics çalışır', (
    t,
  ) async {
    final intents = <RecordIntent>[];
    final handle = t.ensureSemantics();
    try {
      await _pump(t, _view(page: RecordPage.dispute, record: intents.add));
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      await t.sendKeyEvent(LogicalKeyboardKey.enter);
      await t.pumpAndSettle();
      expect(_text(t), contains('Değişiklik geçmişini kapat'));
      await _pump(t, _view(key: const ValueKey('no-handler'), noHandler: true));
      final semantics = t
          .widgetList<Semantics>(
            find.descendant(
              of: find.byKey(const ValueKey('record-save')),
              matching: find.byType(Semantics),
            ),
          )
          .firstWhere((w) => w.properties.button == true);
      expect(semantics.properties.enabled, isFalse);
      expect(semantics.properties.onTap, isNull);
    } finally {
      handle.dispose();
    }
  });
  testWidgets(
    'çizilmiş metin ve gerçek alan/düğme odağı okunabilir; Space gönderir',
    (t) async {
      double contrast(Color a, Color b) {
        final x = a.computeLuminance(), y = b.computeLuminance();
        return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
      }

      BoxDecoration paint(Finder target) =>
          t
                  .widget<Container>(
                    find
                        .descendant(
                          of: target,
                          matching: find.byType(Container),
                        )
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      final intents = <RecordIntent>[];
      await _pump(t, _view(record: intents.add));
      final field = find.byKey(const ValueKey('record-field-title'));
      final input = t.widget<EditableText>(field);
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pump();
      expect(input.focusNode.hasFocus, isTrue);
      final fieldBox =
          t
                  .widget<Container>(
                    find
                        .ancestor(of: field, matching: find.byType(Container))
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      expect((fieldBox.border! as Border).top.width, 3);
      expect(
        contrast(input.style.color!, fieldBox.color!),
        greaterThanOrEqualTo(4.5),
      );
      expect(
        contrast((fieldBox.border! as Border).top.color, fieldBox.color!),
        greaterThanOrEqualTo(3),
      );
      final save = find.byKey(const ValueKey('record-save'));
      await t.ensureVisible(save);
      await t.pumpAndSettle();
      final paragraph = t.renderObject<RenderParagraph>(
        find.descendant(of: save, matching: find.byType(RichText)).first,
      );
      expect(
        contrast(
          (paragraph.text as TextSpan).style!.color!,
          paint(save).color!,
        ),
        greaterThanOrEqualTo(4.5),
      );
      for (
        var i = 0;
        i < 30 && (paint(save).border! as Border).top.width != 3;
        i++
      ) {
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pump();
      }
      expect((paint(save).border! as Border).top.width, 3);
      expect(
        contrast((paint(save).border! as Border).top.color, paint(save).color!),
        greaterThanOrEqualTo(3),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(intents.single.action, RecordAction.saveStandalone);
      final disabled = t.renderObject<RenderParagraph>(
        find.descendant(of: save, matching: find.byType(RichText)).first,
      );
      expect(
        contrast((disabled.text as TextSpan).style!.color!, paint(save).color!),
        greaterThanOrEqualTo(4.5),
      );
      expect(_callback(t, 'record-save'), isNull);
    },
  );
  testWidgets('bütün durumlar dar geniş ve büyük yazıda tam sonuna erişilir', (
    t,
  ) async {
    for (final width in [320.0, 390.0, 768.0]) {
      for (final scale in [1.0, 2.0, 3.0]) {
        for (final entry in _cases().entries) {
          await _pump(
            t,
            KeyedSubtree(
              key: ValueKey('${entry.key}-$width-$scale'),
              child: entry.value,
            ),
            width: width,
            scale: scale,
          );
          await _prepare(t, entry.key);
          final scroll = _scroll(t);
          scroll.position.jumpTo(scroll.position.maxScrollExtent);
          await t.pumpAndSettle();
          expect(
            t.takeException(),
            isNull,
            reason: '${entry.key}/$width/$scale',
          );
          expect(
            t.getSize(find.byKey(const ValueKey('record-exit'))).height,
            greaterThanOrEqualTo(52),
          );
        }
      }
    }
  });
  final preview = Platform.environment['KAVRIVA_RECORD_PREVIEW'];
  if (preview != null)
    testWidgets(
      'gerçek doğal çizim bütün örnek durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_RECORD_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaRecordNative')
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        final rows = <String>[];
        for (final entry in _cases().entries) {
          await t.pumpWidget(const SizedBox());
          await t.pump();
          await _pump(
            t,
            KeyedSubtree(key: ValueKey(entry.key), child: entry.value),
            font: 'KavrivaRecordNative',
          );
          await _prepare(t, entry.key);
          final scroll = _scroll(t);
          scroll.position.jumpTo(0);
          await t.pumpAndSettle();
          final end = scroll.position.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
            scroll.position.jumpTo(offset);
            await t.pumpAndSettle();
            final boundary = t.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('record-capture')),
            );
            final path = '$preview-${entry.key}-$index.png';
            await t.runAsync(() async {
              final image = await boundary.toImage(pixelRatio: 1);
              final bytes = (await image.toByteData(
                format: ui.ImageByteFormat.png,
              ))!;
              await File(path).writeAsBytes(
                bytes.buffer.asUint8List(
                  bytes.offsetInBytes,
                  bytes.lengthInBytes,
                ),
              );
              image.dispose();
            });
            rows.add('${entry.key}\t$path\t$offset\t$end\t$index');
            index++;
            if (offset >= end) break;
          }
          expect(t.takeException(), isNull, reason: entry.key);
        }
        await t.runAsync(
          () => File('$preview-manifest.txt').writeAsString(rows.join('\n')),
        );
      },
    );
}
