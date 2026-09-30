"""Private maintenance record writer for an E3-authorized database transaction.

This is a database effect, not an API entry point. The E3 commit gate must
authorize it against current E5 and resource state before calling it. Runtime
identity binding, protected audit and negative floors are still required.
"""

from __future__ import annotations

from dataclasses import dataclass
from datetime import date

import psycopg
from psycopg.rows import dict_row

from commit_authorization import CommitRequest


CREATE = "CREATE_MAINTENANCE_RECORD"
EDIT = "EDIT_MAINTENANCE_RECORD"


@dataclass(frozen=True)
class MaintenanceEntry:
    record_id: str
    motorcycle_id: str
    performed_on: date
    odometer_km: int | None
    outcome: str
    safety_notes: str
    correction_reason: str | None = None


@dataclass(frozen=True)
class MaintenanceTarget:
    motorcycle_id: str
    classification: str
    generation: int


@dataclass(frozen=True)
class MaintenanceWriteResult:
    record_id: str
    generation: int


def read_target_locked(
    conn: psycopg.Connection, request: CommitRequest,
) -> MaintenanceTarget | None:
    """Lock the canonical target; keep this connection open through the effect."""
    if conn.autocommit:
        raise RuntimeError("maintenance target requires a transaction")
    with conn.cursor(row_factory=dict_row) as cur:
        if request.action == CREATE:
            cur.execute(
                """select motorcycle_id, classification, generation
                   from kavriva_e3.motorcycles
                   where tenant_id = %s and motorcycle_id = %s for update""",
                (request.tenant_id, request.object_id),
            )
            row = cur.fetchone()
        elif request.action == EDIT:
            cur.execute(
                """select r.motorcycle_id, m.classification, r.generation
                   from kavriva_e3.maintenance_records r
                   join kavriva_e3.motorcycles m
                     on m.tenant_id = r.tenant_id
                    and m.motorcycle_id = r.motorcycle_id
                   where r.tenant_id = %s and r.record_id = %s
                   for update of r, m""",
                (request.tenant_id, request.object_id),
            )
            row = cur.fetchone()
        else:
            return None
    return MaintenanceTarget(**row) if row else None


def write_maintenance_entry(
    conn: psycopg.Connection,
    request: CommitRequest,
    entry: MaintenanceEntry,
    target: MaintenanceTarget,
) -> MaintenanceWriteResult:
    """Append a user-reported revision after the caller's current authorization."""
    if conn.autocommit:
        raise RuntimeError("maintenance write requires a transaction")
    if not isinstance(entry.performed_on, date) or not entry.record_id.strip():
        raise ValueError("maintenance entry is incomplete")
    if not entry.outcome.strip() or not isinstance(entry.safety_notes, str):
        raise ValueError("maintenance entry is incomplete")
    if entry.odometer_km is not None and (not isinstance(entry.odometer_km, int)
                                       or entry.odometer_km < 0):
        raise ValueError("odometer must be nonnegative")
    if target.motorcycle_id != entry.motorcycle_id:
        raise ValueError("motorcycle changed")
    if request.expected_object_generation != str(target.generation):
        raise ValueError("target generation changed")
    if request.action == CREATE:
        if request.object_id != entry.motorcycle_id or entry.correction_reason is not None:
            raise ValueError("create target mismatch")
        with conn.cursor() as cur:
            cur.execute(
                """insert into kavriva_e3.maintenance_records
                   (tenant_id, record_id, motorcycle_id, generation, created_by)
                   values (%s, %s, %s, 1, %s)""",
                (request.tenant_id, entry.record_id, entry.motorcycle_id,
                 request.actor_id),
            )
            cur.execute(
                """update kavriva_e3.motorcycles set generation = generation + 1
                   where tenant_id = %s and motorcycle_id = %s and generation = %s""",
                (request.tenant_id, entry.motorcycle_id, target.generation),
            )
            if cur.rowcount != 1:
                raise ValueError("motorcycle generation changed")
        generation = 1
    elif request.action == EDIT:
        if request.object_id != entry.record_id or not isinstance(entry.correction_reason, str) \
                or not entry.correction_reason.strip():
            raise ValueError("edit target mismatch or missing correction reason")
        generation = target.generation + 1
        with conn.cursor() as cur:
            cur.execute(
                """update kavriva_e3.maintenance_records
                   set generation = %s
                   where tenant_id = %s and record_id = %s and generation = %s""",
                (generation, request.tenant_id, entry.record_id, target.generation),
            )
            if cur.rowcount != 1:
                raise ValueError("record generation changed")
    else:
        raise ValueError("unsupported maintenance action")

    conn.execute(
        """insert into kavriva_e3.maintenance_revisions
           (tenant_id, record_id, generation, operation_id, actor_id,
            performed_on, odometer_km, outcome, safety_notes, correction_reason)
           values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
        (request.tenant_id, entry.record_id, generation, request.operation_id,
         request.actor_id, entry.performed_on, entry.odometer_km,
         entry.outcome, entry.safety_notes, entry.correction_reason),
    )
    return MaintenanceWriteResult(entry.record_id, generation)
