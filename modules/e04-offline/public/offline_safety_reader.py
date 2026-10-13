"""Public negative-only E4 safety status boundary; never an authority or permit.

The reader is supplied by the E4 host, not E1. Existing production_gate remains
HELD; absent or failed readers cannot reopen progression. Context is the caller's
display binding, not proof of canonical identity, risk or package verification.
"""
CONTEXT_KEYS = ("motorcycleId", "guideId", "contextRevision", "executionId",
                "guideVersion", "revision", "physicalRevision", "stepId")
SCHEMA = "kavriva.e4.safety-status.v1"
REASONS = frozenset({
    "HELD_CURRENT_E3_COMMIT_AUTHORIZATION_REQUIRED", "HELD_INTERNAL_OPS_ONLINE_ONLY",
    "HELD_CACHED_CONTEXT_MISMATCH", "BLOCKED_CACHED_NEGATIVE_RESTRICTION",
    "BLOCKED_CACHED_NEGATIVE_GENERATION", "HELD_UNTRUSTED_OFFLINE_CONTEXT",
    "HELD_UNCLASSIFIED_RISK", "HELD_UNCERTAIN_RISK_DEPENDENCY",
    "HELD_CANONICAL_TAXONOMY_WINDOWS_ELIGIBILITY_RECOVERY_AND_ENCRYPTED_RUNTIME_MISSING",
    "HELD_OFFLINE_SAFETY_READER_UNAVAILABLE", "HELD_OFFLINE_SAFETY_READER_FAILED",
    "HELD_INVALID_OFFLINE_SAFETY_RESPONSE",
})
RETAINED = ("TEACHING_HISTORY", "SAFE_STOP_RECOVERY")


def read_safety_status(context, reader=None):
    """Expose only a reason to hold; input declarations cannot grant authority."""
    if (type(context) is not dict or set(context) != set(CONTEXT_KEYS)
            or any(type(v) is not str or not v or v.strip() != v for v in context.values())):
        raise ValueError("INVALID_DISPLAY_CONTEXT")
    bound = {k: context[k] for k in CONTEXT_KEYS}

    def held(reason):
        return {"schema": SCHEMA, "context": bound.copy(), "authority": "NONE",
                "physicalProgression": False, "reason": reason,
                "retainedContexts": list(RETAINED)}

    if reader is None:
        return held("HELD_OFFLINE_SAFETY_READER_UNAVAILABLE")
    if not callable(reader):
        return held("HELD_INVALID_OFFLINE_SAFETY_RESPONSE")
    try:
        decision = reader(bound.copy())
        if (type(decision.reason) is not str or decision.reason not in REASONS
                or type(decision.authority) is not str or decision.authority != "NONE"
                or decision.physical_progression is not False
                or type(decision.retained_contexts) is not tuple
                or decision.retained_contexts != RETAINED):
            return held("HELD_INVALID_OFFLINE_SAFETY_RESPONSE")
        return held(decision.reason)
    except Exception:
        return held("HELD_OFFLINE_SAFETY_READER_FAILED")
