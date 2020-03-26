-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.name "Name"
	,a.STATUS "Status"
	,a.accept "Accept"
	,a.messages "Total Mesgs"
	,a.bytes "Total Bytes"
	,a.owned "Circs Owned"
	,a.idle "Total Idle Time"
	,a.busy "Total Busy Time"
	,Round(a.busy / (a.busy + a.idle), 2) "Load"
FROM v$dispatcher a
ORDER BY 1;

SET PAGESIZE 14
SET VERIFY ON
