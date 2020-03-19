-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

COLUMN plan FORMAT A30
COLUMN comments FORMAT A30
COLUMN status FORMAT A10
SET LINESIZE 100

SELECT plan_id,
       plan,
       comments,
       status,
       mandatory
FROM   dba_cdb_rsrc_plans
ORDER BY plan;