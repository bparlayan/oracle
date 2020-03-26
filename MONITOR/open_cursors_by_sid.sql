-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT oc.sql_text
	,cursor_type
FROM v$open_cursor oc
WHERE oc.sid = & 1
ORDER BY cursor_type;

PROMPT

SET PAGESIZE 14
