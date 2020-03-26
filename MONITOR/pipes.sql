-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT ownerid
	,name
	,type
	,pipe_size
FROM v$db_pipes
ORDER BY 1
	,2;
