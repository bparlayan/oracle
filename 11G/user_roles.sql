-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

SET SERVEROUTPUT ON
SET VERIFY OFF

  SELECT a.granted_role, a.admin_option
    FROM user_role_privs a
ORDER BY a.granted_role;

  SELECT a.privilege, a.admin_option
    FROM user_sys_privs a
ORDER BY a.privilege;
