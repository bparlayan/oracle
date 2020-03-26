-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT table_name
	,monitoring
FROM dba_tables
WHERE OWNER = UPPER('&1')
	AND table_name = DECODE(UPPER('&2'), 'ALL', table_name, UPPER('&2'));
