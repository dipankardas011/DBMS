/*Talking about the location table*/
set serveroutput ON;
declare
    buildingN LOCATION.building%type;
    capacityy LOCATION%ROWTYPE;
    CURSOR loc(buildingN LOCATION.building%type) is select * from LOCATION where BUILDING = buildingN
        for update of CAPACITY nowait;
begin
    buildingN := &buildingN;
    OPEN loc(buildingN);
    if loc%ISOPEN then
        loop
            fetch loc into capacityy;
            exit when loc%NOTFOUND;
            UPDATE location SET CAPACITY=1.2*capacityy.CAPACITY WHERE CURRENT OF loc;
        end loop;
    else
        DBMS_OUTPUT.PUT_LINE('unable to open cursor');
    end if;
--     COMMIT ;
--     ROLLBACK;
    close loc;
end;