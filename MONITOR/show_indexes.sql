-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT table_owner
	,table_name
	,OWNER AS index_owner
	,index_name
	,tablespace_name
	,num_rows
	,STATUS
	,index_type
FROM dba_indexes
WHERE table_owner = UPPER('&1')
	AND table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2'))
ORDER BY table_owner
	,table_name
	,index_owner
	,index_name;
