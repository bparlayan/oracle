-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------

SELECT username
	,lock_date
	,expiry_date
FROM dba_users
WHERE username IN (
		SELECT grantee
		FROM dba_role_privs
		WHERE granted_role = UPPER('&1')
		)
ORDER BY username;

SET VERIFY ON
