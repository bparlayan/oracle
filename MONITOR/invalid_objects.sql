-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,object_type
	,object_name
	,STATUS
FROM dba_objects
WHERE STATUS = 'INVALID'
ORDER BY OWNER
	,object_type
	,object_name;
