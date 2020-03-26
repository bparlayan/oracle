-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SET LINESIZE 200 VERIFY OFF

SELECT grantee
	,privilege
	,admin_option
FROM dba_sys_privs
WHERE grantee = UPPER('&1')
ORDER BY grantee
	,privilege;

SET VERIFY ON
