
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