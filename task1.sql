--Selecting film_id, title, genre, rating
SELECT not_rented.film_id, not_rented.title, genre.name, genre.rating FROM 
(  --here we are selecting all films id that are not rented (i.e all copies are not taken from inventary)
   SELECT * FROM film
   WHERE film_id NOT IN( 
   SELECT film_id FROM rental RIGHT JOIN inventory ON rental.inventory_id = inventory.inventory_id )
) AS not_rented,

(--first we make a join of category film and category
 --we choose films that have desired genre and rating
SELECT film.film_id, title,rating, name FROM
    film LEFT JOIN film_category ON film.film_id = film_category.film_id
	LEFT JOIN category ON category.category_id=film_category.category_id 
WHERE (name='Horror' OR name='Sci-Fi') AND (film.rating = 'PG-13' OR film.rating = 'R')
) AS genre 
--after this we choose not rented films, that have appropriate genre and reting
WHERE not_rented.film_id=genre.film_id;

