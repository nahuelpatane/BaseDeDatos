
SELECT COUNT(*)
FROM public.inventory_fact;

SELECT COUNT(*)
FROM public.employee_dimension;

SELECT * FROM public.product_dimension;


--181.10.31.117
--docker
--user1
--pass123


-- 1 Ejercicio Exaplain this query
SELECT count(*) FROM product_dimension;
SELECT * FROM public.date_dimension;

SELECT fat_content 
FROM (
  SELECT DISTINCT fat_content 
  FROM product_dimension 
  WHERE department_description 
  IN ('Dairy') ) AS food 
  ORDER BY fat_content
  LIMIT 5;
  
  
-- Devuelve la cantidad de contenido de Grasa de lacteos ordenada de menor a mayor.Top 5 de lacteos con menor grasa
 
  
  
  
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


-- 3 Requests female and male customers with the maximum 
-- annual income from customers

SELECT customer_name, annual_income
FROM public.customer_dimension
WHERE (customer_gender, annual_income) IN
      (SELECT customer_gender, MAX(annual_income)
       FROM public.customer_dimension
       GROUP BY customer_gender);
 -- hombre y mujer que mas gana

-- 4 IN predicate
-- Find all products supplied by stores in MA

SELECT DISTINCT s.product_key, p.product_description
FROM store.store_sales_fact s, public.product_dimension p
WHERE s.product_key = p.product_key
    AND s.product_version = p.product_version
    AND s.store_key IN
      (SELECT store_key
       FROM store.store_dimension
       WHERE store_state = 'MA')
ORDER BY s.product_key;
       
       
      / 
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
