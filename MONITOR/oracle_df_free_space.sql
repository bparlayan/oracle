-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.file_name
	,ROUND(a.bytes / 1024 / 1024) AS size_mb
	,ROUND(a.maxbytes / 1024 / 1024) AS maxsize_mb
	,ROUND(b.free_bytes / 1024 / 1024) AS free_mb
	,ROUND((a.maxbytes - a.bytes) / 1024 / 1024) AS growth_mb
	,100 - ROUND(((b.free_bytes + a.growth) / a.maxbytes) * 100) AS pct_used
FROM (
	SELECT file_name
		,file_id
		,bytes
		,GREATEST(bytes, maxbytes) AS maxbytes
		,GREATEST(bytes, maxbytes) - bytes AS growth
	FROM dba_data_files
	) a
	,(
		SELECT file_id
			,SUM(bytes) AS free_bytes
		FROM dba_free_space
		GROUP BY file_id
		) b
WHERE a.file_id = b.file_id
ORDER BY file_name;
