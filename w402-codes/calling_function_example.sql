select product_name from products where products.PRODUCT_ID in(
select o.PRODUCT_ID from order_items o WHERE o.ORDER_ID in(SELECT ORDER_ID from ORDERS o where o.CUSTOMER_ID = GET_CUSTOMERS_BY_EMAIL('kristina.nunez@internalmail')));
