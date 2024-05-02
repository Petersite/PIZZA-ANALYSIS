DROP TABLE Pizza_sales

CREATE TABLE Pizza_sales(
pizza_id INT,
order_id INT,	
pizza_name_id VARCHAR(50),
quantity	INT,
order_date	DATE,
order_time	TIME,
unit_price	NUMERIC,
total_price	NUMERIC,
pizza_size	VARCHAR(50),
pizza_category	VARCHAR(50),
pizza_ingredients VARCHAR(250),
pizza_name VARCHAR )




select * from pizza_sales


/* Total Revenue */
select sum(total_price) total_revenue from pizza_sales


/* Average Order Value */

SELECT round(SUM(total_price) / COUNT(DISTINCT order_id)) average_order_value
FROM pizza_sales;


/* Total Pizza Sold */
select sum(quantity) pizza_count from pizza_sales


/* Total Orders */
select count (distinct order_id) total_order_id from pizza_sales

/* average pizza per order */
select sum(quantity)/count(distinct order_id) from pizza_sales


select extract('week' from order_date) order_date from pizza_sales
SELECT extract('YEAR' from order_date) order_date from pizza_sales
select extract('DAY' from order_date) order_date from pizza_sales

SELECT TO_CHAR(order_date, 'MONTH') FROM pizza_sales


--To get daily trends of order date
SELECT TO_CHAR(order_date, 'DAY') day_name, COUNT(ORDER_ID) total_order FROM pizza_sales
group by to_char(order_date, 'DAY')
ORDER BY COUNT(ORDER_ID) DESC

--To get monthly trends of order date
SELECT TO_CHAR(order_date, 'month') month_name, COUNT(ORDER_ID) total_order FROM pizza_sales
group by to_char(order_date, 'month')
ORDER BY COUNT(ORDER_ID) DESC


-- which pizza category has the highest revenue
select sum(total_price) highest_revenue, pizza_category
from pizza_sales
group by  pizza_category
order by sum(total_price) desc
limit 1

select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100/(select sum(total_price) from pizza_sales) as decimal(10,2))
as percentage 
from pizza_sales
group by pizza_category

select pizza_category, sum(total_price) * 100/ (select sum(total_price) from pizza_sales) 
from pizza_sales 
group by pizza_category

--21/12/2023

/* % of sales by pizza size */

select pizza_size, sum(total_price) as "total_revenue",
sum(total_price) * 100/(select sum(total_price) from pizza_sales) as percentage
from pizza_sales
group by pizza_size
order by percentage

/* total pizza sold by category */

select pizza_category, sum(quantity) as "total quantity sold"
from pizza_sales
group by pizza_category
order by sum(quantity)


/* top 5 pizza by  revenue*/

select pizza_name, sum(total_price) as "total revenue"
from pizza_sales
group by pizza_name
order by "total revenue" desc
limit  5

/* bottom 5 pizza by  revenue*/
select pizza_name, sum(total_price) as "total revenue"
from pizza_sales
group by pizza_name
order by "total revenue" asc
limit  5

/* % of sales by pizza size */

select pizza_size, sum(total_price) as "total_revenue",
sum(total_price) * 100/(select sum(total_price) from pizza_sales) as percentage
from pizza_sales
group by pizza_size
order by percentage

/* total pizza sold by category */

select pizza_category, sum(quantity) as "total quantity sold"
from pizza_sales
group by pizza_category
order by sum(quantity)


/* top 5 pizza by  revenue*/

select pizza_name, sum(total_price) as "total revenue"
from pizza_sales
group by pizza_name
order by "total revenue" desc
limit  5

/* bottom 5 pizza by  revenue*/
select pizza_name, sum(total_price) as "total revenue"
from pizza_sales
group by pizza_name
order by "total revenue" asc
limit  5


