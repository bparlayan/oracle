-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.referenced_type
	,a.referenced_owner
	,a.referenced_name
	,a.referenced_link_name
FROM all_dependencies a
WHERE a.OWNER = DECODE(UPPER('&1'), 'ALL', a.referenced_owner, UPPER('&1'))
	AND a.name = UPPER('&2')
ORDER BY 1
	,2
	,3;

SET VERIFY ON
SET PAGESIZE 22
