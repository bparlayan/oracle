-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.user_name
	,a.sid
	,a.sql_text
FROM v$open_cursor a
ORDER BY 1
	,2 /
