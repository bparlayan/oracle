-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT sn.name
	,ss.value
FROM v$sesstat ss
	,v$statname sn
WHERE ss.statistic# = sn.statistic#
	AND ss.sid = & 1
	AND sn.name LIKE '%' || DECODE(LOWER('&2'), 'all', '', LOWER('&2')) || '%';
