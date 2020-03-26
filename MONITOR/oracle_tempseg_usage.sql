-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT username
	,session_addr
	,session_num
	,sqladdr
	,sqlhash
	,sql_id
	,contents
	,segtype
	,extents
	,blocks
FROM v$tempseg_usage
ORDER BY username;
