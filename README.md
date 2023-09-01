## SQL Projects from the Bootcamp 

### By: Gino Freud D. Hobayan


Repository of all the major projects I made during the SQL Bootcamp by [Data Vanguard](https://datavanguard.ph/)

(Scroll down for the Capstone Project)

<br>

### 1.) Aggregate functions and Ad Hoc Analysis on covid19_italy dataset

### 2.) Assignment # 2 - More Ad Hoc Analysis on covid19_italy dataset

### 3.) Capstone Project: Analyzing the Instacart dataset using Microsoft SQL


<br><br><br><br>


# Capstone Project:

### Analyzing the Instacart Dataset using Microsoft SQL



```sql

-----------------------------------------------------------
-----------------------------------------------------------
-- SQL BOOTCAMP CAPSTONE PROJECT (Instacart Dataset) using Microsoft SQL
-- BY: GINO FREUD D. HOBAYAN
-----------------------------------------------------------
-----------------------------------------------------------


-----------------------------------------------------------
-----------------------------------------------------------
-- Data Definition Language (DDL)
-----------------------------------------------------------
-----------------------------------------------------------

CREATE DATABASE Instacart_DATABASE;


-----------------------------------------------------------
-- products TABLE  (shape: 49.688, 4)
-----------------------------------------------------------

CREATE TABLE products
(
    product_id VARCHAR(50) PRIMARY KEY NOT NULL,
    product_name VARCHAR(250),
    aisle_id INTEGER,
    department_id INTEGER
);


--- Insert all the data from the CSV file into our table (COMMA DELIMITER)
BULK INSERT products
FROM "C:\Users\GINO\Desktop\SQL Capstone Project\InstaCart Online Grocery Basket Analysis Dataset\products.csv"
WITH (
    FIELDTERMINATOR = ',', -- Use COMMA as the delimiter
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip the header row if present
);



-- Check the TABLE
SELECT TOP 600
	*
FROM
	products
ORDER BY 
	CAST(product_id AS INT);





```

<br><br>

![Thank you wordcloud1](https://github.com/Gino-Freud-Hobayan/SQL-Projects-from-Bootcamp/assets/117270964/a4aef423-bd7f-423a-a657-b40b8b25f000)
