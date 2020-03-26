-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT tablespace_name
	,size_mb
	,free_mb
	,max_size_mb
	,max_free_mb
	,TRUNC((max_free_mb / max_size_mb) * 100) AS free_pct
FROM (
	SELECT a.tablespace_name
		,b.size_mb
		,a.free_mb
		,b.max_size_mb
		,a.free_mb + (b.max_size_mb - b.size_mb) AS max_free_mb
	FROM (
		SELECT tablespace_name
			,TRUNC(SUM(bytes) / 1024 / 1024) AS free_mb
		FROM dba_free_space
		GROUP BY tablespace_name
		) a
		,(
			SELECT tablespace_name
				,TRUNC(SUM(bytes) / 1024 / 1024) AS size_mb
				,TRUNC(SUM(GREATEST(bytes, maxbytes)) / 1024 / 1024) AS max_size_mb
			FROM dba_data_files
			GROUP BY tablespace_name
			) b
	WHERE a.tablespace_name = b.tablespace_name
	)
WHERE ROUND((max_free_mb / max_size_mb) * 100, 2) < 10;

SET PAGESIZE 14
