import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'active_execution.dart';
import 'resume_revalidation.dart' show InterruptedWorkSnapshot;

String _required(String value) {
  final text = value.trim();
  if (text.isEmpty) throw ArgumentError('Rehber değişimi bilgisi boş olamaz.');
  return text;
}

enum RemapReferenceState { unknown, held, confirmed }

enum GuideRemapPurpose { changeNotice, mapping }

enum GuideMappingState { unknown, held, mapped, unmappable }

/// Güncellik olumlu sonuç değildir. Sonucu gerçek sağlayıcı bildirir.
class RemapReference {
  RemapReference({
    required String changeId,
    required this.proof,
    required this.state,
  }) : changeId = _required(changeId);
  final String changeId;
  final ExecutionProof proof;
  final RemapReferenceState state;
  bool matches(ExecutionScope scope, String change, ExecutionProofKind kind) =>
      state == RemapReferenceState.confirmed &&
      changeId == change &&
      proof.matches(scope, kind, scope.executionId);
}

/// Eski ve yeni kapsamı bağlayan kaynak referansı; E1 imza doğrulayıcısı değildir.
class GuideRemapEvidence {
  GuideRemapEvidence({
    required this.fromScope,
    required this.scope,
    required String changeId,
    required this.purpose,
    required String subjectId,
    required String source,
    required String version,
    required String location,
    required String checkedAt,
    required this.current,
  }) : changeId = _required(changeId),
       subjectId = _required(subjectId),
       source = _required(source),
       version = _required(version),
       location = _required(location),
       checkedAt = _required(checkedAt);
  final ExecutionScope fromScope, scope;
  final String changeId, subjectId, source, version, location, checkedAt;
  final GuideRemapPurpose purpose;
  final bool current;
  bool matches(
    ExecutionScope old,
    ExecutionScope now,
    String change,
    GuideRemapPurpose kind,
    String subject,
  ) =>
      current &&
      fromScope.matches(old) &&
      scope.matches(now) &&
      changeId == change &&
      purpose == kind &&
      subjectId == subject;
}

/// Değişimin teknik içeriği, önem ve durma etkisi sağlayıcı girdisidir.
class GuideChangeNotice {
  GuideChangeNotice({
    required this.evidence,
    required List<String> changes,
    required String importance,
    required String safetyImpact,
    required String stopImpact,
  }) : changes = List.unmodifiable(changes.map(_required)),
       importance = _required(importance),
       safetyImpact = _required(safetyImpact),
       stopImpact = _required(stopImpact) {
    if (changes.isEmpty) throw ArgumentError('Değişim açıklaması gereklidir.');
  }
  final GuideRemapEvidence evidence;
  final List<String> changes;
  final String importance, safetyImpact, stopImpact;
}

/// Yeni adım yalnız sağlayıcının güncel eşleme sonucundan gelir; hesaplanmaz.
class GuideMappingResult {
  GuideMappingResult({
    required this.state,
    required this.evidence,
    required this.targetStepId,
    required this.targetStepLabel,
  }) {
    if (targetStepId != null) _required(targetStepId!);
    if (targetStepLabel != null) _required(targetStepLabel!);
  }
  final GuideMappingState state;
  final GuideRemapEvidence? evidence;
  final String? targetStepId, targetStepLabel;
  bool mapped(ExecutionScope old, ExecutionScope now, String change) =>
      state == GuideMappingState.mapped &&
      targetStepId != null &&
      targetStepLabel != null &&
      (evidence?.matches(
            old,
            now,
            change,
            GuideRemapPurpose.mapping,
            targetStepId!,
          ) ??
          false);
  bool unmappable(ExecutionScope old, ExecutionScope now, String change) =>
      state == GuideMappingState.unmappable &&
      (evidence?.matches(
            old,
            now,
            change,
            GuideRemapPurpose.mapping,
            now.executionId,
          ) ??
          false);
}

class GuideRemapSafetyCheck {
  GuideRemapSafetyCheck({required String changeId, required this.check})
    : changeId = _required(changeId);
  final String changeId;
  final ExecutionSafetyCheck check;
  bool matches(ExecutionScope scope, String change) =>
      changeId == change && check.matches(scope);
}

/// Gerçek karar ve zorunlu kontrol sınıflaması E1 dışında üretilir.
class GuideRemapAssessment {
  GuideRemapAssessment({
    required this.fromScope,
    required this.scope,
    required String changeId,
    required String reason,
    required this.physicalState,
    required this.fit,
    required this.readiness,
    required this.decision,
    required this.mapping,
    required List<GuideRemapSafetyCheck> checks,
  }) : changeId = _required(changeId),
       reason = _required(reason),
       checks = List.unmodifiable(checks) {
    if (checks.map((c) => c.check.id).toSet().length != checks.length) {
      throw ArgumentError('Zorunlu kontrollerin kimlikleri ayrı olmalıdır.');
    }
  }
  final ExecutionScope fromScope, scope;
  final String changeId, reason;
  final RemapReference? physicalState, fit, readiness, decision;
  final GuideMappingResult? mapping;
  final List<GuideRemapSafetyCheck> checks;
}

/// Yalnız yol isteği; eşleme, fiziksel işlem veya tamamlanma üretmez.
class GuideRemapRequest {
  GuideRemapRequest({
    required this.scope,
    required String changeId,
    this.checkId,
    this.targetStepId,
  }) : changeId = _required(changeId);
  final ExecutionScope scope;
  final String changeId;
  final String? checkId, targetStepId;
}

enum GuideRemapRequestKind {
  observation('Fotoğraf veya not yolunu açma'),
  mapping('Yeniden eşleme'),
  check('Zorunlu kontrol'),
  currentStep('Doğrulanmış adımı açma'),
  safeClosure('Güvenli durdurma bilgisini açma');

  const GuideRemapRequestKind(this.label);
  final String label;
}

/// İsteğe ait hata; olumlu kaynak sonucunu iptal etmez, fiziksel sonuç üretmez.
class GuideRemapRequestError {
  GuideRemapRequestError({
    required this.scope,
    required String changeId,
    required this.kind,
    required String message,
  }) : changeId = _required(changeId),
       message = _required(message);
  final ExecutionScope scope;
  final String changeId, message;
  final GuideRemapRequestKind kind;
  bool matches(ExecutionScope current, String change) =>
      scope.matches(current) && changeId == change;
}

class GuideChangeRemapView extends StatefulWidget {
  GuideChangeRemapView({
    super.key,
    this.brand,
    required this.scope,
    required String changeId,
    required this.saved,
    required this.notice,
    required this.assessment,
    required this.busy,
    required this.error,
    required this.onObservationRequested,
    required this.onMappingRequested,
    required this.onCheckRequested,
    required this.onCurrentStepRequested,
    required this.onSafeClosureRequested,
  }) : changeId = _required(changeId);
  final Widget? brand;
  final ExecutionScope scope;
  final String changeId;
  final InterruptedWorkSnapshot? saved;
  final GuideChangeNotice? notice;
  final GuideRemapAssessment? assessment;
  final bool busy;
  final GuideRemapRequestError? error;
  final ValueChanged<GuideRemapRequest>? onObservationRequested;
  final ValueChanged<GuideRemapRequest>? onMappingRequested, onCheckRequested;
  final ValueChanged<GuideRemapRequest>? onCurrentStepRequested;
  final ValueChanged<GuideRemapRequest>? onSafeClosureRequested;
  @override
  State<GuideChangeRemapView> createState() => _RemapState();
}

class _RemapState extends State<GuideChangeRemapView> {
  bool detailsOpen = false;
  @override
  void didUpdateWidget(GuideChangeRemapView old) {
    super.didUpdateWidget(old);
    if (!old.scope.matches(widget.scope) ||
        old.changeId != widget.changeId ||
        old.saved != widget.saved ||
        old.notice != widget.notice) {
      detailsOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = widget, saved = widget.saved, notice = widget.notice;
    final history = saved != null && saved.belongsTo(w.scope);
    final changed =
        history &&
        (saved.scope.context.guideId != w.scope.context.guideId ||
            saved.scope.guideVersion != w.scope.guideVersion);
    final noticeCurrent =
        changed &&
        notice != null &&
        notice.evidence.matches(
          saved.scope,
          w.scope,
          w.changeId,
          GuideRemapPurpose.changeNotice,
          w.changeId,
        );
    final a = w.assessment;
    final current =
        noticeCurrent &&
        a != null &&
        a.scope.matches(w.scope) &&
        a.fromScope.matches(saved.scope) &&
        a.changeId == w.changeId;
    bool ref(RemapReference? value, ExecutionProofKind kind) =>
        value?.matches(w.scope, w.changeId, kind) ?? false;
    final physical =
        current && ref(a.physicalState, ExecutionProofKind.content);
    final fit = current && ref(a.fit, ExecutionProofKind.fit);
    final prepared = current && ref(a.readiness, ExecutionProofKind.readiness);
    final decision = current && ref(a.decision, ExecutionProofKind.decision);
    final mapped =
        current &&
        (a.mapping?.mapped(saved.scope, w.scope, w.changeId) ?? false);
    final unmappable =
        current &&
        (a.mapping?.unmappable(saved.scope, w.scope, w.changeId) ?? false);
    final ready =
        mapped &&
        physical &&
        fit &&
        prepared &&
        decision &&
        a.checks.isNotEmpty &&
        a.checks.every((c) => c.matches(w.scope, w.changeId));
    final canAct = !w.busy;
    final hasError = w.error != null;
    final errorCurrent = w.error?.matches(w.scope, w.changeId) ?? false;
    final canOpen =
        ready && canAct && !hasError && w.onCurrentStepRequested != null;
    final request = GuideRemapRequest(scope: w.scope, changeId: w.changeId);
    final stepAction = _RemapAction(
      key: const ValueKey('current-step'),
      label: 'Yeni rehberdeki doğrulanmış adımı aç',
      primary: ready && !hasError,
      onActivate: canOpen
          ? () => w.onCurrentStepRequested!(
              GuideRemapRequest(
                scope: w.scope,
                changeId: w.changeId,
                targetStepId: a.mapping!.targetStepId,
              ),
            )
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
                hasError
                    ? 'Son isteğin sonucu doğrulanamadı'
                    : ready
                    ? 'Yeni rehberle eşleme doğrulandı'
                    : unmappable
                    ? 'Mevcut durum yeni rehbere eşlenemedi'
                    : 'Rehber değişti: devam etmeden önce eşle',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'Eski devam onayı yeni rehberde geçerli değildir. Kaydedilmiş adımdan devam edilmez; güncel fiziksel durum önce yeni rehberle eşlenmelidir.',
              ),
              if (noticeCurrent) ...[
                Text(
                  'Ne değişti?',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                for (final change in notice.changes) Text(change),
                Text('Neden önemli? ${notice.importance}'),
                _Status('Güvenlik etkisi: ${notice.safetyImpact}'),
                _Status('Durma etkisi: ${notice.stopImpact}'),
              ] else
                const _Status(
                  'Güncel rehber değişimi ve etkisi henüz doğrulanmadı. Eski devam yolu kapalı; güncel değişim ve fiziksel durum yeniden kontrol edilmelidir.',
                ),
              if (history) ...[
                Text(
                  'Son kesin adım: ${saved.lastDefiniteStep ?? "Bilinmiyor"}',
                ),
                Text(
                  'Kayıtlı eski adım: ${saved.savedCurrentStep ?? "Bilinmiyor"}',
                ),
                Text('Geçmiş kayıt zamanı: ${saved.savedAt}'),
                const Text(
                  'Eski adım, sökülen parçalar ve notlar nerede kaldığını hatırlamak için korunur. Bunlar güncel fiziksel kanıt, yeni adım veya devam izni değildir.',
                ),
              ] else
                const _Status(
                  'Bu motosiklet ve çalışma için geçmiş bağlam bilinmiyor. Eksik ilerleme tamamlanmış sayılmaz; eski veya yeni adım tahmin edilmez.',
                ),
              Text(
                ready && hasError
                    ? 'Kaynağın güncel değerlendirmesi'
                    : ready
                    ? 'Bu değişim için güncel sonuç'
                    : 'Devamdan önce gereken güncel sonuç',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Mevcut fiziksel durum: ${physical ? "Bu değişim için olumlu olarak doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
              ),
              Text(
                'Yeni rehbere eşleme: ${mapped
                    ? "Güncel kaynakla doğrulandı"
                    : unmappable
                    ? "Güncel kaynak bu durumu eşleyemedi"
                    : "Henüz doğrulanmadı"}',
              ),
              Text(
                'Motosiklete uygunluk: ${fit ? "Bu değişim için olumlu olarak doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
              ),
              Text(
                'Hazırlık koşulları: ${prepared ? "Bu değişim için olumlu olarak doğrulandı" : "Henüz olumlu olarak doğrulanmadı"}',
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
                    item.matches(w.scope, w.changeId)
                        ? 'Bu değişim için doğrulandı ve açıkça gözden geçirildi.'
                        : 'Henüz doğrulanmadı. Eski onay veya fotoğraf/not tek başına yeterli değildir.',
                  ),
                  if (!item.matches(w.scope, w.changeId))
                    _RemapAction(
                      key: ValueKey('check:${item.check.id}'),
                      label: 'Bu kontrolü yeniden iste',
                      onActivate: canAct && w.onCheckRequested != null
                          ? () => w.onCheckRequested!(
                              GuideRemapRequest(
                                scope: w.scope,
                                changeId: w.changeId,
                                checkId: item.check.id,
                              ),
                            )
                          : null,
                    ),
                ]
              else
                const _Status(
                  'Güncel zorunlu kontrol listesi henüz doğrulanmadı. Boş liste bütün koşullar tamam demek değildir.',
                ),
              if (current && !ready) _Status('Neden kapalı? ${a.reason}'),
              _Status(
                ready && hasError
                    ? 'Görünen olumlu sonuçlar kaynağın güncel değerlendirmesidir. Son isteğin sonucu doğrulanamadığı için normal devam şu anda kapalı.'
                    : ready
                    ? 'Güncel fiziksel durum, eşleme, uygunluk, hazırlık ve zorunlu kontroller doğrulandı. Kaynak kararı yeni rehberdeki adım yoluna izin veriyor; başarı garantisi değildir.'
                    : 'Güncel eşleme ve gerekli kontroller doğrulanana kadar normal devam kapalı.',
              ),
              if (ready)
                Text(
                  'Kaynakta eşlenen yeni adım: ${a.mapping!.targetStepLabel}',
                ),
              const Text(
                'Ekran bir sonraki adımı tahmin etmez, eski işi otomatik tersine çevirmez veya sökülen parçaları geri takma talimatı üretmez.',
              ),
              if (w.busy)
                const _Status(
                  'İstek işleniyor. Yeni gözlem, eşleme veya devam isteği kapalı.',
                ),
              if (hasError)
                _Status(
                  errorCurrent
                      ? '${w.error!.kind.label} isteğinin sonucu doğrulanamadı: ${w.error!.message}. Yeni bir eşleme veya fiziksel işlem sonucu bu hatadan çıkarılamaz. Hata, görüntülenen kaynak değerlendirmesinin iptal edildiği anlamına gelmez.'
                      : 'Hata bilgisi bu motosiklet, çalışma ve rehber değişimine ait değil; eski veya yabancı hata ayrıntısı gösterilmez. Normal devam kapalı; güncel istek sonucunu yeniden kontrol et.',
                ),
              _RemapAction(
                key: const ValueKey('observation'),
                label: 'Güncel fotoğraf veya not ekleme yolunu aç',
                onActivate: canAct && w.onObservationRequested != null
                    ? () => w.onObservationRequested!(request)
                    : null,
              ),
              const Text(
                'Önce motosikletin güncel fiziksel durumu ele alınmalı. Fotoğraf veya not eklemek tek başına eşlemeyi veya kritik kontrolü doğrulamaz.',
              ),
              if (ready && !hasError) ...[
                stepAction,
                const Text(
                  'Bu yol yalnız kaynağın eşlediği yeni rehber adımı ekranına geçiş ister. Adımı otomatik uygulamaz veya işi tamamlandı yapmaz.',
                ),
              ],
              _RemapAction(
                key: const ValueKey('mapping'),
                label: 'Mevcut durumu yeniden eşle',
                primary: (!ready || hasError) && !unmappable,
                onActivate: canAct && w.onMappingRequested != null
                    ? () => w.onMappingRequested!(request)
                    : null,
              ),
              const Text(
                'Bu düğme yalnız güncel durumun yeni rehberle eşlenmesini ister. İstek tek başına eşleme sonucu, devam izni veya tamamlanma değildir.',
              ),
              if (!ready || hasError) ...[
                stepAction,
                const Text(
                  'Yeni rehber adımına geçiş şu anda kapalı; kayıtlı eski adım veya tahmini yeni adım kullanılmaz.',
                ),
              ],
              if (ready && !canOpen && !hasError)
                const _Status(
                  'Adım ekranına geçiş şu anda kullanılamıyor. Olumlu kaynak sonucu fiziksel uygulama veya tamamlanma değildir.',
                ),
              _RemapAction(
                key: const ValueKey('safe-closure'),
                label: 'Güvenli şekilde durdurma yolunu aç',
                primary: unmappable,
                onActivate: w.onSafeClosureRequested != null
                    ? () => w.onSafeClosureRequested!(request)
                    : null,
              ),
              const Text(
                'Eşleme yapılamasa da güvenli durdurma bilgisi ücret veya devam onayı gerektirmez. Bu yol işi güvenli durduruldu veya tamamlandı diye kaydetmez.',
              ),
              if (w.onMappingRequested == null ||
                  w.onSafeClosureRequested == null)
                const Text(
                  'İlgili yol şu anda kullanılamıyor; eşleme veya kapanış gerçekleşmiş sayılmaz.',
                ),
              if (history) ...[
                _RemapAction(
                  key: const ValueKey('details'),
                  label: detailsOpen
                      ? 'Önceki bağlamı kapat'
                      : 'Önceki bağlam ve kaynak ayrıntıları',
                  onActivate: () => setState(() => detailsOpen = !detailsOpen),
                ),
                if (detailsOpen) ...[
                  Text(
                    'Eski rehber: ${saved.scope.context.guideLabel} · ${saved.scope.guideVersion}',
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
                    'Geçmiş notlar güncel kanıt veya teknik uygulama talimatı değildir. Eksik bilgi yok ya da tamam sayılmaz.',
                  ),
                  if (noticeCurrent)
                    Text(
                      'Değişim kaynağı: ${notice.evidence.source} · ${notice.evidence.version} · ${notice.evidence.location}\nSon kontrol: ${notice.evidence.checkedAt} · güncel',
                    ),
                  if (mapped || unmappable)
                    Text(
                      'Eşleme kaynağı: ${a.mapping!.evidence!.source} · ${a.mapping!.evidence!.version} · ${a.mapping!.evidence!.location}\nSon kontrol: ${a.mapping!.evidence!.checkedAt} · güncel',
                    ),
                ],
              ],
            ].map(
              (child) => Padding(
                key: child is _RemapAction ? child.key : null,
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

class _RemapAction extends StatefulWidget {
  const _RemapAction({
    super.key,
    required this.label,
    required this.onActivate,
    this.primary = false,
  });
  final String label;
  final VoidCallback? onActivate;
  final bool primary;
  @override
  State<_RemapAction> createState() => _RemapActionState();
}

class _RemapActionState extends State<_RemapAction> {
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
