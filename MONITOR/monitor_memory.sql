-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(a.username, '(oracle)') AS username
	,a.module
	,a.program
	,Trunc(b.value / 1024) AS memory_kb
FROM v$session a
	,v$sesstat b
	,v$statname c
WHERE a.sid = b.sid
	AND b.statistic# = c.statistic#
	AND c.name = 'session pga memory'
	AND a.program IS NOT NULL
ORDER BY b.value DESC;
