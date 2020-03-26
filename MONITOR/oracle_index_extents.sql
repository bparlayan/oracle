-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT i.index_name
	,Count(e.segment_name) extents
	,i.max_extents
	,t.num_rows "ROWS"
	,Trunc(i.initial_extent / 1024) "INITIAL K"
	,Trunc(i.next_extent / 1024) "NEXT K"
	,t.table_name
FROM all_tables t
	,all_indexes i
	,dba_extents e
WHERE i.table_name = t.table_name
	AND i.OWNER = t.OWNER
	AND e.segment_name = i.index_name
	AND e.OWNER = i.OWNER
	AND i.table_name = Decode(Upper('&&1'), 'ALL', i.table_name, Upper('&&1'))
	AND i.OWNER = Upper('&&2')
GROUP BY t.table_name
	,i.index_name
	,i.max_extents
	,t.num_rows
	,i.initial_extent
	,i.next_extent
HAVING Count(e.segment_name) > 5
ORDER BY Count(e.segment_name) DESC;

SET PAGESIZE 18
SET VERIFY ON
