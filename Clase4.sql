 /*
SELECT f1.title, f2.title, f1.`length`, f1.film_id, f2.film_id
FROM film f1, film f2
WHERE f1.`length` = f2.`length` AND f1.film_id <> f2.film_id
ORDER BY 1
*/

SELECT title, special_features
FROM film
WHERE rating = 'PG-13'


SELECT DISTINCT title, `length`
FROM film
ORDER BY 1 


SELECT title, rental_rate, replacement_cost
FROM film
WHERE replacement_cost BETWEEN 20.00 AND 24.00


SELECT title, rating, special_features
FROM film, category, film_category

WHERE category.category_id = file_category.category_id
AND film.film_id = film_category
special_features = 'Behind the Scenes'

SELECT DISTINCT first_name, last_name, title
FROM actor, film
WHERE film.title LIKE '%ZOOLANDER FICTION%'



					
					


					

					

					

					

			
			

	




















