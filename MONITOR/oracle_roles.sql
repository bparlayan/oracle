-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.ROLE
	,a.password_required
	,a.authentication_type
FROM dba_roles a
ORDER BY a.ROLE;

SET VERIFY ON
