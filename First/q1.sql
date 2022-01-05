-- student class
-- using oracle xe express edition 21c

-- / as sysdba
create table student(name varchar(10), roll number(4), age number(2));
describe student;
insert into student values('ABCD EF',1554,23);
insert into student values('ABsfF',1324,20);
select * from student;
commit;
insert into student values('ABsfF',1324,NULL);
commit;

accept name prompt 'Enter the name: '
accept roll prompt 'Enter the roll: '
accept age prompt 'Enter the age: '

select * from student;
commit;
-- O/p
--  NAME             ROLL        AGE
--  ---------- ---------- ----------
--  ABCD EF          1554         23
--  ABsfF            1324         20
--  ABsfF            1324
--  XYZ              3243
