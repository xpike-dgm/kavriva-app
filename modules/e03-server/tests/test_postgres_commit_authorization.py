"""Real PostgreSQL transaction tests for T-E3-001-R1.

Starts an isolated native PostgreSQL server from the pinned test package; no
Supabase account, remote database or production credential is used.
"""

import os
import socket
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from dataclasses import asdict, replace
from pathlib import Path

import pgembed
import psycopg
from psycopg import sql

HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE / "public"))
sys.path.insert(0, str(HERE / "internal"))
from commit_authorization import Verdict, authorize_and_commit  # noqa: E402
from postgres_commit_authorization import postgres_transaction  # noqa: E402
from test_commit_authorization import CURRENT, REQUEST  # noqa: E402


class RealPostgresCommitTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="kavriva-e3-pg-")
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
        with socket.socket() as s:
            s.bind(("127.0.0.1", 0))
            cls.port = s.getsockname()[1]
        subprocess.run(
            [str(cls.pg_ctl), "-D", str(cls.data), "-l", str(cls.log),
             "-o", f"-p {cls.port} -h 127.0.0.1", "-w", "-t", "20", "start"],
            check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=25,
        )
        cls.dsn = f"postgresql://postgres@127.0.0.1:{cls.port}/postgres"

    @classmethod
    def tearDownClass(cls):
        try:
            subprocess.run(
                [str(cls.pg_ctl), "-D", str(cls.data), "-m", "immediate", "-w", "stop"],
                check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=25,
            )
        finally:
            cls.temp.cleanup()

    def setUp(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("DROP SCHEMA IF EXISTS kavriva_e3 CASCADE")
            conn.execute("CREATE SCHEMA kavriva_e3")
            fields = asdict(CURRENT)
            field_types = [
                sql.SQL("{} {}").format(
                    sql.Identifier(name),
                    sql.SQL("boolean" if isinstance(value, bool) else "text"),
                )
                for name, value in fields.items()
            ]
            conn.execute(sql.SQL(
                "CREATE TABLE kavriva_e3.current_authorization ({} , "
                "PRIMARY KEY (tenant_id, object_id, action))"
            ).format(sql.SQL(", ").join(field_types)))
            conn.execute("""
                CREATE TABLE kavriva_e3.canonical_effect (
                    operation_id text PRIMARY KEY,
                    tenant_id text NOT NULL,
                    object_id text NOT NULL,
                    intended_effect text NOT NULL
                )
            """)
            fields["policy_verdict"] = fields["policy_verdict"].value
            names = list(fields)
            conn.execute(
                sql.SQL("INSERT INTO kavriva_e3.current_authorization ({}) VALUES ({})").format(
                    sql.SQL(", ").join(map(sql.Identifier, names)),
                    sql.SQL(", ").join([sql.Placeholder()] * len(names)),
                ),
                list(fields.values()),
            )

    @staticmethod
    def write_effect(conn, request):
        conn.execute(
            "INSERT INTO kavriva_e3.canonical_effect "
            "(operation_id, tenant_id, object_id, intended_effect) VALUES (%s, %s, %s, %s)",
            (request.operation_id, request.tenant_id, request.object_id, request.intended_effect),
        )
        return request.operation_id

    def effects(self):
        with psycopg.connect(self.dsn) as conn:
            return conn.execute(
                "SELECT operation_id FROM kavriva_e3.canonical_effect"
            ).fetchall()

    def run_gate(self, writer=None, request=REQUEST):
        return authorize_and_commit(
            request, postgres_transaction(self.dsn, writer or self.write_effect)
        )

    def test_current_row_lock_and_effect_commit_together(self):
        result = self.run_gate()
        self.assertEqual((result.verdict, result.reason_code), (Verdict.ALLOW, "COMMITTED"))
        self.assertEqual(self.effects(), [(REQUEST.operation_id,)])

    def test_concurrent_authority_change_is_seen_after_lock_wait(self):
        changed = threading.Event()
        release = threading.Event()
        result = []

        def change_authority():
            with psycopg.connect(self.dsn) as conn:
                conn.execute(
                    "UPDATE kavriva_e3.current_authorization "
                    "SET policy_version = 'policy-5' WHERE tenant_id = %s AND object_id = %s",
                    (REQUEST.tenant_id, REQUEST.object_id),
                )
                changed.set()
                if not release.wait(5):
                    raise TimeoutError("test did not release concurrent writer")

        writer = threading.Thread(target=change_authority)
        writer.start()
        try:
            self.assertTrue(changed.wait(5))
            gated = threading.Thread(target=lambda: result.append(self.run_gate()))
            gated.start()
            deadline = time.monotonic() + 5
            waiting_on_lock = False
            while time.monotonic() < deadline:
                with psycopg.connect(self.dsn, autocommit=True) as probe:
                    waiting_on_lock = probe.execute("""
                        SELECT EXISTS (
                            SELECT 1 FROM pg_stat_activity
                            WHERE application_name = 'kavriva-e3-commit-gate'
                              AND wait_event_type = 'Lock'
                        )
                    """).fetchone()[0]
                if waiting_on_lock:
                    break
                time.sleep(0.02)
            self.assertTrue(waiting_on_lock, "gate never waited for the concurrent row lock")
        finally:
            release.set()
            writer.join(5)
        gated.join(5)
        self.assertFalse(gated.is_alive())
        self.assertEqual((result[0].verdict, result[0].reason_code),
                         (Verdict.HELD, "AUTHORITY_CHANGED"))
        self.assertEqual(self.effects(), [])

    def test_row_stays_locked_until_effect_commits(self):
        entered_effect = threading.Event()
        release_effect = threading.Event()
        result = []

        def paused_writer(conn, request):
            self.write_effect(conn, request)
            entered_effect.set()
            if not release_effect.wait(5):
                raise TimeoutError("test did not release effect writer")
            return request.operation_id

        worker = threading.Thread(target=lambda: result.append(self.run_gate(paused_writer)))
        worker.start()
        try:
            self.assertTrue(entered_effect.wait(5))
            with psycopg.connect(self.dsn) as competing:
                competing.execute("SET lock_timeout = '100ms'")
                with self.assertRaises(psycopg.errors.LockNotAvailable):
                    competing.execute(
                        "UPDATE kavriva_e3.current_authorization "
                        "SET policy_version = 'policy-5' WHERE tenant_id = %s AND object_id = %s",
                        (REQUEST.tenant_id, REQUEST.object_id),
                    )
        finally:
            release_effect.set()
            worker.join(5)
        self.assertEqual(result[0].verdict, Verdict.ALLOW)
        self.assertEqual(self.effects(), [(REQUEST.operation_id,)])

    def test_effect_error_rolls_back_real_database_write(self):
        def failing_writer(conn, request):
            self.write_effect(conn, request)
            raise RuntimeError("simulated failure before commit")

        result = self.run_gate(failing_writer)
        self.assertEqual(result.verdict, Verdict.OUTCOME_UNKNOWN)
        self.assertEqual(self.effects(), [])

    def test_missing_authority_denies_cached_allow(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("DELETE FROM kavriva_e3.current_authorization")
        result = self.run_gate(request=replace(REQUEST, cached_decision="ALLOW"))
        self.assertEqual((result.verdict, result.reason_code),
                         (Verdict.DENY, "CURRENT_AUTHORITY_MISSING"))
        self.assertEqual(self.effects(), [])

    def test_adapter_cannot_apply_without_current_matching_allow(self):
        with postgres_transaction(self.dsn, self.write_effect)() as tx:
            with self.assertRaises(RuntimeError):
                tx.apply_effect(REQUEST)
            tx.read_current(REQUEST)
            with self.assertRaises(RuntimeError):
                tx.apply_effect(replace(REQUEST, actor_id="other-actor"))
        self.assertEqual(self.effects(), [])

    def test_null_workload_or_delegation_holds(self):
        for field in ("workload_id", "delegation_chain"):
            with self.subTest(field=field):
                with psycopg.connect(self.dsn) as conn:
                    conn.execute(sql.SQL(
                        "UPDATE kavriva_e3.current_authorization SET {} = NULL"
                    ).format(sql.Identifier(field)))
                result = self.run_gate()
                self.assertEqual((result.verdict, result.reason_code),
                                 (Verdict.HELD, "CURRENT_TUPLE_INCOMPLETE"))
                self.assertEqual(self.effects(), [])
                with psycopg.connect(self.dsn) as conn:
                    conn.execute(sql.SQL(
                        "UPDATE kavriva_e3.current_authorization SET {} = %s"
                    ).format(sql.Identifier(field)),
                    (getattr(CURRENT, field),))


if __name__ == "__main__":
    unittest.main()
