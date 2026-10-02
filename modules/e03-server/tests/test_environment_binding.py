"""Environment mixups must hold before constructing Auth/database clients."""

import base64
import copy
import json
import sys
import unittest
from io import BytesIO
from pathlib import Path
from unittest.mock import patch

APP = Path(__file__).resolve().parents[3]
for path in (APP / "modules/e03-server/public", APP / "modules/e03-server/internal",
             APP / "modules/e05-identity/public", APP / "modules/e05-identity/internal"):
    sys.path.insert(0, str(path))
from environment_binding import CATALOG, bind_environment
import maintenance_api


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
        dsn = ("host=db.tmcitwyzoahtvysxblty.supabase.co port=5432 dbname=postgres "
               "user=kavriva_staging_api password=staging-only sslmode=verify-full connect_timeout=10")
        env = {"KAVRIVA_ENVIRONMENT":"staging", "KAVRIVA_STAGING_DATABASE_DSN":dsn,
               "KAVRIVA_STAGING_SUPABASE_PUBLISHABLE_KEY":"sb_publishable_fixture_only"}
        self.assertFalse(bind_environment(env, self.catalog).allow_local_http)
        for before, after in (("verify-full", "require"), ("kavriva_staging_api", "postgres"),
                              ("tmcitwyzoahtvysxblty", "abcdefghijklmnopqrst")):
            with self.subTest(after=after), self.assertRaises(ValueError):
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
                patch.object(maintenance_api,"SupabaseAuth") as auth, \
                patch.object(maintenance_api,"MaintenanceCommands") as commands:
            maintenance_api._configured_app()
            self.assertEqual(commands.call_args.args[0],self.local["KAVRIVA_DEVELOPMENT_DATABASE_DSN"])
            self.assertTrue(auth.call_args.kwargs["allow_local_http"])
            maintenance_api.os.environ["KAVRIVA_ENVIRONMENT"]="production"
            with self.assertRaises(ValueError):
                maintenance_api._configured_app()
            self.assertEqual(commands.call_count,1)


if __name__ == "__main__":
    unittest.main()
