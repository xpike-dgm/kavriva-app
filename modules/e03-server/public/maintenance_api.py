"""Small bearer-only WSGI boundary for consumer maintenance commands.

All identity and database configuration comes from the server environment.
Clients cannot select an actor, tenant, grant, policy verdict or audit state.
The deployment runtime may change without changing the command protocol.
"""

from __future__ import annotations

import json
import os
from datetime import date
from functools import lru_cache
from io import BytesIO

from commit_authorization import CommitResult, Verdict
from maintenance_command import MaintenanceCommand, MaintenanceCommands
from maintenance_store import CREATE, EDIT
from supabase_auth import SupabaseAuth


_MAX_BODY = 16384
_CREATE_FIELDS = {
    "target_id", "operation_id", "expected_generation",
    "expected_policy_version", "client_generation", "performed_on",
    "odometer_km", "outcome", "safety_notes",
}
_EDIT_FIELDS = (_CREATE_FIELDS - {"target_id"}) | {"correction_reason"}


def _unique_object(pairs):
    value = {}
    for key, item in pairs:
        if key in value:
            raise ValueError("duplicate JSON field")
        value[key] = item
    return value


def _body(environ):
    if environ.get("HTTP_TRANSFER_ENCODING"):
        raise ValueError("transfer encoding is unsupported")
    if environ.get("CONTENT_TYPE", "").split(";", 1)[0].strip() != "application/json":
        raise ValueError("JSON content type required")
    try:
        length = int(environ.get("CONTENT_LENGTH", ""))
    except (ValueError, TypeError) as exc:
        raise ValueError("content length required") from exc
    if length < 0 or length > _MAX_BODY:
        raise ValueError("body size invalid")
    raw = environ.get("wsgi.input", BytesIO()).read(length)
    if len(raw) != length:
        raise ValueError("body truncated")
    value = json.loads(raw, object_pairs_hook=_unique_object)
    if not isinstance(value, dict):
        raise ValueError("object required")
    return value


def _command(value, action, target_id=None):
    if set(value) != (_CREATE_FIELDS if action == CREATE else _EDIT_FIELDS):
        raise ValueError("unexpected or missing field")
    return MaintenanceCommand(
        action=action, target_id=value["target_id"] if action == CREATE else target_id,
        operation_id=value["operation_id"],
        expected_generation=value["expected_generation"],
        expected_policy_version=value["expected_policy_version"],
        client_generation=value["client_generation"],
        performed_on=date.fromisoformat(value["performed_on"]),
        odometer_km=value["odometer_km"], outcome=value["outcome"],
        safety_notes=value["safety_notes"],
        correction_reason=value.get("correction_reason"),
    )


def _response(start_response, result: CommitResult):
    if result.verdict == Verdict.ALLOW:
        status = ("200 OK" if result.reason_code == "ALREADY_COMMITTED"
                  else "201 Created")
    elif result.verdict == Verdict.OUTCOME_UNKNOWN:
        status = "202 Accepted"
    elif result.reason_code in ("AUTH_UNAVAILABLE", "CURRENT_AUTHORITY_UNAVAILABLE"):
        status = "503 Service Unavailable"
    elif result.reason_code in ("REQUEST_INCOMPLETE", "TOKEN_INVALID"):
        status = "400 Bad Request"
    elif result.reason_code in ("TOKEN_REJECTED", "TOKEN_EXPIRED",
                                "SESSION_NOT_CURRENT"):
        status = "401 Unauthorized"
    elif result.verdict == Verdict.HELD:
        status = "409 Conflict"
    else:
        status = "403 Forbidden"
    payload = {"verdict": result.verdict.value, "reason_code": result.reason_code}
    effect = result.effect_result
    if effect is not None:
        if hasattr(effect, "record_id"):
            payload.update(record_id=effect.record_id, generation=effect.generation)
        elif hasattr(effect, "motorcycle_id"):
            payload.update(motorcycle_id=effect.motorcycle_id,
                           policy_version=1, motorcycle_generation=1)
    encoded = json.dumps(payload, separators=(",", ":")).encode("utf-8")
    start_response(status, [
        ("Content-Type", "application/json; charset=utf-8"),
        ("Content-Length", str(len(encoded))),
        ("Cache-Control", "no-store"),
        ("X-Content-Type-Options", "nosniff"),
    ])
    return [encoded]


def create_app(commands: MaintenanceCommands):
    def app(environ, start_response):
        if environ.get("HTTP_COOKIE"):
            return _response(start_response, CommitResult(Verdict.DENY,
                                                           "COOKIE_AUTH_UNSUPPORTED"))
        header = environ.get("HTTP_AUTHORIZATION", "")
        if not header.startswith("Bearer ") or header.count(" ") != 1:
            return _response(start_response, CommitResult(Verdict.DENY,
                                                           "TOKEN_REJECTED"))
        token = header[7:]
        path = environ.get("PATH_INFO", "")
        method = environ.get("REQUEST_METHOD", "")
        try:
            if method == "POST" and path == "/v1/consumer/enroll":
                if _body(environ):
                    raise ValueError("enrollment has no client-selected fields")
                result = commands.enroll(token)
            elif method == "POST" and path == "/v1/maintenance/records":
                result = commands.execute(token, _command(_body(environ), CREATE))
            elif (method == "POST" and path.startswith("/v1/maintenance/records/")
                  and path.endswith("/corrections")):
                target_id = path[len("/v1/maintenance/records/"):-len("/corrections")]
                result = commands.execute(
                    token, _command(_body(environ), EDIT, target_id),
                )
            elif method == "GET" and path.startswith("/v1/operations/"):
                result = commands.lookup(token, path[len("/v1/operations/"):])
            else:
                start_response("404 Not Found", [
                    ("Content-Type", "application/json"),
                    ("Cache-Control", "no-store"),
                ])
                return [b'{"reason_code":"ROUTE_NOT_FOUND"}']
        except (ValueError, TypeError, KeyError, json.JSONDecodeError):
            result = CommitResult(Verdict.DENY, "REQUEST_INCOMPLETE")
        return _response(start_response, result)
    return app


@lru_cache(maxsize=1)
def _configured_app():
    return create_app(MaintenanceCommands(
        os.environ["KAVRIVA_DATABASE_DSN"],
        SupabaseAuth(
            os.environ["SUPABASE_URL"],
            os.environ["SUPABASE_PUBLISHABLE_KEY"],
            os.environ["SUPABASE_ISSUER"],
        ),
    ))


def application(environ, start_response):
    """WSGI entrypoint; configuration failure never enables a fallback."""
    try:
        app = _configured_app()
    except (KeyError, ValueError):
        return _response(start_response, CommitResult(Verdict.HELD,
                                                       "CURRENT_AUTHORITY_UNAVAILABLE"))
    return app(environ, start_response)
