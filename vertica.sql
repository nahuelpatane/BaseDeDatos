
-- 2 Explain this query

SELECT order_number, date_ordered
FROM store.store_orders_fact orders
WHERE orders.store_key IN (
  SELECT store_key
  FROM store.store_dimension
  WHERE store_state = 'MA') 
AND orders.vendor_key NOT IN (
    SELECT vendor_key
    FROM public.vendor_dimension
    WHERE vendor_state = 'MA')
AND date_ordered < '2003-03-01';
-- devulve los numeros de ordenes de masachusets



-- 5
-- EXISTS predicate
-- Get a list of all the orders placed by all stores on 
-- January 2, 2003 for the vendors with records in the 
-- vendor_dimension table 


SELECT order_number, date_ordered
FROM store.store_orders_fact f
WHERE EXISTS (SELECT 1
		      FROM vendor_dimension d 
		      WHERE d.vendor_key=f.vendor_key)
		      AND date_ordered='2003-01-02';


SELECT order_number, date_ordered
FROM store.store_orders_fact f, public.vendor_dimension d 
WHERE f.vendor_key=d.vendor_key
AND date_ordered = '2003-01-02';

