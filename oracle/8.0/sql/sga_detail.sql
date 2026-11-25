-- SPDX-License-Identifier: MIT
-- SGA allocations
-- Target: Oracle 8.0.5; class R; runtime NOT RUN.
-- Requires authorized SELECT on V$SGASTAT.
-- Dedicated, authenticated SQL*Plus session only.
-- SQL error exits with rollback; no database modifications or files.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 120
COLUMN name FORMAT A40
COLUMN bytes FORMAT 999999999999999
PROMPT === SGA allocation details (bytes) ===
SELECT name, bytes FROM v$sgastat ORDER BY bytes DESC, name;
