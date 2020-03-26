-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT RPAD(' ', LEVEL * 2, ' ') || a.referenced_owner || '.' || a.referenced_name AS referenced_object
	,a.referenced_type
	,a.referenced_link_name
FROM all_dependencies a
WHERE a.OWNER NOT IN (
		'SYS'
		,'SYSTEM'
		,'PUBLIC'
		)
	AND a.referenced_owner NOT IN (
		'SYS'
		,'SYSTEM'
		,'PUBLIC'
		)
	AND a.referenced_type != 'NON-EXISTENT' START
WITH a.OWNER = UPPER('&1')
	AND a.name = UPPER('&2') CONNECT BY a.OWNER = PRIOR a.referenced_owner
	AND a.name = PRIOR a.referenced_name
	AND a.type = PRIOR a.referenced_type;

SET VERIFY ON
SET PAGESIZE 22
