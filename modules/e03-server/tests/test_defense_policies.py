"""Native PostgreSQL defense tests; real Storage HTTP proof lives in CI."""

import unittest

import psycopg
from psycopg import sql

import test_live_maintenance as live


class DefensePolicyTests(unittest.TestCase):
    setUpClass = classmethod(live.LiveMaintenanceTests.setUpClass.__func__)
    tearDownClass = classmethod(live.LiveMaintenanceTests.tearDownClass.__func__)
    setUp = live.LiveMaintenanceTests.setUp
    command = live.LiveMaintenanceTests.command

    def test_every_current_private_table_has_rls_and_client_block(self):
        with psycopg.connect(self.dsn) as conn:
            tables = conn.execute("""select n.nspname, c.relname, c.relrowsecurity
                from pg_class c join pg_namespace n on n.oid=c.relnamespace
                where n.nspname in ('kavriva_e3','kavriva_e5','kavriva_audit')
                and c.relkind='r'""").fetchall()
            self.assertTrue(tables)
            for schema, table, enabled in tables:
                with self.subTest(table=f"{schema}.{table}"):
                    self.assertTrue(enabled)
                    policies = conn.execute("""select policyname, permissive, roles, qual, with_check
                        from pg_policies where schemaname=%s and tablename=%s""",
                        (schema, table)).fetchall()
                    self.assertIn(('kavriva_client_block', 'RESTRICTIVE',
                                   ['anon', 'authenticated'], 'false', 'false'), policies)

    def test_client_crud_stays_blocked_even_after_accidental_grants_and_allow(self):
        # Deliberately remove ACL protection in this isolated fixture: RLS must
        # still deny both a known tenant's row and another actor's forged insert.
        with psycopg.connect(self.dsn) as conn:
            conn.execute('grant usage on schema kavriva_e3 to anon, authenticated')
            conn.execute('grant select, insert, update, delete on kavriva_e3.motorcycles to anon, authenticated')
            conn.execute("""create policy accidental_allow on kavriva_e3.motorcycles
                for all to anon, authenticated using (true) with check (true)""")
        for role in ('anon', 'authenticated'):
            with self.subTest(role=role), psycopg.connect(self.dsn) as conn:
                conn.execute(sql.SQL('set local role {}').format(sql.Identifier(role)))
                self.assertEqual(conn.execute('select * from kavriva_e3.motorcycles').fetchall(), [])
                self.assertEqual(conn.execute('update kavriva_e3.motorcycles set generation=generation+1').rowcount, 0)
                self.assertEqual(conn.execute('delete from kavriva_e3.motorcycles').rowcount, 0)
                with self.assertRaises(psycopg.errors.InsufficientPrivilege):
                    conn.execute("insert into kavriva_e3.motorcycles values ('forged','bike','PRIVATE',1)")
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute('select generation from kavriva_e3.motorcycles').fetchall(), [(1,)])

    def test_client_acl_and_rpc_privileges_are_absent(self):
        with psycopg.connect(self.dsn) as conn:
            for role in ('anon', 'authenticated'):
                for schema in ('kavriva_e3', 'kavriva_e5', 'kavriva_audit'):
                    self.assertFalse(conn.execute('select has_schema_privilege(%s,%s,\'USAGE\')',
                                                  (role, schema)).fetchone()[0])
                self.assertFalse(conn.execute("""select has_function_privilege(%s,
                    'kavriva_e5.provider_session_current(uuid,uuid)', 'EXECUTE')""", (role,)).fetchone()[0])
                self.assertFalse(conn.execute("select pg_has_role(%s,'kavriva_consumer_api','MEMBER')",
                                              (role,)).fetchone()[0])

    def test_future_creator_defaults_do_not_grant_client_table_or_function(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute('create table kavriva_e3.future_fixture (id integer)')
            conn.execute("create function kavriva_e3.future_fixture() returns integer language sql as 'select 1'")
            for role in ('anon', 'authenticated'):
                self.assertFalse(conn.execute("select has_table_privilege(%s,'kavriva_e3.future_fixture','SELECT')",
                                              (role,)).fetchone()[0])
                self.assertFalse(conn.execute("select has_function_privilege(%s,'kavriva_e3.future_fixture()','EXECUTE')",
                                              (role,)).fetchone()[0])

    def test_server_grants_are_not_product_authority(self):
        allowed = self.commands.execute('verified-token', self.command())
        self.assertEqual(allowed.verdict, live.Verdict.ALLOW)
        with psycopg.connect(self.dsn) as conn:
            conn.execute('update kavriva_e3.negative_floors set blocked=true')
        blocked = self.commands.execute('verified-token', self.command())
        self.assertNotEqual(blocked.verdict, live.Verdict.ALLOW)
        with psycopg.connect(self.dsn) as conn:
            self.assertEqual(conn.execute('select count(*) from kavriva_e3.maintenance_records').fetchone()[0], 1)


if __name__ == '__main__':
    unittest.main()
