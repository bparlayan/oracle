-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.sql_text
FROM v$sqltext_with_newlines a
WHERE a.address = UPPER('&&1')
ORDER BY a.piece;

PROMPT

SET PAGESIZE 14
SET FEEDBACK ON
