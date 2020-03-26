-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT *
FROM (
	SELECT l.OWNER
		,l.table_name
		,l.column_name
		,l.segment_name
		,l.tablespace_name
		,ROUND(s.bytes / 1024 / 1024, 2) size_mb
	FROM dba_lobs l
	JOIN dba_segments s ON s.OWNER = l.OWNER
		AND s.segment_name = l.segment_name
	ORDER BY 6 DESC
	)
WHERE ROWNUM <= & 1;

SET VERIFY ON
