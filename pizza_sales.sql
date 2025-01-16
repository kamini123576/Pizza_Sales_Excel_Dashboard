create database pizza_orders;
use pizza_orders;
select * from pizza_sales;

# Q1 Total Prize of all the orders 
select sum(total_price) as Total_Revenue from pizza_sales;

# Q2 Average Order Value
select sum(total_price)/count(distinct order_id) as Average_order_value from pizza_sales;

# Q3 Find the Total Pizza Sold
select sum(quantity) as Total_Pizza_Sold from pizza_sales;

# Q4 Total Orders Placed 
select count(distinct order_id) from pizza_sales;

# Q5 Average Pizza Per Order
select round(sum(quantity)/count(distinct order_id),2) as Average_Pizza_Order from pizza_sales
;

# Q6 Daily Trend for Total Orders 
# Daily Trend
select dayname(str_to_date(order_date,'%Y-%m-%d')) as Week_Days, count(distinct order_id) 
as Total_Orders from pizza_sales
group by dayname(str_to_date(order_date,'%Y-%m-%d'))
order by 2 desc;

# Hourly Trend
select hour(order_time) as order_hours, count(distinct order_id)
from pizza_sales
group by 1
order by 2 desc;

# Q7 Percentage of Sales by Pizza Category
select pizza_category, round(sum(total_price),2) as total_sales,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) 
as Total_Sales_Per_Category
from pizza_sales
-- where month(str_to_date(order_date,'%Y-%m-%d')) = 1
group by pizza_category
order by 2;

# Q8 Percentage of Sales by Pizza Size?
select pizza_size, round(sum(total_price),2) as total_sales,
round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2) 
as Total_Sales_Per_Category
from pizza_sales 
-- where quarter(str_to_date(order_date,'%Y-%m-%d')) = 1
group by 1
order by 2;

# Q9 Total Pizza Sold by Pizza Category?
 select pizza_category, sum(quantity) as Total_Pizza_sold
 from pizza_sales
 group by 1 
 order by 2;
 
 # Q10 Top 5 Best Seller with the Total Pizza Sold?
 select pizza_name, sum(quantity) as Total_sales from pizza_sales
group by pizza_name
order by 2 desc
limit 5 ;

 # Q10 Bottom 5 Best Seller with the Total Pizza Sold?
 select pizza_name, sum(quantity) as Total_sales from pizza_sales
group by pizza_name
order by 2 
limit 5 ;


