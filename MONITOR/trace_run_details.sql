-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT e.runid
	,e.event_seq
	,TO_CHAR(e.event_time, 'DD-MON-YYYY HH24:MI:SS') AS event_time
	,e.event_unit_owner
	,e.event_unit
	,e.event_unit_kind
	,e.proc_line
	,e.event_comment
FROM plsql_trace_events e
WHERE e.runid = & 1
ORDER BY e.runid
	,e.event_seq;
