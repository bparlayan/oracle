-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT Substr(object_name, 1, 30) object_name
	,object_type
	,STATUS
FROM all_objects
WHERE OWNER = Upper('&&1');

PROMPT

SET FEEDBACK ON
SET PAGESIZE 18
