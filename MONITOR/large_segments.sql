-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT *
FROM (
	SELECT OWNER
		,segment_name
		,segment_type
		,tablespace_name
		,ROUND(bytes / 1024 / 1024, 2) size_mb
	FROM dba_segments
	ORDER BY 5 DESC
	)
WHERE ROWNUM <= & 1;

SET VERIFY ON
