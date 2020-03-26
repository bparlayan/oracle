-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
WITH mins
AS (
	SELECT TRUNC(SYSDATE, 'MI') - (& 1 / (24 * 60)) + ((LEVEL - 1) / (24 * 60)) AS mins
	FROM dual CONNECT BY LEVEL <= & 1
	)
SELECT m.mins AS date_min
	,ROUND(SUM(blocks * block_size) / 1024 / 1024, 2) size_mb
FROM mins m
LEFT OUTER JOIN v$archived_log al ON m.mins = TRUNC(al.first_time, 'MI')
GROUP BY m.mins
ORDER BY m.mins;

SET VERIFY ON PAGESIZE 14
