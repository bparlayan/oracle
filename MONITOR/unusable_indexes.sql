-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,index_name
	,index_type
	,table_owner
	,table_name table_type
FROM dba_indexes
WHERE OWNER = DECODE(UPPER('&1'), 'ALL', OWNER, UPPER('&1'))
	AND STATUS NOT IN (
		'VALID'
		,'N/A'
		)
ORDER BY OWNER
	,index_name;
