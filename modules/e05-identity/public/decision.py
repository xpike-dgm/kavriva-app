"""E5 current-context authorization decision (T-E5-003).

The resource fields must come from E3's current canonical read, never a client
payload. The source must read E5's current rows while the caller's transaction
remains open; E3 will later use that same transaction for its canonical effect.
"""

from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime
from enum import Enum
from typing import Protocol


class Verdict(str, Enum):
    ALLOW = "ALLOW"
    DENY = "DENY"
    HELD = "HELD"


@dataclass(frozen=True)
class AuthorityRequest:
    actor_id: str
    workload_id: str
    session_id: str
    tenant_id: str
    object_id: str
    scope: str
    classification: str
    action: str
    grant_id: str
    operation_id: str


@dataclass(frozen=True)
class SessionRow:
    actor_id: str
    workload_id: str
    issuer_id: str
    tenant_id: str
    assurance: str
    security_epoch: int
    expires_at: datetime
    revoked_at: datetime | None
    step_up_operation_id: str | None
    step_up_expires_at: datetime | None


@dataclass(frozen=True)
class GrantRow:
    actor_id: str
    tenant_id: str
    scope: str
    action: str
    role: str
    delegation_chain: str
    competence: str
    independent: bool
    expires_at: datetime
    revoked_at: datetime | None


@dataclass(frozen=True)
class RuleRow:
    verdict: str
    required_assurance: str
    required_competence: str
    requires_independence: bool
    requires_step_up: bool


@dataclass(frozen=True)
class Snapshot:
    now: datetime
    epoch: int | None
    session: SessionRow | None
    grant: GrantRow | None
    policy_version: int | None
    rule: RuleRow | None


class CurrentAuthorityStore(Protocol):
    def read_locked(self, request: AuthorityRequest) -> Snapshot: ...


@dataclass(frozen=True)
class CurrentAuthority:
    actor_id: str
    workload_id: str
    issuer_id: str
    session_id: str
    assurance: str
    security_epoch: int
    tenant_id: str
    object_id: str
    scope: str
    classification: str
    action: str
    role: str
    grant_id: str
    delegation_chain: str
    competence: str
    independent: bool
    policy_version: int
    operation_id: str


@dataclass(frozen=True)
class Decision:
    verdict: Verdict
    reason_code: str
    authority: CurrentAuthority | None = None


_REQUEST_FIELDS = tuple(AuthorityRequest.__dataclass_fields__)


def decide_current(request: AuthorityRequest, store: CurrentAuthorityStore) -> Decision:
    """Read locked canonical E5 rows and deny unless every current check passes."""
    if any(not isinstance(getattr(request, name), str) or
           not getattr(request, name).strip() for name in _REQUEST_FIELDS):
        return Decision(Verdict.DENY, "REQUEST_INCOMPLETE")
    try:
        current = store.read_locked(request)
    except Exception:
        # The enclosing transaction is unusable after a database failure. Its
        # owner must roll back; this result must never be converted to ALLOW.
        return Decision(Verdict.HELD, "CURRENT_AUTHORITY_UNAVAILABLE")
    if current.epoch is None:
        return Decision(Verdict.DENY, "ACTOR_EPOCH_MISSING")
    session = current.session
    if session is None:
        return Decision(Verdict.DENY, "SESSION_NOT_CURRENT")
    if (session.actor_id, session.workload_id, session.tenant_id) != (
        request.actor_id, request.workload_id, request.tenant_id
    ):
        return Decision(Verdict.DENY, "SESSION_CONTEXT_MISMATCH")
    if session.revoked_at is not None or session.expires_at <= current.now:
        return Decision(Verdict.DENY, "SESSION_NOT_CURRENT")
    if session.security_epoch != current.epoch:
        return Decision(Verdict.DENY, "SECURITY_EPOCH_CHANGED")
    grant = current.grant
    if grant is None:
        return Decision(Verdict.DENY, "GRANT_NOT_CURRENT")
    if (grant.actor_id, grant.tenant_id, grant.scope, grant.action) != (
        request.actor_id, request.tenant_id, request.scope, request.action
    ):
        return Decision(Verdict.DENY, "GRANT_SCOPE_MISMATCH")
    if grant.revoked_at is not None or grant.expires_at <= current.now:
        return Decision(Verdict.DENY, "GRANT_NOT_CURRENT")
    if not all((session.issuer_id.strip(), session.assurance.strip(),
                grant.role.strip(), grant.delegation_chain.strip(),
                grant.competence.strip())):
        return Decision(Verdict.HELD, "CURRENT_CONTEXT_INCOMPLETE")
    if current.policy_version is None:
        return Decision(Verdict.HELD, "POLICY_UNAVAILABLE")
    rule = current.rule
    if rule is None:
        return Decision(Verdict.DENY, "POLICY_NO_ALLOW")
    if rule.verdict == "DENY":
        return Decision(Verdict.DENY, "POLICY_DENIED")
    if rule.verdict != "ALLOW":
        return Decision(Verdict.HELD, "POLICY_HELD")
    if session.assurance != rule.required_assurance:
        return Decision(Verdict.HELD, "ASSURANCE_REQUIRED")
    if grant.competence != rule.required_competence:
        return Decision(Verdict.DENY, "COMPETENCE_MISMATCH")
    if rule.requires_independence and not grant.independent:
        return Decision(Verdict.DENY, "INDEPENDENCE_REQUIRED")
    if rule.requires_step_up and (
        session.step_up_operation_id != request.operation_id or
        session.step_up_expires_at is None or
        session.step_up_expires_at <= current.now
    ):
        return Decision(Verdict.HELD, "STEP_UP_REQUIRED")
    return Decision(Verdict.ALLOW, "CURRENT_CONTEXT_ALLOWED", CurrentAuthority(
        actor_id=request.actor_id, workload_id=session.workload_id,
        issuer_id=session.issuer_id, session_id=request.session_id,
        assurance=session.assurance, security_epoch=current.epoch,
        tenant_id=request.tenant_id, object_id=request.object_id,
        scope=request.scope, classification=request.classification,
        action=request.action, role=grant.role, grant_id=request.grant_id,
        delegation_chain=grant.delegation_chain, competence=grant.competence,
        independent=grant.independent, policy_version=current.policy_version,
        operation_id=request.operation_id,
    ))
