-- SPDX-License-Identifier: MIT
-- Selected memory parameters
-- Target: Oracle 8.0.5; class R; runtime NOT RUN.
-- Requires authorized SELECT on V$PARAMETER.
-- Dedicated, authenticated SQL*Plus session only.
-- SQL error exits with rollback; no database modifications or files.
-- Reference: Oracle8 Reference A58242-01, chapter 3.
WHENEVER SQLERROR EXIT FAILURE ROLLBACK
SET PAGESIZE 60
SET LINESIZE 120
COLUMN name FORMAT A30
COLUMN value FORMAT A60
PROMPT === Selected effective session parameter values ===
SELECT name, value FROM v$parameter
WHERE name IN ('db_block_size','db_block_buffers','shared_pool_size',
 'log_buffer','sort_area_size','sort_area_retained_size','lock_sga')
ORDER BY name;
