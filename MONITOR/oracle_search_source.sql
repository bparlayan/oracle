-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.name "Name"
	,a.line "Line"
	,Substr(a.TEXT, 1, 200) "Text"
FROM all_source a
WHERE Instr(Upper(a.TEXT), Upper('&&1')) != 0
	AND a.OWNER = Upper('&&2')
ORDER BY 1
	,2;

SPOOL OFF

SET PAGESIZE 14
SET VERIFY ON
