-- Private canonical maintenance history. User entry is not verified completion.
-- Runtime grants, protected audit and production activation are separate gates.
create schema if not exists kavriva_e3;
revoke all on schema kavriva_e3 from public;

create table kavriva_e3.motorcycles (
    tenant_id text not null,
    motorcycle_id text not null,
    classification text not null check (length(btrim(classification)) > 0),
    generation bigint not null default 1 check (generation > 0),
    primary key (tenant_id, motorcycle_id)
);

create table kavriva_e3.maintenance_records (
    tenant_id text not null,
    record_id text not null,
    motorcycle_id text not null,
    generation bigint not null check (generation > 0),
    created_by text not null check (length(btrim(created_by)) > 0),
    created_at timestamptz not null default clock_timestamp(),
    primary key (tenant_id, record_id),
    foreign key (tenant_id, motorcycle_id)
        references kavriva_e3.motorcycles (tenant_id, motorcycle_id)
);

create table kavriva_e3.maintenance_revisions (
    tenant_id text not null,
    record_id text not null,
    generation bigint not null check (generation > 0),
    operation_id text not null check (length(btrim(operation_id)) > 0),
    actor_id text not null check (length(btrim(actor_id)) > 0),
    recorded_at timestamptz not null default clock_timestamp(),
    performed_on date not null,
    odometer_km bigint check (odometer_km is null or odometer_km >= 0),
    outcome text not null check (length(btrim(outcome)) > 0),
    safety_notes text not null default '',
    evidence_level text not null default 'USER_REPORTED'
        check (evidence_level = 'USER_REPORTED'),
    correction_reason text,
    primary key (tenant_id, record_id, generation),
    unique (tenant_id, operation_id),
    foreign key (tenant_id, record_id)
        references kavriva_e3.maintenance_records (tenant_id, record_id),
    check (generation = 1 or
           (correction_reason is not null and length(btrim(correction_reason)) > 0))
);

alter table kavriva_e3.maintenance_records
    add constraint current_maintenance_revision
    foreign key (tenant_id, record_id, generation)
    references kavriva_e3.maintenance_revisions (tenant_id, record_id, generation)
    deferrable initially deferred;

create function kavriva_e3.reject_maintenance_revision_change()
returns trigger
language plpgsql
set search_path = ''
as $$
begin
    raise exception 'maintenance revisions are write-once';
end
$$;

create trigger maintenance_revision_write_once
before update or delete on kavriva_e3.maintenance_revisions
for each row execute function kavriva_e3.reject_maintenance_revision_change();

revoke all on all tables in schema kavriva_e3 from public;
revoke all on all functions in schema kavriva_e3 from public;
do $$
begin
    if exists (select 1 from pg_roles where rolname = 'anon') then
        execute 'revoke all on schema kavriva_e3 from anon';
        execute 'revoke all on all tables in schema kavriva_e3 from anon';
    end if;
    if exists (select 1 from pg_roles where rolname = 'authenticated') then
        execute 'revoke all on schema kavriva_e3 from authenticated';
        execute 'revoke all on all tables in schema kavriva_e3 from authenticated';
    end if;
end
$$;
