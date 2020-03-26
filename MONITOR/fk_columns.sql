-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT c.constraint_name
	,cc.table_name
	,cc.column_name
	,rcc.table_name AS r_table_name
	,rcc.column_name AS r_column_name
	,cc.position
FROM dba_constraints c
JOIN dba_cons_columns cc ON c.OWNER = cc.OWNER
	AND c.constraint_name = cc.constraint_name
JOIN dba_cons_columns rcc ON c.OWNER = rcc.OWNER
	AND c.r_constraint_name = rcc.constraint_name
	AND cc.position = rcc.position
WHERE c.OWNER = DECODE(UPPER('&1'), 'ALL', c.OWNER, UPPER('&1'))
	AND c.table_name = DECODE(UPPER('&2'), 'ALL', c.table_name, UPPER('&2'))
ORDER BY c.constraint_name
	,cc.table_name
	,cc.position;
