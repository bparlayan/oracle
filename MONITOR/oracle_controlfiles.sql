-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT name
	,STATUS
FROM v$controlfile
ORDER BY name;

SET LINESIZE 80
