-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT s.sid
	,s.serial#
	,s.machine
	,ROUND(sl.elapsed_seconds / 60) || ':' || MOD(sl.elapsed_seconds, 60) elapsed
	,ROUND(sl.time_remaining / 60) || ':' || MOD(sl.time_remaining, 60) remaining
	,ROUND(sl.sofar / sl.totalwork * 100, 2) progress_pct
FROM v$session s
	,v$session_longops sl
WHERE s.sid = sl.sid
	AND s.serial# = sl.serial#;
