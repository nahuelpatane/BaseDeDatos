CALL GetAllProducts();

CALL GetOfficeByCountry('USA');

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;


CALL get_order_by_cust(141,@shipped,@canceled,@resolved,@disputed);
SELECT @shipped,@canceled,@resolved,@disputed;


SET @customerNo = 112;

SELECT country into @country
FROM customers
WHERE customernumber = @customerNo;

CALL GetCustomerShipping(@customerNo,@shipping);

SELECT @customerNo AS Customer,
       @country    AS Country,
       @shipping   AS Shipping;
       
       
       
SET @email_list = "";
CALL build_email_list(@email_list);
SELECT @email_list;


CALL test_mysql_loop();1`

-- EJERCICIOS

-- 1

SELECT COUNT(*) FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN store USING(store_id)
WHERE store_id = 2
AND (title LIKE "ACADEMY DINOSAUR" OR film_id = 23);



SELECT *
FROM film;


SELECT filmsAmount(2,23,"ACADEMY DINOSAUR");


-- Function1

CREATE FUNCTION filmsAmount(p_storeId INTEGER, p_filmId INTEGER, p_title VARCHAR(20)) RETURNS INTEGER
    DETERMINISTIC
BEGIN
    DECLARE total INTEGER;
    SET total = (SELECT COUNT(film_id) FROM film
		INNER JOIN inventory USING(film_id)
		INNER JOIN store USING(store_id)
		WHERE store_id = p_storeId
			AND film_id = p_filmId 
			AND title LIKE p_title);
    RETURN (total);
END



-- 2
CREATE PROCEDURE build_names_list (IN country VARCHAR(100),INOUT names_list TEXT)
BEGIN
	
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_ln varchar(100) DEFAULT "";
	DECLARE v_fn varchar(100) DEFAULT "";

	
	DECLARE names_cursor CURSOR FOR 
        SELECT first_name,last_name FROM customer
        INNER JOIN country USING(country_id)
                INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)

        WHERE country = country;
   	
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
	
	OPEN names_cursor;
	
	get_names: LOOP

        FETCH names_cursor INTO v_fn,v_ln;

        IF v_finished = 1 THEN 
            LEAVE get_names;
        END IF;

        -- build names list
        SET names_list = CONCAT(" ",v_fn," ",v_ln,";",names_list);

    END LOOP get_names;

    CLOSE names_cursor;
END

SET @names_list = "";
CALL build_names_list('Argentina',@names_list);
SELECT @names_list;



-- 3


