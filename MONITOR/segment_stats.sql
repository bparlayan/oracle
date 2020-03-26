-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT statistic#
	,name
FROM v$segstat_name
ORDER BY statistic#;

ACCEPT l_schema CHAR PROMPT 'Enter Schema: ' ACCEPT l_stat NUMBER PROMPT 'Enter Statistic#: '

SET VERIFY OFF

SELECT object_name
	,object_type
	,value
FROM v$segment_statistics
WHERE OWNER = UPPER('&l_schema')
	AND statistic# = & l_stat
ORDER BY value;
