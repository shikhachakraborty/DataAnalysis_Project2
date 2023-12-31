#1. Calculate Total revenue

select sum(total_price) as Total_Revenue
from pizza;

#2. Calculate the average order Value

select sum(total_price) / count(distinct order_id) as average_order_value
from pizza;

#3. Calculate Total Pizzas sold

select sum(quantity) as Total_Pizza_Sold 
from pizza;

#4. Calculate Total Orders

select count(distinct order_id) as Total_Orders 
from pizza;

#5. Calculate Average Pizza per order

select round(sum(quantity) / count(distinct order_id),2) as Average_Pizza_per_order 
from pizza;

#6. Calculate Daily trend for Total orders

select dayname(order_date), count(distinct order_id) as Order_Count
from pizza
group by dayname(order_date)
order by count(distinct order_id) desc;

#7. Hourly Trend for Total Order

select hour(order_time) as Hours, count(distinct order_id) as Order_count
from pizza
group by hour(order_time)
order by count(distinct order_id) desc;

#8. % of Sales by Pizza Category

select pizza_category, round(sum(total_price),2) as Sales_Amt, round(sum(total_price) * 100 / (select sum(total_price) from pizza),2) as "%_Sales"
from pizza
group by pizza_category
order by sum(total_price) * 100 / (select sum(total_price) from pizza) desc;

#9. % of Sales by Pizza Category for January month

select pizza_category, round(sum(total_price),2) as Sales_Amt, round(sum(total_price) * 100 / 
(select sum(total_price) from pizza where month(order_date) = "01"),2) as "%_Sales"
from pizza
where month(order_date) = "01"
group by pizza_category
order by sum(total_price) * 100 / (select sum(total_price) from pizza) desc;

#10. % of Sales by Pizza Size 

select pizza_size, round(sum(total_price),2) as Sales_Amt, round(sum(total_price) * 100 / 
(select sum(total_price) from pizza),2) as "%_Sales"
from pizza
group by pizza_size
order by pizza_size desc;

#11. Total pizza sold by pizza category

select pizza_category, sum(quantity) as Total_Pizza_sold
from pizza
group by pizza_category;

#12. Top 5 Best sellers by Total Pizzas sold

select pizza_name, sum(quantity) as Qty_sale
from pizza
group by pizza_name
order by sum(quantity) desc limit 5;

#13. Bottom 5 Worst sellers by Total Pizzas sold

select pizza_name, sum(quantity) as Qty_sale
from pizza
group by pizza_name
order by sum(quantity) asc limit 5;

#14. Bottom 5 Worst sellers by Total Pizzas sold in the month of January

select pizza_name, sum(quantity) as Qty_sale
from pizza
where month(order_date) = 01
group by pizza_name
order by sum(quantity) asc limit 5;
