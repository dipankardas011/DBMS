CREATE table employeeinfo(empid INT, empfname VARCHAR(10), emplname VARCHAR(10), department VARCHAR(10), project VARCHAR(5), address VARCHAR(30), DOB DATE, gender CHAR(1));

describe employeeinfo;

INSERT INTO employeeinfo VALUES(
    1,
    'Sanjay',
    'Mehra',
    'HR',
    'P1',
    'Hyderabad(HYD)',
    '1-Dec-1976',
    'M'
);
INSERT INTO employeeinfo VALUES(
    2,
    'Ananya',
    'Mishra',
    'Admin',
    'P2',
    'Delhi(DEL)',
    '2-May-1968',
    'F'
);
INSERT INTO employeeinfo VALUES(
    3,
    'Rohan',
    'Diwan',
    'Account',
    'P3',
    'Mumbai(BOM)',
    '1-Jan-1980',
    'M'
);
INSERT INTO employeeinfo VALUES(
    4,
    'Sonia',
    'Kulkarni',
    'HR',
    'P1',
    'Hyderabad(HYD)',
    '2-May-1976',
    'F'
);
INSERT INTO employeeinfo VALUES(
    5,
    'Ankit',
    'Kapoor',
    'Admin',
    'P2',
    'Delhi(DEL)',
    '3-Jul-1994',
    'M'
);
COMMIT;
-- ALTER table employeeinfo modify(address VARCHAR(20));
-- Q1
SELECT * from employeeinfo;
-- Q2
SELECT empfname||' '||emplname as EmployeeName, address from employeeinfo;
-- Q3
SELECT COUNT(*) from employeeinfo;
-- Q4
SELECT empfname from employeeinfo;
-- Q5
SELECT project from employeeinfo;
-- Q6
SELECT department from employeeinfo;
-- Q7
SELECT gender from employeeinfo;
-- Q8
SELECT * from employeeinfo WHERE empfname='Sanjay';
-- Q9
SELECT * from employeeinfo WHERE department='HR';
-- Q10
SELECT * from employeeinfo WHERE address LIKE '%(HYD)';
