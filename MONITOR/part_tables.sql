-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,table_name
	,partitioning_type
	,partition_count
FROM dba_part_tables
WHERE OWNER NOT IN (
		'SYS'
		,'SYSTEM'
		)
ORDER BY OWNER
	,table_name;
