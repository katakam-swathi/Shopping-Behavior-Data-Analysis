CREATE TABLE shopping_data (
    customer_id SERIAL PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(50),
    category VARCHAR(50),
    purchase_amount_usd DECIMAL(10,2),
    location VARCHAR(50),
    size VARCHAR(20),
    color VARCHAR(30),
    season VARCHAR(30),
    review_rating DECIMAL(2,1),
    subscription_status VARCHAR(30),
    shipping_type VARCHAR(30),
    discount_applied VARCHAR(10),
    promo_code_used VARCHAR(10),
    previous_purchases INT,
    payment_method VARCHAR(30),
    frequency_of_purchases VARCHAR(30)
);

SELECT * FROM shopping_data;


1.What is the total revenue (sales amount) generated?

SELECT 
	SUM(purchase_amount_usd) AS Sales_Amount
FROM shopping_data;

2.How many unique customers made purchases?

SELECT COUNT(DISTINCT "customer_id") AS unique 
FROM "shopping_data";

3.What is the average purchase value?

SELECT ROUND(AVG(purchase_amount_usd),2) AS Avg_Purchase
FROM shopping_data;

4.Which category has the highest number of sales?

SELECT category,SUM(purchase_amount_usd) AS sum
FROM shopping_data
GROUP BY category
ORDER BY sum DESC;

5.What is the total number of transactions made by gender?

SELECT COUNT(purchase_amount_usd),gender
FROM shopping_data
GROUP BY gender;


6.Which payment method is most used by customers?

SELECT payment_method,SUM(purchase_amount_usd) AS total_sales
FROM shopping_data
Group by payment_method
ORDER BY total_sales DESC
LIMIT 1;

7.Which city has the highest total sales?

SELECT location AS city,SUM(purchase_amount_usd) AS Total_sales
FROM shopping_data
GROUP BY city
ORDER BY Total_sales DESC
LIMIT 1;


8.What is the age group distribution of customers?

SELECT 
	CASE
		WHEN "age" BETWEEN 18 AND 25 THEN '18-25'
		WHEN "age" BETWEEN 26 AND 35 THEN '26-35'
		WHEN "age" BETWEEN 36 AND 45 THEN '36-45'
		WHEN "age" BETWEEN 46 AND 55 THEN '46-55'
		WHEN "age" BETWEEN 56 AND 65 THEN '55-65'
        ELSE '65+'
	END AS Age_Group,
	COUNT(*) AS total_Customers
	FROM shopping_data
	GROUP BY Age_Group
	ORDER BY Age_Group;

9.What is the Seasonal sales trend over time?

SELECT season,Sum(purchase_amount_usd) AS total_sales
FROM shopping_data
GROUP BY season
ORDER BY total_sales DESC;

10.Which Season has the highest sales volume?

SELECT
	season,
	COUNT(*) AS sales_volume
FROM shopping_data
GROUP BY season
ORDER BY sales_volume DESC
LIMIT 1;

11.Compare average spending between male and female customers.

SELECT 
	gender,ROUND(AVG(purchase_amount_usd),2) AS Avg_Spending
FROM shopping_data
GROUP BY gender;


12.Compare sales performance between categories.

(
SELECT item_purchased,
SUM(purchase_amount_usd) AS Total_sales,
'Highest' AS position
FROM shopping_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
)
UNION ALL
(
SELECT item_purchased,
SUM(purchase_amount_usd) AS Total_sales,
'Lowest' AS position
FROM shopping_data
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1
);

13.Which category do younger vs. older customers prefer most?

WITH age_groups AS(
SELECT
	category,
	CASE
		WHEN age BETWEEN 18 AND 40 THEN 'Younger'
		ElSE 'Older'
	END as age_group,
	COUNT(*) AS total_customers
FROM shopping_data
GROUP BY category,age_group
)
(
SELECT *
FROM age_groups
WHERE age_group = 'Younger'
ORDER BY total_customers DESC
LIMIT 1
)
UNION ALL
(
SELECT *
FROM age_groups
WHERE age_group = 'Older'
ORDER BY total_customers DESC
LIMIT 1
);
		
14.Which city has the highest average order value per customer?


SELECT location AS city,
ROUND(AVG(purchase_amount_usd),2) AS Avg_ordervalue
FROM shopping_data
GROUP BY city
ORDER BY Avg_ordervalue DESC
LIMIT 1;


15.Which payment method brings in the most revenue?

SELECT 
	payment_method,
	SUM(purchase_amount_usd) AS total_sales
FROM shopping_data
GROUP BY payment_method
ORDER BY total_sales DESC
LIMIT 1;

16.Which customers are your top 10 spenders?

SELECT
	customer_id,
	SUM(purchase_amount_usd) AS total_spent
FROM shopping_data
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


17.What percentage of total sales come from the top 20% customers (Pareto analysis)?

WITH customers_sales AS(
SELECT
	customer_id,
	SUM(purchase_amount_usd) AS total_spent
FROM shopping_data
GROUP  BY customer_id
),
Ranked AS(
SELECT 
	customer_id,
	total_spent,
	NTILE(5) OVER(ORDER BY total_spent DESC)  AS Spending_group
FROM customers_sales
),
total AS(
SELECT
	SUM(total_spent) AS Overall_sales,
	SUM(CASE WHEN spending_group = 1 THEN total_spent ELSE 0 END)AS TOP_20_sales
	FROM Ranked
)
SELECT 
 ROUND((TOP_20_sales/Overall_sales)*100,2) AS top_20_percentage_contribution
FROM total
		

18.What is the correlation between age and spending amount?

SELECT 
CORR(age,purchase_amount_usd)AS age_spending_correlation
FROM shopping_data;


19.Which category performs best among each gender?

WITH performs AS(
SELECT 
	category,
	gender,
	SUM(purchase_amount_usd) AS total_spent
FROM shopping_data
GROUP BY 1,2
)
(
SELECT *
FROM performs
WHERE gender = 'Male'
ORDER BY total_spent DESC
LIMIT 1
)
UNION ALL
(
SELECT *
FROM performs
WHERE gender = 'Female'
ORDER BY total_spent DESC
LIMIT 1
)

20.Which cities contribute most to each category’s revenue?

SELECT city,category,total_revenue
FROM(
SELECT
	location AS city,
	category,
	SUM(purchase_amount_usd) AS total_revenue,
    RANK() OVER (PARTITION BY category ORDER BY SUM(purchase_amount_usd) DESC) AS rank_in_category
FROM shopping_data
GROUP BY city,category
) AS ranked_data
WHERE rank_in_category = 1
ORDER BY total_revenue DESC;

21.Is there any seasonal pattern in customer shopping? (e.g., festive spikes)

SELECT
    season,
    COUNT(*) AS total_orders,
    SUM(purchase_amount_usd) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_order_value
FROM shopping_data
GROUP BY season
ORDER BY total_revenue DESC;

22.Identify the least-performing category — how can it be improved?

SELECT
	category,
	SUM(purchase_amount_usd) AS total_revenue,
	COUNT(*) AS total_orders,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM shopping_data
Group by category
Order by total_revenue
LIMIT 1;
