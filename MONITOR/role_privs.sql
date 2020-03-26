-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.ROLE
	,a.granted_role
	,a.admin_option
FROM role_role_privs a
WHERE a.ROLE = DECODE(UPPER('&1'), 'ALL', a.ROLE, UPPER('&1'))
ORDER BY a.ROLE
	,a.granted_role;

SELECT a.grantee
	,a.granted_role
	,a.admin_option
	,a.default_role
FROM dba_role_privs a
WHERE a.grantee = DECODE(UPPER('&1'), 'ALL', a.grantee, UPPER('&1'))
ORDER BY a.grantee
	,a.granted_role;

SELECT a.ROLE
	,a.privilege
	,a.admin_option
FROM role_sys_privs a
WHERE a.ROLE = DECODE(UPPER('&1'), 'ALL', a.ROLE, UPPER('&1'))
ORDER BY a.ROLE
	,a.privilege;

SELECT a.ROLE
	,a.OWNER
	,a.table_name
	,a.column_name
	,a.privilege
	,a.grantable
FROM role_tab_privs a
WHERE a.ROLE = DECODE(UPPER('&1'), 'ALL', a.ROLE, UPPER('&1'))
ORDER BY a.ROLE
	,a.OWNER
	,a.table_name;

SET VERIFY ON
