-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT file_id
	,file_name
	,ROUND(bytes / 1024 / 1024 / 1024) AS size_gb
	,ROUND(maxbytes / 1024 / 1024 / 1024) AS max_size_gb
	,autoextensible
	,increment_by
	,STATUS
FROM dba_data_files
WHERE tablespace_name = UPPER('&1')
ORDER BY file_id;
