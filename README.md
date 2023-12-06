# Restaurant order analysis
Analyze order data to identify the most and least popular menu items and types of cuisine

## Table of contents

1. [Project overview](#Project-overview)
2. [Data sources](#Data-sources)
3. [Tools used](#Tools-used)
4. [Data cleaning / preparation](#Data-cleaning-/-preparation)
5. [Exploratory Data Analysis](#Exploratory-Data-Analysis)
6. [Data analysis](#Data-analysis)
7. [Results / Findings](#Results-/-Findings)
8. [References](#References)

### Project overview

This data analysis project aims to provide insights into the sales performance of an international Restaurant. By analyzing various aspects of the sales data, we seek to identify trends, make data-driven recommendations, and gain a deeper understanding of the company's performance.

### Data sources

**Item data**: The primary dataset used for this analysis is the Menu_item file, containing detailed information about each Menu made by the company.

**Order details data**: The primary dataset used for this analysis is the Order_details file, containing detailed information about each orders obtained by the company.

### Tools used

- MySQL - For ETL and EDA.
  
### Data cleaning / preparation

In the initial data preparation phase, we performed the following tasks:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.

### Exploratory Data Analysis

EDA involved exploring the sales data to answer key questions, such as:

1. Find the number of items on the menu.
2. What are the least and most expensive item on the menu ?
3. How many italian dishes are on the menu ?
4. What are the least and most expensive italian dishes on the menu ?
5. How many dishes are in each category ?
6. What is the average dish price within each category ?
---
1. What is the date range of the table ?
2. How many orders where made within this date range ?
3. How many items where ordered within this date range ?
4. Which orders had the most number of items ?
5. How many orders had more than 12 items ?


**Combine the menu_items table and order_details table into a single table**

1. What were the least and most ordered items ? What categories where they in ?
2. What were the top 5 orders that spent the most money ?
3. View the details of the highest spent order. What insights can you gather from them ?
4. View the details of top 5 highest spent orders. What insights can you gather from them ?

### Data analysis


1. View the menu_items table.
```SQL
SELECT *
FROM menu_items;
```

2. Find the number of items on the menu

```SQL
SELECT COUNT(*)
FROM menu_items;
```

3. What are the least and most expensive item on the menu ?

```SQL
SELECT *
FROM menu_items
ORDER BY price;
```

```SQL
SELECT *
FROM menu_items
ORDER BY price DESC;
```

4. How many italian dishes are on the menu ?

```SQL
SELECT COUNT(*)
FROM menu_items
WHERE category = 'italian';
```

5. What are the least and most expensive italian dishes on the menu ?

```SQL
SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price;
```

```SQL
SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price DESC;
```

6. How many dishes are in each category ?

```SQL
SELECT category, COUNT(*)
FROM menu_items
GROUP BY category;
```

7. What is the average dish price within each category ?

```SQL
SELECT category, AVG(price)
FROM menu_items
GROUP BY category;
```
---

1. View order_details table.

```SQL
SELECT *
FROM order_details;
```

2. What is the date range of the table ?

```SQL
SELECT MIN(order_date), max(order_date)
FROM order_details;
```

3. How many orders where made within this date range ?

```SQL
SELECT COUNT(DISTINCT order_id)
FROM order_details;
```
4. How many items where ordered within this date range ?

```SQL
SELECT COUNT(*)
FROM order_details;
```
5. Which orders had the most number of items ?

```SQL
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
```
6. How many orders had more than 12 items ?

```SQL
SELECT COUNT(*)
FROM (SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;
```
---

1. Combine the menu_items table and order_details table into a single table.

```SQL
SELECT * FROM menu_items;
SELECT * FROM order_details;
```
```SQL
SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;
```

2. What were the least and most ordered items ? What categories where they in ?

```SQL
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
```

3. What were the top 5 orders that spent the most money ?

```SQL
SELECT order_id, SUM(price) AS total_spent
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5 ;
```

4. View the details of the highest spent order. What insights can you gather from them ?

```SQL
SELECT *
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440 ;
```

5. View the details of top 5 highest spent orders. What insights can you gather from them ?

```SQL
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675 )
GROUP BY order_id, category;
```

### Results / Findings

The analysis results are summarized as follows:
1. The most and least expensive item in the Restaurant is Shrim scrampi (Italian) & Edamame (Asian).
2. The most and least ordered items are American Hamburger & Mexican Chicken Tacos.

### References

Maven Analytics.
   
