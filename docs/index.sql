CREATE TABLE customers (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    custinfo JSON
    );

CREATE INDEX zips ON customers ( (CAST(custinfo->'$.zipcode' AS UNSIGNED ARRAY)) );

desc customers;

INSERT INTO customers VALUES
    (NULL, NOW(), '{"user":"Jack","user_id":37,"zipcode":[94582,94536]}'),
    (NULL, NOW(), '{"user":"Jill","user_id":22,"zipcode":[94568,94507,94582]}'),
    (NULL, NOW(), '{"user":"Bob","user_id":31,"zipcode":[94477,94507]}'),
    (NULL, NOW(), '{"user":"Mary","user_id":72,"zipcode":[94536]}'),
    (NULL, NOW(), '{"user":"Ted","user_id":56,"zipcode":[94507,94582]}');

select custinfo->>'$.zipcode' as zipcodes from customers;

select custinfo->>'$.zipcode[0]' from customers;

SELECT * FROM customers WHERE JSON_OVERLAPS(custinfo->'$.zipcode', CAST('[94507,94582]' AS JSON));

ALTER TABLE customers ADD INDEX zipsAA( (CAST(custinfo->'$.zipcode' AS UNSIGNED ARRAY)) );

desc customers;

EXPLAIN SELECT * FROM customers WHERE 94507 MEMBER OF(custinfo->'$.zipcode');