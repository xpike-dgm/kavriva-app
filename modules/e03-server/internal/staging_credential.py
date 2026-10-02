"""Explicitly reviewed nonproduction operator; never a product API entrypoint.

Requires source/operation T3 review and green CI before invocation. Windows
Credential Manager is preparation custody, not deployed/production custody.
Reads an existing public publishable key from stdin, never an admin API key.
No credential, SCRAM verifier, DSN, HTTP/error body is emitted or written to a
plaintext file. Only closed nonsecret operation outcomes are printed.
"""

import base64
import copy
import ctypes
import hashlib
import hmac
import json
import os
import re
import secrets
import sys
from ctypes import wintypes
from urllib.request import Request, HTTPRedirectHandler, build_opener

from psycopg.conninfo import make_conninfo
from environment_binding import CATALOG, bind_environment, validate_database_identity

PROJECT = "tmcitwyzoahtvysxblty"
ROLE = "kavriva_staging_api"
TARGET = "Kavriva:staging:database:v1"


class _Credential(ctypes.Structure):
    _fields_ = [("Flags", wintypes.DWORD), ("Type", wintypes.DWORD),
        ("TargetName", wintypes.LPWSTR), ("Comment", wintypes.LPWSTR),
        ("LastWritten", wintypes.FILETIME), ("CredentialBlobSize", wintypes.DWORD),
        ("CredentialBlob", ctypes.POINTER(ctypes.c_ubyte)), ("Persist", wintypes.DWORD),
        ("AttributeCount", wintypes.DWORD), ("Attributes", ctypes.c_void_p),
        ("TargetAlias", wintypes.LPWSTR), ("UserName", wintypes.LPWSTR)]


class _Store:
    def __init__(self):
        self.lib = ctypes.WinDLL("advapi32", use_last_error=True)
        self.lib.CredReadW.argtypes = [wintypes.LPCWSTR, wintypes.DWORD,
            wintypes.DWORD, ctypes.POINTER(ctypes.POINTER(_Credential))]
        self.lib.CredReadW.restype = wintypes.BOOL
        self.lib.CredWriteW.argtypes = [ctypes.POINTER(_Credential), wintypes.DWORD]
        self.lib.CredWriteW.restype = wintypes.BOOL
        self.lib.CredFree.argtypes = [ctypes.c_void_p]
        self.lib.CredDeleteW.argtypes = [wintypes.LPCWSTR, wintypes.DWORD, wintypes.DWORD]
        self.lib.CredDeleteW.restype = wintypes.BOOL

    def read(self, target):
        ptr = ctypes.POINTER(_Credential)()
        if not self.lib.CredReadW(target, 1, 0, ctypes.byref(ptr)):
            if ctypes.get_last_error() == 1168:  # ERROR_NOT_FOUND
                return None
            raise ValueError("CUSTODY_UNAVAILABLE")
        try:
            raw = ctypes.string_at(ptr.contents.CredentialBlob, ptr.contents.CredentialBlobSize)
            return raw.decode("utf-16-le").rstrip("\0")
        finally:
            self.lib.CredFree(ptr)

    def create(self, value):
        if self.read(TARGET) is not None:
            raise ValueError("CUSTODY_TARGET_EXISTS")
        raw = value.encode("utf-16-le")
        buf = (ctypes.c_ubyte * len(raw)).from_buffer_copy(raw)
        cred = _Credential()
        cred.Type, cred.Persist, cred.TargetName = 1, 2, TARGET
        cred.UserName = ROLE
        cred.Comment = "T-E3-032 nonproduction scoped database preparation"
        cred.CredentialBlobSize, cred.CredentialBlob = len(raw), buf
        if not self.lib.CredWriteW(ctypes.byref(cred), 0):
            raise ValueError("CUSTODY_WRITE_FAILED")
        if self.read(TARGET) != value:
            raise ValueError("CUSTODY_READBACK_FAILED")

    def delete(self):
        if not self.lib.CredDeleteW(TARGET, 1, 0) or self.read(TARGET) is not None:
            raise ValueError("CUSTODY_CLEANUP_UNCONFIRMED")


class _NoRedirect(HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


def _http(method, url, headers, body=None):
    request = Request(url, headers=headers, method=method,
                      data=None if body is None else json.dumps(body).encode())
    with build_opener(_NoRedirect()).open(request, timeout=20) as response:
        return json.loads(response.read() or b"null")


def _api(token, method, path, body=None):
    return _http(method, "https://api.supabase.com/v1/projects/" + PROJECT + path,
                 {"Authorization": "Bearer " + token, "Content-Type": "application/json"}, body)


def _reserved(token):
    defense = _api(token, "POST", "/database/query", {"query": """
        select count(*) = 14 and bool_and(c.relrowsecurity)
            and bool_and(not has_schema_privilege('anon', n.oid, 'USAGE'))
            and bool_and(not has_schema_privilege('authenticated', n.oid, 'USAGE'))
            and bool_and(not has_table_privilege('anon', c.oid, 'SELECT,INSERT,UPDATE,DELETE'))
            and bool_and(not has_table_privilege('authenticated', c.oid, 'SELECT,INSERT,UPDATE,DELETE'))
            as defense_ready
        from pg_class c join pg_namespace n on n.oid=c.relnamespace
        where n.nspname in ('kavriva_e3','kavriva_e5','kavriva_audit') and c.relkind='r'
    """})
    if defense != [{"defense_ready": True}]:
        raise ValueError("RESERVED_ROLE_UNBOUNDED")
    rows = _api(token, "POST", "/database/query", {"query": """
        select rolname, rolcanlogin, rolinherit, rolsuper, rolcreaterole,
               rolcreatedb, rolreplication, rolbypassrls
        from pg_roles where pg_has_role('kavriva_staging_api', oid, 'MEMBER')
    """})
    if not isinstance(rows, list) or {r["rolname"] for r in rows} != {ROLE, "kavriva_consumer_api"}:
        raise ValueError("RESERVED_ROLE_UNBOUNDED")
    for row in rows:
        if (row["rolcanlogin"] or not row["rolinherit"] or any(row[k] for k in
            ("rolsuper", "rolcreaterole", "rolcreatedb", "rolreplication", "rolbypassrls"))):
            raise ValueError("RESERVED_ROLE_UNBOUNDED")


def scram_verifier(password):
    """PostgreSQL SCRAM-SHA-256 format; fresh ASCII secret avoids SASLprep ambiguity."""
    salt = secrets.token_bytes(16)
    salted = hashlib.pbkdf2_hmac("sha256", password.encode("ascii"), salt, 4096)
    stored = hashlib.sha256(hmac.digest(salted, b"Client Key", "sha256")).digest()
    server = hmac.digest(salted, b"Server Key", "sha256")
    encode = lambda value: base64.b64encode(value).decode("ascii")
    return "SCRAM-SHA-256$4096:" + encode(salt) + "$" + encode(stored) + ":" + encode(server)


def issue(public_key):
    if any(name.startswith("PG") for name in os.environ):
        raise ValueError("ENV_OVERRIDE_HELD")
    if not re.fullmatch(r"sb_publishable_[A-Za-z0-9_-]+", public_key):
        raise ValueError("PUBLIC_KEY_UNAVAILABLE")
    store = _Store()
    token = store.read("Supabase CLI:supabase")
    if not token or not token.startswith("sbp_"):
        raise ValueError("ADMIN_CONNECTION_UNAVAILABLE")
    if store.read(TARGET) is not None:
        raise ValueError("CUSTODY_TARGET_EXISTS")
    _reserved(token)
    catalog = copy.deepcopy(json.loads(CATALOG.read_text(encoding="utf-8")))
    item = catalog["environments"]["staging"]
    if (item["project_id"] != PROJECT or item["database_connection"] != "session"
            or item["database_host"] != "aws-1-eu-west-1.pooler.supabase.com"):
        raise ValueError("TARGET_IDENTITY_MISMATCH")
    password = secrets.token_urlsafe(48)
    dsn = make_conninfo(host=item["database_host"], port="5432", dbname="postgres",
        user=ROLE + "." + PROJECT, password=password, sslmode="verify-full",
        sslrootcert="system", connect_timeout="10")
    verifier = scram_verifier(password)
    catalog["environments"]["staging"]["state"] = "BOUND"
    env = {"KAVRIVA_ENVIRONMENT": "staging", item["dsn_ref"]: dsn, item["key_ref"]: public_key}
    bind_environment(env, catalog)  # Candidate proof, not shipped activation.
    # Validate controlled origin before sending even a public publishable key.
    _http("GET", item["api_url"] + "/auth/v1/settings", {"apikey": public_key})
    store.create(dsn)
    try:
        query = "alter role kavriva_staging_api login password '" + verifier + "';"
        _api(token, "POST", "/database/migrations",
             {"name": "e3_staging_runtime_credential_v1", "query": query})
        # Retrieve only the selected scoped target; never the admin as app input.
        env[item["dsn_ref"]] = store.read(TARGET)
        validate_database_identity(bind_environment(env, catalog))
    except Exception:
        # An uncertain issuance is fenced, not blindly reissued or weakened.
        try:
            _api(token, "POST", "/database/migrations", {"name": "e3_staging_runtime_credential_v1_hold",
                "query": "alter role kavriva_staging_api nologin;"})
            rows = _api(token, "POST", "/database/query", {"query":
                "select rolcanlogin from pg_roles where rolname='kavriva_staging_api'"})
            if rows != [{"rolcanlogin": False}]:
                raise ValueError("ISSUANCE_CLEANUP_UNCONFIRMED")
            store.delete()
        except Exception:
            raise ValueError("ISSUANCE_CLEANUP_UNCONFIRMED") from None
        raise ValueError("ISSUANCE_HELD_CLEANUP_VERIFIED") from None
    return {"result": "SCOPED_STAGING_IDENTITY_VERIFIED", "project": PROJECT,
            "database_role": ROLE, "credential_ref": TARGET,
            "tls": "verify-full/system", "role_preflight": "PASS",
            "store_write_readback": "PASS", "deployment": "HELD", "production": "HELD"}


if __name__ == "__main__":
    try:
        print(json.dumps(issue(sys.stdin.readline().strip())))
    except Exception as exc:
        allowed = {"PUBLIC_KEY_UNAVAILABLE", "CUSTODY_UNAVAILABLE", "CUSTODY_TARGET_EXISTS",
            "CUSTODY_WRITE_FAILED", "CUSTODY_READBACK_FAILED", "ADMIN_CONNECTION_UNAVAILABLE",
            "RESERVED_ROLE_UNBOUNDED", "TARGET_IDENTITY_MISMATCH",
            "ISSUANCE_CLEANUP_UNCONFIRMED", "ISSUANCE_HELD_CLEANUP_VERIFIED", "ENV_OVERRIDE_HELD"}
        reason = str(exc) if isinstance(exc, ValueError) and str(exc) in allowed else "OPERATION_HELD"
        print(json.dumps({"result": "HELD", "reason": reason}))
        sys.exit(1)
