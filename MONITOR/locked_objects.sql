-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT lo.session_id AS sid
	,s.serial#
	,NVL(lo.oracle_username, '(oracle)') AS username
	,o.OWNER AS object_owner
	,o.object_name
	,Decode(lo.locked_mode, 0, 'None', 1, 'Null (NULL)', 2, 'Row-S (SS)', 3, 'Row-X (SX)', 4, 'Share (S)', 5, 'S/Row-X (SSX)', 6, 'Exclusive (X)', lo.locked_mode) locked_mode
	,lo.os_user_name
FROM v$locked_object lo
JOIN dba_objects o ON o.object_id = lo.object_id
JOIN v$session s ON lo.session_id = s.sid
ORDER BY 1
	,2
	,3
	,4;

SET PAGESIZE 14
SET VERIFY ON
