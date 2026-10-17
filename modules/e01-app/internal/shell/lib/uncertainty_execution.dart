import 'package:flutter/widgets.dart';

import 'offline_safety_status.dart';
import 'active_execution.dart';
import 'condensed_execution.dart';

/// E1 consumes only E4's public negative status. It never grants offline authority.
class UncertaintyExecutionView extends StatefulWidget {
  const UncertaintyExecutionView({
    super.key,
    required this.full,
    required this.condensed,
    required this.offlineStatus,
  });

  final ActiveStepView full;
  final CondensedInstruction? condensed;
  final Object? offlineStatus;

  @override
  State<UncertaintyExecutionView> createState() => _UncertaintyExecutionState();
}

class _UncertaintyExecutionState extends State<UncertaintyExecutionView> {
  OfflineSafetyStatus? status;
  ActiveStepPresentation? heldStep;

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void didUpdateWidget(UncertaintyExecutionView old) {
    super.didUpdateWidget(old);
    final next = OfflineSafetyStatus.tryDecode(widget.offlineStatus);
    final same = status == null
        ? next == null
        : next != null && status!.sameValue(next);
    if (!same ||
        !identical(old.full.step, widget.full.step) ||
        !old.full.scope.matches(widget.full.scope))
      _bind();
  }

  Map<String, String> get expected => {
    'motorcycleId': widget.full.scope.context.motorcycleId,
    'guideId': widget.full.scope.context.guideId,
    'contextRevision': widget.full.scope.context.contextRevision,
    'executionId': widget.full.scope.executionId,
    'guideVersion': widget.full.scope.guideVersion,
    'revision': widget.full.scope.revision,
    'physicalRevision': widget.full.scope.physicalRevision,
    'stepId': widget.full.step?.stepId ?? '',
  };

  String get reason {
    if (status == null) return 'Çevrimdışı güvenlik durumu okunamadı.';
    if (!status!.matches(expected)) {
      return 'Bu güvenlik durumu seçili motosiklet ve adıma ait değil.';
    }
    switch (status!.reason) {
      case 'BLOCKED_CACHED_NEGATIVE_RESTRICTION':
      case 'BLOCKED_CACHED_NEGATIVE_GENERATION':
        return 'Önceki güvenlik kısıtlaması yeniden doğrulanmadan kalkmaz.';
      case 'HELD_CACHED_CONTEXT_MISMATCH':
        return 'Çevrimdışı paket seçili motosiklet ve göreve uymuyor.';
      case 'HELD_UNTRUSTED_OFFLINE_CONTEXT':
        return 'Çevrimdışı paketin güncel ve tutarlı olduğu doğrulanmadı.';
      case 'HELD_UNCLASSIFIED_RISK':
      case 'HELD_UNCERTAIN_RISK_DEPENDENCY':
        return 'Gerekli güncel güvenlik bilgisi doğrulanmadı.';
      default:
        return 'Çevrimdışı güvenlik doğrulanmadı.';
    }
  }

  void _bind() {
    status = OfflineSafetyStatus.tryDecode(widget.offlineStatus);
    final s = widget.full.step;
    if (s == null) {
      heldStep = null;
      return;
    }
    final original = s.state == ExecutionDisplayState.active
        ? ''
        : s.holdReason.trim();
    heldStep = ActiveStepPresentation(
      scope: s.scope,
      stepId: s.stepId,
      title: s.title,
      instruction: s.instruction,
      detail: s.detail,
      stepNumber: s.stepNumber,
      stepCount: s.stepCount,
      state: s.state == ExecutionDisplayState.active
          ? ExecutionDisplayState.held
          : s.state,
      holdReason: [
        if (original.isNotEmpty) original,
        reason,
        'İndirme, bağlantının gelmesi veya anlatımı değiştirmek izin değildir. '
            'Güvenli durdurma yoluna erişim güvenli sonuç kaydı değildir.',
      ].join(' '),
      decision: s.decision,
      fit: s.fit,
      readiness: s.readiness,
      contentProof: s.contentProof,
      visual: s.visual,
      safetyChecks: s.safetyChecks,
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = widget.full;
    final held = ActiveStepView(
      key: w.key,
      brand: w.brand,
      scope: w.scope,
      step: heldStep,
      busy: w.busy,
      errorMessage: w.errorMessage,
      onStepReported: w.onStepReported,
      onProblemRequested: w.onProblemRequested,
      onCheckRequested: w.onCheckRequested,
      onRecheckRequested: w.onRecheckRequested,
      onSafeClosureRequested: w.onSafeClosureRequested,
      onTeachingRequested: w.onTeachingRequested,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          key: const ValueKey('uncertainty-band'),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Semantics(
            liveRegion: true,
            child: const Text(
              'Güvenlik belirsizliği var. İlerleme kapalı.',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Expanded(
          child: CondensedExecutionView(
            full: held,
            condensed: widget.condensed,
          ),
        ),
      ],
    );
  }
}
