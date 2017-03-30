SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (SELECT customer_id
					  FROM payment
					  WHERE amount = 0.99)
	AND customer_id NOT IN (SELECT customer_id
							FROM payment
							WHERE amount = 1.99)
	AND first_name LIKE ( 'W%' )
	
	
SELECT first_name, last_name
FROM customer c1
WHERE EXISTS (SELECT * 
			FROM customer c2
			WHERE c1.first_name = c2.first_name
			AND c1.customer_id <> c2.customer_id)
			

/*SELECT title, 'length'
FROM film f1
WHERE NOT EXISTS*/


SELECT title,length
FROM film
WHERE lenght >= ALL (SELECT length
					FROM film);
					