
use customers

select * from Customers

select
Gender,
sum(cast(Amount as int)) as revenue
from
Customers
group by
Gender

select
Shipping_Type,
count(Customer_ID) as total_customers,
sum(cast(Amount as int)) as revenue
from 
Customers
group by
Shipping_Type
order by
revenue desc, 
total_customers desc

select
Customer_ID,
cast(Amount as int) as revenue
From
Customers
where
Discount_Applied = 'Yes' and Amount >= (select AVG(cast(Amount as int)) from Customers)

select Top 5
Item,
round(avg(cast(Review_Rating as float)),2) as average_review_rating
from 
Customers
group by
Item
order by
average_review_rating desc

select 
Subscription_Status,
count(Customer_ID) as total_customers,
sum(cast(Amount as int)) as avg_revenue
from 
Customers
group by
Subscription_Status

with customer_type as (
select
Customer_ID,
Previous_Purchases,
case 
	when Previous_Purchases = 1 then 'New'
	when Previous_Purchases between 2 and 20 then 'recurring'
	else 'loyal'
	end as customer_category
from Customers)

select
customer_category,
count(*) as total_customers
from
customer_type
group by
customer_category

select
Season,
sum(cast(Amount as int)) as revenue
from Customers
group by
Season
order by
revenue desc

select Top 1
Category,
sum(cast(Amount as int)) as revenue
from Customers
group by
Category
order by
revenue desc

select
Item,
sum(cast(Amount as int)) as revenue
from 
Customers
where
Category = 'Clothing'
group by
Item
order by
revenue desc

with customer_group as (
select
Customer_ID,
Amount,
Age,
case
	when Age <= 20 then 'young'
	when Age between 21 and 50 then 'Adult'
	else 'senior'
	end as customer_age
from
Customers)

select 
customer_age,
count(Customer_ID) as total_customers,
sum(cast(Amount as int)) as revenue
from 
customer_group
group by
customer_age
order by
revenue desc


