-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.username "Username"
	,b.consistent_gets "Consistent Gets"
	,b.block_gets "DB Block Gets"
	,b.physical_reads "Physical Reads"
	,Round(100 * (b.consistent_gets + b.block_gets - b.physical_reads) / (b.consistent_gets + b.block_gets), 2) "Hit Ratio %"
FROM v$session a
	,v$sess_io b
WHERE a.sid = b.sid
	AND (b.consistent_gets + b.block_gets) > 0
	AND a.username IS NOT NULL;
