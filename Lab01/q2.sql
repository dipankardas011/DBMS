CREATE table student(
    name VARCHAR(20),
    roll NUMBER(10),
    branch VARCHAR(20),
    city VARCHAR(20)
);

INSERT INTO student VALUES(
    'VIJAYA',
    150,
    'CSE',
    'CHENNAI'
);


INSERT INTO student VALUES(
    'SITA',
    202,
    'ETC',
    'KOLKATA'
);

INSERT INTO student VALUES(
    'RAVI',
    300,
    'EEE',
    'DELHI'
);

INSERT INTO student VALUES(
    'BASU',
    165,
    'ETC',
    'CHENNAI'
);

INSERT INTO student VALUES(
    'RASMI',
    107,
    'ETC',
    'RKL'
);


INSERT INTO student VALUES(
    'KARAN',
    111,
    'CSE',
    'CTC'
);

INSERT INTO student VALUES(
    'REKHA',
    117,
    'BME',
    'BBSR'
);

SELECT * from student;

COMMIT;
-- Q2
UPDATE student SET name='GITA' WHERE name='SITA';
ROLLBACK;
-- Q3
DELETE FROM student WHERE branch='ETC';
ROLLBACK;
-- Q4
RENAME student TO studinformation;

RENAME studinformation TO student;
-- Q5
ALTER TABLE student ADD(marks NUMBER(8));
-- Q6
ALTER TABLE student modify(name VARCHAR(25));
-- Q7
ALTER TABLE student DROP column marks;
-- Q8
DELETE student;
-- Q9
DROP table student;

-- Q10
SELECT * from student WHERE name='BASU';
-- Q11
SELECT * from student WHERE branch='CSE';
-- Q12
SELECT * from student WHERE city='BBSR';
-- Q13
ALTER table student RENAME column city to city_name;
-- Q15
DELETE FROM student WHERE roll=117;
-- Q16
ALTER TABLE student ADD (DOB DATE);
-- Q17
UPDATE student SET DOB='1-Jan-2002';

SELECT * from student;