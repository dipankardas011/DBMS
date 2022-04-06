
-- ed <program name.sql>
-- @<prgram name.sql>
set serveroutput ON;
DECLARE
    area FLOAT;
BEGIN
    declare
        radius number;
        PI constant number := 3.14;
    begin
        radius := &radius;
        area := PI * radius * radius;
        DBMS_OUTPUT.PUT_LINE(area);
    end;
END;
/ -- this required when executing it in sqlplus cmd