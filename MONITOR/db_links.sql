-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,db_link
	,username
	,host
FROM dba_db_links
ORDER BY OWNER
	,db_link;
