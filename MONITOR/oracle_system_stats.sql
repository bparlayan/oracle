-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT sn.name
	,ss.value
FROM v$sysstat ss
	,v$statname sn
WHERE ss.statistic# = sn.statistic#
	AND sn.name LIKE '%' || DECODE(LOWER('&1'), 'all', '', LOWER('&1')) || '%';
