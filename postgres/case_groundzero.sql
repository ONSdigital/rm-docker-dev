DO $$
BEGIN
IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname='casesvc') THEN
   REVOKE ALL PRIVILEGES ON DATABASE postgres FROM casesvc;
END IF;
END$$;

DROP SCHEMA IF EXISTS casesvc CASCADE;
DROP ROLE IF EXISTS casesvc;

CREATE ROLE casesvc PASSWORD 'casesvc'
  NOSUPERUSER NOCREATEDB NOCREATEROLE NOREPLICATION INHERIT LOGIN;

CREATE SCHEMA casesvc AUTHORIZATION casesvc;

REVOKE ALL ON ALL TABLES IN SCHEMA casesvc FROM PUBLIC;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA casesvc FROM PUBLIC;
REVOKE CONNECT ON DATABASE postgres FROM PUBLIC;

GRANT CONNECT ON DATABASE postgres TO casesvc;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA casesvc TO casesvc;
GRANT ALL ON ALL SEQUENCES IN SCHEMA casesvc TO casesvc;
