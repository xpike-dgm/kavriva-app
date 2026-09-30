-- Consumer maintenance authority. All tables stay outside exposed API schemas.
-- Supabase Auth owns auth.users/auth.sessions; Kavriva reads but never writes them.
create schema if not exists kavriva_audit;
revoke all on schema kavriva_audit from public;

create table kavriva_e5.consumer_enrollments (
    actor_id text primary key,
    tenant_id text not null unique,
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
