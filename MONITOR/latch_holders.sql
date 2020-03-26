-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT l.name "Latch Name"
	,lh.pid "PID"
	,lh.sid "SID"
	,l.gets "Gets (Wait)"
	,l.misses "Misses (Wait)"
	,l.sleeps "Sleeps (Wait)"
	,l.immediate_gets "Gets (No Wait)"
	,l.immediate_misses "Misses (Wait)"
FROM v$latch l
	,v$latchholder lh
WHERE l.addr = lh.laddr
ORDER BY l.name;
