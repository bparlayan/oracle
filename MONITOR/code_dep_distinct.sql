-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT DISTINCT a.referenced_owner || '.' || a.referenced_name AS referenced_object
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
	AND a.referenced_type != 'NON-EXISTENT'
	AND a.referenced_type = DECODE(UPPER('&3'), 'ALL', a.referenced_type, UPPER('&3')) START
WITH a.OWNER = UPPER('&1')
	AND a.name = UPPER('&2') CONNECT BY a.OWNER = PRIOR a.referenced_owner
	AND a.name = PRIOR a.referenced_name
	AND a.type = PRIOR a.referenced_type;

SET VERIFY ON
SET PAGESIZE 22
