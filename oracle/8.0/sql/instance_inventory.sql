-- Oracle8 DBA Toolkit: initial read-only inventory.
-- Target: Oracle 8.0.5; runtime compatibility not yet verified.
-- Requires authorized SELECT access to V$VERSION and V$INSTANCE.
-- Risk class R: no deliberate persistent database changes. Run in a dedicated SQL*Plus session.
WHENEVER SQLERROR EXIT FAILURE
SET PAGESIZE 60
SET LINESIZE 100
PROMPT === Oracle version ===
SELECT banner FROM v$version;
PROMPT === Instance identity ===
SELECT instance_name, host_name, version, startup_time, status
FROM v$instance;
