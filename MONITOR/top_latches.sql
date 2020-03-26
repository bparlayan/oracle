-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT l.latch#
	,l.name
	,l.gets
	,l.misses
	,l.sleeps
	,l.immediate_gets
	,l.immediate_misses
	,l.spin_gets
FROM v$latch l
WHERE l.misses > 0
ORDER BY l.misses DESC;
