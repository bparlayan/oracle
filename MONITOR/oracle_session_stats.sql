-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT sn.name
	,ss.value
FROM v$sesstat ss
	,v$statname sn
	,v$session s
WHERE ss.statistic# = sn.statistic#
	AND s.sid = ss.sid
	AND s.audsid = SYS_CONTEXT('USERENV', 'SESSIONID')
	AND sn.name LIKE '%' || DECODE(LOWER('&1'), 'all', '', LOWER('&1')) || '%';
