-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.job "Job"
	,a.sid
	,a.failures "Failures"
	,Substr(To_Char(a.last_date, 'DD-Mon-YYYY HH24:MI:SS'), 1, 20) "Last Date"
	,Substr(To_Char(a.this_date, 'DD-Mon-YYYY HH24:MI:SS'), 1, 20) "This Date"
FROM dba_jobs_running a;

SET PAGESIZE 14
SET VERIFY ON
