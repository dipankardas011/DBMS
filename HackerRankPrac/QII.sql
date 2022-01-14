
-- oracle and mysql
-- @see https://www.hackerrank.com/challenges/weather-observation-station-4/problem
SELECT (COUNT(city) - COUNT(distinct city)) from station;

-- oracle @TODO
select city, length(city) from station
order by length(city), city asc
limit 1;

select city, length(city) from station
order by length(city), city desc
limit 1;
