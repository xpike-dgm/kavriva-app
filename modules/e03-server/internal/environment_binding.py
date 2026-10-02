"""Trusted server-only realm binding; no request fields or credential fallback."""

from __future__ import annotations

import base64
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Mapping

from psycopg.conninfo import conninfo_to_dict


CATALOG = Path(__file__).resolve().parents[3] / "supabase/environment-bindings.json"
_REALMS = {"development", "staging", "production"}
_FIELDS = {"state", "project_id", "api_url", "issuer", "database_host",
           "database_port", "database_name", "database_role", "dsn_ref", "key_ref"}
_DSN_FIELDS = {"host", "port", "dbname", "user", "password", "sslmode",
               "connect_timeout"}


@dataclass(frozen=True)
class EnvironmentBinding:
    realm: str
    api_url: str
    issuer: str
    allow_local_http: bool
    database_dsn: str = field(repr=False)
    publishable_key: str = field(repr=False)


def _invalid():
    # Do not include parser exceptions, URLs, DSNs or key material in errors.
    return ValueError("server environment binding unavailable")


def _unique(pairs):
    result = {}
    for key, value in pairs:
        if key in result:
            raise _invalid()
        result[key] = value
    return result


def _validate_catalog(catalog):
    if (not isinstance(catalog, dict) or set(catalog) != {"version", "environments"}
            or type(catalog["version"]) is not int or catalog["version"] != 1):
        raise _invalid()
    realms = catalog["environments"]
    if not isinstance(realms, dict) or set(realms) != _REALMS:
        raise _invalid()
    seen = {key: set() for key in ("project_id", "api_url", "issuer", "dsn_ref", "key_ref")}
    for realm, item in realms.items():
        if not isinstance(item, dict) or set(item) != _FIELDS:
            raise _invalid()
        prefix = "KAVRIVA_" + realm.upper()
        if (item["dsn_ref"] != prefix + "_DATABASE_DSN"
                or item["key_ref"] != prefix + "_SUPABASE_PUBLISHABLE_KEY"):
            raise _invalid()
        if item["state"] not in ("BOUND", "HELD"):
            raise _invalid()
        for key in seen:
            value = item[key]
            if value is not None:
                if not isinstance(value, str) or not value or value in seen[key]:
                    raise _invalid()
                seen[key].add(value)
        identity = [item[k] for k in ("project_id", "api_url", "issuer", "database_host",
                                     "database_port", "database_name", "database_role")]
        if all(v is None for v in identity) and item["state"] == "HELD":
            continue
        if (any(v is None for v in identity) or not all(isinstance(v, str) for v in identity)
                or item["database_name"] != "postgres"):
            raise _invalid()
        if realm == "development":
            if (item["project_id"] != "local-kavriva-app"
                    or item["api_url"] != "http://127.0.0.1:54321"
                    or item["database_host"] != "127.0.0.1"
                    or item["database_port"] != "54322"
                    or item["database_role"] != "kavriva_ci_api"):
                raise _invalid()
        else:
            ref = item["project_id"]
            if (not re.fullmatch(r"[a-z]{20}", ref)
                    or item["api_url"] != "https://" + ref + ".supabase.co"
                    or item["database_host"] != "db." + ref + ".supabase.co"
                    or item["database_port"] != "5432"
                    or item["database_role"] != "kavriva_" + realm + "_api"):
                raise _invalid()
        if item["issuer"] != item["api_url"] + "/auth/v1":
            raise _invalid()
    return realms


def bind_environment(environ: Mapping[str, str], catalog=None) -> EnvironmentBinding:
    """Validate the entire controlled catalog before reading selected secrets.

    The optional catalog is an explicit test dependency, never a process/request
    override. Only the checked-in catalog is used by the WSGI entrypoint.
    """
    try:
        if catalog is None:
            catalog = json.loads(CATALOG.read_text(encoding="utf-8"),
                                 object_pairs_hook=_unique)
        realms = _validate_catalog(catalog)
        if any(name.startswith("PG") for name in environ):
            # libpq PGHOSTADDR/PGSERVICE/PGOPTIONS/PGSSLMODE defaults can
            # override a checked DSN or inject session configuration.
            raise _invalid()
        realm = environ["KAVRIVA_ENVIRONMENT"]
        if realm not in _REALMS or realms[realm]["state"] != "BOUND":
            raise _invalid()
        item = realms[realm]
        dsn, key = environ[item["dsn_ref"]], environ[item["key_ref"]]
        if not isinstance(dsn, str) or not isinstance(key, str) or not key:
            raise _invalid()
        params = conninfo_to_dict(dsn)
        if (set(params) - _DSN_FIELDS or not params.get("password")
                or any(params.get(k) != item["database_" + v] for k, v in
                       (("host", "host"), ("port", "port"), ("dbname", "name"),
                        ("user", "role")))):
            raise _invalid()
        local = realm == "development"
        if params.get("sslmode") != ("disable" if local else "verify-full"):
            raise _invalid()
        # Explicit timeout prevents inheriting a libpq process default.
        if params.get("connect_timeout") != "10":
            raise _invalid()
        if local:
            parts = key.split(".")
            if len(parts) != 3:
                raise _invalid()
            claims = json.loads(base64.urlsafe_b64decode(
                parts[1] + "=" * (-len(parts[1]) % 4)))
            if not isinstance(claims, dict) or claims.get("role") != "anon":
                raise _invalid()
        elif not re.fullmatch(r"sb_publishable_[A-Za-z0-9_-]+", key):
            raise _invalid()
        return EnvironmentBinding(realm, item["api_url"], item["issuer"], local, dsn, key)
    except (KeyError, TypeError, ValueError, OSError, UnicodeError):
        raise _invalid() from None
    except Exception:
        # psycopg's conninfo parser has its own exception type; sanitize it too.
        raise _invalid() from None
