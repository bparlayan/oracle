-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT s.sid
	,s.serial#
	,pa.value || '/' || LOWER(SYS_CONTEXT('userenv', 'instance_name')) || '_ora_' || p.spid || '.trc' AS trace_file
FROM v$session s
	,v$process p
	,v$parameter pa
WHERE pa.name = 'user_dump_dest'
	AND s.paddr = p.addr
	AND s.audsid = SYS_CONTEXT('USERENV', 'SESSIONID');
