-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.granted_role
	,a.admin_option
FROM user_role_privs a
ORDER BY a.granted_role;

SELECT a.privilege
	,a.admin_option
FROM user_sys_privs a
ORDER BY a.privilege;

SET VERIFY ON
