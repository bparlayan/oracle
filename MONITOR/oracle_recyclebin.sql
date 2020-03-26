-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,original_name
	,object_name
	,operation
	,type
	,space AS space_blks
	,ROUND((space * 8) / 1024, 2) space_mb
FROM dba_recyclebin
WHERE OWNER = DECODE(UPPER('&1'), 'ALL', OWNER, UPPER('&1'))
ORDER BY 1
	,2;

SET VERIFY ON
