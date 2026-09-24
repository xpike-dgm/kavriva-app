"""Locked PostgreSQL source for E5's current-context decision.

This reader owns no connection or effect. E3 must call it inside the same
non-autocommit transaction that holds the locks through its canonical write.
No policy verdict is stored as a current-authorization cache.
"""

from __future__ import annotations

import psycopg
from psycopg.rows import dict_row

from decision import (
    AuthorityRequest, CurrentAuthorityStore, GrantRow, RuleRow,
    SessionRow, Snapshot,
)


class PostgresCurrentAuthority(CurrentAuthorityStore):
    def __init__(self, connection: psycopg.Connection) -> None:
        self._connection = connection

    def read_locked(self, request: AuthorityRequest) -> Snapshot:
        if self._connection.autocommit:
            raise RuntimeError("current authority requires an open transaction")
        with self._connection.cursor(row_factory=dict_row) as cur:
            cur.execute(
                """select security_epoch from kavriva_e5.actor_epochs
                   where tenant_id = %s and actor_id = %s for share""",
                (request.tenant_id, request.actor_id),
            )
            epoch_row = cur.fetchone()
            cur.execute(
                """select actor_id, workload_id, issuer_id, tenant_id,
                          assurance, security_epoch, expires_at, revoked_at,
                          step_up_operation_id, step_up_expires_at
                   from kavriva_e5.current_sessions
                   where session_id = %s for share""",
                (request.session_id,),
            )
            session_row = cur.fetchone()
            cur.execute(
                """select actor_id, tenant_id, scope, action, role,
                          delegation_chain, competence, independent,
                          expires_at, revoked_at
                   from kavriva_e5.current_grants
                   where grant_id = %s for share""",
                (request.grant_id,),
            )
            grant_row = cur.fetchone()
            cur.execute(
                """select policy_version from kavriva_e5.policy_heads
                   where tenant_id = %s for share""",
                (request.tenant_id,),
            )
            head_row = cur.fetchone()
            rule_row = None
            if head_row is not None and grant_row is not None:
                cur.execute(
                    """select verdict, required_assurance,
                              required_competence, requires_independence,
                              requires_step_up
                       from kavriva_e5.policy_rules
                       where tenant_id = %s and policy_version = %s
                         and action = %s and scope = %s
                         and classification = %s and role = %s
                       for share""",
                    (request.tenant_id, head_row["policy_version"],
                     request.action, request.scope, request.classification,
                     grant_row["role"]),
                )
                rule_row = cur.fetchone()
            cur.execute("select clock_timestamp() as now")
            now = cur.fetchone()["now"]
        return Snapshot(
            now=now,
            epoch=epoch_row["security_epoch"] if epoch_row else None,
            session=SessionRow(**session_row) if session_row else None,
            grant=GrantRow(**grant_row) if grant_row else None,
            policy_version=head_row["policy_version"] if head_row else None,
            rule=RuleRow(**rule_row) if rule_row else None,
        )
