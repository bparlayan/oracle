-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT st.sql_text
FROM v$sqltext st
	,v$open_cursor oc
WHERE st.address = oc.address
	AND st.hash_value = oc.hash_value
	AND oc.sid = & 1
ORDER BY st.address
	,st.piece;

PROMPT

SET PAGESIZE 14
