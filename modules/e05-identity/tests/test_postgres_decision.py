"""Native PostgreSQL proof for T-E5-003's current E5 decision source."""

import os
import socket
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from dataclasses import replace
from datetime import datetime, timedelta, timezone
from pathlib import Path

import pgembed
import psycopg


APP = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE / "public"))
sys.path.insert(0, str(HERE / "internal"))
from decision import AuthorityRequest, Verdict, decide_current  # noqa: E402
from postgres_decision import PostgresCurrentAuthority  # noqa: E402


REQUEST = AuthorityRequest(
    actor_id="actor-1", workload_id="web-ops", session_id="session-1",
    tenant_id="tenant-1", object_id="object-1", scope="drafts",
    classification="internal", action="EDIT_DRAFT", grant_id="grant-1",
    operation_id="operation-1",
)
MIGRATION = next((APP / "supabase" / "migrations").glob("*_e5_current_authority.sql"))


class NativePostgresDecisionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="kavriva-e5-pg-")
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

    @classmethod
    def tearDownClass(cls):
        try:
            subprocess.run(
                [str(cls.pg_ctl), "-D", str(cls.data), "-m", "immediate", "-w", "stop"],
                check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                timeout=25,
            )
        finally:
            cls.temp.cleanup()

    def setUp(self):
        expires = datetime.now(timezone.utc) + timedelta(hours=1)
        with psycopg.connect(self.dsn) as conn:
            conn.execute("drop schema if exists kavriva_e5 cascade")
            conn.execute(MIGRATION.read_text(encoding="utf-8"))
            conn.execute(
                "insert into kavriva_e5.actor_epochs values (%s, %s, %s)",
                (REQUEST.tenant_id, REQUEST.actor_id, 4),
            )
            conn.execute(
                """insert into kavriva_e5.current_sessions
                   (session_id, tenant_id, actor_id, workload_id, issuer_id,
                    assurance, security_epoch, expires_at)
                   values (%s, %s, %s, %s, %s, %s, %s, %s)""",
                (REQUEST.session_id, REQUEST.tenant_id, REQUEST.actor_id,
                 REQUEST.workload_id, "issuer-1", "STANDARD", 4, expires),
            )
            conn.execute(
                """insert into kavriva_e5.current_grants
                   (grant_id, tenant_id, actor_id, scope, action, role,
                    delegation_chain, competence, independent, expires_at)
                   values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                (REQUEST.grant_id, REQUEST.tenant_id, REQUEST.actor_id,
                 REQUEST.scope, REQUEST.action, "editor", "DIRECT", "MECHANIC",
                 False, expires),
            )
            conn.execute("insert into kavriva_e5.policy_heads values (%s, %s)",
                         (REQUEST.tenant_id, 2))
            conn.execute(
                """insert into kavriva_e5.policy_rules
                   (tenant_id, policy_version, action, scope, classification,
                    role, verdict, required_assurance, required_competence,
                    requires_independence, requires_step_up)
                   values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""",
                (REQUEST.tenant_id, 2, REQUEST.action, REQUEST.scope,
                 REQUEST.classification, "editor", "ALLOW", "STANDARD",
                 "MECHANIC", False, False),
            )

    def decision(self, request=REQUEST):
        with psycopg.connect(self.dsn) as conn:
            return decide_current(request, PostgresCurrentAuthority(conn))

    def update(self, query, params=()):
        with psycopg.connect(self.dsn) as conn:
            conn.execute(query, params)

    def wait_for_row_lock(self, application_name):
        deadline = time.monotonic() + 4
        while time.monotonic() < deadline:
            with psycopg.connect(self.dsn) as conn:
                waiting = conn.execute(
                    """select 1 from pg_stat_activity
                       where application_name = %s and wait_event_type = 'Lock'""",
                    (application_name,),
                ).fetchone()
            if waiting:
                return True
            time.sleep(0.05)
        return False

    def test_current_normalized_rows_allow_and_return_authority(self):
        result = self.decision()
        self.assertEqual((result.verdict, result.reason_code),
                         (Verdict.ALLOW, "CURRENT_CONTEXT_ALLOWED"))
        self.assertEqual(result.authority.security_epoch, 4)
        self.assertEqual(result.authority.policy_version, 2)
        self.assertEqual(result.authority.delegation_chain, "DIRECT")

    def test_missing_and_cross_tenant_requests_deny_without_effect(self):
        for request in (
            replace(REQUEST, session_id="missing"),
            replace(REQUEST, grant_id="missing"),
            replace(REQUEST, actor_id="other"),
            replace(REQUEST, tenant_id="other"),
            replace(REQUEST, scope="other"),
            replace(REQUEST, classification="secret"),
            replace(REQUEST, workload_id="other"),
        ):
            with self.subTest(request=request):
                self.assertNotEqual(self.decision(request).verdict, Verdict.ALLOW)
        self.assertEqual(self.decision(replace(REQUEST, workload_id="")).reason_code,
                         "REQUEST_INCOMPLETE")

    def test_revocation_epoch_and_expiry_fail_closed(self):
        self.update("update kavriva_e5.current_sessions set revoked_at = clock_timestamp()")
        self.assertEqual(self.decision().reason_code, "SESSION_NOT_CURRENT")
        self.update("update kavriva_e5.current_sessions set revoked_at = null")
        self.update("update kavriva_e5.current_sessions set expires_at = clock_timestamp()")
        self.assertEqual(self.decision().reason_code, "SESSION_NOT_CURRENT")
        self.update("update kavriva_e5.current_sessions "
                    "set expires_at = clock_timestamp() + interval '1 hour'")
        self.update("update kavriva_e5.actor_epochs set security_epoch = 5")
        self.assertEqual(self.decision().reason_code, "SECURITY_EPOCH_CHANGED")
        self.update("update kavriva_e5.actor_epochs set security_epoch = 4")
        self.update("update kavriva_e5.current_grants set revoked_at = clock_timestamp()")
        self.assertEqual(self.decision().reason_code, "GRANT_NOT_CURRENT")
        self.update("update kavriva_e5.current_grants set revoked_at = null")
        self.update("update kavriva_e5.current_grants set expires_at = clock_timestamp()")
        self.assertEqual(self.decision().reason_code, "GRANT_NOT_CURRENT")

    def test_current_policy_head_and_rule_are_not_cached(self):
        self.update("update kavriva_e5.policy_heads set policy_version = 3")
        self.assertEqual(self.decision().reason_code, "POLICY_NO_ALLOW")
        self.update("update kavriva_e5.policy_heads set policy_version = 2")
        self.update("update kavriva_e5.policy_rules set verdict = 'DENY'")
        self.assertEqual(self.decision().reason_code, "POLICY_DENIED")
        self.update("update kavriva_e5.policy_rules set verdict = 'HELD'")
        self.assertEqual(self.decision().reason_code, "POLICY_HELD")

    def test_policy_narrows_assurance_competence_independence_and_stepup(self):
        self.update("update kavriva_e5.policy_rules set required_assurance = 'PHISHING_RESISTANT'")
        self.assertEqual(self.decision().reason_code, "ASSURANCE_REQUIRED")
        self.update("update kavriva_e5.current_sessions set assurance = 'PHISHING_RESISTANT'")
        self.update("update kavriva_e5.policy_rules set required_competence = 'SAFETY'")
        self.assertEqual(self.decision().reason_code, "COMPETENCE_MISMATCH")
        self.update("update kavriva_e5.current_grants set competence = 'SAFETY'")
        self.update("update kavriva_e5.policy_rules set requires_independence = true")
        self.assertEqual(self.decision().reason_code, "INDEPENDENCE_REQUIRED")
        self.update("update kavriva_e5.current_grants set independent = true")
        self.update("update kavriva_e5.policy_rules set requires_step_up = true")
        self.assertEqual(self.decision().reason_code, "STEP_UP_REQUIRED")
        self.update(
            """update kavriva_e5.current_sessions
               set step_up_operation_id = %s,
                   step_up_expires_at = clock_timestamp() + interval '5 minutes'""",
            (REQUEST.operation_id,),
        )
        self.assertEqual(self.decision().verdict, Verdict.ALLOW)
        self.assertEqual(self.decision(replace(REQUEST, operation_id="other")).reason_code,
                         "STEP_UP_REQUIRED")

    def test_reader_requires_transaction_and_unavailable_source_holds(self):
        conn = psycopg.connect(self.dsn, autocommit=True)
        try:
            self.assertEqual(decide_current(REQUEST, PostgresCurrentAuthority(conn)).reason_code,
                             "CURRENT_AUTHORITY_UNAVAILABLE")
        finally:
            conn.close()
        with psycopg.connect(self.dsn) as conn:
            conn.execute("drop schema kavriva_e5 cascade")
            self.assertEqual(decide_current(REQUEST, PostgresCurrentAuthority(conn)).verdict,
                             Verdict.HELD)

    def test_private_schema_is_not_accessible_to_api_roles(self):
        for role in ("anon", "authenticated"):
            with self.subTest(role=role), psycopg.connect(self.dsn) as conn:
                conn.execute(f"set role {role}")
                with self.assertRaises(psycopg.errors.InsufficientPrivilege):
                    conn.execute("select * from kavriva_e5.current_grants")

    def test_revocation_waits_for_locked_allow_transaction(self):
        started = threading.Event()
        finished = threading.Event()
        errors = []

        def revoke():
            try:
                with psycopg.connect(self.dsn, application_name="e5-revoker") as conn:
                    started.set()
                    conn.execute("update kavriva_e5.current_sessions "
                                 "set revoked_at = clock_timestamp()")
                finished.set()
            except Exception as exc:
                errors.append(exc)
                finished.set()

        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(decide_current(REQUEST, PostgresCurrentAuthority(conn)).verdict,
                             Verdict.ALLOW)
            worker = threading.Thread(target=revoke)
            worker.start()
            self.assertTrue(started.wait(3))
            self.assertTrue(self.wait_for_row_lock("e5-revoker"))
            self.assertFalse(finished.is_set(), "revocation bypassed the held row lock")
        worker.join(5)
        self.assertFalse(worker.is_alive())
        self.assertFalse(errors)
        self.assertEqual(self.decision().reason_code, "SESSION_NOT_CURRENT")

    def test_decision_waits_then_observes_concurrent_revocation(self):
        started = threading.Event()
        finished = threading.Event()
        result = []

        def decide():
            with psycopg.connect(self.dsn, application_name="e5-reader") as conn:
                started.set()
                result.append(decide_current(REQUEST, PostgresCurrentAuthority(conn)))
            finished.set()

        with psycopg.connect(self.dsn) as conn:
            conn.execute("update kavriva_e5.current_sessions "
                         "set revoked_at = clock_timestamp()")
            worker = threading.Thread(target=decide)
            worker.start()
            self.assertTrue(started.wait(3))
            self.assertTrue(self.wait_for_row_lock("e5-reader"))
            self.assertFalse(finished.is_set(), "decision ignored pending revocation")
        worker.join(5)
        self.assertFalse(worker.is_alive())
        self.assertEqual(result[0].reason_code, "SESSION_NOT_CURRENT")


if __name__ == "__main__":
    unittest.main()
