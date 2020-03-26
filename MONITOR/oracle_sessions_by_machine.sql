-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT machine
	,NVL(active_count, 0) AS active
	,NVL(inactive_count, 0) AS inactive
	,NVL(killed_count, 0) AS killed
FROM (
	SELECT machine
		,STATUS
		,count(*) AS quantity
	FROM v$session
	GROUP BY machine
		,STATUS
	)
PIVOT(SUM(quantity) AS count FOR (STATUS) IN (
			'ACTIVE' AS active
			,'INACTIVE' AS inactive
			,'KILLED' AS killed
			))
ORDER BY machine;

SET PAGESIZE 14
