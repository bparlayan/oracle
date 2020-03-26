-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(a.username, '(oracle)') AS username
	,a.osuser
	,a.sid
	,a.serial#
	,c.value AS & 1
	,a.lockwait
	,a.STATUS
	,a.module
	,a.machine
	,a.program
	,TO_CHAR(a.logon_Time, 'DD-MON-YYYY HH24:MI:SS') AS logon_time
FROM v$session a
	,v$sesstat c
	,v$statname d
WHERE a.sid = c.sid
	AND c.statistic# = d.statistic#
	AND d.name = DECODE(UPPER('&1'), 'READS', 'session logical reads', 'EXECS', 'execute count', 'CPU', 'CPU used by this session', 'CPU used by this session')
ORDER BY c.value DESC;

SET PAGESIZE 14
