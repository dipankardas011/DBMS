set serveroutput ON;
declare
    lines number;
begin
    select COUNT(*) into lines from STUDENT;
    DBMS_OUTPUT.PUT_LINE('Records: '||lines);
end;