-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.index_name
	,a.column_name
	,a.column_position
FROM all_ind_columns a
	,all_indexes b
WHERE b.OWNER = UPPER('&1')
	AND b.table_name = UPPER('&2')
	AND b.index_name = a.index_name
	AND b.OWNER = a.index_owner
ORDER BY 1
	,3;

SET PAGESIZE 18 VERIFY ON
