--cleaning columns 

--standardize date column into dd-MM-yyyy

UPDATE ecommerce_data
SET order_date = FORMAT(
    COALESCE(
        TRY_CAST(order_date AS DATE),               -- handles yyyy-mm-dd
        TRY_CONVERT(DATE, order_date, 101),         -- handles mm/dd/yyyy (US)
        TRY_CONVERT(DATE, order_date, 103),         -- handles dd/mm/yyyy (UK/India)
        TRY_CONVERT(DATE, order_date, 110)          -- handles mm-dd-yyyy
    ), 
    'dd-MM-yyyy'
);
-- standardize customer_name 

UPDATE ecommerce_data
SET customer_name = UPPER(TRIM(customer_name))
WHERE customer_name IS NOT NULL;

--standardise city name such as 'DELHI', 'new delhi' into 'Delhi'

UPDATE ecommerce_data
SET city = UPPER(LEFT(TRIM(city), 1)) + LOWER(SUBSTRING(TRIM(city), 2, LEN(city)))
WHERE city IS NOT NULL AND city <> '';

--standardise product_category name such as 'electronics', 'elec' into 'Electronics'
UPDATE ecommerce_data
SET product_category = UPPER(LEFT(TRIM(product_category), 1)) + 
                       LOWER(SUBSTRING(TRIM(product_category), 2, LEN(product_category)))
WHERE product_category IS NOT NULL;

--replace ngative value into '0'

UPDATE ecommerce_data
SET quantity = 0
WHERE quantity < 0;

--Convert price Into int And then With Desimmon '0' 
UPDATE ecommerce_data
SET price = CAST(price AS INT);


UPDATE ecommerce_data
SET price = ROUND(price, 0);

-- standardise order_status name such as 'delivere', 'deli' into 'Delivered' and 'cancelled', 'cansce' into 'Canceled'
UPDATE ecommerce_data
SET order_status = UPPER(LEFT(TRIM(order_status), 1)) + 
                   LOWER(SUBSTRING(TRIM(order_status), 2, LEN(order_status)))
WHERE order_status IS NOT NULL;
