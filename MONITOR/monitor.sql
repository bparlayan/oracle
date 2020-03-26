-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT s.sid
	,s.STATUS
	,s.process
	,s.schemaname
	,s.osuser
	,a.sql_text
	,p.program
FROM v$session s
	,v$sqlarea a
	,v$process p
WHERE s.SQL_HASH_VALUE = a.HASH_VALUE
	AND s.SQL_ADDRESS = a.ADDRESS
	AND s.PADDR = p.ADDR /

SET VERIFY ON
SET LINESIZE 255
