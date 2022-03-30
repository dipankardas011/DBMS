SET serveroutput ON;
DECLARE
    first varchar2(10);
    last varchar2(10);
BEGIN
    first := &first;
    last := &last;
    DBMS_OUTPUT.PUT_LINE(first||', '||last);
END;
