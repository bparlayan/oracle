-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT s.sid
	,s.STATUS "Status"
	,p.spid "Process"
	,s.schemaname "Schema Name"
	,s.osuser "OS User"
	,Substr(a.sql_text, 1, 120) "SQL Text"
	,s.program "Program"
FROM v$session s
	,v$sqlarea a
	,v$process p
WHERE s.sql_hash_value = a.hash_value(+)
	AND s.sql_address = a.address(+)
	AND s.paddr = p.addr;

SET PAGESIZE 14
SET FEEDBACK ON
