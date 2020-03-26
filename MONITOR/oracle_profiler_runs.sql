-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT runid
	,run_date
	,run_comment
	,run_total_time
FROM plsql_profiler_runs
ORDER BY runid;
