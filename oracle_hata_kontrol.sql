-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : 17/03/2020
-- -----------------------------------------------------------------------------------

SELECT ORIGINATING_TIMESTAMP AS "DATE",
       MESSAGE_TEXT          AS "TEXT",
       MESSAGE_LEVEL         AS "LEVEL",     --1: CRITICAL: critical errors
                                             --2: SEVERE: severe errors
                                             --8: IMPORTANT: important message
                                             --16: NORMAL: normal message
       MESSAGE_TYPE          AS "TYPE",      --1: UNKNOWN - Essentially the NULL type
                                             --2: INCIDENT_ERROR - The program has encountered an error for some internal or unexpected reason, and it must be reported to Oracle Support
                                             --3: ERROR - An error of some kind has occurred
                                             --4: WARNING: An action occurred or a condition was discovered that should be reviewed and may require action
                                             --5: NOTIFICATION: reports a normal action or event. This could be a user action such as "logon completed"
                                             --6: TRACE: Output of a diagnostic trace
       HOST_ID               AS "SERVER",
       HOST_ADDRESS          AS "IPADDRESS"
  FROM v$diag_alert_ext
 WHERE     ORIGINATING_TIMESTAMP BETWEEN TO_DATE ('16.03.2020 00:00',
                                                  'DD.MM.YYYY HH24:MI')
                                     AND TO_DATE ('17.03.2020 18:01',
                                                  'DD.MM.YYYY HH24:MI')
       AND MESSAGE_TEXT LIKE 'ORA-%'
