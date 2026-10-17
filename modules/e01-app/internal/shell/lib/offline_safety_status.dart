/// Public E4 wire consumption. A structural declaration is never authority.
class OfflineSafetyStatus {
  OfflineSafetyStatus._(this.context, this.reason);

  static const schema = 'kavriva.e4.safety-status.v1';
  static const contextKeys = {
    'motorcycleId',
    'guideId',
    'contextRevision',
    'executionId',
    'guideVersion',
    'revision',
    'physicalRevision',
    'stepId',
  };
  static const reasons = {
    'HELD_CURRENT_E3_COMMIT_AUTHORIZATION_REQUIRED',
    'HELD_INTERNAL_OPS_ONLINE_ONLY',
    'HELD_CACHED_CONTEXT_MISMATCH',
    'BLOCKED_CACHED_NEGATIVE_RESTRICTION',
    'BLOCKED_CACHED_NEGATIVE_GENERATION',
    'HELD_UNTRUSTED_OFFLINE_CONTEXT',
    'HELD_UNCLASSIFIED_RISK',
    'HELD_UNCERTAIN_RISK_DEPENDENCY',
    'HELD_CANONICAL_TAXONOMY_WINDOWS_ELIGIBILITY_RECOVERY_AND_ENCRYPTED_RUNTIME_MISSING',
    'HELD_OFFLINE_SAFETY_READER_UNAVAILABLE',
    'HELD_OFFLINE_SAFETY_READER_FAILED',
    'HELD_INVALID_OFFLINE_SAFETY_RESPONSE',
  };

  final Map<String, String> context;
  final String reason;
  bool get permitsPhysicalProgression => false;
  String get authority => 'NONE';

  static OfflineSafetyStatus? tryDecode(Object? wire) {
    try {
      return _decode(wire);
    } catch (_) {
      return null;
    }
  }

  static OfflineSafetyStatus? _decode(Object? wire) {
    const keys = {
      'schema',
      'context',
      'authority',
      'physicalProgression',
      'reason',
      'retainedContexts',
    };
    if (wire is! Map ||
        wire.length != keys.length ||
        !keys.every(wire.containsKey) ||
        wire['schema'] != schema ||
        wire['authority'] != 'NONE' ||
        wire['physicalProgression'] != false ||
        wire['physicalProgression'] is! bool ||
        wire['reason'] is! String ||
        !reasons.contains(wire['reason'])) {
      return null;
    }
    final retained = wire['retainedContexts'];
    if (retained is! List ||
        retained.length != 2 ||
        retained[0] != 'TEACHING_HISTORY' ||
        retained[1] != 'SAFE_STOP_RECOVERY') {
      return null;
    }
    final rawContext = wire['context'];
    if (rawContext is! Map ||
        rawContext.length != contextKeys.length ||
        !contextKeys.every(rawContext.containsKey))
      return null;
    final bound = <String, String>{};
    for (final key in contextKeys) {
      final value = rawContext[key];
      if (value is! String || value.isEmpty || value.trim() != value)
        return null;
      bound[key] = value;
    }
    return OfflineSafetyStatus._(
      Map.unmodifiable(bound),
      wire['reason'] as String,
    );
  }

  bool matches(Map<String, String> expected) =>
      expected.length == contextKeys.length &&
      contextKeys.every((key) => context[key] == expected[key]);

  bool sameValue(OfflineSafetyStatus other) =>
      reason == other.reason && matches(other.context);
}
