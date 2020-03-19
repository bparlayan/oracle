-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

COLUMN username FORMAT A20
COLUMN account_status FORMAT A16
COLUMN default_tablespace FORMAT A15
COLUMN temporary_tablespace FORMAT A15
COLUMN profile FORMAT A15

  SELECT username,
         account_status,
         TO_CHAR (lock_date, 'DD-MON-YYYY') AS lock_date,
         TO_CHAR (expiry_date, 'DD-MON-YYYY') AS expiry_date,
         default_tablespace,
         temporary_tablespace,
         TO_CHAR (created, 'DD-MON-YYYY')   AS created,
         profile,
         initial_rsrc_consumer_group,
         editions_enabled,
         authentication_type
    FROM dba_users
ORDER BY username;
