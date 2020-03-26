-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,segment_name
	,segment_type
	,tablespace_name
	,ROUND(bytes / 1024 / 1024, 2) size_mb
FROM dba_segments
WHERE OWNER = UPPER('&1')
	AND segment_name LIKE '%' || UPPER('&2') || '%'
ORDER BY 1
	,2;

SET VERIFY ON
