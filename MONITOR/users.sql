-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------5
SELECT username
	,account_status
	,TO_CHAR(lock_date, 'DD-MON-YYYY') AS lock_date
	,TO_CHAR(expiry_date, 'DD-MON-YYYY') AS expiry_date
	,default_tablespace
	,temporary_tablespace
	,TO_CHAR(created, 'DD-MON-YYYY') AS created
	,PROFILE
	,initial_rsrc_consumer_group
	,editions_enabled
	,authentication_type
FROM dba_users
WHERE username LIKE UPPER('%&1%')
ORDER BY username;

SET VERIFY ON
