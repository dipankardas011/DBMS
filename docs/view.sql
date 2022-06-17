create table weather(
    city varchar(20) PRIMARY KEY,
    lattitude decimal(5,2) NOT NULL,
    longitude decimal(5,2) NOT NULL,
    temp float,
    country varchar(15)
)engine=INNODB;

show tables;

insert into weather value
    ('NEW YORK', 12.4, 190.0, 19.2, 'USA'),
    ('NEW JERSEY', 80.4, 190.0, 11.2, 'USA'),
    ('NEW DELHI', 23.4, 40.0, 30.2, 'INDIA');

select * from weather where temp > 20;

CREATE VIEW viewUSA AS SELECT * FROM weather where country='USA';

select * from viewUSA;
commit;