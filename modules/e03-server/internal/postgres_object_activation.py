"""Transactional quarantine gate. No upload, scanner, public URL or hosted setup.

The required current_reader must obtain and retain current canonical E3/E5,
operation, floors, audit and runtime locks on this SAME connection. Without it
activation is held. Validation rows are trusted server-written policy/evidence;
their producers, custody and deployment privileges are not implemented here.
"""

from dataclasses import asdict
import json
from typing import Callable

import psycopg
from psycopg.rows import dict_row
from psycopg.types.json import Jsonb

from commit_authorization import CommitRequest, CommitResult, CurrentTuple, Verdict, decide_commit
from object_activation import (ACTION, ActivationRequest, ObjectValidation, SourceFence,
                               ValidationCheck, activation_fingerprint, manifest_fingerprint,
                               validation_reason)
from object_boundary import (ObjectBoundaryError, ObjectManifest, ObjectReference,
                             ObjectVersion, reference_of, verify_derivative, verify_object)


def _decode(row) -> ObjectVersion:
    manifest = dict(row["manifest"])
    for name in ("parent_refs", "lineage"):
        manifest[name] = tuple(ObjectReference(**ref) for ref in manifest[name])
    return ObjectVersion(ObjectManifest(**manifest), bytes(row["payload"]))


def _lock_object(conn, tenant_id, object_id):
    row = conn.execute("""SELECT manifest, payload FROM kavriva_objects.current_object
        WHERE tenant_id = %s AND object_id = %s FOR UPDATE""",
        (tenant_id, object_id)).fetchone()
    return _decode(row) if row else None


def activate_object(dsn: str, request: ActivationRequest, *,
                    current_reader: Callable[[psycopg.Connection, CommitRequest],
                                             CurrentTuple | CommitResult | None] | None = None,
                    source_reader: Callable[[psycopg.Connection, CommitRequest, ObjectReference],
                                            SourceFence | None] | None = None
                    ) -> CommitResult:
    """Record exact-version eligibility after current validation and authorization.

    A receipt records a past canonical decision. It never publishes bytes or
    grants future access; every read/use needs fresh authorization and floors.
    No slow scanner, HTTP or other external effect belongs inside this function.
    """
    if type(request) is not ActivationRequest or type(request.commit) is not CommitRequest:
        return CommitResult(Verdict.DENY, "ACTIVATION_REQUEST_INVALID")
    command = request.commit
    if (command.action != ACTION or not isinstance(request.validation_policy_version, str)
            or not request.validation_policy_version.strip()
            or not isinstance(request.manifest_fingerprint, str)
            or len(request.manifest_fingerprint) != 64
            or any(c not in "0123456789abcdef" for c in request.manifest_fingerprint)
            or command.intended_effect != f"{ACTION}:{request.manifest_fingerprint}"
            or command.fingerprint != activation_fingerprint(request)):
        return CommitResult(Verdict.DENY, "ACTIVATION_INTENT_MISMATCH")
    if current_reader is None:
        return CommitResult(Verdict.HELD, "CURRENT_READER_NOT_CONFIGURED")
    attempted = False
    try:
        with psycopg.connect(dsn, autocommit=False, row_factory=dict_row,
                             application_name="kavriva-object-activation") as conn:
            conn.execute("SET TRANSACTION ISOLATION LEVEL READ COMMITTED")
            # Stable operation lock also serializes conflicting objects for one ID.
            conn.execute("SELECT pg_advisory_xact_lock(hashtextextended(%s, 0))",
                         (json.dumps([command.tenant_id, command.operation_id]),))
            version = _lock_object(conn, command.tenant_id, command.object_id)
            if version is None:
                return CommitResult(Verdict.DENY, "CURRENT_OBJECT_MISSING")
            verify_object(version)
            if (version.manifest.object_id != command.object_id
                    or str(version.manifest.generation) != command.expected_object_generation
                    or manifest_fingerprint(version) != request.manifest_fingerprint):
                return CommitResult(Verdict.HELD, "OBJECT_VERSION_CHANGED")
            # Lock and verify ALL current ancestors, not just child claims.
            sources = {}
            fences = []
            for ref in sorted(version.manifest.lineage, key=lambda item: item.object_id):
                parent = _lock_object(conn, command.tenant_id, ref.object_id)
                if parent is None:
                    return CommitResult(Verdict.HELD, "CURRENT_SOURCE_MISSING")
                verify_object(parent)
                if reference_of(parent.manifest) != ref:
                    return CommitResult(Verdict.HELD, "CURRENT_SOURCE_CHANGED")
                if source_reader is None:
                    return CommitResult(Verdict.HELD, "SOURCE_READER_NOT_CONFIGURED")
                fence = source_reader(conn, command, ref)
                if (type(fence) is not SourceFence or fence.source != ref
                        or fence.tenant_id != command.tenant_id
                        or fence.operation_id != command.operation_id
                        or any(type(value) is not str or not value.strip()
                               for value in (fence.policy_ref, fence.negative_floor_ref))):
                    return CommitResult(Verdict.HELD, "CURRENT_SOURCE_FENCE_REQUIRED")
                if fence.authorized is not True or fence.floor_clear is not True:
                    return CommitResult(Verdict.HELD, "CURRENT_SOURCE_BLOCKED")
                fences.append(fence)
                sources[ref.object_id] = parent
            if version.manifest.derivative_kind is not None:
                verify_derivative(version, parents=tuple(
                    sources[ref.object_id] for ref in version.manifest.parent_refs))
            current = current_reader(conn, command)
            if type(current) is not CurrentTuple:
                if (type(current) is CommitResult and current.verdict != Verdict.ALLOW
                        and isinstance(current.reason_code, str) and current.reason_code.strip()):
                    return current
                return CommitResult(Verdict.HELD, "CURRENT_TUPLE_REQUIRED")
            decision = decide_commit(command, current)
            if decision.verdict != Verdict.ALLOW:
                return decision
            if current.classification != version.manifest.classification:
                return CommitResult(Verdict.HELD, "CURRENT_CLASSIFICATION_MISMATCH")
            if current.intended_effect != f"{ACTION}:{request.manifest_fingerprint}":
                return CommitResult(Verdict.DENY, "ACTIVATION_INTENT_MISMATCH")
            previous = conn.execute("""SELECT fingerprint FROM kavriva_objects.activation_receipt
                WHERE tenant_id = %s AND operation_id = %s FOR UPDATE""",
                (command.tenant_id, command.operation_id)).fetchone()
            if previous:
                if previous["fingerprint"] != command.fingerprint:
                    return CommitResult(Verdict.DENY, "OPERATION_CONFLICT")
                return CommitResult(Verdict.ALLOW, "COMMITTED_REPLAY", command.operation_id)
            row = conn.execute("""SELECT manifest_fingerprint, policy_version, required_checks, checks
                FROM kavriva_objects.current_validation
                WHERE tenant_id = %s AND object_id = %s FOR UPDATE""",
                (command.tenant_id, command.object_id)).fetchone()
            validation = None if row is None else ObjectValidation(
                row["manifest_fingerprint"], row["policy_version"], tuple(row["required_checks"]),
                tuple(ValidationCheck(**check) for check in row["checks"]))
            reason = validation_reason(version, request, validation)
            if reason:
                return CommitResult(Verdict.HELD, reason)
            attempted = True
            conn.execute("""INSERT INTO kavriva_objects.activation_receipt
                (tenant_id, operation_id, fingerprint, object_id, generation, manifest_fingerprint,
                 validation_policy_version, validation_receipts, audit_receipt)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                (command.tenant_id, command.operation_id, command.fingerprint, command.object_id,
                 version.manifest.generation, request.manifest_fingerprint,
                 request.validation_policy_version,
                 Jsonb({"checks": [asdict(check) for check in validation.checks],
                        "source_fences": [asdict(fence) for fence in fences]}), current.audit_receipt))
        return CommitResult(Verdict.ALLOW, "COMMITTED", command.operation_id)
    except ObjectBoundaryError as error:
        return CommitResult(Verdict.HELD, error.reason)
    except Exception:
        return CommitResult(Verdict.OUTCOME_UNKNOWN if attempted else Verdict.HELD,
                            "COMMIT_OUTCOME_UNKNOWN" if attempted else "OBJECT_ACTIVATION_UNAVAILABLE")
