-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT PROFILE
	,resource_type
	,resource_name
	,limit
FROM dba_profiles
WHERE PROFILE LIKE (DECODE(UPPER('&1'), 'ALL', '%', UPPER('%&1%')))
ORDER BY PROFILE
	,resource_type
	,resource_name;

CLEAR BREAKS

SET LINESIZE 80 PAGESIZE 14 VERIFY ON
