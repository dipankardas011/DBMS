SET serveroutput ON;
DECLARE
    first varchar2(10);
    last varchar2(10);
    catName VARCHAR2(10);
BEGIN
    first := &first;
    last := &last;
    catName := first||' '||last;
    DBMS_OUTPUT.PUT_LINE(catName);
END;
/ -- this required when executing it in sqlplus cmd
