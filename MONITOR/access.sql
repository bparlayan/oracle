-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.OBJECT
	,a.type
	,a.sid
	,b.serial#
	,b.username
	,b.osuser
	,b.program
FROM v$access a
	,v$session b
WHERE a.sid = b.sid
	AND a.OWNER = DECODE(UPPER('&1'), 'ALL', a.OBJECT, UPPER('&1'))
	AND a.OBJECT = DECODE(UPPER('&2'), 'ALL', a.OBJECT, UPPER('&2'))
ORDER BY a.OBJECT;
