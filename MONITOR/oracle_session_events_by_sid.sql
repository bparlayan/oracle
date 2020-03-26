-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(s.username, '(oracle)') AS username
	,s.sid
	,s.serial#
	,se.event
	,se.total_waits
	,se.total_timeouts
	,se.time_waited
	,se.average_wait
	,se.max_wait
	,se.time_waited_micro
FROM v$session_event se
	,v$session s
WHERE s.sid = se.sid
	AND s.sid = & 1
ORDER BY se.time_waited DESC;
