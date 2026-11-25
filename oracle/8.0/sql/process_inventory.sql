-- SPDX-License-Identifier: MIT
-- Oracle 8.0.5 target; class R; runtime NOT RUN.
-- Authorized SELECT access: V$PROCESS.
-- Dedicated authenticated SQL*Plus session, no pending transaction.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 160
COLUMN spid FORMAT A15
COLUMN program FORMAT A50
COLUMN background FORMAT A10
SELECT pid, serial# process_serial, spid, background, program
FROM v$process ORDER BY pid;
