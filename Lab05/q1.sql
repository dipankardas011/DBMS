-- Q1
select FIRST||' '||LAST as Name, to_char(BIRTHDATE, 'YYYY, DDTH month') as DOB from student;

-- Q2
create user c##hello identified by kiit ;
grant select on term to c##hello;
grant create session to c##hello;
select * from system.term;

-- Q3
select count(unique roomtype) as noOfRooms from room;

-- Q4
select count(unique building) as noOfRooms from location;

-- Q5
select termid, avg(maxcount) from crssection group by termid;

-- Q6
select termid, max(maxcount) from crssection group by termid;

-- Q7
select courseid, max(maxcount) from crssection group by courseid;

-- Q8
select * from crssection order by courseid, termid desc;

-- Q9
select * from crssection order by termid, courseid desc;

-- Q10
select count(*), midterm from registration group by midterm;

-- Q11
create table student_details(
    studentid, first, last, street, city, state, zip, birthdate, phone
  )
   as select 
    studentid, first, last, street, city, state, zip, birthdate, phone 
  from student;