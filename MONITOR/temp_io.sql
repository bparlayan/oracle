-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT SUBSTR(t.name, 1, 50) AS file_name
	,f.phyblkrd AS blocks_read
	,f.phyblkwrt AS blocks_written
	,f.phyblkrd + f.phyblkwrt AS total_io
FROM v$tempstat f
	,v$tempfile t
WHERE t.file# = f.file#
ORDER BY f.phyblkrd + f.phyblkwrt DESC;

SET PAGESIZE 18
