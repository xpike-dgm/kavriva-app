"""Real PostgreSQL proof for verified-session-to-maintenance composition."""

from __future__ import annotations

import os
import json
import socket
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from dataclasses import replace
from datetime import date, datetime, timedelta, timezone
from io import BytesIO
from pathlib import Path
from uuid import uuid4

import pgembed
import psycopg


APP = Path(__file__).resolve().parents[3]
E3 = APP / "modules" / "e03-server"
E5 = APP / "modules" / "e05-identity"
for path in (E3 / "public", E3 / "internal", E5 / "public", E5 / "internal"):
    sys.path.insert(0, str(path))
from commit_authorization import Verdict  # noqa: E402
from maintenance_command import MaintenanceCommand, MaintenanceCommands  # noqa: E402
from maintenance_api import create_app  # noqa: E402
from maintenance_store import CREATE, EDIT  # noqa: E402
from consumer_authority import revoke_consumer  # noqa: E402
from principal import Principal  # noqa: E402


ACTOR = "11111111-1111-4111-8111-111111111111"
SESSION = "22222222-2222-4222-8222-222222222222"
OTHER = "33333333-3333-4333-8333-333333333333"
OTHER_SESSION = "44444444-4444-4444-8444-444444444444"
MIGRATIONS = sorted((APP / "supabase" / "migrations").glob("*.sql"))


class StubAuth:
    def __init__(self, principal):
        self.principal = principal

    def verify(self, token):
        return self.principal


class LiveMaintenanceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="kavriva-e3-live-pg-")
        cls.data = Path(cls.temp.name) / "data"
        cls.log = Path(cls.temp.name) / "postgres.log"
        binary_dir = Path(pgembed.__file__).resolve().parent / "pginstall" / "bin"
        suffix = ".exe" if os.name == "nt" else ""
        cls.pg_ctl = binary_dir / f"pg_ctl{suffix}"
        initdb = binary_dir / f"initdb{suffix}"
        subprocess.run(
            [str(initdb), "-D", str(cls.data), "--auth=trust", "--encoding=UTF8",
             "--locale=C", "-U", "postgres"],
            check=True, capture_output=True, text=True,
        )
        with socket.socket() as sock:
            sock.bind(("127.0.0.1", 0))
            cls.port = sock.getsockname()[1]
        subprocess.run(
            [str(cls.pg_ctl), "-D", str(cls.data), "-l", str(cls.log),
             "-o", f"-p {cls.port} -h 127.0.0.1", "-w", "-t", "20", "start"],
            check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
            timeout=25,
        )
        cls.dsn = f"postgresql://postgres@127.0.0.1:{cls.port}/postgres"
        with psycopg.connect(cls.dsn) as conn:
            conn.execute("create role anon")
            conn.execute("create role authenticated")
            conn.execute("create role kavriva_test_api login")
            conn.execute("create schema auth")
            conn.execute("create table auth.users (id uuid primary key)")
            conn.execute("""create table auth.sessions
                            (id uuid primary key, user_id uuid not null
                             references auth.users(id))""")

    @classmethod
    def tearDownClass(cls):
        try:
            subprocess.run(
                [str(cls.pg_ctl), "-D", str(cls.data), "-m", "immediate",
                 "-w", "stop"], check=True, stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL, timeout=25,
            )
        finally:
            cls.temp.cleanup()

    def setUp(self):
        with psycopg.connect(self.dsn) as conn:
            for schema in ("kavriva_audit", "kavriva_e3", "kavriva_e5"):
                conn.execute(f"drop schema if exists {schema} cascade")
            conn.execute("delete from auth.sessions")
            conn.execute("delete from auth.users")
            for migration in MIGRATIONS:
                conn.execute(migration.read_text(encoding="utf-8"))
            conn.execute("grant kavriva_consumer_api to kavriva_test_api")
            conn.execute("insert into auth.users values (%s), (%s)", (ACTOR, OTHER))
            conn.execute("insert into auth.sessions values (%s, %s), (%s, %s)",
                         (SESSION, ACTOR, OTHER_SESSION, OTHER))
        self.principal = Principal(
            ACTOR, SESSION, "https://project.supabase.co/auth/v1",
            datetime.now(timezone.utc) + timedelta(hours=1), "STANDARD",
        )
        self.commands = MaintenanceCommands(self.dsn, StubAuth(self.principal))
        enrolled = self.commands.enroll("verified-token")
        self.assertEqual((enrolled.verdict, enrolled.reason_code),
                         (Verdict.ALLOW, "ENROLLED"))
        self.bike = enrolled.effect_result.motorcycle_id

    def command(self, **changes):
        return replace(MaintenanceCommand(
            action=CREATE, target_id=self.bike, operation_id=str(uuid4()),
            expected_generation=1, expected_policy_version=1,
            client_generation=1, performed_on=date(2026, 9, 30),
            odometer_km=1200, outcome="Oil changed", safety_notes="",
        ), **changes)

    def test_create_edit_and_idempotent_replay(self):
        enrollment_replay = self.commands.enroll("verified-token")
        self.assertEqual((enrollment_replay.reason_code,
                          enrollment_replay.effect_result.motorcycle_id),
                         ("ALREADY_ENROLLED", self.bike))
        create = self.command()
        result = self.commands.execute("verified-token", create)
        self.assertEqual((result.verdict, result.reason_code),
                         (Verdict.ALLOW, "COMMITTED"))
        replay = self.commands.execute("verified-token", create)
        self.assertEqual((replay.reason_code, replay.effect_result),
                         ("ALREADY_COMMITTED", result.effect_result))
        conflict = self.commands.execute("verified-token",
                                         replace(create, outcome="different"))
        self.assertEqual(conflict.reason_code, "OPERATION_CONFLICT")
        edit = self.command(
            action=EDIT, target_id=result.effect_result.record_id,
            operation_id=str(uuid4()), correction_reason="Initial detail missing",
            outcome="Oil and filter changed",
        )
        edited = self.commands.execute("verified-token", edit)
        self.assertEqual((edited.verdict, edited.effect_result.generation),
                         (Verdict.ALLOW, 2))
        with psycopg.connect(self.dsn) as conn:
            revisions = conn.execute(
                """select generation, outcome, evidence_level
                   from kavriva_e3.maintenance_revisions order by generation"""
            ).fetchall()
            self.assertEqual(revisions, [
                (1, "Oil changed", "USER_REPORTED"),
                (2, "Oil and filter changed", "USER_REPORTED"),
            ])
            events = conn.execute(
                "select result from kavriva_audit.events order by sequence"
            ).fetchall()
            self.assertEqual(events, [("COMMITTED",), ("INTENT",),
                                      ("COMMITTED",), ("INTENT",),
                                      ("COMMITTED",)])

    def test_auth_logout_and_actor_mismatch_deny(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("delete from auth.sessions where id = %s", (SESSION,))
        self.assertEqual(self.commands.execute("verified-token", self.command()).reason_code,
                         "SESSION_NOT_CURRENT")
        self.assertEqual(self.commands.enroll("verified-token").reason_code,
                         "ENROLLMENT_NOT_AVAILABLE")

    def test_e5_revoke_cannot_be_restored_by_auth_refresh_or_enrollment(self):
        with psycopg.connect(self.dsn) as conn:
            revoke_consumer(conn, ACTOR, ACTOR)
        self.assertEqual(self.commands.execute("verified-token", self.command()).reason_code,
                         "CONSUMER_NOT_CURRENT")
        self.assertEqual(self.commands.enroll("verified-token").reason_code,
                         "ENROLLMENT_NOT_AVAILABLE")

    def test_policy_floor_runtime_and_generation_fail_closed(self):
        cases = (
            ("update kavriva_e5.policy_rules set verdict = 'DENY'", "POLICY_DENIED"),
            ("update kavriva_e3.negative_floors set blocked = true, floor_generation = 1",
             "NEGATIVE_FLOOR"),
            ("update kavriva_e3.runtime_versions set min_client_generation = 2, max_client_generation = 2",
             "RUNTIME_INCOMPATIBLE"),
        )
        for query, expected in cases:
            with self.subTest(expected=expected):
                with psycopg.connect(self.dsn) as conn:
                    conn.execute(query)
                result = self.commands.execute("verified-token", self.command())
                self.assertEqual(result.reason_code, expected)
                with psycopg.connect(self.dsn) as conn:
                    self.assertEqual(conn.execute(
                        "select count(*) from kavriva_e3.maintenance_records"
                    ).fetchone()[0], 0)
                with psycopg.connect(self.dsn) as conn:
                    conn.execute("update kavriva_e5.policy_rules set verdict = 'ALLOW'")
                    conn.execute("update kavriva_e3.negative_floors set blocked = false")
                    conn.execute("""update kavriva_e3.runtime_versions
                                    set min_client_generation = 1, max_client_generation = 1""")
        self.assertEqual(self.commands.execute(
            "verified-token", self.command(expected_generation=2)
        ).reason_code, "AUTHORITY_CHANGED")

    def test_missing_audit_custody_holds_before_effect(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("delete from kavriva_audit.heads")
        self.assertEqual(self.commands.execute(
            "verified-token", self.command()
        ).reason_code, "CURRENT_AUTHORITY_UNAVAILABLE")
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone()[0], 0)

    def test_cross_tenant_actor_cannot_claim_other_motorcycle(self):
        other = Principal(
            OTHER, OTHER_SESSION, self.principal.issuer_id,
            self.principal.expires_at, "STANDARD",
        )
        other_commands = MaintenanceCommands(self.dsn, StubAuth(other))
        self.assertEqual(other_commands.enroll("verified-token").verdict, Verdict.ALLOW)
        self.assertEqual(other_commands.execute(
            "verified-token", self.command()
        ).reason_code, "RESOURCE_MISSING")

    def test_missing_session_row_blocks_even_with_e5_allow(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("delete from auth.sessions where id = %s", (SESSION,))
        self.assertEqual(self.commands.execute(
            "verified-token", self.command()
        ).verdict, Verdict.DENY)

    def test_bearer_api_rejects_client_authority_and_supports_status_lookup(self):
        app = create_app(self.commands)

        def call(method, path, body=None, **headers):
            raw = json.dumps(body).encode() if body is not None else b""
            environment = {
                "REQUEST_METHOD": method, "PATH_INFO": path,
                "HTTP_AUTHORIZATION": "Bearer verified-token",
                "CONTENT_TYPE": "application/json",
                "CONTENT_LENGTH": str(len(raw)), "wsgi.input": BytesIO(raw),
            }
            environment.update(headers)
            response = []
            output = b"".join(app(environment,
                                  lambda status, hdrs: response.extend([status, hdrs])))
            return response[0], json.loads(output)

        op = str(uuid4())
        payload = {
            "target_id": self.bike, "operation_id": op,
            "expected_generation": 1, "expected_policy_version": 1,
            "client_generation": 1, "performed_on": "2026-09-30",
            "odometer_km": 1200, "outcome": "Oil changed", "safety_notes": "",
        }
        status, denied = call("POST", "/v1/maintenance/records",
                              {**payload, "cached_decision": "ALLOW"})
        self.assertEqual((status, denied["reason_code"]),
                         ("400 Bad Request", "REQUEST_INCOMPLETE"))
        status, denied = call("POST", "/v1/maintenance/records", payload,
                              HTTP_COOKIE="session=untrusted")
        self.assertEqual(denied["reason_code"], "COOKIE_AUTH_UNSUPPORTED")
        status, result = call("POST", "/v1/maintenance/records", payload)
        self.assertEqual((status, result["reason_code"]),
                         ("201 Created", "COMMITTED"))
        status, looked_up = call("GET", "/v1/operations/" + op)
        self.assertEqual((status, looked_up["record_id"]),
                         ("200 OK", result["record_id"]))

    def test_direct_client_roles_cannot_read_or_write_authority(self):
        with psycopg.connect(self.dsn) as conn:
            for role in ("anon", "authenticated"):
                self.assertFalse(conn.execute(
                    """select has_schema_privilege(%s, 'kavriva_audit', 'USAGE')""",
                    (role,),
                ).fetchone()[0])
                self.assertFalse(conn.execute(
                    """select has_table_privilege(
                           %s, 'kavriva_e5.consumer_enrollments', 'SELECT')""",
                    (role,),
                ).fetchone()[0])
                self.assertFalse(conn.execute(
                    """select has_function_privilege(
                           %s, 'kavriva_e5.provider_session_current(uuid, uuid)',
                           'EXECUTE')""",
                    (role,),
                ).fetchone()[0])

    def test_limited_server_role_can_commit_but_cannot_rewrite_grants_or_audit(self):
        limited_dsn = f"postgresql://kavriva_test_api@127.0.0.1:{self.port}/postgres"
        service = MaintenanceCommands(limited_dsn, StubAuth(self.principal))
        result = service.execute("verified-token", self.command())
        self.assertEqual((result.verdict, result.reason_code),
                         (Verdict.ALLOW, "COMMITTED"))
        with psycopg.connect(self.dsn) as conn:
            self.assertFalse(conn.execute(
                """select has_table_privilege(
                       'kavriva_test_api', 'kavriva_e5.current_grants', 'UPDATE')"""
            ).fetchone()[0])
            self.assertFalse(conn.execute(
                """select has_table_privilege(
                       'kavriva_test_api', 'auth.sessions', 'SELECT')"""
            ).fetchone()[0])
            self.assertFalse(conn.execute(
                """select has_table_privilege(
                       'kavriva_test_api', 'kavriva_audit.events', 'DELETE')"""
            ).fetchone()[0])
        with self.assertRaises(psycopg.Error), psycopg.connect(limited_dsn) as conn:
            conn.execute(
                """update kavriva_e5.current_grants
                   set lock_marker = lock_marker where actor_id = %s""",
                (ACTOR,),
            )
    def test_provider_session_lock_blocks_logout_until_commit(self):
        entered = threading.Event()
        release = threading.Event()
        result = []

        def writer():
            with psycopg.connect(self.dsn) as conn:
                from consumer_authority import lock_provider_session
                self.assertTrue(lock_provider_session(conn, self.principal))
                entered.set()
                release.wait(5)

        def logout():
            with psycopg.connect(self.dsn) as conn:
                conn.execute("delete from auth.sessions where id = %s", (SESSION,))
                result.append("deleted")

        first = threading.Thread(target=writer)
        second = threading.Thread(target=logout)
        first.start()
        self.assertTrue(entered.wait(5))
        second.start()
        time.sleep(0.2)
        self.assertEqual(result, [])
        release.set()
        first.join(5)
        second.join(5)
        self.assertEqual(result, ["deleted"])
