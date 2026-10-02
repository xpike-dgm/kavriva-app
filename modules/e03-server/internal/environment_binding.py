"""Trusted server-only realm binding; no request fields or credential fallback."""

from __future__ import annotations

import base64
import hashlib
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Mapping

import psycopg
from psycopg.conninfo import conninfo_to_dict


CATALOG = Path(__file__).resolve().parents[3] / "supabase/environment-bindings.json"
CA_FILE = CATALOG.parent / "certs/prod-ca-2021.crt"
CA_DIGEST = "700723581420dd1ac98fd7e9ac529f0ef210eadcaf87fc868a3ad7d114c2f3b7"
_REALMS = {"development", "staging", "production"}
_FIELDS = {"state", "project_id", "api_url", "issuer", "database_host",
           "database_port", "database_name", "database_role", "dsn_ref", "key_ref",
           "database_connection"}
_DSN_FIELDS = {"host", "port", "dbname", "user", "password", "sslmode",
               "connect_timeout", "sslrootcert"}


def _expected_access():
    """Canonical consumer grants from the reviewed live-authorization migration."""
    result = {("schema", name, "", "", "USAGE") for name in
              ("public", "kavriva_e3", "kavriva_e5", "kavriva_audit")}
    # Standard PostgreSQL PUBLIC connect/temporary privileges are not CREATE.
    # A new database or delegation/CREATE grant requires a reviewed new scope.
    result.update(("database", name, "", "", "CONNECT")
                  for name in ("postgres", "template0", "template1"))
    result.add(("database", "postgres", "", "", "TEMPORARY"))
    tables = {
        "kavriva_e5": ("consumer_enrollments", "actor_epochs", "current_grants",
                       "policy_heads", "policy_rules", "current_sessions"),
        "kavriva_e3": ("motorcycles", "maintenance_records", "maintenance_revisions",
                       "negative_floors", "operation_records"),
        "kavriva_audit": ("heads", "events"),
    }
    for schema, names in tables.items():
        result.update(("table", schema, name, "", grant)
                      for name in names for grant in ("SELECT", "INSERT"))
    result.add(("table", "kavriva_e3", "runtime_versions", "", "SELECT"))
    columns = {
        ("kavriva_e5", "current_sessions"): ("expires_at",),
        ("kavriva_e3", "motorcycles"): ("generation",),
        ("kavriva_e3", "maintenance_records"): ("generation",),
        ("kavriva_e3", "operation_records"): ("status", "record_id", "result_generation"),
        ("kavriva_audit", "heads"): ("last_sequence", "last_digest"),
    }
    for schema, names in (("kavriva_e5", ("consumer_enrollments", "actor_epochs",
                          "current_grants", "policy_heads", "policy_rules")),
                         ("kavriva_e3", ("negative_floors", "runtime_versions"))):
        for name in names:
            columns[(schema, name)] = (*columns.get((schema, name), ()), "lock_marker")
    for (schema, name), names in columns.items():
        result.update(("column", schema, name, column, "UPDATE") for column in names)
    result.add(("function", "kavriva_e5", "provider_session_current(uuid, uuid)", "", "EXECUTE"))
    return result


def _validate_access(conn):
    # Include PUBLIC and inherited grants, not just the two role labels. System
    # catalogs/builtins are provider machinery; every non-system usable schema
    # and callable relation/function must match the canonical consumer surface.
    rows = conn.execute("""
        with roles as (
            select oid from pg_roles where pg_has_role(current_user, oid, 'MEMBER')
            union all select 0::oid
        ), namespaces as (
            select * from pg_namespace where nspname not like 'pg\\_%' escape '\\'
                and nspname <> 'information_schema'
        )
        select 'schema', n.nspname, '', '', case when a.is_grantable then a.privilege_type || '/GRANT' else a.privilege_type end
        from namespaces n, lateral aclexplode(coalesce(n.nspacl, acldefault('n',n.nspowner))) a
        where a.grantee in (select oid from roles)
        union
        select 'database', d.datname, '', '',
               case when a.is_grantable then a.privilege_type || '/GRANT' else a.privilege_type end
        from pg_database d, lateral aclexplode(coalesce(d.datacl,acldefault('d',d.datdba))) a
        where a.grantee in (select oid from roles)
        union
        select 'table', n.nspname, c.relname, '', case when a.is_grantable then a.privilege_type || '/GRANT' else a.privilege_type end
        from pg_class c join namespaces n on n.oid=c.relnamespace,
             lateral aclexplode(coalesce(c.relacl, acldefault(
                 case when c.relkind='S' then 's'::"char" else 'r'::"char" end,c.relowner))) a
        where c.relkind in ('r','p','v','m','S','f') and a.grantee in (select oid from roles)
              and (a.grantee <> 0 or has_schema_privilege(current_user,n.oid,'USAGE'))
        union
        select 'column', n.nspname, c.relname, att.attname, case when a.is_grantable then a.privilege_type || '/GRANT' else a.privilege_type end
        from pg_attribute att join pg_class c on c.oid=att.attrelid
             join namespaces n on n.oid=c.relnamespace, lateral aclexplode(att.attacl) a
        where not att.attisdropped and a.grantee in (select oid from roles)
              and (a.grantee <> 0 or has_schema_privilege(current_user,n.oid,'USAGE'))
        union
        select 'function', n.nspname,
               p.proname || '(' || oidvectortypes(p.proargtypes) || ')', '', case when a.is_grantable then a.privilege_type || '/GRANT' else a.privilege_type end
        from pg_proc p join namespaces n on n.oid=p.pronamespace,
             lateral aclexplode(coalesce(p.proacl,acldefault('f',p.proowner))) a
        where a.grantee in (select oid from roles)
              and (a.grantee <> 0 or has_schema_privilege(current_user,n.oid,'USAGE'))
    """).fetchall()
    actual = {tuple(row) for row in rows}
    if actual != _expected_access():
        raise _invalid()


@dataclass(frozen=True)
class EnvironmentBinding:
    realm: str
    api_url: str
    issuer: str
    allow_local_http: bool
    database_dsn: str = field(repr=False)
    publishable_key: str = field(repr=False)


def validate_database_identity(binding: EnvironmentBinding):
    """Read-only preflight; a matching login label is not bounded custody proof.

    This checks current role configuration before constructing Auth/command
    clients. It does not authorize a product effect or replace commit-time E5
    and E3 checks, and no credential/version attestation is cached.
    """
    expected = ("kavriva_ci_api" if binding.realm == "development"
                else "kavriva_" + binding.realm + "_api")
    try:
        with psycopg.connect(binding.database_dsn) as conn:
            conn.execute("set transaction read only")
            actual = conn.execute("select current_user, current_database()").fetchone()
            if actual != (expected, "postgres"):
                raise _invalid()
            roles = conn.execute("""
                select rolname, rolcanlogin, rolinherit, rolsuper, rolcreaterole,
                       rolcreatedb, rolreplication, rolbypassrls
                from pg_roles where pg_has_role(current_user, oid, 'MEMBER')
            """).fetchall()
            if {r[0] for r in roles} != {expected, "kavriva_consumer_api"}:
                raise _invalid()
            for name, login, inherit, *privileged in roles:
                if any(privileged) or not inherit or login != (name == expected):
                    raise _invalid()
            delegation = conn.execute("""
                select exists (select 1 from pg_auth_members m
                    where pg_has_role(current_user,m.member,'MEMBER')
                    and (m.admin_option or
                         coalesce((to_jsonb(m)->>'inherit_option')::boolean,true) = false))
            """).fetchone()[0]
            if delegation:
                raise _invalid()
            owned = conn.execute("""
                select exists (select 1 from pg_shdepend
                    where refclassid='pg_authid'::regclass and deptype='o'
                    and refobjid in (select oid from pg_roles where rolname in (%s,%s)))
            """, (expected, "kavriva_consumer_api")).fetchone()[0]
            if owned:
                raise _invalid()
            _validate_access(conn)
            conn.rollback()
    except Exception:
        raise _invalid() from None


def _invalid():
    # Do not include parser exceptions, URLs, DSNs or key material in errors.
    return ValueError("server environment binding unavailable")


def provider_ca_file():
    """Only the independently reviewed public provider CA, never a DSN override."""
    if hashlib.sha256(CA_FILE.read_bytes().replace(b"\r\n", b"\n")).hexdigest() != CA_DIGEST:
        raise _invalid()
    return str(CA_FILE.resolve())


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
        if item["database_connection"] not in ("direct", "session"):
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
                    or item["database_connection"] != "direct"
                    or item["database_port"] != "54322"
                    or item["database_role"] != "kavriva_ci_api"):
                raise _invalid()
        else:
            ref = item["project_id"]
            if (not re.fullmatch(r"[a-z]{20}", ref)
                    or item["api_url"] != "https://" + ref + ".supabase.co"
                    or item["database_port"] != "5432"
                    or item["database_role"] != "kavriva_" + realm + "_api"):
                raise _invalid()
            if item["database_connection"] == "direct":
                if item["database_host"] != "db." + ref + ".supabase.co":
                    raise _invalid()
            elif not re.fullmatch(r"aws-[0-9]+-[a-z0-9-]+\.pooler\.supabase\.com",
                                  item["database_host"]):
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
        if any(name.startswith("PG") or name in
               {"SSL_CERT_FILE", "SSL_CERT_DIR", "OPENSSL_CONF", "SSLKEYLOGFILE"}
               for name in environ):
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
        expected_user = item["database_role"]
        if item["database_connection"] == "session":
            expected_user += "." + item["project_id"]
        if (set(params) - _DSN_FIELDS or not params.get("password")
                or params.get("user") != expected_user
                or any(params.get(k) != item["database_" + v] for k, v in
                       (("host", "host"), ("port", "port"), ("dbname", "name")))):
            raise _invalid()
        local = realm == "development"
        if params.get("sslmode") != ("disable" if local else "verify-full"):
            raise _invalid()
        if (local and "sslrootcert" in params) or (not local and params.get("sslrootcert") != provider_ca_file()):
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
