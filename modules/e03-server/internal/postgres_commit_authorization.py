"""PostgreSQL transaction adapter for the E3 commit gate (T-E3-001-R1).

``kavriva_e3.current_authorization`` is a private canonical-store contract.
The row represents the current decision inputs for one tenant/object/action;
every update to any tuple component must update this row transactionally. This
module never reads JWT claims or a client-provided authorization snapshot.

The caller supplies only a database effect writer. It runs on the SAME psycopg
connection while the selected authority row is locked. No external side effect
belongs in that writer. Deployment is held until the E5-owned policy/session/
grant/epoch sources and the E3 canonical mutation are wired to this contract.
"""

from __future__ import annotations

from typing import Callable, Generic, TypeVar

import psycopg
from psycopg.rows import dict_row

from commit_authorization import CommitRequest, CurrentTuple, Verdict, _decision


T = TypeVar("T")

_CURRENT_SQL = """
SELECT
    actor_id, workload_id, issuer_id, session_id, assurance, step_up,
    security_epoch, tenant_id, object_id, scope, classification, action,
    role, grant_id, delegation_chain, competence, independence,
    policy_version, object_generation, release_generation,
    schema_generation, config_generation, package_generation,
    client_generation, negative_floor, operation_id, fingerprint,
    reason, intended_effect, audit_receipt, runtime_compatibility,
    policy_verdict, session_current, floor_clear, audit_ready,
    runtime_compatible
FROM kavriva_e3.current_authorization
WHERE tenant_id = %s AND object_id = %s AND action = %s
FOR UPDATE
"""


class PostgresCanonicalTransaction(Generic[T]):
    def __init__(
        self,
        dsn: str,
        effect_writer: Callable[[psycopg.Connection, CommitRequest], T],
    ) -> None:
        self._dsn = dsn
        self._effect_writer = effect_writer
        self._conn: psycopg.Connection | None = None
        self._current: CurrentTuple | None = None
        self._effect_applied = False

    def __enter__(self) -> PostgresCanonicalTransaction[T]:
        self._conn = psycopg.connect(
            self._dsn, autocommit=False, row_factory=dict_row,
            application_name="kavriva-e3-commit-gate",
        )
        # SELECT FOR UPDATE rechecks a row committed by a concurrent writer after
        # waiting for its lock at READ COMMITTED isolation.
        self._conn.execute("SET TRANSACTION ISOLATION LEVEL READ COMMITTED")
        return self

    def __exit__(self, exc_type, exc_value, traceback) -> bool:
        conn = self._conn
        self._conn = None
        if conn is None:
            return False
        try:
            if exc_type is None:
                conn.commit()
            else:
                conn.rollback()
        finally:
            conn.close()
        return False

    def read_current(self, request: CommitRequest) -> CurrentTuple | None:
        if self._conn is None:
            raise RuntimeError("transaction is not open")
        row = self._conn.execute(
            _CURRENT_SQL, (request.tenant_id, request.object_id, request.action)
        ).fetchone()
        self._current = None
        if row is None:
            return None
        try:
            row["policy_verdict"] = Verdict(row["policy_verdict"])
        except (ValueError, TypeError):
            row["policy_verdict"] = Verdict.HELD
        self._current = CurrentTuple(**row)
        return self._current

    def apply_effect(self, request: CommitRequest) -> T:
        if self._conn is None or self._current is None:
            raise RuntimeError("current authority must be read in the open transaction")
        if self._effect_applied or _decision(request, self._current).verdict != Verdict.ALLOW:
            raise RuntimeError("effect is not authorized for this transaction")
        self._effect_applied = True
        return self._effect_writer(self._conn, request)


def postgres_transaction(
    dsn: str,
    effect_writer: Callable[[psycopg.Connection, CommitRequest], T],
) -> Callable[[], PostgresCanonicalTransaction[T]]:
    """Factory passed to ``authorize_and_commit``; each call owns one transaction."""
    return lambda: PostgresCanonicalTransaction(dsn, effect_writer)
