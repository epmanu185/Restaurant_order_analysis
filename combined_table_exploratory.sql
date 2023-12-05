-- 1. Combine the menu_items table and order_details table into a single table.

SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items ? What categories where they in ?

SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- 3. What were the top 5 orders that spent the most money ?

SELECT order_id, SUM(price) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5 ;

-- 4. View the details of the highest spent order. What insights can you gather from them ?

SELECT *
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440 ;

-- 5. View the details of top 5 highest spent orders. What insights can you gather from them ?

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675 )
GROUP BY order_id, category;