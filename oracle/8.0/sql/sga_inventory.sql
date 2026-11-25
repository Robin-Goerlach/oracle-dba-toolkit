-- SPDX-License-Identifier: MIT
-- SGA summary and total
-- Target: Oracle 8.0.5; class R; runtime NOT RUN.
-- Requires authorized SELECT on V$SGA.
-- Dedicated, authenticated SQL*Plus session only.
-- SQL error exits with rollback; no database modifications or files.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 120
COLUMN name FORMAT A35
COLUMN bytes FORMAT 999999999999999
COLUMN mib FORMAT 9999999990.99
PROMPT === SGA component sizes ===
SELECT name, value bytes, ROUND(value/1048576,2) mib
FROM v$sga ORDER BY name;
PROMPT === Total SGA ===
SELECT SUM(value) bytes, ROUND(SUM(value)/1048576,2) mib
FROM v$sga;
