import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'active_execution.dart';

String _nonempty(String value) {
  final text = value.trim();
  if (text.isEmpty)
    throw ArgumentError('Kesinti bağlamı veya açıklama boş olamaz.');
  return text;
}

List<String>? _history(List<String>? values) =>
    values == null ? null : List.unmodifiable(values.map(_nonempty));

/// Geçmiş kaydı güncel fiziksel doğrulama değildir; kalıcılık E1 dışında kalır.
class InterruptedWorkSnapshot {
  InterruptedWorkSnapshot({
    required this.scope,
    required String savedAt,
    required this.lastDefiniteStep,
    required this.savedCurrentStep,
    required List<String>? removedParts,
    required List<String>? measurements,
    required List<String>? photosAndNotes,
    required List<String>? safetyNotes,
    required List<String>? preparationNotes,
  }) : savedAt = _nonempty(savedAt),
       removedParts = _history(removedParts),
       measurements = _history(measurements),
       photosAndNotes = _history(photosAndNotes),
       safetyNotes = _history(safetyNotes),
       preparationNotes = _history(preparationNotes) {
    if (lastDefiniteStep != null) _nonempty(lastDefiniteStep!);
    if (savedCurrentStep != null) _nonempty(savedCurrentStep!);
  }
  final ExecutionScope scope;
  final String savedAt;
  final String? lastDefiniteStep, savedCurrentStep;
  final List<String>? removedParts, measurements, photosAndNotes;
  final List<String>? safetyNotes, preparationNotes;

  // Historical versions remain readable in the same motorcycle/work lineage.
  bool belongsTo(ExecutionScope current) =>
      scope.context.motorcycleId == current.context.motorcycleId &&
      scope.executionId == current.executionId;
}

/// Kaynak referansı yalnız bu yeni kesinti için kullanılabilir; eski onay taşınmaz.
enum ResumeReferenceState { unknown, held, confirmed }

class ResumeReference {
  ResumeReference({
    required String interruptionId,
    required this.proof,
    required this.state,
  }) : interruptionId = _nonempty(interruptionId);
  final String interruptionId;
  final ExecutionProof proof;
  // Güncellik sonuç değildir; olumlu değerlendirmeyi sağlayıcı açıkça bildirir.
  final ResumeReferenceState state;
  bool matches(
    ExecutionScope scope,
    String interruption,
    ExecutionProofKind purpose,
    String subject,
  ) =>
      state == ResumeReferenceState.confirmed &&
      interruptionId == interruption &&
      proof.matches(scope, purpose, subject);
}

class ResumeSafetyCheck {
  ResumeSafetyCheck({required String interruptionId, required this.check})
    : interruptionId = _nonempty(interruptionId);
  final String interruptionId;
  final ExecutionSafetyCheck check;
  bool matches(ExecutionScope scope, String interruption) =>
      interruptionId == interruption && check.matches(scope);
}

/// Yeniden doğrulama kararı ve kontrol sınıflaması gerçek sağlayıcı girdisidir.
class ResumeAssessment {
  ResumeAssessment({
    required this.scope,
    required String interruptionId,
    required String reason,
    required this.decision,
    required this.physicalState,
    required this.fit,
    required this.readiness,
    required this.materialGuideChange,
    required List<ResumeSafetyCheck> checks,
  }) : interruptionId = _nonempty(interruptionId),
       reason = _nonempty(reason),
       checks = List.unmodifiable(checks) {
    if (checks.map((c) => c.check.id).toSet().length != checks.length) {
      throw ArgumentError('Güncel zorunlu kontroller ayrı kimlikli olmalıdır.');
    }
  }
  final ExecutionScope scope;
  final String interruptionId, reason;
  final ResumeReference? decision, physicalState, fit, readiness;
  final bool materialGuideChange;
  final List<ResumeSafetyCheck> checks;
}

/// Güncel bağlamla istek; doğrulanmış durum, kayıt veya otomatik ilerleme değildir.
class ResumeRequest {
  ResumeRequest({
    required this.scope,
    required String interruptionId,
    this.checkId,
  }) : interruptionId = _nonempty(interruptionId);
  final ExecutionScope scope;
  final String interruptionId;
  final String? checkId;
}

class ResumeRevalidationView extends StatefulWidget {
  ResumeRevalidationView({
    super.key,
    this.brand,
    required this.scope,
    required String interruptionId,
    required this.saved,
    required this.assessment,
    required this.busy,
    required this.errorMessage,
    required this.onCheckRequested,
    required this.onObservationRequested,
    required this.onRevalidationRequested,
    required this.onCurrentStepRequested,
    required this.onRemapRequested,
    required this.onSafeClosureRequested,
  }) : interruptionId = _nonempty(interruptionId);
  final Widget? brand;
  final ExecutionScope scope;
  final String interruptionId;
  final InterruptedWorkSnapshot? saved;
  final ResumeAssessment? assessment;
  final bool busy;
  final String? errorMessage;
  final ValueChanged<ResumeRequest>? onCheckRequested, onObservationRequested;
  final ValueChanged<ResumeRequest>? onRevalidationRequested;
  final ValueChanged<ResumeRequest>? onCurrentStepRequested, onRemapRequested;
  final ValueChanged<ResumeRequest>? onSafeClosureRequested;
  @override
  State<ResumeRevalidationView> createState() => _ResumeState();
}

class _ResumeState extends State<ResumeRevalidationView> {
  bool detailsOpen = false;
  @override
  void didUpdateWidget(ResumeRevalidationView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) ||
        old.interruptionId != widget.interruptionId ||
        old.saved != widget.saved) {
      detailsOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = widget;
    final saved = w.saved;
    final history = saved != null && saved.belongsTo(w.scope);
    final a = w.assessment;
    final current =
        a != null &&
        a.scope.matches(w.scope) &&
        a.interruptionId == w.interruptionId;
    final changed =
        (history &&
            (saved.scope.context.guideId != w.scope.context.guideId ||
                saved.scope.guideVersion != w.scope.guideVersion)) ||
        (current && a.materialGuideChange);
    bool source(ResumeReference? ref, ExecutionProofKind kind) =>
        ref?.matches(w.scope, w.interruptionId, kind, w.scope.executionId) ??
        false;
    final physical =
        current && source(a.physicalState, ExecutionProofKind.content);
    final fit = current && source(a.fit, ExecutionProofKind.fit);
    final preparation =
        current && source(a.readiness, ExecutionProofKind.readiness);
    final decision = current && source(a.decision, ExecutionProofKind.decision);
    final ready =
        history &&
        !changed &&
        physical &&
        fit &&
        preparation &&
        decision &&
        a.checks.isNotEmpty &&
        a.checks.every((c) => c.matches(w.scope, w.interruptionId));
    final canAct = !w.busy;
    final request = ResumeRequest(
      scope: w.scope,
      interruptionId: w.interruptionId,
    );
    final currentStepAction = _ResumeAction(
      label: 'Güncel rehber adımını aç',
      primary: ready,
      onActivate:
          canAct &&
              w.errorMessage == null &&
              ready &&
              w.onCurrentStepRequested != null
          ? () => w.onCurrentStepRequested!(request)
          : null,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (w.brand != null)
              SizedBox(
                height: 32,
                child: Align(alignment: Alignment.centerLeft, child: w.brand),
              ),
            ...[
              Text('Motosikletim: ${w.scope.context.motorcycleLabel}'),
              Text(
                'Güncel rehber: ${w.scope.context.guideLabel} · ${w.scope.guideVersion}',
              ),
              Text(
                ready
                    ? 'Güncel kontroller doğrulandı'
                    : 'Devam etmeden önce yeniden kontrol',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Kaydedilen ilerleme, motosikletin şu anki durumunu doğrulamaz. Eski kritik onaylar otomatik geçerli değildir.',
              ),
              if (history) ...[
                Text(
                  'Son kesin adım: ${saved.lastDefiniteStep ?? "Bilinmiyor"}',
                ),
                Text(
                  'Kayıtlı mevcut adım: ${saved.savedCurrentStep ?? "Bilinmiyor"}',
                ),
                Text(
                  'Bu bilgiler geçmiş bağlamdır. Kayıt zamanı: ${saved.savedAt}',
                ),
                const Text(
                  'Eski adım, sökülen parçalar ve notlar, yarım kalan işte nerede kaldığını hatırlaman için korunur. Bunlar devam izni veya güncel fiziksel kanıt değildir.',
                ),
              ] else
                const _Status(
                  'Bu çalışma için kayıtlı bağlam yok veya başka motosiklete/işe ait. Eksik ilerleme tamamlanmış sayılmaz; eski adım tahmin edilmez.',
                ),
              if (changed)
                const _Status(
                  'Rehber değişmiş. Eski adımdan devam edilemez; güncel fiziksel durum yeni rehbere yeniden eşlenmelidir.',
                ),
              Text(
                ready ? 'Bu kesinti için güncel sonuç' : 'Şu an doğrulanmalı',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Mevcut fiziksel durum: ${physical ? "Bu kesinti için olumlu olarak yeniden doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
              ),
              Text(
                'Motosiklete uygunluk: ${fit ? "Bu kesinti için olumlu olarak yeniden doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
              ),
              Text(
                'Hazırlık koşulları: ${preparation ? "Bu kesinti için olumlu olarak yeniden doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
              ),
              if (current && a.checks.isNotEmpty)
                for (final item in a.checks) ...[
                  Text(
                    'Zorunlu kontrol: ${item.check.label}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text('Risk: ${item.check.risk}'),
                  Text('Önleme: ${item.check.prevention}'),
                  _Status('Durma koşulu: ${item.check.stopCondition}'),
                  Text(
                    item.matches(w.scope, w.interruptionId)
                        ? 'Bu kesinti için yeniden doğrulandı ve açıkça gözden geçirildi.'
                        : 'Henüz doğrulanmadı. Eski onay, fotoğraf, beyan veya ses girdisi tek başına yeterli değildir.',
                  ),
                  if (!item.matches(w.scope, w.interruptionId))
                    _ResumeAction(
                      label: 'Bu kontrolü yeniden iste',
                      onActivate: canAct && w.onCheckRequested != null
                          ? () => w.onCheckRequested!(
                              ResumeRequest(
                                scope: w.scope,
                                interruptionId: w.interruptionId,
                                checkId: item.check.id,
                              ),
                            )
                          : null,
                    ),
                ]
              else
                const _Status(
                  'Güncel zorunlu kontrol listesi henüz doğrulanmadı. Boş liste, bütün koşullar tamam demek değildir.',
                ),
              if (current && !ready) _Status('Neden kapalı? ${a.reason}'),
              _Status(
                ready
                    ? 'Güncel fiziksel durum, uygunluk, hazırlık ve zorunlu kontroller bu kesinti için olumlu olarak yeniden doğrulandı. Kaynak kararı güncel rehber adımı yoluna izin veriyor; bu sonuç başarı garantisi değildir.'
                    : 'Gerekli güncel kontroller tamamlanana kadar rehber adımı kapalı.',
              ),
              if (w.busy)
                const _Status(
                  'Kontrol isteği işleniyor. Yeni devam veya kontrol isteği kapalı.',
                ),
              if (w.errorMessage != null)
                _Status(
                  'İstek tamamlanmadı: ${w.errorMessage}. Yeniden doğrulandı veya kaydedildi sayılmaz.',
                ),
              _ResumeAction(
                label: 'Fotoğraf veya not ekleme yolunu aç',
                onActivate: canAct && w.onObservationRequested != null
                    ? () => w.onObservationRequested!(request)
                    : null,
              ),
              const Text(
                'Gözlem eklemek tek başına kritik kontrolü doğrulamaz veya rehber adımını açmaz.',
              ),
              if (ready) ...[
                currentStepAction,
                const Text(
                  'Bu düğme, güncel kontrolleri doğrulanmış rehber adımı ekranına geçiş ister. Kendiliğinden sonraki adımı uygulamaz veya işi tamamlandı saymaz.',
                ),
              ],
              _ResumeAction(
                label: 'Yeniden kontrol iste',
                primary: !ready,
                onActivate: canAct && w.onRevalidationRequested != null
                    ? () => w.onRevalidationRequested!(request)
                    : null,
              ),
              const Text(
                'Bu düğme yalnız yeniden değerlendirme ister. Kendiliğinden devam izni vermez veya işi tamamlandı yapmaz.',
              ),
              if (changed)
                _ResumeAction(
                  label: 'Yeni rehbere eşleme yolunu aç',
                  onActivate: canAct && w.onRemapRequested != null
                      ? () => w.onRemapRequested!(request)
                      : null,
                ),
              if (!ready) ...[
                currentStepAction,
                const Text(
                  'Güncel rehber adımını açmak, doğrulanmış rehber ekranına geçiş isteğidir. Şu anda bu yol kapalı; eski adım tahmin edilerek devam edilmez.',
                ),
              ],
              _ResumeAction(
                label: 'Güvenli şekilde durdurma yolunu aç',
                onActivate: w.onSafeClosureRequested != null
                    ? () => w.onSafeClosureRequested!(request)
                    : null,
              ),
              const Text(
                'Güvenli durdurma bilgisi ücret gerektirmez. Bu yol işi tamamlandı veya güvenli diye kaydetmez.',
              ),
              if (w.onSafeClosureRequested == null ||
                  w.onRevalidationRequested == null)
                const Text(
                  'Bu seçenek şu anda kullanılamıyor; kontrol veya kapanış gerçekleşmiş sayılmaz.',
                ),
              if (history) ...[
                _ResumeAction(
                  label: detailsOpen
                      ? 'Önceki bağlamı kapat'
                      : 'Önceki bağlam ve kaynak ayrıntıları',
                  onActivate: () => setState(() => detailsOpen = !detailsOpen),
                ),
                if (detailsOpen) ...[
                  Text(
                    'Kayıtlı rehber: ${saved.scope.context.guideLabel} · ${saved.scope.guideVersion}',
                  ),
                  _HistorySection(
                    'Sökülen veya gevşetilen parçalar',
                    saved.removedParts,
                  ),
                  _HistorySection('Kaydedilmiş ölçümler', saved.measurements),
                  _HistorySection(
                    'Fotoğraf ve not referansları',
                    saved.photosAndNotes,
                  ),
                  _HistorySection('Önceki güvenlik notları', saved.safetyNotes),
                  _HistorySection(
                    'Önceki hazırlık notları',
                    saved.preparationNotes,
                  ),
                  const Text(
                    'Geçmiş notlar teknik uygulama talimatı veya güncel kanıt değildir. Eksik bilgi yok ya da tamam sayılmaz.',
                  ),
                  if (current)
                    for (final ref in [
                      a.physicalState,
                      a.fit,
                      a.readiness,
                      a.decision,
                    ])
                      if (ref != null &&
                          ref.interruptionId == w.interruptionId &&
                          ref.proof.scope.matches(w.scope))
                        Text(
                          'Değerlendirme kaynağı: ${ref.proof.source} · ${ref.proof.version} · ${ref.proof.location}\nSon kontrol: ${ref.proof.checkedAt} · ${ref.proof.current ? "güncel" : "güncel değil"}',
                        ),
                ],
              ],
            ].map(
              (child) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistorySection extends StatelessWidget {
  const _HistorySection(this.title, this.values);
  final String title;
  final List<String>? values;
  @override
  Widget build(BuildContext context) => Text(
    '$title: ${values == null
        ? "Bilinmiyor"
        : values!.isEmpty
        ? "Kayıtta yok; şu anki durumu doğrulamaz"
        : values!.join("; ")}',
  );
}

class _Status extends StatelessWidget {
  const _Status(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Semantics(
    liveRegion: true,
    child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
  );
}

class _ResumeAction extends StatefulWidget {
  const _ResumeAction({
    required this.label,
    required this.onActivate,
    this.primary = false,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  @override
  State<_ResumeAction> createState() => _ResumeActionState();
}

class _ResumeActionState extends State<_ResumeAction> {
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
          padding: EdgeInsets.all(widget.primary ? 12 : 0),
          decoration: BoxDecoration(
            color: widget.primary && widget.onActivate != null
                ? const Color(0xFF0E5BD8)
                : null,
            border: Border.all(
              color: focused
                  ? widget.primary && widget.onActivate != null
                        ? const Color(0xFFFFFFFF)
                        : const Color(0xFF0E5BD8)
                  : const Color(0xFF5E6E81),
              width: focused ? 3 : 0,
              style: focused ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.primary && widget.onActivate != null
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF172033),
              fontWeight: widget.primary ? FontWeight.w600 : FontWeight.normal,
              decoration: widget.primary ? null : TextDecoration.underline,
            ),
          ),
        ),
      ),
    ),
  );
}
