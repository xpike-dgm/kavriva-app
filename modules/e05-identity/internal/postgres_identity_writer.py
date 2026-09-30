"""Trusted consumer identity writers; never callable with client-selected actors.

The caller first verifies the bearer token with Supabase Auth. The actual
provider session and user are locked in the same PostgreSQL transaction as a
protected product write. E5 rows are Kavriva authority, not JWT role caches.
"""

from __future__ import annotations

from dataclasses import dataclass
from uuid import uuid4

import psycopg

from principal import Principal


WORKLOAD = "consumer-api"
MAINTENANCE_SCOPE = "maintenance"
CREATE = "CREATE_MAINTENANCE_RECORD"
EDIT = "EDIT_MAINTENANCE_RECORD"


@dataclass(frozen=True)
class Enrollment:
    tenant_id: str
    motorcycle_id: str


def grant_id(actor_id: str, action: str) -> str:
    if action not in (CREATE, EDIT):
        raise ValueError("unsupported consumer grant")
    return f"consumer:{actor_id}:{action}"


def lock_provider_session(conn: psycopg.Connection, principal: Principal) -> bool:
    """Lock both Auth rows so logout/deletion cannot race a product commit."""
    if conn.autocommit:
        raise RuntimeError("provider session requires a transaction")
    row = conn.execute(
        """select s.user_id::text
           from auth.sessions s join auth.users u on u.id = s.user_id
           where s.id = %s::uuid for share of s, u""",
        (principal.session_id,),
    ).fetchone()
    return row is not None and row[0] == principal.actor_id


def enroll_personal_tenant(
    conn: psycopg.Connection, principal: Principal,
) -> Enrollment | None:
    """Create the first personal motorcycle and owner grants exactly once.

    A later call cannot recreate revoked grants, reset a raised epoch, or
    replace an updated policy. Additional motorcycles need their own guarded
    product operation rather than this one-time enrollment path.
    """
    if not lock_provider_session(conn, principal):
        return None
    actor = principal.actor_id
    inserted = conn.execute(
        """insert into kavriva_e5.consumer_enrollments (actor_id, tenant_id)
           values (%s, %s) on conflict do nothing returning tenant_id""",
        (actor, actor),
    ).fetchone()
    if inserted is None:
        return None
    motorcycle_id = str(uuid4())
    conn.execute(
        "insert into kavriva_e5.actor_epochs values (%s, %s, 1)",
        (actor, actor),
    )
    conn.execute(
        """insert into kavriva_e3.motorcycles
           (tenant_id, motorcycle_id, classification) values (%s, %s, 'private')""",
        (actor, motorcycle_id),
    )
    conn.execute(
        """insert into kavriva_e3.negative_floors
           (tenant_id, motorcycle_id) values (%s, %s)""",
        (actor, motorcycle_id),
    )
    conn.execute(
        "insert into kavriva_audit.heads (tenant_id) values (%s)", (actor,),
    )
    conn.execute(
        "insert into kavriva_e5.policy_heads values (%s, 1)", (actor,),
    )
    for action in (CREATE, EDIT):
        conn.execute(
            """insert into kavriva_e5.current_grants
               (grant_id, tenant_id, actor_id, scope, action, role,
                delegation_chain, competence, independent, expires_at)
               values (%s, %s, %s, 'maintenance', %s, 'owner', 'DIRECT',
                       'SELF_REPORTED', false, '2099-12-31 00:00:00+00')""",
            (grant_id(actor, action), actor, actor, action),
        )
        conn.execute(
            """insert into kavriva_e5.policy_rules
               (tenant_id, policy_version, action, scope, classification,
                role, verdict, required_assurance, required_competence,
                requires_independence, requires_step_up)
               values (%s, 1, %s, 'maintenance', 'private', 'owner', 'ALLOW',
                       'STANDARD', 'SELF_REPORTED', false, false)""",
            (actor, action),
        )
    sync_session(conn, principal, actor)
    return Enrollment(actor, motorcycle_id)


def sync_session(
    conn: psycopg.Connection, principal: Principal, tenant_id: str,
) -> bool:
    """Record a verified Auth session without resurrecting a revoked E5 row."""
    if tenant_id != principal.actor_id or not lock_provider_session(conn, principal):
        return False
    epoch = conn.execute(
        """select security_epoch from kavriva_e5.actor_epochs
           where tenant_id = %s and actor_id = %s for share""",
        (tenant_id, principal.actor_id),
    ).fetchone()
    if epoch is None:
        return False
    with conn.cursor() as cur:
        cur.execute(
            """insert into kavriva_e5.current_sessions
               (session_id, tenant_id, actor_id, workload_id, issuer_id,
                assurance, security_epoch, expires_at)
               values (%s, %s, %s, %s, %s, %s, %s, %s)
               on conflict (session_id) do update
                  set expires_at = excluded.expires_at
                where kavriva_e5.current_sessions.tenant_id = excluded.tenant_id
                  and kavriva_e5.current_sessions.actor_id = excluded.actor_id
                  and kavriva_e5.current_sessions.workload_id = excluded.workload_id
                  and kavriva_e5.current_sessions.issuer_id = excluded.issuer_id
                  and kavriva_e5.current_sessions.security_epoch = excluded.security_epoch
                  and kavriva_e5.current_sessions.revoked_at is null""",
            (principal.session_id, tenant_id, principal.actor_id, WORKLOAD,
             principal.issuer_id, principal.assurance, epoch[0],
             principal.expires_at),
        )
        return cur.rowcount == 1


def revoke_consumer(conn: psycopg.Connection, tenant_id: str, actor_id: str) -> None:
    """Trusted negative-only writer. Existing and future sessions cannot regrant."""
    if conn.autocommit:
        raise RuntimeError("revocation requires a transaction")
    with conn.cursor() as cur:
        cur.execute(
            """update kavriva_e5.actor_epochs
               set security_epoch = security_epoch + 1
               where tenant_id = %s and actor_id = %s""",
            (tenant_id, actor_id),
        )
        if cur.rowcount != 1:
            raise ValueError("actor is not enrolled")
        cur.execute(
            """update kavriva_e5.current_sessions
               set revoked_at = clock_timestamp()
               where tenant_id = %s and actor_id = %s and revoked_at is null""",
            (tenant_id, actor_id),
        )
        cur.execute(
            """update kavriva_e5.current_grants
               set revoked_at = clock_timestamp()
               where tenant_id = %s and actor_id = %s and revoked_at is null""",
            (tenant_id, actor_id),
        )
