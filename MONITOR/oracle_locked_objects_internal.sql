-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT li.session_id AS sid
	,s.serial#
	,li.lock_type
	,li.mode_held
	,li.mode_requested
	,li.lock_id1
	,li.lock_id2
FROM dba_lock_internal li
JOIN v$session s ON li.session_id = s.sid
WHERE UPPER(lock_id1) LIKE UPPER('%&1%');

SET VERIFY ON
