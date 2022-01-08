-- mysql & oracle
--@see https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
select * 
from city
where population > 100000 AND countrycode='USA';


-- mysql & oracle
-- @see https://www.hackerrank.com/challenges/revising-the-select-query-2/problem?isFullScreen=true&h_r=next-challenge&h_v=zen
select name 
from city
where population > 120000 AND countrycode='USA';

-- mysql & oracle
-- @see https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
select * from city where ID=1661;

-- mysql & oracle
-- @see https://www.hackerrank.com/challenges/japanese-cities-attributes/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
select * from city where countrycode='JPN';


-- @see https://www.hackerrank.com/challenges/weather-observation-station-3/problem
-- mysql
select DISTINCT(city) from station where (ID%2)=0;
--oracle
SELECT DISTINCT(CITY) FROM STATION WHERE MOD(ID,2)=0 ;