# Project Scenario

## Project Title: Retail Sales Analysis and Insights

# Scenario

I am a junior data analyst working at a large retail company. The company operates multiple stores and is interested in understanding the factors that influence sales performance. My manager, Anil Halder, has tasked me with analyzing the sales data to derive insights that can help improve overall sales and optimize store operations.

# Objectives

1. **Sales Performance Analysis:**
   - Analyze weekly sales data to identify trends and patterns.
   - Determine the impact of holidays on sales performance.
   - Compare sales performance across different store types and sizes.

2. **External Factors Analysis:**
   - Examine how external factors such as temperature, fuel prices, CPI, and unemployment rate affect sales.
   - Identify correlations between these external factors and sales performance.

3. **Optimization Insights:**
   - Provide actionable insights to optimize store operations and increase sales.
   - Recommend strategies to improve sales during non-holiday periods.
___
## Retail Sales Analysis 
___
-- Total Weekly Sales by Store:
```sql
SELECT store, 
Round(SUM(weekly_sales), 2) AS total_sales
FROM sales_data
GROUP BY store;
```
-- Average Weekly Sales During Holidays vs. Non-Holidays:
```sql
SELECT isholiday, AVG(weekly_sales) AS average_sales
FROM sales_data
GROUP BY isholiday;
```
-- Impact of Temperature on Sales:
```sql
SELECT f.temperature, Round(AVG(s.weekly_sales), 2) AS average_sales
     FROM sales_data s
     JOIN features_data f ON s.store = f.store AND s.date = f.date
     GROUP BY f.temperature;
```
-- Impact of Fuel price on Sales:
```sql
SELECT f.fuel_price, Round(AVG(s.weekly_sales), 2) AS average_sales
     FROM sales_data s
     JOIN features_data f ON s.store = f.store AND s.date = f.date
     GROUP BY f.fuel_price;
```

-- Sales Performance by Store Type:
```sql
SELECT st.type, Round(AVG(s.weekly_sales), 2) AS average_sales
FROM sales_data s
JOIN stores_data st ON s.store = st.store
GROUP BY st.type;
```
___

[Visualization using Tableau](https://public.tableau.com/views/RetailStoreSalesAnalysis_17208758732890/RetailStoreSalesAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
___

# Conclusion

Based on my findings, I might conclude that:

**Holiday Impact:** Sales significantly increase during holidays. To capitalize on this, the company should consider special promotions and marketing campaigns around holidays.

**Store Type and Size:** Larger stores (type A) tend to have higher sales. Investment in expanding smaller stores could be beneficial.

**External Factors:** Sales are positively correlated with lower fuel prices and higher temperatures. Marketing efforts could be adjusted based on fuel price trends and seasonal weather patterns.

**Optimization Strategies:** Focusing on improving sales during non-holiday periods by introducing loyalty programs, discounts, and special events could drive overall sales growth.
___
