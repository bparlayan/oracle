-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT sp.name
	,sp.type
	,sp.value
	,sp.isses_modifiable
	,sp.issys_modifiable
	,sp.isinstance_modifiable
FROM v$system_parameter sp
ORDER BY sp.name;
