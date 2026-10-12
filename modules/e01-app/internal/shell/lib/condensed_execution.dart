import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'active_execution.dart';

/// Sağlayıcının aynı adım için sunduğu metin; E1 teknik özet üretmez.
class CondensedInstruction {
  CondensedInstruction({
    required this.scope,
    required this.stepId,
    required String instruction,
    required this.proof,
  }) : instruction = instruction.trim() {
    if (stepId.trim().isEmpty || this.instruction.isEmpty) {
      throw ArgumentError('Kısa anlatımın adımı ve metni boş olamaz.');
    }
  }

  final ExecutionScope scope;
  final String stepId, instruction;
  final ExecutionProof? proof;

  bool matches(ExecutionScope expected, ActiveStepPresentation? step) =>
      step != null &&
      step.scope.matches(expected) &&
      scope.matches(expected) &&
      stepId == step.stepId &&
      instruction != step.instruction &&
      instruction.runes.length < step.instruction.runes.length &&
      (proof?.matches(expected, ExecutionProofKind.content, stepId) ?? false);
}

/// Aynı fiziksel adımı sunar; seçim yeni yetki veya ilerleme üretmez.
class CondensedExecutionView extends StatefulWidget {
  const CondensedExecutionView({
    super.key,
    required this.full,
    required this.condensed,
  });

  final ActiveStepView full;
  final CondensedInstruction? condensed;

  @override
  State<CondensedExecutionView> createState() => _CondensedExecutionState();
}

class _CondensedExecutionState extends State<CondensedExecutionView> {
  bool requested = false;

  @override
  void didUpdateWidget(CondensedExecutionView old) {
    super.didUpdateWidget(old);
    if (!old.full.scope.matches(widget.full.scope) ||
        old.full.step?.stepId != widget.full.step?.stepId ||
        !identical(old.full.step, widget.full.step) ||
        !identical(old.condensed, widget.condensed)) {
      requested = false;
    }
  }

  ActiveStepView _shortView() {
    final w = widget.full;
    final s = w.step!;
    // Aynı kanıt, görsel ve güvenlik nesneleri korunur. Guardlar ActiveStepView'a
    // aittir; kısa kaynak bir guardın yerine geçmez.
    final step = ActiveStepPresentation(
      scope: s.scope,
      stepId: s.stepId,
      title: s.title,
      instruction: widget.condensed!.instruction,
      detail: s.detail,
      stepNumber: s.stepNumber,
      stepCount: s.stepCount,
      state: s.state,
      holdReason: s.holdReason,
      decision: s.decision,
      fit: s.fit,
      readiness: s.readiness,
      contentProof: s.contentProof,
      visual: s.visual,
      safetyChecks: s.safetyChecks,
    );
    return ActiveStepView(
      key: w.key,
      brand: w.brand,
      scope: w.scope,
      step: step,
      busy: w.busy,
      errorMessage: w.errorMessage,
      onStepReported: w.onStepReported,
      onProblemRequested: w.onProblemRequested,
      onCheckRequested: w.onCheckRequested,
      onRecheckRequested: w.onRecheckRequested,
      onSafeClosureRequested: w.onSafeClosureRequested,
      onTeachingRequested: w.onTeachingRequested,
    );
  }

  @override
  Widget build(BuildContext context) {
    final available =
        widget.condensed?.matches(widget.full.scope, widget.full.step) ?? false;
    final short = requested && available;
    return SingleChildScrollView(
      key: const ValueKey('condensed-scroll'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Semantics(
                    liveRegion: true,
                    child: Text(short ? 'Kısa anlatım' : 'Tam anlatım'),
                  ),
                ),
                Flexible(
                  child: _ModeAction(
                    label: short ? 'Tam anlatıma dön' : 'Kısa anlatımı aç',
                    onActivate: short || available
                        ? () => setState(() => requested = !short)
                        : null,
                  ),
                ),
              ],
            ),
          ),
          short ? _shortView() : widget.full,
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Anlatım kısalır; zorunlu bakım adımları atlanmaz. '
                  'Güvenlik koşulları ve durma uyarıları korunur. '
                  'Motosiklet, rehber, adım ya da güncel durum değişirse '
                  'yeniden tam anlatımdan başlanır.',
                ),
                const SizedBox(height: 8),
                Semantics(
                  liveRegion: true,
                  child: const Text(
                    'Sürüşe güvenli olduğu bu ekranla doğrulanmaz. Belirsizlik '
                    'varsa normal ilerleme açılmaz. Kısa anlatım hız veya başarı '
                    'garantisi vermez.',
                  ),
                ),
                const SizedBox(height: 8),
                if (!available)
                  const Text(
                    'Bu adım için güncel kısa anlatım kullanılamıyor. Eski veya '
                    'başka motosiklete ait metin gösterilmez; tam anlatımın '
                    'mevcut güvenlik kontrolleri korunur.',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Mevcut aktif-adım ikincil eyleminin odak/klavye/52px yaklaşımı.
class _ModeAction extends StatefulWidget {
  const _ModeAction({required this.label, required this.onActivate});
  final String label;
  final VoidCallback? onActivate;

  @override
  State<_ModeAction> createState() => _ModeActionState();
}

class _ModeActionState extends State<_ModeAction> {
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF0E5BD8),
              width: focused ? 3 : 0,
              style: focused ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ),
    ),
  );
}
