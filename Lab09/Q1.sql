
-- ed <program name.sql>
-- @<prgram name.sql>
set serveroutput ON;
DECLARE
    area FLOAT;
    radius number;
    PI constant number := 3.14;
BEGIN
    radius := &radius;
    area := PI * radius * radius;
    DBMS_OUTPUT.PUT_LINE('Area: '||area);
END;
/ -- this required when executing it in sqlplus cmd