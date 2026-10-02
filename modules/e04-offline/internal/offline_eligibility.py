"""Negative-only offline eligibility rules; declarations are never authority.

The supplied consequence ordering is a model, not an approved risk taxonomy or
validity window. Canonical eligibility and durable encrypted enforcement are held.
"""
from dataclasses import dataclass

from core_composition import Scope, InvalidComposition, _id, _scope, _digest
from full_package_fallback import _target


DEPENDENCY_STATES = frozenset({"CURRENT", "STALE", "DISPUTED", "MISSING", "UNKNOWN"})
NEGATIVE_FLAGS = frozenset({"RECALL", "SUSPENSION", "REVOCATION", "DELETION"})
ANOMALIES = frozenset({"RESTORED_BACKUP", "CLOCK_ANOMALY", "INCOMPATIBLE_CLIENT", "MIXED_PACKAGE"})


@dataclass(frozen=True)
class ConsequenceOrder:
    labels: tuple[str, ...]


@dataclass(frozen=True)
class RiskDependency:
    object_id: str
    consequence: str | None
    state: str


@dataclass(frozen=True)
class RiskResult:
    inherited_consequence: str | None
    reason: str

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class CachedEnforcement:
    scope: Scope
    manifest_digest: str
    negative_generation: int
    negative_flags: tuple[str, ...]

    @property
    def authority(self): return "NONE"


@dataclass(frozen=True)
class EligibilityDecision:
    reason: str
    inherited_consequence: str | None

    @property
    def authority(self): return "NONE"

    @property
    def physical_progression(self): return False

    @property
    def retained_contexts(self):
        # Normative preservation only; no renderer or recovery instructions.
        return ("TEACHING_HISTORY", "SAFE_STOP_RECOVERY")


def _tokens(values, allowed, reason):
    if (type(values) is not tuple or any(type(v) is not str or v not in allowed for v in values)
            or len(set(values)) != len(values)):
        raise InvalidComposition(reason)


def assess_risk(order, dependencies):
    if (type(order) is not ConsequenceOrder or type(order.labels) is not tuple
            or not order.labels or not all(_id(label) for label in order.labels)
            or len(set(order.labels)) != len(order.labels)):
        raise InvalidComposition("INVALID_CONSEQUENCE_ORDER")
    if type(dependencies) is not tuple:
        raise InvalidComposition("MUTABLE_RISK_DEPENDENCIES")
    seen, ranks, unknown, uncertain = set(), [], not dependencies, False
    for item in dependencies:
        if (type(item) is not RiskDependency or not _id(item.object_id)
                or type(item.state) is not str or item.state not in DEPENDENCY_STATES
                or (item.consequence is not None and not _id(item.consequence))):
            raise InvalidComposition("INVALID_RISK_DEPENDENCY")
        if item.object_id in seen:
            raise InvalidComposition("DUPLICATE_RISK_DEPENDENCY")
        seen.add(item.object_id)
        if item.consequence in order.labels:
            ranks.append(order.labels.index(item.consequence))
        else:
            unknown = True
        uncertain = uncertain or item.state != "CURRENT"
    inherited = order.labels[max(ranks)] if ranks else None
    reason = ("HELD_UNCLASSIFIED_RISK" if unknown else
              "HELD_UNCERTAIN_RISK_DEPENDENCY" if uncertain else
              "DECLARED_CONSEQUENCE_ONLY")
    return RiskResult(inherited, reason)


def _cached(value):
    if type(value) is not CachedEnforcement:
        raise InvalidComposition("INVALID_CACHED_ENFORCEMENT")
    _scope(value.scope)
    if (not _digest(value.manifest_digest) or type(value.negative_generation) is not int
            or value.negative_generation < 0):
        raise InvalidComposition("INVALID_CACHED_FENCE")
    _tokens(value.negative_flags, NEGATIVE_FLAGS, "INVALID_CACHED_NEGATIVE_FLAGS")


def merge_cached_enforcement(previous, observed):
    """Return a monotonic negative model, not persist or authenticate a cache."""
    _cached(previous)
    _cached(observed)
    old, new = previous.scope, observed.scope
    if (old.motorcycle_id, old.task_id) != (new.motorcycle_id, new.task_id):
        raise InvalidComposition("CACHED_SELECTED_SCOPE_MISMATCH")
    if new.generation < old.generation:
        raise InvalidComposition("STALE_CACHED_CONTEXT")
    if (new.generation == old.generation
            and (new.release_id != old.release_id or observed.manifest_digest != previous.manifest_digest)):
        raise InvalidComposition("CONFLICTING_CACHED_CONTEXT")
    return CachedEnforcement(new, observed.manifest_digest,
                             max(previous.negative_generation, observed.negative_generation),
                             tuple(sorted(set(previous.negative_flags) | set(observed.negative_flags))))


def evaluate_gate(target, cached, order, dependencies, *, kind="PHYSICAL_APPLICATION",
                  connected=False, anomalies=()):
    """Enforce negatives; coherent flags still cannot reopen actual progression."""
    _target(target)
    _cached(cached)
    risk = assess_risk(order, dependencies)
    if type(kind) is not str or kind not in {"PHYSICAL_APPLICATION", "INTERNAL_OPS_MUTATION"}:
        raise InvalidComposition("INVALID_ELIGIBILITY_KIND")
    if type(connected) is not bool:
        raise InvalidComposition("INVALID_CONNECTIVITY_DECLARATION")
    _tokens(anomalies, ANOMALIES, "INVALID_ELIGIBILITY_ANOMALIES")
    decision = lambda reason: EligibilityDecision(reason, risk.inherited_consequence)
    if kind == "INTERNAL_OPS_MUTATION":
        return decision("HELD_CURRENT_E3_COMMIT_AUTHORIZATION_REQUIRED" if connected else
                        "HELD_INTERNAL_OPS_ONLINE_ONLY")
    if cached.scope != target.expected_scope or cached.manifest_digest != target.expected_digest:
        return decision("HELD_CACHED_CONTEXT_MISMATCH")
    if cached.negative_flags:
        return decision("BLOCKED_CACHED_NEGATIVE_RESTRICTION")
    if target.expected_scope.generation <= cached.negative_generation:
        return decision("BLOCKED_CACHED_NEGATIVE_GENERATION")
    if anomalies:
        return decision("HELD_UNTRUSTED_OFFLINE_CONTEXT")
    if risk.reason != "DECLARED_CONSEQUENCE_ONLY":
        return decision(risk.reason)
    return decision("HELD_CANONICAL_TAXONOMY_WINDOWS_ELIGIBILITY_RECOVERY_AND_ENCRYPTED_RUNTIME_MISSING")


def production_gate(request=None):
    return EligibilityDecision(
        "HELD_CANONICAL_TAXONOMY_WINDOWS_ELIGIBILITY_RECOVERY_AND_ENCRYPTED_RUNTIME_MISSING", None)
