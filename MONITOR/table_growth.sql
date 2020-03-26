-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT TO_CHAR(sn.begin_interval_time, 'DD-MON-YYYY HH24:MM') AS begin_interval_time
	,sso.object_name
	,ss.space_used_total
FROM dba_hist_seg_stat ss
	,dba_hist_seg_stat_obj sso
	,dba_hist_snapshot sn
WHERE sso.OWNER = UPPER('&1')
	AND sso.obj# = ss.obj#
	AND sn.snap_id = ss.snap_id
	AND sso.object_name LIKE UPPER('&2') || '%'
ORDER BY sn.begin_interval_time;
