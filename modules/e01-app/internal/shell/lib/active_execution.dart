import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'variant_resolution.dart';

String _required(String text) {
  final value = text.trim();
  if (value.isEmpty)
    throw ArgumentError('Çalışma bağlamı veya açıklama boş olamaz.');
  return value;
}

/// Sağlayıcının güncel çalışma bağlamı; E1 fiziksel durum veya izin üretmez.
class ExecutionScope {
  ExecutionScope({
    required this.context,
    required String executionId,
    required String guideVersion,
    required String revision,
    required String physicalRevision,
  }) : executionId = _required(executionId),
       guideVersion = _required(guideVersion),
       revision = _required(revision),
       physicalRevision = _required(physicalRevision);
  final VariantContext context;
  final String executionId, guideVersion, revision, physicalRevision;
  bool matches(ExecutionScope other) =>
      context.matches(other.context) &&
      executionId == other.executionId &&
      guideVersion == other.guideVersion &&
      revision == other.revision &&
      physicalRevision == other.physicalRevision;
}

enum ExecutionProofKind {
  decision,
  fit,
  readiness,
  content,
  visual,
  safetyCheck,
  completion,
  safeStop,
}

enum ExecutionDisplayState { active, held, mismatch }

enum WorkOutcome { completed, partialUnresolved, safelyStopped }

/// Yalnız kaynak değerlendirmesi referansı; imza veya kanonik doğrulama değildir.
class ExecutionProof {
  ExecutionProof({
    required this.scope,
    required this.kind,
    required String subjectId,
    required String evaluationId,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.current,
  }) : subjectId = _required(subjectId),
       evaluationId = _required(evaluationId),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt);
  final ExecutionScope scope;
  final ExecutionProofKind kind;
  final String subjectId, evaluationId, source, version, location, checkedAt;
  final bool current;
  bool matches(
    ExecutionScope expected,
    ExecutionProofKind purpose,
    String id,
  ) => current && scope.matches(expected) && kind == purpose && subjectId == id;
}

/// Teknik risk/önleme/durma içeriğini gerçek sağlayıcı sınıflar ve açıklar.
class ExecutionSafetyCheck {
  ExecutionSafetyCheck({
    required String id,
    required String label,
    required String risk,
    required String prevention,
    required String stopCondition,
    required this.verified,
    required this.explicitlyReviewed,
    required this.proof,
  }) : id = _required(id),
       label = _required(label),
       risk = _required(risk),
       prevention = _required(prevention),
       stopCondition = _required(stopCondition);
  final String id, label, risk, prevention, stopCondition;
  final bool verified, explicitlyReviewed;
  final ExecutionProof? proof;
  bool matches(ExecutionScope scope) =>
      verified &&
      explicitlyReviewed &&
      (proof?.matches(scope, ExecutionProofKind.safetyCheck, id) ?? false);
}

/// Önceden çözümlenmiş görsel ve tek odak sağlayıcı verisidir; teknik kanıt değildir.
class ExecutionVisual {
  ExecutionVisual({
    required this.image,
    required this.focusRegion,
    required String description,
    required String focus,
    required this.proof,
  }) : description = _required(description),
       focus = _required(focus) {
    if (focusRegion.left < 0 ||
        focusRegion.top < 0 ||
        focusRegion.right > 1 ||
        focusRegion.bottom > 1 ||
        !focusRegion.isFinite ||
        focusRegion.isEmpty) {
      throw ArgumentError(
        'Görselde tek odak bölgesi görünür sınırlar içinde olmalıdır.',
      );
    }
  }
  final ui.Image image;
  final Rect focusRegion;
  final String description, focus;
  final ExecutionProof? proof;
}

List<ExecutionSafetyCheck> _checks(List<ExecutionSafetyCheck> checks) {
  if (checks.map((c) => c.id).toSet().length != checks.length) {
    throw ArgumentError('Zorunlu kontroller ayrı kimlikli olmalıdır.');
  }
  return List.unmodifiable(checks);
}

class ActiveStepPresentation {
  ActiveStepPresentation({
    required this.scope,
    required String stepId,
    required String title,
    required String instruction,
    required String detail,
    required this.stepNumber,
    required this.stepCount,
    required this.state,
    required String holdReason,
    required this.decision,
    required this.fit,
    required this.readiness,
    required this.contentProof,
    required this.visual,
    required List<ExecutionSafetyCheck> safetyChecks,
  }) : stepId = _required(stepId),
       title = _required(title),
       instruction = _required(instruction),
       detail = _required(detail),
       holdReason = _required(holdReason),
       safetyChecks = _checks(safetyChecks) {
    if (stepNumber < 1 || stepCount < stepNumber) {
      throw ArgumentError('Adım sırası geçerli olmalıdır.');
    }
  }
  final ExecutionScope scope;
  final String stepId, title, instruction, detail, holdReason;
  final int stepNumber, stepCount;
  final ExecutionDisplayState state;
  final ExecutionProof? decision, fit, readiness, contentProof;
  final ExecutionVisual? visual;
  final List<ExecutionSafetyCheck> safetyChecks;
}

class RecoveryPresentation {
  RecoveryPresentation({
    required this.scope,
    required String stepId,
    required String reason,
    required String remediation,
    required String observationHint,
    required String safetyGuidance,
    required this.proof,
  }) : stepId = _required(stepId),
       reason = _required(reason),
       remediation = _required(remediation),
       observationHint = _required(observationHint),
       safetyGuidance = _required(safetyGuidance);
  final ExecutionScope scope;
  final String stepId, reason, remediation, observationHint, safetyGuidance;
  final ExecutionProof? proof;
}

class OutcomePresentation {
  OutcomePresentation({
    required this.scope,
    required this.completion,
    required this.safeStop,
    required List<ExecutionSafetyCheck> finalChecks,
  }) : finalChecks = _checks(finalChecks);
  final ExecutionScope scope;
  final ExecutionProof? completion, safeStop;
  final List<ExecutionSafetyCheck> finalChecks;
}

/// Her istek güncel bağlamı taşır. Bir istek, kayıt/izin/ilerleme sonucu değildir.
class ExecutionRequest {
  const ExecutionRequest({
    required this.scope,
    required this.stepId,
    this.checkId,
  });
  final ExecutionScope scope;
  final String? stepId, checkId;
}

class OutcomeRequest {
  const OutcomeRequest({required this.scope, required this.outcome});
  final ExecutionScope scope;
  final WorkOutcome outcome;
}

class ActiveStepView extends StatefulWidget {
  const ActiveStepView({
    super.key,
    this.brand,
    required this.scope,
    required this.step,
    required this.busy,
    required this.errorMessage,
    required this.onStepReported,
    required this.onProblemRequested,
    required this.onCheckRequested,
    required this.onRecheckRequested,
    required this.onSafeClosureRequested,
    required this.onTeachingRequested,
  });

  /// Marka görseli çağıranın sunumudur; yeni logo veya varlık seçilmez.
  final Widget? brand;
  final ExecutionScope scope;
  final ActiveStepPresentation? step;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<ExecutionRequest>? onStepReported,
      onProblemRequested,
      onCheckRequested,
      onRecheckRequested,
      onSafeClosureRequested;
  final ValueChanged<VariantContext>? onTeachingRequested;
  @override
  State<ActiveStepView> createState() => _ActiveStepState();
}

class _ActiveStepState extends State<ActiveStepView> {
  bool detailsOpen = false;
  @override
  void didUpdateWidget(ActiveStepView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) ||
        old.step?.stepId != widget.step?.stepId) {
      detailsOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = widget;
    final step = w.step;
    final matched = step != null && step.scope.matches(w.scope);
    final technical =
        matched &&
        (step.contentProof?.matches(
              w.scope,
              ExecutionProofKind.content,
              step.stepId,
            ) ??
            false) &&
        (step.visual?.proof?.matches(
              w.scope,
              ExecutionProofKind.visual,
              step.stepId,
            ) ??
            false);
    final ready =
        technical &&
        step.state == ExecutionDisplayState.active &&
        [step.decision, step.fit, step.readiness].asMap().entries.every(
          (entry) =>
              entry.value?.matches(
                w.scope,
                [
                  ExecutionProofKind.decision,
                  ExecutionProofKind.fit,
                  ExecutionProofKind.readiness,
                ][entry.key],
                w.scope.executionId,
              ) ??
              false,
        ) &&
        step.safetyChecks.isNotEmpty &&
        step.safetyChecks.every((check) => check.matches(w.scope));
    final reportable = ready && !w.busy && w.errorMessage == null;
    final request = ExecutionRequest(
      scope: w.scope,
      stepId: matched ? step.stepId : null,
    );
    return _Page(
      brand: w.brand,
      children: [
        Text('Motosikletim: ${w.scope.context.motorcycleLabel}'),
        Text('Rehber: ${w.scope.context.guideLabel} · ${w.scope.guideVersion}'),
        if (matched) Text('Adım ${step.stepNumber} / ${step.stepCount}'),
        if (ready) ...[
          Text(
            step.title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          const Text(
            'Bu adımın kaynak değerlendirmesi mevcut; uygunluk ve güvenlik kontrolleri ayrıca gösterilir. Doğrulama başarı garantisi değildir.',
          ),
          Semantics(
            image: true,
            label: step.visual!.description,
            child: ExcludeSemantics(child: _TaskVisual(step.visual!)),
          ),
          Text(
            step.visual!.focus,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          if (ready)
            Text(step.instruction, style: const TextStyle(fontSize: 22))
          else
            const Text(
              'Uygulama talimatı kapalı. Güncel uygunluk ve zorunlu güvenlik kontrolü tamamlanmadan normal ilerleme açılamaz.',
            ),
        ] else
          const Text(
            'Bu bağlam için güncel adım ve konum bilgisi kullanılamıyor. Yakın model veya önceki adımın talimatı kullanılmaz.',
          ),
        if (matched) ...[
          for (final check in step.safetyChecks) ...[
            Text(
              'Zorunlu güvenlik: ${check.label}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text('Risk: ${check.risk}'),
            Text('Önleme: ${check.prevention}'),
            _Notice('Durma koşulu: ${check.stopCondition}'),
            Text(
              check.matches(w.scope)
                  ? 'Güncel ve açıkça gözden geçirilmiş kontrol mevcut.'
                  : 'Güncel açık kontrol doğrulanmadı. Beyan, ses girdisi veya eski onay yeterli değildir.',
            ),
            if (!check.matches(w.scope))
              _Action(
                label: 'Bu güvenlik kontrolünü yeniden iste',
                onActivate: !w.busy && w.onCheckRequested != null
                    ? () => w.onCheckRequested!(
                        ExecutionRequest(
                          scope: w.scope,
                          stepId: step.stepId,
                          checkId: check.id,
                        ),
                      )
                    : null,
              ),
          ],
          if (!ready) _Notice('İlerleme kapalı: ${step.holdReason}'),
        ],
        if (w.busy)
          const _Notice(
            'Kontrol veya bildirim işleniyor. Yeni normal ilerleme kapalı.',
          ),
        if (w.errorMessage != null)
          _Notice(
            'İstek tamamlanmadı: ${w.errorMessage}. Güncel durumu yeniden kontrol edebilirsin.',
          ),
        if (matched) ...[
          _Action(
            label: detailsOpen ? 'Ayrıntıları kapat' : 'Ayrıntılar',
            onActivate: () => setState(() => detailsOpen = !detailsOpen),
          ),
          if (detailsOpen) ...[
            if (ready) Text(step.detail),
            if (step.contentProof != null &&
                step.contentProof!.scope.matches(w.scope))
              _Source(step.contentProof!),
            for (final proof in [step.decision, step.fit, step.readiness])
              if (proof != null && proof.scope.matches(w.scope)) _Source(proof),
            const Text(
              'Kaynak bilgisi başarı garantisi değildir. Uygunluk, zorunlu güvenlik ve sonuç kontrollerinin güncel olması gerekir.',
            ),
          ],
        ],
        _Action(
          label: 'Kontrolü tamamladım',
          primary: true,
          onActivate: reportable && w.onStepReported != null
              ? () => w.onStepReported!(request)
              : null,
        ),
        const Text(
          'Bu düğme adım bildirimini gönderir; kendiliğinden sonraki adıma geçmez veya bütün işi tamamlanmış saymaz.',
        ),
        _Action(
          label: 'Sorun var',
          onActivate: !w.busy && w.onProblemRequested != null
              ? () => w.onProblemRequested!(request)
              : null,
        ),
        if (!ready || detailsOpen)
          _Action(
            label: 'Güncel durumu yeniden kontrol et',
            onActivate: !w.busy && w.onRecheckRequested != null
                ? () => w.onRecheckRequested!(request)
                : null,
          ),
        _Action(
          label: 'Güvenli şekilde durdurma yolunu aç',
          onActivate: w.onSafeClosureRequested != null
              ? () => w.onSafeClosureRequested!(request)
              : null,
        ),
        const Text(
          'Güvenli durdurma bilgisine erişim ücret gerektirmez. Bu yolu açmak motosikletin güvenli olduğunu doğrulamaz.',
        ),
        if (!ready || detailsOpen)
          _Action(
            label: 'Yalnız öğrenme bilgisine dön',
            onActivate: w.onTeachingRequested != null
                ? () => w.onTeachingRequested!(w.scope.context)
                : null,
          ),
        if (w.onStepReported == null || w.onSafeClosureRequested == null)
          const Text(
            'Şu anda ilgili istek gönderilemiyorsa düğmesi kapalıdır; işin yapıldığı varsayılmaz.',
          ),
      ],
    );
  }
}

class RecoveryView extends StatelessWidget {
  const RecoveryView({
    super.key,
    this.brand,
    required this.scope,
    required this.recovery,
    required this.busy,
    required this.errorMessage,
    required this.onObservationRequested,
    required this.onRecheckRequested,
    required this.onSafeClosureRequested,
  });

  /// Marka görseli çağıranın sunumudur; yeni logo veya varlık seçilmez.
  final Widget? brand;
  final ExecutionScope scope;
  final RecoveryPresentation? recovery;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<ExecutionRequest>? onObservationRequested,
      onRecheckRequested,
      onSafeClosureRequested;
  @override
  Widget build(BuildContext context) {
    final r = recovery;
    final matched = r != null && r.scope.matches(scope);
    final current =
        matched &&
        (r.proof?.matches(scope, ExecutionProofKind.content, r.stepId) ??
            false);
    final request = ExecutionRequest(
      scope: scope,
      stepId: matched ? r.stepId : null,
    );
    return _Page(
      brand: brand,
      children: [
        Text('Motosikletim: ${scope.context.motorcycleLabel}'),
        const Text(
          'Sorun var — ilerleme durdu',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const _Notice(
          'Sorun açıklanıp güncel durum yeniden değerlendirilmeden normal adıma devam edilmez.',
        ),
        if (matched)
          Text('Neden durdu? ${r.reason}')
        else
          const Text(
            'Bu bağlam için güncel sorun açıklaması yok. Başka motosikletin çözümü kullanılamaz.',
          ),
        if (current) ...[
          Text('Şu an ne görüyorsun? ${r.observationHint}'),
          _Notice(r.safetyGuidance),
          Text('Düzeltme ve yeniden kontrol: ${r.remediation}'),
          _Source(r.proof!),
        ] else
          const Text(
            'Güncel güvenlik ve çözüm bilgisi doğrulanmadı; eski veya başka bağlamdaki talimatla ilerleme kapalıdır.',
          ),
        if (busy)
          const Text(
            'İstek işleniyor; yeni kanıt veya kontrol isteği beklemeli.',
          ),
        if (errorMessage != null) _Notice('İstek tamamlanmadı: $errorMessage'),
        _Action(
          label: 'Fotoğraf veya not ekleme yolunu aç',
          onActivate: !busy && onObservationRequested != null
              ? () => onObservationRequested!(request)
              : null,
        ),
        _Action(
          label: 'Durumu yeniden kontrol et',
          primary: true,
          onActivate: !busy && onRecheckRequested != null
              ? () => onRecheckRequested!(request)
              : null,
        ),
        const Text(
          'Kanıt ekleme veya kontrol isteme sorunu kendiliğinden çözmez, devam izni vermez.',
        ),
        _Action(
          label: 'Güvenli şekilde durdurma yolunu aç',
          onActivate: onSafeClosureRequested != null
              ? () => onSafeClosureRequested!(request)
              : null,
        ),
        const Text(
          'Güvenli durdurma bilgisi ücret gerektirmez. Bu yol işi tamamlandı veya güvenli diye kaydetmez.',
        ),
        if (onRecheckRequested == null || onSafeClosureRequested == null)
          const Text(
            'Bu seçenek şu anda kullanılamıyor; kontrol sonucu oluşmuş sayılmaz.',
          ),
      ],
    );
  }
}

class WorkOutcomeView extends StatefulWidget {
  const WorkOutcomeView({
    super.key,
    this.brand,
    required this.scope,
    required this.result,
    required this.busy,
    required this.errorMessage,
    required this.onRecordRequested,
    required this.onSafeClosureRequested,
    required this.onBackRequested,
  });

  /// Marka görseli çağıranın sunumudur; yeni logo veya varlık seçilmez.
  final Widget? brand;
  final ExecutionScope scope;
  final OutcomePresentation? result;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<OutcomeRequest>? onRecordRequested;
  final ValueChanged<ExecutionRequest>? onSafeClosureRequested;
  final ValueChanged<ExecutionScope>? onBackRequested;
  @override
  State<WorkOutcomeView> createState() => _OutcomeState();
}

class _OutcomeState extends State<WorkOutcomeView> {
  WorkOutcome? selected;
  @override
  void didUpdateWidget(WorkOutcomeView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) || old.result != widget.result)
      selected = null;
  }

  @override
  Widget build(BuildContext context) {
    final w = widget;
    final r = w.result;
    final matched = r != null && r.scope.matches(w.scope);
    final completed =
        matched &&
        r.finalChecks.isNotEmpty &&
        r.finalChecks.every((c) => c.matches(w.scope)) &&
        (r.completion?.matches(
              w.scope,
              ExecutionProofKind.completion,
              w.scope.executionId,
            ) ??
            false);
    final safelyStopped =
        matched &&
        (r.safeStop?.matches(
              w.scope,
              ExecutionProofKind.safeStop,
              w.scope.executionId,
            ) ??
            false);
    bool permitted(WorkOutcome o) =>
        matched &&
        switch (o) {
          WorkOutcome.completed => completed,
          WorkOutcome.partialUnresolved => true,
          WorkOutcome.safelyStopped => safelyStopped,
        };
    final valid = selected != null && permitted(selected!);
    final canRecord =
        valid &&
        !w.busy &&
        w.errorMessage == null &&
        w.onRecordRequested != null;
    return _Page(
      brand: w.brand,
      children: [
        Text('Motosikletim: ${w.scope.context.motorcycleLabel}'),
        Text('Rehber: ${w.scope.context.guideLabel} · ${w.scope.guideVersion}'),
        const Text(
          'Bu çalışma nasıl sonuçlandı?',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const Text(
          'Gerçek sonucu belirt. Kısmi, belirsiz veya yalnız durdurulmuş iş tamamlandı sayılmaz; seçim kendiliğinden doğrulama üretmez.',
        ),
        if (!matched)
          const _Notice(
            'Bu bağlam için güncel sonuç bilgisi yok. Önceki motosikletin sonucu kullanılamaz.',
          ),
        for (final outcome in WorkOutcome.values)
          _OutcomeOption(
            label: switch (outcome) {
              WorkOutcome.completed =>
                'Tamamlandı — zorunlu son kontroller doğrulandı',
              WorkOutcome.partialUnresolved =>
                'Kısmen tamamlandı / sonuç doğrulanmadı',
              WorkOutcome.safelyStopped =>
                'Güvenli şekilde durduruldu — güncel güvenlik kontrolü mevcut',
            },
            selected: selected == outcome && valid,
            onActivate: !w.busy && permitted(outcome)
                ? () => setState(() => selected = outcome)
                : null,
          ),
        if (!completed)
          const Text(
            'Tamamlandı seçeneği kapalı: bütün zorunlu son kontroller ve güncel sonuç kanıtı gerekli.',
          ),
        if (!safelyStopped)
          const Text(
            'Güvenli durma henüz doğrulanmadı. İşi durdurduysan sonucu belirsiz olarak bildirebilir ve güvenli durdurma yolunu açabilirsin.',
          ),
        if (matched) ...[
          for (final check in r.finalChecks)
            Text(
              'Son kontrol: ${check.label} — ${check.matches(w.scope) ? "güncel ve açıkça kontrol edilmiş" : "henüz doğrulanmadı"}',
            ),
          if (completed) _Source(r.completion!),
          if (safelyStopped) _Source(r.safeStop!),
        ],
        if (valid)
          Text(
            'Seçilen sonuç: ${switch (selected!) {
              WorkOutcome.completed => "Tamamlandı",
              WorkOutcome.partialUnresolved => "Kısmi / sonuç doğrulanmadı",
              WorkOutcome.safelyStopped => "Güvenli şekilde durduruldu",
            }}. Kayıt isteği bu sonucu taşır; başarı garantisi değildir.',
          ),
        if (w.busy)
          const Text('Kayıt isteği işleniyor; yeni seçim veya kayıt kapalı.'),
        if (w.errorMessage != null)
          _Notice(
            'Kayıt isteği tamamlanmadı: ${w.errorMessage}. Kaydedildi sayılmaz.',
          ),
        _Action(
          label: 'Belirttiğim sonucu kaydet',
          primary: true,
          onActivate: canRecord
              ? () => w.onRecordRequested!(
                  OutcomeRequest(scope: w.scope, outcome: selected!),
                )
              : null,
        ),
        const Text(
          'Bu düğme kayıt isteğini gönderir. Gerçek kaydın veya doğrulamanın yapıldığını kendiliğinden göstermez.',
        ),
        _Action(
          label: 'Güvenli şekilde durdurma yolunu aç',
          onActivate: w.onSafeClosureRequested != null
              ? () => w.onSafeClosureRequested!(
                  ExecutionRequest(scope: w.scope, stepId: null),
                )
              : null,
        ),
        const Text(
          'Güvenli durdurma bilgisine erişim için ödeme veya tamamlandı seçimi gerekmez.',
        ),
        _Action(
          label: 'Kaydetmeden geri dön',
          onActivate: w.onBackRequested != null
              ? () => w.onBackRequested!(w.scope)
              : null,
        ),
        if (w.onRecordRequested == null)
          const Text(
            'Şu anda kayıt gönderilemiyor; sonucun kaydedildiği varsayılmaz.',
          ),
      ],
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({required this.children, this.brand});
  final Widget? brand;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (brand != null)
            SizedBox(
              height: 32,
              child: Align(alignment: Alignment.centerLeft, child: brand),
            ),
          for (final child in children)
            Padding(padding: const EdgeInsets.only(bottom: 12), child: child),
        ],
      ),
    ),
  );
}

class _Notice extends StatelessWidget {
  const _Notice(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );
}

class _Source extends StatelessWidget {
  const _Source(this.proof);
  final ExecutionProof proof;
  @override
  Widget build(BuildContext context) => Text(
    'Kaynak: ${proof.source} · ${proof.version} · ${proof.location}\nSon kontrol: ${proof.checkedAt} · ${proof.current ? "güncel" : "güncel değil"}',
  );
}

class _OutcomeOption extends StatelessWidget {
  const _OutcomeOption({
    required this.label,
    required this.selected,
    required this.onActivate,
  });
  final String label;
  final bool selected;
  final VoidCallback? onActivate;
  @override
  Widget build(BuildContext context) => Semantics(
    inMutuallyExclusiveGroup: true,
    checked: selected,
    child: _Action(
      label: '${selected ? "Seçildi: " : ""}$label',
      onActivate: onActivate,
    ),
  );
}

class _TaskVisual extends StatelessWidget {
  const _TaskVisual(this.visual);
  final ExecutionVisual visual;
  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: visual.image.width / visual.image.height,
    child: LayoutBuilder(
      builder: (context, size) => Stack(
        children: [
          Positioned.fill(
            child: RawImage(image: visual.image, fit: BoxFit.contain),
          ),
          Positioned(
            left: size.maxWidth * visual.focusRegion.left,
            top: size.maxHeight * visual.focusRegion.top,
            width: size.maxWidth * visual.focusRegion.width,
            height: size.maxHeight * visual.focusRegion.height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF0E5BD8), width: 3),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _Action extends StatefulWidget {
  const _Action({
    required this.label,
    required this.onActivate,
    this.primary = false,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  @override
  State<_Action> createState() => _ActionState();
}

class _ActionState extends State<_Action> {
  bool focused = false;
  @override
  Widget build(BuildContext context) => FocusableActionDetector(
    enabled: widget.onActivate != null,
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
      enabled: widget.onActivate != null,
      onTap: widget.onActivate,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onActivate,
        child: Container(
          constraints: const BoxConstraints(minHeight: 52),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: widget.primary && widget.onActivate != null
                ? const Color(0xFF0E5BD8)
                : null,
            border: Border.all(
              color: focused
                  ? widget.primary && widget.onActivate != null
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF0E5BD8)
                  : widget.primary && widget.onActivate != null
                  ? const Color(0xFF0E5BD8)
                  : const Color(0xFF5E6E81),
              width: focused
                  ? 3
                  : widget.primary
                  ? 1
                  : 0,
              style: focused || widget.primary
                  ? BorderStyle.solid
                  : BorderStyle.none,
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.primary && widget.onActivate != null
                  ? const Color(0xFFFFFFFF)
                  : null,
              fontWeight: widget.primary ? FontWeight.w600 : FontWeight.normal,
              decoration: widget.primary
                  ? TextDecoration.none
                  : TextDecoration.underline,
            ),
          ),
        ),
      ),
    ),
  );
}
