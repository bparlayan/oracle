-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT *
FROM (
	SELECT name
		,addr
		,gets
		,misses
		,sleeps
	FROM v$latch_children
	WHERE name = 'cache buffers chains'
		AND misses > 0
	ORDER BY misses DESC
	)
WHERE rownum < 11;

ACCEPT address PROMPT "Enter ADDR: " COLUMN OWNER FORMAT A15 COLUMN object_name FORMAT A30 COLUMN subobject_name FORMAT A20

SELECT *
FROM (
	SELECT o.OWNER
		,o.object_name
		,o.subobject_name
		,bh.tch
		,bh.obj
		,bh.file#
		,bh.dbablk
		,bh.class
		,bh.STATE
	FROM x$bh bh
		,dba_objects o
	WHERE o.data_object_id = bh.obj
		AND hladdr = '&address'
	ORDER BY tch DESC
	)
WHERE rownum < 11;
