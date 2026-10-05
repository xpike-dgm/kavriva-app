import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

String _required(String value) {
  final text = value.trim();
  if (text.isEmpty) throw ArgumentError('Bağlam veya açıklama boş olamaz.');
  return text;
}

/// Yalnız sunum bağlamı; henüz seçilmemiş rehber için kimlik uydurulmaz.
class DiagnosisScope {
  DiagnosisScope({
    required String motorcycleId,
    required String contextRevision,
    required String flowId,
    required String observationRevision,
    required String motorcycleLabel,
  }) : motorcycleId = _required(motorcycleId),
       contextRevision = _required(contextRevision),
       flowId = _required(flowId),
       observationRevision = _required(observationRevision),
       motorcycleLabel = _required(motorcycleLabel);
  final String motorcycleId, contextRevision, flowId, observationRevision;
  final String motorcycleLabel;
  bool matches(DiagnosisScope other) =>
      motorcycleId == other.motorcycleId &&
      contextRevision == other.contextRevision &&
      flowId == other.flowId &&
      observationRevision == other.observationRevision;
}

enum DiagnosisReferenceState { unknown, held, confirmed }

/// E3 sağlayıcısının değerlendirme referansı; E1 imza veya gerçeklik üretmez.
class DiagnosisReference {
  DiagnosisReference({
    required this.scope,
    required String requestId,
    required String purpose,
    required String subjectId,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.current,
    required this.state,
    required String reason,
  }) : requestId = _required(requestId),
       purpose = _required(purpose),
       subjectId = _required(subjectId),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt),
       reason = _required(reason);
  final DiagnosisScope scope;
  final String requestId,
      purpose,
      subjectId,
      source,
      version,
      location,
      checkedAt,
      reason;
  final bool current;
  final DiagnosisReferenceState state;
  bool relevant(
    DiagnosisScope expected,
    String purpose,
    String subject,
    String expectedId,
  ) =>
      scope.matches(expected) &&
      requestId == expectedId &&
      current &&
      this.purpose == purpose &&
      subjectId == subject;
  bool confirmed(
    DiagnosisScope expected,
    String purpose,
    String subject,
    String expectedId,
  ) =>
      relevant(expected, purpose, subject, expectedId) &&
      state == DiagnosisReferenceState.confirmed;
}

enum DiagnosisDimension {
  motorcycle('Motosiklet ve varyant'),
  applicability('Rehberin uygunluğu'),
  approval('Onay ve güncellik'),
  prerequisites('Önkoşullar'),
  readiness('Güvenlik ve hazırlık'),
  provenance('Kaynak ve bilginin geçmişi');

  const DiagnosisDimension(this.label);
  final String label;
}

enum DiagnosisProposalKind {
  knownTask,
  symptomFlow,
  clarification,
  unsupported,
  safetyHold,
}

class DiagnosisProposal {
  DiagnosisProposal({
    required this.scope,
    required String requestId,
    required this.current,
    required this.kind,
    required String id,
    required String explanation,
  }) : requestId = _required(requestId),
       id = _required(id),
       explanation = _required(explanation);
  final DiagnosisScope scope;
  final bool current;
  final DiagnosisProposalKind kind;
  final String requestId, id, explanation;
}

class DiagnosisChoice {
  DiagnosisChoice({required String id, required String label})
    : id = _required(id),
      label = _required(label) {
    if (this.id == 'unsure') throw ArgumentError('Belirsiz yanıt ayrıdır.');
  }
  final String id, label;
}

class DiagnosisCheck {
  DiagnosisCheck({
    required this.scope,
    required String requestId,
    required String id,
    required String revision,
    required String question,
    required String why,
    required this.authority,
    required List<DiagnosisChoice> choices,
    this.photoRequest,
  }) : requestId = _required(requestId),
       id = _required(id),
       revision = _required(revision),
       question = _required(question),
       why = _required(why),
       choices = List.unmodifiable(choices) {
    if (choices.isEmpty ||
        choices.map((v) => v.id).toSet().length != choices.length) {
      throw ArgumentError(
        'Bir kontrol için farklı, boş olmayan seçenekler gerekir.',
      );
    }
  }
  final DiagnosisScope scope;
  final String requestId, id, revision, question, why;
  final DiagnosisReference? authority;
  final DiagnosisPhotoRequest? photoRequest;
  final List<DiagnosisChoice> choices;
  String get subject => '$id/$revision';
  bool valid(DiagnosisScope expected, String expectedId) =>
      scope.matches(expected) &&
      requestId == expectedId &&
      (authority?.confirmed(expected, 'diagnosis-check', subject, expectedId) ??
          false);
  bool sameQuestion(DiagnosisCheck other) =>
      id == other.id &&
      revision == other.revision &&
      question == other.question &&
      why == other.why &&
      choices.length == other.choices.length &&
      List.generate(choices.length, (i) => i).every(
        (i) =>
            choices[i].id == other.choices[i].id &&
            choices[i].label == other.choices[i].label,
      );
}

/// Güncel soruda görselin neden yararlı olduğunu dış kaynak bildirir.
/// E1 yararlılık veya daha önce yüklenmiş kanıt gerçeği üretmez.
class DiagnosisPhotoRequest {
  DiagnosisPhotoRequest({
    required this.scope,
    required String requestId,
    required String checkId,
    required String checkRevision,
    required String reason,
    required this.materiallyUseful,
    required this.evidenceAlreadyProvided,
    required this.authority,
  }) : requestId = _required(requestId),
       checkId = _required(checkId),
       checkRevision = _required(checkRevision),
       reason = _required(reason);
  final DiagnosisScope scope;
  final String requestId, checkId, checkRevision, reason;
  final bool materiallyUseful, evidenceAlreadyProvided;
  final DiagnosisReference? authority;
  bool valid(
    DiagnosisCheck check,
    DiagnosisScope expected,
    String expectedId,
  ) =>
      check.valid(expected, expectedId) &&
      scope.matches(expected) &&
      requestId == expectedId &&
      checkId == check.id &&
      checkRevision == check.revision &&
      materiallyUseful &&
      (authority?.confirmed(
            expected,
            'diagnosis-photo',
            check.subject,
            expectedId,
          ) ??
          false);
}

enum DiagnosisOutcome { supported, unresolved, held }

class DiagnosisResult {
  DiagnosisResult({
    required this.scope,
    required String requestId,
    required String id,
    required this.outcome,
    required this.authority,
    required Map<DiagnosisDimension, DiagnosisReference> checks,
    required String explanation,
    required List<String> known,
    required List<String> unknown,
    required List<String> alternatives,
    required String? guideId,
    required String? guideLabel,
  }) : requestId = _required(requestId),
       id = _required(id),
       explanation = _required(explanation),
       known = List.unmodifiable(known.map(_required)),
       unknown = List.unmodifiable(unknown.map(_required)),
       alternatives = List.unmodifiable(alternatives.map(_required)),
       checks = Map.unmodifiable(checks),
       guideId = guideId == null ? null : _required(guideId),
       guideLabel = guideLabel == null ? null : _required(guideLabel);
  final DiagnosisScope scope;
  final String requestId, id, explanation;
  final DiagnosisOutcome outcome;
  final DiagnosisReference? authority;
  final Map<DiagnosisDimension, DiagnosisReference> checks;
  final List<String> known, unknown, alternatives;
  final String? guideId, guideLabel;
  bool valid(DiagnosisScope expected, String expectedId) =>
      scope.matches(expected) &&
      requestId == expectedId &&
      (authority?.confirmed(expected, 'diagnosis-result', id, expectedId) ??
          false);
  bool previewable(DiagnosisScope expected, String expectedId) =>
      valid(expected, expectedId) &&
      outcome == DiagnosisOutcome.supported &&
      known.isNotEmpty &&
      guideId != null &&
      guideLabel != null &&
      DiagnosisDimension.values.every(
        (d) =>
            checks[d]?.confirmed(
              expected,
              'diagnosis-${d.name}',
              id,
              expectedId,
            ) ??
            false,
      );
}

enum DiagnosisSafety { yes, no, unsure }

/// Kullanıcı beyanı; motosikletin güvenliği için kanıt veya izin değildir.
class DiagnosisSafetyDeclaration {
  const DiagnosisSafetyDeclaration({required this.scope, required this.answer});
  final DiagnosisScope scope;
  final DiagnosisSafety answer;
  bool permitsObservation(DiagnosisScope expected) =>
      scope.matches(expected) && answer == DiagnosisSafety.yes;
}

enum DiagnosisStage { symptom, check, result }

enum DiagnosisRequestKind {
  symptom,
  observation,
  photo,
  preview,
  moreObservation,
  summary,
  safeSupport,
  exit,
  reconcile,
}

extension on DiagnosisRequestKind {
  String get label => switch (this) {
    DiagnosisRequestKind.symptom => 'Belirti açıklaması',
    DiagnosisRequestKind.observation => 'Gözlem yanıtı',
    DiagnosisRequestKind.photo => 'Fotoğraf yolu',
    DiagnosisRequestKind.preview => 'Rehber önizlemesi',
    DiagnosisRequestKind.moreObservation => 'Ek gözlem yolu',
    DiagnosisRequestKind.summary => 'Tanı özeti',
    DiagnosisRequestKind.safeSupport => 'Güvenli destek',
    DiagnosisRequestKind.exit => 'Tanıdan çıkış',
    DiagnosisRequestKind.reconcile => 'İstek sonucunu kontrol etme',
  };
}

class DiagnosisRequest {
  DiagnosisRequest({
    required this.scope,
    required String requestId,
    required this.kind,
    this.symptom,
    this.safety,
    this.choiceId,
    this.checkId,
    this.checkRevision,
    this.resultId,
    this.guideId,
    this.originalKind,
  }) : requestId = _required(requestId);
  final DiagnosisScope scope;
  final String requestId;
  final DiagnosisRequestKind kind;
  final String? symptom, choiceId, checkId, checkRevision, resultId, guideId;
  final DiagnosisSafety? safety;
  final DiagnosisRequestKind? originalKind;
}

class UnknownDiagnosisRequest {
  UnknownDiagnosisRequest({
    required this.scope,
    required String requestId,
    required this.kind,
  }) : requestId = _required(requestId);
  final DiagnosisScope scope;
  final String requestId;
  final DiagnosisRequestKind kind;
  bool matches(DiagnosisScope expected, String expectedId) =>
      scope.matches(expected) && requestId == expectedId;
}

class DiagnosisRequestError {
  DiagnosisRequestError({
    required this.scope,
    required String requestId,
    required this.kind,
    required String message,
  }) : requestId = _required(requestId),
       message = _required(message);
  final DiagnosisScope scope;
  final String requestId, message;
  final DiagnosisRequestKind kind;
  bool matches(DiagnosisScope expected, String expectedId) =>
      scope.matches(expected) && requestId == expectedId;
}

/// SCR-019..021 sunumu. İşleyiciler yalnız niyet alır; fiziksel iş yapılmaz.
class DiagnosisView extends StatefulWidget {
  DiagnosisView({
    super.key,
    this.brand,
    required this.scope,
    required String requestId,
    required this.stage,
    required this.safety,
    required this.proposal,
    required this.check,
    required this.result,
    required this.busy,
    required this.unknownRequest,
    required this.error,
    required Map<DiagnosisRequestKind, ValueChanged<DiagnosisRequest>> handlers,
  }) : requestId = _required(requestId),
       handlers = Map.unmodifiable(handlers);
  final Widget? brand;
  final DiagnosisScope scope;
  final String requestId;
  final DiagnosisStage stage;
  final DiagnosisSafetyDeclaration? safety;
  final DiagnosisProposal? proposal;
  final DiagnosisCheck? check;
  final DiagnosisResult? result;
  final bool busy;
  final UnknownDiagnosisRequest? unknownRequest;
  final DiagnosisRequestError? error;
  final Map<DiagnosisRequestKind, ValueChanged<DiagnosisRequest>> handlers;
  @override
  State<DiagnosisView> createState() => _DiagnosisViewState();
}

class _DiagnosisViewState extends State<DiagnosisView> {
  final text = TextEditingController();
  final textFocus = FocusNode();
  DiagnosisSafety? answer;
  String? selected;
  bool sourceExpanded = false;
  @override
  void initState() {
    super.initState();
    text.addListener(_edited);
  }

  void _edited() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(DiagnosisView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.scope.matches(widget.scope) ||
        oldWidget.requestId != widget.requestId ||
        oldWidget.result != widget.result) {
      sourceExpanded = false;
    }
    if (!oldWidget.scope.matches(widget.scope) ||
        oldWidget.requestId != widget.requestId ||
        oldWidget.stage != widget.stage) {
      text.clear();
      answer = null;
      selected = null;
    }
    if (oldWidget.check == null ||
        widget.check == null ||
        !oldWidget.check!.sameQuestion(widget.check!) ||
        !(widget.check?.valid(widget.scope, widget.requestId) ?? false))
      selected = null;
  }

  @override
  void dispose() {
    text.dispose();
    textFocus.dispose();
    super.dispose();
  }

  bool get normal =>
      !widget.busy && widget.unknownRequest == null && widget.error == null;
  bool get observationSafe =>
      widget.safety?.permitsObservation(widget.scope) ?? false;
  DiagnosisRequest request(DiagnosisRequestKind kind) => DiagnosisRequest(
    scope: widget.scope,
    requestId: widget.requestId,
    kind: kind,
    symptom: kind == DiagnosisRequestKind.symptom ? text.text.trim() : null,
    safety: kind == DiagnosisRequestKind.symptom ? answer : null,
    choiceId: kind == DiagnosisRequestKind.observation ? selected : null,
    checkId:
        kind == DiagnosisRequestKind.observation ||
            kind == DiagnosisRequestKind.photo
        ? widget.check?.id
        : null,
    checkRevision:
        kind == DiagnosisRequestKind.observation ||
            kind == DiagnosisRequestKind.photo
        ? widget.check?.revision
        : null,
    resultId:
        kind == DiagnosisRequestKind.preview ||
            kind == DiagnosisRequestKind.summary
        ? widget.result?.id
        : null,
    guideId: kind == DiagnosisRequestKind.preview
        ? widget.result?.guideId
        : null,
    originalKind: kind == DiagnosisRequestKind.reconcile
        ? widget.unknownRequest?.kind ?? widget.error?.kind
        : null,
  );
  Widget action(
    DiagnosisRequestKind kind,
    String label, {
    bool enabled = true,
    bool primary = false,
  }) {
    final handler = widget.handlers[kind];
    return _DiagnosisAction(
      key: ValueKey(kind),
      label: label,
      primary: primary,
      onActivate: enabled && handler != null
          ? () => handler(request(kind))
          : null,
    );
  }

  Widget status(String message) =>
      Semantics(liveRegion: true, child: Text(message));
  Widget heading(String title) => Semantics(
    header: true,
    child: Padding(
      padding: const EdgeInsets.only(top: 28, bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize:
              title == 'Motorda ne oluyor?' ||
                  title == widget.check?.question ||
                  title == 'Bulgular bir yönü destekliyor' ||
                  title == 'Tanıya devam şu anda kapalı' ||
                  title == 'Belirtiyi açıklayacak sonucu henüz netleştiremedik'
              ? 32
              : 22,
          height: 1.2,
          fontWeight: FontWeight.w700,
          letterSpacing: -.5,
        ),
      ),
    ),
  );
  Widget list(String title, List<String> values, String empty) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heading(title),
      if (values.isEmpty) Text(empty),
      for (final v in values)
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F6FA),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text('• $v'),
        ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    final w = widget;
    final checkValid = w.check?.valid(w.scope, w.requestId) ?? false;
    final photo = w.check?.photoRequest;
    final photoValid =
        checkValid && (photo?.valid(w.check!, w.scope, w.requestId) ?? false);
    final resultValid = w.result?.valid(w.scope, w.requestId) ?? false;
    final preview =
        observationSafe &&
        (w.result?.previewable(w.scope, w.requestId) ?? false);
    return DefaultTextStyle.merge(
      style: const TextStyle(
        fontSize: 16,
        height: 1.3,
        color: Color(0xFF172033),
      ),
      child: ColoredBox(
        color: const Color(0xFFFFFFFF),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Padding(
                  key: const ValueKey('diagnosis-body'),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (w.brand != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: w.brand!,
                        ),
                      Text(
                        'Motosikletim: ${w.scope.motorcycleLabel}',
                        style: const TextStyle(
                          color: Color(0xFF526079),
                          fontSize: 15,
                        ),
                      ),
                      if (w.busy)
                        status(
                          'İstek işleniyor. Yeni yanıt ve normal devam şu anda kapalı.',
                        ),
                      if (w.unknownRequest != null) ...[
                        heading('İsteğin sonucu henüz belli değil'),
                        if (w.unknownRequest!.matches(w.scope, w.requestId))
                          Text(
                            '${w.unknownRequest!.kind.label} isteğinin sonucu bekleniyor.',
                          ),
                        status(
                          'Çevrimdışı kalmış veya yanıtı ulaşmamış bir istek başarı ya da başarısızlık sayılmaz. İşlem tekrar uygulanmaz; yeni yanıt ve normal ilerleme kapalı.',
                        ),
                        action(
                          DiagnosisRequestKind.reconcile,
                          'Önce aynı isteğin sonucunu kontrol et',
                          primary: true,
                          enabled:
                              !w.busy &&
                              w.unknownRequest!.matches(w.scope, w.requestId),
                        ),
                        if (!w.unknownRequest!.matches(w.scope, w.requestId))
                          const Text(
                            'Sonuç bilgisi bu bağlama veya isteğe ait değil. Yabancı istek yeniden kullanılmaz; güncel bilgi olmadan devam kapalı.',
                          ),
                      ] else if (w.error != null) ...[
                        heading('Son isteğin sonucu doğrulanamadı'),
                        status(
                          w.error!.matches(w.scope, w.requestId)
                              ? '${w.error!.kind.label} isteğinin sonucu doğrulanamadı: ${w.error!.message}. Bu hata mevcut kaynak değerlendirmesinin iptal edildiğini veya fiziksel işlemin yapıldığını ya da yapılmadığını kanıtlamaz.'
                              : 'Hata bilgisi bu bağlama veya isteğe ait değil; eski veya yabancı ayrıntı gösterilmez.',
                        ),
                        action(
                          DiagnosisRequestKind.reconcile,
                          'Son isteğin sonucunu kontrol et',
                          primary: true,
                          enabled:
                              !w.busy && w.error!.matches(w.scope, w.requestId),
                        ),
                      ],
                      if (w.stage != DiagnosisStage.symptom && !observationSafe)
                        status(
                          'Güvenlik beyanı eksik, olumsuz veya bu bağlama ait değil. Tanıya devam kapalı; güvenli destek yolunu kullanabilirsin.',
                        ),
                      if (w.stage == DiagnosisStage.symptom) ...[
                        heading('Motorda ne oluyor?'),
                        const Text('Teknik terim kullanmadan anlatabilirsin.'),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFBFD),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFF8995AA)),
                          ),
                          constraints: const BoxConstraints(minHeight: 132),
                          child: Semantics(
                            label: 'Motosiklette gördüğün veya duyduğun sorunu anlat',
                            child: EditableText(
                              key: const ValueKey('symptom-input'),
                              controller: text,
                              focusNode: textFocus,
                              style: DefaultTextStyle.of(context).style
                                  .copyWith(
                                    fontSize: 18,
                                    color: const Color(0xFF172033),
                                  ),
                              cursorColor: const Color(0xFF0E5BD8),
                              backgroundCursorColor: const Color(0xFF5E6E81),
                              maxLines: 5,
                              readOnly: !normal,
                            ),
                          ),
                        ),
                        heading('Şu anda güvenli mi?'),
                        const Text(
                          'Hayır veya emin değilsen tanıya devam etme; güvenli bir yerde dur. Emin olmadığın koşulu olumlu sayma.',
                        ),
                        for (final choice in DiagnosisSafety.values)
                          _DiagnosisAction(
                            key: ValueKey('safety-${choice.name}'),
                            label: switch (choice) {
                              DiagnosisSafety.yes => 'Evet, güvenli',
                              DiagnosisSafety.no => 'Hayır',
                              DiagnosisSafety.unsure => 'Emin değilim',
                            },
                            selected: answer == choice,
                            onActivate: normal
                                ? () => setState(() => answer = choice)
                                : null,
                          ),
                        const Text(
                          'Bu seçim kendi beyanındır; güvenliği kanıtlamaz veya motosikleti kullanma izni vermez.',
                        ),
                        action(
                          DiagnosisRequestKind.symptom,
                          answer == DiagnosisSafety.no ||
                                  answer == DiagnosisSafety.unsure
                              ? 'Gözlem yolu kapalı; güvenli destek yolunu kullan'
                              : 'Gözlem sorusunu istemek için devam et',
                          primary: true,
                          enabled:
                              normal &&
                              answer == DiagnosisSafety.yes &&
                              text.text.trim().isNotEmpty,
                        ),
                      ],
                      if (w.stage == DiagnosisStage.check) ...[
                        heading(
                          checkValid
                              ? w.check!.question
                              : 'Güncel gözlem sorusu henüz doğrulanmadı',
                        ),
                        if (checkValid) ...[
                          const Text(
                            'Şu an yalnızca bu gözlemi seç. Emin değilim de geçerli bir yanıttır.',
                          ),
                          Text(w.check!.why),
                          for (final choice in w.check!.choices)
                            _DiagnosisAction(
                              key: ValueKey('choice-${choice.id}'),
                              label: choice.label,
                              selected: selected == choice.id,
                              onActivate: normal && observationSafe
                                  ? () => setState(() => selected = choice.id)
                                  : null,
                            ),
                          _DiagnosisAction(
                            key: const ValueKey('choice-unsure'),
                            label: 'Emin değilim',
                            selected: selected == 'unsure',
                            onActivate: normal && observationSafe
                                ? () => setState(() => selected = 'unsure')
                                : null,
                          ),
                          const Text(
                            'Bu gözlem olasılıkları ayırmaya yardımcı olur. Seçim, kesin arıza veya tamir sonucu değildir.',
                          ),
                          action(
                            DiagnosisRequestKind.observation,
                            'Gözlem yanıtını gönder',
                            primary: true,
                            enabled:
                                normal &&
                                observationSafe &&
                                selected != null &&
                                (selected == 'unsure' ||
                                    w.check!.choices.any(
                                      (v) => v.id == selected,
                                    )),
                          ),
                          if (photoValid) ...[
                            heading(
                              'Fotoğraf bu gözleme neden yardımcı olabilir?',
                            ),
                            Text(photo!.reason),
                            if (photo.evidenceAlreadyProvided)
                              const Text(
                                'Kaynak, bu gözleme ait önceki fotoğrafın mevcut olduğunu bildiriyor. Yeniden fotoğraf istenmiyor.',
                              )
                            else
                              action(
                                DiagnosisRequestKind.photo,
                                'İstersen fotoğraf ekleme yolunu aç',
                                enabled: normal && observationSafe,
                              ),
                            const Text(
                              'Fotoğraf isteğe bağlıdır; eklemek otomatik teşhis, fiziksel doğrulama veya devam izni değildir.',
                            ),
                          ],
                        ] else
                          const Text(
                            'Eksik, eski veya başka motosiklete ait soru ile yanıt gönderilmez. Bir sonraki kontrol tahmin edilmez.',
                          ),
                      ],
                      if (w.stage == DiagnosisStage.result) ...[
                        if (resultValid &&
                            (w.unknownRequest != null ||
                                w.error != null ||
                                w.busy)) ...[
                          heading('Kaynağın güncel değerlendirmesi'),
                          const Text(
                            'Aşağıdaki kaynak bilgisi son isteğin başarı sonucu değildir. İsteğin sonucu doğrulanana kadar normal ilerleme kapalı.',
                          ),
                        ],
                        if (w.proposal != null &&
                            w.proposal!.current &&
                            w.proposal!.scope.matches(w.scope) &&
                            w.proposal!.requestId == w.requestId) ...[
                          heading('Öneri, kesin sonuç değildir'),
                          Text(w.proposal!.explanation),
                          const Text(
                            'AI önerisi tek başına onay veya güvenli kullanım izni vermez. Güncel kaynak değerlendirmesi ayrıca gereklidir.',
                          ),
                        ],
                        heading(
                          !resultValid
                              ? 'Sonuç henüz doğrulanmadı'
                              : switch (w.result!.outcome) {
                                  DiagnosisOutcome.supported =>
                                    'Bulgular bir yönü destekliyor',
                                  DiagnosisOutcome.unresolved => 'Belirtiyi açıklayacak sonucu henüz netleştiremedik',
                                  DiagnosisOutcome.held =>
                                    'Tanıya devam şu anda kapalı',
                                },
                        ),
                        if (resultValid) ...[
                          Text(w.result!.explanation),
                          const Text(
                            'Bu ekran kesin arıza, yapılmış tamir veya güvenli sürüş garantisi vermez.',
                          ),
                          list(
                            'Şu ana kadar bilinenler',
                            w.result!.known,
                            'Henüz doğrulanmış gözlem yok.',
                          ),
                          const Text(
                            'Gözlem kayıtları tek başına güncel fiziksel durumun doğrulanması değildir.',
                          ),
                          list(
                            'Henüz bilinmeyenler',
                            w.result!.unknown,
                            'Kaynak ek bir bilinmeyen alan bildirmedi; bu, tamir veya tamamlanma değildir.',
                          ),
                          list(
                            'Diğer olasılıklar',
                            w.result!.alternatives,
                            'Kaynak başka bir olasılık bildirmedi; kesin arıza çıkarılmaz.',
                          ),
                          heading('Güncel kaynak kontrolü'),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: Text(
                              'Bunlar kaynak değerlendirmesidir; motosikletin fiziksel olarak güvenli olduğu veya sürüş izni verildiği anlamına gelmez.',
                              style: TextStyle(color: Color(0xFF526079)),
                            ),
                          ),
                          for (final d in DiagnosisDimension.values)
                            if (!(w.result!.checks[d]?.confirmed(
                                  w.scope,
                                  'diagnosis-${d.name}',
                                  w.result!.id,
                                  w.requestId,
                                ) ??
                                false))
                              Text(
                                '${d.label}: Olumlu doğrulanmadı; devam izni sayılmaz',
                              ),
                          if (w.result!.outcome ==
                              DiagnosisOutcome.supported) ...[
                            action(
                              DiagnosisRequestKind.preview,
                              preview
                                  ? 'Rehber önizlemesini aç: ${w.result!.guideLabel}'
                                  : 'Rehber önizlemesi henüz açılamıyor',
                              primary: true,
                              enabled: normal && preview,
                            ),
                            const Text(
                              'Sıradaki yol rehberin önizlemesidir; doğrudan tamire başlama değildir. Uygulamadan önce motosiklete uygunluk ve hazırlık kendi güncel kontrolleriyle ayrıca ele alınır.',
                            ),
                          ] else if (w.result!.outcome ==
                              DiagnosisOutcome.unresolved) ...[
                            const Text(
                              'Sonuç netleşmediyse rastgele parça değiştirme. Bilinen ve bilinmeyen bilgiler korunur; kesin sonuç tahmin edilmez.',
                            ),
                            action(
                              DiagnosisRequestKind.moreObservation,
                              'Bir ek gözlem yolunu aç',
                              primary: true,
                              enabled:
                                  normal &&
                                  observationSafe &&
                                  w.result!.outcome ==
                                      DiagnosisOutcome.unresolved,
                            ),
                          ] else ...[
                            const Text(
                              'Yeni gözlem ve rehber önizlemesi şu anda kapalı. Tanı özetini inceleyebilir, güvenli destek veya çıkış yolunu kullanabilirsin.',
                            ),
                          ],
                          action(
                            DiagnosisRequestKind.summary,
                            'Tanı özetini görüntüle',
                          ),
                          const Text(
                            'Özet yolu bilgileri görmeni ister; motosikleti tamir edilmiş veya işi tamamlanmış olarak kaydetmez.',
                          ),
                          _DiagnosisAction(
                            key: const ValueKey('diagnosis-source-details'),
                            label: sourceExpanded
                                ? 'Kaynak ve kontrol ayrıntılarını kapat'
                                : 'Kaynak ve kontrol ayrıntılarını göster',
                            onActivate: () => setState(
                              () => sourceExpanded = !sourceExpanded,
                            ),
                          ),
                          if (sourceExpanded) ...[
                            heading('Kaynak ayrıntısı'),
                            for (final d in DiagnosisDimension.values)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '${d.label}: ${w.result!.checks[d]?.confirmed(w.scope, 'diagnosis-${d.name}', w.result!.id, w.requestId) ?? false ? 'Kaynak bu sonuç için olumlu değerlendirme bildirdi; sürüş izni değildir' : 'Olumlu doğrulanmadı; devam izni sayılmaz'}',
                                ),
                              ),
                            Text(
                              '${w.result!.authority!.source} · ${w.result!.authority!.version} · ${w.result!.authority!.location}',
                            ),
                            Text(
                              'Kontrol tarihi: ${w.result!.authority!.checkedAt}',
                            ),
                          ],
                        ] else
                          const Text(
                            'Bir öneri veya kayıt bulunması olumlu doğrulama değildir. Eski, eksik veya yabancı sonuçla normal ilerleme kapalıdır.',
                          ),
                      ],
                      action(
                        DiagnosisRequestKind.safeSupport,
                        'Güvenli destek yolunu aç',
                      ),
                      const Text(
                        'Güvenli destek veya çıkış bilgisi ücret ve normal devam onayı gerektirmez. Bu yollar fiziksel olarak durduğunu veya işi bitirdiğini kaydetmez.',
                      ),
                      action(
                        DiagnosisRequestKind.exit,
                        'Tanıdan çıkış yolunu aç',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DiagnosisAction extends StatefulWidget {
  const _DiagnosisAction({
    super.key,
    required this.label,
    required this.onActivate,
    this.primary = false,
    this.selected,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  final bool? selected;
  @override
  State<_DiagnosisAction> createState() => _DiagnosisActionState();
}

class _DiagnosisActionState extends State<_DiagnosisAction> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    final enabled = widget.onActivate != null;
    final filled = widget.primary && enabled;
    return Padding(
      padding: const EdgeInsets.only(top: 12),
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
          button: widget.selected == null,
          enabled: enabled,
          checked: widget.selected,
          inMutuallyExclusiveGroup: widget.selected != null,
          onTap: widget.onActivate,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onActivate,
            child: Container(
              constraints: const BoxConstraints(minHeight: 52),
              alignment: widget.primary
                  ? Alignment.center
                  : Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: filled
                    ? const Color(0xFF0E5BD8)
                    : widget.selected == true
                    ? const Color(0xFFEDF4FF)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: focused
                      ? filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF0E5BD8)
                      : widget.selected == true
                      ? const Color(0xFF0E5BD8)
                      : widget.selected != null
                      ? const Color(0xFFC5CFDF)
                      : widget.primary
                      ? const Color(0xFF8995AA)
                      : const Color(0xFFC5CFDF),
                  width: focused ? 3 : 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.selected != null) ...[
                    ExcludeSemantics(
                      child: Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: widget.selected == true
                                ? const Color(0xFF0E5BD8)
                                : const Color(0xFF526079),
                            width: 2,
                          ),
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.selected == true
                                ? const Color(0xFF0E5BD8)
                                : const Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                  ],
                  Flexible(
                    child: Text(
                      '${widget.selected == true ? 'Seçili: ' : ''}${widget.label}${enabled ? '' : ' — şu anda kapalı'}',
                      style: TextStyle(
                        fontSize: widget.primary || widget.selected != null
                            ? 18
                            : 16,
                        color: filled
                            ? const Color(0xFFFFFFFF)
                            : const Color(0xFF172033),
                        fontWeight: widget.primary
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (!widget.primary && widget.selected == null) ...[
                    const SizedBox(width: 12),
                    const ExcludeSemantics(
                      child: Text(
                        '›',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF526079),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
