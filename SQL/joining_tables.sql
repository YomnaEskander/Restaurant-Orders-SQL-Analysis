-- 1. Combine the meun_items and order_details tables into a single table.  
SELECT *
FROM order_details od -- when joining, the first thing we want to list is the transactions table and od is the alias. 
LEFT JOIN menu_items mi ON od.item_id = mi.menu_item_id; -- Choose a left join bec menu_item table doesnt have info needed on transactions
-- we choose a left join because we wanted to keep all info from the order details first transaction table then look up table 

-- 2. What were the least and most ordered items? What Categories were they in? for each item, how manu times was it ordered?
SELECT item_name, COUNT(order_details_id) AS num_purchase, category
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchase DESC; -- Hamburger most ordered item and it was American food  

SELECT item_name, COUNT(order_details_id) AS num_purchase, category
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY item_name, category  
ORDER BY num_purchase; -- Chicken Tacos most ordered and it was a mexican food 

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS Order_Total_Price
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY SUM(price) DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather from the order?
SELECT category, COUNT(item_id) AS num_item
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category; -- highest spend order bought alot of italian food 

-- 5. View the details of the top 5 highest spend orders. What insights can you gather from
SELECT order_id, category, COUNT(item_id) AS num_item
FROM order_details od LEFT JOIN menu_items mi 
	 ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;  -- the 5 most spend orders seem to like italian food; keep the expensive italian food