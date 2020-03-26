-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.sql_text
FROM v$sqltext a
	,v$session b
WHERE a.address = b.sql_address
	AND a.hash_value = b.sql_hash_value
	AND b.sid = & 1
ORDER BY a.piece;

PROMPT

SET PAGESIZE 14
