import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/history.dart';
import 'package:kavriva_shell/correction_reachback.dart';

// Açık SIMULATION test verisi; etkilenen kullanıcı, üretim güvenlik,
// kimlik/otorite, bakım kontrolü veya bildirim üreticisi değildir.
const _request = 'correction-example-request';
HistoryScope _scope({String bike = 'bike-A', String revision = 'context-r1'}) =>
    HistoryScope(
      motorcycleId: bike,
      contextRevision: revision,
      catalogId: 'example-catalog',
      catalogRevision: 'catalog-r1',
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
  location: 'Örnek bakım kaydı',
  checkedAt: '2026-10-06',
  reason: 'Yalnız açık sunum testine ait örnek karar',
  current: current,
  state: state,
);
HistoryRecord _row({
  HistoryScope? scope,
  String request = _request,
  String revision = 'record-r1',
  bool private = false,
}) {
  final own = scope ?? _scope();
  final values = <HistoryField, String>{
    HistoryField.title: 'Fren balatası kontrolü · örnek kayıt',
    HistoryField.date: '04.10.2026 · örnek bakım tarihi',
    HistoryField.outcome:
        'Kullanıcının önceki bakım beyanı; fiziksel iş doğrulanmadı.',
    HistoryField.actor: 'Motosiklet sahibi · kullanıcı beyanı',
    HistoryField.source: 'Örnek bakım kaydı · test verisi',
    HistoryField.evidence: 'Örnek belge · fiziksel işi kanıtlamaz',
    HistoryField.evaluation:
        'Sonradan değişen bilgi yeniden değerlendirilmeli.',
    HistoryField.corrections: 'Eski kayıt ve bağımsız kanıt izleri korunur.',
    HistoryField.reviewer: 'Örnek inceleyen · test verisi',
    HistoryField.uncertainty:
        'İşçilik ve mevcut fiziksel güvenlik sonucu bilinmiyor.',
  };
  HistoryRecord build(
    Map<HistoryReadDimension, HistoryReference?> dims,
    Map<HistoryField, HistoryReference?> fields,
    HistoryReference? auth,
  ) => HistoryRecord(
    scope: own,
    id: 'affected-example',
    revision: revision,
    evaluationId: 'evaluation-example',
    evaluationRevision: 'evaluation-r1',
    classificationRevision: 'classification-r1',
    meaning: HistoryMeaning.reported,
    highRisk: true,
    values: values,
    revisions: [],
    readDimensions: dims,
    fieldReferences: fields,
    authority: auth,
  );
  final seed = build({}, {}, null);
  return build(
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
      for (final f in values.keys)
        f: private && f == HistoryField.title
            ? null
            : _ref(
                'history-read-field',
                '${seed.readSubject}/${f.name}',
                scope: own,
                request: request,
              ),
    },
    _ref('history-record', seed.subject, scope: own, request: request),
  );
}

CorrectionNotice _notice({
  HistoryScope? scope,
  String request = _request,
  CorrectionImpact impact = CorrectionImpact.safetyWarning,
  String id = 'notice-example',
  String revision = 'notice-r1',
  String classification = 'impact-r1',
  String summary = 'Sonradan yapılan düzeltme, bu kayıtta kullanılan örnek güvenlik bilgisini etkiliyor.',
  bool privateRecord = false,
  String recordRevision = 'record-r1',
  Map<CorrectionField, String>? values,
}) => CorrectionNotice(
  id: id,
  revision: revision,
  classificationRevision: classification,
  record: _row(
    scope: scope,
    request: request,
    private: privateRecord,
    revision: recordRevision,
  ),
  impact: impact,
  values:
      values ??
      {
        CorrectionField.summary: summary,
        CorrectionField.before:
            'Önceki örnek bilgi eski kaynak sürümünde sunulmuştu.',
        CorrectionField.after: 'Düzeltilen örnek bilginin önceki işe etkisi yeniden değerlendirilmeli.',
        CorrectionField.source: 'Örnek bilgi kaynağı · sürüm 2 · örnek bölüm',
        CorrectionField.changedAt: '06.10.2026 · örnek düzeltme zamanı',
        CorrectionField.reason: 'Örnek kaynağın kapsamı sonradan değişti.',
        CorrectionField.reviewer: 'Örnek inceleyen · test verisi',
        CorrectionField.uncertainty:
            'Mevcut fiziksel durum ve işçilik sonucu kesinleşmedi.',
      },
);
CorrectionSnapshot _snapshot({
  HistoryScope? scope,
  String request = _request,
  CorrectionNotice? notice,
  bool missing = false,
  bool noSource = false,
  bool noClassification = false,
  bool inactive = false,
  bool entitlement = false,
  bool offline = false,
  CorrectionPhase phase = CorrectionPhase.idle,
  bool receipt = false,
  HistoryReference? overrideReceipt,
  HistoryReadDimension? deniedRead,
  CorrectionField? deniedField,
  CorrectionEffectDimension? deniedEffect,
  HistoryReferenceState state = HistoryReferenceState.confirmed,
  bool current = true,
  Map<HistoryReadDimension, HistoryReference?>? readOverride,
  Map<CorrectionField, HistoryReference?>? fieldOverride,
  Map<CorrectionAction, Map<CorrectionEffectDimension, HistoryReference?>>?
  effectOverride,
  HistoryReference? authOverride,
  HistoryReference? impactOverride,
}) {
  final own = scope ?? _scope(),
      n = notice ?? _notice(scope: own, request: request);
  return CorrectionSnapshot(
    scope: own,
    requestId: request,
    notice: missing ? null : n,
    inactive: inactive,
    entitlementChanged: entitlement,
    offline: offline,
    phase: phase,
    authority: noSource
        ? null
        : authOverride ??
              _ref(
                'correction-notice',
                n.subject,
                scope: own,
                request: request,
                state: state,
                current: current,
              ),
    classificationAuthority: noClassification
        ? null
        : impactOverride ??
              _ref(
                'correction-impact',
                n.subject,
                scope: own,
                request: request,
                state: state,
                current: current,
              ),
    resultReceipt:
        overrideReceipt ??
        (receipt
            ? _ref(
                'correction-recheck-receipt',
                n.subject,
                scope: own,
                request: request,
              )
            : null),
    readDimensions:
        readOverride ??
        {
          for (final d in HistoryReadDimension.values)
            d: d == deniedRead
                ? null
                : _ref(
                    'correction-read',
                    '${n.subject}/${d.name}',
                    scope: own,
                    request: request,
                  ),
        },
    fields:
        fieldOverride ??
        {
          for (final f in CorrectionField.values)
            f: f == deniedField
                ? null
                : _ref(
                    'correction-field',
                    '${n.subject}/${f.name}',
                    scope: own,
                    request: request,
                  ),
        },
    effects:
        effectOverride ??
        {
          for (final a in [
            CorrectionAction.recheck,
            CorrectionAction.reconcile,
          ])
            a: {
              for (final d in CorrectionEffectDimension.values)
                d: d == deniedEffect
                    ? null
                    : _ref(
                        'correction-effect',
                        '${n.subject}/${a.name}/${d.name}',
                        scope: own,
                        request: request,
                      ),
            },
        },
  );
}

CorrectionReachbackView _view({
  CorrectionSnapshot? snapshot,
  ValueChanged<CorrectionIntent>? handler,
  bool noHandler = false,
}) => CorrectionReachbackView(
  snapshot: snapshot ?? _snapshot(),
  onIntent: noHandler ? null : handler ?? (_) {},
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
        key: const ValueKey('correction-capture'),
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
        of: find.byKey(const ValueKey('correction-scroll')),
        matching: find.byType(Scrollable),
      )
      .first,
);

Map<String, CorrectionReachbackView> _cases() => {
  'safety': _view(),
  'technical-value': _view(
    snapshot: _snapshot(
      notice: _notice(
        impact: CorrectionImpact.technicalValue,
        summary:
            'Kullanılmış örnek teknik değerin kaynağı sonradan düzeltildi.',
      ),
    ),
  ),
  'critical-step': _view(
    snapshot: _snapshot(
      notice: _notice(
        impact: CorrectionImpact.criticalStep,
        summary: 'Uygulanmış örnek önemli adımın kapsamı sonradan düzeltildi.',
      ),
    ),
  ),
  'narrative': _view(
    snapshot: _snapshot(
      notice: _notice(
        impact: CorrectionImpact.narrative,
        summary: 'Örnek kaydın anlatımı daha açık yazıldı.',
      ),
    ),
  ),
  'inactive': _view(snapshot: _snapshot(inactive: true)),
  'entitlement-changed': _view(snapshot: _snapshot(entitlement: true)),
  'inactive-entitlement': _view(
    snapshot: _snapshot(inactive: true, entitlement: true),
  ),
  'offline': _view(snapshot: _snapshot(offline: true)),
  'details': _view(),
  'details-inactive': _view(
    snapshot: _snapshot(inactive: true, entitlement: true),
  ),
  'details-long': _view(
    snapshot: _snapshot(
      notice: _notice(
        summary: 'Örnek kaynakta sonradan yapılan kapsam düzeltmesi, geçmişte bu motosiklet için bildirilen bakım işinde kullanılan güvenlik bilgisini etkileyebilir; mevcut fiziksel sonuç henüz kesinleşmedi.',
      ),
    ),
  ),
  'missing': _view(snapshot: _snapshot(missing: true)),
  'source-missing': _view(snapshot: _snapshot(noSource: true)),
  'source-stale': _view(snapshot: _snapshot(current: false)),
  'source-held': _view(snapshot: _snapshot(state: HistoryReferenceState.held)),
  'source-unknown': _view(
    snapshot: _snapshot(state: HistoryReferenceState.unknown),
  ),
  'foreign-source': _view(
    snapshot: _snapshot(
      authOverride: _ref(
        'correction-notice',
        _notice().subject,
        scope: _scope(bike: 'bike-B'),
      ),
    ),
  ),
  'private-record': _view(
    snapshot: _snapshot(notice: _notice(privateRecord: true)),
  ),
  'private-correction': _view(
    snapshot: _snapshot(deniedField: CorrectionField.before),
  ),
  'classification-missing': _view(snapshot: _snapshot(noClassification: true)),
  'reviewer-missing': _view(
    snapshot: _snapshot(deniedField: CorrectionField.reviewer),
  ),
  'uncertainty-missing': _view(
    snapshot: _snapshot(deniedField: CorrectionField.uncertainty),
  ),
  'no-handler': _view(noHandler: true),
  'operation-held': _view(
    snapshot: _snapshot(
      deniedEffect: CorrectionEffectDimension.operationIntent,
    ),
  ),
  'busy': _view(snapshot: _snapshot(phase: CorrectionPhase.submitting)),
  'sent': _view(),
  'failed': _view(snapshot: _snapshot(phase: CorrectionPhase.failed)),
  'unknown': _view(snapshot: _snapshot(phase: CorrectionPhase.unknown)),
  'unknown-querying': _view(
    snapshot: _snapshot(phase: CorrectionPhase.unknown),
  ),
  'received-unproven': _view(
    snapshot: _snapshot(phase: CorrectionPhase.received),
  ),
  'received-confirmed': _view(
    snapshot: _snapshot(phase: CorrectionPhase.received, receipt: true),
  ),
};
Future<void> _prepare(WidgetTester t, String state) async {
  if (state.startsWith('details')) await _tap(t, 'correction-details');
  if (state == 'sent') await _tap(t, 'correction-recheck');
  if (state == 'unknown-querying') await _tap(t, 'correction-reconcile');
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  tearDown(
    () => TestWidgetsFlutterBinding.instance.platformDispatcher
        .clearAllTestValues(),
  );
  testWidgets('etki sınıfı anlatımdan ayrılır; fiziksel tamamlanma üretilmez', (
    t,
  ) async {
    final intents = <CorrectionIntent>[];
    for (final impact in CorrectionImpact.values) {
      await t.pumpWidget(const SizedBox());
      await _pump(
        t,
        _view(
          snapshot: _snapshot(notice: _notice(impact: impact)),
          handler: intents.add,
        ),
      );
      expect(_text(t), contains('güvenli olduğunu kanıtlamaz'));
      if (impact == CorrectionImpact.narrative) {
        expect(find.text('Yeniden kontrol et'), findsNothing);
        await _tap(t, 'correction-openRecord');
        expect(intents.last.action, CorrectionAction.openRecord);
      } else {
        expect(find.text('Bu kayıt yeniden kontrol edilmeli'), findsOneWidget);
        await _tap(t, 'correction-recheck');
        expect(intents.last.action, CorrectionAction.recheck);
      }
    }
  });
  testWidgets('pasif ve paket değişimi izinli erişimi ücret kapısına taşımaz', (
    t,
  ) async {
    for (final inactive in [true, false])
      for (final entitlement in [true, false]) {
        await t.pumpWidget(const SizedBox());
        await _pump(
          t,
          _view(
            snapshot: _snapshot(inactive: inactive, entitlement: entitlement),
          ),
        );
        expect(_text(t), contains('Fren balatası kontrolü'));
        expect(_callback(t, 'correction-recheck'), isNotNull);
        if (inactive) expect(_text(t), contains('Motosiklet pasif'));
        if (entitlement) expect(_text(t), contains('ücret kapısına alınmaz'));
      }
  });
  testWidgets(
    'eksik eski held yabancı kaynak boyama ve Semantics gizliliğini kapatır',
    (t) async {
      final semantics = t.ensureSemantics();
      try {
        final cases = [
          _snapshot(missing: true),
          _snapshot(noSource: true),
          _snapshot(noClassification: true),
          _snapshot(current: false),
          _snapshot(state: HistoryReferenceState.held),
          _snapshot(state: HistoryReferenceState.unknown),
          _snapshot(notice: _notice(privateRecord: true)),
          _snapshot(
            authOverride: _ref(
              'correction-notice',
              _notice().subject,
              scope: _scope(bike: 'bike-B'),
            ),
          ),
          _snapshot(
            authOverride: _ref(
              'correction-notice',
              _notice().subject,
              request: 'other',
            ),
          ),
          for (final f in CorrectionField.values) _snapshot(deniedField: f),
          for (final d in HistoryReadDimension.values) _snapshot(deniedRead: d),
        ];
        for (var i = 0; i < cases.length; i++) {
          await _pump(
            t,
            KeyedSubtree(
              key: ValueKey(i),
              child: _view(snapshot: cases[i]),
            ),
          );
          expect(_text(t), isNot(contains('Fren balatası')));
          expect(_text(t), isNot(contains('örnek güvenlik')));
          expect(
            find.bySemanticsLabel(RegExp('Fren balatası|örnek güvenlik')),
            findsNothing,
          );
          expect(
            find.byKey(const ValueKey('correction-recheck')),
            findsNothing,
          );
        }
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets('her etki boyutu yeni isteği ve sonuç sorgusunu ayrı kapatır', (
    t,
  ) async {
    for (final d in CorrectionEffectDimension.values)
      for (final phase in [CorrectionPhase.idle, CorrectionPhase.unknown]) {
        await _pump(
          t,
          KeyedSubtree(
            key: ValueKey('$d-$phase'),
            child: _view(
              snapshot: _snapshot(deniedEffect: d, phase: phase),
            ),
          ),
        );
        expect(_text(t), contains('Fren balatası'));
        expect(
          _callback(
            t,
            phase == CorrectionPhase.idle
                ? 'correction-recheck'
                : 'correction-reconcile',
          ),
          isNull,
        );
      }
  });
  testWidgets('yanlış hedef amaç veya istek güncel etki izni yerine geçmez', (
    t,
  ) async {
    final n = _notice();
    for (final wrong in [
      _ref('ALLOW', n.subject),
      _ref('correction-effect', n.subject, request: 'other'),
      _ref(
        'correction-effect',
        n.subject + '/recheck/source',
        scope: _scope(bike: 'other'),
      ),
      _ref('correction-effect', n.subject + '/recheck/source', current: false),
    ]) {
      final effects = {
        for (final a in [CorrectionAction.recheck, CorrectionAction.reconcile])
          a: {
            for (final d in CorrectionEffectDimension.values)
              d: d == CorrectionEffectDimension.source
                  ? wrong
                  : _ref(
                      'correction-effect',
                      '${n.subject}/${a.name}/${d.name}',
                    ),
          },
      };
      await _pump(
        t,
        KeyedSubtree(
          key: ValueKey(wrong),
          child: _view(
            snapshot: _snapshot(notice: n, effectOverride: effects),
          ),
        ),
      );
      expect(_callback(t, 'correction-recheck'), isNull);
    }
  });
  testWidgets(
    'eski callback motosiklet istek etki içerik ve faz değişiminde çalışmaz',
    (t) async {
      final intents = <CorrectionIntent>[];
      for (final changed in [
        _snapshot(scope: _scope(bike: 'other')),
        _snapshot(request: 'other'),
        _snapshot(notice: _notice(impact: CorrectionImpact.technicalValue)),
        _snapshot(notice: _notice(summary: 'Değişmiş içerik')),
        _snapshot(notice: _notice(revision: 'notice-r2')),
        _snapshot(notice: _notice(classification: 'class-r2')),
        _snapshot(notice: _notice(recordRevision: 'record-r2')),
        _snapshot(phase: CorrectionPhase.unknown),
        _snapshot(offline: true),
        _snapshot(deniedEffect: CorrectionEffectDimension.audit),
        _snapshot(noSource: true),
      ]) {
        await t.pumpWidget(const SizedBox());
        await _pump(t, _view(handler: intents.add));
        final old = _callback(t, 'correction-recheck')!;
        await _pump(t, _view(snapshot: changed, handler: intents.add));
        old();
        await t.pump();
        expect(intents, isEmpty);
      }
    },
  );
  testWidgets(
    'aynı istek çift gönderilmez; aynıistek idle güncellemesi kilidi kaldırmaz',
    (t) async {
      final intents = <CorrectionIntent>[];
      await _pump(t, _view(handler: intents.add));
      final callback = _callback(t, 'correction-recheck')!;
      callback();
      callback();
      await t.pumpAndSettle();
      expect(intents, hasLength(1));
      expect(_callback(t, 'correction-recheck'), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(notice: _notice(revision: 'changed')),
          handler: intents.add,
        ),
      );
      expect(_callback(t, 'correction-recheck'), isNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(request: 'next-request'),
          handler: intents.add,
        ),
      );
      await _tap(t, 'correction-recheck');
      expect(intents, hasLength(2));
      expect(intents.last.requestId, 'next-request');
    },
  );
  testWidgets('failed unknown ve çıplak sonuç yalnız aynıistek sorgusu sunar', (
    t,
  ) async {
    for (final phase in [
      CorrectionPhase.failed,
      CorrectionPhase.unknown,
      CorrectionPhase.received,
    ]) {
      final intents = <CorrectionIntent>[];
      await t.pumpWidget(const SizedBox());
      await _pump(
        t,
        _view(
          snapshot: _snapshot(phase: phase),
          handler: intents.add,
        ),
      );
      expect(find.byKey(const ValueKey('correction-recheck')), findsNothing);
      final query = _callback(t, 'correction-reconcile')!;
      query();
      query();
      await t.pumpAndSettle();
      expect(intents, hasLength(1));
      expect(intents.single.action, CorrectionAction.reconcile);
      expect(intents.single.requestId, _request);
      expect(_text(t), contains('Yeni kontrol isteği gönderilmedi'));
    }
  });
  testWidgets('sonuç makbuzu tam bağ ister ve fiziksel işi doğrulamaz', (
    t,
  ) async {
    final n = _notice();
    for (final receipt in [
      _ref('ALLOW', n.subject),
      _ref('correction-recheck-receipt', n.subject, request: 'other'),
      _ref('correction-recheck-receipt', n.subject, current: false),
      _ref(
        'correction-recheck-receipt',
        n.subject,
        scope: _scope(bike: 'other'),
      ),
    ]) {
      await _pump(
        t,
        KeyedSubtree(
          key: ValueKey(receipt),
          child: _view(
            snapshot: _snapshot(
              phase: CorrectionPhase.received,
              overrideReceipt: receipt,
            ),
          ),
        ),
      );
      expect(_callback(t, 'correction-reconcile'), isNotNull);
      expect(_text(t), isNot(contains('alındığı bildirildi')));
    }
    await _pump(
      t,
      KeyedSubtree(
        key: const ValueKey('receipt-ok'),
        child: _view(
          snapshot: _snapshot(phase: CorrectionPhase.received, receipt: true),
        ),
      ),
    );
    expect(
      _text(t),
      contains('Fiziksel kontrol ve güvenlik sonucu henüz doğrulanmadı'),
    );
    expect(_callback(t, 'correction-recheck'), isNull);
  });
  testWidgets(
    'çevrimdışı eski bilgi riskin geçtiği veya güncel kontrol değildir',
    (t) async {
      await _pump(t, _view(snapshot: _snapshot(offline: true)));
      expect(_text(t), contains('riskin geçtiği anlamına gelmez'));
      expect(_callback(t, 'correction-recheck'), isNull);
      expect(_callback(t, 'correction-openRecord'), isNotNull);
      await _pump(
        t,
        _view(
          snapshot: _snapshot(offline: true, phase: CorrectionPhase.unknown),
        ),
      );
      expect(_callback(t, 'correction-reconcile'), isNull);
    },
  );
  testWidgets('düzeltme kaynağı ve eskiyeni iz yalnız ayrıntıda ayrı sunulur', (
    t,
  ) async {
    final intents = <CorrectionIntent>[];
    await _pump(t, _view(handler: intents.add));
    expect(
      _text(t),
      contains('Kayda veya ayrıntılara bakmak bir bakım işlemi başlatmaz.'),
    );
    expect(_text(t), isNot(contains('Önceki örnek bilgi')));
    await _tap(t, 'correction-details');
    expect(_text(t), contains('Önceki örnek bilgi'));
    expect(_text(t), contains('Gerekçe:'));
    expect(_text(t), contains('İnceleyen:'));
    expect(_text(t), contains('Açık kalan:'));
    expect(_text(t), contains('izini silmez'));
    await _tap(t, 'correction-openRecord');
    expect(intents.single.action, CorrectionAction.openRecord);
    expect(intents.any((v) => v.action == CorrectionAction.recheck), isFalse);
    final old = _callback(t, 'correction-details')!;
    await _pump(
      t,
      _view(
        snapshot: _snapshot(notice: _notice(summary: 'Yeni kapsam')),
      ),
    );
    old();
    await t.pump();
    expect(_text(t), isNot(contains('Önceki örnek bilgi')));
  });
  test('girdi kopyaları değişmez ve bozukUnicode kimlikler çakışmaz', () {
    final values = {
      for (final f in CorrectionField.values) f: 'Örnek ${f.name}',
    };
    final a = _notice(id: '\ud800', values: values),
        b = _notice(id: '\ufffd', values: values);
    expect(a.subject, isNot(b.subject));
    values[CorrectionField.summary] = 'Mutasyon';
    expect(a.values[CorrectionField.summary], 'Örnek summary');
    expect(() => a.values.clear(), throwsUnsupportedError);
    final s = _snapshot();
    expect(() => s.fields.clear(), throwsUnsupportedError);
    expect(
      () => s.effects[CorrectionAction.recheck]!.clear(),
      throwsUnsupportedError,
    );
    expect(() => _notice(id: ' '), throwsArgumentError);
  });
  testWidgets(
    'klavye odağı gerçek EnterSpace ile çalışır ve kapalı hedef atlanır',
    (t) async {
      final semantics = t.ensureSemantics();
      try {
        final intents = <CorrectionIntent>[];
        await _pump(t, _view(handler: intents.add));
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.pumpAndSettle();
        await t.sendKeyEvent(LogicalKeyboardKey.enter);
        await t.pumpAndSettle();
        expect(intents.single.action, CorrectionAction.recheck);
        final recheck = find.byKey(const ValueKey('correction-recheck'));
        await t.ensureVisible(recheck);
        expect(
          t
              .getSemantics(
                find
                    .descendant(
                      of: recheck,
                      matching: find.byWidgetPredicate(
                        (w) => w is Semantics && w.properties.button == true,
                      ),
                    )
                    .first,
              )
              .flagsCollection
              .isEnabled,
          ui.Tristate.isFalse,
        );
        expect(
          find
              .byType(Semantics)
              .evaluate()
              .any(
                (e) => (e.widget as Semantics).properties.liveRegion == true,
              ),
          isTrue,
        );
        await t.pumpWidget(const SizedBox());
        await _pump(
          t,
          _view(
            snapshot: _snapshot(
              notice: _notice(impact: CorrectionImpact.narrative),
            ),
            handler: intents.add,
          ),
        );
        await t.sendKeyEvent(LogicalKeyboardKey.tab);
        await t.sendKeyEvent(LogicalKeyboardKey.space);
        await t.pumpAndSettle();
        expect(intents.last.action, CorrectionAction.openRecord);
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets(
    'çizilmiş metin ve gerçek birincil ikincil odak kontrastı okunur',
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
      Color textColor(Finder target) =>
          (t
                      .renderObject<RenderParagraph>(
                        find
                            .descendant(
                              of: target,
                              matching: find.byType(RichText),
                            )
                            .first,
                      )
                      .text
                  as TextSpan)
              .style!
              .color!;
      final intents = <CorrectionIntent>[];
      await _pump(t, _view(handler: intents.add));
      final primary = find.byKey(const ValueKey('correction-recheck'));
      await t.ensureVisible(primary);
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      expect((paint(primary).border! as Border).top.width, 3);
      expect(
        contrast(
          (paint(primary).border! as Border).top.color,
          paint(primary).color!,
        ),
        greaterThanOrEqualTo(3),
      );
      expect(
        contrast(textColor(primary), paint(primary).color!),
        greaterThanOrEqualTo(4.5),
      );
      await t.sendKeyEvent(LogicalKeyboardKey.space);
      await t.pumpAndSettle();
      expect(intents.single.action, CorrectionAction.recheck);
      expect(
        contrast(textColor(primary), paint(primary).color!),
        greaterThanOrEqualTo(4.5),
      );
      final secondary = find.byKey(const ValueKey('correction-details'));
      await t.ensureVisible(secondary);
      await t.sendKeyEvent(LogicalKeyboardKey.tab);
      await t.pumpAndSettle();
      expect((paint(secondary).border! as Border).top.width, 3);
      expect(
        contrast(
          (paint(secondary).border! as Border).top.color,
          paint(secondary).color!,
        ),
        greaterThanOrEqualTo(3),
      );
      expect(
        contrast(textColor(secondary), paint(secondary).color!),
        greaterThanOrEqualTo(4.5),
      );
      final pageColor = t
          .widget<ColoredBox>(
            find
                .descendant(
                  of: find.byType(CorrectionReachbackView),
                  matching: find.byType(ColoredBox),
                )
                .first,
          )
          .color;
      for (final label in [
        'Bu kayıt yeniden kontrol edilmeli',
        'Örnek motosiklet A · kullanıcı beyanı',
      ]) {
        final paragraph = t.renderObject<RenderParagraph>(find.text(label));
        expect(
          contrast((paragraph.text as TextSpan).style!.color!, pageColor),
          greaterThanOrEqualTo(4.5),
        );
      }
    },
  );
  testWidgets('bütün durumlar dar geniş ve büyük yazıyla sonuna erişir', (
    t,
  ) async {
    for (final entry in _cases().entries)
      for (final width in [320.0, 390.0, 768.0])
        for (final scale in [1.0, 2.0, 3.0]) {
          await t.pumpWidget(const SizedBox());
          await _pump(
            t,
            KeyedSubtree(key: ValueKey(entry.key), child: entry.value),
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
            t.getSize(find.byKey(const ValueKey('correction-exit'))).height,
            greaterThanOrEqualTo(52),
          );
          await t.tap(find.byKey(const ValueKey('correction-exit')));
          expect(t.takeException(), isNull);
        }
  });
  final preview = Platform.environment['KAVRIVA_CORRECTION_PREVIEW'];
  if (preview != null)
    testWidgets(
      'gerçek doğal çizim bütün örnek durumları tam kaydırmayla kaydeder',
      (t) async {
        final font = Platform.environment['KAVRIVA_CORRECTION_FONT'];
        if (font == null) throw StateError('Sabit SDK font yolu gerekli.');
        await t.runAsync(() async {
          final bytes = await File(font).readAsBytes();
          final loader = FontLoader('KavrivaCorrectionNative')
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
            font: 'KavrivaCorrectionNative',
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
              find.byKey(const ValueKey('correction-capture')),
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
