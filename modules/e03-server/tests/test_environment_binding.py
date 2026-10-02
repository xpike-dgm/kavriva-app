"""Environment mixups must hold before constructing Auth/database clients."""

import base64
import copy
import json
import sys
import secrets
import subprocess
import unittest
from dataclasses import replace
from io import BytesIO
from pathlib import Path
from unittest.mock import patch

APP = Path(__file__).resolve().parents[3]
for path in (APP / "modules/e03-server/public", APP / "modules/e03-server/internal",
             APP / "modules/e05-identity/public", APP / "modules/e05-identity/internal"):
    sys.path.insert(0, str(path))
from environment_binding import (CATALOG, EnvironmentBinding, bind_environment,
                                 validate_database_identity)
import maintenance_api
import psycopg
from psycopg import sql
from psycopg.conninfo import make_conninfo
from staging_credential import scram_verifier
import staging_credential as operator
import test_live_maintenance as pgfixture


def local_key(role="anon"):
    payload = base64.urlsafe_b64encode(json.dumps({"role": role}).encode()).decode().rstrip("=")
    return "header." + payload + ".fixture-signature"


class EnvironmentBindingTests(unittest.TestCase):
    def setUp(self):
        self.catalog = json.loads(CATALOG.read_text(encoding="utf-8"))
        self.local = {
            "KAVRIVA_ENVIRONMENT": "development",
            "KAVRIVA_DEVELOPMENT_DATABASE_DSN":
                "host=127.0.0.1 port=54322 dbname=postgres user=kavriva_ci_api "
                "password=development-only sslmode=disable connect_timeout=10",
            "KAVRIVA_DEVELOPMENT_SUPABASE_PUBLISHABLE_KEY": local_key(),
        }

    def test_selected_local_secrets_are_redacted(self):
        bound = bind_environment(self.local, self.catalog)
        self.assertEqual(bound.realm, "development")
        self.assertNotIn("development-only", repr(bound))
        self.assertNotIn(local_key(), repr(bound))

    def test_selected_realm_does_not_read_other_secrets(self):
        class SelectedOnly(dict):
            def __getitem__(self, key):
                if "PRODUCTION_" in key or "STAGING_" in key:
                    raise AssertionError("unselected secret access")
                return super().__getitem__(key)
        bind_environment(SelectedOnly(self.local), self.catalog)

    def test_missing_selector_or_selected_secret_never_falls_back(self):
        for missing in self.local:
            with self.subTest(missing=missing):
                env = dict(self.local)
                del env[missing]
                env.update(KAVRIVA_DATABASE_DSN=self.local["KAVRIVA_DEVELOPMENT_DATABASE_DSN"],
                           SUPABASE_PUBLISHABLE_KEY=local_key())
                with self.assertRaises(ValueError):
                    bind_environment(env, self.catalog)

    def test_held_staging_production_and_unknown_environment(self):
        for realm in ("staging", "production", "prod", "", "DEVELOPMENT"):
            with self.subTest(realm=realm), self.assertRaises(ValueError):
                bind_environment({**self.local, "KAVRIVA_ENVIRONMENT": realm}, self.catalog)

    def test_cross_realm_project_and_credential_aliases_rejected(self):
        for key in ("project_id", "api_url", "issuer", "dsn_ref", "key_ref"):
            with self.subTest(key=key):
                catalog = copy.deepcopy(self.catalog)
                catalog["environments"]["production"][key] = catalog["environments"]["staging"][key]
                with self.assertRaises(ValueError):
                    bind_environment(self.local, catalog)

    def test_whole_catalog_checked_even_when_other_environment_held(self):
        for key, value in (("database_role", "postgres"), ("issuer", "https://other/auth/v1"),
                           ("api_url", "https://evil.example"), ("state", "ACTIVE")):
            with self.subTest(key=key):
                catalog = copy.deepcopy(self.catalog)
                catalog["environments"]["staging"][key] = value
                with self.assertRaises(ValueError):
                    bind_environment(self.local, catalog)

    def test_database_cross_realm_or_admin_credentials_rejected(self):
        dsn = self.local["KAVRIVA_DEVELOPMENT_DATABASE_DSN"]
        for before, after in (("127.0.0.1", "db.tmcitwyzoahtvysxblty.supabase.co"),
                              ("54322", "5432"), ("dbname=postgres", "dbname=other"),
                              ("user=kavriva_ci_api", "user=postgres"),
                              ("password=development-only", ""),
                              ("sslmode=disable", "sslmode=require")):
            with self.subTest(after=after), self.assertRaises(ValueError):
                bind_environment({**self.local, "KAVRIVA_DEVELOPMENT_DATABASE_DSN":
                                  dsn.replace(before, after)}, self.catalog)

    def test_libpq_overrides_rejected(self):
        for extra in ("hostaddr=10.0.0.1", "service=production", "options='-c role=postgres'",
                      "passfile=production", "sslcert=production", "sslmode=verify-full"):
            with self.subTest(extra=extra), self.assertRaises(ValueError):
                bind_environment({**self.local, "KAVRIVA_DEVELOPMENT_DATABASE_DSN":
                                  self.local["KAVRIVA_DEVELOPMENT_DATABASE_DSN"] + " " + extra}, self.catalog)
        for variable in ("PGHOSTADDR", "PGSERVICE", "PGOPTIONS", "PGSSLMODE", "PGPASSWORD"):
            with self.subTest(variable=variable), self.assertRaises(ValueError):
                bind_environment({**self.local, variable: "other-realm"}, self.catalog)

    def test_privileged_or_malformed_key_rejected_without_leak(self):
        for key in (local_key("service_role"), "sb_secret_sensitive", "invalid", "h.!.s"):
            with self.subTest(key=key):
                with self.assertRaises(ValueError) as caught:
                    bind_environment({**self.local, "KAVRIVA_DEVELOPMENT_SUPABASE_PUBLISHABLE_KEY":key}, self.catalog)
                self.assertNotIn(key, str(caught.exception))

    def test_explicit_hosted_binding_requires_verified_tls_and_scoped_login(self):
        # This catalog and key are fixtures, not a hosted provisioning receipt.
        self.catalog["environments"]["staging"]["state"] = "BOUND"
        dsn = ("host=aws-1-eu-west-1.pooler.supabase.com port=5432 dbname=postgres "
               "user=kavriva_staging_api.tmcitwyzoahtvysxblty password=staging-only "
               "sslmode=verify-full sslrootcert=system connect_timeout=10")
        env = {"KAVRIVA_ENVIRONMENT":"staging", "KAVRIVA_STAGING_DATABASE_DSN":dsn,
               "KAVRIVA_STAGING_SUPABASE_PUBLISHABLE_KEY":"sb_publishable_fixture_only"}
        self.assertFalse(bind_environment(env, self.catalog).allow_local_http)
        for before, after in (("verify-full", "require"), ("kavriva_staging_api", "postgres"),
                              ("tmcitwyzoahtvysxblty", "abcdefghijklmnopqrst")):
            with self.subTest(after=after), self.assertRaises(ValueError):
                bind_environment({**env,"KAVRIVA_STAGING_DATABASE_DSN":dsn.replace(before,after)},self.catalog)
        for before,after in ((".tmcitwyzoahtvysxblty", ""), ("port=5432", "port=6543"),
                             ("sslrootcert=system", "sslrootcert=untrusted.pem"),
                             ("aws-1-eu-west-1", "aws-0-eu-west-1")):
            with self.subTest(after=after),self.assertRaises(ValueError):
                bind_environment({**env,"KAVRIVA_STAGING_DATABASE_DSN":dsn.replace(before,after)},self.catalog)

    def test_duplicate_json_field_and_corrupt_file_hold(self):
        for text in ('{"version":1,"version":1,"environments":{}}', "not json"):
            with patch.object(Path, "read_text", return_value=text), self.assertRaises(ValueError):
                bind_environment(self.local)
        with patch.object(Path,"read_text",side_effect=OSError("secret-path")), self.assertRaises(ValueError) as caught:
            bind_environment(self.local)
        self.assertNotIn("secret-path",str(caught.exception))

    def test_invalid_process_configuration_blocks_auth_db_and_request_override(self):
        request = {"KAVRIVA_ENVIRONMENT":"development", "HTTP_KAVRIVA_ENVIRONMENT":"development",
                   "HTTP_AUTHORIZATION":"Bearer fixture", "REQUEST_METHOD":"POST",
                   "PATH_INFO":"/v1/consumer/enroll", "wsgi.input":BytesIO(b"{}")}
        with patch.dict(maintenance_api.os.environ,{},clear=True), \
                patch.object(maintenance_api,"SupabaseAuth") as auth, \
                patch.object(maintenance_api,"MaintenanceCommands") as commands:
            response = []
            body = b"".join(maintenance_api.application(request,lambda status,headers:response.append(status)))
            self.assertEqual(response,["503 Service Unavailable"])
            self.assertEqual(json.loads(body),{"verdict":"HELD","reason_code":"CURRENT_AUTHORITY_UNAVAILABLE"})
            auth.assert_not_called();commands.assert_not_called()

    def test_entrypoint_uses_selected_binding_and_rechecks_after_change(self):
        with patch.dict(maintenance_api.os.environ,self.local,clear=True), \
                patch.object(maintenance_api,"validate_database_identity") as identity, \
                patch.object(maintenance_api,"SupabaseAuth") as auth, \
                patch.object(maintenance_api,"MaintenanceCommands") as commands:
            maintenance_api._configured_app()
            self.assertEqual(commands.call_args.args[0],self.local["KAVRIVA_DEVELOPMENT_DATABASE_DSN"])
            self.assertTrue(auth.call_args.kwargs["allow_local_http"])
            maintenance_api.os.environ["KAVRIVA_ENVIRONMENT"]="production"
            with self.assertRaises(ValueError):
                maintenance_api._configured_app()
            self.assertEqual(commands.call_count,1)
            self.assertEqual(identity.call_count,1)


class ActualDatabaseRoleTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # Reuse only the isolated PostgreSQL infrastructure, not product fixtures.
        pgfixture.LiveMaintenanceTests.setUpClass.__func__(cls)
        with psycopg.connect(cls.dsn) as conn:
            conn.execute("create role kavriva_consumer_api nologin")
            conn.execute("create role kavriva_ci_api login password 'fixture-only'")
            conn.execute("grant kavriva_consumer_api to kavriva_ci_api")
            conn.execute("create role unexpected_owner nologin")
        hba = cls.data / "pg_hba.conf"
        hba.write_text("host all kavriva_ci_api 127.0.0.1/32 scram-sha-256\n" +
                       hba.read_text(encoding="utf-8"),encoding="utf-8")
        subprocess.run([str(cls.pg_ctl),"-D",str(cls.data),"reload"],check=True,
                       stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        cls.binding = EnvironmentBinding("development", "http://127.0.0.1:54321",
            "http://127.0.0.1:54321/auth/v1", True,
            f"host=127.0.0.1 port={cls.port} dbname=postgres user=kavriva_ci_api "
            "password=fixture-only sslmode=disable connect_timeout=10",local_key())

    @classmethod
    def tearDownClass(cls):
        pgfixture.LiveMaintenanceTests.tearDownClass.__func__(cls)

    def tearDown(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("alter role kavriva_ci_api nosuperuser nocreaterole nocreatedb "
                         "noreplication nobypassrls inherit login password 'fixture-only'")
            conn.execute("alter role kavriva_consumer_api nosuperuser nocreaterole nocreatedb "
                         "noreplication nobypassrls inherit nologin")
            conn.execute("revoke unexpected_owner from kavriva_ci_api")
            conn.execute("revoke unexpected_owner from kavriva_consumer_api")
            conn.execute("grant kavriva_consumer_api to kavriva_ci_api")
            conn.execute("drop schema if exists unbounded_owner cascade")

    def test_actual_bounded_login_passes_readonly_inspection(self):
        validate_database_identity(self.binding)

    def test_operator_scram_only_authenticates_issued_secret(self):
        password=secrets.token_urlsafe(48)
        with psycopg.connect(self.dsn) as conn:
            conn.execute(sql.SQL("alter role kavriva_ci_api password {}").format(
                sql.Literal(scram_verifier(password))))
        dsn=make_conninfo(self.binding.database_dsn,password=password)
        validate_database_identity(replace(self.binding,database_dsn=dsn))
        with self.assertRaises(ValueError):
            validate_database_identity(replace(self.binding,database_dsn=make_conninfo(
                dsn,password="wrong-fixture-secret")))

    def test_correctly_named_but_privileged_login_holds(self):
        for privilege in ("superuser","createrole","createdb","replication","bypassrls"):
            with self.subTest(privilege=privilege):
                with psycopg.connect(self.dsn) as conn:
                    conn.execute("alter role kavriva_ci_api " + privilege)
                with self.assertRaises(ValueError):
                    validate_database_identity(self.binding)
                self.tearDown()

    def test_extra_direct_and_transitive_memberships_hold(self):
        for member in ("kavriva_ci_api","kavriva_consumer_api"):
            with self.subTest(member=member):
                with psycopg.connect(self.dsn) as conn:
                    conn.execute("grant unexpected_owner to " + member)
                with self.assertRaises(ValueError):
                    validate_database_identity(self.binding)
                self.tearDown()

    def test_missing_bounded_membership_and_privileged_parent_hold(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("revoke kavriva_consumer_api from kavriva_ci_api")
        with self.assertRaises(ValueError):
            validate_database_identity(self.binding)
        self.tearDown()
        with psycopg.connect(self.dsn) as conn:
            conn.execute("alter role kavriva_consumer_api bypassrls")
        with self.assertRaises(ValueError):
            validate_database_identity(self.binding)

    def test_object_owner_is_held_before_auth_or_commands(self):
        with psycopg.connect(self.dsn) as conn:
            conn.execute("create schema unbounded_owner authorization kavriva_ci_api")
        with patch.object(maintenance_api,"bind_environment",return_value=self.binding), \
                patch.object(maintenance_api,"SupabaseAuth") as auth, \
                patch.object(maintenance_api,"MaintenanceCommands") as commands:
            response=[]
            body=b"".join(maintenance_api.application({},lambda status,headers:response.append(status)))
            self.assertEqual(response,["503 Service Unavailable"])
            self.assertEqual(json.loads(body)["verdict"],"HELD")
            auth.assert_not_called();commands.assert_not_called()


class StagingIssuanceFailureTests(unittest.TestCase):
    """Operator failure fencing; no provider or OS credential store is touched."""
    def setUp(self):
        self.store = unittest.mock.Mock()
        self.created = False
        self.deleted = False
        self.secret = None
        def read(target):
            return "sbp_fixture_only" if target == "Supabase CLI:supabase" else self.secret
        def create(value):
            self.created = True; self.secret = value
        def delete():
            self.deleted = True; self.secret = None
        self.store.read.side_effect=read
        self.store.create.side_effect=create
        self.store.delete.side_effect=delete
        self.actions=[]
        self.defense=True
        self.cleanup_confirmed=True

    def api(self,token,method,path,body):
        if path == "/database/migrations":
            self.actions.append(body["name"])
            return None
        if "defense_ready" in body["query"]:
            return [{"defense_ready":self.defense}]
        if "pg_has_role" in body["query"]:
            return [{"rolname":name,"rolcanlogin":False,"rolinherit":True,
                     "rolsuper":False,"rolcreaterole":False,"rolcreatedb":False,
                     "rolreplication":False,"rolbypassrls":False}
                    for name in (operator.ROLE,"kavriva_consumer_api")]
        return [{"rolcanlogin":not self.cleanup_confirmed}]

    def test_missing_defense_cannot_issue_or_store_credential(self):
        self.defense=False
        with patch.dict(operator.os.environ,{},clear=True), \
                patch.object(operator,"_Store",return_value=self.store), \
                patch.object(operator,"_api",side_effect=self.api):
            with self.assertRaisesRegex(ValueError,"RESERVED_ROLE_UNBOUNDED"):
                operator.issue("sb_publishable_fixture_only")
        self.assertFalse(self.created)
        self.assertEqual(self.actions,[])

    def test_failed_role_proof_disables_and_confirms_before_store_cleanup(self):
        with patch.dict(operator.os.environ,{},clear=True), \
                patch.object(operator,"_Store",return_value=self.store), \
                patch.object(operator,"_api",side_effect=self.api), \
                patch.object(operator,"_http",return_value={}), \
                patch.object(operator,"validate_database_identity",side_effect=ValueError("unbounded")):
            with self.assertRaisesRegex(ValueError,"ISSUANCE_HELD_CLEANUP_VERIFIED"):
                operator.issue("sb_publishable_fixture_only")
        self.assertEqual(self.actions,["e3_staging_runtime_credential_v1","e3_staging_runtime_credential_v1_hold"])
        self.assertTrue(self.created);self.assertTrue(self.deleted)

    def test_uncertain_disable_retains_custody_and_reports_unconfirmed_hold(self):
        self.cleanup_confirmed=False
        with patch.dict(operator.os.environ,{},clear=True), \
                patch.object(operator,"_Store",return_value=self.store), \
                patch.object(operator,"_api",side_effect=self.api), \
                patch.object(operator,"_http",return_value={}), \
                patch.object(operator,"validate_database_identity",side_effect=ValueError("unbounded")):
            with self.assertRaisesRegex(ValueError,"ISSUANCE_CLEANUP_UNCONFIRMED"):
                operator.issue("sb_publishable_fixture_only")
        self.assertTrue(self.created);self.assertFalse(self.deleted)


if __name__ == "__main__":
    unittest.main()
