-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
COLUMN

SELECT *
FROM dba_tab_privs
WHERE table_name = UPPER('&1');
