-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.type
	,Substr(a.OWNER, 1, 30) OWNER
	,a.sid
	,Substr(a.OBJECT, 1, 30) OBJECT
FROM v$access a
WHERE a.OWNER NOT IN (
		'SYS'
		,'PUBLIC'
		)
ORDER BY 1
	,2
	,3
	,4 /
