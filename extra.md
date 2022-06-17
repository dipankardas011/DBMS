
TIMESTAMPDIFF
```sql
mysql> SELECT TIMESTAMPDIFF(MONTH,'2003-02-01','2003-05-01');
        -> 3
mysql> SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');
        -> -1
mysql> SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');
        -> 128885
```

regex
```regix
% for the any pattern
_ for one character
```

 The following list describes some characteristics of extended regular expressions:

. matches any single character.

A character class [...] matches any character within the brackets. For example, [abc] matches a, b, or c. To name a range of characters, use a dash. [a-z] matches any letter, whereas [0-9] matches any digit.

* matches zero or more instances of the thing preceding it. For example, x* matches any number of x characters, [0-9]* matches any number of digits, and .* matches any number of anything.

A regular expression pattern match succeeds if the pattern matches anywhere in the value being tested. (This differs from a LIKE pattern match, which succeeds only if the pattern matches the entire value.)

To anchor a pattern so that it must match the beginning or end of the value being tested, use ^ at the beginning or $ at the end of the pattern.


 To force a regular expression comparison to be case-sensitive, use a case-sensitive collation, or use the BINARY keyword to make one of the strings a binary string, or specify the c match-control character. Each of these queries matches only lowercase b at the beginning of a name:
```sql
SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b' COLLATE utf8mb4_0900_as_cs);
SELECT * FROM pet WHERE REGEXP_LIKE(name, BINARY '^b');
SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b', 'c');
```


```mysql
mysql> WITH s1 AS 
    -> (SELECT article, dealer, price, 
    ->      RANK() OVER (PARTITION BY article  ORDER BY price DESC) 
    ->      AS `Rank` 
    -> FROM shop) 
    -> SELECT article, dealer, price, `Rank` FROM s1  ORDER BY article;
```
```
+---------+--------+-------+------+
| article | dealer | price | Rank |
+---------+--------+-------+------+
|       1 | B      |  3.99 |    1 |
|       1 | A      |  3.45 |    2 |
|       2 | A      | 10.99 |    1 |
|       3 | C      |  1.69 |    1 |
|       3 | B      |  1.45 |    2 |
|       3 | D      |  1.25 |    3 |
|       4 | D      | 19.95 |    1 |
+---------+--------+-------+------+
7 rows in set (0.00 sec)

```

# 3.6.7 Searching on Two Keys

An OR using a single key is well optimized, as is the handling of AND.

The one tricky case is that of searching on two different keys combined with OR:
```mysql
SELECT field1_index, field2_index FROM test_table
WHERE field1_index = '1' OR  field2_index = '1'
```


This case is optimized. See Section 8.2.1.3, “Index Merge Optimization”.

You can also solve the problem efficiently by using a UNION that combines the output of two separate SELECT statements. See Section 13.2.10.3, “UNION Clause”.

Each SELECT searches only one key and can be optimized:
```mysql
SELECT field1_index, field2_index
    FROM test_table WHERE field1_index = '1'
UNION
SELECT field1_index, field2_index
    FROM test_table WHERE field2_index = '1';
```

[Section 11.1.2, “Integer Types (Exact Value) - INTEGER, INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT”](https://dev.mysql.com/doc/refman/8.0/en/integer-types.html)
> Note
For a multiple-row insert, LAST_INSERT_ID() and mysql_insert_id() actually return the AUTO_INCREMENT key from the first of the inserted rows. This enables multiple-row inserts to be reproduced correctly on other servers in a replication setup.

To start with an AUTO_INCREMENT value other than 1, set that value with CREATE TABLE or ALTER TABLE, like this:
```mysql
mysql> ALTER TABLE tbl AUTO_INCREMENT = 100;
```

[Important notes about AUTO_INCREMENT()](https://dev.mysql.com/doc/refman/8.0/en/example-auto-increment.html)

# JSON
[Docs](https://dev.mysql.com/doc/refman/8.0/en/json.html)

# Operators
[Comparasion](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html)

# Agregrate functions
[Link](https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html)
```mysql
SELECT student_name, AVG(test_score)
       FROM student
       GROUP BY student_name;

SELECT student_name, MIN(test_score), MAX(test_score)
       FROM student
       GROUP BY student_name;
SELECT year, country, product, SUM(profit) AS profit
       FROM sales
       GROUP BY year, country, product;
```

[Window Functions](https://dev.mysql.com/doc/refman/8.0/en/window-function-descriptions.html)

# REPLACE works
exactly like INSERT, except that if an old row in the table has the same value as a new row for a PRIMARY KEY or a UNIQUE index, the old row is deleted before the new row is inserted. 


# Select
```mysql
SELECT * FROM table1 LEFT JOIN table2 ON table1.id = table2.id
# Natural joins and joins with USING, including outer join variants,
SELECT * FROM t1 NATURAL JOIN t2;
SELECT * FROM t1 JOIN t2 USING (j);
```

# SubQuery

```mysql
#  Here is an example of a common-form subquery comparison that you cannot do with a join. It finds all the rows in table t1 for which the column1 value is equal to a maximum value in table t2:

SELECT * FROM t1
  WHERE column1 = (SELECT MAX(column2) FROM t2);
```

```mysql
SELECT s1 FROM t1 WHERE s1 > ANY (SELECT s1 FROM t2);
```
Suppose that there is a row in table t1 containing (10). The expression is TRUE if table t2 contains (21,14,7) because there is a value 7 in t2 that is less than 10. The expression is FALSE if table t2 contains (20,10), or if table t2 is empty. The expression is unknown (that is, NULL) if table t2 contains (NULL,NULL,NULL).

When used with a subquery, the word IN is an alias for = ANY. Thus, these two statements are the same:
```mysql
SELECT s1 FROM t1 WHERE s1 = ANY (SELECT s1 FROM t2);
SELECT s1 FROM t1 WHERE s1 IN    (SELECT s1 FROM t2);
```

Suppose that there is a row in table t1 containing (10). The expression is TRUE if table t2 contains (-5,0,+5) because 10 is greater than all three values in t2. The expression is FALSE if table t2 contains (12,6,NULL,-100) because there is a single value 12 in table t2 that is greater than 10. The expression is unknown (that is, NULL) if table t2 contains (0,NULL,1).

Finally, the expression is TRUE if table t2 is empty. So, the following expression is TRUE when table t2 is empty:

```mysql
SELECT * FROM t1 WHERE 1 > ALL (SELECT s1 FROM t2);
```

# Subquery Exists or NOT Exists
[Docs](https://dev.mysql.com/doc/refman/8.0/en/exists-and-not-exists-subqueries.html)

# SIGNAL

[Link](https://dev.mysql.com/doc/refman/8.0/en/signal.html)

# Adminstration
[](https://dev.mysql.com/doc/refman/8.0/en/account-management-statements.html)