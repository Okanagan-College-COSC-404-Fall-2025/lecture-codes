create or replace FUNCTION get_products_by_order_id(p_order_id VARCHAR2) RETURN  SYS_REFCURSOR 
IS
    rc SYS_REFCURSOR;
BEGIN
    open rc for
        select product_name, product_id
        from products join ORDER_ITEMS
         USING(product_id) where order_id = p_order_id;

    RETURN rc;
END;