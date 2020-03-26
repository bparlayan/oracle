-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.child#
	,(a.SLEEPS / a.GETS) * 100 "Ratio %"
FROM v$latch_children a
WHERE a.name = 'cache buffers lru chain'
ORDER BY 1;

SET PAGESIZE 14
