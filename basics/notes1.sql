CREATE TABLE event (name VARCHAR(20), date DATE,
       type VARCHAR(15), remark VARCHAR(255));

insert into event value('Fluffy', '1995-05-15', 'litter', '4 kittens, 3 female, 1 male');
insert into event value('Buffy', '1993-06-23', 'litter', '5 puppies, 2 female, 3 male');
insert into event value('Buffy', '1994-06-19', 'litter', '3 puppies, 3 female');
insert into event value('Chirpy', '1999-03-21', 'vet', 'needed beak straightened');
insert into event value('Slim', '1997-08-03', 'vet', 'broken rib');
insert into event value('Bowser', '1991-10-12', 'kennel', NULL);
insert into event value('Fang', '1991-10-12', 'kennel', NULL);
insert into event value('Fang', '1998-08-28', 'birthday', 'Gave him a new chew toy');
insert into event value('Claws', '1998-03-17', 'birthday', 'Gave him a new flea collar');
insert into event value('Whistler', '1998-12-09', 'birthday', 'First birthday');

select * from event;

SELECT
    p.name, TIMESTAMPDIFF(YEAR,p.birth,date) AS Age, e.remark
        FROM pet p INNER JOIN event e
    ON p.name = e.name
WHERE e.type = 'litter';


#--------------------------------------------------------


CREATE TABLE shop (
    article INT UNSIGNED  DEFAULT '0000' NOT NULL,
    dealer  CHAR(20)      DEFAULT ''     NOT NULL,
    price   DECIMAL(16,2) DEFAULT '0.00' NOT NULL,
    PRIMARY KEY(article, dealer) # composite PK
);
INSERT INTO shop VALUES
    (1,'A',3.45),
    (1,'B',3.99),
    (2,'A',10.99),
    (3,'B',1.45),
    (3,'C',1.69),
    (3,'D',1.25),
    (4,'D',19.95);

select * from shop;
desc shop;

select article, price from shop order by article;

select MOD(34, 5);


SELECT MIN(article) AS article FROM shop;
SELECT MAX(article) AS article FROM shop;


#------- Row holding max of certain column
SELECT article, dealer, price
FROM   shop
WHERE  price=(SELECT MAX(price) FROM shop);

SELECT s1.article, s1.dealer, s1.price
FROM shop s1
LEFT JOIN shop s2 ON s1.price < s2.price
WHERE s2.article IS NULL;

SELECT article, dealer, price
FROM shop
ORDER BY price DESC
LIMIT 1;

# max of column per group
# among each article find the max price

select article, MAX(price) from shop group by article;

# The Rows Holding the Group-wise Maximum of a Certain Column

select
    *
from shop s1
where
    s1.price=(
        select MAX(s2.price)
        from shop s2
        where s1.article=s2.article
        );
# The preceding example uses a correlated subquery, which can be inefficient (see Section 13.2.11.7, “Correlated Subqueries”). Other possibilities for solving the problem are to use an uncorrelated subquery in the FROM clause, a LEFT JOIN, or a common table expression with a window function.

SELECT s1.article, dealer, s1.price
FROM shop s1
JOIN (
  SELECT article, MAX(price) AS price
  FROM shop
  GROUP BY article
  ) AS s2
  ON s1.article = s2.article AND s1.price = s2.price
ORDER BY price desc;



# last of basics_notes1.png
SELECT s1.article, s1.dealer, s1.price
FROM shop s1
LEFT JOIN shop s2 ON s1.article = s2.article AND s1.price < s2.price
WHERE s2.article IS NULL
ORDER BY s1.article;


WITH s1 AS (
   SELECT article, dealer, price,
          RANK() OVER (PARTITION BY article
                           ORDER BY price DESC
                      ) AS `Rank`
     FROM shop
)
SELECT article, dealer, price
  FROM s1
  WHERE `Rank` = 1
ORDER BY article;
