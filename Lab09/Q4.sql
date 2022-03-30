SET serveroutput ON;
DECLARE
    hour number;
    rate number;
    tax constant number := 0.28;
    gross number;
    net float;
BEGIN
    hour := &hour;
    rate := &rate;
    gross := hour * rate;
    net := gross - tax;
    DBMS_OUTPUT.PUT_LINE('Gross pay: $'||gross||' Net Pay: $'||net);
END;
