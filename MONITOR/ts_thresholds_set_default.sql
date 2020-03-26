-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Güncel           : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SET VERIFY OFF

DECLARE
  l_warning  VARCHAR2(2) := '&1';
  l_critical VARCHAR2(2) := '&2';
BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
      metrics_id              => DBMS_SERVER_ALERT.TABLESPACE_PCT_FULL,
      warning_operator        => DBMS_SERVER_ALERT.OPERATOR_GE,
      warning_value           => l_warning,
      critical_operator       => DBMS_SERVER_ALERT.OPERATOR_GE,
      critical_value          => l_critical,
      observation_period      => 1,
      consecutive_occurrences => 1,
      instance_name           => NULL,
      object_type             => DBMS_SERVER_ALERT.OBJECT_TYPE_TABLESPACE,
      object_name             => NULL);
END;
/

SET VERIFY ON