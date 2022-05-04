-- Q1
create table student(
  rollno varchar(10) primary key,
  sname VARCHAR(15),
  marks number
);

create table book(
  bid varchar(10),
  bname VARCHAR(15),
  author VARCHAR(15),
  rollno varchar(10)
);

alter table book add foreign key(rollno) REFERENCES student(rollno);

create table state_name(
  ccity VARCHAR(20),
  state VARCHAR(20)
);

insert into student values('SO1', 'Praadip', 75);
insert into student values('SO2', 'Aastik', 82);
insert into student values('SO3', 'Tushar', 63);
insert into student values('SO4', 'Arpan', 79);
insert into student values('SO5', 'Anumita', 66);


insert into book values('I3', 'C', 'BGSwamy', 'SO2');
insert into book values('I2', 'DS', 'RBPatel', 'SO5');
insert into book values('I1', 'DS', 'ASBaluja', 'SO3');

insert into state_name values('Mysore', 'Karnataka');
insert into state_name values('Kolkata', 'West Bengal');
insert into state_name values('Pune', 'Maharashtra');
insert into state_name values('Chennai', 'Tamilnadu');
insert into state_name values('Indore', 'Madhya pradesh');


-----

--Q2
select sname from student where marks > (
  select marks from student where sname='Arpan'
);

-- Q3
select bid, author from book where bname='DS';

-- Q4
set SERVEROUTPUT on;
DECLARE
  m number;
  n number;
  iter number;
BEGIN
  m := &m;
  n := &n;
  iter := m;
  LOOP
    exit when n <= 1;
    m := m + iter;
    n := n-1;
  end loop;
  DBMS_OUTPUT.PUT_LINE('Product-> '||m);
END;
/