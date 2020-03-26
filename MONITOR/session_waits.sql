-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(s.username, '(oracle)') AS username
	,s.sid
	,s.serial#
	,sw.event
	,sw.wait_time
	,sw.seconds_in_wait
	,sw.STATE
FROM v$session_wait sw
	,v$session s
WHERE s.sid = sw.sid
ORDER BY sw.seconds_in_wait DESC;
