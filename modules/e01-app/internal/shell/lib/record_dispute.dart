import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'history.dart';

String _required(String value) {
  if (value.trim().isEmpty) throw ArgumentError('Kaynak kimliği boş olamaz.');
  return value;
}

String _encode(String value) {
  final units = value.codeUnits;
  for (var i = 0; i < units.length; i++) {
    final u = units[i];
    if (u >= 0xd800 && u <= 0xdbff) {
      if (i + 1 < units.length &&
          units[i + 1] >= 0xdc00 &&
          units[i + 1] <= 0xdfff) {
        i++;
      } else {
        return '%u${units.map((n) => n.toRadixString(16).padLeft(4, '0')).join()}';
      }
    } else if (u >= 0xdc00 && u <= 0xdfff) {
      return '%u${units.map((n) => n.toRadixString(16).padLeft(4, '0')).join()}';
    }
  }
  return Uri.encodeComponent(value);
}

String _subject(Iterable<String> parts) => parts.map(_encode).join('/');

enum RecordActor { self, hobby, service }

enum RecordOutcome { completed, partial, unresolved }

enum RecordPage { standalone, dispute }

enum RecordPhase { idle, submitting, failed, outcomeUnknown, recorded }

enum RecordAction {
  saveStandalone,
  addDraftEvidence,
  addEvidence,
  proposeCorrection,
  withdrawOwnEvidence,
  reconcile,
  refresh,
  support,
  exit,
}

enum RecordEffectDimension {
  motorcycle,
  source,
  authorization,
  policy,
  operationIntent,
  audit,
}

const _draftFields = [
  'title',
  'date',
  'odometer',
  'actor',
  'outcome',
  'note',
  'service',
  'evidence',
];

/// E1'in düzenlenebilir beyanı. REV ve kaynak/izin referansını E1 üretmez.
class RecordDraft {
  RecordDraft({
    required String id,
    required String revision,
    this.title = '',
    this.performedOn = '',
    this.odometer = '',
    this.actor,
    this.outcome,
    this.note = '',
    this.serviceInfo = '',
    List<String> evidenceLabels = const [],
  }) : id = _required(id),
       revision = _required(revision),
       evidenceLabels = List.unmodifiable(evidenceLabels);
  final String id, revision, title, performedOn, odometer, note, serviceInfo;
  final RecordActor? actor;
  final RecordOutcome? outcome;
  final List<String> evidenceLabels;
  String get contentSubject => _subject([
    title,
    performedOn,
    odometer,
    actor?.name ?? '',
    outcome?.name ?? '',
    note,
    serviceInfo,
    'evidence:${evidenceLabels.length}',
    ...evidenceLabels,
  ]);
  String get subject => '${_subject([id, revision])}/input:$contentSubject';
  String? get validation {
    if (title.trim().isEmpty) return 'Yapılan işi yaz.';
    final date = DateTime.tryParse(performedOn);
    if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(performedOn) ||
        date == null ||
        '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}' !=
            performedOn) {
      return 'İş tarihini yıl-ay-gün biçiminde geçerli bir tarih olarak yaz.';
    }
    if (odometer.isNotEmpty &&
        (int.tryParse(odometer) == null ||
            int.parse(odometer) < 0 ||
            int.parse(odometer) > 10000000)) {
      return 'Mesafeyi kilometre olarak geçerli bir sayıyla yaz veya boş bırak.';
    }
    if (actor == null) return 'İşi kimin yaptığını seç.';
    if (outcome == null) return 'Bildirilen gerçek sonucu seç.';
    if (outcome != RecordOutcome.completed && note.trim().isEmpty)
      return 'Eksik kalan veya çözülemeyen kısmı açıkla.';
    if (actor == RecordActor.service && serviceInfo.trim().isEmpty)
      return 'Dış servisi ve varsa belge bilgisini belirt.';
    return null;
  }
}

class RecordEvidence {
  RecordEvidence({
    required String id,
    required String revision,
    required String classificationRevision,
    required String label,
    this.readAuthority,
    this.ownershipAuthority,
  }) : id = _required(id),
       revision = _required(revision),
       classificationRevision = _required(classificationRevision),
       label = _required(label);
  final String id, revision, classificationRevision, label;
  final HistoryReference? readAuthority, ownershipAuthority;
  String get subject => _subject([id, revision, classificationRevision]);
}

/// İtirazın taraflarını E1 sıralamakla bir kazanan veya yeni kanonik kayıt üretmez.
class RecordDispute {
  RecordDispute({
    required this.target,
    required List<HistoryRecord> claims,
    required List<RecordEvidence> evidence,
    this.authority,
    this.evaluationAuthority,
  }) : claims = List.unmodifiable(claims),
       evidence = List.unmodifiable(evidence);
  final HistoryRecord target;
  final List<HistoryRecord> claims;
  final List<RecordEvidence> evidence;
  final HistoryReference? authority, evaluationAuthority;
  String get subject => _subject([
    target.memberSubject,
    'claims:${claims.length}',
    ...claims.map((c) => c.memberSubject),
    'evidence:${evidence.length}',
    ...evidence.map((e) => e.subject),
  ]);
  bool readable(HistoryScope scope, String request) =>
      claims.map((c) => c.id).toSet().length == claims.length &&
      evidence.map((e) => e.id).toSet().length == evidence.length &&
      (authority?.confirmed(scope, request, 'record-dispute', subject) ??
          false) &&
      target.readable(scope, request) &&
      claims.every((c) => c.readable(scope, request));
  bool evaluated(HistoryScope scope, String request) =>
      (evaluationAuthority?.confirmed(
            scope,
            request,
            'record-dispute-evaluation',
            subject,
          ) ??
          false) &&
      target.meaningConfirmed(scope, request);
  bool evidenceReadable(
    HistoryScope scope,
    String request,
    RecordEvidence evidence,
  ) =>
      evidence.readAuthority?.confirmed(
        scope,
        request,
        'record-evidence-read',
        '$subject/${evidence.subject}',
      ) ??
      false;
  bool ownEvidence(
    HistoryScope scope,
    String request,
    RecordEvidence evidence,
  ) =>
      evidence.ownershipAuthority?.confirmed(
        scope,
        request,
        'record-own-evidence',
        '$subject/${evidence.subject}',
      ) ??
      false;
}

class RecordSnapshot {
  RecordSnapshot({
    required this.scope,
    required String requestId,
    required this.origin,
    this.draft,
    this.dispute,
    this.draftAuthority,
    Map<HistoryReadDimension, HistoryReference?> draftReadDimensions = const {},
    Map<String, HistoryReference?> draftFieldReferences = const {},
    Map<RecordAction, Map<RecordEffectDimension, HistoryReference?>> effects =
        const {},
    this.inactiveMotorcycle = false,
    this.subscribed = false,
  }) : requestId = _required(requestId),
       draftReadDimensions = Map.unmodifiable(draftReadDimensions),
       draftFieldReferences = Map.unmodifiable(draftFieldReferences),
       effects =
           Map<
             RecordAction,
             Map<RecordEffectDimension, HistoryReference?>
           >.unmodifiable({
             for (final e in effects.entries)
               e.key:
                   Map<RecordEffectDimension, HistoryReference?>.unmodifiable(
                     e.value,
                   ),
           });
  final HistoryScope scope;
  final String requestId;
  final HistoryOrigin origin;
  final RecordDraft? draft;
  final RecordDispute? dispute;
  final HistoryReference? draftAuthority;
  final Map<HistoryReadDimension, HistoryReference?> draftReadDimensions;
  final Map<String, HistoryReference?> draftFieldReferences;
  final Map<RecordAction, Map<RecordEffectDimension, HistoryReference?>>
  effects;
  final bool inactiveMotorcycle, subscribed;
  String get subject =>
      _subject([draft?.subject ?? '', dispute?.subject ?? '', origin.name]);
  bool current(HistoryScope expected, String request) =>
      scope.matches(expected) &&
      requestId == request &&
      origin == HistoryOrigin.canonicalSnapshot;
  bool draftReadable(HistoryScope expected, String request) =>
      current(expected, request) &&
      draft != null &&
      (draftAuthority?.confirmed(
            expected,
            request,
            'record-draft',
            draft!.subject,
          ) ??
          false) &&
      HistoryReadDimension.values.every(
        (d) =>
            draftReadDimensions[d]?.confirmed(
              expected,
              request,
              'record-draft-read',
              '${draft!.subject}/${d.name}',
            ) ??
            false,
      ) &&
      _draftFields.every(
        (f) =>
            draftFieldReferences[f]?.confirmed(
              expected,
              request,
              'record-draft-field',
              '${draft!.subject}/$f',
            ) ??
            false,
      );
  bool disputeReadable(HistoryScope expected, String request) =>
      current(expected, request) &&
      (dispute?.readable(expected, request) ?? false);
  bool permits(
    HistoryScope expected,
    String request,
    RecordAction action,
    String target,
  ) =>
      current(expected, request) &&
      RecordEffectDimension.values.every(
        (d) =>
            effects[action]?[d]?.confirmed(
              expected,
              request,
              'record-effect',
              '${action.name}/$target/${d.name}',
            ) ??
            false,
      );
}

class RecordIntent {
  const RecordIntent({
    required this.scope,
    required this.requestId,
    required this.action,
    this.subject,
    this.draft,
    this.evidenceId,
    this.evidenceRevision,
  });
  final HistoryScope scope;
  final String requestId;
  final RecordAction action;
  final String? subject, evidenceId, evidenceRevision;
  final RecordDraft? draft;
}

class RecordDraftChange {
  const RecordDraftChange(this.scope, this.requestId, this.draft);
  final HistoryScope scope;
  final String requestId;
  final RecordDraft draft;
}

class RecordDisputeView extends StatefulWidget {
  const RecordDisputeView({
    super.key,
    required this.scope,
    required this.requestId,
    required this.page,
    this.snapshot,
    this.phase = RecordPhase.idle,
    this.receipt,
    this.onIntent,
    this.onDraftChanged,
  });
  final HistoryScope scope;
  final String requestId;
  final RecordPage page;
  final RecordSnapshot? snapshot;
  final RecordPhase phase;
  final HistoryReference? receipt;
  final ValueChanged<RecordIntent>? onIntent;
  final ValueChanged<RecordDraftChange>? onDraftChanged;
  @override
  State<RecordDisputeView> createState() => _RecordDisputeViewState();
}

class _RecordDisputeViewState extends State<RecordDisputeView> {
  final controllers = <String, TextEditingController>{
    for (final k in ['title', 'date', 'odometer', 'note', 'service'])
      k: TextEditingController(),
  };
  final focusNodes = <String, FocusNode>{
    for (final k in ['title', 'date', 'odometer', 'note', 'service'])
      k: FocusNode(),
  };
  RecordDraft? local;
  bool sent = false, dirty = false, versionsOpen = false;
  String? error;
  String get binding => widget.snapshot?.subject ?? '';
  bool get draftReadable =>
      widget.snapshot?.draftReadable(widget.scope, widget.requestId) ?? false;
  bool get disputeReadable =>
      widget.snapshot?.disputeReadable(widget.scope, widget.requestId) ?? false;
  bool get editing =>
      draftReadable && !sent && widget.phase == RecordPhase.idle;
  @override
  void initState() {
    super.initState();
    for (final focus in focusNodes.values) {
      focus.addListener(focusChanged);
    }
    load();
  }

  void focusChanged() {
    if (mounted) setState(() {});
  }

  void load() {
    local = widget.snapshot?.draft;
    final d = local;
    controllers['title']!.text = d?.title ?? '';
    controllers['date']!.text = d?.performedOn ?? '';
    controllers['odometer']!.text = d?.odometer ?? '';
    controllers['note']!.text = d?.note ?? '';
    controllers['service']!.text = d?.serviceInfo ?? '';
    dirty = false;
  }

  @override
  void didUpdateWidget(RecordDisputeView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) ||
        old.requestId != widget.requestId ||
        old.page != widget.page) {
      sent = false;
      error = null;
      versionsOpen = false;
      load();
    } else if (!dirty) {
      load();
    } else if (local != null &&
        widget.snapshot?.draft?.contentSubject == local!.contentSubject) {
      local = widget.snapshot!.draft;
    }
  }

  @override
  void dispose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    for (final f in focusNodes.values) {
      f.removeListener(focusChanged);
      f.dispose();
    }
    super.dispose();
  }

  VoidCallback bound(VoidCallback invoke, {bool input = false}) {
    final scope = widget.scope,
        request = widget.requestId,
        source = binding,
        page = widget.page;
    final draft = input ? local?.subject : null;
    return () {
      if (!mounted ||
          !scope.matches(widget.scope) ||
          request != widget.requestId ||
          page != widget.page ||
          source != binding ||
          (input && draft != local?.subject))
        return;
      invoke();
    };
  }

  void changed({RecordActor? actor, RecordOutcome? outcome}) {
    if (!editing || local == null) return;
    final d = local!;
    final next = RecordDraft(
      id: d.id,
      revision: d.revision,
      title: controllers['title']!.text,
      performedOn: controllers['date']!.text,
      odometer: controllers['odometer']!.text,
      note: controllers['note']!.text,
      serviceInfo: controllers['service']!.text,
      actor: actor ?? d.actor,
      outcome: outcome ?? d.outcome,
      evidenceLabels: d.evidenceLabels,
    );
    setState(() {
      local = next;
      dirty = true;
      error = null;
    });
    widget.onDraftChanged?.call(
      RecordDraftChange(widget.scope, widget.requestId, next),
    );
  }

  String? target(RecordAction action, RecordEvidence? evidence) {
    if (action == RecordAction.saveStandalone ||
        action == RecordAction.addDraftEvidence)
      return local?.subject;
    if (action == RecordAction.withdrawOwnEvidence && evidence != null)
      return '${widget.snapshot?.dispute?.subject}/${evidence.subject}';
    if (action == RecordAction.addEvidence ||
        action == RecordAction.proposeCorrection)
      return widget.snapshot?.dispute?.subject;
    return null;
  }

  bool ready(RecordAction action, {RecordEvidence? evidence}) {
    if (sent || widget.phase != RecordPhase.idle || widget.onIntent == null)
      return false;
    final value = target(action, evidence);
    if (value == null) return false;
    if (action == RecordAction.saveStandalone ||
        action == RecordAction.addDraftEvidence) {
      if (!draftReadable || local?.subject != widget.snapshot?.draft?.subject)
        return false;
      if (action == RecordAction.saveStandalone && local?.validation != null)
        return false;
    } else {
      final d = widget.snapshot?.dispute;
      if (!disputeReadable ||
          d == null ||
          !d.evaluated(widget.scope, widget.requestId))
        return false;
      if (action == RecordAction.withdrawOwnEvidence) {
        final currentEvidence = d.evidence
            .where((e) => e.subject == evidence?.subject)
            .firstOrNull;
        if (currentEvidence == null ||
            !d.evidenceReadable(
              widget.scope,
              widget.requestId,
              currentEvidence,
            ) ||
            !d.ownEvidence(widget.scope, widget.requestId, currentEvidence))
          return false;
      }
    }
    return widget.snapshot?.permits(
          widget.scope,
          widget.requestId,
          action,
          value,
        ) ??
        false;
  }

  bool get queryAllowed =>
      widget.phase == RecordPhase.failed ||
      widget.phase == RecordPhase.outcomeUnknown ||
      (widget.phase == RecordPhase.recorded && !receiptConfirmed);
  String? get resultSubject => widget.page == RecordPage.standalone
      ? local?.subject
      : widget.snapshot?.dispute?.subject;
  bool get receiptConfirmed =>
      resultSubject != null &&
      (widget.receipt?.confirmed(
            widget.scope,
            widget.requestId,
            'record-result',
            resultSubject!,
          ) ??
          false);
  void emit(RecordAction action, {RecordEvidence? evidence}) {
    if (!mounted || widget.onIntent == null) return;
    final effect = {
      RecordAction.saveStandalone,
      RecordAction.addDraftEvidence,
      RecordAction.addEvidence,
      RecordAction.proposeCorrection,
      RecordAction.withdrawOwnEvidence,
    }.contains(action);
    if (effect && !ready(action, evidence: evidence)) return;
    if (action == RecordAction.reconcile && !queryAllowed) return;
    final value = effect ? target(action, evidence) : null;
    if (effect)
      setState(() {
        sent = true;
      });
    widget.onIntent!(
      RecordIntent(
        scope: widget.scope,
        requestId: widget.requestId,
        action: action,
        subject: value,
        draft: action == RecordAction.saveStandalone ? local : null,
        evidenceId: action == RecordAction.withdrawOwnEvidence
            ? evidence?.id
            : null,
        evidenceRevision: action == RecordAction.withdrawOwnEvidence
            ? evidence?.revision
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    ),
  );
  Widget button(
    String label,
    VoidCallback? onPressed,
    String key, {
    bool primary = false,
    bool selected = false,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: _RecordButton(
      key: ValueKey(key),
      label: label,
      onPressed: onPressed,
      primary: primary,
      selected: selected,
    ),
  );
  Widget field(
    String name,
    String label, {
    bool numeric = false,
    bool multiline = false,
  }) {
    final scope = widget.scope, request = widget.requestId, source = binding;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          text(label, weight: FontWeight.w600),
          Container(
            constraints: const BoxConstraints(minHeight: 52),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F7FB),
              border: Border.all(
                width: focusNodes[name]!.hasFocus ? 3 : 2,
                color: const Color(0xFF5E6E81),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Semantics(
              label: label,
              textField: true,
              child: EditableText(
                key: ValueKey('record-field-$name'),
                controller: controllers[name]!,
                focusNode: focusNodes[name]!,
                readOnly: !editing,
                style: TextStyle(
                  fontFamily: DefaultTextStyle.of(context).style.fontFamily,
                  fontSize: 16,
                  height: 1.4,
                  color: Color(0xFF172033),
                ),
                cursorColor: const Color(0xFF0E5BD8),
                backgroundCursorColor: const Color(0xFF5E6E81),
                keyboardType: numeric
                    ? TextInputType.number
                    : multiline
                    ? TextInputType.multiline
                    : TextInputType.text,
                maxLines: multiline ? null : 1,
                minLines: multiline ? 2 : 1,
                textInputAction: multiline
                    ? TextInputAction.newline
                    : TextInputAction.next,
                onChanged: (_) {
                  if (mounted &&
                      scope.matches(widget.scope) &&
                      request == widget.requestId &&
                      source == binding)
                    changed();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> requestStatus() {
    final phase = widget.phase;
    if (phase == RecordPhase.idle && !sent) return [];
    final confirmed = phase == RecordPhase.recorded && receiptConfirmed;
    return [
      Semantics(
        liveRegion: true,
        child: panel([
          heading(
            confirmed
                ? 'Kayıt sonucu alındı'
                : phase == RecordPhase.failed
                ? 'İşlem sonucu doğrulanamadı'
                : queryAllowed
                ? 'Sonuç henüz bilinmiyor'
                : 'İstek gönderildi; sonuç bekleniyor',
          ),
          text(
            confirmed
                ? 'Kaydın işleme alındığı güncel kaynakta bildiriliyor. Bu, fiziksel işin yapıldığını veya kusursuz işçiliği doğrulamaz.'
                : 'Bu ekran kayıt yazıldığını veya kanıtın yüklendiğini söylemez. Yeni gönderim kapalıdır.',
          ),
          if (queryAllowed) ...[
            text(
              'Hata mesajı işlemin hiç gerçekleşmediğini kanıtlamaz. Aynı isteğin sonucunu kontrol et; yeniden gönderme.',
            ),
            button(
              'Aynı isteğin sonucunu kontrol et',
              widget.onIntent == null
                  ? null
                  : bound(() => emit(RecordAction.reconcile)),
              'record-reconcile',
              primary: true,
            ),
          ],
        ], caution: !confirmed),
      ),
    ];
  }

  List<Widget> standalone() {
    if (!draftReadable || local == null) return closed();
    final d = local!;
    return [
      text(
        'Rehber dışında gerçekleşen gerçek işi ekle. Bu kayıt rehber adımını tamamlamaz; bakımın gerçekten yapıldığını doğrulamaz.',
      ),
      ...requestStatus(),
      field('title', 'Ne yapıldı?', multiline: true),
      field('date', 'İş tarihi (yıl-ay-gün)'),
      field('odometer', 'Mesafe (km, bilinmiyorsa boş bırak)', numeric: true),
      heading('Kim yaptı?'),
      for (final a in RecordActor.values)
        button(
          switch (a) {
            RecordActor.self => 'Kendim',
            RecordActor.hobby => 'Hobi desteği',
            RecordActor.service => 'Dış servis',
          },
          editing ? bound(() => changed(actor: a), input: true) : null,
          'record-actor-${a.name}',
          selected: d.actor == a,
        ),
      text(
        'Servis veya profesyonel seçimi bu kaydı otomatik doğrulamaz. İşi yapan kişinin türü tek başına kaydın doğruluğunu kanıtlamaz.',
      ),
      if (d.actor == RecordActor.service)
        field('service', 'Servis ve belge bilgisi', multiline: true),
      heading('Bildirilen gerçek sonuç'),
      for (final o in RecordOutcome.values)
        button(
          switch (o) {
            RecordOutcome.completed => 'Tamamlandı',
            RecordOutcome.partial => 'Kısmi kaldı',
            RecordOutcome.unresolved => 'Çözülemedi',
          },
          editing ? bound(() => changed(outcome: o), input: true) : null,
          'record-outcome-${o.name}',
          selected: d.outcome == o,
        ),
      field('note', 'Sonuç notu', multiline: true),
      text(
        'Kısmi veya çözülemeyen iş için eksik kalan kısmı yaz. Bildirilen tamamlanma, doğrulanmış işçilik veya güvenli motosiklet anlamına gelmez.',
      ),
      heading('Kanıt (isteğe bağlı)'),
      if (d.evidenceLabels.isEmpty)
        text('Bu taslakta kanıt belirtilmedi.')
      else
        for (final label in d.evidenceLabels) text(label),
      text(
        'Fotoğraf veya belge kaynağı açıklar; tek başına doğrulama değildir. Bu ekran dosya yüklemez.',
      ),
      button(
        'Kanıt ekle',
        ready(RecordAction.addDraftEvidence)
            ? bound(() => emit(RecordAction.addDraftEvidence), input: true)
            : null,
        'record-draft-evidence',
      ),
      if (error != null) Semantics(liveRegion: true, child: text(error!)),
      if (d.validation != null)
        text(d.validation!)
      else if (!sent &&
          widget.phase == RecordPhase.idle &&
          !ready(RecordAction.saveStandalone))
        panel([
          text(
            'Kaydetme izni veya güncel girdi kontrolü doğrulanmadı. Düzenlediğin bilgi tek başına kaydetme izni oluşturmaz.',
          ),
        ], caution: true),
      button(
        'Kaydı oluştur',
        ready(RecordAction.saveStandalone)
            ? bound(() => emit(RecordAction.saveStandalone), input: true)
            : null,
        'record-save',
        primary: true,
      ),
    ];
  }

  List<Widget> closed() => [
    ...requestStatus(),
    panel([
      heading('Kayıt bilgisi doğrulanamadı'),
      text(
        'Güncel kaynak ve okuma izni doğrulanmadan özel içerik açılmaz. Bu durum bakımın tamamlandığı veya kayıt olmadığı anlamına gelmez.',
      ),
    ], caution: true),
    button(
      'Güncel kaynağı kontrol et',
      widget.onIntent == null ? null : bound(() => emit(RecordAction.refresh)),
      'record-refresh',
      primary: true,
    ),
  ];
  List<Widget> dispute() {
    if (!disputeReadable) return closed();
    final data = widget.snapshot!.dispute!, targetRecord = data.target;
    final evaluated = data.evaluated(widget.scope, widget.requestId);
    return [
      ...requestStatus(),
      panel([
        heading(
          !evaluated
              ? 'Bugünkü değerlendirme bilinmiyor'
              : switch (targetRecord.meaning) {
                  HistoryMeaning.disputed ||
                  HistoryMeaning.unresolved => 'Henüz çözümlenmedi',
                  HistoryMeaning.withdrawn => 'Kanıt geri çekildi',
                  _ => 'Bugünkü kayıt durumu',
                },
        ),
        text(
          'Çelişen beyanlar ayrı tutulur. Bir taraf kendiliğinden kesin doğru veya kazanan sayılmaz.',
        ),
        if (evaluated)
          text(targetRecord.values[HistoryField.evaluation]!)
        else
          text(
            'Güncel değerlendirme kaynağı eksik; son yazılan bilgi kesin doğru sayılmaz.',
          ),
        if (!evaluated ||
            targetRecord.meaning == HistoryMeaning.disputed ||
            targetRecord.meaning == HistoryMeaning.unresolved)
          text(
            'Çözülmemiş tamamlanma iddiası bakım sayacını veya sonraki rehberi doğrulanmış bilgi gibi ilerletmez.',
          ),
      ], caution: true),
      heading('Ne uyuşmuyor?'),
      text(targetRecord.values[HistoryField.title]!),
      text(targetRecord.values[HistoryField.date]!),
      heading('İddialar ve kanıtlar'),
      if (data.claims.isEmpty)
        text(
          'Bu kaynakta karşılaştırılabilir iddia henüz yok; bir taraf doğru diye seçilmez.',
        ),
      for (final claim in data.claims)
        panel([
          text(claim.values[HistoryField.actor]!, weight: FontWeight.w600),
          text('Bildirilen sonuç: ${claim.values[HistoryField.outcome]}'),
          text('Tarih: ${claim.values[HistoryField.date]}'),
          text('Kanıt: ${claim.values[HistoryField.evidence]}'),
          text('Kaynak: ${claim.values[HistoryField.source]}'),
          text(
            claim.meaningConfirmed(widget.scope, widget.requestId)
                ? claim.values[HistoryField.evaluation]!
                : 'Bu iddianın bugünkü değerlendirmesi bilinmiyor.',
          ),
        ]),
      text(
        'Servis, profesyonel veya motosiklet sahibi rolü doğrulama değildir. Belge tek başına kusursuz işçilik garantisi vermez.',
      ),
      heading('Şu an ne biliyoruz?'),
      text('Bilinen: ${targetRecord.values[HistoryField.outcome]}'),
      text(
        targetRecord.fieldAllowed(
              widget.scope,
              widget.requestId,
              HistoryField.uncertainty,
            )
            ? 'Açık kalan: ${targetRecord.values[HistoryField.uncertainty]}'
            : 'Açık kalan: kullanılabilir sonuç güncel kaynakla kesinleşmedi.',
      ),
      if (targetRecord.highRisk)
        panel([
          heading('Önemli iddia ve bilinmeyenler'),
          text('Kaynak: ${targetRecord.values[HistoryField.source]}'),
          text('İnceleyen: ${targetRecord.values[HistoryField.reviewer]}'),
          text(
            'Bilinmeyenler: ${targetRecord.values[HistoryField.uncertainty]}',
          ),
          text(
            'İnceleme yalnız belirtilen iddia ve kanıt kapsamıdır; fiziksel güvenlik veya işçilik garantisi değildir.',
          ),
        ], caution: true),
      button(
        versionsOpen
            ? 'Değişiklik geçmişini kapat'
            : 'Önceki uyuşmazlık ve değişiklik geçmişi',
        bound(
          () => setState(() {
            versionsOpen = !versionsOpen;
          }),
        ),
        'record-versions',
      ),
      if (versionsOpen) ...[
        if (!targetRecord.revisionsConfirmed(widget.scope, widget.requestId))
          text('Geçmiş sürüm kaynağı doğrulanmadı; eski özel alanlar açılmaz.')
        else ...[
          if (targetRecord.revisions.isEmpty)
            text(
              'Bu kaynakta değişiklik izi sunulmadı; geçmiş silinmiş sayılmaz.',
            ),
          for (final revision in targetRecord.revisions)
            if (targetRecord.revisionReadable(
              widget.scope,
              widget.requestId,
              revision,
            ))
              panel([
                text('Önceki bilgi: ${revision.before}'),
                text('Yeni bilgi: ${revision.after}'),
                text('Zaman: ${revision.changedAt}'),
                text('Gerekçe: ${revision.reason}'),
                text(
                  'Önceki bilgi korunur; yeni sürüm kendiliğinden kesin doğru sayılmaz.',
                ),
              ])
            else
              text(
                'Bir geçmiş alanın güncel okuma izni yok; özel değer gösterilmiyor.',
              ),
        ],
      ],
      button(
        'Kanıt ekle',
        ready(RecordAction.addEvidence)
            ? bound(() => emit(RecordAction.addEvidence))
            : null,
        'record-add-evidence',
        primary: true,
      ),
      button(
        'Düzeltme öner',
        ready(RecordAction.proposeCorrection)
            ? bound(() => emit(RecordAction.proposeCorrection))
            : null,
        'record-correction',
      ),
      heading('Kanıtı geri çekme'),
      text(
        'Yalnız kendi kanıtını ve güncel izin verilen kapsamı geri çekebilirsin. Bu, diğer tarafın kaydını veya önceki izi silmez. Önceden bağımsızlaşmış kopyalar kendiliğinden geri alınmaz.',
      ),
      if (data.evidence.isEmpty)
        text('Bu kaynakta geri çekilecek kanıt sunulmadı.'),
      for (final evidence in data.evidence)
        if (data.evidenceReadable(
          widget.scope,
          widget.requestId,
          evidence,
        )) ...[
          text(evidence.label),
          button(
            'Kendi kanıtımı geri çek',
            ready(RecordAction.withdrawOwnEvidence, evidence: evidence)
                ? bound(
                    () => emit(
                      RecordAction.withdrawOwnEvidence,
                      evidence: evidence,
                    ),
                  )
                : null,
            'record-withdraw-${_encode(evidence.id)}',
          ),
        ] else
          text('Bir kanıtın özel bilgisi güncel okuma izni olmadan açılmaz.'),
      if (!sent &&
          widget.phase == RecordPhase.idle &&
          !ready(RecordAction.addEvidence))
        text(
          'İşlem izni veya gerekli güncel kontroller eksikse öneri ve kanıt işlemleri kapalı kalır.',
        ),
    ];
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: const Color(0xFFFFFFFF),
    child: SafeArea(
      child: SingleChildScrollView(
        key: const ValueKey('record-scroll'),
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(
                    header: true,
                    child: text(
                      widget.page == RecordPage.standalone
                          ? 'Yapılan işi kaydet'
                          : 'Kayıt uyuşmazlığı',
                      size: 32,
                      weight: FontWeight.w700,
                    ),
                  ),
                  text(widget.scope.motorcycleLabel),
                  if (widget.snapshot?.inactiveMotorcycle ?? false)
                    panel([
                      text(
                        'Motosiklet pasif. Temel geçmiş ve itiraz erişimi korunur; yeni kayıt işlemi ayrıca güncel izin ister.',
                      ),
                    ], caution: true),
                  ...(widget.page == RecordPage.standalone
                      ? standalone()
                      : dispute()),
                  text(
                    'Temel geçmiş ve itiraz bilgisi ücretli paket değişikliğiyle geriye dönük kapanmaz.',
                  ),
                  button(
                    'Destek iste',
                    widget.onIntent == null
                        ? null
                        : bound(() => emit(RecordAction.support)),
                    'record-support',
                  ),
                  button(
                    'Geçmişe dön',
                    widget.onIntent == null
                        ? null
                        : bound(() => emit(RecordAction.exit)),
                    'record-exit',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _RecordButton extends StatefulWidget {
  const _RecordButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.primary,
    required this.selected,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool primary, selected;
  @override
  State<_RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<_RecordButton> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.onPressed != null;
    final background = !active
        ? const Color(0xFFE3E8F0)
        : widget.primary
        ? const Color(0xFF0E5BD8)
        : const Color(0xFFFFFFFF);
    final foreground = active && widget.primary
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF172033);
    return FocusableActionDetector(
      enabled: active,
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
      },
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (_) {
            widget.onPressed?.call();
            return null;
          },
        ),
      },
      onShowFocusHighlight: (v) => setState(() {
        focused = v;
      }),
      child: Semantics(
        button: true,
        enabled: active,
        selected: widget.selected,
        label: widget.label,
        onTap: widget.onPressed,
        child: ExcludeSemantics(
          child: GestureDetector(
            onTap: widget.onPressed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: focused || widget.selected
                      ? active && widget.primary
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033)
                      : const Color(0xFF5E6E81),
                  width: focused
                      ? 3
                      : widget.selected
                      ? 2
                      : 1,
                ),
              ),
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: foreground,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
