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

#REVENUE PER TITLE
#THERE IS AN ERROR IN THE SELECT CLAUSE. WE CAN'T MAKE THE QUERY USING THE KEYWORDS 'F.TITLE', SO I CHANGED FOR 'F.'FILM_ID'. THIS IS BECAUSE A FUNCTION CALLED 'FULL_ORDER_BY' THAT CAN BE DISABLED WHEN THE SERVER STARTS
SELECT
	f.title as "Film Title", count(r.rental_id), f.rental_rate, count(r.rental_id) * f.rental_rate as revenue
FROM 
	film f, inventory i, rental r
WHERE
	f.film_id = i.film_id AND r.inventory_id = i.inventory_id
GROUP BY
	1,3
ORDER BY 
	4 DESC
;

#WHICH CUSTOMER PAID US THE MOST MONEY
SELECT
	c.customer_id, c.first_name, c.last_name, sum(p.amount)
FROM 
	payment p, customer c
	WHERE c.customer_id = p.customer_id
GROUP BY
	1
ORDER BY
	4 DESC
;	

#WHAT STORE HAS THE HISTORICALLY MOST REVENUE
SELECT
	sum(p.amount), c.store_id
FROM 
	payment p, customer c
	WHERE c.customer_id = p.customer_id
GROUP BY
	2
ORDER BY
	2 DESC
;	

#HOW MANY RENTALS WE HAVE EACH MONTH
SELECT
	left(r.rental_date, 7) , count(r.rental_id)
FROM 
	rental r
GROUP BY
	1
ORDER BY
	2 DESC	
;	

#HOW MANY RENTALS WE HAVE EACH MONTH
SELECT
	f.film_id, f.title, max(r.rental_date), min(r.rental_date)
FROM 
	rental r, inventory i, film f
WHERE
	i.film_id = f.film_id and r.inventory_id = i.inventory_id
GROUP BY
	1
;	


#WHATS CUSTOMERS HAVEN'T RENTED THE MOVIE LAST MONTH
SELECT
	r.rental_date, c.first_name, c.last_name
FROM 
	customer c, rental r
WHERE
	left(r.rental_date, 7) = '2005-05'
;	

# EVERY CUSTOMER'S LAST RENTAL DATE
SELECT
	concat(c.first_name, " ", c.last_name) as Nome, c.email, max(r.rental_date) as "Última data"
FROM 
	customer c, rental r
WHERE
	c.customer_id = r.customer_id	
GROUP BY
	1,2
;	

#REVENUE BY EACH MONTH
SELECT
	left(p.payment_date, 7) as Mês, sum(p.amount) as Revenue
FROM 
	payment p
GROUP BY
	1
;	

# HOW MANY DISTINCT RENTS DO WE HAVE PER MONTH
SELECT
	left(r.rental_date, 7) as Mês, count(r.rental_id), count(DISTINCT r.customer_id) as "Unique Renters", count(r.rental_id) / count(DISTINCT r.customer_id) as "Rentals per Renter"
FROM 
	rental r
GROUP BY 1
;	

#NUMBER OF DISTINCT CUSTOMER RENTED EACH FILM IN EACH MONTH
SELECT
	f.title, left(r.rental_date, 7) as Mês, count(DISTINCT r.customer_id) as "Unique Films Rented in Month"
FROM 
	rental r, inventory i, film f
WHERE
	r.inventory_id = i.inventory_id AND i.film_id = f.film_id
GROUP BY
	1,2
;	

#NUMBER OF DISTINCT FILMS RENTED EACH MONTH
SELECT
	left(r.rental_date, 7) as Mês, count(r.rental_id), count(DISTINCT i.film_id) as "Distincted films rented by month", count(r.rental_id) / count(DISTINCT i.film_id) as "Avg Rentals per Film"
FROM 
	rental r, inventory i
WHERE
	r.inventory_id = i.inventory_id
GROUP BY
	1
;	

#NUMBER OF RENTALS IN COMEDY, SPORTS AND FAMILY CATEGORIES
SELECT
	c.name, count(r.rental_id)
FROM 
	rental r, inventory i, film f, film_category fc, category c
WHERE
	r.inventory_id = i.inventory_id 
	AND i.film_id = f.film_id 
	AND f.film_id = fc.film_id 
	AND fc.category_id = c.category_id 
	AND c.name IN ("Comedy", "Sports", "Family")
GROUP BY
	1
;	

# COMPARISON OPERATORS
SELECT
	r.customer_id as Customer, count(r.rental_id) as Rentals
FROM 
	rental r
GROUP BY
	1
HAVING count(r.rental_id) >= 3
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	

#
SELECT

FROM 

WHERE

GROUP BY
	
;	
