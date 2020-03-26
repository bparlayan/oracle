-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT l.name
	,l.gets
	,l.misses
	,((1 - (l.misses / l.gets)) * 100) AS latch_hit_ratio
FROM v$latch l
WHERE l.gets != 0

UNION

SELECT l.name
	,l.gets
	,l.misses
	,100 AS latch_hit_ratio
FROM v$latch l
WHERE l.gets = 0
ORDER BY 4 DESC;
