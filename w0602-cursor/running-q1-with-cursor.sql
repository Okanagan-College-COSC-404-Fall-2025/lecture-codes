variable x refcursor
BEGIN
    :x := GET_PRODUCTS_BY_ORDER_ID(2);
END;
/

PRINT x;