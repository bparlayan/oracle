-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT tablespace_name
	,block_size
	,extent_management
	,allocation_type
	,segment_space_management
	,STATUS
FROM dba_tablespaces
ORDER BY tablespace_name;
