-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT Substr(a.name, 1, 60) "Datafile"
	,b.STATUS "Status"
FROM v$datafile a
	,v$backup b
WHERE a.file# = b.file#;

SET PAGESIZE 14
SET FEEDBACK ON
