-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT e.OWNER
	,e.segment_type
	,Substr(e.segment_name, 1, 30) segment_name
	,Trunc(s.initial_extent / 1024) "INITIAL K"
	,Trunc(s.next_extent / 1024) "NEXT K"
	,s.max_extents
	,Count(*) AS extents
FROM dba_extents e
	,dba_segments s
WHERE e.OWNER = s.OWNER
	AND e.segment_name = s.segment_name
	AND e.OWNER NOT IN (
		'SYS'
		,'SYSTEM'
		)
GROUP BY e.OWNER
	,e.segment_type
	,e.segment_name
	,s.initial_extent
	,s.next_extent
	,s.max_extents
HAVING Count(*) > s.max_extents - 10
ORDER BY e.OWNER
	,e.segment_type
	,Count(*) DESC;
