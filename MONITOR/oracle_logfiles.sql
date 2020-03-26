-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT l.thread#
	,lf.group#
	,lf.member
	,TRUNC(l.bytes / 1024 / 1024) AS size_mb
	,l.STATUS
	,l.archived
	,lf.type
	,lf.is_recovery_dest_file AS rdf
	,l.sequence#
	,l.first_change#
	,l.next_change#
FROM v$logfile lf
JOIN v$log l ON l.group# = lf.group#
ORDER BY l.thread#
	,lf.group#
	,lf.member;

SET LINESIZE 80
