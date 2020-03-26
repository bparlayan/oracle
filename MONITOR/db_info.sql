-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------F
SELECT *
FROM v$database;

SELECT *
FROM v$instance;

SELECT *
FROM v$version;

SELECT a.name
	,a.value
FROM v$sga a;

SELECT Substr(c.name, 1, 60) "Controlfile"
	,NVL(c.STATUS, 'UNKNOWN') "Status"
FROM v$controlfile c
ORDER BY 1;

SELECT Substr(d.name, 1, 60) "Datafile"
	,NVL(d.STATUS, 'UNKNOWN') "Status"
	,d.enabled "Enabled"
	,LPad(To_Char(Round(d.bytes / 1024000, 2), '9999990.00'), 10, ' ') "Size (M)"
FROM v$datafile d
ORDER BY 1;

SELECT l.group# "Group"
	,Substr(l.member, 1, 60) "Logfile"
	,NVL(l.STATUS, 'UNKNOWN') "Status"
FROM v$logfile l
ORDER BY 1
	,2;

PROMPT

SET PAGESIZE 14
SET FEEDBACK ON
