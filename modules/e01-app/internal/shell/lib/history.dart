import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  final result = value.trim();
  if (result.isEmpty) throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return result;
}

String _identity(String value) {
  final units = value.codeUnits;
  var malformed = false;
  for (var i = 0; i < units.length; i++) {
    final unit = units[i];
    if (unit >= 0xd800 && unit <= 0xdbff) {
      if (i + 1 < units.length &&
          units[i + 1] >= 0xdc00 &&
          units[i + 1] <= 0xdfff) {
        i++;
      } else {
        malformed = true;
      }
    } else if (unit >= 0xdc00 && unit <= 0xdfff) {
      malformed = true;
    }
  }
  if (malformed) {
    return '%u${units.map((u) => u.toRadixString(16).padLeft(4, '0')).join()}';
  }
  return Uri.encodeComponent(value);
}

class HistoryScope {
  HistoryScope({
    required String motorcycleId,
    required String contextRevision,
    required String catalogId,
    required String catalogRevision,
    required String motorcycleLabel,
  }) : motorcycleId = _required(motorcycleId),
       contextRevision = _required(contextRevision),
       catalogId = _required(catalogId),
       catalogRevision = _required(catalogRevision),
       motorcycleLabel = _required(motorcycleLabel);
  final String motorcycleId, contextRevision, catalogId, catalogRevision;
  final String motorcycleLabel;
  String get subject => '${_identity(catalogId)}/${_identity(catalogRevision)}';
  bool matches(HistoryScope other) =>
      motorcycleId == other.motorcycleId &&
      contextRevision == other.contextRevision &&
      catalogId == other.catalogId &&
      catalogRevision == other.catalogRevision;
}

enum HistoryReferenceState { unknown, held, confirmed }

/// Güvenilir dış üreticinin sunum referansı; E1 otorite veya izin üretmez.
/// Üretim E3/E5 bağlantısı yoksa referanslar yok/HELD kalmalıdır.
class HistoryReference {
  HistoryReference({
    required this.scope,
    required String requestId,
    required String purpose,
    required String subjectId,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required String reason,
    required this.current,
    required this.state,
  }) : requestId = _required(requestId),
       purpose = _required(purpose),
       subjectId = _required(subjectId),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt),
       reason = _required(reason);
  final HistoryScope scope;
  final String requestId, purpose, subjectId, source, version, location;
  final String checkedAt, reason;
  final bool current;
  final HistoryReferenceState state;
  bool confirmed(
    HistoryScope expected,
    String request,
    String use,
    String target,
  ) =>
      scope.matches(expected) &&
      requestId == request &&
      purpose == use &&
      subjectId == target &&
      current &&
      state == HistoryReferenceState.confirmed;
}

enum HistoryField {
  title,
  date,
  outcome,
  actor,
  source,
  evidence,
  evaluation,
  corrections,
  reviewer,
  uncertainty,
  notes,
  contact,
}

const _contextFields = {
  HistoryField.title,
  HistoryField.date,
  HistoryField.outcome,
  HistoryField.actor,
  HistoryField.source,
  HistoryField.evidence,
  HistoryField.evaluation,
  HistoryField.corrections,
};

String _fieldLabel(HistoryField field) => switch (field) {
  HistoryField.title => 'Bakım işi',
  HistoryField.date => 'Bakım tarihi',
  HistoryField.outcome => 'Bildirilen sonuç',
  HistoryField.actor => 'Kaydı yazan',
  HistoryField.source => 'Kaynak',
  HistoryField.evidence => 'Kanıt',
  HistoryField.evaluation => 'Bugünkü değerlendirme',
  HistoryField.corrections => 'Düzeltme ve itiraz geçmişi',
  HistoryField.reviewer => 'İnceleyen',
  HistoryField.uncertainty => 'Bilinmeyenler',
  HistoryField.notes => 'Ek açıklama',
  HistoryField.contact => 'İletişim bilgileri',
};

// Bunlar özel sunum durumlarıdır; kanonik üretim claim sözlüğü değildir.
// Mevcut E3 geçmişi yalnız USER_REPORTED üretir. Diğer durumlar test örneği
// veya gelecekteki dış üretici girdisidir; istemci kendisi bu durumu yükseltmez.
enum HistoryMeaning {
  reported,
  documented,
  reviewed,
  disputed,
  withdrawn,
  unresolved,
}

enum HistoryOrigin { canonicalSnapshot, historicalCopy }

enum HistoryReadDimension { motorcycle, source, authorization, policy }

enum HistoryExportDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

class HistoryRevision {
  HistoryRevision({
    required String id,
    required String revision,
    required String before,
    required String after,
    required String changedAt,
    required String reason,
    required this.field,
    required String classificationRevision,
    this.readAuthority,
  }) : id = _required(id),
       revision = _required(revision),
       before = _required(before),
       after = _required(after),
       changedAt = _required(changedAt),
       reason = _required(reason),
       classificationRevision = _required(classificationRevision);
  final String id, revision, before, after, changedAt, reason;
  final HistoryField field;
  final String classificationRevision;
  final HistoryReference? readAuthority;
  String get subject =>
      '${_identity(id)}/${_identity(revision)}/${field.name}/${_identity(classificationRevision)}';
}

class HistoryRecord {
  HistoryRecord({
    required this.scope,
    required String id,
    required String revision,
    required String evaluationId,
    required String evaluationRevision,
    required String classificationRevision,
    required this.meaning,
    required this.highRisk,
    required Map<HistoryField, String> values,
    required List<HistoryRevision> revisions,
    required Map<HistoryReadDimension, HistoryReference?> readDimensions,
    required Map<HistoryField, HistoryReference?> fieldReferences,
    this.authority,
    this.evaluationAuthority,
    this.revisionAuthority,
  }) : id = _required(id),
       revision = _required(revision),
       evaluationId = _required(evaluationId),
       evaluationRevision = _required(evaluationRevision),
       classificationRevision = _required(classificationRevision),
       values = Map.unmodifiable({
         for (final e in values.entries) e.key: _required(e.value),
       }),
       revisions = List.unmodifiable(revisions),
       readDimensions = Map.unmodifiable(readDimensions),
       fieldReferences = Map.unmodifiable(fieldReferences);
  final HistoryScope scope;
  final String id,
      revision,
      evaluationId,
      evaluationRevision,
      classificationRevision;
  final HistoryMeaning meaning;
  final bool highRisk;
  final Map<HistoryField, String> values;
  final List<HistoryRevision> revisions;
  final Map<HistoryReadDimension, HistoryReference?> readDimensions;
  final Map<HistoryField, HistoryReference?> fieldReferences;
  final HistoryReference? authority, evaluationAuthority, revisionAuthority;
  String get subject => '${_identity(id)}/${_identity(revision)}';
  String get evaluationSubject =>
      '$subject/evaluation:${_identity(evaluationId)}/${_identity(evaluationRevision)}';
  String get readSubject =>
      '$evaluationSubject/classification:${_identity(classificationRevision)}';
  String get revisionSubject =>
      '$readSubject/versions:${revisions.map((r) => r.subject).join(',')}';
  String get memberSubject =>
      '$readSubject/versions:${revisions.map((r) => r.subject).join(',')}';
  Set<HistoryField> get requiredFields => {
    ..._contextFields,
    if (highRisk) ...{HistoryField.reviewer, HistoryField.uncertainty},
  };
  bool fieldAllowed(
    HistoryScope expected,
    String request,
    HistoryField field,
  ) =>
      values.containsKey(field) &&
      (fieldReferences[field]?.confirmed(
            expected,
            request,
            'history-read-field',
            '$readSubject/${field.name}',
          ) ??
          false);
  bool readable(HistoryScope expected, String request) =>
      scope.matches(expected) &&
      (authority?.confirmed(expected, request, 'history-record', subject) ??
          false) &&
      HistoryReadDimension.values.every(
        (d) =>
            readDimensions[d]?.confirmed(
              expected,
              request,
              'history-read',
              '$readSubject/${d.name}',
            ) ??
            false,
      ) &&
      requiredFields.every((f) => fieldAllowed(expected, request, f));
  bool meaningConfirmed(HistoryScope expected, String request) =>
      evaluationAuthority?.confirmed(
        expected,
        request,
        'history-evaluation',
        evaluationSubject,
      ) ??
      false;
  bool revisionsConfirmed(HistoryScope expected, String request) =>
      revisionAuthority?.confirmed(
        expected,
        request,
        'history-revisions',
        revisionSubject,
      ) ??
      false;
  bool revisionReadable(
    HistoryScope expected,
    String request,
    HistoryRevision value,
  ) =>
      fieldAllowed(expected, request, value.field) &&
      (value.readAuthority?.confirmed(
            expected,
            request,
            'history-revision-field',
            '$readSubject/version:${value.subject}',
          ) ??
          false);
}

class HistoryExportPlan {
  HistoryExportPlan({
    required this.scope,
    required String requestId,
    required String id,
    required String revision,
    required Map<String, Set<HistoryField>> fields,
    required Map<HistoryExportDimension, HistoryReference?> dimensions,
    this.authority,
    this.coverageAuthority,
  }) : requestId = _required(requestId),
       id = _required(id),
       revision = _required(revision),
       fields = Map.unmodifiable({
         for (final e in fields.entries)
           _required(e.key): Set<HistoryField>.unmodifiable(e.value),
       }),
       dimensions = Map.unmodifiable(dimensions);
  final HistoryScope scope;
  final String requestId, id, revision;
  // Anahtar kayıt + değerlendirme + sınıflandırma + sürüm izi bağının tamamıdır.
  final Map<String, Set<HistoryField>> fields;
  final Map<HistoryExportDimension, HistoryReference?> dimensions;
  final HistoryReference? authority, coverageAuthority;
  String get subject =>
      '${_identity(id)}/${_identity(revision)}/records:${fields.entries.map((e) => '${_identity(e.key)}:${HistoryField.values.where(e.value.contains).map((f) => f.name).join(',')}').join(';')}';
  bool referencesConfirmed(HistoryScope expected, String request) =>
      scope.matches(expected) &&
      requestId == request &&
      (authority?.confirmed(
            expected,
            request,
            'history-export-scope',
            subject,
          ) ??
          false) &&
      (coverageAuthority?.confirmed(
            expected,
            request,
            'history-export-coverage',
            subject,
          ) ??
          false);
  bool granted(HistoryScope expected, String request) =>
      referencesConfirmed(expected, request) &&
      HistoryExportDimension.values.every(
        (d) =>
            dimensions[d]?.confirmed(
              expected,
              request,
              'history-export',
              '$subject/${d.name}',
            ) ??
            false,
      );
}

class HistorySnapshot {
  HistorySnapshot({
    required this.scope,
    required String requestId,
    required List<HistoryRecord> records,
    this.authority,
    this.origin = HistoryOrigin.canonicalSnapshot,
    this.exportPlan,
    this.inactiveMotorcycle = false,
    this.subscribed = false,
  }) : requestId = _required(requestId),
       records = List.unmodifiable(records);
  final HistoryScope scope;
  final String requestId;
  final List<HistoryRecord> records;
  final HistoryReference? authority;
  final HistoryOrigin origin;
  final HistoryExportPlan? exportPlan;
  final bool inactiveMotorcycle, subscribed;
  String get subject =>
      '${scope.subject}/members:${records.map((r) => r.memberSubject).join(',')}';
  bool confirmed(HistoryScope expected, String request) =>
      scope.matches(expected) &&
      requestId == request &&
      origin == HistoryOrigin.canonicalSnapshot &&
      records.every((r) => r.scope.matches(expected)) &&
      records.map((r) => r.id).toSet().length == records.length &&
      (authority?.confirmed(expected, request, 'history-catalog', subject) ??
          false);
  List<HistoryRecord> readable(HistoryScope expected, String request) =>
      confirmed(expected, request)
      ? records.where((r) => r.readable(expected, request)).toList()
      : [];
  bool exportSupported(HistoryScope expected, String request) {
    final plan = exportPlan;
    if (!confirmed(expected, request) ||
        plan == null ||
        plan.fields.isEmpty ||
        !plan.referencesConfirmed(expected, request))
      return false;
    final current = readable(expected, request);
    return plan.fields.entries.every((e) {
      final matching = current.where((r) => r.memberSubject == e.key).toList();
      if (matching.length != 1) return false;
      final record = matching.single;
      return record.meaningConfirmed(expected, request) &&
          record.revisionsConfirmed(expected, request) &&
          record.requiredFields.every(e.value.contains) &&
          e.value.every((f) => record.fieldAllowed(expected, request, f)) &&
          record.revisions.every(
            (v) =>
                !e.value.contains(v.field) ||
                record.revisionReadable(expected, request, v),
          );
    });
  }
}

enum HistoryPage { list, detail, exportScope }

enum HistoryFilter { all, corrected, disputed }

enum HistoryRequestPhase { idle, submitting, failed, outcomeUnknown }

enum HistoryAction { exportCopy, reconcile, refresh, support, exit }

class HistoryIntent {
  const HistoryIntent({
    required this.scope,
    required this.requestId,
    required this.action,
    this.exportPlanId,
    this.exportPlanRevision,
  });
  final HistoryScope scope;
  final String requestId;
  final HistoryAction action;
  final String? exportPlanId, exportPlanRevision;
}

/// Özel E1 sunumu. Sağlayıcı/gerçek dışarı aktarma veya kimlik akışı eklemez.
class HistoryView extends StatefulWidget {
  const HistoryView({
    super.key,
    required this.scope,
    required this.requestId,
    required this.brandLabel,
    this.snapshot,
    this.initialPage = HistoryPage.list,
    this.initialRecordId,
    this.phase = HistoryRequestPhase.idle,
    this.onIntent,
  });
  final HistoryScope scope;
  final String requestId, brandLabel;
  final HistorySnapshot? snapshot;
  final HistoryPage initialPage;
  final String? initialRecordId;
  final HistoryRequestPhase phase;
  final ValueChanged<HistoryIntent>? onIntent;
  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late HistoryPage page;
  String? selectedId;
  bool sourceOpen = false, versionsOpen = false, sent = false;
  HistoryFilter filter = HistoryFilter.all;
  final search = TextEditingController();
  final searchFocus = FocusNode();
  List<HistoryRecord> get records =>
      widget.snapshot?.readable(widget.scope, widget.requestId) ?? [];
  bool get catalogCurrent =>
      widget.snapshot?.confirmed(widget.scope, widget.requestId) ?? false;
  HistoryRecord? get selected {
    final matching = records.where((r) => r.id == selectedId).toList();
    return matching.length == 1 ? matching.single : null;
  }

  String get binding => widget.snapshot?.subject ?? 'missing';
  String get selectionBinding =>
      '${binding}/${selected?.memberSubject ?? 'none'}';
  @override
  void initState() {
    super.initState();
    page = widget.initialPage;
    selectedId = widget.initialRecordId;
    search.addListener(searchChanged);
  }

  void searchChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(HistoryView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) || old.requestId != widget.requestId) {
      selectedId = widget.initialRecordId;
      page = widget.initialPage;
      sent = false;
      filter = HistoryFilter.all;
      search.clear();
    }
    if (old.snapshot?.subject != binding ||
        old.snapshot?.authority != widget.snapshot?.authority) {
      sourceOpen = false;
      versionsOpen = false;
    }
  }

  @override
  void dispose() {
    search.removeListener(searchChanged);
    search.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  VoidCallback bound(VoidCallback invoke, {String? target}) {
    final scope = widget.scope, request = widget.requestId, catalog = binding;
    final selectedSubject = target;
    return () {
      if (!mounted ||
          !scope.matches(widget.scope) ||
          request != widget.requestId ||
          catalog != binding)
        return;
      if (selectedSubject != null &&
          !records.any((r) => r.memberSubject == selectedSubject))
        return;
      invoke();
    };
  }

  bool get exportReady =>
      !sent &&
      widget.phase == HistoryRequestPhase.idle &&
      widget.onIntent != null &&
      (widget.snapshot?.exportSupported(widget.scope, widget.requestId) ??
          false) &&
      (widget.snapshot?.exportPlan?.granted(widget.scope, widget.requestId) ??
          false);
  void emit(HistoryAction action, {String? expectedExport}) {
    if (!mounted || widget.onIntent == null) return;
    final plan = widget.snapshot?.exportPlan;
    if (action == HistoryAction.exportCopy) {
      if (!exportReady ||
          expectedExport == null ||
          plan?.subject != expectedExport)
        return;
      setState(() => sent = true);
    } else if (action == HistoryAction.reconcile &&
        widget.phase != HistoryRequestPhase.outcomeUnknown &&
        widget.phase != HistoryRequestPhase.failed) {
      return;
    }
    widget.onIntent!(
      HistoryIntent(
        scope: widget.scope,
        requestId: widget.requestId,
        action: action,
        exportPlanId: action == HistoryAction.exportCopy ? plan!.id : null,
        exportPlanRevision: action == HistoryAction.exportCopy
            ? plan!.revision
            : null,
      ),
    );
  }

  Widget text(
    String value, {
    double size = 16,
    FontWeight weight = FontWeight.normal,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      value,
      style: TextStyle(
        fontSize: size,
        height: 1.4,
        fontWeight: weight,
        color: const Color(0xFF172033),
      ),
    ),
  );
  Widget heading(String value) => Semantics(
    header: true,
    child: Padding(
      padding: const EdgeInsets.only(top: 14),
      child: text(value, size: 22, weight: FontWeight.w600),
    ),
  );
  Widget panel(List<Widget> children, {bool caution = false}) => Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(18),
    width: double.infinity,
    decoration: BoxDecoration(
      color: caution ? const Color(0xFFFAF4E9) : const Color(0xFFF4F7FB),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
  Widget button(
    String label,
    VoidCallback? invoke, {
    String keyId = '',
    bool primary = false,
  }) => _HistoryButton(
    key: ValueKey(keyId.isEmpty ? label : keyId),
    label: label,
    onActivate: invoke,
    primary: primary,
  );
  List<Widget> status() => [
    if (widget.phase == HistoryRequestPhase.submitting)
      Semantics(
        liveRegion: true,
        child: panel([
          heading('Kopya isteği işleniyor'),
          text(
            'İstek tekrar gönderilmiyor. Sonuç güncel kaynaktan doğrulanmalı.',
          ),
        ], caution: true),
      ),
    if (widget.phase == HistoryRequestPhase.failed)
      Semantics(
        liveRegion: true,
        child: panel([
          heading('İstek sonucu kontrol edilmeli'),
          text(
            'Hata mesajı kopyanın oluşmadığını kanıtlamaz. Yeni gönderim kapalı; güncel sonucu kontrol et.',
          ),
          button(
            'Aynı isteğin sonucunu kontrol et',
            widget.onIntent == null
                ? null
                : bound(() => emit(HistoryAction.reconcile)),
            keyId: 'history-reconcile',
            primary: true,
          ),
        ], caution: true),
      ),
    if (widget.phase == HistoryRequestPhase.outcomeUnknown)
      Semantics(
        liveRegion: true,
        child: panel([
          heading('Kopya isteğinin sonucu bilinmiyor'),
          text(
            'Başarı veya başarısızlık tahmin edilmiyor. İstek yeniden gönderilmez; aynı isteğin sonucunu kontrol edebilirsin.',
          ),
          button(
            'Aynı isteğin sonucunu kontrol et',
            widget.onIntent == null
                ? null
                : bound(() => emit(HistoryAction.reconcile)),
            keyId: 'history-reconcile',
            primary: true,
          ),
        ], caution: true),
      ),
    if (sent && widget.phase == HistoryRequestPhase.idle)
      Semantics(
        liveRegion: true,
        child: panel([
          heading('İstek gönderildi; sonuç bekleniyor'),
          text(
            'Bu ekran dosya oluştuğunu söylemez. Aynı istek tekrar gönderilmiyor.',
          ),
        ], caution: true),
      ),
  ];
  List<Widget> unavailable() => [
    panel([
      heading(
        widget.snapshot?.origin == HistoryOrigin.historicalCopy
            ? 'Bu eski kopya güncel kayıt değildir'
            : 'Güncel geçmiş henüz kullanılamıyor',
      ),
      text(
        widget.snapshot?.origin == HistoryOrigin.historicalCopy
            ? 'Eski kopya tarihsel bilgi içerebilir; bugünkü değerlendirme veya işlem izni yerine geçmez. Güncel kayıt kaynağı ve okuma izni ayrı kontrol edilmelidir.'
            : 'Seçili motosiklet için güncel kaynak ve okuma izni doğrulanmadı. Bu durum geçmişin boş veya bütün bakımların tamamlanmış olduğunu göstermez. Özel kayıt bilgileri açılmıyor.',
      ),
    ], caution: true),
    button(
      'Güncel geçmiş kaynağını kontrol et',
      widget.onIntent == null ? null : bound(() => emit(HistoryAction.refresh)),
      keyId: 'history-refresh',
    ),
  ];
  Widget row(HistoryRecord record) => panel([
    text(record.values[HistoryField.date]!, size: 14),
    heading(record.values[HistoryField.title]!),
    text(record.values[HistoryField.outcome]!),
    text(
      record.meaningConfirmed(widget.scope, widget.requestId)
          ? _meaningTitle(record.meaning)
          : 'Bugünkü değerlendirme henüz doğrulanmadı',
      weight: FontWeight.w600,
    ),
    button(
      'Kaydın ayrıntısını aç',
      bound(
        () => setState(() {
          selectedId = record.id;
          page = HistoryPage.detail;
          sourceOpen = versionsOpen = false;
        }),
        target: record.memberSubject,
      ),
      keyId: 'history-open-${record.subject}',
    ),
  ]);
  List<Widget> listBody() {
    if (!catalogCurrent) return unavailable();
    final query = search.text.trim().toLowerCase();
    final visible = records.where((r) {
      if (filter == HistoryFilter.corrected &&
          (!r.revisionsConfirmed(widget.scope, widget.requestId) ||
              r.revisions.isEmpty))
        return false;
      if (filter == HistoryFilter.disputed &&
          (!r.meaningConfirmed(widget.scope, widget.requestId) ||
              r.meaning != HistoryMeaning.disputed))
        return false;
      return query.isEmpty ||
          [
            HistoryField.title,
            HistoryField.date,
            HistoryField.outcome,
          ].any((f) => r.values[f]!.toLowerCase().contains(query));
    }).toList();
    return [
      text(
        'Bildirilen bakım sonucu ile onu destekleyen kanıt ayrı gösterilir. Kaydı bir servis yazmış olması otomatik doğrulama değildir.',
      ),
      if (widget.snapshot!.inactiveMotorcycle)
        panel([
          text(
            'Bu motosiklet pasif. Temel geçmiş, kaynak ve kopya kapsamı yeni bakım başlatma hakkından ayrıdır.',
          ),
        ]),
      text(
        'Temel geçmiş ve kaynak bilgisi ücretli pakete geçmediğin için geriye dönük kapanmaz.',
        size: 14,
      ),
      heading('Kaydı bul'),
      text('Bakım adı, tarih veya bildirilen sonuçla ara.', size: 14),
      Semantics(
        label: 'Bakım adı, tarih veya bildirilen sonuçla ara',
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF526079)),
            borderRadius: BorderRadius.circular(14),
          ),
          child: EditableText(
            key: const ValueKey('history-search'),
            controller: search,
            focusNode: searchFocus,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              color: Color(0xFF172033),
            ),
            cursorColor: const Color(0xFF0E5BD8),
            backgroundCursorColor: const Color(0xFF526079),
            maxLines: null,
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
      for (final choice in HistoryFilter.values)
        button(
          switch (choice) {
            HistoryFilter.all => 'Tüm kayıtlar',
            HistoryFilter.corrected => 'Düzeltme geçmişi olanlar',
            HistoryFilter.disputed => 'İtirazı sürenler',
          },
          bound(() => setState(() => filter = choice)),
          keyId: 'history-filter-${choice.name}',
          primary: filter == choice,
        ),
      heading('Kayıtlar'),
      if (visible.isEmpty)
        panel([
          heading(
            records.isEmpty && widget.snapshot!.records.isEmpty
                ? 'Bu kaynakta henüz kayıt yok'
                : 'Bu görünümde kayıt bulunamadı',
          ),
          text(
            query.isNotEmpty || filter != HistoryFilter.all
                ? 'Aramayı veya filtreyi değiştir. Bu sonuç bütün bakımların tamamlandığını göstermez.'
                : 'Kaynak ve izin kapsamı dışında kalan kayıtlar gösterilmez. Bu ekran geçmişin bütünü hakkında sonuç çıkarmaz.',
          ),
        ]),
      for (final record in visible) row(record),
      button(
        'Geçmişin kopya kapsamını incele',
        bound(() => setState(() => page = HistoryPage.exportScope)),
        keyId: 'history-export-entry',
      ),
    ];
  }

  List<Widget> detailBody() {
    if (!catalogCurrent) return unavailable();
    final record = selected;
    if (record == null)
      return [
        panel([
          heading('Kayıt şu anda açılamıyor'),
          text(
            'Kayıt, sürüm veya güncel okuma izni eşleşmiyor. Özel bilgiler açılmıyor; başka kayıt doğruymuş gibi seçilmiyor.',
          ),
        ], caution: true),
        back(),
      ];
    final evaluated = record.meaningConfirmed(widget.scope, widget.requestId);
    return [
      text('Bakım tarihi: ${record.values[HistoryField.date]}'),
      panel(
        [
          heading('Kaydın bugünkü anlamı'),
          text(
            evaluated
                ? _meaningTitle(record.meaning)
                : 'Bugünkü değerlendirme henüz doğrulanmadı',
            size: 22,
            weight: FontWeight.w600,
          ),
          text(
            evaluated ? record.values[HistoryField.evaluation]! : 'Güncel değerlendirme kaynağı yok. Son yazılan kayıt kendiliğinden kesin doğru sayılmaz.',
          ),
          if (evaluated && record.meaning == HistoryMeaning.reviewed)
            text(
              'Bu değerlendirme yalnız belirtilen iş ve kanıt kapsamını destekler; kusursuz işçilik garantisi değildir.',
            ),
          if (evaluated && record.meaning == HistoryMeaning.disputed)
            text(
              'Çelişki çözülmedi. Bir taraf kesin doğru veya kazanan gösterilmiyor.',
            ),
          if (evaluated && record.meaning == HistoryMeaning.withdrawn)
            text(
              'Geri çekilen kanıt bugünkü değerlendirmede ayrıca ele alınır. Eski iz ve bağımsız kayıtlar sessizce silinmez.',
            ),
        ],
        caution:
            !evaluated ||
            record.meaning == HistoryMeaning.disputed ||
            record.meaning == HistoryMeaning.withdrawn ||
            record.meaning == HistoryMeaning.unresolved,
      ),
      heading('Bildirilen bakım sonucu'),
      text(record.values[HistoryField.outcome]!),
      heading('Kaydı yazan'),
      text(record.values[HistoryField.actor]!),
      text(
        'Servis veya profesyonel unvanı tek başına işin doğrulandığı anlamına gelmez.',
      ),
      heading('Kanıtın durumu'),
      text(record.values[HistoryField.evidence]!),
      if (record.highRisk)
        panel([
          heading('Önemli iddia ve bilinmeyenler'),
          text(
            'Güvenlik açısından önemli bu kayıt için kaynak, inceleyen ve belirsizlik gizli ayrıntıya bırakılmaz.',
          ),
          text('Kaynak: ${record.values[HistoryField.source]}'),
          text('İnceleyen: ${record.values[HistoryField.reviewer]}'),
          text('Bilinmeyenler: ${record.values[HistoryField.uncertainty]}'),
        ], caution: true),
      heading('Düzeltme ve itiraz'),
      text(record.values[HistoryField.corrections]!),
      button(
        sourceOpen ? 'Kaynak ayrıntısını kapat' : 'Kaynak ayrıntısını aç',
        bound(
          () => setState(() => sourceOpen = !sourceOpen),
          target: record.memberSubject,
        ),
        keyId: 'history-source',
      ),
      if (sourceOpen)
        panel([
          heading('Kaynak ve kullanılan sürüm'),
          text(record.values[HistoryField.source]!),
          text('Kayıt kimliği: ${record.id} · sürüm: ${record.revision}'),
          text('Değerlendirme sürümü: ${record.evaluationRevision}'),
          text('Kaynak: ${record.authority!.source}'),
          text('Kaynak sürümü: ${record.authority!.version}'),
          text('Konum: ${record.authority!.location}'),
          text('Kontrol zamanı: ${record.authority!.checkedAt}'),
        ]),
      button(
        versionsOpen ? 'Değişiklik geçmişini kapat' : 'Değişiklik geçmişini aç',
        bound(
          () => setState(() => versionsOpen = !versionsOpen),
          target: record.memberSubject,
        ),
        keyId: 'history-versions',
      ),
      if (versionsOpen) ...[
        if (!record.revisionsConfirmed(widget.scope, widget.requestId))
          panel([
            text(
              'Değişiklik geçmişinin güncel kaynak bağı doğrulanmadı. Eski veya başka kayda ait değerler gösterilmiyor.',
            ),
          ], caution: true)
        else if (record.revisions.isEmpty)
          panel([text('Bu kaynakta gösterilecek düzeltme sürümü yok.')])
        else
          for (final revision in record.revisions)
            if (!record.revisionReadable(
              widget.scope,
              widget.requestId,
              revision,
            ))
              panel([
                text(
                  'Bu sürümün özel alanları için güncel okuma izni yok. Eski değerler, açıklama ve gerekçe açılmıyor; sürüm izi silinmez.',
                ),
              ], caution: true)
            else
              panel([
                heading('Korunan sürüm ${revision.revision}'),
                text('Alan: ${_fieldLabel(revision.field)}'),
                text('Önceki bilgi: ${revision.before}'),
                text('Yeni bilgi: ${revision.after}'),
                text('Değişiklik zamanı: ${revision.changedAt}'),
                text('Gerekçe: ${revision.reason}'),
                text(
                  'Eski bilgi silinmez; yeni sürümün geçerliliği bugünkü değerlendirmeyle ayrıdır.',
                ),
              ]),
      ],
      for (final field in [HistoryField.notes, HistoryField.contact])
        if (record.fieldAllowed(widget.scope, widget.requestId, field)) ...[
          heading(_fieldLabel(field)),
          text(record.values[field]!),
        ],
      back(),
    ];
  }

  Widget back() => button(
    'Bakım geçmişine dön',
    bound(
      () => setState(() {
        page = HistoryPage.list;
        sourceOpen = versionsOpen = false;
      }),
    ),
    keyId: 'history-back',
  );
  List<Widget> exportBody() {
    if (!catalogCurrent) return [...unavailable(), back()];
    final snapshot = widget.snapshot!;
    final plan = snapshot.exportPlan;
    final supported = snapshot.exportSupported(widget.scope, widget.requestId);
    final chosen = supported
        ? records
              .where((r) => plan!.fields.containsKey(r.memberSubject))
              .toList()
        : <HistoryRecord>[];
    final manifestSubject = plan?.subject;
    return [
      text(
        'Asıl kayıtlar değişmez. Önce kopyanın hangi kayıtları ve bilgileri kapsadığını kontrol et.',
      ),
      panel([
        heading('Seçili motosiklet'),
        text(widget.scope.motorcycleLabel),
        text('Temel geçmiş ve kopya kapsamı ücretli pakete bağlı değildir.'),
      ]),
      if (!supported)
        panel([
          heading('Kopya kapsamı henüz doğrulanmadı'),
          text(
            'Güncel kayıt sürümleri, alan izinleri ve zorunlu kaynak/düzeltme bağlamı birlikte doğrulanmalı. Eksik kapsamla dosya isteği gönderilmiyor.',
          ),
        ], caution: true)
      else ...[
        heading('Kopyaya girecek kayıtlar'),
        for (final record in chosen)
          panel([
            heading(record.values[HistoryField.title]!),
            text(record.values[HistoryField.date]!),
            text(
              'Kapsanan bilgiler: ${HistoryField.values.where(plan!.fields[record.memberSubject]!.contains).map(_fieldLabel).join(', ')}',
            ),
            text(
              'Dışarıda kalan bilgiler: ${HistoryField.values.where((f) => record.values.containsKey(f) && !plan.fields[record.memberSubject]!.contains(f)).map(_fieldLabel).join(', ').isEmpty ? 'Ek alan yok.' : HistoryField.values.where((f) => record.values.containsKey(f) && !plan.fields[record.memberSubject]!.contains(f)).map(_fieldLabel).join(', ')}',
            ),
            text(
              'Kayıt sürümü: ${record.revision} · değerlendirme sürümü: ${record.evaluationRevision}',
            ),
          ]),
      ],
      heading('Kopyayı göndermeden önce'),
      text(
        'Kopya oluşturmak asıl kayıtları değiştirmez veya silmez. Tarih, kaynak, kanıt, düzeltme ve itiraz bağlamı kopyada korunmalıdır.',
      ),
      panel([
        text(
          'Paylaşım bağlantısını iptal etmek daha önce indirilmiş, gönderilmiş veya basılmış kopyaları geri almaz. Bilgiyi dışarı taşıdıktan sonra her kopyayı kontrol edemeyebilirsin.',
        ),
      ], caution: true),
      text(
        'Geçmişi görme izni, dışarı aktarma izni de vermez. Güncel dışarı aktarma izni ayrıca kontrol edilir.',
      ),
      if (widget.onIntent == null)
        text(
          'Kopya hizmeti bu ekrana henüz bağlanmadı. Bu ekran dosya üretmez veya göndermez.',
        )
      else if (supported &&
          !(plan?.granted(widget.scope, widget.requestId) ?? false))
        text(
          'Güncel dışarı aktarma işlem izinleri tamamlanmadı. Geçmişi okuyabilmen bu işlemi açmaz.',
        ),
      button(
        'Bu kapsam için kopya isteği gönder',
        exportReady
            ? bound(
                () => emit(
                  HistoryAction.exportCopy,
                  expectedExport: manifestSubject,
                ),
              )
            : null,
        keyId: 'history-export',
        primary: true,
      ),
      back(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final title = switch (page) {
      HistoryPage.list => 'Bakım geçmişi',
      HistoryPage.detail =>
        selected?.values[HistoryField.title] ?? 'Kayıt ayrıntısı',
      HistoryPage.exportScope => 'Geçmişin kopyasını oluştur',
    };
    return ColoredBox(
      color: const Color(0xFFFFFFFF),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: SingleChildScrollView(
            key: const ValueKey('history-scroll'),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(widget.brandLabel, size: 14),
                text('Motosikletim: ${widget.scope.motorcycleLabel}', size: 14),
                const SizedBox(height: 18),
                Semantics(
                  header: true,
                  child: text(title, size: 32, weight: FontWeight.w700),
                ),
                ...status(),
                ...switch (page) {
                  HistoryPage.list => listBody(),
                  HistoryPage.detail => detailBody(),
                  HistoryPage.exportScope => exportBody(),
                },
                const SizedBox(height: 24),
                button(
                  'Güvenli destek yollarına git',
                  widget.onIntent == null
                      ? null
                      : bound(() => emit(HistoryAction.support)),
                  keyId: 'history-support',
                ),
                button(
                  'Bu ekrandan çık',
                  widget.onIntent == null
                      ? null
                      : bound(() => emit(HistoryAction.exit)),
                  keyId: 'history-exit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String _meaningTitle(HistoryMeaning meaning) => switch (meaning) {
  HistoryMeaning.reported => 'Kullanıcının beyanı',
  HistoryMeaning.documented => 'Belge var; iş henüz doğrulanmış sayılmaz',
  HistoryMeaning.reviewed => 'Belirtilen kanıt kapsamında incelenmiş',
  HistoryMeaning.disputed => 'İtiraz sürüyor; sonuç kesin değil',
  HistoryMeaning.withdrawn =>
    'Kanıt geri çekilmiş; güncel anlam yeniden ele alınmalı',
  HistoryMeaning.unresolved => 'Yeterli bilgi yok; sonuç açık',
};

class _HistoryButton extends StatefulWidget {
  const _HistoryButton({
    super.key,
    required this.label,
    required this.onActivate,
    this.primary = false,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  @override
  State<_HistoryButton> createState() => _HistoryButtonState();
}

class _HistoryButtonState extends State<_HistoryButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onActivate != null,
        filled = widget.primary && widget.onActivate != null;
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: FocusableActionDetector(
        enabled: enabled,
        onShowFocusHighlight: (value) => setState(() => focused = value),
        shortcuts: const {
          SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
          SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        },
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.onActivate?.call();
              return null;
            },
          ),
        },
        child: Semantics(
          button: true,
          enabled: enabled,
          onTap: widget.onActivate,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onActivate,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.all(16),
              alignment: widget.primary
                  ? Alignment.center
                  : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: filled
                    ? const Color(0xFF0E5BD8)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  width: focused ? 3 : 1,
                  color: focused
                      ? (filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF0E5BD8))
                      : const Color(0xFFC5CFDF),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      '${widget.label}${enabled ? '' : ' — şu anda kapalı'}',
                      style: TextStyle(
                        fontSize: widget.primary ? 18 : 16,
                        height: 1.35,
                        color: filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033),
                        fontWeight: widget.primary
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (!widget.primary)
                    const ExcludeSemantics(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text(
                          '›',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF526079),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
