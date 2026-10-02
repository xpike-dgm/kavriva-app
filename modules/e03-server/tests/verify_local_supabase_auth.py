"""Exercise real local GoTrue signup, Auth verification and E3/E5 commit.

Run only after `supabase start` has applied the repository migrations. The
status JSON is written in a temporary CI directory and never committed.
"""

import base64
import json
import os
import sys
from datetime import date
from pathlib import Path
from io import BytesIO
from unittest.mock import patch
from urllib.parse import urlsplit, urlunsplit
from urllib.request import Request, urlopen
from uuid import uuid4

import psycopg
from psycopg import sql


APP = Path(__file__).resolve().parents[3]
for path in (
    APP / "modules/e03-server/public", APP / "modules/e03-server/internal",
    APP / "modules/e05-identity/public", APP / "modules/e05-identity/internal",
):
    sys.path.insert(0, str(path))
from commit_authorization import Verdict  # noqa: E402
from consumer_authority import SupabaseAuth  # noqa: E402
from maintenance_command import MaintenanceCommand, MaintenanceCommands  # noqa: E402
from maintenance_store import CREATE  # noqa: E402
from maintenance_api import application  # noqa: E402
from psycopg.conninfo import conninfo_to_dict, make_conninfo
from environment_binding import bind_environment, validate_database_identity


def _post(url, key, body, bearer=None):
    headers = {"apikey": key, "Content-Type": "application/json"}
    if bearer:
        headers["Authorization"] = "Bearer " + bearer
    request = Request(url, data=json.dumps(body).encode(), headers=headers,
                      method="POST")
    with urlopen(request, timeout=15) as response:
        return json.loads(response.read() or b"{}")


def main(status_path):
    status = json.loads(Path(status_path).read_text(encoding="utf-8"))
    api_url = status["API_URL"].rstrip("/")
    db_url = status["DB_URL"]
    anon_key = status["ANON_KEY"]
    email = "kavriva-" + uuid4().hex + "@example.test"
    signup = _post(api_url + "/auth/v1/signup", anon_key, {
        "email": email, "password": "LocalOnly-" + uuid4().hex,
    })
    token = signup["access_token"]
    encoded = token.split(".")[1]
    claims = json.loads(base64.urlsafe_b64decode(
        encoded + "=" * (-len(encoded) % 4)
    ))
    issuer = claims["iss"]
    if issuer != api_url + "/auth/v1":
        raise AssertionError("unexpected local Auth issuer")
    auth = SupabaseAuth(api_url, anon_key, issuer, allow_local_http=True)
    principal = auth.verify(token)
    local_password = uuid4().hex + uuid4().hex
    with psycopg.connect(db_url) as conn:
        # This disposable local Supabase image also creates provider databases
        # with PUBLIC CONNECT/TEMPORARY. The product login must not inherit
        # those capabilities. Tighten the fixture, never relax the preflight;
        # this does not apply an equivalent change to a hosted project.
        for database in ("_supabase", "storage_vectors"):
            if conn.execute("select 1 from pg_database where datname=%s",
                            (database,)).fetchone():
                conn.execute(sql.SQL(
                    "revoke connect, temporary on database {} from public"
                ).format(sql.Identifier(database)))
        conn.execute(sql.SQL("create role kavriva_ci_api login password {}").format(
            sql.Literal(local_password)
        ))
        conn.execute("grant kavriva_consumer_api to kavriva_ci_api")
    parsed = urlsplit(db_url)
    limited_url = urlunsplit((
        parsed.scheme,
        "kavriva_ci_api:" + local_password + "@" + parsed.netloc.rsplit("@", 1)[-1],
        parsed.path, parsed.query, parsed.fragment,
    ))
    params = conninfo_to_dict(limited_url)
    params.update(sslmode="disable",connect_timeout="10")
    limited_url = make_conninfo(**params)
    selected = {"KAVRIVA_ENVIRONMENT":"development",
                "KAVRIVA_DEVELOPMENT_DATABASE_DSN":limited_url,
                "KAVRIVA_DEVELOPMENT_SUPABASE_PUBLISHABLE_KEY":anon_key}
    try:
        with patch.dict(os.environ,selected,clear=True):
            validate_database_identity(bind_environment(os.environ))
    except ValueError:
        # Local disposable fixture metadata only: no DSN, password, token,
        # provider user or raw exception. Keep a failing preflight failing.
        with psycopg.connect(limited_url) as conn:
            rows = conn.execute("""
                select d.datname, a.privilege_type, a.is_grantable
                from pg_database d,
                     lateral aclexplode(coalesce(d.datacl,acldefault('d',d.datdba))) a
                where a.grantee=0 or a.grantee in
                    (select oid from pg_roles where pg_has_role(current_user,oid,'MEMBER'))
                order by 1,2,3
            """).fetchall()
        print("isolated fixture database ACL metadata: " + json.dumps(rows))
        raise AssertionError("isolated fixture role preflight failed") from None
    def request(path, body):
        encoded = json.dumps(body).encode()
        environ = {"REQUEST_METHOD":"POST", "PATH_INFO":path,
                   "HTTP_AUTHORIZATION":"Bearer " + token,
                   "CONTENT_TYPE":"application/json", "CONTENT_LENGTH":str(len(encoded)),
                   "wsgi.input":BytesIO(encoded)}
        # Isolated CI fixture contains no hosted or production credentials.
        with patch.dict(os.environ,selected,clear=True):
            return json.loads(b"".join(application(environ,lambda status,headers:None)))
    enrolled = request("/v1/consumer/enroll",{})
    if enrolled["verdict"] != Verdict.ALLOW.value:
        raise AssertionError("verified Auth user could not enroll: " +
                             enrolled["reason_code"])
    bike = enrolled["motorcycle_id"]
    command = MaintenanceCommand(
        action=CREATE, target_id=bike, operation_id=str(uuid4()),
        expected_generation=1, expected_policy_version=1,
        client_generation=1, performed_on=date.today(),
        odometer_km=100, outcome="Local Auth integration", safety_notes="",
    )
    body = {k:v for k,v in command.__dict__.items() if k not in ("action","correction_reason")}
    body["performed_on"] = body["performed_on"].isoformat()
    written = request("/v1/maintenance/records",body)
    if written["verdict"] != Verdict.ALLOW.value:
        raise AssertionError("verified Auth user could not write: " +
                             written["reason_code"])
    with psycopg.connect(db_url) as conn:
        actor = conn.execute(
            """select actor_id from kavriva_e3.maintenance_revisions
               where record_id = %s""", (written["record_id"],),
        ).fetchone()[0]
        if actor != principal.actor_id:
            raise AssertionError("effect actor differs from Auth user")
    _post(api_url + "/auth/v1/logout", anon_key, {}, token)
    with psycopg.connect(db_url) as conn:
        if conn.execute(
            "select 1 from auth.sessions where id = %s::uuid",
            (principal.session_id,),
        ).fetchone():
            raise AssertionError("logout did not remove the provider session")
    denied = request("/v1/maintenance/records",{**body,"operation_id":str(uuid4())})
    if denied["verdict"] == Verdict.ALLOW.value:
        raise AssertionError("signed-out Auth session still authorized a write")
    print("local Supabase Auth signup, guarded maintenance commit and logout: PASS")


if __name__ == "__main__":
    main(sys.argv[1])
