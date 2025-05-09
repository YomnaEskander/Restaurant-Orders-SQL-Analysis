-- 1. View the order_details table.
SELECT * FROM order_details;

-- 2. What is the date range of the table?
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) AS orders_number FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(item_id) FROM order_details;

-- 5. Which orders had the most number of items? look for every order how many items where there
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details  -- Whatever is put in the GROUP BY has to be in the SELECT
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 5;         -- I used GROUP BY bec I wanna know for each order how many items where there 

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) FROM  -- COUNT The number of rows in the sub query 
(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details  -- Whatever is put in the GROUP BY has to be in the SELECT
GROUP BY order_id   -- HAVING Clause allows me to filter the aggregations from the group by
HAVING num_items > 12) AS num_orders;  -- I have made a sub query that gives me all the orders that have more than 12 items
