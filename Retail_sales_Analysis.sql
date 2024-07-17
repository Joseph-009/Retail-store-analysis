


use retail_sales_analysis;

show variables like "secure_file_priv";

    # Importing data method_3
           load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.1\\Uploads\\Retail Dataset\\sales data-set.csv' into table sales_data
fields terminated by ','
enclosed by '"'  
lines terminated by '\r\n'
ignore 1 lines;


# Total Weekly Sales by Store:
SELECT store, 
Round(SUM(weekly_sales), 2) AS total_sales
FROM sales_data
GROUP BY store;

# Average Weekly Sales During Holidays vs. Non-Holidays:
SELECT isholiday, AVG(weekly_sales) AS average_sales
FROM sales_data
GROUP BY isholiday;

# Impact of Temperature on Sales:
SELECT f.temperature, Round(AVG(s.weekly_sales), 2) AS average_sales
     FROM sales_data s
     JOIN features_data f ON s.store = f.store AND s.date = f.date
     GROUP BY f.temperature;


# Impact of Fuel price on Sales:
SELECT f.fuel_price, Round(AVG(s.weekly_sales), 2) AS average_sales
     FROM sales_data s
     JOIN features_data f ON s.store = f.store AND s.date = f.date
     GROUP BY f.fuel_price;

# Sales Performance by Store Type:
SELECT st.type, Round(AVG(s.weekly_sales), 2) AS average_sales
FROM sales_data s
JOIN stores_data st ON s.store = st.store
GROUP BY st.type;











