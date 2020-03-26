-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT b.name "Segment Name"
	,Trunc(c.bytes / 1024) "Size (Kb)"
	,a.optsize "Optimal"
	,a.shrinks "Shrinks"
	,a.aveshrink "Avg Shrink"
	,a.wraps "Wraps"
	,a.extends "Extends"
FROM v$rollstat a
	,v$rollname b
	,dba_segments c
WHERE a.usn = b.usn
	AND b.name = c.segment_name
ORDER BY b.name;

SET PAGESIZE 14
SET VERIFY ON
