-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT LPAD(' ', 2 * (level - 1)) ||
       DECODE (level,1,NULL,level-1 || '.' || pt.position || ' ') ||
       INITCAP(pt.operation) ||
       DECODE(pt.options,NULL,'',' (' || INITCAP(pt.options) || ')') plan,
       pt.object_name,
       pt.object_type,
       pt.bytes,
       pt.cost,
       pt.partition_start,
       pt.partition_stop
FROM   plan_table pt
START WITH pt.id = 0
  AND pt.statement_id = '&1'
CONNECT BY PRIOR pt.id = pt.parent_id
  AND pt.statement_id = '&1';
