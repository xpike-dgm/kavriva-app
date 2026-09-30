"""E5 public boundary for verified consumer identity and current authority.

E3 calls these operations without reaching into E5 storage internals. The
private adapters may change without changing the E3 command contract.
"""

from __future__ import annotations

import psycopg

from decision import AuthorityRequest, Decision, Verdict, decide_current
from postgres_decision import PostgresCurrentAuthority
from postgres_identity_writer import (
    Enrollment, WORKLOAD, enroll_personal_tenant, grant_id,
    lock_provider_session, revoke_consumer, sync_session,
)
from supabase_auth import SupabaseAuth


def decide_current_on_connection(
    connection: psycopg.Connection, request: AuthorityRequest,
) -> Decision:
    """Evaluate E5 rows while E3 holds the product transaction open."""
    return decide_current(request, PostgresCurrentAuthority(connection))


__all__ = [
    "AuthorityRequest", "Decision", "Enrollment", "SupabaseAuth", "Verdict",
    "WORKLOAD", "decide_current_on_connection", "enroll_personal_tenant",
    "grant_id", "lock_provider_session", "revoke_consumer", "sync_session",
]
