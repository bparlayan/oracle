-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SELECT a.column_name "Column"
	,a.data_default "Default"
FROM all_tab_columns a
WHERE a.table_name = Upper('&1')
	AND a.data_default IS NOT NULL /
