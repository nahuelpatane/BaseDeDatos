-- Ejercicio 1
SELECT * 
FROM address 
WHERE postal_code IN (SELECT postal_code from address AS ad WHERE ad.postal_code like "%515%");

CREATE INDEX address_code ON address(postal_code);  

-- Ejercicio 2

SELECT first_name 
FROM actor
WHERE first_name LIKE "%penelope%";



-- Ejercicio 3

SELECT *
FROM film
WHERE description LIKE '%Fanciful %';

ALTER TABLE film_text 
ADD FULLTEXT(description);

SELECT *
FROM film_text
WHERE MATCH(description) AGAINST('Fanciful ');
