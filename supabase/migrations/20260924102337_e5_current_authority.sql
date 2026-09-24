-- T-E5-003: private, current E5 decision inputs. No precomputed ALLOW row.
-- Only a trusted server role may receive access in a later deployment task.
create schema if not exists kavriva_e5;
revoke all on schema kavriva_e5 from public;

create table kavriva_e5.actor_epochs (
    tenant_id text not null,
    actor_id text not null,
    security_epoch bigint not null check (security_epoch >= 0),
    primary key (tenant_id, actor_id)
);

create table kavriva_e5.current_sessions (
    session_id text primary key,
    tenant_id text not null,
    actor_id text not null,
    workload_id text not null,
    issuer_id text not null,
    assurance text not null,
    security_epoch bigint not null check (security_epoch >= 0),
    expires_at timestamptz not null,
    revoked_at timestamptz,
    step_up_operation_id text,
    step_up_expires_at timestamptz,
    foreign key (tenant_id, actor_id)
        references kavriva_e5.actor_epochs (tenant_id, actor_id)
);

create table kavriva_e5.current_grants (
    grant_id text primary key,
    tenant_id text not null,
    actor_id text not null,
    scope text not null,
    action text not null,
    role text not null,
    delegation_chain text not null,
    competence text not null,
    independent boolean not null,
    expires_at timestamptz not null,
    revoked_at timestamptz,
    foreign key (tenant_id, actor_id)
        references kavriva_e5.actor_epochs (tenant_id, actor_id)
);

create table kavriva_e5.policy_heads (
    tenant_id text primary key,
    policy_version bigint not null check (policy_version >= 0)
);

create table kavriva_e5.policy_rules (
    tenant_id text not null,
    policy_version bigint not null check (policy_version >= 0),
    action text not null,
    scope text not null,
    classification text not null,
    role text not null,
    verdict text not null check (verdict in ('ALLOW', 'DENY', 'HELD')),
    required_assurance text not null,
    required_competence text not null,
    requires_independence boolean not null,
    requires_step_up boolean not null,
    primary key (tenant_id, policy_version, action, scope, classification, role),
    foreign key (tenant_id) references kavriva_e5.policy_heads (tenant_id)
);

-- A private schema is not an API surface. Supabase roles may exist at migration
-- time, while a plain PostgreSQL test database has only the PUBLIC pseudo-role.
revoke all on all tables in schema kavriva_e5 from public;
do $$
begin
    if exists (select 1 from pg_roles where rolname = 'anon') then
        execute 'revoke all on schema kavriva_e5 from anon';
        execute 'revoke all on all tables in schema kavriva_e5 from anon';
    end if;
    if exists (select 1 from pg_roles where rolname = 'authenticated') then
        execute 'revoke all on schema kavriva_e5 from authenticated';
        execute 'revoke all on all tables in schema kavriva_e5 from authenticated';
    end if;
end
$$;
