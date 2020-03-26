-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT file_id
	,file_name
	,ROUND(bytes / 1024 / 1024 / 1024) AS size_gb
	,ROUND(maxbytes / 1024 / 1024 / 1024) AS max_size_gb
	,autoextensible
	,increment_by
	,STATUS
FROM dba_data_files
ORDER BY file_name;
