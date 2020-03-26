-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT s.username
	,s.sid
	,s.serial#
	,t.used_ublk
	,t.used_urec
	,rs.segment_name
	,r.rssize
	,r.STATUS
FROM v$transaction t
	,v$session s
	,v$rollstat r
	,dba_rollback_segs rs
WHERE s.saddr = t.ses_addr
	AND t.xidusn = r.usn
	AND rs.segment_id = t.xidusn
ORDER BY t.used_ublk DESC;
