-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT OWNER
	,trigger_name
	,STATUS
FROM dba_triggers
WHERE table_owner = UPPER('&1')
	AND table_name = UPPER('&2');
