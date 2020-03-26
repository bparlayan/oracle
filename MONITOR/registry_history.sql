-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT TO_CHAR(action_time, 'DD-MON-YYYY HH24:MI:SS') AS action_time
	,action
	,namespace
	,version
	,id
	,comments
	,bundle_series
FROM sys.registry$history
ORDER BY action_time;
