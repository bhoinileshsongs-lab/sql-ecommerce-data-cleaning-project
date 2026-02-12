--Handling nulls

--replace customer_name null into 'guest' where (price IS NOT NULL OR order_status = 'Delivered')
UPDATE ecommerce_data
SET customer_name = 'Guest'
WHERE customer_name IS NULL 
  AND (price IS NOT NULL OR order_status = 'Delivered');

  /*replace product_category null into 'Other' where price IS NOT NULL 
  AND order_status = 'Delivered'*/

  UPDATE ecommerce_data
SET product_category = 'Other'
WHERE product_category IS NULL 
  AND price IS NOT NULL 
  AND order_status = 'Delivered';

  /*Filld quantity column With '1' Where order_status = 'Delivered' THEN 1
    WHEN order_status = 'Cancelled'*/

UPDATE ecommerce_data
SET quantity = CASE 
    WHEN order_status = 'Delivered' THEN 1
    WHEN order_status = 'Cancelled' THEN 0
    ELSE quantity
END;

--Handling nulls In payment_mode column 

UPDATE ecommerce_data 
SET payment_mode = 'Other'
    WHERE price IS NOT NULL 
  AND order_status = 'Delivered';

/*replace nulls in column city with 'not specified' where price IS NOT NULL 
  AND order_status = 'Delivered';*/

UPDATE ecommerce_data
SET city = 'not specified'
WHERE city IS NULL 
  AND price IS NOT NULL 
  AND order_status = 'Delivered';

  /*replace nulls in column product_name with 'Other' where price IS NOT NULL 
  AND order_status = 'Delivered';*/

  UPDATE ecommerce_data
SET product_name = 'Other'
WHERE product_name IS NULL 
  AND price IS NOT NULL 
  AND order_status = 'Delivered';

-- replace nulls with '0' in quentity column
UPDATE ecommerce_data
SET quantity = 0
WHERE quantity IS NULL;

/*Convert null into average price WHERE price IS NULL 
  AND order_status = 'Delivered'*/

UPDATE ecommerce_data
SET price = (SELECT AVG(price) FROM ecommerce_data WHERE price IS NOT NULL)
WHERE price IS NULL 
  AND order_status = 'Delivered';

-- replace nulls with '0' in price column
  UPDATE ecommerce_data
SET price = 0
WHERE price IS NULL;

--Delere rows where order_date is null

DELETE FROM ecommerce_data
WHERE order_date IS NULL;

--Delere rows where order_id is null
DELETE FROM ecommerce_data
WHERE order_id IS NULL;

