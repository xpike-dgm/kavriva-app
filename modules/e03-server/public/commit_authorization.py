"""E3 commit-time authorization gate (T-E3-001-R1).

The caller must supply a transaction over canonical state. Its ``read_current``
method must read and lock current authority inside that transaction; no request,
JWT, cache, or UI claim may stand in for this read. ``apply_effect`` must perform
only the canonical transition in that same transaction. A production adapter is
still required before this gate can authorize real product effects.
"""

from __future__ import annotations

from contextlib import AbstractContextManager
from dataclasses import dataclass
from enum import Enum
from typing import Callable, Protocol, TypeVar


class Verdict(str, Enum):
    ALLOW = "ALLOW"
    DENY = "DENY"
    HELD = "HELD"
    OUTCOME_UNKNOWN = "OUTCOME_UNKNOWN"


@dataclass(frozen=True)
class CommitRequest:
    actor_id: str
    session_id: str
    tenant_id: str
    object_id: str
    scope: str
    action: str
    operation_id: str
    fingerprint: str
    reason: str
    intended_effect: str
    expected_policy_version: str
    expected_object_generation: str
    # Deliberately untrusted. Kept here to prove a cached ALLOW cannot authorize.
    cached_decision: str | None = None


@dataclass(frozen=True)
class CurrentTuple:
    actor_id: str
    workload_id: str
    issuer_id: str
    session_id: str
    assurance: str
    step_up: str
    security_epoch: str
    tenant_id: str
    object_id: str
    scope: str
    classification: str
    action: str
    role: str
    grant_id: str
    delegation_chain: str
    competence: str
    independence: str
    policy_version: str
    object_generation: str
    release_generation: str
    schema_generation: str
    config_generation: str
    package_generation: str
    client_generation: str
    negative_floor: str
    operation_id: str
    fingerprint: str
    reason: str
    intended_effect: str
    audit_receipt: str
    runtime_compatibility: str
    policy_verdict: Verdict
    session_current: bool
    floor_clear: bool
    audit_ready: bool
    runtime_compatible: bool


T = TypeVar("T")


class CanonicalTransaction(Protocol[T]):
    """Read/lock and transition must share one database transaction."""

    def read_current(self, request: CommitRequest) -> CurrentTuple | CommitResult | None: ...

    def apply_effect(self, request: CommitRequest) -> T: ...


@dataclass(frozen=True)
class CommitResult:
    verdict: Verdict
    reason_code: str
    effect_result: object | None = None


_REQUEST_FIELDS = (
    "actor_id", "session_id", "tenant_id", "object_id", "scope", "action",
    "operation_id", "fingerprint", "reason", "intended_effect",
    "expected_policy_version", "expected_object_generation",
)
_CURRENT_FIELDS = (
    "actor_id", "workload_id", "issuer_id", "session_id", "assurance", "step_up",
    "security_epoch", "tenant_id", "object_id", "scope", "classification",
    "action", "role", "grant_id", "delegation_chain", "competence", "independence",
    "policy_version", "object_generation", "release_generation",
    "schema_generation", "config_generation", "package_generation",
    "client_generation", "negative_floor", "operation_id", "fingerprint",
    "reason", "intended_effect", "audit_receipt", "runtime_compatibility",
)


def _present_text(value: object) -> bool:
    return isinstance(value, str) and bool(value.strip())


def _decision(request: CommitRequest, current: CurrentTuple | None) -> CommitResult:
    if current is None:
        return CommitResult(Verdict.DENY, "CURRENT_AUTHORITY_MISSING")
    if any(not _present_text(getattr(current, name)) for name in _CURRENT_FIELDS):
        return CommitResult(Verdict.HELD, "CURRENT_TUPLE_INCOMPLETE")
    if (current.actor_id, current.session_id) != (request.actor_id, request.session_id):
        return CommitResult(Verdict.DENY, "ACTOR_SESSION_MISMATCH")
    if current.session_current is not True:
        return CommitResult(Verdict.DENY, "SESSION_NOT_CURRENT")
    if (current.tenant_id, current.object_id, current.scope, current.action) != (
        request.tenant_id, request.object_id, request.scope, request.action
    ):
        return CommitResult(Verdict.DENY, "OBJECT_SCOPE_MISMATCH")
    if (current.operation_id, current.fingerprint) != (
        request.operation_id, request.fingerprint
    ):
        return CommitResult(Verdict.DENY, "OPERATION_MISMATCH")
    if (current.reason, current.intended_effect) != (
        request.reason, request.intended_effect
    ):
        return CommitResult(Verdict.DENY, "INTENT_MISMATCH")
    if (current.policy_version, current.object_generation) != (
        request.expected_policy_version, request.expected_object_generation
    ):
        return CommitResult(Verdict.HELD, "AUTHORITY_CHANGED")
    if current.floor_clear is not True:
        return CommitResult(Verdict.HELD, "NEGATIVE_FLOOR")
    if current.audit_ready is not True:
        return CommitResult(Verdict.HELD, "AUDIT_HELD")
    if current.runtime_compatible is not True:
        return CommitResult(Verdict.HELD, "RUNTIME_INCOMPATIBLE")
    if not isinstance(current.policy_verdict, Verdict):
        return CommitResult(Verdict.HELD, "POLICY_HELD")
    if current.policy_verdict == Verdict.DENY:
        return CommitResult(Verdict.DENY, "POLICY_DENIED")
    if current.policy_verdict != Verdict.ALLOW:
        return CommitResult(Verdict.HELD, "POLICY_HELD")
    return CommitResult(Verdict.ALLOW, "CURRENT_TUPLE_ALLOWED")


def decide_commit(request: CommitRequest, current: CurrentTuple | None) -> CommitResult:
    """Public decision contract for an adapter with its own idempotency store."""
    if any(not _present_text(getattr(request, name)) for name in _REQUEST_FIELDS):
        return CommitResult(Verdict.DENY, "REQUEST_INCOMPLETE")
    return _decision(request, current)


def authorize_and_commit(
    request: CommitRequest,
    transaction: Callable[[], AbstractContextManager[CanonicalTransaction[T]]],
) -> CommitResult:
    """Apply one canonical effect only after a fresh tuple read in its transaction.

    An error after an effect attempt has an unknown outcome until canonical lookup;
    a retry must never infer failure and blindly apply the effect again.
    """
    if any(not _present_text(getattr(request, name)) for name in _REQUEST_FIELDS):
        return CommitResult(Verdict.DENY, "REQUEST_INCOMPLETE")

    attempted_effect = False
    try:
        with transaction() as tx:
            current = tx.read_current(request)
            if isinstance(current, CommitResult):
                decision = (CommitResult(Verdict.HELD, "INVALID_CURRENT_DECISION")
                            if current.verdict == Verdict.ALLOW or
                            not _present_text(current.reason_code) else current)
            else:
                decision = _decision(request, current)
            if decision.verdict != Verdict.ALLOW:
                return decision
            attempted_effect = True
            effect_result = tx.apply_effect(request)
        return CommitResult(Verdict.ALLOW, "COMMITTED", effect_result)
    except Exception:
        # Do not leak provider errors or misreport an uncertain commit as DENIED.
        if attempted_effect:
            return CommitResult(Verdict.OUTCOME_UNKNOWN, "COMMIT_OUTCOME_UNKNOWN")
        return CommitResult(Verdict.HELD, "CURRENT_AUTHORITY_UNAVAILABLE")
