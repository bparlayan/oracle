-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT t.table_name
	,Count(e.segment_name) extents
	,t.max_extents
	,t.num_rows "ROWS"
	,Trunc(t.initial_extent / 1024) "INITIAL K"
	,Trunc(t.next_extent / 1024) "NEXT K"
FROM all_tables t
	,dba_extents e
WHERE e.segment_name = t.table_name
	AND e.OWNER = t.OWNER
	AND t.OWNER = Upper('&&1')
GROUP BY t.table_name
	,t.max_extents
	,t.num_rows
	,t.initial_extent
	,t.next_extent
HAVING Count(e.segment_name) > 1
ORDER BY Count(e.segment_name) DESC;

SET PAGESIZE 18
SET VERIFY ON
