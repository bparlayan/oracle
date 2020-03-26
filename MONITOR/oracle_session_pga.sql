-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(s.username, '(oracle)') AS username
	,s.osuser
	,s.sid
	,s.serial#
	,p.spid
	,ROUND(p.pga_used_mem / 1024 / 1024, 2) AS pga_used_mem_mb
	,ROUND(p.pga_alloc_mem / 1024 / 1024, 2) AS pga_alloc_mem_mb
	,ROUND(p.pga_freeable_mem / 1024 / 1024, 2) AS pga_freeable_mem_mb
	,ROUND(p.pga_max_mem / 1024 / 1024, 2) AS pga_max_mem_mb
	,s.lockwait
	,s.STATUS
	,s.service_name
	,s.module
	,s.machine
	,s.program
	,TO_CHAR(s.logon_Time, 'DD-MON-YYYY HH24:MI:SS') AS logon_time
	,s.last_call_et AS last_call_et_secs
FROM v$session s
	,v$process p
WHERE s.paddr = p.addr
ORDER BY s.username
	,s.osuser;

SET PAGESIZE 14
