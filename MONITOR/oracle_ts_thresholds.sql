-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT tablespace_name
	,contents
	,extent_management
	,threshold_type
	,metrics_name
	,warning_operator
	,warning_value
	,critical_operator
	,critical_value
FROM dba_tablespace_thresholds
ORDER BY tablespace_name
	,metrics_name;

SET LINESIZE 80
