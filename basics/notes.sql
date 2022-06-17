create database me;

use me;

create table pet(
  name varchar(20),
  owner varchar(20),
  species varchar(20),
  sex char(1),
  birth date,
  death date
);

insert into pet values('Fluffy', 'Harold', 'cat', 'f', '1993-02-04', NULL);
insert into pet values('Claws', 'Gwen', 'cat', 'm', '1994-03-17', NULL);
insert into pet values('Buffy', 'Harold', 'dog', 'f', '1989-05-13', NULL);
insert into pet values('Fang', 'Benny', 'dog', 'm', '1990-08-27', NULL);
insert into pet values('Bowser', 'Diane', 'dog', 'm', '1979-08-31', '1995-07-29');
insert into pet values('Chirpy', 'Gwen', 'bird', 'f', '1998-09-11', NULL);
insert into pet values('Whistler', 'Gwen', 'bird', 'NULL', '1997-12-09', NULL);     
insert into pet values('Slim', 'Benny', 'snake', 'm', '1996-04-29', NULL);
insert into pet values('Puffball', 'Diane', 'hamster', 'f', '1999-03-30', NULL);

select * from pet;

update pet set sex='f' where name='Slim';

select * from pet where birth >= '1998-1-1';

select distinct owner from pet;

select name as NAM, owner as OWN, birth AS DOB
    from pet
    where species in ('cat', 'dog');

select * from pet order by species asc, birth desc;

select name, sex, birth, TIMESTAMPDIFF(YEAR, birth, curdate()) as Age from pet;

select name, birth, month(birth) as month from pet;

# which animal has DOB next 1 month
select
    name, owner, sex, birth
       from pet
    where
        (MOD(month(curdate()), 12)+2 = month(birth))
        and
        (death is NULL or death > curdate());
SELECT 1 is NULL, 1 is not NULL;

select * from pet where name like 'F%';
select * from pet where name like '_l%';

SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b'); # begin with b
SELECT * FROM pet WHERE REGEXP_LIKE(name, 'fy$'); # end with fy

select * from pet where REGEXP_LIKE(name, '^.....$'); # 5 characters
select * from pet where REGEXP_LIKE(name, '^.{5}$'); # 5 characters

select owner, count(*) as number_of_pets from pet group by owner;

select species, count(*) as number_of_animals from pet group by species;

select sex, count(*) as gender_demograph from pet group by sex;

select species, sex, count(*) as number_of_animals_per_species_per_sex from pet group by species, sex;

drop table pet;