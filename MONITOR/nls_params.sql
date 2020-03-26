-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
PROMPT * * * DATABASE parameters * * *

SELECT *
FROM nls_database_parameters
ORDER BY 1;

PROMPT * * * Instance parameters * * *

SELECT *
FROM nls_instance_parameters
ORDER BY 1;

PROMPT * * * Session parameters * * *

SELECT *
FROM nls_session_parameters
ORDER BY 1;
