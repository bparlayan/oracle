-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.table_name
	,a.partition_name
	,a.tablespace_name
	,a.initial_extent
	,a.next_extent
	,a.pct_increase
	,a.num_rows
	,a.avg_row_len
FROM dba_tab_partitions a
WHERE a.table_name = Decode(Upper('&&1'), 'ALL', a.table_name, Upper('&&1'))
	AND a.table_owner = Upper('&&2')
ORDER BY a.table_name
	,a.partition_name /

SET PAGESIZE 14
SET FEEDBACK ON
