"""Additional local Storage defense proof; preserve earlier probe byte integrity."""

import json
import sys
from pathlib import Path
from uuid import uuid4

import psycopg
from psycopg import sql

from verify_local_direct_paths import (
    PNG, assert_blocked, assert_success, main as verify_direct_paths, request, signup,
)


def main(status_path):
    status = json.loads(Path(status_path).read_text(encoding='utf-8'))
    api = status['API_URL'].rstrip('/')
    anon, service = status['ANON_KEY'], status['SERVICE_ROLE_KEY']
    storage = api + '/storage/v1'
    with psycopg.connect(status['DB_URL']) as conn:
        for table in ('objects', 'buckets'):
            policy = conn.execute("""select permissive, roles, qual, with_check
                from pg_policies where schemaname='storage' and tablename=%s
                and policyname='kavriva_client_block'""", (table,)).fetchone()
            if policy != ('RESTRICTIVE', ['anon', 'authenticated'], 'false', 'false'):
                raise AssertionError('Storage client defense policy missing')
            # This deliberately unsafe allow exists ONLY in isolated CI to
            # verify the restrictive defense survives accidental future grants.
            conn.execute(sql.SQL("""create policy kavriva_accidental_fixture_allow on storage.{}
                for all to anon, authenticated using (true) with check (true)""").format(sql.Identifier(table)))

    # Reuse the already-reviewed downloads/list/upload/delete/sign/Data API
    # negatives with both real local users, now under an accidental allow.
    verify_direct_paths(status_path)

    bucket = 'defense-fixture-' + uuid4().hex
    path = 'private.png'
    assert_success(request(storage + '/bucket', service, 'POST',
                           {'id': bucket, 'name': bucket, 'public': False}, service),
                   'private defense bucket')
    object_url = storage + '/object/' + bucket + '/' + path
    read_url = storage + '/object/authenticated/' + bucket + '/' + path
    assert_success(request(object_url, service, 'POST', PNG, service, 'image/png'), 'fixture upload')
    # Positive controls prove these route/payload forms work; malformed requests
    # cannot masquerade as authorization denial.
    assert_success(request(object_url, service, 'PUT', PNG, service, 'image/png'), 'server replacement')
    assert_success(request(object_url, service, 'POST', PNG, service, 'image/png',
                           {'x-upsert': 'true'}), 'server upsert')
    assert_success(request(storage + '/bucket/' + bucket, service, 'PUT',
                           {'public': False}, service), 'server bucket update')
    for label, token in (('anonymous', None), ('actor A', signup(api, anon)),
                         ('actor B', signup(api, anon))):
        assert_blocked(request(object_url, anon, 'PUT', b'replacement', token, 'image/png'),
                       label + ' replacement')
        assert_blocked(request(object_url, anon, 'POST', b'upsert', token, 'image/png',
                               {'x-upsert': 'true'}), label + ' upsert')
        assert_blocked(request(storage + '/bucket/' + bucket, anon, 'PUT',
                               {'public': True}, token), label + ' public conversion')
        read = request(read_url, service, token=service)
        assert_success(read, 'server verifies retained bytes')
        if read[1] != PNG:
            raise AssertionError('client replaced private bytes')
        with psycopg.connect(status['DB_URL']) as conn:
            if conn.execute('select public from storage.buckets where id=%s', (bucket,)).fetchone() != (False,):
                raise AssertionError('client changed bucket visibility')
    print('restrictive Storage defense under accidental allow and write probes: PASS')


if __name__ == '__main__':
    main(sys.argv[1])
