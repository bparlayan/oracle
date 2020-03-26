-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT ad.referenced_name "Object"
	,ad.name "Ref Object"
	,ad.type "Type"
	,Substr(ad.referenced_owner, 1, 10) "Ref Owner"
	,Substr(ad.referenced_link_name, 1, 20) "Ref Link Name"
FROM all_dependencies ad
WHERE ad.referenced_name = Upper('&&1')
	AND ad.OWNER = Upper('&&2')
ORDER BY 1
	,2
	,3;

SET VERIFY ON
SET FEEDBACK ON
SET PAGESIZE 14 PROMPT
