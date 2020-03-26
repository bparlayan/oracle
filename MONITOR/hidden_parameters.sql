-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.ksppinm AS parameter
	,a.ksppdesc AS description
	,b.ksppstvl AS session_value
	,c.ksppstvl AS instance_value
FROM x$ksppi a
	,x$ksppcv b
	,x$ksppsv c
WHERE a.indx = b.indx
	AND a.indx = c.indx
	AND a.ksppinm LIKE '/_%' ESCAPE '/'
	AND a.ksppinm = DECODE(LOWER('&1'), 'all', a.ksppinm, LOWER('&1'))
ORDER BY a.ksppinm;
