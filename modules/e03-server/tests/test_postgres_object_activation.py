"""Real isolated PostgreSQL activation proof; producers/identity remain fixtures."""

from dataclasses import asdict, replace
from pathlib import Path
import sys
import threading
import time
import unittest

import psycopg
from psycopg.types.json import Jsonb

HERE = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(HERE / "internal"))
from postgres_object_activation import activate_object
from commit_authorization import CommitResult, CurrentTuple, Verdict
from object_activation import SourceFence, activation_fingerprint, manifest_fingerprint
from object_boundary import ObjectReference, derive_object, reference_of
from test_commit_authorization import CURRENT
from test_object_activation import object_version, request_for, validation_for
import test_postgres_commit_authorization as pg_fixture


class PostgresObjectActivationTests(unittest.TestCase):
    setUpClass = classmethod(pg_fixture.RealPostgresCommitTests.setUpClass.__func__)
    tearDownClass = classmethod(pg_fixture.RealPostgresCommitTests.tearDownClass.__func__)

    def setUp(self):
        self.version = object_version()
        self.request = request_for(self.version)
        with psycopg.connect(self.dsn) as conn:
            conn.execute("DROP SCHEMA IF EXISTS kavriva_objects CASCADE")
            conn.execute((HERE / "internal" / "object_activation_store.sql").read_text())
            conn.execute("""CREATE TABLE kavriva_objects.fixture_authority
                (tenant_id text, object_id text, data jsonb, PRIMARY KEY (tenant_id, object_id))""")
            conn.execute("""CREATE TABLE kavriva_objects.fixture_source_fence
                (tenant_id text, object_id text, data jsonb, PRIMARY KEY (tenant_id, object_id))""")
            self.store(conn, self.version)
            self.validation(conn, self.version)
            self.authority(conn, self.request)

    def store(self, conn, version, tenant="tenant-1"):
        conn.execute("""INSERT INTO kavriva_objects.current_object VALUES (%s, %s, %s, %s)
            ON CONFLICT (tenant_id, object_id) DO UPDATE SET manifest=EXCLUDED.manifest, payload=EXCLUDED.payload""",
            (tenant, version.manifest.object_id, Jsonb(asdict(version.manifest)), version.payload))

    def validation(self, conn, version, **changes):
        evidence = replace(validation_for(version), **changes)
        conn.execute("""INSERT INTO kavriva_objects.current_validation VALUES (%s, %s, %s, %s, %s, %s)
            ON CONFLICT (tenant_id, object_id) DO UPDATE SET manifest_fingerprint=EXCLUDED.manifest_fingerprint,
            policy_version=EXCLUDED.policy_version, required_checks=EXCLUDED.required_checks, checks=EXCLUDED.checks""",
            ("tenant-1", version.manifest.object_id, evidence.manifest_fingerprint, evidence.policy_version,
             Jsonb(evidence.required_checks), Jsonb([asdict(check) for check in evidence.checks])))

    def authority(self, conn, request, **changes):
        command = request.commit
        fields = dict(actor_id=command.actor_id, session_id=command.session_id,
            tenant_id=command.tenant_id, object_id=command.object_id, action=command.action,
            scope=command.scope, operation_id=command.operation_id, fingerprint=command.fingerprint,
            reason=command.reason, intended_effect=command.intended_effect,
            object_generation=command.expected_object_generation,
            policy_version=command.expected_policy_version)
        fields.update(changes)
        conn.execute("""INSERT INTO kavriva_objects.fixture_authority VALUES (%s, %s, %s)
            ON CONFLICT (tenant_id, object_id) DO UPDATE SET data=EXCLUDED.data""",
            (command.tenant_id, command.object_id, Jsonb(asdict(replace(CURRENT, **fields)))))

    @staticmethod
    def current_reader(conn, command):
        row = conn.execute("""SELECT data FROM kavriva_objects.fixture_authority
            WHERE tenant_id=%s AND object_id=%s FOR UPDATE""",
            (command.tenant_id, command.object_id)).fetchone()
        if row is None:
            return None
        data = row["data"]
        data["policy_verdict"] = Verdict(data["policy_verdict"])
        return CurrentTuple(**data)

    def gate(self, request=None, reader=None):
        return activate_object(self.dsn, request or self.request,
                               current_reader=reader or self.current_reader,
                               source_reader=self.source_reader)

    def source_fence(self, conn, version, **changes):
        fence = SourceFence("tenant-1", self.request.commit.operation_id, reference_of(version.manifest),
                            "source-policy-1", "source-floor-0", True, True)
        fence = replace(fence, **changes)
        conn.execute("""INSERT INTO kavriva_objects.fixture_source_fence VALUES (%s, %s, %s)
            ON CONFLICT (tenant_id, object_id) DO UPDATE SET data=EXCLUDED.data""",
            (fence.tenant_id, version.manifest.object_id, Jsonb(asdict(fence))))

    @staticmethod
    def source_reader(conn, command, reference):
        row = conn.execute("""SELECT data FROM kavriva_objects.fixture_source_fence
            WHERE tenant_id=%s AND object_id=%s FOR UPDATE""",
            (command.tenant_id, reference.object_id)).fetchone()
        if row is None:
            return None
        data = row["data"]
        data["source"] = ObjectReference(**data["source"])
        return SourceFence(**data)

    def receipts(self):
        with psycopg.connect(self.dsn) as conn:
            return conn.execute("SELECT operation_id FROM kavriva_objects.activation_receipt").fetchall()

    def assert_held(self, reason, result=None):
        result = result or self.gate()
        self.assertEqual((result.verdict, result.reason_code), (Verdict.HELD, reason))
        self.assertEqual(self.receipts(), [])

    def test_success_and_read_only_same_operation_replay(self):
        self.assertEqual(self.gate().reason_code, "COMMITTED")
        self.assertEqual(self.gate().reason_code, "COMMITTED_REPLAY")
        self.assertEqual(self.receipts(), [(self.request.commit.operation_id,)])
        with psycopg.connect(self.dsn) as conn:
            row = conn.execute("SELECT generation, validation_receipts, audit_receipt FROM kavriva_objects.activation_receipt").fetchone()
            self.assertEqual(row[0], 1)
            self.assertEqual(len(row[1]["checks"]), 6)
            self.assertEqual(row[1]["source_fences"], [])
            self.assertEqual(row[2], CURRENT.audit_receipt)

    def test_default_missing_current_reader_or_bare_allow_cannot_activate(self):
        self.assert_held("CURRENT_READER_NOT_CONFIGURED", activate_object(self.dsn, self.request))
        self.assert_held("CURRENT_TUPLE_REQUIRED", self.gate(reader=lambda *_:
            CommitResult(Verdict.ALLOW, "SCANNER_ALLOW")))

    def test_conflicting_operation_and_revoked_replay_do_not_repeat_effect(self):
        self.assertEqual(self.gate().reason_code, "COMMITTED")
        changed = request_for(reason="different-purpose")
        with psycopg.connect(self.dsn) as conn:
            self.authority(conn, changed)
        self.assertEqual(self.gate(changed).reason_code, "OPERATION_CONFLICT")
        with psycopg.connect(self.dsn) as conn:
            self.authority(conn, self.request, session_current=False)
        self.assertEqual(self.gate().reason_code, "SESSION_NOT_CURRENT")
        self.assertEqual(len(self.receipts()), 1)

    def test_activation_receipt_cannot_be_rewritten_or_deleted(self):
        self.assertEqual(self.gate().reason_code, "COMMITTED")
        with psycopg.connect(self.dsn, autocommit=True) as conn:
            for query in ("UPDATE kavriva_objects.activation_receipt SET audit_receipt='other'",
                          "DELETE FROM kavriva_objects.activation_receipt"):
                with self.assertRaises(psycopg.errors.RaiseException):
                    conn.execute(query)
        self.assertEqual(len(self.receipts()), 1)

    def test_no_validation_or_scan_alone_holds(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("DELETE FROM kavriva_objects.current_validation")
        self.assert_held("OBJECT_VALIDATION_MISSING")
        with psycopg.connect(self.dsn) as conn:
            self.validation(conn, self.version, checks=(validation_for().checks[0],))
        self.assert_held("OBJECT_VALIDATION_INCOMPLETE")

    def test_changed_bytes_or_same_bytes_new_metadata_cannot_use_old_receipts(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("UPDATE kavriva_objects.current_object SET payload='changed'::bytea")
        self.assert_held("OBJECT_DIGEST_MISMATCH")
        with psycopg.connect(self.dsn) as conn:
            self.store(conn, object_version(retention_policy_ref="new-policy"))
        self.assert_held("OBJECT_VERSION_CHANGED")

    def test_authority_floor_audit_runtime_and_classification_block(self):
        for changes, reason in (({"floor_clear": False}, "NEGATIVE_FLOOR"),
            ({"audit_ready": False}, "AUDIT_HELD"), ({"runtime_compatible": False}, "RUNTIME_INCOMPATIBLE"),
            ({"classification": "shared"}, "CURRENT_CLASSIFICATION_MISMATCH"),
            ({"workload_id": None}, "CURRENT_TUPLE_INCOMPLETE")):
            with psycopg.connect(self.dsn) as conn:
                self.authority(conn, self.request, **changes)
            self.assert_held(reason)

    def test_request_substitution_and_cross_tenant_cannot_activate(self):
        for command in (replace(self.request.commit, intended_effect="publish"),
                        replace(self.request.commit, actor_id="other")):
            self.assertEqual(self.gate(replace(self.request, commit=command)).reason_code,
                             "ACTIVATION_INTENT_MISMATCH")
        cross = request_for(tenant_id="other")
        self.assertEqual(self.gate(cross).reason_code, "CURRENT_OBJECT_MISSING")
        self.assertEqual(self.receipts(), [])

    def test_full_canonical_ancestor_chain_checked_for_derivative(self):
        root = object_version(object_id="root")
        preview = derive_object(object_id="preview", generation=1, payload=b"preview", parents=(root,), kind="thumbnail")
        self.version = derive_object(object_id="object-1", generation=1, payload=b"export", parents=(preview,), kind="export")
        self.request = request_for(self.version)
        with psycopg.connect(self.dsn) as conn:
            for version in (root, preview, self.version):
                self.store(conn, version)
            for version in (root, preview):
                self.source_fence(conn, version)
            self.validation(conn, self.version)
            self.authority(conn, self.request)
            self.store(conn, object_version(object_id="root", generation=2))
        self.assert_held("CURRENT_SOURCE_CHANGED")
        with psycopg.connect(self.dsn) as conn:
            self.store(conn, root)
        self.assertEqual(self.gate().reason_code, "COMMITTED")

    def test_unchanged_source_bytes_do_not_bypass_missing_or_revoked_source_authority(self):
        root = object_version(object_id="root")
        self.version = derive_object(object_id="object-1", generation=1, payload=b"copy", parents=(root,), kind="copy")
        self.request = request_for(self.version)
        with psycopg.connect(self.dsn) as conn:
            self.store(conn, root)
            self.store(conn, self.version)
            self.validation(conn, self.version)
            self.authority(conn, self.request)
        self.assert_held("SOURCE_READER_NOT_CONFIGURED", activate_object(self.dsn, self.request,
                          current_reader=self.current_reader))
        self.assert_held("CURRENT_SOURCE_FENCE_REQUIRED")
        for changes in ({"floor_clear": False}, {"authorized": False}):
            with psycopg.connect(self.dsn) as conn:
                self.source_fence(conn, root, **changes)
            self.assert_held("CURRENT_SOURCE_BLOCKED")
        with psycopg.connect(self.dsn) as conn:
            self.source_fence(conn, root, operation_id="different-operation")
        self.assert_held("CURRENT_SOURCE_FENCE_REQUIRED")
        results = []
        with psycopg.connect(self.dsn) as blocker:
            self.source_fence(blocker, root, floor_clear=False)
            worker = threading.Thread(target=lambda: results.append(self.gate()))
            worker.start()
            try:
                self.wait_lock()
            finally:
                blocker.commit()
                worker.join(7)
        self.assert_held("CURRENT_SOURCE_BLOCKED", results[0])

    def test_failed_receipt_insert_rolls_back_and_never_reports_success(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("""CREATE FUNCTION kavriva_objects.fail_receipt() RETURNS trigger LANGUAGE plpgsql AS
                $$ BEGIN RAISE EXCEPTION 'fixture write failure'; END $$;
                CREATE TRIGGER fail_receipt BEFORE INSERT ON kavriva_objects.activation_receipt
                FOR EACH ROW EXECUTE FUNCTION kavriva_objects.fail_receipt()""")
        result = self.gate()
        self.assertEqual(result.verdict, Verdict.OUTCOME_UNKNOWN)
        self.assertEqual(self.receipts(), [])

    def wait_lock(self):
        deadline = time.monotonic() + 5
        with psycopg.connect(self.dsn, autocommit=True) as conn:
            while time.monotonic() < deadline:
                if conn.execute("""SELECT 1 FROM pg_stat_activity WHERE application_name=
                    'kavriva-object-activation' AND wait_event_type='Lock'""").fetchone():
                    return
                time.sleep(.02)
        self.fail("activation did not wait on real database lock")

    def test_concurrent_validation_rejection_seen_after_lock_wait(self):
        results = []
        with psycopg.connect(self.dsn) as blocker:
            evidence = validation_for()
            checks = [asdict(replace(check, verdict="FAIL")) for check in evidence.checks]
            blocker.execute("UPDATE kavriva_objects.current_validation SET checks=%s", (Jsonb(checks),))
            worker = threading.Thread(target=lambda: results.append(self.gate()))
            worker.start()
            try:
                self.wait_lock()
            finally:
                blocker.commit()
                worker.join(7)
        self.assertFalse(worker.is_alive())
        self.assert_held("OBJECT_VALIDATION_NOT_PASSED", results[0])

    def test_concurrent_permission_revocation_seen_after_lock_wait(self):
        results = []
        with psycopg.connect(self.dsn) as blocker:
            self.authority(blocker, self.request, session_current=False)
            worker = threading.Thread(target=lambda: results.append(self.gate()))
            worker.start()
            try:
                self.wait_lock()
            finally:
                blocker.commit()
                worker.join(7)
        self.assertEqual(results[0].reason_code, "SESSION_NOT_CURRENT")
        self.assertEqual(self.receipts(), [])

    def test_object_validation_and_authority_locks_held_until_effect_commit(self):
        root = object_version(object_id="root")
        self.version = derive_object(object_id="object-1", generation=1, payload=b"copy", parents=(root,), kind="copy")
        self.request = request_for(self.version)
        with psycopg.connect(self.dsn) as conn:
            self.store(conn, root)
            self.store(conn, self.version)
            self.source_fence(conn, root)
            self.validation(conn, self.version)
            self.authority(conn, self.request)
            conn.execute("""CREATE FUNCTION kavriva_objects.pause_receipt() RETURNS trigger LANGUAGE plpgsql AS
                $$ BEGIN PERFORM pg_advisory_xact_lock(7312001); RETURN NEW; END $$;
                CREATE TRIGGER pause_receipt BEFORE INSERT ON kavriva_objects.activation_receipt
                FOR EACH ROW EXECUTE FUNCTION kavriva_objects.pause_receipt()""")
        results = []
        with psycopg.connect(self.dsn) as blocker:
            blocker.execute("SELECT pg_advisory_xact_lock(7312001)")
            worker = threading.Thread(target=lambda: results.append(self.gate()))
            worker.start()
            try:
                self.wait_lock()
                for table, assignment in (("current_object", "payload=payload"),
                    ("current_validation", "policy_version=policy_version"), ("fixture_authority", "data=data"),
                    ("fixture_source_fence", "data=data")):
                    with psycopg.connect(self.dsn) as mutator:
                        mutator.execute("SET LOCAL lock_timeout='200ms'")
                        with self.assertRaises(psycopg.errors.LockNotAvailable):
                            mutator.execute(f"UPDATE kavriva_objects.{table} SET {assignment}")
                        mutator.rollback()
            finally:
                blocker.commit()
                worker.join(7)
        self.assertEqual(results[0].reason_code, "COMMITTED")

    def test_generic_client_cannot_read_or_write_private_gate_tables(self):
        with psycopg.connect(self.dsn, autocommit=True) as conn:
            conn.execute("CREATE ROLE object_client NOLOGIN")
            conn.execute("SET ROLE object_client")
            for statement in ("SELECT * FROM kavriva_objects.current_object",
                              "DELETE FROM kavriva_objects.current_validation",
                              "SELECT * FROM kavriva_objects.activation_receipt"):
                with self.assertRaises(psycopg.errors.InsufficientPrivilege):
                    conn.execute(statement)
            conn.execute("RESET ROLE")
            conn.execute("DROP ROLE object_client")
