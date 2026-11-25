-- SPDX-License-Identifier: MIT
-- Oracle 8.0.5 target; class R; runtime NOT RUN.
-- Authorized SELECT access: V$SESSION, V$PROCESS.
-- Dedicated authenticated SQL*Plus session, no pending transaction.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 160
-- Legacy outer join preserves sessions without a matching process.
-- SPID is server-side; SESSION.PROCESS is client-side.
COLUMN username FORMAT A30
COLUMN server FORMAT A10
COLUMN server_spid FORMAT A15
COLUMN client_pid FORMAT A15
SELECT s.sid, s.serial#, s.username, s.server,
       s.process client_pid, p.pid oracle_pid, p.spid server_spid
FROM v$session s, v$process p
WHERE s.paddr = p.addr(+)
ORDER BY s.sid;
