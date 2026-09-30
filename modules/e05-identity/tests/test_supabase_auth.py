"""The Auth adapter treats provider verification as required, not JWT text."""

import base64
import json
import sys
import unittest
from datetime import datetime, timedelta, timezone
from pathlib import Path
from urllib.error import HTTPError, URLError


E5 = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(E5 / "public"))
sys.path.insert(0, str(E5 / "internal"))
from principal import AuthenticationFailure  # noqa: E402
from supabase_auth import SupabaseAuth  # noqa: E402


ACTOR = "11111111-1111-4111-8111-111111111111"
SESSION = "22222222-2222-4222-8222-222222222222"
ISSUER = "https://project.supabase.co/auth/v1"


def token(**overrides):
    claims = {
        "iss": ISSUER, "aud": "authenticated", "sub": ACTOR,
        "session_id": SESSION, "aal": "aal1",
        "exp": int((datetime.now(timezone.utc) + timedelta(hours=1)).timestamp()),
    }
    claims.update(overrides)
    body = base64.urlsafe_b64encode(json.dumps(claims).encode()).decode().rstrip("=")
    return "header." + body + ".signature"


class Response:
    status = 200

    def __init__(self, body):
        self.body = body

    def __enter__(self):
        return self

    def __exit__(self, *_):
        return False

    def read(self, limit):
        return self.body


class Provider:
    def __init__(self, user=None, error=None):
        self.user = user if user is not None else {"id": ACTOR, "is_anonymous": False}
        self.error = error
        self.last_request = None

    def open(self, request, timeout):
        self.last_request = request
        if self.error:
            raise self.error
        return Response(json.dumps(self.user).encode())


class AuthTests(unittest.TestCase):
    def setUp(self):
        self.auth = SupabaseAuth("https://project.supabase.co", "publishable-key", ISSUER)
        self.provider = Provider()
        self.auth._opener = self.provider  # only the provider HTTP response is simulated

    def test_verified_provider_user_binds_token_subject_and_session(self):
        bearer = token()
        principal = self.auth.verify(bearer)
        self.assertEqual((principal.actor_id, principal.session_id), (ACTOR, SESSION))
        self.assertEqual(self.provider.last_request.full_url, ISSUER + "/user")
        self.assertEqual(self.provider.last_request.get_header("Authorization"),
                         "Bearer " + bearer)

    def test_invalid_provider_response_never_trusts_claims(self):
        self.provider.error = HTTPError(ISSUER + "/user", 401, "unauthorized", {}, None)
        with self.assertRaises(AuthenticationFailure) as caught:
            self.auth.verify(token())
        self.assertEqual(caught.exception.reason_code, "TOKEN_REJECTED")

    def test_auth_outage_holds(self):
        self.provider.error = URLError("service unavailable")
        with self.assertRaises(AuthenticationFailure) as caught:
            self.auth.verify(token())
        self.assertTrue(caught.exception.unavailable)

    def test_anonymous_or_mismatched_identity_denies(self):
        for user, bearer in (
            ({"id": ACTOR, "is_anonymous": True}, token()),
            ({"id": ACTOR, "is_anonymous": False}, token(sub=SESSION)),
            ({"id": ACTOR, "is_anonymous": False}, token(iss="https://other.example")),
            ({"id": ACTOR, "is_anonymous": False}, token(exp=1)),
        ):
            with self.subTest(user=user, bearer=bearer):
                self.provider.user = user
                with self.assertRaises(AuthenticationFailure):
                    self.auth.verify(bearer)

    def test_http_origin_cannot_be_selected_by_request(self):
        for origin in ("http://project.supabase.co", "https://user:pass@example.com",
                       "https://project.supabase.co/other"):
            with self.subTest(origin=origin), self.assertRaises(ValueError):
                SupabaseAuth(origin, "publishable-key", ISSUER)
