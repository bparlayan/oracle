-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,object_name
	,
	--subobject_name,
	object_id
	,data_object_id
	,object_type
	,TO_CHAR(created, 'DD-MON-YYYY HH24:MI:SS') AS created
	,TO_CHAR(last_ddl_time, 'DD-MON-YYYY HH24:MI:SS') AS last_ddl_time
	,TIMESTAMP
	,STATUS
	,TEMPORARY
	,generated
	,secondary
	,
	--namespace,
	edition_name
FROM dba_objects
WHERE UPPER(object_name) LIKE UPPER('%&1%')
ORDER BY OWNER
	,object_name;

SET VERIFY ON
