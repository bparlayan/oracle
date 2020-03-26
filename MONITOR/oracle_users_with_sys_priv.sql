-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT username
	,lock_date
	,expiry_date
FROM dba_users
WHERE username IN (
		SELECT grantee
		FROM dba_sys_privs
		WHERE privilege = UPPER('&1')
		)
ORDER BY username;
