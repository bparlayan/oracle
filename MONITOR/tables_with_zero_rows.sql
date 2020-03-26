-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,table_name
	,last_analyzed
	,num_rows
FROM dba_tables
WHERE num_rows = 0
	AND OWNER NOT IN (
		'SYS'
		,'SYSTEM'
		,'SYSMAN'
		,'XDB'
		,'MDSYS'
		,'WMSYS'
		,'OUTLN'
		,'ORDDATA'
		,'ORDSYS'
		,'OLAPSYS'
		,'EXFSYS'
		,'DBNSMP'
		,'CTXSYS'
		,'APEX_030200'
		,'FLOWS_FILES'
		,'SCOTT'
		,'TSMSYS'
		,'DBSNMP'
		,'APPQOSSYS'
		,'OWBSYS'
		,'DMSYS'
		,'FLOWS_030100'
		,'WKSYS'
		,'WK_TEST'
		)
ORDER BY OWNER
	,table_name;
