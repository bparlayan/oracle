-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT u.runid
	,u.unit_number
	,u.unit_type
	,u.unit_owner
	,u.unit_name
	,d.line#
	,d.total_occur
	,ROUND(d.total_time / d.total_occur) AS time_per_occur
	,d.total_time
	,d.min_time
	,d.max_time
FROM plsql_profiler_units u
JOIN plsql_profiler_data d ON u.runid = d.runid
	AND u.unit_number = d.unit_number
WHERE u.runid = & 1
	AND d.total_time > 0
	AND d.total_occur > 0
ORDER BY (d.total_time / d.total_occur) DESC
	,u.unit_number
	,d.line#;
