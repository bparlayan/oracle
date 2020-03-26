-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,Trunc(Sum(bytes) / 1024) Kb
FROM dba_segments
WHERE segment_type = 'TEMPORARY'
GROUP BY OWNER;
