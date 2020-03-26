-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT TRUNC(first_time) AS day
	,ROUND(SUM(blocks * block_size) / 1024 / 1024 / 1024, 2) size_gb
FROM v$archived_log
WHERE TRUNC(first_time) >= TRUNC(SYSDATE) - & 1
GROUP BY TRUNC(first_time)
ORDER BY TRUNC(first_time);

SET VERIFY ON
