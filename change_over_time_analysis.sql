-- Change-Over-Time - Analyizes how a measure evolves over time. Helps track trends and identify seasonality in your data.

SELECT
	YEAR(order_date) AS order_year,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

SELECT
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date)

SELECT
	DATETRUNC(month, order_date) AS order_date,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date)

SELECT
	DATETRUNC(year, order_date) AS order_date,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
ORDER BY DATETRUNC(year, order_date)

SELECT
FORMAT(order_date, 'yyy-MMM') AS order_date,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) AS total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyy-MMM')
ORDER BY FORMAT(order_date, 'yyy-MMM') 
