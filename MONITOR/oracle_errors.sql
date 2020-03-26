-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT To_Char(a.line) || ' - ' || a.TEXT error
FROM user_source a
	,user_errors b
WHERE a.name = Upper('&&1')
	AND a.name = b.name
	AND a.type = b.type
	AND a.line = b.line
ORDER BY a.name
	,a.line;
