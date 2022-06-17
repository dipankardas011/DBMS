show databases ;

use learning;


# variables
SET @mysize = 'medium';
set @hello = binary '100101001';
select @mysize, @hello;

CREATE TABLE shirts (
    name VARCHAR(40),
    size ENUM('x-small', 'small', 'medium', 'large', 'x-large')
);

desc shirts;

INSERT INTO shirts (name, size) VALUES ('dress shirt','large'), ('t-shirt','medium'),
  ('polo shirt','small');

select * from shirts;




CREATE TABLE t1 (jdoc JSON);

INSERT INTO t1 VALUES('{"key1": "value1", "key2": "value2"}');

select * from t1;

SELECT JSON_TYPE('["a", "b", 1]');


SELECT JSON_TYPE('"hello"');

SELECT JSON_ARRAY('a', 1, NOW());

SET @j = JSON_OBJECT('name', 'dipankar');

select @j;

CREATE TABLE facts (sentence JSON);

INSERT INTO facts VALUES (JSON_OBJECT('mascot', 'Our mascot is a dolphin named "Sakila".'));

select * from facts;
# To look up this particular sentence employing mascot as the key, you can use the column-path operator ->, as shown here:

SELECT sentence->"$.mascot" FROM facts;
SELECT sentence->>"$.mascot" FROM facts;


SELECT IF(1<2,'yes','no');
# If expr1 is not NULL, IFNULL() returns expr1; otherwise it returns expr2.
SELECT IFNULL(NULL,10);


SELECT DATE_ADD('2008-01-02', INTERVAL 31 DAY);
SELECT ADDDATE('2008-01-02', INTERVAL 31 DAY);
SELECT CURDATE();
SELECT CURDATE() + 0;


SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
SELECT DATE_SUB('2018-05-01',INTERVAL 1 YEAR);
SELECT DATE_ADD('2018-12-31 23:59:59', INTERVAL 1 DAY);
SELECT DAYNAME('2007-02-03');
SELECT DAYOFMONTH('2007-02-03');
SELECT DAYOFWEEK('2007-02-03');
SELECT HOUR('10:05:03');
SELECT MONTH('2008-02-03');
SELECT MINUTE('2008-02-03 10:05:03');
SELECT SEC_TO_TIME(90);

SELECT STR_TO_DATE('01,5,2013','%d,%m,%Y');

SELECT TIMESTAMPADD(MINUTE,1,'2003-01-02');
SELECT TIMESTAMPADD(MINUTE,1,'2003-01-02 23:3:59');

SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');


# https://dev.mysql.com/doc/refman/8.0/en/locking-functions.html locking protocol
SELECT GET_LOCK('lock1',10);
SELECT RELEASE_LOCK('lock1');

DO SLEEP(5);


CREATE TABLE test (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  data VARCHAR(64) DEFAULT NULL,
  ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

REPLACE INTO test VALUES (1, 'Old', '2014-08-20 18:47:00');

select * from test;

REPLACE INTO test (id,data) VALUES (1, 'New');


drop table learning.t1;
CREATE TABLE t1 (x INT, y INT);
INSERT INTO t1 VALUES ROW(4,-2),ROW(5,9), ROW(1,2);

CREATE TABLE t2 (a INT, b INT);
INSERT INTO t2 VALUES ROW(1,2),ROW(3,4);

select * from t1 UNION select * from t2;

# paramertrized way
(SELECT * FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'mysql');

(SELECT 'a' UNION SELECT 'b' ) LIMIT 1;