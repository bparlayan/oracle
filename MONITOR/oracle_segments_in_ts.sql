-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT segment_type
	,segment_name
	,partition_name
	,ROUND(bytes / 2014 / 1024, 2) AS size_mb
FROM dba_segments
WHERE tablespace_name = UPPER('&1')
ORDER BY 1
	,2;

CLEAR BREAKS
