show databases;

use my_db;


show tables;

create table weather(
    id int unsigned auto_increment primary key ,
    city varchar(15) not null ,
    temp decimal(2,2) not null ,
    weather_condition enum('raining', 'snow', 'overcast', 'sunny')
)engine =INNODB;

desc weather;

alter table weather modify column temp decimal(5,2) not null;

insert into weather (city, temp, weather_condition) values
                                                        ('Jamshedpur', 23.4, 'raining'),
                                                        ('New Delhi', 33.4, 'sunny'),
                                                        ('Chennai', 29.4, 'overcast');

select * from weather;