-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

SELECT ORIGINATING_TIMESTAMP AS "DATE",
       MESSAGE_TEXT          AS "TEXT",
       MESSAGE_LEVEL         AS "LEVEL",     --1: CRITICAL
                                             --2: SEVERE
                                             --8: IMPORTANT
                                             --16: NORMAL
       MESSAGE_TYPE          AS "TYPE",      --1: UNKNOWN
                                             --2: INCIDENT_ERROR
                                             --3: ERROR
                                             --4: WARNING
                                             --5: NOTIFICATION
                                             --6: TRACE
       HOST_ID               AS "SERVER",
       HOST_ADDRESS          AS "IPADDRESS"
  FROM v$diag_alert_ext
 WHERE     ORIGINATING_TIMESTAMP BETWEEN TO_DATE ('16.03.2020 00:00',
                                                  'DD.MM.YYYY HH24:MI')
                                     AND TO_DATE ('17.03.2020 18:01',
                                                  'DD.MM.YYYY HH24:MI')
       AND MESSAGE_TEXT LIKE 'ORA-%'
