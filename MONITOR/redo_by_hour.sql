-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
WITH hours
AS (
	SELECT TRUNC(SYSDATE) - & 1 + ((LEVEL - 1) / 24) AS hours
	FROM dual CONNECT BY LEVEL < = 24
	)
SELECT h.hours AS date_hour
	,ROUND(SUM(blocks * block_size) / 1024 / 1024 / 1024, 2) size_gb
FROM hours h
LEFT OUTER JOIN v$archived_log al ON h.hours = TRUNC(al.first_time, 'HH24')
GROUP BY h.hours
ORDER BY h.hours;

SET VERIFY ON PAGESIZE 14
