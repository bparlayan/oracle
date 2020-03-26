-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.index_name
	,a.partition_name
	,a.tablespace_name
	,a.initial_extent
	,a.next_extent
	,a.pct_increase
	,a.num_rows
FROM dba_ind_partitions a
WHERE a.index_name = Decode(Upper('&&1'), 'ALL', a.index_name, Upper('&&1'))
	AND a.index_owner = Upper('&&2')
ORDER BY a.index_name
	,a.partition_name / PROMPT

SET PAGESIZE 14
SET FEEDBACK ON
