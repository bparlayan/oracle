-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.job
	,a.log_user
	,a.priv_user
	,a.schema_user
	,To_Char(a.last_date, 'DD-MON-YYYY HH24:MI:SS') AS last_date
	,
	--To_Char(a.this_date,'DD-MON-YYYY HH24:MI:SS') AS this_date,      
	To_Char(a.next_date, 'DD-MON-YYYY HH24:MI:SS') AS next_date
	,a.broken
	,a.interval
	,a.failures
	,a.what
	,a.total_time
	,a.nls_env
	,a.misc_env
FROM dba_jobs a;

SET LINESIZE 80 PAGESIZE 14
