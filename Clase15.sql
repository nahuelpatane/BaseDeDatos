--Ejercicio 1 
CREATE OR REPLACE VIEW list_of_customer AS
SELECT customer_id, CONCAT_WS(" ", first_name, last_name) AS 'Full name' , address, postal_code AS 'Zip code', city, country, store_id,
CASE active
	WHEN 1 THEN "Activo"
	WHEN 0 THEN "inactive"
ELSE 'inactive'
END AS "Status"
FROM customer
INNER JOIN country USING(country_id)
INNER JOIN address USING(address_id)
INNER JOIN store USING(store_id);
INNER JOIN city USING(city_id)



--Ejercicio 2 

SELECT film_id, title, description, name, `length`, rental_rate, GROUP_CONCAT(actor.first_name, actor.last_name)  FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
GROUP BY 1, 4;


--Ejercicio 3

--Ejercicio 4
DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id

SELECT *
FROM actor_information
