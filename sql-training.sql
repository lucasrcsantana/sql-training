#THERE ARE EXERCISES FROM THE COURSE 'SQL FOR NEWBS' OF UDEMY
#I'M USING SAKILA_DB EMULATING BLOCKBUSTER DB

#COUNT AND GROUP BY
#COUNT NUMBER OF NAMES THAT ARE IN EACH CATEGORY OF RENTAL_RATE
SELECT count(title), rental_rate
FROM film
GROUP BY rental_rate
;	

#GROUP BY THE SECOND COLUMN OF SELECT
SELECT count(title), rental_rate
FROM film
GROUP BY 2
;	

#WHICH RATINGS DO WE HAVE THE MOST FILMS IN?
SELECT count(title), rating
FROM film
GROUP BY 2
;	

#GROUP BY RATING AND RENTAL_RATE
#FOR MULTIPLE GROUP BY WE USE COMMA ','
SELECT count(title), rating, rental_rate
FROM film
GROUP BY rating,  rental_rate
;	

# Show films that have an R rating and are $.99 .
#FOR TWO CONDITIONS IN WHERE WE HAVE TO USE 'AND'
SELECT count(title), rating, rental_rate
FROM film
WHERE rating = 'R' AND rental_rate = 0.99 
;	

#HOW TO CONNECT TABLES
#SELECTING THE ADRESSES FROM THE CUSTOMERS
#WHEN ARE USING MULTIPLE TABLES, WE NEED TO SPECIFY WHICH TABLE WE ARE QUERYING WHICH INFORMATION
#TO SPECIFY WE USE TABLE.INFORMATION, USING '.' TO SPECITY THE TABLE
#IN WHERE QE CONNECT THE TABLES AND INFORMATIONS. TABLE1.INFORMATION = TABLE2.INFORMATION
SELECT 
	customer.customer_id, customer.first_name, customer.last_name, customer.email, address.address
FROM 
	customer, address
WHERE
	customer.address_id = address.address_id
;	

#CATEGORY, LANGUAGE, NAME OF EVERY FILM
SELECT
	film.title, language.name, category.name
FROM 
	film, language, film_category, category
WHERE
	film.language_id = language.language_id AND film_category.film_id = film.film_id AND category.category_id = film_category.category_id
;	

#CATEGORY, LANGUAGE, NAME OF EVERY FILM
#TO ADD A NICKNAME FOR THE TABLES, WE CAN SIMPLE PUT A LETTER AFTER THE NAME AND THIS WILL BE THE NICKNAME
SELECT
	f.title, l.name, c.name
FROM 
	film f, language l, film_category fc, category c
WHERE
	f.language_id = l.language_id AND fc.film_id = f.film_id AND c.category_id = fc.category_id
;	

#HOW MANY TIMES EACH MOVIE HAS BEEN RENTED OUT?
SELECT
	f.title, count(r.rental_id)
FROM 
	film f, inventory i, rental r
WHERE
	f.film_id = i.film_id AND r.inventory_id = i.inventory_id
GROUP BY
	1
;	

#
SELECT

FROM 

WHERE
	
;	

#
SELECT

FROM 

WHERE
	
;	

#
SELECT

FROM 

WHERE
	
;	

#
SELECT

FROM 

WHERE
	
;	

#
SELECT

FROM 

WHERE
	
;	

