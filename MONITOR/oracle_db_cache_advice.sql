-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT size_for_estimate
	,buffers_for_estimate
	,estd_physical_read_factor
	,estd_physical_reads
FROM v$db_cache_advice
WHERE name = 'DEFAULT'
	AND block_size = (
		SELECT value
		FROM v$parameter
		WHERE name = 'db_block_size'
		)
	AND advice_status = 'ON';
