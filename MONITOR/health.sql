-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SPOOL Health_Checks.txt

conn &1
@db_info
@sessions
@ts_full
@max_extents

SPOOL OFF