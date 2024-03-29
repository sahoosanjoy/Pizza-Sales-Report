SELECT* FROM pizza_sales
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
SELECT (SUM(total_price)/COUNT(DISTINCT order_id))AS Avg_order_value FROM pizza_sales
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2))AS DECIMAL(10,2))AS Avg_pizzas_per_order FROM pizza_sales
SELECT DATENAME(DW,order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_orders DESC
SELECT pizza_category,SUM(total_price) AS Total_sales,SUM(total_price)* 100/ (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date)=1)AS PCT from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales,CAST(SUM(total_price)* 100/ (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER,order_date)=1)AS DECIMAL(10,2))AS PCT from pizza_sales
WHERE DATEPART(QUARTER,order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC
SELECT pizza_category,SUM(quantity) AS Total_quantity_sold FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category
ORDER BY Total_quantity_sold DESC
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC
SELECT DATEPART(HOUR, order_time) AS order_hours, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)
