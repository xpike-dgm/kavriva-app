"""Consumer maintenance command bound to verified Auth and current E5 rows.

This module does not choose an HTTP runtime. A trusted API process passes the
bearer token and typed command. Authentication, operation identity, E5 policy,
the Auth session, the motorcycle, floor, audit receipt and the database effect
are bound to one PostgreSQL transaction. No client role receives direct table
access.
"""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass
from datetime import date
from uuid import UUID, NAMESPACE_URL, uuid4, uuid5

import psycopg

from commit_authorization import (
    CommitRequest, CommitResult, CurrentTuple, Verdict, decide_commit,
)
from consumer_authority import (
    AuthorityRequest, Verdict as IdentityVerdict, WORKLOAD,
    decide_current_on_connection, enroll_personal_tenant, grant_id,
    lock_provider_session, sync_session,
)
from maintenance_store import (
    CREATE, EDIT, MaintenanceEntry, MaintenanceWriteResult,
    read_target_locked, write_maintenance_entry,
)
from principal import AuthenticationFailure, Principal


def _uuid(value: str) -> str:
    return str(UUID(value))


@dataclass(frozen=True)
class MaintenanceCommand:
    action: str
    target_id: str
    operation_id: str
    expected_generation: int
    expected_policy_version: int
    client_generation: int
    performed_on: date
    odometer_km: int | None
    outcome: str
    safety_notes: str
    correction_reason: str | None = None


def _valid(command: MaintenanceCommand) -> bool:
    try:
        _uuid(command.target_id)
        _uuid(command.operation_id)
    except (ValueError, TypeError, AttributeError):
        return False
    return (
        command.action in (CREATE, EDIT) and
        all(isinstance(x, int) and not isinstance(x, bool) and x > 0 for x in (
            command.expected_generation, command.expected_policy_version,
            command.client_generation,
        )) and
        isinstance(command.performed_on, date) and
        isinstance(command.outcome, str) and 0 < len(command.outcome.strip()) <= 5000 and
        isinstance(command.safety_notes, str) and len(command.safety_notes) <= 5000 and
        (command.odometer_km is None or
         isinstance(command.odometer_km, int) and not isinstance(command.odometer_km, bool)
         and 0 <= command.odometer_km <= 10000000) and
        ((command.action == CREATE and command.correction_reason is None) or
         (command.action == EDIT and isinstance(command.correction_reason, str)
          and 0 < len(command.correction_reason.strip()) <= 1000))
    )


def _fingerprint(command: MaintenanceCommand) -> str:
    payload = {
        "action": command.action,
        "target_id": _uuid(command.target_id),
        "expected_generation": command.expected_generation,
        "expected_policy_version": command.expected_policy_version,
        "client_generation": command.client_generation,
        "performed_on": command.performed_on.isoformat(),
        "odometer_km": command.odometer_km,
        "outcome": command.outcome,
        "safety_notes": command.safety_notes,
        "correction_reason": command.correction_reason,
    }
    return hashlib.sha256(json.dumps(
        payload, sort_keys=True, separators=(",", ":"), ensure_ascii=False,
    ).encode("utf-8")).hexdigest()


def _audit(
    conn: psycopg.Connection, tenant_id: str, operation_id: str,
    actor_id: str, object_id: str, action: str, policy_version: int,
    current_grant_id: str, result: str,
) -> str:
    head = conn.execute(
        """select last_sequence, last_digest from kavriva_audit.heads
           where tenant_id = %s for update""", (tenant_id,),
    ).fetchone()
    if head is None:
        raise RuntimeError("audit custody unavailable")
    sequence, previous = head
    sequence += 1
    receipt_id = str(uuid4())
    meaning = json.dumps({
        "sequence": sequence, "receipt_id": receipt_id,
        "operation_id": operation_id, "actor_id": actor_id,
        "object_id": object_id, "action": action,
        "policy_version": policy_version, "grant_id": current_grant_id,
        "result": result,
    }, sort_keys=True, separators=(",", ":"))
    digest = hashlib.sha256((previous + meaning).encode("utf-8")).hexdigest()
    conn.execute(
        """insert into kavriva_audit.events
           (tenant_id, sequence, receipt_id, operation_id, actor_id, object_id,
            action, policy_version, grant_id, result, previous_digest, digest)
           values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
        (tenant_id, sequence, receipt_id, operation_id, actor_id, object_id,
         action, policy_version, current_grant_id, result, previous, digest),
    )
    conn.execute(
        """update kavriva_audit.heads
           set last_sequence = %s, last_digest = %s where tenant_id = %s""",
        (sequence, digest, tenant_id),
    )
    return receipt_id


class MaintenanceCommands:
    def __init__(self, dsn: str, auth) -> None:
        self._dsn = dsn
        self._auth = auth

    def _principal(self, token: str) -> Principal | CommitResult:
        try:
            return self._auth.verify(token)
        except AuthenticationFailure as exc:
            return CommitResult(
                Verdict.HELD if exc.unavailable else Verdict.DENY,
                exc.reason_code,
            )

    def enroll(self, token: str) -> CommitResult:
        principal = self._principal(token)
        if isinstance(principal, CommitResult):
            return principal
        try:
            with psycopg.connect(self._dsn) as conn:
                conn.execute("set transaction isolation level read committed")
                enrolled = enroll_personal_tenant(conn, principal)
                if enrolled is None:
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "ENROLLMENT_NOT_AVAILABLE")
                if not enrolled.already_enrolled:
                    _audit(conn, enrolled.tenant_id, str(uuid4()),
                           principal.actor_id, enrolled.motorcycle_id,
                           "ENROLL_CONSUMER", 1, "INITIAL", "COMMITTED")
            return CommitResult(
                Verdict.ALLOW,
                "ALREADY_ENROLLED" if enrolled.already_enrolled else "ENROLLED",
                enrolled,
            )
        except Exception:
            return CommitResult(Verdict.OUTCOME_UNKNOWN, "ENROLLMENT_OUTCOME_UNKNOWN")

    def execute(self, token: str, command: MaintenanceCommand) -> CommitResult:
        if not isinstance(command, MaintenanceCommand) or not _valid(command):
            return CommitResult(Verdict.DENY, "REQUEST_INCOMPLETE")
        principal = self._principal(token)
        if isinstance(principal, CommitResult):
            return principal
        tenant_id = principal.actor_id  # personal consumer tenant, never client-selected
        target_id = _uuid(command.target_id)
        operation_id = _uuid(command.operation_id)
        fingerprint = _fingerprint(command)
        reason = ("USER_REPORTED_ENTRY" if command.action == CREATE
                  else "USER_REPORTED_CORRECTION")
        intended_effect = "APPEND_USER_REPORTED_MAINTENANCE"
        request = CommitRequest(
            actor_id=principal.actor_id, session_id=principal.session_id,
            tenant_id=tenant_id, object_id=target_id, scope="maintenance",
            action=command.action, operation_id=operation_id,
            fingerprint=fingerprint, reason=reason,
            intended_effect=intended_effect,
            expected_policy_version=str(command.expected_policy_version),
            expected_object_generation=str(command.expected_generation),
        )
        effect_attempted = False
        try:
            with psycopg.connect(self._dsn) as conn:
                conn.execute("set transaction isolation level read committed")
                if not lock_provider_session(conn, principal):
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "SESSION_NOT_CURRENT")
                enrollment = conn.execute(
                    """select tenant_id from kavriva_e5.consumer_enrollments
                       where actor_id = %s and tenant_id = %s for share""",
                    (principal.actor_id, tenant_id),
                ).fetchone()
                if enrollment is None or not sync_session(conn, principal, tenant_id):
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "CONSUMER_NOT_CURRENT")
                inserted = conn.execute(
                    """insert into kavriva_e3.operation_records
                       (tenant_id, operation_id, actor_id, action, object_id,
                        fingerprint, reason, intended_effect, status)
                       values (%s, %s, %s, %s, %s, %s, %s, %s, 'PENDING')
                       on conflict do nothing returning operation_id""",
                    (tenant_id, operation_id, principal.actor_id, command.action,
                     target_id, fingerprint, reason, intended_effect),
                ).fetchone()
                if inserted is None:
                    prior = conn.execute(
                        """select actor_id, action, object_id, fingerprint,
                                  reason, intended_effect, status,
                                  record_id, result_generation
                           from kavriva_e3.operation_records
                           where tenant_id = %s and operation_id = %s for update""",
                        (tenant_id, operation_id),
                    ).fetchone()
                    if prior is None:
                        return CommitResult(Verdict.HELD, "OPERATION_UNKNOWN")
                    if tuple(prior[:6]) != (
                        principal.actor_id, command.action, target_id,
                        fingerprint, reason, intended_effect,
                    ):
                        return CommitResult(Verdict.HELD, "OPERATION_CONFLICT")
                    if prior[6] != "COMMITTED":
                        return CommitResult(Verdict.OUTCOME_UNKNOWN, "OPERATION_UNRESOLVED")
                    return CommitResult(
                        Verdict.ALLOW, "ALREADY_COMMITTED",
                        MaintenanceWriteResult(prior[7], prior[8]),
                    )
                target = read_target_locked(conn, request)
                if target is None:
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "RESOURCE_MISSING")
                floor = conn.execute(
                    """select floor_generation, blocked
                       from kavriva_e3.negative_floors
                       where tenant_id = %s and motorcycle_id = %s for share""",
                    (tenant_id, target.motorcycle_id),
                ).fetchone()
                runtime = conn.execute(
                    """select release_generation, schema_generation,
                              config_generation, package_generation,
                              min_client_generation, max_client_generation
                       from kavriva_e3.runtime_versions
                       where scope = 'maintenance' for share""",
                ).fetchone()
                if floor is None or runtime is None:
                    conn.rollback()
                    return CommitResult(Verdict.HELD, "CURRENT_CONTEXT_INCOMPLETE")
                authority_request = AuthorityRequest(
                    actor_id=principal.actor_id, workload_id=WORKLOAD,
                    session_id=principal.session_id, tenant_id=tenant_id,
                    object_id=target_id, scope="maintenance",
                    classification=target.classification, action=command.action,
                    grant_id=grant_id(principal.actor_id, command.action),
                    operation_id=operation_id,
                )
                e5 = decide_current_on_connection(conn, authority_request)
                if e5.verdict != IdentityVerdict.ALLOW or e5.authority is None:
                    conn.rollback()
                    return CommitResult(Verdict(e5.verdict.value), e5.reason_code)
                authority = e5.authority
                receipt = _audit(
                    conn, tenant_id, operation_id, principal.actor_id, target_id,
                    command.action, authority.policy_version, authority.grant_id,
                    "INTENT",
                )
                compatible = runtime[4] <= command.client_generation <= runtime[5]
                current = CurrentTuple(
                    actor_id=authority.actor_id, workload_id=authority.workload_id,
                    issuer_id=authority.issuer_id, session_id=authority.session_id,
                    assurance=authority.assurance, step_up="NOT_REQUIRED",
                    security_epoch=str(authority.security_epoch),
                    tenant_id=authority.tenant_id, object_id=target_id,
                    scope=authority.scope, classification=target.classification,
                    action=authority.action, role=authority.role,
                    grant_id=authority.grant_id,
                    delegation_chain=authority.delegation_chain,
                    competence=authority.competence,
                    independence=str(authority.independent),
                    policy_version=str(authority.policy_version),
                    object_generation=str(target.generation),
                    release_generation=str(runtime[0]),
                    schema_generation=str(runtime[1]),
                    config_generation=str(runtime[2]),
                    package_generation=str(runtime[3]),
                    client_generation=str(command.client_generation),
                    negative_floor=str(floor[0]), operation_id=operation_id,
                    fingerprint=fingerprint, reason=reason,
                    intended_effect=intended_effect, audit_receipt=receipt,
                    runtime_compatibility="MATCHED" if compatible else "INCOMPATIBLE",
                    policy_verdict=Verdict.ALLOW, session_current=True,
                    floor_clear=not floor[1], audit_ready=True,
                    runtime_compatible=compatible,
                )
                decision = decide_commit(request, current)
                if decision.verdict != Verdict.ALLOW:
                    conn.rollback()
                    return decision
                record_id = (str(uuid5(NAMESPACE_URL, tenant_id + ":" + operation_id))
                             if command.action == CREATE else target_id)
                entry = MaintenanceEntry(
                    record_id=record_id, motorcycle_id=target.motorcycle_id,
                    performed_on=command.performed_on,
                    odometer_km=command.odometer_km, outcome=command.outcome,
                    safety_notes=command.safety_notes,
                    correction_reason=command.correction_reason,
                )
                effect_attempted = True
                written = write_maintenance_entry(conn, request, entry, target)
                _audit(conn, tenant_id, operation_id, principal.actor_id,
                       target_id, command.action, authority.policy_version,
                       authority.grant_id, "COMMITTED")
                conn.execute(
                    """update kavriva_e3.operation_records
                       set status = 'COMMITTED', record_id = %s,
                           result_generation = %s
                       where tenant_id = %s and operation_id = %s
                         and status = 'PENDING'""",
                    (written.record_id, written.generation,
                     tenant_id, operation_id),
                )
            return CommitResult(Verdict.ALLOW, "COMMITTED", written)
        except Exception:
            return CommitResult(
                Verdict.OUTCOME_UNKNOWN if effect_attempted else Verdict.HELD,
                "COMMIT_OUTCOME_UNKNOWN" if effect_attempted else
                "CURRENT_AUTHORITY_UNAVAILABLE",
            )

    def lookup(self, token: str, operation_id: str) -> CommitResult:
        """Read only the authenticated actor's canonical operation result."""
        try:
            operation_id = _uuid(operation_id)
        except (ValueError, TypeError, AttributeError):
            return CommitResult(Verdict.DENY, "REQUEST_INCOMPLETE")
        principal = self._principal(token)
        if isinstance(principal, CommitResult):
            return principal
        try:
            with psycopg.connect(self._dsn) as conn:
                if not lock_provider_session(conn, principal):
                    return CommitResult(Verdict.DENY, "SESSION_NOT_CURRENT")
                if not sync_session(conn, principal, principal.actor_id):
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "CONSUMER_NOT_CURRENT")
                session = conn.execute(
                    """select s.security_epoch, e.security_epoch,
                              s.revoked_at, s.expires_at > clock_timestamp()
                       from kavriva_e5.current_sessions s
                       join kavriva_e5.actor_epochs e
                         on e.tenant_id = s.tenant_id and e.actor_id = s.actor_id
                       where s.session_id = %s and s.actor_id = %s
                       for share of s, e""",
                    (principal.session_id, principal.actor_id),
                ).fetchone()
                if (session is None or session[0] != session[1] or
                        session[2] is not None or not session[3]):
                    conn.rollback()
                    return CommitResult(Verdict.DENY, "SESSION_NOT_CURRENT")
                row = conn.execute(
                    """select status, record_id, result_generation
                       from kavriva_e3.operation_records
                       where tenant_id = %s and actor_id = %s
                         and operation_id = %s""",
                    (principal.actor_id, principal.actor_id, operation_id),
                ).fetchone()
                if row is None or row[0] != "COMMITTED":
                    return CommitResult(Verdict.OUTCOME_UNKNOWN, "OPERATION_UNKNOWN")
                return CommitResult(
                    Verdict.ALLOW, "ALREADY_COMMITTED",
                    MaintenanceWriteResult(row[1], row[2]),
                )
        except Exception:
            return CommitResult(Verdict.HELD, "CURRENT_AUTHORITY_UNAVAILABLE")
