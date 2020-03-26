-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.tablespace_name
	,a.file_name
	,a.bytes AS current_bytes
	,a.bytes - b.resize_to AS shrink_by_bytes
	,b.resize_to AS resize_to_bytes
FROM dba_data_files a
	,(
		SELECT file_id
			,MAX((block_id + blocks - 1) * & v_block_size) AS resize_to
		FROM dba_extents
		GROUP BY file_id
		) b
WHERE a.file_id = b.file_id
ORDER BY a.tablespace_name
	,a.file_name;
