START TRANSACTION;
SELECT @A:=SUM(salary) FROM table1 WHERE type=1;
UPDATE table2 SET summary=@A WHERE type=1;
COMMIT;

delete transaction;

rollback;
show databases ;

SAVEPOINT ttt1;
ROLLBACK TO SAVEPOINT ttt1;
RELEASE SAVEPOINT ttt1;

LOCK TABLES t AS myalias READ;
UNLOCK TABLES;

SET autocommit=0;

LOCK TABLES t1 WRITE, t2 READ;
select * from t2;
COMMIT;
UNLOCK TABLES;
commit;