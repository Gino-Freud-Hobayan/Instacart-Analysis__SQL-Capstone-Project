


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







-----------------------------------------------------------
-- orders TABLE   (shape: 3.421.083, 7)
-----------------------------------------------------------

CREATE TABLE orders
(
    order_id INTEGER PRIMARY KEY NOT NULL,
    user_id INTEGER,
    eval_set VARCHAR(100),
    order_number INTEGER,
    order_dow INTEGER,
    order_hour_of_day INTEGER,
    days_since_prior_order FLOAT
);

BULK INSERT orders
FROM "C:\Users\GINO\Desktop\SQL Capstone Project\InstaCart Online Grocery Basket Analysis Dataset\orders.csv"
WITH (
    FIELDTERMINATOR = ',',         -- Use COMMA as the delimiter
    ROWTERMINATOR = '0x0a',        -- Hexadecimal representation of line feed
    FIRSTROW = 2                   -- Skip the header row if present
);



-- Check the TABLE
SELECT TOP 1000
	*
FROM
	orders
ORDER BY
	user_id


-- days_since_prior_order COLUMN HAS NULL VALUES.










-----------------------------------------------------------
-- order_product_prior TABLE  (shape: 32.434.489, 4)
-----------------------------------------------------------

CREATE TABLE order_products__prior
(
    order_id INT,
    product_id VARCHAR(50),
    add_to_cart_order INT,
    reordered INT,
);

BULK INSERT order_products__prior
FROM "C:\Users\GINO\Desktop\SQL Capstone Project\InstaCart Online Grocery Basket Analysis Dataset\order_products__prior.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a', -- Hexadecimal representation of line feed
    FIRSTROW = 2
);

----------------------------------------------------------------------------------
-- SUCCESSFULLY CREATED A TABLE WITH 32,400,000 ROWS
-- QUERIES TAKE QUITE A WHILE


-- Check the TABLE
SELECT TOP 1000
	*
FROM
	order_products__prior
ORDER BY
	order_id,
	add_to_cart_order













-----------------------------------------------------------
-- order_product_train TABLE  (shape: 1.384.617, 4)
-----------------------------------------------------------

CREATE TABLE order_products__train
(
    order_id INT,
    product_id VARCHAR(50),
    add_to_cart_order INT,
    reordered INT,
);

BULK INSERT order_products__train
FROM "C:\Users\GINO\Desktop\SQL Capstone Project\InstaCart Online Grocery Basket Analysis Dataset\order_products__train.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    FIRSTROW = 2
);


-- Check the TABLE
SELECT TOP 1000
	*
FROM
	order_products__train
ORDER BY
	order_id,
	add_to_cart_order









-----------------------------------------------------------
-- aisles TABLE (shape: 134,2)
-----------------------------------------------------------
CREATE TABLE aisles
(
    aisle_id INTEGER PRIMARY KEY,
    aisle_name VARCHAR(255)
);


INSERT INTO aisles 
	(aisle_id, aisle_name)
VALUES
(1, 'prepared soups salads'),
(2, 'specialty cheeses'),
(3, 'energy granola bars'),
(4, 'instant foods'),
(5, 'marinades meat preparation'),
(6, 'other'),
(7, 'packaged meat'),
(8, 'bakery desserts'),
(9, 'pasta sauce'),
(10, 'kitchen supplies'),
(11, 'cold flu allergy'),
(12, 'fresh pasta'),
(13, 'prepared meals'),
(14, 'tofu meat alternatives'),
(15, 'packaged seafood'),
(16, 'fresh herbs'),
(17, 'baking ingredients'),
(18, 'bulk dried fruits vegetables'),
(19, 'oils vinegars'),
(20, 'oral hygiene'),
(21, 'packaged cheese'),
(22, 'hair care'),
(23, 'popcorn jerky'),
(24, 'fresh fruits'),
(25, 'soap'),
(26, 'coffee'),
(27, 'beers coolers'),
(28, 'red wines'),
(29, 'honeys syrups nectars'),
(30, 'latino foods'),
(31, 'refrigerated'),
(32, 'packaged produce'),
(33, 'kosher foods'),
(34, 'frozen meat seafood'),
(35, 'poultry counter'),
(36, 'butter'),
(37, 'ice cream ice'),
(38, 'frozen meals'),
(39, 'seafood counter'),
(40, 'dog food care'),
(41, 'cat food care'),
(42, 'frozen vegan vegetarian'),
(43, 'buns rolls'),
(44, 'eye ear care'),
(45, 'candy chocolate'),
(46, 'mint gum'),
(47, 'vitamins supplements'),
(48, 'breakfast bars pastries'),
(49, 'packaged poultry'),
(50, 'fruit vegetable snacks'),
(51, 'preserved dips spreads'),
(52, 'frozen breakfast'),
(53, 'cream'),
(54, 'paper goods'),
(55, 'shave needs'),
(56, 'diapers wipes'),
(57, 'granola'),
(58, 'frozen breads doughs'),
(59, 'canned meals beans'),
(60, 'trash bags liners'),
(61, 'cookies cakes'),
(62, 'white wines'),
(63, 'grains rice dried goods'),
(64, 'energy sports drinks'),
(65, 'protein meal replacements'),
(66, 'asian foods'),
(67, 'fresh dips tapenades'),
(68, 'bulk grains rice dried goods'),
(69, 'soup broth bouillon'),
(70, 'digestion'),
(71, 'refrigerated pudding desserts'),
(72, 'condiments'),
(73, 'facial care'),
(74, 'dish detergents'),
(75, 'laundry'),
(76, 'indian foods'),
(77, 'soft drinks'),
(78, 'crackers'),
(79, 'frozen pizza'),
(80, 'deodorants'),
(81, 'canned jarred vegetables'),
(82, 'baby accessories'),
(83, 'fresh vegetables'),
(84, 'milk'),
(85, 'food storage'),
(86, 'eggs'),
(87, 'more household'),
(88, 'spreads'),
(89, 'salad dressing toppings'),
(90, 'cocoa drink mixes'),
(91, 'soy lactosefree'),
(92, 'baby food formula'),
(93, 'breakfast bakery'),
(94, 'tea'),
(95, 'canned meat seafood'),
(96, 'lunch meat'),
(97, 'baking supplies decor'),
(98, 'juice nectars'),
(99, 'canned fruit applesauce'),
(100, 'missing'),
(101, 'air fresheners candles'),
(102, 'baby bath body care'),
(103, 'ice cream toppings'),
(104, 'spices seasonings'),
(105, 'doughs gelatins bake mixes'),
(106, 'hot dogs bacon sausage'),
(107, 'chips pretzels'),
(108, 'other creams cheeses'),
(109, 'skin care'),
(110, 'pickled goods olives'),
(111, 'plates bowls cups flatware'),
(112, 'bread'),
(113, 'frozen juice'),
(114, 'cleaning products'),
(115, 'water seltzer sparkling water'),
(116, 'frozen produce'),
(117, 'nuts seeds dried fruit'),
(118, 'first aid'),
(119, 'frozen dessert'),
(120, 'yogurt'),
(121, 'cereal'),
(122, 'meat counter'),
(123, 'packaged vegetables fruits'),
(124, 'spirits'),
(125, 'trail mix snack mix'),
(126, 'feminine care'),
(127, 'body lotions soap'),
(128, 'tortillas flat bread'),
(129, 'frozen appetizers sides'),
(130, 'hot cereal pancake mixes'),
(131, 'dry pasta'),
(132, 'beauty'),
(133, 'muscles joints pain relief'),
(134, 'specialty wines champagnes');



-- Check the TABLE
SELECT
	*
FROM
	aisles





-----------------------------------------------------------
-- departments TABLE (shape: 21,2)
-----------------------------------------------------------

CREATE TABLE departments 
(
  department_id INT PRIMARY KEY,
  department VARCHAR(255) NOT NULL
);

INSERT INTO departments
  (department_id, department)
VALUES
  ('1', 'frozen'),
  ('2', 'other'),
  ('3', 'bakery'),
  ('4', 'produce'),
  ('5', 'alcohol'),
  ('6', 'international'),
  ('7', 'beverages'),
  ('8', 'pets'),
  ('9', 'dry goods pasta'),
  ('10', 'bulk'),
  ('11', 'personal care'),
  ('12', 'meat seafood'),
  ('13', 'pantry'),
  ('14', 'breakfast'),
  ('15', 'canned goods'),
  ('16', 'dairy eggs'),
  ('17', 'household'),
  ('18', 'babies'),
  ('19', 'snacks'),
  ('20', 'deli'),
  ('21', 'missing');


-- Check the TABLE
SELECT
	*
FROM
	departments





-- TRIAL ------------------------------------------------------------------


-- MERGE THE IDENTICAL TABLES INTO ONE
CREATE TABLE all_order_products_combined
(
    order_id INT,
    product_id VARCHAR(50),
    add_to_cart_order INT,
    reordered INT
);

-- Insert data from order_products__prior
INSERT INTO all_order_products_combined (order_id, product_id, add_to_cart_order, reordered)
SELECT order_id, product_id, add_to_cart_order, reordered FROM order_products__prior;

-- Insert data from order_products__train
INSERT INTO all_order_products_combined (order_id, product_id, add_to_cart_order, reordered)
SELECT order_id, product_id, add_to_cart_order, reordered FROM order_products__train;




-----------------------------------------------
SELECT TOP 1000
	*
FROM
	all_order_products_combined


------------------------------------------------
SELECT 
	COUNT(*) AS total_num_of_rows
FROM
	all_order_products_combined

-- 33,819,106 rows



-- TRIAL ------------------------------------------------------------------









-----------------------------------------------------------
-----------------------------------------------------------
-- DATA CLEANING
-- Data Manipulation Language (DML)
-----------------------------------------------------------
-----------------------------------------------------------


---------------------------------------------------------
-- CHECKING FOR DUPLICATE VALUES
---------------------------------------------------------

-- products TABLE
SELECT
	product_name,
	COUNT(*) AS total_num

FROM 
	products

GROUP BY 
	product_name
HAVING COUNT(product_name) > 1

/*
ANSWER: 101 DUPLICATE VALUES FOUND




Business Logic: Consider the business logic behind the data. 

They look like duplicate values on paper,
but they have their own unique primary keys, they might be a different variation of the product
and might have orders connected with them and their unique primary key and product_id

I did not delete these, as it will affect the order counts, item popularity and other metrics

Deleting these duplicates could potentially disrupt the integrity of the data and impact the analysis.

*/



/* 

Example: Bag of Oranges
1.) product_id = 4377
2.) product_id = 45231

*/

SELECT 
	*
FROM
	products AS p

LEFT JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

LEFT JOIN orders AS o
ON o.order_id = AOP.order_id

WHERE
	p.product_name = 'Bag of Oranges'







---------------------------------------------------------
-- CHECKING FOR NULL VALUES
---------------------------------------------------------

-- orders TABLE
SELECT
    COUNT(*) AS TOTAL_NUM_OF_RECORDS,
    COUNT(order_id) AS non_null_order_id,
    COUNT(user_id) AS non_null_user_id,
    COUNT(eval_set) AS non_null_eval_set,
    COUNT(order_number) AS non_null_order_number,
    COUNT(order_dow) AS non_null_order_dow,
    COUNT(order_hour_of_day) AS non_null_order_hour_of_day,
    COUNT(days_since_prior_order) AS non_null_days_since_prior_order
FROM 
    orders;

-- 206,209 NULL VALUES FOUND on "orders" TABLE and "days_since_prior_order" COLUMN


SELECT
	*
FROM
	orders
WHERE
	days_since_prior_order IS NULL

-- 206,209 null values CONFIRMED





-- orders TABLE
SELECT
    COUNT(*) AS TOTAL_NUM_OF_RECORDS
FROM 
    orders
WHERE
	order_number = 1

/*
Business Logic: Consider the business logic behind the data. 

This is normal
It can be seen that for every users 1st order (order_number = 1) 
the days_since_prior_order is NULL, which makes sense, since it's the very first order.

Therefore the NULL VALUES are valid.





Business Logic: Consider the business logic behind the data. 

The NULL VALUES are valid. 
Because they correspond to the first orders for each user, 
where there is no prior order to calculate the time since.

In this case, it's not necessary to replace these null values with "NA" or any other value, 
as they already hold a meaningful interpretation.

Keeping them as null values preserves the distinction between the first orders and subsequent orders.


We can also infer that there are 206,209 users/customers.

*/





---------------------------------------------------------
-- Leading and Trailing spaces using TRIM()?
---------------------------------------------------------

-------- aisles table - aisle_name
UPDATE aisles
SET aisle_name = TRIM(aisle_name);


-------- departments table - department
UPDATE departments
SET department = TRIM(department);


-------- products table - product_name
UPDATE products
SET product_name = TRIM(product_name);


--------- orders table - eval_set
UPDATE orders
SET eval_set = TRIM(eval_set);


/*
Find all string columns for TRIM()
I made sure that all string columns have no excessive spaces using TRIM() function.
*/









-----------------------------------------------------------
-----------------------------------------------------------
-- Data Query Language (DQL)
-----------------------------------------------------------
-----------------------------------------------------------

-- 1.) What are the most frequently ordered products? 

SELECT TOP 10
	p.product_name,
	COUNT(o.order_number) AS ORDER_COUNT

FROM
	products AS p

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders AS o
ON o.order_id = AOP.order_id

GROUP BY
	p.product_name
ORDER BY
	ORDER_COUNT DESC



/*

ANSWER:

product_name, ORDER_COUNT

Banana,	491291
Bag of Organic Bananas,	394930
Organic Strawberries,	275577
Organic Baby Spinach,	251705
Organic Hass Avocado,	220877
Organic Avocado,	184224
Large Lemon,	160792
Strawberries,	149445
Limes,	146660
Organic Whole Milk,	142813

*/














-- 2.) What are the least frequently ordered products?
SELECT TOP 10
	p.product_name,
	COUNT(o.order_number) AS ORDER_COUNT

FROM
	products AS p

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders AS o
ON o.order_id = AOP.order_id

GROUP BY
	product_name
ORDER BY
	ORDER_COUNT ASC


/*

ANSWER: 

(product_name, ORDER_COUNT)

'Swingtop' Premium Lager,	1
1 000 Mg Vitamin C Tangerine Grapefruit Effervescent Powdered Drink Mix,	1
11.3 Oz. Oreo Fudge Creme Double Chocolate,	1
12 Inch Taper Candle White,	1
7.04 Oz. Grahamfuls Banana Vanilla 8ct,	1
Aged Parmesan Cheese Sticks,	1
All Natural Stevia Liquid Extract Sweetener,	1
Anarchy For Her Daily Fragrance,	1
Anjou Pear Hand Soap,	1
Berry Sprouted Blend Cereal,	1

*/













-- 3.) Are there specific days of the week when orders are more frequent?

-- The days are anonymized, Day 0 could mean Sunday (or Monday if we go by ISO 8601)
SELECT
	order_dow,
	COUNT(order_number) AS ORDER_COUNT
FROM
	orders
GROUP BY
	order_dow
ORDER BY
	order_dow ASC

/*

ANSWER: 

(order_dow, ORDER_COUNT)
0	600905
1	587478
2	467260
3	436972
4	426339
5	453368
6	448761

*/












-- 4.) Are there specific hours of the day when orders are more frequent?

SELECT
	order_hour_of_day,
	COUNT(order_number) AS ORDER_COUNT
FROM
	orders
GROUP BY
	order_hour_of_day
ORDER BY
	order_hour_of_day ASC



/*

ANSWER: 

(order_hour_of_day, ORDER_COUNT)

0	22758
1	12398
2	7539
3	5474
4	5527
5	9569
6	30529
7	91868
8	178201
9	257812
10	288418
11	284728
12	272841
13	277999
14	283042
15	283639
16	272553
17	228795
18	182912
19	140569
20	104292
21	78109
22	61468
23	40043


*/













-- 5.) What are the most frequently REORDERED products?

SELECT TOP 10
    p.product_name,
    COUNT(AOP.product_id) AS REORDER_COUNT

FROM
    products AS p 

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders AS o
ON o.order_id = AOP.order_id

WHERE
    AOP.reordered = 1
GROUP BY
    p.product_name
ORDER BY
	REORDER_COUNT DESC


/*

ANSWER: 

(product_name, REORDER_COUNT)

Banana,	415166
Bag of Organic Bananas,	329275
Organic Strawberries,	214448
Organic Baby Spinach,	194939
Organic Hass Avocado,	176173
Organic Avocado,	140270
Organic Whole Milk,	118684
Large Lemon,	112178
Organic Raspberries,	109688
Strawberries,	104588


Organic fruits like Banana, Strawberries, and Avocados are frequently reordered
Milk is also frequently reordered.

These are the products that customer tend to stick with over time.


*/













-- 6.) Which products were never ordered / reordered?

SELECT 
	p.product_name,
	COUNT(o.order_id) AS ORDER_COUNT
FROM
	products AS p

LEFT JOIN all_order_products_combined AS AOP 
ON AOP.product_id = p.product_id

LEFT JOIN orders AS o 
ON o.order_id = AOP.order_id

GROUP BY
	p.product_name
HAVING
	COUNT(o.order_id) = 0


/*

ANSWER: 

(product_name, ORDER_COUNT)

Protein Granola Apple Crisp	0
Single Barrel Kentucky Straight Bourbon Whiskey	0
Unpeeled Apricot Halves in Heavy Syrup	0




We used LEFT JOIN to include all products even if there are no corresponding orders.
We used GROUP BY p.product_name to count the orders for each product.
We used HAVING clause to filter out products that have a count of orders equal to 0, meaning they were never ordered or reordered.


*/









-- TRIAL -------------------------------------------------------------------

SELECT 
	--*
	p.product_name,
	COUNT(o.order_number) AS ORDER_COUNT

FROM
	products AS p

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders AS o
ON o.order_id = AOP.order_id

GROUP BY
	p.product_name
HAVING
      o.order_number = 0

-- TRIAL -------------------------------------------------------------------







-- 7.) What aisles are the most popular? (by order count)

SELECT TOP 20
	a.aisle_name,
	COUNT(o.order_number) AS ORDER_COUNT

FROM 
	aisles AS a

JOIN products AS p
ON a.aisle_id = p.aisle_id

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders as o
ON o.order_id = AOP.order_id

GROUP BY
	a.aisle_name
ORDER BY
	ORDER_COUNT DESC



/*

ANSWER: 

(aisle_name, ORDER_COUNT)

fresh fruits,	3792661
fresh vegetables,	3568630
packaged vegetables fruits,	1843806
yogurt,	1507583
packaged cheese,	1021462
milk,	923659
water seltzer sparkling water,	878150
chips pretzels,	753739
soy lactosefree,	664493
bread,	608469
refrigerated,	599109
frozen produce,	545107
ice cream ice,	521101
crackers,	478430
energy granola bars,	473835
eggs,	472009
lunch meat,	412087
frozen meals,	408520
baby food formula,	395654
fresh herbs,	393793

*/



-- Using the ERD makes it easier to visualize what tables we need and what PATH we need to take



-- TRIAL AND ERROR -----------------------------------------------------
SELECT TOP 20
	--*
	--DISTINCT a.aisle_name AS DISTINCT_aisle_name
	a.aisle_name,
	--o.order_number,
	COUNT(o.order_number) AS COUNT_of_order_number

FROM
	aisles AS a

JOIN products AS p
ON a.aisle_id = p.aisle_id

JOIN order_products__prior as op_p
ON op_p.product_id = p.product_id

JOIN orders as o
ON o.order_id = op_p.order_id

GROUP BY
	a.aisle_name
	--o.order_number
ORDER BY
	count_of_order_number DESC
-- TRIAL AND ERROR -----------------------------------------------------






-- 8.) What departments are the most popular? (by order count)

SELECT
	d.department,
	COUNT(o.order_number) AS ORDER_COUNT

FROM
	departments AS d

JOIN products AS p
ON d.department_id = p.department_id

JOIN all_order_products_combined AS AOP
ON AOP.product_id = p.product_id

JOIN orders as o
ON o.order_id = AOP.order_id

GROUP BY
	d.department
ORDER BY
	ORDER_COUNT DESC



/*

ANSWER: 

(department, ORDER_COUNT)

produce,	9888378
dairy eggs,	5631067
snacks,	3006412
beverages,	2804175
frozen,	2336858
pantry,	1956819
bakery,	1225181
canned goods,	1114857
deli,	1095540
dry goods pasta,	905340
household,	774652
meat seafood,	739238
breakfast,	739069
personal care,	468693
babies	438743
international	281155
alcohol	159294
pets	102221
missing	77396
other	38086
bulk	35932


*/










-- 9.) When do customers usually reorder? 

SELECT
	days_since_prior_order,
	COUNT(order_number) AS ORDER_COUNT

FROM
	orders
GROUP BY
	days_since_prior_order

ORDER BY
	days_since_prior_order ASC

/*

ANSWERS:

(days_since_prior_order, ORDER_COUNT)

NULL	206209
0	67755
1	145247
2	193206
3	217005
4	221696
5	214503
6	240013
7	320608
8	181717
9	118188
10	95186
11	80970
12	76146
13	83214
14	100230
15	66579
16	46941
17	39245
18	35881
19	34384
20	38527
21	45470
22	32012
23	23885
24	20712
25	19234
26	19016
27	22013
28	26777
29	19191
30	369323


(LIMITATIONS: days_since_prior_order is capped at 30)

Users/customers tend to order the most after 7 days or 30 days.
Most customers buy groceries either Weekly or Monthly.

*/






-- END