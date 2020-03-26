-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.namespace "Name Space"
	,a.gets "Get Requests"
	,a.gethits "Get Hits"
	,Round(a.gethitratio, 2) "Get Ratio"
	,a.pins "Pin Requests"
	,a.pinhits "Pin Hits"
	,Round(a.pinhitratio, 2) "Pin Ratio"
	,a.reloads "Reloads"
	,a.invalidations "Invalidations"
FROM v$librarycache a
ORDER BY 1;

SET PAGESIZE 14
SET VERIFY ON
