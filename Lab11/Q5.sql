SET SERVEROUTPUT ON;
create or replace function ss1(A number) 
RETURN number is
  dd NUMBER;
  xyz BOOLEAN;
BEGIN
  select count(*) into dd from department where A=DEPTID;
  if dd = 0 then
    xyz := false;
  else
    xyz := true;
  end if;
  return dd;
END ss1;

DECLARE 
  c number;
  xx number;
BEGIN
  xx := &xx;
  c := ss1(xx);
  if c = 1 then 
    dbms_output.put_line('TRUE');
  ELSE
    dbms_output.put_line('False');
  end if;
END; 