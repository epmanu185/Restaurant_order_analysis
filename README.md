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
8. [Recommendations](#Recommendations)
9. [Limitations](#Limitations)
10. [References](#References)

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
```SELECT *
FROM menu_items;```

2. Find the number of items on the menu

```SELECT COUNT(*)
FROM menu_items;```

3. What are the least and most expensive item on the menu ?

```SELECT *
FROM menu_items
ORDER BY price;```

```SELECT *
FROM menu_items
ORDER BY price DESC;```

4. How many italian dishes are on the menu ?

```SELECT COUNT(*)
FROM menu_items
WHERE category = 'italian';```

5. What are the least and most expensive italian dishes on the menu ?

```SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price;```

```SELECT *
FROM menu_items
WHERE category = 'italian'
ORDER BY price DESC;```

6. How many dishes are in each category ?

```SELECT category, COUNT(*)
FROM menu_items
GROUP BY category;```

7. What is the average dish price within each category ?

```SELECT category, AVG(price)
FROM menu_items
GROUP BY category;```

### Results / Findings

The analysis results are summarized as follows:
1. The company's sales have been steadily increasing over the past year, with a noticeable peak during the holiday season.
2. Product Category A is the best-performing category in terms of sales and revenue.
3. Customer segments with high lifetime value (LTV) should be targeted for marketing efforts.

### Recommendations

Based on the analysis, we recommend the following actions:
• Invest in marketing and promotions during peak sales seasons to maximize revenue.
• Focus on expanding and promoting products in Category A.
• Implement a customer segmentation strategy to target high-LTV customers effectively.

### Limitations

I had to remove all zero values from budget and revenue columns because they would have affected the accuracy of my conclusions from the analysis. There are still a few outliers even after the omissions but even then we can still see that there is a positive correlation between both budget and number of votes with revenue. 

### References

1. SQL for business by Werty.
2. [kaggle](https//:kaggle.com)
   
