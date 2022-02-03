-- to show all the tables
select * from tab;
-- to show the prev date
select to_date(current_date - 1) from dual;

-- Q1
select UNIQUE(building) from location;

-- Q2
select * from crssection where termid='WN03';

-- Q3
select * from faculty where deptid IN(1, 2);

-- Q4
select * from student where state IN('NJ');
select * from student where state IN('NY');

-- Q5
delete from department where DeptId=3;
-- ORA-02292: integrity constraint (SYSTEM.FACULTY_DEPTID_FK1) violated - child record found

-- Q6
select * from crssection order by MAXCOUNT desc;

-- Q7
insert into term values('WN04', 'Winter 2004', '28-Oct-2021', '31-Dec-2021'); 

-- Q8
select * from course where prereq is NULL;

-- -------------------------------------------------------------------------------------------------------
-- Q9
select name, deptname from faculty
  left join department on faculty.deptid=department.deptid
  order by faculty.name, department.DeptName desc;

-- Q10
select * from faculty where name like 'C%'; 

-- Q11
select first||' '||last as name,
 StartTerm from student
 where to_char(startterm)='%2003';

-- Q12
select COUNT(roomid) from location;

-- Q13
select first||' '||last as name, TO_CHAR(birthdate,'DD MONTH, YYYY') as DOB  from student;      -- some more improvements


-- Q14
select 
  min(round(TRUNC(TO_NUMBER(SYSDATE - birthdate)) / 365.25, 0)) as lowestage,
  max(round(TRUNC(TO_NUMBER(SYSDATE - birthdate)) / 365.25, 0)) as highest,
  avg(round(TRUNC(TO_NUMBER(SYSDATE - birthdate)) / 365.25, 0)) as averageage
  from dual, student;


-- Q15
select power(2,10) from dual;

-- Q16
select courseid, prereq from course ;


-- Q17
select * from student where birthdate like '%May%';

