# Project Scenario

## Project Title: Retail Sales Analysis and Insights

# Scenario

I am a junior data analyst currently employed by a big retail firm. The business has organized outlets and seeks to know the determinants that affect the sales outcomes within the stores. My manager at the company is Anil Halder who has assigned me with the filtering and interpreting of sales data to be able to get general information about sales and basic strategy for bettering the performance of the stores.

# Objectives

1. **Sales Performance Analysis:**
- Examine the weekly sales reports for the purpose of analysis and looking for trends and patterns.
- Another area to predict is how holidays affect the sales performance.
- Distinguish the performance of stores in terms of sales depending on store type and size.

2. **External Factors Analysis:**
   - Understand how external variables like temperature, fuel prices, CPI index and unemployment rate impacts of on sales.
   - Identify correlations between these external factors and sales performance.

3. **Optimization Insights:**
   - To offer practical recommendations to enhance store performance and help to increase the sales rate.
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

**Holiday Impact:** There are more sales at holidays. To build on this, it is recommended that the company should come up with special promos and marketing strategies during the holidays.

**Store Type and Size:** The analysis also shows that type A stores with a larger area of space have a greater turnout. There might be an opportunity to increase capital expenditure in the enlargement of the smaller stores.

**External Factors:** From the above results, it was established that there is a direct relationship between the amount of sales and low fuel prices and high temperatures. It is possible to recommend the farther flexibility of marketing activities concerning the tendencies of fuel price changes and the weather conditions of a specific season.

**Optimization Strategies:** Sales can be improve  during non-holiday periods by introducing loyalty programs, discounts, and special events could drive overall sales growth.
___
