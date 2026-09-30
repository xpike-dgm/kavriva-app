"""Verified consumer identity passed to Kavriva authorization.

Authentication proves a person and a provider session. It never grants a
Kavriva action by itself. The session is checked again in PostgreSQL when the
product effect commits.
"""

from __future__ import annotations

from dataclasses import dataclass
from datetime import datetime


@dataclass(frozen=True)
class Principal:
    actor_id: str
    session_id: str
    issuer_id: str
    expires_at: datetime
    assurance: str


class AuthenticationFailure(Exception):
    def __init__(self, reason_code: str, *, unavailable: bool = False) -> None:
        super().__init__(reason_code)
        self.reason_code = reason_code
        self.unavailable = unavailable
