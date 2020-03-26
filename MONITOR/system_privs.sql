-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT privilege
	,grantee
	,admin_option
FROM dba_sys_privs
WHERE privilege LIKE UPPER('%&1%')
ORDER BY privilege
	,grantee;

SET VERIFY ON
