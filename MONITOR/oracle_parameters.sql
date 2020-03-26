-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT p.name
	,p.type
	,p.value
	,p.isses_modifiable
	,p.issys_modifiable
	,p.isinstance_modifiable
FROM v$parameter p
ORDER BY p.name;
