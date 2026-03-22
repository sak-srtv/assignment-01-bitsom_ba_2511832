-- 1.3 : SQL QUERIES
-- --------------------


-- Q1: List all customers from Mumbai along with their total order value

SELECT customer_id ,customer_name, customer_email, customer_city,
SUM(unit_price * quantity) AS total_order_value 
FROM orders_flat 
WHERE customer_city='Mumbai' 
GROUP BY customer_id, customer_name, customer_email, customer_city;


-- Q2: Find the top 3 products by total quantity sold

SELECT product_id, product_name, SUM(quantity) AS total_quantity_sold 
from orders_flat GROUP BY product_id, product_name 
ORDER BY total_quantity_sold DESC LIMIT 3;


-- Q3: List all sales representatives and the number of unique customers they have handled

SELECT sales_rep_id, sales_rep_name, 
COUNT(distinct customer_id) 
AS unique_customers_handled
FROM orders_flat
GROUP BY sales_rep_id, sales_rep_name;


-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending

SELECT order_id , (unit_price * quantity) AS total_value FROM orders_flat 
HAVING total_value>'10000'
ORDER BY total_value DESC;


-- Q5: Identify any products that have never been ordered

SELECT DISTINCT product_id, product_name
FROM orders_flat
WHERE product_id NOT IN (SELECT product_id FROM orders_flat);