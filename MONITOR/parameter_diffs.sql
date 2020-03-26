-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT p.name
	,i.instance_name AS sid
	,p.value AS current_value
	,sp.sid
	,sp.value AS spfile_value
FROM v$spparameter sp
	,v$parameter p
	,v$instance i
WHERE sp.name = p.name
	AND sp.value != p.value;

COLUMN FORMAT DEFAULT
