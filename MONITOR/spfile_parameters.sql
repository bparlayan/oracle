-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT sp.sid
	,sp.name
	,sp.value
	,sp.display_value
FROM v$spparameter sp
ORDER BY sp.name
	,sp.sid;
