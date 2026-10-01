"""Negative probes against an isolated Supabase stack with a real private bucket.

The fixture exists only in CI's local containers. No hosted project is changed.
Do not print the CLI status JSON: it contains server credentials.
"""

from __future__ import annotations

import base64
import json
import sys
from pathlib import Path
from urllib.error import HTTPError
from urllib.request import Request, urlopen
from uuid import uuid4

import psycopg


PNG = base64.b64decode(
    "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAwMCAO+/lXcAAAAASUVORK5CYII="
)


def request(url, key, method="GET", payload=None, token=None, content_type=None,
            extra_headers=None):
    headers = {"apikey": key}
    headers.update(extra_headers or {})
    if token:
        headers["Authorization"] = "Bearer " + token
    if payload is not None:
        headers["Content-Type"] = content_type or "application/json"
        if not isinstance(payload, bytes):
            payload = json.dumps(payload).encode()
    req = Request(url, data=payload, method=method, headers=headers)
    try:
        with urlopen(req, timeout=20) as response:
            return response.status, response.read()
    except HTTPError as error:
        return error.code, error.read()


def assert_success(result, label):
    if not 200 <= result[0] < 300:
        raise AssertionError(f"{label}: expected success, got HTTP {result[0]}")


def assert_blocked(result, label, secret=b""):
    status, body = result
    if status < 400 or secret and secret in body:
        raise AssertionError(f"{label}: direct path was not blocked (HTTP {status})")


def signup(api_url, key):
    result = request(
        api_url + "/auth/v1/signup", key, method="POST",
        payload={"email": "bypass-" + uuid4().hex + "@example.test",
                 "password": "LocalOnly-" + uuid4().hex},
    )
    assert_success(result, "local signup")
    return json.loads(result[1])["access_token"]


def main(status_path):
    status = json.loads(Path(status_path).read_text(encoding="utf-8"))
    api_url = status["API_URL"].rstrip("/")
    db_url = status["DB_URL"]
    anon = status["ANON_KEY"]
    service = status["SERVICE_ROLE_KEY"]
    bucket = "negative-fixture-" + uuid4().hex
    object_path = "actor-a/private.png"
    new_path = "actor-b/unauthorized.png"
    secret = PNG
    storage = api_url + "/storage/v1"

    actor_a = signup(api_url, anon)
    actor_b = signup(api_url, anon)
    assert_success(
        request(storage + "/bucket", service, "POST",
                {"id": bucket, "name": bucket, "public": False}, service),
        "private bucket fixture",
    )
    with psycopg.connect(db_url) as conn:
        row = conn.execute("select public from storage.buckets where id = %s",
                           (bucket,)).fetchone()
        if row != (False,):
            raise AssertionError("fixture bucket is not private")
        for role in ("anon", "authenticated"):
            if conn.execute("select pg_has_role(%s, 'kavriva_consumer_api', 'member')",
                            (role,)).fetchone()[0]:
                raise AssertionError("client role acquired the server database role")

    object_url = storage + "/object/" + bucket + "/" + object_path
    assert_success(request(object_url, service, "POST", secret, service,
                           "image/png"), "server fixture upload")
    authenticated_url = storage + "/object/authenticated/" + bucket + "/" + object_path
    server_read = request(authenticated_url, service, token=service)
    assert_success(server_read, "server fixture read")
    if server_read[1] != secret:
        raise AssertionError("fixture read did not return the expected private bytes")

    for label, key, token in (
        ("anonymous", anon, None),
        ("actor A", anon, actor_a),
        ("actor B", anon, actor_b),
    ):
        assert_blocked(request(authenticated_url, key, token=token),
                       label + " private download", secret)
        assert_blocked(
            request(storage + "/render/image/authenticated/" + bucket +
                    "/" + object_path + "?width=1", key, token=token),
            label + " transformed private image", secret,
        )
        listed = request(storage + "/object/list/" + bucket, key, "POST",
                         {"prefix": "", "limit": 100}, token)
        if 200 <= listed[0] < 300:
            if object_path.encode() in listed[1] or new_path.encode() in listed[1]:
                raise AssertionError(label + " listed a private object")
        elif listed[0] < 400:
            raise AssertionError(label + " list returned an unexpected response")
        assert_blocked(request(storage + "/object/sign/" + bucket + "/" +
                               object_path, key, "POST", {"expiresIn": 60},
                               token), label + " signed URL issuance")
        assert_blocked(request(storage + "/object/" + bucket + "/" + new_path,
                               key, "POST", b"unauthorized", token,
                               "image/png"), label + " direct upload")
        deleted = request(storage + "/object/" + bucket, key, "DELETE",
                          {"prefixes": [object_path]}, token)
        if 200 <= deleted[0] < 300:
            # Storage may report 200 with [] when RLS hides the target row.
            if json.loads(deleted[1] or b"[]") != []:
                raise AssertionError(label + " deleted a private object")
        elif deleted[0] < 400:
            raise AssertionError(label + " delete returned an unexpected response")
        if request(authenticated_url, service, token=service)[1] != secret:
            raise AssertionError(label + " changed the private object")

    assert_blocked(request(storage + "/object/public/" + bucket + "/" +
                           object_path, anon), "public URL", secret)
    assert_blocked(request(storage + "/render/image/public/" + bucket + "/" +
                           object_path + "?width=1", anon),
                   "public transformed image", secret)
    assert_blocked(request(storage + "/object/authenticated/" + bucket +
                           "/" + new_path, service, token=service),
                   "unauthorized upload absent")
    assert_success(request(authenticated_url, service, token=service),
                   "private object survives client delete attempts")

    for label, token in (("anonymous", None), ("actor A", actor_a),
                         ("actor B", actor_b)):
        for schema in ("kavriva_e3", "kavriva_e5", "kavriva_audit"):
            result = request(
                api_url + "/rest/v1/maintenance_records?select=*",
                anon, token=token, extra_headers={"Accept-Profile": schema},
            )
            assert_blocked(result, label + " Data API " + schema)

    print("isolated private Storage, Data API and client-role bypass probes: PASS")


if __name__ == "__main__":
    main(sys.argv[1])
