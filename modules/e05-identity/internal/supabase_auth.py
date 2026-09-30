"""Supabase Auth /user adapter for the consumer maintenance API.

The same bearer token is sent to Auth for verification before any JWT payload
field is used. The payload supplies only session lookup hints; E5 grants,
policy, epoch and the provider session are re-read in the commit transaction.
"""

from __future__ import annotations

import base64
import json
from datetime import datetime, timezone
from urllib.error import HTTPError, URLError
from urllib.parse import urlsplit
from urllib.request import HTTPRedirectHandler, Request, build_opener
from uuid import UUID

from principal import AuthenticationFailure, Principal


class _NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def _uuid(value: object) -> str:
    try:
        return str(UUID(str(value)))
    except (TypeError, ValueError, AttributeError) as exc:
        raise AuthenticationFailure("IDENTITY_INVALID") from exc


def _payload(token: str) -> dict:
    try:
        encoded = token.split(".")[1]
        raw = base64.urlsafe_b64decode(encoded + "=" * (-len(encoded) % 4))
        value = json.loads(raw)
    except (IndexError, ValueError, UnicodeDecodeError) as exc:
        raise AuthenticationFailure("TOKEN_INVALID") from exc
    if not isinstance(value, dict):
        raise AuthenticationFailure("TOKEN_INVALID")
    return value


class SupabaseAuth:
    def __init__(
        self, api_url: str, publishable_key: str, issuer: str,
        *, allow_local_http: bool = False,
    ) -> None:
        parsed = urlsplit(api_url)
        local_http = (allow_local_http and parsed.scheme == "http" and
                      parsed.hostname in ("127.0.0.1", "localhost", "::1"))
        if ((parsed.scheme != "https" and not local_http) or
                not parsed.hostname or parsed.username or parsed.password):
            raise ValueError("Auth API URL must be a trusted HTTPS origin")
        if parsed.path not in ("", "/") or parsed.query or parsed.fragment:
            raise ValueError("Auth API URL must be an origin")
        if not publishable_key or not issuer:
            raise ValueError("Auth project configuration is incomplete")
        self._url = api_url.rstrip("/") + "/auth/v1/user"
        self._key = publishable_key
        self._issuer = issuer
        self._opener = build_opener(_NoRedirect())

    def verify(self, access_token: str) -> Principal:
        if (not isinstance(access_token, str) or len(access_token) > 8192 or
                access_token.count(".") != 2 or any(c.isspace() for c in access_token)):
            raise AuthenticationFailure("TOKEN_INVALID")
        request = Request(self._url, headers={
            "apikey": self._key,
            "Authorization": "Bearer " + access_token,
            "Accept": "application/json",
        })
        try:
            with self._opener.open(request, timeout=5) as response:
                if response.status != 200:
                    raise AuthenticationFailure("AUTH_UNAVAILABLE", unavailable=True)
                body = response.read(65537)
        except HTTPError as exc:
            if exc.code in (400, 401, 403):
                raise AuthenticationFailure("TOKEN_REJECTED") from exc
            raise AuthenticationFailure("AUTH_UNAVAILABLE", unavailable=True) from exc
        except (URLError, TimeoutError, OSError) as exc:
            raise AuthenticationFailure("AUTH_UNAVAILABLE", unavailable=True) from exc
        if len(body) > 65536:
            raise AuthenticationFailure("AUTH_UNAVAILABLE", unavailable=True)
        try:
            user = json.loads(body)
        except (ValueError, UnicodeDecodeError) as exc:
            raise AuthenticationFailure("AUTH_UNAVAILABLE", unavailable=True) from exc
        if not isinstance(user, dict) or user.get("is_anonymous") is not False:
            raise AuthenticationFailure("PROFILE_REQUIRED")
        actor_id = _uuid(user.get("id"))
        claims = _payload(access_token)
        if claims.get("iss") != self._issuer or claims.get("aud") != "authenticated":
            raise AuthenticationFailure("ISSUER_MISMATCH")
        if _uuid(claims.get("sub")) != actor_id:
            raise AuthenticationFailure("ACTOR_MISMATCH")
        session_id = _uuid(claims.get("session_id"))
        exp = claims.get("exp")
        if not isinstance(exp, int) or isinstance(exp, bool):
            raise AuthenticationFailure("TOKEN_INVALID")
        try:
            expires_at = datetime.fromtimestamp(exp, timezone.utc)
        except (OverflowError, OSError, ValueError) as exc:
            raise AuthenticationFailure("TOKEN_INVALID") from exc
        if expires_at <= datetime.now(timezone.utc):
            raise AuthenticationFailure("TOKEN_EXPIRED")
        if claims.get("aal") not in ("aal1", "aal2"):
            raise AuthenticationFailure("ASSURANCE_UNKNOWN")
        # AAL2 by itself does not meet privileged phishing-resistant requirements.
        return Principal(actor_id, session_id, self._issuer, expires_at, "STANDARD")
