/* 3.6 Create View */

/* 1.Create a view customer city that contains the first name, last name and city id of all people
who are customers of both Downtown Video and City Books. */

CREATE VIEW customer_city(first_name, last_name, city_id) AS 
	SELECT mg_c.first_name, mg_c.last_name, dv_a.city_id
	FROM mg_customers mg_c, dv_address dv_a;

/* 2.Create a view district_stat that contain the district and the number of Downtown Video customers
living in that district (sorted in the ascending order on the number of customers)*/

CREATE VIEW district_stat(district, Number_of_customers_within_district) AS
	SELECT dv_a.district, COUNT(dv_a.district)
	FROM dv_address dv_a
	GROUP BY dv_a.district
	ORDER BY COUNT(dv_a.district) ASC;

/* 3.Create a view author_title that contains the first name, last name and title for each book in
cb_books.*/

CREATE VIEW author_title(first_name, last_name, title) AS 
	SELECT cb_a.first_name, cb_a.last_name, cb_b.title
	FROM cb_authors cb_a, cb_books cb_b
	WHERE cb_a.author_id = cb_b.author_id;

/*4.Which are the books written by Stephen Fry ? (Query from the author_title view and you need to
output only the title of the book)*/

SELECT title
FROM author_title
WHERE first_name = 'Stephen' AND last_name = 'Fry';

/*5.Which district has the least number of customers? (Query from the district_stat view and list any
5 districts)*/

SELECT district
FROM district_stat
GROUP BY district
ORDER BY COUNT(district) ASC
LIMIT 5;

/*6.Alter the name of the customer_city view to a new name of your choice. */
ALTER VIEW customer_city RENAME TO c_city_view;