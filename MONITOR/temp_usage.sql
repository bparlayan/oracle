-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT NVL(s.username, '(background)') AS username
	,s.sid
	,s.serial#
	,ROUND(ss.value / 1024 / 1024, 2) AS temp_used_mb
FROM v$session s
JOIN v$sesstat ss ON s.sid = ss.sid
JOIN v$statname sn ON ss.statistic# = sn.statistic#
WHERE sn.name = 'temp space allocated (bytes)'
	AND ss.value > 0
ORDER BY 1;
