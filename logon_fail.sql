
-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

SELECT username AS "KULLANICI ADI",
       userhost AS "HOSTNAME",
       terminal AS "TERMINAL",
       TO_CHAR (timestamp, 'DD/MM/YY HH24:MI:SS') "TIMESTAMP",
       CASE
           WHEN returncode = 1017 THEN 'HATALI PAROLA DENEMESI'
           WHEN returncode = 28000 THEN 'KILITLI HESAP DENEMESI'
       END
           "FAILED LOGIN ACTION"
  FROM dba_audit_session
 WHERE timestamp > SYSDATE - 1 / 9 AND returncode IN (1017, 28000);
