-- T-E3-032: reserved nonproduction login; no password or activation in Git.
-- Deployment custody and independent execution review are separate evidence.
do $$
begin
    if not exists (select 1 from pg_roles where rolname = 'kavriva_staging_api') then
        create role kavriva_staging_api nologin inherit nosuperuser nocreatedb
            nocreaterole noreplication nobypassrls;
    elsif exists (
        select 1 from pg_roles where rolname = 'kavriva_staging_api'
            and (rolcanlogin or not rolinherit or rolsuper or rolcreatedb
                 or rolcreaterole or rolreplication or rolbypassrls)
    ) then
        raise exception 'Reserved staging identity is already active or unbounded';
    end if;
end $$;

grant kavriva_consumer_api to kavriva_staging_api;

do $$
begin
    if exists (
        select 1 from pg_roles
        where pg_has_role('kavriva_staging_api', oid, 'MEMBER')
            and rolname not in ('kavriva_staging_api', 'kavriva_consumer_api')
    ) then
        raise exception 'Unexpected staging identity membership';
    end if;
end $$;
