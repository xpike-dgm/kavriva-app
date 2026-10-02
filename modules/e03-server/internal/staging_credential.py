"""Read-only inspection of separately provisioned nonproduction credentials.

Credential issuance is HELD: a password/verifier must never be serialized into
provider migration history. This operator cannot create or activate an account,
write/delete credential custody, rotate passwords, or deploy an API.
"""

import copy
import ctypes
import json
import os
import sys
from ctypes import wintypes

from environment_binding import (CATALOG, bind_environment, validate_database_identity,
                                 _validate_catalog)

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
    def read(self, target):
        if target != TARGET:
            raise ValueError("CUSTODY_TARGET_MISMATCH")
        lib = ctypes.WinDLL("advapi32", use_last_error=True)
        lib.CredReadW.argtypes = [wintypes.LPCWSTR, wintypes.DWORD,
            wintypes.DWORD, ctypes.POINTER(ctypes.POINTER(_Credential))]
        lib.CredReadW.restype = wintypes.BOOL
        lib.CredFree.argtypes = [ctypes.c_void_p]
        ptr = ctypes.POINTER(_Credential)()
        if not lib.CredReadW(TARGET, 1, 0, ctypes.byref(ptr)):
            if ctypes.get_last_error() == 1168:
                return None
            raise ValueError("CUSTODY_UNAVAILABLE")
        try:
            raw = ctypes.string_at(ptr.contents.CredentialBlob, ptr.contents.CredentialBlobSize)
            return raw.decode("utf-16-le").rstrip("\0")
        finally:
            lib.CredFree(ptr)


def issue(public_key):
    # Fail before reading any privileged credential or contacting the provider.
    raise ValueError("SECURE_ISSUANCE_CHANNEL_HELD")


def inspect(public_key):
    if any(name.startswith("PG") or name in
           {"SSL_CERT_FILE", "SSL_CERT_DIR", "OPENSSL_CONF", "SSLKEYLOGFILE"}
           for name in os.environ):
        raise ValueError("ENV_OVERRIDE_HELD")
    catalog = copy.deepcopy(json.loads(CATALOG.read_text(encoding="utf-8")))
    _validate_catalog(catalog)
    item = catalog["environments"]["staging"]
    if (item["project_id"] != PROJECT or item["database_role"] != ROLE
            or item["database_connection"] != "session"
            or item["database_host"] != "aws-1-eu-west-1.pooler.supabase.com"):
        raise ValueError("TARGET_IDENTITY_MISMATCH")
    dsn = _Store().read(TARGET)
    if not dsn:
        raise ValueError("CUSTODY_TARGET_UNAVAILABLE")
    item["state"] = "BOUND"  # Read-only proof candidate; checked-in realm remains HELD.
    selected = {"KAVRIVA_ENVIRONMENT": "staging", item["dsn_ref"]: dsn,
                item["key_ref"]: public_key}
    binding = bind_environment(selected, catalog)
    validate_database_identity(binding)
    return {"result": "SCOPED_STAGING_ROLE_INSPECTED", "project": PROJECT,
            "database_role": ROLE, "credential_ref": TARGET,
            "tls": "verify-full/pinned-provider-ca", "role_preflight": "PASS",
            "complete_effective_acl": "UNVERIFIED", "physical_custody": "UNVERIFIED",
            "deployment": "HELD", "production": "HELD"}


if __name__ == "__main__":
    try:
        print(json.dumps(inspect(sys.stdin.readline().strip())))
    except Exception:
        print(json.dumps({"result": "HELD", "reason_code": "STAGING_INSPECTION_UNAVAILABLE"}))
        sys.exit(1)
