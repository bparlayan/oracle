-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.type
	,a.OWNER
	,a.name
FROM all_dependencies a
WHERE a.referenced_owner = DECODE(UPPER('&1'), 'ALL', a.referenced_owner, UPPER('&1'))
	AND a.referenced_name = UPPER('&2')
ORDER BY 1
	,2
	,3;

SET PAGESIZE 22
SET VERIFY ON
