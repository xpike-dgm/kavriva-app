-- T-E3-016: additional defense, never product authorization.
-- The bounded server keeps its existing column/table privileges and must still
-- execute current E5 + E3 commit-time checks. No client receives an allow path.
do $$
declare
    target record;
    schema_name text;
begin
    for target in
        select n.nspname, c.relname
        from pg_class c join pg_namespace n on n.oid = c.relnamespace
        where n.nspname in ('kavriva_e3', 'kavriva_e5', 'kavriva_audit')
          and c.relkind in ('r', 'p')
    loop
        execute format('alter table %I.%I enable row level security', target.nspname, target.relname);
        execute format('create policy kavriva_server_defense on %I.%I '
            'for all to kavriva_consumer_api using (true) with check (true)',
            target.nspname, target.relname);
        execute format('create policy kavriva_client_block on %I.%I as restrictive '
            'for all to anon, authenticated using (false) with check (false)',
            target.nspname, target.relname);
    end loop;

    foreach schema_name in array array['kavriva_e3', 'kavriva_e5', 'kavriva_audit'] loop
        execute format('revoke all on schema %I from public, anon, authenticated', schema_name);
        execute format('revoke all on all tables in schema %I from public, anon, authenticated', schema_name);
        execute format('revoke all on all sequences in schema %I from public, anon, authenticated', schema_name);
        execute format('revoke all on all functions in schema %I from public, anon, authenticated', schema_name);
        -- These defaults cover objects created by this migration role only.
        -- Other creators must receive the same controls before deployment.
        execute format('alter default privileges in schema %I revoke all on tables from public, anon, authenticated', schema_name);
        execute format('alter default privileges in schema %I revoke all on sequences from public, anon, authenticated', schema_name);
        -- PUBLIC EXECUTE is a global default; a schema-only revoke cannot undo it.
    end loop;
end
$$;
alter default privileges revoke execute on functions from public;

-- Storage exists on Supabase; plain PostgreSQL fixtures have no Storage service.
-- Restrictive policies keep an accidental permissive policy from opening a
-- generic client path. No bucket, upload grant or signed URL is created here.
do $$
declare
    storage_table text;
begin
    foreach storage_table in array array['objects', 'buckets'] loop
        if to_regclass(format('storage.%I', storage_table)) is not null then
            execute format('alter table storage.%I enable row level security', storage_table);
            execute format('create policy kavriva_client_block on storage.%I as restrictive '
                'for all to anon, authenticated using (false) with check (false)', storage_table);
        end if;
    end loop;
end
$$;
