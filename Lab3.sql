
# Lab | SQL Queries 3

#1. How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT(last_name)) AS 'total_last_name' FROM sakila.actor;

#2. In how many different languages where the films originally produced?

SELECT COUNT(DISTINCT(original_language_id)) AS 'total_different_language' FROM sakila.film;

SELECT original_language_id FROM sakila.film;

#3. How many movies were not originally filmed in English?

SELECT COUNT(DISTINCT(original_language_id)) AS 'total_different_language' FROM sakila.film WHERE original_language_id =0;

#4. Get 10 the longest movies from 2006.

SELECT film_id, title, length FROM sakila.film  WHERE release_year = '2006' ORDER BY length DESC LIMIT 10;

#5. How many days has been the company operating (check `DATEDIFF()` function)?

SELECT DATEDIFF(MAX(return_date), MIN(rental_date)) AS operating_in_days, MIN(rental_date) AS first_rental, MAX(return_date) AS last_return FROM sakila.rental;

#6. Show rental info with additional columns month and weekday. Get 20.

SELECT rental_date, DATE_FORMAT(CONVERT(rental_date,date),'%M') AS 'month', DAYOFWEEK(rental_date) AS 'weekday' FROM sakila.rental LIMIT 20;

#7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_date, 
Case
WHEN DAYOFWEEK(rental_date) = 6 OR DAYOFWEEK(rental_date) = 7 THEN 'Weekday' 
ELSE 'Workday'
END AS 'Day of week'
FROM sakila.rental;

#8. How many rentals were in the last month of activity?

SELECT COUNT(rental_id) FROM sakila.rental WHERE ("2006-02-14"- INTERVAL 30 DAY) <= rental_date;
