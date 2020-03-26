-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT db_link
	,owner_id
	,logged_on
	,heterogeneous
	,protocol
	,open_cursors
	,in_transaction
	,update_sent
	,commit_point_strength
FROM v$dblink
ORDER BY db_link;

SET LINESIZE 80
