-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(s.username, '(oracle)') AS username
	,s.osuser
	,s.sid
	,s.serial#
	,p.spid
	,s.lockwait
	,s.STATUS
	,s.machine
	,s.program
	,TO_CHAR(s.logon_Time, 'DD-MON-YYYY HH24:MI:SS') AS logon_time
	,s.last_call_et AS last_call_et_secs
	,s.module
	,s.action
	,s.client_info
	,s.client_identifier
FROM v$session s
	,v$process p
WHERE s.paddr = p.addr
	AND s.STATUS = 'ACTIVE'
	AND s.username IS NOT NULL
ORDER BY s.username
	,s.osuser;

SET PAGESIZE 14
