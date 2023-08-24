
```sql

----------------------------------------------------------------
----------------------------------------------------------------
-- SQL EXERCISES DAY 2 - Ad Hoc Analysis practice
-- AGGREGATE FUNCTIONS
----------------------------------------------------------------
----------------------------------------------------------------

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




```
