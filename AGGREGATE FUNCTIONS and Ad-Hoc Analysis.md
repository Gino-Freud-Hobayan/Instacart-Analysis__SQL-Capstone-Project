
```sql

----------------------------------------------------------------
----------------------------------------------------------------
-- SQL EXERCISES DAY 2 - Ad Hoc Analysis practice
-- AGGREGATE FUNCTIONS
----------------------------------------------------------------
----------------------------------------------------------------

/*
WHERE = FILTERING
ORDER BY = SORTING
HAVING = FILTERING FOR AGGREGATE FUCTIONS
*/





-- 1.) WHAT is the total number of individuals isolated in their own homes and the total confirmed cases at the moment.

-- If it's Cumulative data = we use MAX not SUM (Aggregate Function)
SELECT
  MAX(nt.home_confinement_cases) AS max_of_home_confined_cases,
  MAX(nt.total_current_confirmed_cases) AS total_of_current_confirmed_cases_at_the_moment

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nt


/*

ANSWER:
MAX_of_home_confined_cases: 2,713,594
total_of_current_confirmed_cases_at_the_moment: 2,734,906

*/











-- 2.) Which day posted the least amount of tests performed?
SELECT
  nat_trends.date,
  nat_trends.tests_performed

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends
ORDER BY
  tests_performed ASC
LIMIT
  1

/*

ANSWER: 24 FEB 2020 - 4,324 tests performed (This is cumulative data)

*/











-- 3.) WHEN was the highest fatality recorded?

SELECT
  nat_trends.date,
  nat_trends.deaths

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends

ORDER BY
  deaths DESC


/*

ANSWER: 16 AUG 2023 = 191,1167

THIS IS ALSO CUMULATIVE DATA, As of now August 16 is the latest date that's why it has the highest death count.

*/














-- 4.) Total number of records in the province (TOTAL NO. OF ROWS)

-- IF WE WANT TO FIND THE TOTAL ROWS
SELECT
  COUNT(date) AS total_num_of_rows
FROM
  `bigquery-public-data.covid19_italy.data_by_province`

/*

ANSWER: total number of records/rows: 186,668

*/





/*
-- wrong, but nice try.
SELECT
  MAX(confirmed_cases) AS total_num_of_records_province
FROM
  `bigquery-public-data.covid19_italy.data_by_province`

-- ANSWER: 1,792,437
*/














-- 5.) Total number of deaths and Total records (Italy)

SELECT
  MAX(nat_trends.deaths) AS total_num_of_deaths,
  COUNT(nat_trends.date) AS total_records_or_rows

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends

/*

ANSWER: 
total_num_of_deaths - 191,167
total_records_or_rows - 1,270

*/







/*
INCORRECT ATTEMPT, nice try though.

SELECT
  nat_trends.date,
  nat_trends.deaths,
  nat_trends.total_confirmed_cases

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends
ORDER BY
  deaths DESC


-- ANSWER: 
-- TOTAL DEATHS = 191,167
-- TOTAL RECORDS = 25,929,238

-- The "total_confirmed_cases" and "deaths" columns are both CUMULATIVE, 
-- Because the latest date is 16 AUG 2023, it also has the highest for both TOTAL DEATH and TOTAL RECORDS.
*/


```
