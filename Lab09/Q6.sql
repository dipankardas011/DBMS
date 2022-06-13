SET serveroutput ON;
DECLARE
    year number;
BEGIN
    year := &year;
    if (MOD(year, 4)=0 AND MOD(year, 100) != 0) OR MOD(year, 400) = 0 then
        DBMS_OUTPUT.PUT_LINE('Leap Year');
    else
        DBMS_OUTPUT.PUT_LINE('NonLeap Year');
    end if;
END;
/ -- this required when executing it in sqlplus cmd
