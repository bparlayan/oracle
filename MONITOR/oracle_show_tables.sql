-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT t.table_name
	,t.tablespace_name
	,t.num_rows
	,t.avg_row_len
	,t.blocks
	,t.empty_blocks
	,ROUND(t.blocks * ts.block_size / 1024 / 1024, 2) AS size_mb
FROM dba_tables t
JOIN dba_tablespaces ts ON t.tablespace_name = ts.tablespace_name
WHERE t.OWNER = UPPER('&1')
ORDER BY t.table_name;
