"""Private canonical reader, for an already authorized E3 transaction only.

Not an API endpoint; tenant_id must come from trusted current E5 context.
No caller-provided cache, history blob or protected-audit event is read here.
"""

import psycopg
from psycopg.rows import dict_row

from maintenance_provenance import HistorySnapshot, MaintenanceRevision, validate_history


def read_maintenance_history(conn: psycopg.Connection, *, tenant_id: str,
                             record_id: str) -> HistorySnapshot | None:
    if conn.autocommit:
        raise RuntimeError("canonical history requires an authorized transaction")
    if any(not isinstance(v, str) or not v.strip() for v in (tenant_id, record_id)):
        raise ValueError("history target incomplete")
    with conn.cursor(row_factory=dict_row) as cur:
        # Corrections take UPDATE on this parent. Keep SHARE through the read
        # so current generation and revisions describe one coherent head.
        cur.execute(
            """select motorcycle_id, generation from kavriva_e3.maintenance_records
               where tenant_id = %s and record_id = %s for share""",
            (tenant_id, record_id),
        )
        row = cur.fetchone()
        if row is None:
            return None
        cur.execute(
            """select generation, operation_id, actor_id, recorded_at, performed_on,
                      odometer_km, outcome, safety_notes, correction_reason, evidence_level
               from kavriva_e3.maintenance_revisions
               where tenant_id = %s and record_id = %s order by generation""",
            (tenant_id, record_id),
        )
        revisions = tuple(MaintenanceRevision(**r) for r in cur.fetchall())
    snapshot = HistorySnapshot(tenant_id, record_id, row["motorcycle_id"],
                               row["generation"], revisions)
    validate_history(snapshot)
    return snapshot
