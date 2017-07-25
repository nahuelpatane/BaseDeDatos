#1)
SELECT CONCAT_WS(" ",first_name,last_name) as full_name, address.address, city.city
FROM customer 
	INNER JOIN city USING(city_id)
	INNER JOIN address USING(address_id)
	INNER JOIN country USING(country_id)
WHERE country.country LIKE 'Argentina';

#2)
SELECT title,
`language`.name, 
CASE
	WHEN rating = 'G' THEN 'All Ages Are Admitted.'
	WHEN rating = 'PG' THEN 'Some Material May Not Be Suitable For Children.'
	WHEN rating = 'PG-13' THEN 'Some Material May Be Inappropriate For Children Under 13.'
	WHEN rating = 'R' THEN 'Under 17 Requires Accompanying Parent Or Adult Guardian.'
	WHEN rating = 'NC-17' THEN 'No One 17 and Under Admitted.'
END AS rating_description
  FROM film
	INNER JOIN `language` USING (language_id);
	
#3)	
SELECT first_name, last_name
FROM actor

SELECT title, release_year
FROM film 
INNER JOIN actor USING(actor_id)
INNER JOIN film_actor USING(film_id)
WHERE CONCAT_WS(" ",first_name,last_name) LIKE TRIM(UPPER("eD cHaSE"));


#4)
SELECT film.title,
	   CONCAT_WS(" ", customer.first_name, customer.last_name) as full_name,
	   CASE WHEN rental.return_date IS NOT NULL THEN 'Yes'
	   ELSE 'No' END AS was_returned,
	   MONTHNAME(rental.rental_date) as month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';
   
#5)
SELECT CAST(last_update AS DATE) as only_date
FROM rental;

SELECT CONVERT("2006-02-15", DATETIME);

-- CAST and CONVERT are pretty much the same, with almost no differences between them
-- And CAST and CONVERT have some differences in the syntax,they're both used to convert data from one type to another.




