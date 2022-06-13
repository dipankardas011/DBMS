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

