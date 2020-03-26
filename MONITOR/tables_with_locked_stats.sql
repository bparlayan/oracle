-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,table_name
	,stattype_locked
FROM dba_tab_statistics
WHERE stattype_locked IS NOT NULL
ORDER BY OWNER
	,table_name;
