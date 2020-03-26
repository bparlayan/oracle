-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT Substr(d.name, 1, 50) "File Name"
	,f.phyblkrd "Blocks Read"
	,f.phyblkwrt "Blocks Writen"
	,f.phyblkrd + f.phyblkwrt "Total I/O"
FROM v$filestat f
	,v$datafile d
WHERE d.file# = f.file#
ORDER BY f.phyblkrd + f.phyblkwrt DESC;

SET PAGESIZE 18
