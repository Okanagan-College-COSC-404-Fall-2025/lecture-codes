create or replace view v_customer_order_count as

select c.CUSTOMER_ID, c.EMAIL_ADDRESS, c.FULL_NAME, count(o.ORDER_ID) as n_order
from customers c join orders o on c.customer_id = o.customer_id 
group by c.CUSTOMER_ID,c.EMAIL_ADDRESS,  c.FULL_NAME having count(o.ORDER_ID) > 5;

