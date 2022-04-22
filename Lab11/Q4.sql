SET SERVEROUTPUT ON;
create or replace function ss(A CHAR) 
RETURN VARCHAR is
  NAM VARCHAR(40);
  PH CHAR(10);
  re VARCHAR(80);
BEGIN
  SELECT FIRST||' '||LAST, PHONE INTO NAM, PH FROM STUDENT
    WHERE STUDENT.STUDENTID=A;
  re := NAM||' : '||PH;
  return re;
END ss;

DECLARE
  cc VARCHAR(80);
  xy student.STUDENTID%TYPE;
BEGIN
  xy := &xy;
  cc := ss(xy);
  dbms_output.put_line('Ans '||cc);
END;