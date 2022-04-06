set serveroutput ON;
declare
    age number;
begin
    age := &age;
    IF age >= 18 then
        DBMS_OUTPUT.PUT_LINE('Eligible');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Not Eligible');
    END IF;
end;