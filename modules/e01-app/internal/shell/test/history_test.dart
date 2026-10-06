import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kavriva_shell/history.dart';

// Yalnız sunum testleri. Üretim E3/E5 otoritesi, dosya veya kimlik yazıcısı yok.
const _request = 'history-example-request';
const _core = {
  HistoryField.title,
  HistoryField.date,
  HistoryField.outcome,
  HistoryField.actor,
  HistoryField.source,
  HistoryField.evidence,
  HistoryField.evaluation,
  HistoryField.corrections,
};
HistoryScope _scope({
  String bike = 'bike-example',
  String context = 'context-r1',
  String catalog = 'catalog-example',
  String revision = 'catalog-r1',
}) => HistoryScope(
  motorcycleId: bike,
  contextRevision: context,
  catalogId: catalog,
  catalogRevision: revision,
  motorcycleLabel: 'Örnek motosiklet · kullanıcı beyanı',
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
  version: 'örnek-r1',
  location: 'Örnek kayıt bölümü · test verisi',
  checkedAt: '2026-10-06',
  reason: 'Yalnız bağımsız sunum testi için örnek değerlendirme.',
  current: current,
  state: state,
);

HistoryRecord _record({
  String id = 'record-example',
  String revision = 'record-r1',
  String evaluation = 'evaluation-r1',
  String classification = 'classification-r1',
  HistoryScope? scope,
  String request = _request,
  String title = 'Yağ bakımı',
  HistoryMeaning meaning = HistoryMeaning.reported,
  bool highRisk = false,
  bool corrected = false,
  bool missingAuthority = false,
  bool missingEvaluation = false,
  bool missingVersions = false,
  bool missingVersionRead = false,
  bool privateRevision = false,
  bool allowPrivate = false,
  Map<HistoryReadDimension, HistoryReference?> dimensionOverrides = const {},
  Map<HistoryField, HistoryReference?> fieldOverrides = const {},
  HistoryReference? authority,
  HistoryReference? evaluationAuthority,
  HistoryReference? versionAuthority,
}) {
  final own = scope ?? _scope();
  final values = <HistoryField, String>{
    HistoryField.title: title,
    HistoryField.date: '03.10.2026 · örnek tarih',
    HistoryField.outcome:
        'İşin tamamlandığı bildirildi; işçilik sonucu ayrıca doğrulanmadı.',
    HistoryField.actor: 'Dış servis · örnek aktör',
    HistoryField.source: 'Örnek bakım kaydı ve kaynak açıklaması · test verisi',
    HistoryField.evidence: meaning == HistoryMeaning.reported
        ? 'Bu bilgi kullanıcı beyanıdır; doğrulanmış bakım değildir.'
        : 'Örnek belge ve inceleme girdisi; üretim doğrulaması değildir.',
    HistoryField.evaluation: switch (meaning) {
      HistoryMeaning.reported => 'Bildirilen iş kullanıcı beyanı olarak korunur; yapıldığı doğrulanmış sayılmaz.',
      HistoryMeaning.documented =>
        'Belge bulunması işi kendiliğinden doğrulamaz.',
      HistoryMeaning.reviewed =>
        'Örnek inceleme yalnız belirtilen iş ve kanıt kapsamını destekliyor.',
      HistoryMeaning.disputed =>
        'Bildirilen sonuç ile diğer açıklama çelişiyor; itiraz çözülmedi.',
      HistoryMeaning.withdrawn => 'Örnek kanıt geri çekildi. Bugünkü değerlendirme eski izden ayrı ele alınır.',
      HistoryMeaning.unresolved =>
        'Yeterli destek yok; bugün kesin sonuç gösterilmiyor.',
    },
    HistoryField.corrections: corrected
        ? 'Bir düzeltme bildirildi; önceki ve yeni bilgi, zaman ve gerekçe korunur.'
        : 'Bu kaynağa göre gösterilecek düzeltme bildirilmedi; başka kaynaklar adına sonuç çıkarılmaz.',
    HistoryField.reviewer: 'Örnek inceleyen · test verisi',
    HistoryField.uncertainty:
        'İşçilik ve fiziksel güvenlik sonucu bu örnekten kesinleştirilemez.',
    HistoryField.notes: 'PRIVATE_NOTE_CANARY',
    HistoryField.contact: 'PRIVATE_CONTACT_CANARY',
  };
  final versionSeed = HistoryRevision(
    id: 'version-example',
    revision: 'version-r1',
    field: privateRevision ? HistoryField.contact : HistoryField.outcome,
    classificationRevision: 'version-classification-r1',
    before: privateRevision
        ? 'OLD_PRIVATE_VALUE_CANARY'
        : 'İşin bir bölümü açık kaldı.',
    after: privateRevision
        ? 'NEW_PRIVATE_VALUE_CANARY'
        : 'Kalan bölümün yapıldığı bildirildi.',
    changedAt: '04.10.2026 · örnek düzeltme zamanı',
    reason: privateRevision
        ? 'PRIVATE_REASON_CANARY'
        : 'İlk beyanın kapsamını açıklamak için güncellendi.',
  );
  HistoryRecord build(
    List<HistoryRevision> versions,
    Map<HistoryReadDimension, HistoryReference?> dims,
    Map<HistoryField, HistoryReference?> fields,
    HistoryReference? recordRef,
    HistoryReference? evalRef,
    HistoryReference? versionsRef,
  ) => HistoryRecord(
    scope: own,
    id: id,
    revision: revision,
    evaluationId: 'evaluation-example',
    evaluationRevision: evaluation,
    classificationRevision: classification,
    meaning: meaning,
    highRisk: highRisk,
    values: values,
    revisions: versions,
    readDimensions: dims,
    fieldReferences: fields,
    authority: recordRef,
    evaluationAuthority: evalRef,
    revisionAuthority: versionsRef,
  );
  final seed = build(corrected ? [versionSeed] : [], {}, {}, null, null, null);
  final version = HistoryRevision(
    id: versionSeed.id,
    revision: versionSeed.revision,
    field: versionSeed.field,
    classificationRevision: versionSeed.classificationRevision,
    before: versionSeed.before,
    after: versionSeed.after,
    changedAt: versionSeed.changedAt,
    reason: versionSeed.reason,
    readAuthority: missingVersionRead
        ? null
        : _ref(
            'history-revision-field',
            '${seed.readSubject}/version:${versionSeed.subject}',
            scope: own,
            request: request,
          ),
  );
  return build(
    corrected ? [version] : [],
    {
      for (final dimension in HistoryReadDimension.values)
        dimension: dimensionOverrides.containsKey(dimension)
            ? dimensionOverrides[dimension]
            : _ref(
                'history-read',
                '${seed.readSubject}/${dimension.name}',
                scope: own,
                request: request,
              ),
    },
    {
      for (final field in HistoryField.values)
        field: fieldOverrides.containsKey(field)
            ? fieldOverrides[field]
            : (!allowPrivate &&
                  (field == HistoryField.notes ||
                      field == HistoryField.contact))
            ? null
            : _ref(
                'history-read-field',
                '${seed.readSubject}/${field.name}',
                scope: own,
                request: request,
              ),
    },
    missingAuthority
        ? null
        : authority ??
              _ref(
                'history-record',
                seed.subject,
                scope: own,
                request: request,
              ),
    missingEvaluation
        ? null
        : evaluationAuthority ??
              _ref(
                'history-evaluation',
                seed.evaluationSubject,
                scope: own,
                request: request,
              ),
    missingVersions
        ? null
        : versionAuthority ??
              _ref(
                'history-revisions',
                seed.revisionSubject,
                scope: own,
                request: request,
              ),
  );
}

HistoryExportPlan _plan(
  List<HistoryRecord> records, {
  HistoryScope? scope,
  String request = _request,
  Map<String, Set<HistoryField>>? fields,
  bool missingAuthority = false,
  bool missingCoverage = false,
  HistoryReference? authority,
  Map<HistoryExportDimension, HistoryReference?> overrides = const {},
}) {
  final own = scope ?? _scope();
  final selection =
      fields ??
      {
        for (final record in records)
          record.memberSubject: record.requiredFields,
      };
  final seed = HistoryExportPlan(
    scope: own,
    requestId: request,
    id: 'export-example',
    revision: 'export-r1',
    fields: selection,
    dimensions: {},
  );
  return HistoryExportPlan(
    scope: own,
    requestId: request,
    id: seed.id,
    revision: seed.revision,
    fields: selection,
    dimensions: {
      for (final d in HistoryExportDimension.values)
        d: overrides.containsKey(d)
            ? overrides[d]
            : _ref(
                'history-export',
                '${seed.subject}/${d.name}',
                scope: own,
                request: request,
              ),
    },
    authority: missingAuthority
        ? null
        : authority ??
              _ref(
                'history-export-scope',
                seed.subject,
                scope: own,
                request: request,
              ),
    coverageAuthority: missingCoverage
        ? null
        : _ref(
            'history-export-coverage',
            seed.subject,
            scope: own,
            request: request,
          ),
  );
}

HistorySnapshot _snapshot({
  List<HistoryRecord>? records,
  HistoryScope? scope,
  String request = _request,
  HistoryOrigin origin = HistoryOrigin.canonicalSnapshot,
  bool missingCatalog = false,
  bool missingPlan = false,
  bool inactive = false,
  bool subscribed = false,
  HistoryReference? catalog,
  HistoryExportPlan? plan,
}) {
  final own = scope ?? _scope(), rows = records ?? [_record()];
  final seed = HistorySnapshot(scope: own, requestId: request, records: rows);
  return HistorySnapshot(
    scope: own,
    requestId: request,
    records: rows,
    authority: missingCatalog
        ? null
        : catalog ??
              _ref(
                'history-catalog',
                seed.subject,
                scope: own,
                request: request,
              ),
    origin: origin,
    exportPlan: missingPlan
        ? null
        : plan ?? _plan(rows, scope: own, request: request),
    inactiveMotorcycle: inactive,
    subscribed: subscribed,
  );
}

HistoryView _view({
  HistorySnapshot? snapshot,
  HistoryScope? scope,
  String request = _request,
  HistoryPage page = HistoryPage.detail,
  String? selected = 'record-example',
  HistoryRequestPhase phase = HistoryRequestPhase.idle,
  bool missingSnapshot = false,
  bool noHandler = false,
  ValueChanged<HistoryIntent>? record,
  Key? key,
}) => HistoryView(
  key: key,
  scope: scope ?? _scope(),
  requestId: request,
  brandLabel: 'Kavriva · test örneği',
  snapshot: missingSnapshot ? null : snapshot ?? _snapshot(),
  initialPage: page,
  initialRecordId: selected,
  phase: phase,
  onIntent: noHandler ? null : record ?? (_) {},
);

Widget _app(Widget content, {double scale = 1, String? font}) => _Input(
  content: content,
  scale: scale,
  font: font,
  child: WidgetsApp(
    color: const Color(0xFFFFFFFF),
    debugShowCheckedModeBanner: false,
    onGenerateRoute: (_) =>
        PageRouteBuilder<void>(pageBuilder: (_, __, ___) => const _Scene()),
  ),
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
        key: const ValueKey('history-capture'),
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
  WidgetTester tester,
  Widget content, {
  double scale = 1,
  double width = 390,
  String? font,
}) async {
  tester.view.physicalSize = Size(width, 844);
  tester.view.devicePixelRatio = 1;
  await tester.pumpWidget(_app(content, scale: scale, font: font));
  await tester.pumpAndSettle();
}

Future<void> _tap(WidgetTester tester, String key) async {
  final target = find.byKey(ValueKey(key));
  await tester.ensureVisible(target);
  await tester.pumpAndSettle();
  await tester.tap(target);
  await tester.pumpAndSettle();
}

VoidCallback? _callback(WidgetTester tester, String key) =>
    (tester.widget(find.byKey(ValueKey(key))) as dynamic).onActivate
        as VoidCallback?;
String _allText(WidgetTester tester) => tester
    .widgetList<Text>(find.byType(Text))
    .map((w) => w.data ?? w.textSpan?.toPlainText() ?? '')
    .join('\n');

Map<String, HistoryView> _cases() {
  final reported = _record(), corrected = _record(corrected: true);
  final private = _record(corrected: true, privateRevision: true);
  final missingField = _record(fieldOverrides: {HistoryField.outcome: null});
  final deniedExport = _plan(
    [reported],
    overrides: {HistoryExportDimension.authorization: null},
  );
  return {
    'list': _view(
      page: HistoryPage.list,
      snapshot: _snapshot(
        records: [
          reported,
          _record(
            id: 'brake-example',
            title: 'Fren kontrolü',
            meaning: HistoryMeaning.reviewed,
            highRisk: true,
          ),
          _record(
            id: 'light-example',
            title: 'Görüş kontrolü',
            corrected: true,
          ),
        ],
      ),
    ),
    'detail-reported': _view(),
    for (final meaning in HistoryMeaning.values.where(
      (m) => m != HistoryMeaning.reported,
    ))
      'detail-${meaning.name}': _view(
        snapshot: _snapshot(records: [_record(meaning: meaning)]),
      ),
    'detail-high-risk': _view(
      snapshot: _snapshot(
        records: [_record(meaning: HistoryMeaning.reviewed, highRisk: true)],
      ),
    ),
    'detail-corrected': _view(snapshot: _snapshot(records: [corrected])),
    'detail-private-version': _view(snapshot: _snapshot(records: [private])),
    'detail-no-evaluation': _view(
      snapshot: _snapshot(records: [_record(missingEvaluation: true)]),
    ),
    'detail-no-source': _view(
      snapshot: _snapshot(records: [_record(missingAuthority: true)]),
    ),
    'detail-field-denied': _view(snapshot: _snapshot(records: [missingField])),
    'detail-missing': _view(selected: 'not-a-record'),
    'catalog-missing': _view(missingSnapshot: true),
    'catalog-held': _view(
      snapshot: _snapshot(
        catalog: _ref(
          'history-catalog',
          _snapshot().subject,
          state: HistoryReferenceState.held,
        ),
      ),
    ),
    'catalog-stale': _view(
      snapshot: _snapshot(
        catalog: _ref('history-catalog', _snapshot().subject, current: false),
      ),
    ),
    'catalog-foreign': _view(
      snapshot: _snapshot(
        scope: _scope(bike: 'other'),
        records: [
          _record(
            scope: _scope(bike: 'other'),
            title: 'FOREIGN_SECRET_CANARY',
          ),
        ],
      ),
    ),
    'historical-copy': _view(
      snapshot: _snapshot(origin: HistoryOrigin.historicalCopy),
    ),
    'empty-list': _view(
      page: HistoryPage.list,
      snapshot: _snapshot(records: []),
    ),
    'inactive-list': _view(
      page: HistoryPage.list,
      snapshot: _snapshot(inactive: true),
    ),
    'export-ready': _view(page: HistoryPage.exportScope),
    'export-corrected': _view(
      page: HistoryPage.exportScope,
      snapshot: _snapshot(records: [corrected]),
    ),
    'export-denied': _view(
      page: HistoryPage.exportScope,
      snapshot: _snapshot(plan: deniedExport),
    ),
    'export-missing': _view(
      page: HistoryPage.exportScope,
      snapshot: _snapshot(missingPlan: true),
    ),
    'export-missing-coverage': _view(
      page: HistoryPage.exportScope,
      snapshot: _snapshot(plan: _plan([reported], missingCoverage: true)),
    ),
    'export-no-handler': _view(page: HistoryPage.exportScope, noHandler: true),
    'export-submitting': _view(
      page: HistoryPage.exportScope,
      phase: HistoryRequestPhase.submitting,
    ),
    'export-failed': _view(
      page: HistoryPage.exportScope,
      phase: HistoryRequestPhase.failed,
    ),
    'export-unknown': _view(
      page: HistoryPage.exportScope,
      phase: HistoryRequestPhase.outcomeUnknown,
    ),
  };
}

void main() {
  WidgetController.hitTestWarningShouldBeFatal = true;
  tearDown(() {
    TestWidgetsFlutterBinding.instance.platformDispatcher.clearAllTestValues();
  });
  test(
    'değişmez girişler ve eksik alanlar gerçek kopya veya yetki üretmez',
    () {
      final row = _record();
      expect(
        () => row.values[HistoryField.title] = 'changed',
        throwsUnsupportedError,
      );
      expect(() => row.fieldReferences.clear(), throwsUnsupportedError);
      expect(() => _snapshot().records.clear(), throwsUnsupportedError);
      expect(
        () => _plan([row]).fields[row.memberSubject]!.clear(),
        throwsUnsupportedError,
      );
      expect(() => _scope(bike: ' '), throwsArgumentError);
      expect(
        _snapshot(missingCatalog: true).readable(_scope(), _request),
        isEmpty,
      );
    },
  );
  testWidgets(
    'servis aktörü ve belge doğrulanmış işe yükselmez; anlam sonuç ve kanıt ayrı',
    (tester) async {
      await _pump(tester, _view());
      final text = _allText(tester);
      expect(text, contains('Kullanıcının beyanı'));
      expect(text, contains('Bildirilen bakım sonucu'));
      expect(text, contains('Dış servis'));
      expect(text, contains('tek başına işin doğrulandığı anlamına gelmez'));
      expect(text, isNot(contains('Belirtilen kanıt kapsamında incelenmiş')));
      await _pump(
        tester,
        _view(
          key: const ValueKey('documented'),
          snapshot: _snapshot(
            records: [_record(meaning: HistoryMeaning.documented)],
          ),
        ),
      );
      expect(
        _allText(tester),
        contains('Belge var; iş henüz doğrulanmış sayılmaz'),
      );
    },
  );
  testWidgets(
    'yüksek riskin kaynak inceleyen ve bilinmeyenleri ilk seviyede kalır',
    (tester) async {
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(
            records: [
              _record(highRisk: true, meaning: HistoryMeaning.reviewed),
            ],
          ),
        ),
      );
      expect(_allText(tester), contains('Önemli iddia ve bilinmeyenler'));
      expect(_allText(tester), contains('İnceleyen: Örnek inceleyen'));
      expect(_allText(tester), contains('kusursuz işçilik garantisi değildir'));
      await _pump(
        tester,
        _view(
          key: const ValueKey('deny-reviewer'),
          snapshot: _snapshot(
            records: [
              _record(
                highRisk: true,
                fieldOverrides: {HistoryField.reviewer: null},
              ),
            ],
          ),
        ),
      );
      expect(_allText(tester), isNot(contains('Yağ bakımı')));
    },
  );
  testWidgets(
    'güncel değerlendirme yoksa son sürüm winner veya doğrulama sayılmaz',
    (tester) async {
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(
            records: [
              _record(
                meaning: HistoryMeaning.reviewed,
                missingEvaluation: true,
              ),
            ],
          ),
        ),
      );
      expect(
        _allText(tester),
        contains('Bugünkü değerlendirme henüz doğrulanmadı'),
      );
      expect(
        _allText(tester),
        contains('Son yazılan kayıt kendiliğinden kesin doğru sayılmaz'),
      );
      expect(
        _allText(tester),
        isNot(contains('Belirtilen kanıt kapsamında incelenmiş')),
      );
    },
  );
  testWidgets(
    'düzeltme önceki yeni zaman gerekçe izini korur ve istem üzerine açılır',
    (tester) async {
      await _pump(
        tester,
        _view(snapshot: _snapshot(records: [_record(corrected: true)])),
      );
      expect(
        _allText(tester),
        isNot(contains('Önceki bilgi: İşin bir bölümü')),
      );
      await _tap(tester, 'history-versions');
      final text = _allText(tester);
      expect(text, contains('Önceki bilgi: İşin bir bölümü açık kaldı'));
      expect(text, contains('Yeni bilgi: Kalan bölümün yapıldığı bildirildi'));
      expect(text, contains('Değişiklik zamanı: 04.10.2026'));
      expect(text, contains('Gerekçe: İlk beyanın kapsamını açıklamak'));
    },
  );
  testWidgets(
    'özel alanın eski değeri ve gerekçesi sürüm yetkisi olsa da sızmaz',
    (tester) async {
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(
            records: [_record(corrected: true, privateRevision: true)],
          ),
        ),
      );
      await _tap(tester, 'history-versions');
      final text = _allText(tester);
      expect(
        text,
        contains('Bu sürümün özel alanları için güncel okuma izni yok'),
      );
      for (final canary in [
        'OLD_PRIVATE_VALUE_CANARY',
        'NEW_PRIVATE_VALUE_CANARY',
        'PRIVATE_REASON_CANARY',
        'PRIVATE_CONTACT_CANARY',
        'PRIVATE_NOTE_CANARY',
      ])
        expect(text, isNot(contains(canary)));
    },
  );
  testWidgets(
    'sürümün ayrı güncel alan izni yoksa geçmişteki değerler açılmaz',
    (tester) async {
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(
            records: [_record(corrected: true, missingVersionRead: true)],
          ),
        ),
      );
      await _tap(tester, 'history-versions');
      expect(_allText(tester), isNot(contains('işin bir bölümü açık kaldı')));
      expect(
        _allText(tester),
        contains('Eski değerler, açıklama ve gerekçe açılmıyor'),
      );
    },
  );
  testWidgets('itiraz ve geri çekilmede eski iz ve bugünkü anlam ayrıdır', (
    tester,
  ) async {
    await _pump(
      tester,
      _view(
        snapshot: _snapshot(
          records: [_record(meaning: HistoryMeaning.disputed, corrected: true)],
        ),
      ),
    );
    expect(
      _allText(tester),
      contains('Bir taraf kesin doğru veya kazanan gösterilmiyor'),
    );
    await _pump(
      tester,
      _view(
        key: const ValueKey('withdrawn'),
        snapshot: _snapshot(
          records: [
            _record(meaning: HistoryMeaning.withdrawn, corrected: true),
          ],
        ),
      ),
    );
    expect(
      _allText(tester),
      contains('Eski iz ve bağımsız kayıtlar sessizce silinmez'),
    );
    await _tap(tester, 'history-versions');
    expect(_allText(tester), contains('Önceki bilgi:'));
  });
  testWidgets(
    'kaynak ayrıntısı önce gizlidir; kaynağın yenilenmesi açılımı kapatır',
    (tester) async {
      await _pump(tester, _view());
      expect(_allText(tester), isNot(contains('Kaynak sürümü:')));
      await _tap(tester, 'history-source');
      expect(_allText(tester), contains('Kaynak sürümü: örnek-r1'));
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(records: [_record(evaluation: 'evaluation-r2')]),
        ),
      );
      expect(_allText(tester), isNot(contains('Kaynak sürümü:')));
    },
  );
  testWidgets(
    'katalog yok eski yabancı held ve tarihsel kopya özel içerik açmaz',
    (tester) async {
      final cases = _cases();
      for (final name in [
        'catalog-missing',
        'catalog-held',
        'catalog-stale',
        'catalog-foreign',
        'historical-copy',
      ]) {
        await _pump(
          tester,
          KeyedSubtree(key: ValueKey(name), child: cases[name]!),
        );
        expect(_allText(tester), isNot(contains('Yağ bakımı')), reason: name);
        expect(
          _allText(tester),
          isNot(contains('FOREIGN_SECRET_CANARY')),
          reason: name,
        );
      }
      expect(_allText(tester), contains('Bu eski kopya güncel kayıt değildir'));
    },
  );
  testWidgets('okuma kapısının bütün boyutları tam güncel tuple ister', (
    tester,
  ) async {
    final row = _record();
    for (final d in HistoryReadDimension.values) {
      final subject = '${row.readSubject}/${d.name}';
      final variants = <HistoryReference?>[
        null,
        _ref('history-read', subject, current: false),
        _ref('history-read', subject, state: HistoryReferenceState.held),
        _ref('history-read', subject, state: HistoryReferenceState.unknown),
        _ref('history-read', subject, scope: _scope(bike: 'other')),
        _ref('history-read', subject, request: 'old-request'),
        _ref('other-purpose', subject),
        _ref('history-read', 'other-subject'),
      ];
      for (var i = 0; i < variants.length; i++) {
        await _pump(
          tester,
          _view(
            key: ValueKey('${d.name}-$i'),
            snapshot: _snapshot(
              records: [
                _record(dimensionOverrides: {d: variants[i]}),
              ],
            ),
          ),
        );
        expect(
          _allText(tester),
          isNot(contains('Yağ bakımı')),
          reason: '${d.name}/$i',
        );
      }
    }
  });
  testWidgets(
    'alan izinleri tek tek bağlanır ve gizli değer semantik ağaca da girmez',
    (tester) async {
      final semantics = tester.ensureSemantics();
      try {
        for (final field in _core) {
          await _pump(
            tester,
            _view(
              key: ValueKey(field),
              snapshot: _snapshot(
                records: [
                  _record(fieldOverrides: {field: null}),
                ],
              ),
            ),
          );
          expect(
            _allText(tester),
            isNot(contains('Yağ bakımı')),
            reason: field.name,
          );
        }
        await _pump(tester, _view(key: const ValueKey('private-hidden')));
        expect(_allText(tester), isNot(contains('PRIVATE_')));
        expect(
          tester
              .getSemantics(find.byKey(const ValueKey('history-scroll')))
              .toStringDeep(),
          isNot(contains('PRIVATE_')),
        );
      } finally {
        semantics.dispose();
      }
    },
  );
  testWidgets('liste arama ve düzeltme filtresi erişilebilir kayıtları bulur', (
    tester,
  ) async {
    final rows = [
      _record(),
      _record(id: 'view-example', title: 'Görüş kontrolü', corrected: true),
    ];
    await _pump(
      tester,
      _view(
        page: HistoryPage.list,
        snapshot: _snapshot(records: rows),
      ),
    );
    await tester.enterText(
      find.byKey(const ValueKey('history-search')),
      'Görüş',
    );
    await tester.pumpAndSettle();
    expect(_allText(tester), contains('Görüş kontrolü'));
    expect(_allText(tester), isNot(contains('Yağ bakımı')));
    await tester.enterText(find.byKey(const ValueKey('history-search')), '');
    await tester.pumpAndSettle();
    await _tap(tester, 'history-filter-corrected');
    expect(_allText(tester), contains('Görüş kontrolü'));
    expect(_allText(tester), isNot(contains('Yağ bakımı')));
    await _tap(tester, 'history-open-${rows.last.subject}');
    expect(_allText(tester), contains('Kaydın bugünkü anlamı'));
  });
  testWidgets('boş filtre ve boş kaynak tamamlanma iddiasına dönüşmez', (
    tester,
  ) async {
    await _pump(
      tester,
      _view(
        page: HistoryPage.list,
        snapshot: _snapshot(records: []),
      ),
    );
    expect(_allText(tester), contains('Bu kaynakta henüz kayıt yok'));
    await _pump(
      tester,
      _view(key: const ValueKey('nonempty'), page: HistoryPage.list),
    );
    await tester.enterText(
      find.byKey(const ValueKey('history-search')),
      'bulunmayan',
    );
    await tester.pumpAndSettle();
    expect(_allText(tester), contains('Bu görünümde kayıt bulunamadı'));
    expect(
      _allText(tester),
      contains('bütün bakımların tamamlandığını göstermez'),
    );
  });
  testWidgets(
    'pasif motosiklet ve paket değişimi temel geçmişi geriye dönük kapatmaz',
    (tester) async {
      for (final paid in [false, true]) {
        await _pump(
          tester,
          _view(
            key: ValueKey(paid),
            page: HistoryPage.list,
            snapshot: _snapshot(inactive: true, subscribed: paid),
          ),
        );
        expect(_allText(tester), contains('Yağ bakımı'));
        expect(_allText(tester), contains('Bu motosiklet pasif'));
        expect(_allText(tester), contains('geriye dönük kapanmaz'));
      }
    },
  );
  testWidgets(
    'kopya kapsamı kaynak düzeltme ve dışarıda kalan alanları gösterir değer sızdırmaz',
    (tester) async {
      final intents = <HistoryIntent>[];
      await _pump(
        tester,
        _view(page: HistoryPage.exportScope, record: intents.add),
      );
      final text = _allText(tester);
      expect(text, contains('Kopyaya girecek kayıtlar'));
      expect(text, contains('Düzeltme ve itiraz geçmişi'));
      expect(text, contains('Dışarıda kalan bilgiler:'));
      expect(text, contains('İletişim bilgileri'));
      expect(text, isNot(contains('PRIVATE_CONTACT_CANARY')));
      expect(text, contains('asıl kayıtları değiştirmez veya silmez'));
      expect(text, contains('kopyaları geri almaz'));
      expect(intents, isEmpty);
      await _tap(tester, 'history-export');
      expect(intents.single.action, HistoryAction.exportCopy);
      expect(intents.single.exportPlanId, 'export-example');
      expect(_allText(tester), contains('İstek gönderildi; sonuç bekleniyor'));
    },
  );
  testWidgets(
    'okuma izni dışarı aktarma izni değildir; altı güncel boyut zorunlu',
    (tester) async {
      final row = _record(), intents = <HistoryIntent>[];
      for (final d in HistoryExportDimension.values) {
        final seed = _plan([row]);
        final subject = '${seed.subject}/${d.name}';
        final variants = <HistoryReference?>[
          null,
          _ref('history-export', subject, current: false),
          _ref('history-export', subject, state: HistoryReferenceState.held),
          _ref('history-export', subject, scope: _scope(bike: 'other')),
          _ref('history-export', subject, request: 'old-request'),
          _ref('wrong-purpose', subject),
          _ref('history-export', 'wrong-subject'),
        ];
        for (var i = 0; i < variants.length; i++) {
          await _pump(
            tester,
            _view(
              key: ValueKey('export-${d.name}-$i'),
              page: HistoryPage.exportScope,
              record: intents.add,
              snapshot: _snapshot(
                records: [row],
                plan: _plan([row], overrides: {d: variants[i]}),
              ),
            ),
          );
          expect(_allText(tester), contains('Yağ bakımı'));
          expect(
            _callback(tester, 'history-export'),
            isNull,
            reason: '${d.name}/$i',
          );
        }
      }
      expect(intents, isEmpty);
    },
  );
  testWidgets(
    'zorunlu bağlam alanlarının her eksikliği kopya isteğini kapatır',
    (tester) async {
      final row = _record();
      for (final field in _core) {
        final fields = {..._core}..remove(field);
        await _pump(
          tester,
          _view(
            key: ValueKey('missing-${field.name}'),
            page: HistoryPage.exportScope,
            snapshot: _snapshot(
              records: [row],
              plan: _plan([row], fields: {row.memberSubject: fields}),
            ),
          ),
        );
        expect(_callback(tester, 'history-export'), isNull);
        expect(_allText(tester), contains('Kopya kapsamı henüz doğrulanmadı'));
      }
    },
  );
  testWidgets(
    'kapsam dışı özel alan planla istense de okuma izni olmadan dışarı çıkmaz',
    (tester) async {
      final row = _record();
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          snapshot: _snapshot(
            records: [row],
            plan: _plan(
              [row],
              fields: {
                row.memberSubject: {..._core, HistoryField.contact},
              },
            ),
          ),
        ),
      );
      expect(_callback(tester, 'history-export'), isNull);
      expect(_allText(tester), isNot(contains('PRIVATE_CONTACT_CANARY')));
    },
  );
  testWidgets(
    'eski değerlendirme sınıflandırma veya düzeltme izinin kopya kanıtı yenisini açmaz',
    (tester) async {
      final old = _record(corrected: true),
          oldPlan = _plan([_record(corrected: true)]);
      for (final updated in [
        _record(corrected: true, evaluation: 'evaluation-r2'),
        _record(corrected: true, classification: 'classification-r2'),
        _record(corrected: false),
        _record(corrected: true, revision: 'record-r2'),
      ]) {
        expect(updated.memberSubject, isNot(old.memberSubject));
        await _pump(
          tester,
          _view(
            key: ValueKey(updated.memberSubject),
            page: HistoryPage.exportScope,
            snapshot: _snapshot(records: [updated], plan: oldPlan),
          ),
        );
        expect(_callback(tester, 'history-export'), isNull);
        final remapped = _plan([updated], authority: oldPlan.authority);
        await _pump(
          tester,
          _view(
            key: ValueKey('remapped-${updated.memberSubject}'),
            page: HistoryPage.exportScope,
            snapshot: _snapshot(records: [updated], plan: remapped),
          ),
        );
        expect(_callback(tester, 'history-export'), isNull);
      }
    },
  );
  testWidgets(
    'alan sınıflandırması değişince eski okuma kanıtı güncel değeri açmaz',
    (tester) async {
      final old = _record();
      await _pump(
        tester,
        _view(
          snapshot: _snapshot(
            records: [
              _record(
                classification: 'classification-r2',
                fieldOverrides: {
                  HistoryField.outcome:
                      old.fieldReferences[HistoryField.outcome],
                },
              ),
            ],
          ),
        ),
      );
      expect(_allText(tester), isNot(contains('Yağ bakımı')));
    },
  );
  testWidgets(
    'işleyici yok busy hata veya bilinmeyen sonuç normal kopya isteğini açmaz',
    (tester) async {
      final intents = <HistoryIntent>[];
      for (final phase in HistoryRequestPhase.values.where(
        (p) => p != HistoryRequestPhase.idle,
      )) {
        await _pump(
          tester,
          _view(
            key: ValueKey(phase),
            page: HistoryPage.exportScope,
            phase: phase,
            record: intents.add,
          ),
        );
        expect(_callback(tester, 'history-export'), isNull);
        if (phase == HistoryRequestPhase.outcomeUnknown) {
          await _tap(tester, 'history-reconcile');
          expect(intents.single.action, HistoryAction.reconcile);
          expect(intents.single.requestId, _request);
        }
      }
      await _pump(
        tester,
        _view(
          key: const ValueKey('no-handler'),
          page: HistoryPage.exportScope,
          noHandler: true,
        ),
      );
      expect(_callback(tester, 'history-export'), isNull);
      expect(_allText(tester), contains('henüz bağlanmadı'));
      expect(
        intents.where((i) => i.action == HistoryAction.exportCopy),
        isEmpty,
      );
    },
  );
  testWidgets(
    'aynı istekte kaynak yenilemek gönderildi kilidini ve çift gönderim korumasını kaldırmaz',
    (tester) async {
      final intents = <HistoryIntent>[];
      await _pump(
        tester,
        _view(page: HistoryPage.exportScope, record: intents.add),
      );
      final original = _callback(tester, 'history-export')!;
      original();
      original();
      await tester.pumpAndSettle();
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          record: intents.add,
          snapshot: _snapshot(),
        ),
      );
      expect(_callback(tester, 'history-export'), isNull);
      expect(intents, hasLength(1));
    },
  );
  testWidgets('eski kopya düğmesi yeni isteğin olumlu iznini ödünç alamaz', (
    tester,
  ) async {
    final intents = <HistoryIntent>[];
    await _pump(
      tester,
      _view(page: HistoryPage.exportScope, record: intents.add),
    );
    final old = _callback(tester, 'history-export')!;
    await _pump(
      tester,
      _view(
        page: HistoryPage.exportScope,
        request: 'request-r2',
        snapshot: _snapshot(
          request: 'request-r2',
          records: [_record(request: 'request-r2')],
        ),
        record: intents.add,
      ),
    );
    old();
    expect(intents, isEmpty);
    await _tap(tester, 'history-export');
    expect(intents.single.requestId, 'request-r2');
  });
  testWidgets(
    'eski düğme güncel olumsuz izni silinen veya farklı revizyonlu hedefi kullanamaz',
    (tester) async {
      final row = _record(), intents = <HistoryIntent>[];
      await _pump(
        tester,
        _view(page: HistoryPage.exportScope, record: intents.add),
      );
      final old = _callback(tester, 'history-export')!;
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          record: intents.add,
          snapshot: _snapshot(
            plan: _plan([row], overrides: {HistoryExportDimension.audit: null}),
          ),
        ),
      );
      old();
      expect(intents, isEmpty);
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          record: intents.add,
          snapshot: _snapshot(records: [_record(revision: 'record-r2')]),
        ),
      );
      old();
      expect(intents, isEmpty);
      await _tap(tester, 'history-export');
      expect(intents, hasLength(1));
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          record: intents.add,
          snapshot: _snapshot(records: []),
        ),
      );
      old();
      expect(intents, hasLength(1));
    },
  );
  testWidgets('eski liste kaydı ve unmounted düğme yeni bağlamda çalışmaz', (
    tester,
  ) async {
    final row = _record();
    await _pump(tester, _view(page: HistoryPage.list));
    final old = _callback(tester, 'history-open-${row.subject}')!;
    await _pump(
      tester,
      _view(
        page: HistoryPage.list,
        request: 'request-r2',
        snapshot: _snapshot(
          request: 'request-r2',
          records: [_record(request: 'request-r2')],
        ),
      ),
    );
    old();
    await tester.pumpAndSettle();
    expect(_allText(tester), contains('Bakım geçmişi'));
    final intents = <HistoryIntent>[];
    await _pump(
      tester,
      _view(
        key: const ValueKey('export-new'),
        page: HistoryPage.exportScope,
        record: intents.add,
      ),
    );
    final detached = _callback(tester, 'history-export')!;
    await tester.pumpWidget(const SizedBox());
    detached();
    expect(intents, isEmpty);
  });
  testWidgets('çift kimlik ve eski katalog üyeliği yanlış özel kaydı seçmez', (
    tester,
  ) async {
    final old = _snapshot();
    for (final rows in [
      [_record(), _record(title: 'DUPLICATE_SECRET')],
      [_record(), _record(id: 'added', title: 'ADDED_SECRET')],
    ]) {
      await _pump(
        tester,
        _view(
          key: ValueKey(
            rows.length.toString() + rows.last.values[HistoryField.title]!,
          ),
          snapshot: _snapshot(records: rows, catalog: old.authority),
        ),
      );
      expect(_allText(tester), isNot(contains('Yağ bakımı')));
      expect(_allText(tester), isNot(contains('SECRET')));
    }
  });
  test('ayraçlar ve eşleşmemiş UTF16 kimlikleri kaynak veya izinleri birbirine taşımaz', () {
    final pairs = [
      (_record(id: 'a/b', revision: 'c'), _record(id: 'a', revision: 'b/c')),
      (_record(id: 'a,b'), _record(id: 'a%2Cb')),
    ];
    for (final pair in pairs) expect(pair.$1.subject, isNot(pair.$2.subject));
    final names = [
      String.fromCharCode(0xd800),
      String.fromCharCode(0xd801),
      '\uFFFD',
      '%ud800',
    ];
    final rows = names.map((id) => _record(id: id)).toList();
    expect(rows.map((r) => r.memberSubject).toSet(), hasLength(names.length));
    for (final row in rows) {
      expect(row.readable(_scope(), _request), isTrue);
      for (final other in rows.where((r) => r.id != row.id)) {
        expect(
          _record(
            id: row.id,
            authority: other.authority,
          ).readable(_scope(), _request),
          isFalse,
        );
        expect(
          _record(
            id: row.id,
            dimensionOverrides: {
              HistoryReadDimension.authorization:
                  other.readDimensions[HistoryReadDimension.authorization],
            },
          ).readable(_scope(), _request),
          isFalse,
        );
      }
    }
  });
  testWidgets(
    'gerçek klavye Tab Enter Space kaynak açar ve odak etiket değişiminde kalır',
    (tester) async {
      await _pump(tester, _view());
      final target = find.byKey(const ValueKey('history-source'));
      await tester.ensureVisible(target);
      await tester.pumpAndSettle();
      final detector = tester.widget<FocusableActionDetector>(
        find.descendant(
          of: target,
          matching: find.byType(FocusableActionDetector),
        ),
      );
      final focus = find
          .descendant(of: target, matching: find.byType(Focus))
          .first;
      tester.widget<Focus>(focus).focusNode?.requestFocus();
      // Gerçek Tab olaylarıyla kaynağın odak düğümünü bul.
      for (
        var i = 0;
        i < 30 &&
            !Focus.of(
              tester.element(
                find
                    .descendant(of: target, matching: find.byType(Semantics))
                    .first,
              ),
            ).hasFocus;
        i++
      ) {
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();
      }
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pumpAndSettle();
      expect(_allText(tester), contains('Kaynak sürümü:'));
      await tester.sendKeyEvent(LogicalKeyboardKey.space);
      await tester.pumpAndSettle();
      expect(_allText(tester), isNot(contains('Kaynak sürümü:')));
      expect(detector.enabled, isTrue);
    },
  );
  testWidgets('çizilmiş eylem metni ve gerçek klavye odağı okunabilir', (
    tester,
  ) async {
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return (x > y ? x + .05 : y + .05) / (x > y ? y + .05 : x + .05);
    }

    await _pump(tester, _view(page: HistoryPage.exportScope));
    final target = find.byKey(const ValueKey('history-export'));
    await tester.ensureVisible(target);
    await tester.pumpAndSettle();
    final paragraph = tester.renderObject<RenderParagraph>(
      find.descendant(of: target, matching: find.byType(RichText)).first,
    );
    BoxDecoration decoration() =>
        tester
                .widget<Container>(
                  find
                      .descendant(of: target, matching: find.byType(Container))
                      .first,
                )
                .decoration!
            as BoxDecoration;
    expect(
      contrast((paragraph.text as TextSpan).style!.color!, decoration().color!),
      greaterThanOrEqualTo(4.5),
    );
    for (
      var i = 0;
      i < 30 && (decoration().border! as Border).top.width != 3;
      i++
    ) {
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
    }
    final paint = decoration(), border = decoration().border! as Border;
    expect(border.top.width, 3);
    expect(contrast(border.top.color, paint.color!), greaterThanOrEqualTo(3));
    expect(tester.getSize(target).height, greaterThanOrEqualTo(52));
  });
  testWidgets(
    'kapalı düğme semantik olarak da kapalı ve durum canlı açıklanır',
    (tester) async {
      await _pump(
        tester,
        _view(
          page: HistoryPage.exportScope,
          phase: HistoryRequestPhase.submitting,
        ),
      );
      final semantics = tester.widget<Semantics>(
        find
            .descendant(
              of: find.byKey(const ValueKey('history-export')),
              matching: find.byWidgetPredicate(
                (w) => w is Semantics && w.properties.button == true,
              ),
            )
            .first,
      );
      expect(semantics.properties.enabled, isFalse);
      expect(semantics.properties.onTap, isNull);
      expect(
        tester
            .widgetList<Semantics>(find.byType(Semantics))
            .any((s) => s.properties.liveRegion == true),
        isTrue,
      );
    },
  );
  testWidgets(
    'bütün durumlar dar geniş ve büyük yazıda taşmadan sonuna erişilir',
    (tester) async {
      final cases = _cases();
      for (final width in [320.0, 390.0, 768.0]) {
        for (final scale in [1.0, 2.0, 3.0]) {
          for (final entry in cases.entries) {
            await _pump(
              tester,
              KeyedSubtree(
                key: ValueKey('${entry.key}-$width-$scale'),
                child: entry.value,
              ),
              width: width,
              scale: scale,
            );
            final scroll = tester.state<ScrollableState>(
              find
                  .descendant(
                    of: find.byKey(const ValueKey('history-scroll')),
                    matching: find.byType(Scrollable),
                  )
                  .first,
            );
            scroll.position.jumpTo(scroll.position.maxScrollExtent);
            await tester.pumpAndSettle();
            expect(
              tester.takeException(),
              isNull,
              reason: '${entry.key}/$width/$scale',
            );
            expect(
              tester.getSize(find.byKey(const ValueKey('history-exit'))).height,
              greaterThanOrEqualTo(52),
            );
          }
        }
      }
    },
  );

  final preview = Platform.environment['KAVRIVA_HISTORY_PREVIEW'];
  if (preview != null)
    testWidgets(
      'gerçek doğal çizimler bütün örnek durumlarda tam kaydırma ile kaydedilir',
      (tester) async {
        final fontPath = Platform.environment['KAVRIVA_HISTORY_FONT'];
        if (fontPath == null)
          throw StateError(
            'Gerçek görüntüler için sabit SDK font yolu gerekli.',
          );
        await tester.runAsync(() async {
          final bytes = await File(fontPath).readAsBytes();
          final loader = FontLoader('KavrivaHistoryNative')
            ..addFont(Future.value(ByteData.sublistView(bytes)));
          await loader.load();
        });
        final cases = _cases();
        final rows = <Map<String, Object>>[];
        for (final entry in cases.entries) {
          // Her örnek yeni kabukta başlar; önceki sayfanın kaydırması taşınmaz.
          await tester.pumpWidget(const SizedBox());
          await tester.pump();
          await _pump(
            tester,
            KeyedSubtree(key: ValueKey(entry.key), child: entry.value),
            font: 'KavrivaHistoryNative',
          );
          if (entry.key == 'detail-corrected' ||
              entry.key == 'detail-private-version')
            await _tap(tester, 'history-versions');
          if (entry.key == 'detail-high-risk')
            await _tap(tester, 'history-source');
          final scroll = tester.state<ScrollableState>(
            find
                .descendant(
                  of: find.byKey(const ValueKey('history-scroll')),
                  matching: find.byType(Scrollable),
                )
                .first,
          );
          scroll.position.jumpTo(0);
          await tester.pumpAndSettle();
          final end = scroll.position.maxScrollExtent;
          var index = 0;
          for (double offset = 0; ; offset = (offset + 620).clamp(0, end)) {
            scroll.position.jumpTo(offset);
            await tester.pumpAndSettle();
            final boundary = tester.renderObject<RenderRepaintBoundary>(
              find.byKey(const ValueKey('history-capture')),
            );
            final path = '$preview-${entry.key}-$index.png';
            await tester.runAsync(() async {
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
            rows.add({
              'state': entry.key,
              'path': path,
              'offset': offset,
              'end': end,
              'index': index,
            });
            index++;
            if (offset >= end) break;
          }
          expect(tester.takeException(), isNull, reason: entry.key);
        }
        // JSON çıktı paketi bağımlılığı gerektirmez; ham manifest daha sonra doğrulanır.
        await tester.runAsync(
          () => File('$preview-manifest.txt').writeAsString(
            rows
                .map(
                  (r) =>
                      '${r['state']}\t${r['path']}\t${r['offset']}\t${r['end']}\t${r['index']}',
                )
                .join('\n'),
          ),
        );
      },
    );
}
