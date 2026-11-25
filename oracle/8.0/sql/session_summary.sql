-- SPDX-License-Identifier: MIT
-- Oracle 8.0.5 target; class R; runtime NOT RUN.
-- Authorized SELECT access: V$SESSION.
-- Dedicated authenticated SQL*Plus session, no pending transaction.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 160
COLUMN status FORMAT A8
COLUMN server FORMAT A10
SELECT status, server, COUNT(*) session_count
FROM v$session GROUP BY status, server ORDER BY status, server;
