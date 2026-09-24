"""Native PostgreSQL checks for private, versioned maintenance records.

These exercise the product write and history only. They are not evidence that
the E3/E5 authorization gate or protected audit is connected to that write.
"""

import os
import socket
import subprocess
import sys
import tempfile
import threading
import unittest
from dataclasses import replace
from datetime import date, datetime, timedelta, timezone
from pathlib import Path

import pgembed
import psycopg

APP = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE / "public"))
sys.path.insert(0, str(HERE / "internal"))
E5 = APP / "modules" / "e05-identity"
sys.path.insert(0, str(E5 / "public"))
sys.path.insert(0, str(E5 / "internal"))
from commit_authorization import (  # noqa: E402
    CommitResult, Verdict as CommitVerdict, authorize_and_commit,
)
from decision import AuthorityRequest, Verdict as IdentityVerdict, decide_current  # noqa: E402
from maintenance_store import (  # noqa: E402
    CREATE, EDIT, MaintenanceEntry, read_target_locked, write_maintenance_entry,
)
from postgres_commit_authorization import postgres_transaction  # noqa: E402
from postgres_decision import PostgresCurrentAuthority  # noqa: E402
from test_commit_authorization import CURRENT, REQUEST  # noqa: E402

MIGRATION = next((APP / "supabase" / "migrations").glob("*_e3_maintenance_records.sql"))
E5_MIGRATION = next((APP / "supabase" / "migrations").glob("*_e5_current_authority.sql"))

CREATE_REQUEST = replace(
    REQUEST, action=CREATE, object_id="motorcycle-1",
    expected_object_generation="1", operation_id="create-1",
)
ENTRY = MaintenanceEntry(
    record_id="record-1", motorcycle_id="motorcycle-1",
    performed_on=date(2026, 9, 24), odometer_km=12000,
    outcome="Oil changed", safety_notes="Owner-reported work",
)


class MaintenanceStoreTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="kavriva-maintenance-pg-")
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
        with psycopg.connect(self.dsn) as conn:
            conn.execute("drop schema if exists kavriva_e3 cascade")
            conn.execute("drop schema if exists kavriva_e5 cascade")
            conn.execute(MIGRATION.read_text(encoding="utf-8"))
            conn.execute(E5_MIGRATION.read_text(encoding="utf-8"))
            conn.execute(
                """insert into kavriva_e3.motorcycles
                   (tenant_id, motorcycle_id, classification)
                   values (%s, %s, %s)""",
                (REQUEST.tenant_id, ENTRY.motorcycle_id, "private"),
            )
            expires = datetime.now(timezone.utc) + timedelta(hours=1)
            conn.execute("insert into kavriva_e5.actor_epochs values (%s, %s, 4)",
                         (REQUEST.tenant_id, REQUEST.actor_id))
            conn.execute(
                """insert into kavriva_e5.current_sessions
                   (session_id, tenant_id, actor_id, workload_id, issuer_id,
                    assurance, security_epoch, expires_at)
                   values (%s, %s, %s, %s, %s, %s, 4, %s)""",
                (REQUEST.session_id, REQUEST.tenant_id, REQUEST.actor_id,
                 "web-ops", "issuer-1", "STANDARD", expires),
            )
            conn.execute(
                """insert into kavriva_e5.current_grants
                   (grant_id, tenant_id, actor_id, scope, action, role,
                    delegation_chain, competence, independent, expires_at)
                   values (%s, %s, %s, %s, %s, %s, %s, %s, false, %s)""",
                ("grant-1", REQUEST.tenant_id, REQUEST.actor_id, "maintenance",
                 CREATE, "editor", "DIRECT", "MECHANIC", expires),
            )
            conn.execute("insert into kavriva_e5.policy_heads values (%s, 2)",
                         (REQUEST.tenant_id,))
            conn.execute(
                """insert into kavriva_e5.policy_rules
                   (tenant_id, policy_version, action, scope, classification,
                    role, verdict, required_assurance, required_competence,
                    requires_independence, requires_step_up)
                   values (%s, 2, %s, %s, %s, %s, 'ALLOW', %s, %s, false, false)""",
                (REQUEST.tenant_id, CREATE, "maintenance", "private", "editor",
                 "STANDARD", "MECHANIC"),
            )

    def create(self):
        with psycopg.connect(self.dsn) as conn:
            target = read_target_locked(conn, CREATE_REQUEST)
            return write_maintenance_entry(conn, CREATE_REQUEST, ENTRY, target)

    def integrated_gate(self, request=None, entry=ENTRY, effect_hook=None):
        """Test-only composition: E5 and the real resource share the E3 connection.

        Remaining floor/audit/runtime/operation values are fixture data, not a
        production authority source. This test cannot establish DONE.
        """
        request = request or replace(
            CREATE_REQUEST, scope="maintenance", expected_policy_version="2",
            cached_decision="ALLOW",
        )

        def read_current(conn, candidate):
            target = read_target_locked(conn, candidate)
            if target is None:
                return CommitResult(CommitVerdict.DENY, "RESOURCE_MISSING")
            identity_request = AuthorityRequest(
                actor_id=candidate.actor_id, workload_id="web-ops",
                session_id=candidate.session_id, tenant_id=candidate.tenant_id,
                object_id=candidate.object_id, scope=candidate.scope,
                classification=target.classification, action=candidate.action,
                grant_id="grant-1", operation_id=candidate.operation_id,
            )
            decision = decide_current(identity_request, PostgresCurrentAuthority(conn))
            if decision.verdict != IdentityVerdict.ALLOW:
                return CommitResult(CommitVerdict(decision.verdict.value),
                                    decision.reason_code)
            authority = decision.authority
            return replace(
                CURRENT, actor_id=authority.actor_id,
                workload_id=authority.workload_id,
                issuer_id=authority.issuer_id,
                session_id=authority.session_id,
                assurance=authority.assurance,
                security_epoch=str(authority.security_epoch),
                tenant_id=authority.tenant_id, object_id=candidate.object_id,
                scope=authority.scope, classification=target.classification,
                action=authority.action, role=authority.role,
                grant_id=authority.grant_id,
                delegation_chain=authority.delegation_chain,
                competence=authority.competence,
                independence=str(authority.independent),
                policy_version=str(authority.policy_version),
                object_generation=str(target.generation),
                operation_id=candidate.operation_id,
                fingerprint=candidate.fingerprint, reason=candidate.reason,
                intended_effect=candidate.intended_effect,
            )

        def effect(conn, candidate):
            target = read_target_locked(conn, candidate)
            result = write_maintenance_entry(conn, candidate, entry, target)
            if effect_hook is not None:
                effect_hook()
            return result

        return authorize_and_commit(
            request, postgres_transaction(self.dsn, effect,
                                          current_reader=read_current),
        )

    def test_e5_and_resource_are_checked_before_same_transaction_record_write(self):
        result = self.integrated_gate()
        self.assertEqual((result.verdict, result.reason_code),
                         (CommitVerdict.ALLOW, "COMMITTED"))
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone(), (1,))

    def test_edit_is_authorized_again_and_preserves_old_revision(self):
        self.assertEqual(self.integrated_gate().verdict, CommitVerdict.ALLOW)
        with psycopg.connect(self.dsn) as conn:
            conn.execute("update kavriva_e5.current_grants set action = %s",
                         (EDIT,))
            conn.execute(
                """insert into kavriva_e5.policy_rules
                   (tenant_id, policy_version, action, scope, classification,
                    role, verdict, required_assurance, required_competence,
                    requires_independence, requires_step_up)
                   values (%s, 2, %s, 'maintenance', 'private', 'editor',
                           'ALLOW', 'STANDARD', 'MECHANIC', false, false)""",
                (REQUEST.tenant_id, EDIT),
            )
        edit_request = replace(
            CREATE_REQUEST, action=EDIT, object_id=ENTRY.record_id,
            scope="maintenance", expected_policy_version="2",
            expected_object_generation="1", operation_id="edit-1",
        )
        corrected = replace(ENTRY, outcome="Oil and filter changed",
                            correction_reason="Initial entry omitted filter")
        result = self.integrated_gate(edit_request, corrected)
        self.assertEqual(result.verdict, CommitVerdict.ALLOW)
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                """select generation, outcome from kavriva_e3.maintenance_revisions
                   order by generation"""
            ).fetchall(), [(1, "Oil changed"), (2, "Oil and filter changed")])

    def test_revoked_e5_session_blocks_record_despite_cached_allow(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("update kavriva_e5.current_sessions "
                         "set revoked_at = clock_timestamp()")
        result = self.integrated_gate()
        self.assertEqual((result.verdict, result.reason_code),
                         (CommitVerdict.DENY, "SESSION_NOT_CURRENT"))
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone(), (0,))

    def test_session_cannot_be_revoked_midway_through_record_commit(self):
        written = threading.Event()
        release = threading.Event()
        result = []

        def pause_after_write():
            written.set()
            if not release.wait(5):
                raise TimeoutError("test did not release maintenance write")

        worker = threading.Thread(
            target=lambda: result.append(self.integrated_gate(
                effect_hook=pause_after_write)),
        )
        worker.start()
        try:
            self.assertTrue(written.wait(5))
            with psycopg.connect(self.dsn) as conn:
                conn.execute("set lock_timeout = '100ms'")
                with self.assertRaises(psycopg.errors.LockNotAvailable):
                    conn.execute("update kavriva_e5.current_sessions "
                                 "set revoked_at = clock_timestamp()")
        finally:
            release.set()
            worker.join(5)
        self.assertFalse(worker.is_alive())
        self.assertEqual(result[0].verdict, CommitVerdict.ALLOW)

    def test_integrated_write_error_rolls_back_record(self):
        def fail_after_write():
            raise RuntimeError("simulated failure before commit")

        result = self.integrated_gate(effect_hook=fail_after_write)
        self.assertEqual((result.verdict, result.reason_code),
                         (CommitVerdict.OUTCOME_UNKNOWN, "COMMIT_OUTCOME_UNKNOWN"))
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone(), (0,))
            self.assertEqual(conn.execute(
                "select generation from kavriva_e3.motorcycles"
            ).fetchone(), (1,))

    def test_resource_classification_change_removes_policy_allow(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("update kavriva_e3.motorcycles "
                         "set classification = 'sensitive'")
        result = self.integrated_gate()
        self.assertEqual((result.verdict, result.reason_code),
                         (CommitVerdict.DENY, "POLICY_NO_ALLOW"))
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone(), (0,))

    def test_create_and_edit_preserve_prior_revision_without_verification_claim(self):
        self.assertEqual(self.create().generation, 1)
        edit_request = replace(
            CREATE_REQUEST, action=EDIT, object_id=ENTRY.record_id,
            expected_object_generation="1", operation_id="edit-1",
        )
        corrected = replace(ENTRY, outcome="Oil and filter changed",
                            correction_reason="Initial entry omitted filter")
        with psycopg.connect(self.dsn) as conn:
            target = read_target_locked(conn, edit_request)
            self.assertEqual(write_maintenance_entry(conn, edit_request, corrected,
                                                     target).generation, 2)
        with psycopg.connect(self.dsn) as conn:
            rows = conn.execute(
                """select generation, outcome, evidence_level, correction_reason
                   from kavriva_e3.maintenance_revisions order by generation"""
            ).fetchall()
            self.assertEqual(rows, [
                (1, "Oil changed", "USER_REPORTED", None),
                (2, "Oil and filter changed", "USER_REPORTED",
                 "Initial entry omitted filter"),
            ])
            self.assertEqual(conn.execute(
                "select generation from kavriva_e3.maintenance_records"
            ).fetchone(), (2,))

    def test_stale_generation_cross_tenant_and_bad_edit_cannot_write(self):
        self.create()
        bad_requests = (
            replace(CREATE_REQUEST, tenant_id="other", operation_id="other-create"),
            replace(CREATE_REQUEST, expected_object_generation="1",
                    operation_id="stale-create"),
        )
        for request in bad_requests:
            with self.subTest(request=request), psycopg.connect(self.dsn) as conn:
                target = read_target_locked(conn, request)
                if target is None:
                    self.assertEqual(request.tenant_id, "other")
                    continue
                with self.assertRaises(ValueError):
                    write_maintenance_entry(conn, request, replace(ENTRY, record_id="other"),
                                            target)
        edit = replace(CREATE_REQUEST, action=EDIT, object_id=ENTRY.record_id,
                       operation_id="bad-edit", expected_object_generation="1")
        with psycopg.connect(self.dsn) as conn:
            target = read_target_locked(conn, edit)
            with self.assertRaises(ValueError):
                write_maintenance_entry(conn, edit, ENTRY, target)
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_revisions"
            ).fetchone(), (1,))

    def test_failed_revision_insert_rolls_back_record_and_generation(self):
        with self.assertRaises(psycopg.errors.UniqueViolation):
            with psycopg.connect(self.dsn) as conn:
                target = read_target_locked(conn, CREATE_REQUEST)
                write_maintenance_entry(conn, CREATE_REQUEST, ENTRY, target)
                conn.execute(
                    """insert into kavriva_e3.maintenance_revisions
                       (tenant_id, record_id, generation, operation_id, actor_id,
                        performed_on, outcome, correction_reason)
                       values (%s, %s, 2, %s, %s, %s, %s, %s)""",
                    (REQUEST.tenant_id, ENTRY.record_id, CREATE_REQUEST.operation_id,
                     REQUEST.actor_id, ENTRY.performed_on, ENTRY.outcome, "duplicate"),
                )
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select count(*) from kavriva_e3.maintenance_records"
            ).fetchone(), (0,))
            self.assertEqual(conn.execute(
                "select generation from kavriva_e3.motorcycles"
            ).fetchone(), (1,))

    def test_existing_revision_cannot_be_rewritten_or_deleted(self):
        self.create()
        for statement in (
            "update kavriva_e3.maintenance_revisions set outcome = 'overwritten'",
            "delete from kavriva_e3.maintenance_revisions",
        ):
            with self.subTest(statement=statement), psycopg.connect(self.dsn) as conn:
                with self.assertRaises(psycopg.errors.RaiseException):
                    conn.execute(statement)
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute(
                "select outcome from kavriva_e3.maintenance_revisions"
            ).fetchone(), (ENTRY.outcome,))

    def test_private_tables_are_not_available_to_client_roles(self):
        for role in ("anon", "authenticated"):
            with self.subTest(role=role), psycopg.connect(self.dsn) as conn:
                conn.execute(f"set role {role}")
                with self.assertRaises(psycopg.errors.InsufficientPrivilege):
                    conn.execute("select * from kavriva_e3.maintenance_records")


if __name__ == "__main__":
    unittest.main()
