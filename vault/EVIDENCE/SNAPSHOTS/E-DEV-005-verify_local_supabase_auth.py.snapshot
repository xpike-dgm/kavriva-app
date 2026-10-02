"""Exercise real local GoTrue signup, Auth verification and E3/E5 commit.

Run only after `supabase start` has applied the repository migrations. The
status JSON is written in a temporary CI directory and never committed.
"""

import base64
import json
import sys
from datetime import date
from pathlib import Path
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
    service = MaintenanceCommands(limited_url, auth)
    enrolled = service.enroll(token)
    if enrolled.verdict != Verdict.ALLOW:
        raise AssertionError("verified Auth user could not enroll: " +
                             enrolled.reason_code)
    bike = enrolled.effect_result.motorcycle_id
    command = MaintenanceCommand(
        action=CREATE, target_id=bike, operation_id=str(uuid4()),
        expected_generation=1, expected_policy_version=1,
        client_generation=1, performed_on=date.today(),
        odometer_km=100, outcome="Local Auth integration", safety_notes="",
    )
    written = service.execute(token, command)
    if written.verdict != Verdict.ALLOW:
        raise AssertionError("verified Auth user could not write: " +
                             written.reason_code)
    with psycopg.connect(db_url) as conn:
        actor = conn.execute(
            """select actor_id from kavriva_e3.maintenance_revisions
               where record_id = %s""", (written.effect_result.record_id,),
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
    denied = service.execute(token, MaintenanceCommand(
        **{**command.__dict__, "operation_id": str(uuid4())}
    ))
    if denied.verdict == Verdict.ALLOW:
        raise AssertionError("signed-out Auth session still authorized a write")
    print("local Supabase Auth signup, guarded maintenance commit and logout: PASS")


if __name__ == "__main__":
    main(sys.argv[1])
