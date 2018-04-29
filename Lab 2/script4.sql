/* Dailon Dolojan */
/* CMPS 182 */
/* Lab 2 */
/* script4.sql */

/*1.What are the first and last names of all people who are customers of both Downtown Video and
City Books ? */

SELECT dv_c.first_name, dv_c.last_name
FROM dv_customer dv_c, cb_customers cb_c
WHERE  cb_c.first_name = dv_c.first_name AND cb_c.last_name = dv_c.last_name;

/*2.What are phone numbers of all people who are customers of both Downtown Video and
City Books? */

SELECT dv_a.phone
FROM dv_address dv_a, dv_customer dv_c, cb_customers cb_c
WHERE  cb_c.first_name = dv_c.first_name AND cb_c.last_name = dv_c.last_name AND dv_c.address_id = dv_a.address_id;

/* 3.What are the first and last names of all customers who live in the district having the
most customers? */

SELECT mg_c.first_name, mg_c.last_name, dv_a.district
FROM dv_address dv_a, mg_customers mg_c
WHERE dv_a.address_id = mg_c.address_id AND district = (SELECT district
														FROM dv_address
														GROUP BY (district)
														ORDER BY count(address) DESC
														LIMIT 1
														);

/* 4.What rating is the least common among films in the Downtown Video database, and how
many films have that rating? (Return both the rating and the number of films in one
result.) */

SELECT dv_f.rating, COUNT(dv_f.rating)
FROM dv_film dv_f
GROUP BY dv_f.rating
ORDER BY COUNT(dv_f.rating) ASC
LIMIT 1;


/* 5.What are the first and last names of the top 10 authors when ranked by the number of
books each has written? (Return both author name and the number of books of top 10
authors, sorted in descending order) */

SELECT cb_a.first_name, cb_a.last_name, COUNT(cb_b.title)
FROM cb_authors cb_a, cb_books cb_b
WHERE cb_a.author_id = cb_b.author_id
Group By cb_a.first_name, cb_a.last_name
ORDER BY COUNT(cb_b.title) DESC							
LIMIT 10;