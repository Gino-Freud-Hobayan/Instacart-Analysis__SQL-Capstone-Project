# SQL-Bootcamp

<br>

```sql

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
/*

ASSIGNMENT #2 - SQL BOOTCAMP (AUG 2023) 
AD-HOC ANALYSIS EXERCISE FOR THE BIGQUERY PUBLIC DATASET: covid19_italy

BY: GINO FREUD HOBAYAN

*/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------





/*
GUIDES:

Regular data = SUM
Cumulative data = MAX

Don't use "recovered" column for queries about vaccine effectivity.


`bigquery-public-data.covid19_italy.data_by_province` AS province

`bigquery-public-data.covid19_italy.data_by_region` AS region

`bigquery-public-data.covid19_italy.national_trends` AS nat_trends

*/ 






-- 1. WHAT is the region with the MOST confirmed cases?

SELECT
  region.region_name,
  MAX(region.total_confirmed_cases) AS max_confirmed_cases
FROM
  `bigquery-public-data.covid19_italy.data_by_region` AS region
GROUP BY
  region.region_name
ORDER BY
  max_confirmed_cases DESC

LIMIT 
  1


/*

ANSWER:
Region name: Lombardia
max_confirmed_cases: 4,170,894

*/







/*
OTHER (INCORRECT) ATTEMPT:
-- WHAT'S WRONG WITH THIS? I ordered by region name, thats why ABruzzo popped up first as well

SELECT
  region.region_name,
  region.total_confirmed_cases
FROM
  `bigquery-public-data.covid19_italy.data_by_region` AS region
GROUP BY
  region.region_name,
  region.total_confirmed_cases
ORDER BY 
  region.region_name,
  region.total_confirmed_cases DESC

Region name: Abruzzo
total confirmed cases: 663,275
*/







-- 2. In which province is the difference between [the number of confirmed cases] and [the number of recovered patients] the greatest?

-- province TABLE does not have "recovered" column, might have to use JOIN ON national_trends

SELECT
  province.province_name,
  province.confirmed_cases - province.recovered AS difference
FROM
  `bigquery-public-data.covid19_italy.data_by_province` AS province
ORDER BY
  difference DESC

LIMIT 1



/*

ANSWER:

*/











-- 3. WHAT are the regions with the most recovered patients?

-- using "recovered" column for this specific query. Although not recommended when measuring vaccine effectivity, since a person can recover without a vaccine.
SELECT
  DISTINCT(region_name) AS regions_with_the_most_recovered,
  MAX(recovered) AS count_of_total_recovered
FROM
  `bigquery-public-data.covid19_italy.data_by_region` AS region
GROUP BY
  region_name
ORDER BY
  count_of_total_recovered DESC

/*

ANSWER:
1.)Lombardia        - 4,123,903
2.)Veneto           - 2,701,259
3.)Campania         - 2,444,627
4.)Lazio            - 2,390,707
5.)Emilia-Romagna   - 2,137,865
6.)Sicilia          - 1,812,771
7.)Piemonte         - 1,696,057

*/





/*
OTHER (INCORRECT) ATTEMPT: Let's use deaths this time

SELECT
  DISTINCT(region_name) AS regions_with_the_most_recovered,
  MIN(deaths) AS count_of_total_deaths
FROM
  `bigquery-public-data.covid19_italy.data_by_region` AS region
GROUP BY
  region_name
ORDER BY
  count_of_total_deaths DESC


deaths:

1.) Lombardia - 6
2.) Veneto - 1
3.) Piemonte - 0
4.) Friuli Venezia Giulia - 0
5.) Liguria - 0
6.) Emilia-Romagna - 0
*/














-- 4. WHAT is the total number of confirmed cases in italy

-- total_confirmed_cases column is Cumulative, we use MAX not SUM
SELECT
  MAX(nat_trends.total_confirmed_cases) AS total_num_of_confirmed_cases_in_italy   
FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends

/*

ANSWER:
total_num_of_confirmed_cases_in_italy: 25,929,238  

*/















-- 5. WHAT is the total number of deaths in italy

SELECT
  MAX(nat_trends.deaths) AS total_num_of_deaths_in_italy    -- deaths column is Cumulative, we use MAX not SUM
FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends

/*

ANSWER:
total_num_of_deaths_in_italy: 191,167   

*/






/*
-- used this to figure out if it's cumulative.
SELECT
  date,
  deaths
FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends
ORDER BY
  date
*/










-- 6. WHAT is the ratio of [the number of deaths] to [the number of confirmed cases nationwide?]

SELECT
  MAX(nat_trends.deaths) AS num_of_deaths,
  MAX(nat_trends.total_confirmed_cases) AS num_of_confirmed_cases_in_italy,
  MAX(nat_trends.deaths) / MAX(nat_trends.total_confirmed_cases) AS ratio

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends



/*

ANSWER: RATIO: 0.00737
num_of_deaths: 191,167
num_of_confirmed_cases_in_italy: 25,929,238

*/











-- 7. WHAT is the ratio of [the number of deaths] to [the number of confirmed cases nationwide?]

SELECT
  MAX(nat_trends.deaths) AS num_of_deaths,
  MAX(nat_trends.total_confirmed_cases) AS num_of_confirmed_cases_in_italy,
  MAX(nat_trends.deaths) / MAX(nat_trends.total_confirmed_cases) AS ratio

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends



/*

ANSWER: RATIO: 0.00737
num_of_deaths: 191,167
num_of_confirmed_cases_in_italy: 25,929,238

*/









-- 8. WHAT is the ratio of [the number of hospitalized patients] to [the number of confirmed cases in Italy?]
SELECT
  MAX(nat_trends.total_hospitalized_patients) AS num_of_hospitalized_patients,
  MAX(nat_trends.total_confirmed_cases) AS num_of_confirmed_cases_in_italy,

  MAX(nat_trends.total_hospitalized_patients) / MAX(nat_trends.total_confirmed_cases) AS ratio

FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends


/*

ANSWER: RATIO: 0.001485
num_of_hospitalized_patients: 38,507
num_of_confirmed_cases_in_italy: 25,929,238

*/





/*
-- used this to figure out if it's cumulative.
-- (total_hospitalized_patients IS CUMULATIVE)
SELECT
  date,
  total_hospitalized_patients
FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends
ORDER BY
  date

-- used this to figure out if it's cumulative.
-- (total_confirmed_cases IS CUMULATIVE)
SELECT
  date,
  total_confirmed_cases
FROM
  `bigquery-public-data.covid19_italy.national_trends` AS nat_trends
ORDER BY
  date
*/









-- 9. WHAT are the top 5 provinces with the most confirmed cases?

SELECT
  DISTINCT(province.province_name) AS distinct_province_name,
  MAX(province.confirmed_cases) AS count_of_confirmed_cases
FROM
  `bigquery-public-data.covid19_italy.data_by_province` AS province
GROUP BY
  distinct_province_name
ORDER BY
  count_of_confirmed_cases DESC
LIMIT
  5


/*

ANSWER:
1.) Roma          - 1,792,437
2.) Milano        - 1,336,821
3.) Napoli        - 1,303,985
4.) Torino        - 923,618
5.) Padova        - 540,031

*/



















-- 10. WHAT are the top 5 provinces with the most confirmed cases?

SELECT
  DISTINCT(province.province_name) AS distinct_province_name,
  MAX(province.confirmed_cases) AS count_of_confirmed_cases
FROM
  `bigquery-public-data.covid19_italy.data_by_province` AS province
GROUP BY
  distinct_province_name
ORDER BY
  count_of_confirmed_cases DESC
LIMIT
  5


/*

ANSWER:
1.) Roma          - 1,792,437
2.) Milano        - 1,336,821
3.) Napoli        - 1,303,985
4.) Torino        - 923,618
5.) Padova        - 540,031

*/







```


