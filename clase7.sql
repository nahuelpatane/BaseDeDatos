-- EJERCICIO 3
SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE NOT EXISTS (SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id
ORDER BY 1
		


-- EJERCICIO 4
SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE EXISTS (SELECT *
					FROM rental r2
					WHERE r1.customer_id = r2.customer_id
					AND r1.rental_id <> r2.rental_id)
AND r1.customer_id = c.customer_id	



-- Clase 6

SELECT *
from (SELECT titel, description, rental_rate, rental_rate * 15 AS in_pesos
		FROM film) t 
WHERE in_pesos > 10.0
AND in_pesos <70.0
ORDER BY 4;

SELECT customer_id,
		firs_name,
		last_name,
		(SELECT MAX(amount) max_amount
		FROM payment
		WHERE payment.customer_id = customer.customer_id) AS amount
FROM customer
ORDER BY amount DESC,
		customer_id DESC;
		
		
SELECT *
from (SELECT titel, description, rental_rate, rental_rate * 15 AS in_pesos
		FROM film) t 
WHERE in_pesos > 10.0
AND in_pesos <70.0
ORDER BY 4;

SELECT customer_id,
		firs_name,
		last_name,
		(SELECT MAX(amount) max_amount
		FROM payment
		WHERE payment.customer_id = customer.customer_id) AS amount
FROM customer
ORDER BY amount DESC,
		customer_id DESC;		
		


		
SELECT *
FROM film
	INNER JOIN 'language'
		ON film.language_id
		
		
		
		
SELECT	*
 FROM film
 	INNER JOIN film_category
 			ON film.film_id = film_category.film_id
 	INNER JOIN category
 			ON film_category.category_id = category.category_id;
 			
 			
 
INSERT INTO inventory
(file_id, store_id, last_update)
VALUES (1, 1, '2017-02-15 05:09:19.000');

 			
 			

 			






		
