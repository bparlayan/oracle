-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
SET SERVEROUTPUT ON
DECLARE
  v_stack  VARCHAR2(2000);
BEGIN
  v_stack := Dbms_Utility.Format_Call_Stack;
  Dbms_Output.Put_Line(v_stack);
END;
/
