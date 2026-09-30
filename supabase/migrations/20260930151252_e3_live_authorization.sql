-- Consumer maintenance authority. All tables stay outside exposed API schemas.
-- Supabase Auth owns auth.users/auth.sessions; Kavriva reads but never writes them.
create schema if not exists kavriva_audit;
revoke all on schema kavriva_audit from public;

create table kavriva_e5.consumer_enrollments (
    actor_id text primary key,
    tenant_id text not null unique,
    initial_motorcycle_id text not null,
    enrolled_at timestamptz not null default clock_timestamp()
);

create table kavriva_e3.negative_floors (
    tenant_id text not null,
    motorcycle_id text not null,
    floor_generation bigint not null default 0 check (floor_generation >= 0),
    blocked boolean not null default false,
    primary key (tenant_id, motorcycle_id),
    foreign key (tenant_id, motorcycle_id)
        references kavriva_e3.motorcycles (tenant_id, motorcycle_id)
);

create function kavriva_e3.reject_floor_regression()
returns trigger language plpgsql set search_path = '' as $$
begin
    if new.floor_generation < old.floor_generation then
        raise exception 'negative floor cannot move backward';
    end if;
    return new;
end
$$;
revoke all on function kavriva_e3.reject_floor_regression() from public;
create trigger floor_generation_monotonic
before update of floor_generation on kavriva_e3.negative_floors
for each row execute function kavriva_e3.reject_floor_regression();

create table kavriva_e3.runtime_versions (
    scope text primary key,
    release_generation bigint not null check (release_generation > 0),
    schema_generation bigint not null check (schema_generation > 0),
    config_generation bigint not null check (config_generation > 0),
    package_generation bigint not null check (package_generation > 0),
    min_client_generation bigint not null check (min_client_generation > 0),
    max_client_generation bigint not null check (max_client_generation >= min_client_generation)
);

insert into kavriva_e3.runtime_versions values
    ('maintenance', 1, 1, 1, 1, 1, 1);

create table kavriva_e3.operation_records (
    tenant_id text not null,
    operation_id text not null,
    actor_id text not null,
    action text not null,
    object_id text not null,
    fingerprint text not null,
    reason text not null,
    intended_effect text not null,
    status text not null check (status in ('PENDING', 'COMMITTED')),
    record_id text,
    result_generation bigint,
    created_at timestamptz not null default clock_timestamp(),
    primary key (tenant_id, operation_id),
    check ((status = 'PENDING' and record_id is null and result_generation is null) or
           (status = 'COMMITTED' and record_id is not null and result_generation is not null))
);

create table kavriva_audit.heads (
    tenant_id text primary key,
    last_sequence bigint not null default 0,
    last_digest text not null default repeat('0', 64)
);

create table kavriva_audit.events (
    tenant_id text not null,
    sequence bigint not null,
    receipt_id text not null unique,
    operation_id text not null,
    actor_id text not null,
    object_id text not null,
    action text not null,
    policy_version bigint not null,
    grant_id text not null,
    result text not null check (result in ('INTENT', 'COMMITTED')),
    previous_digest text not null,
    digest text not null,
    recorded_at timestamptz not null default clock_timestamp(),
    primary key (tenant_id, sequence)
);

create function kavriva_audit.reject_event_change()
returns trigger language plpgsql set search_path = '' as $$
begin
    raise exception 'audit events are write-once';
end
$$;

-- PostgreSQL row locks require UPDATE privilege. A write-protected marker
-- grants that lock privilege without letting the API mutate authority rows.
alter table kavriva_e5.consumer_enrollments add column lock_marker integer not null default 0;
alter table kavriva_e5.actor_epochs add column lock_marker integer not null default 0;
alter table kavriva_e5.current_grants add column lock_marker integer not null default 0;
alter table kavriva_e5.policy_heads add column lock_marker integer not null default 0;
alter table kavriva_e5.policy_rules add column lock_marker integer not null default 0;
alter table kavriva_e3.negative_floors add column lock_marker integer not null default 0;
alter table kavriva_e3.runtime_versions add column lock_marker integer not null default 0;

create function kavriva_e5.reject_lock_marker_change()
returns trigger language plpgsql set search_path = '' as $$
begin
    raise exception 'authority lock marker cannot change';
end
$$;
revoke all on function kavriva_e5.reject_lock_marker_change() from public;

create trigger enrollment_marker_write_once before update of lock_marker
on kavriva_e5.consumer_enrollments for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger epoch_marker_write_once before update of lock_marker
on kavriva_e5.actor_epochs for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger grant_marker_write_once before update of lock_marker
on kavriva_e5.current_grants for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger policy_head_marker_write_once before update of lock_marker
on kavriva_e5.policy_heads for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger policy_rule_marker_write_once before update of lock_marker
on kavriva_e5.policy_rules for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger floor_marker_write_once before update of lock_marker
on kavriva_e3.negative_floors for each row
execute function kavriva_e5.reject_lock_marker_change();
create trigger runtime_marker_write_once before update of lock_marker
on kavriva_e3.runtime_versions for each row
execute function kavriva_e5.reject_lock_marker_change();

-- Only this fixed, private function may lock Supabase-managed Auth rows.
-- It never writes to the auth schema and returns no personal user data.
create function kavriva_e5.provider_session_current(
    p_session_id uuid, p_actor_id uuid
) returns boolean language plpgsql security definer set search_path = '' as $$
declare
    matched boolean;
begin
    select true into matched
      from auth.sessions s join auth.users u on u.id = s.user_id
     where s.id = p_session_id and s.user_id = p_actor_id
     for share of s, u;
    return coalesce(matched, false);
end
$$;
revoke all on function kavriva_e5.provider_session_current(uuid, uuid)
    from public;

-- The command process uses a dedicated login that is made a member of this
-- NOLOGIN role during deployment. No password or hosted project is created here.
do $$
begin
    if not exists (select 1 from pg_roles where rolname = 'kavriva_consumer_api') then
        create role kavriva_consumer_api nologin;
    end if;
end
$$;
grant usage on schema kavriva_e3, kavriva_e5, kavriva_audit
    to kavriva_consumer_api;
grant select, insert on kavriva_e5.consumer_enrollments,
    kavriva_e5.actor_epochs, kavriva_e5.current_grants,
    kavriva_e5.policy_heads, kavriva_e5.policy_rules to kavriva_consumer_api;
grant select, insert on kavriva_e5.current_sessions to kavriva_consumer_api;
grant update (expires_at) on kavriva_e5.current_sessions
    to kavriva_consumer_api;
grant select, insert on kavriva_e3.motorcycles,
    kavriva_e3.maintenance_records, kavriva_e3.maintenance_revisions,
    kavriva_e3.negative_floors, kavriva_e3.operation_records
    to kavriva_consumer_api;
grant update (generation) on kavriva_e3.motorcycles,
    kavriva_e3.maintenance_records to kavriva_consumer_api;
grant update (status, record_id, result_generation)
    on kavriva_e3.operation_records to kavriva_consumer_api;
grant select on kavriva_e3.runtime_versions to kavriva_consumer_api;
grant select, insert on kavriva_audit.heads,
    kavriva_audit.events to kavriva_consumer_api;
grant update (last_sequence, last_digest) on kavriva_audit.heads
    to kavriva_consumer_api;
revoke all on auth.users, auth.sessions from kavriva_consumer_api;
grant execute on function kavriva_e5.provider_session_current(uuid, uuid)
    to kavriva_consumer_api;
grant update (lock_marker) on kavriva_e5.consumer_enrollments,
    kavriva_e5.actor_epochs, kavriva_e5.current_grants,
    kavriva_e5.policy_heads, kavriva_e5.policy_rules,
    kavriva_e3.negative_floors, kavriva_e3.runtime_versions
    to kavriva_consumer_api;

create trigger audit_event_write_once
before update or delete on kavriva_audit.events
for each row execute function kavriva_audit.reject_event_change();

revoke all on all tables in schema kavriva_audit from public;
revoke all on all functions in schema kavriva_audit from public;
revoke all on kavriva_e5.consumer_enrollments from public;
revoke all on kavriva_e3.negative_floors,
    kavriva_e3.runtime_versions, kavriva_e3.operation_records from public;
do $$
begin
    if exists (select 1 from pg_roles where rolname = 'anon') then
        execute 'revoke all on schema kavriva_audit from anon';
        execute 'revoke all on all tables in schema kavriva_audit from anon';
    end if;
    if exists (select 1 from pg_roles where rolname = 'authenticated') then
        execute 'revoke all on schema kavriva_audit from authenticated';
        execute 'revoke all on all tables in schema kavriva_audit from authenticated';
    end if;
end
$$;
