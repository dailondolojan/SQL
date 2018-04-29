/* 3.7 More Queries */

/* 1.Write a statement that will change the active attribute to true for every row in mg_customers
where active is NULL and the customer’s last name starts with ’B’ or ’C’ */

UPDATE mg_customers
SET active = true
WHERE active = NULL AND (last_name LIKE 'B_%' OR last_name LIKE 'C_%');

/* 2.John Smith is a new customer. His details areas follows:
		First Name: John
		Last Name: Smith
		Address id : 700
		Address:Koshland Way
		City id : 654
		Postal code: 95064
Add the details of the new customer to the mg_customer and dv_address table.(You can assume
the values that are not specified to be NULL) Note: one of these rows must be inserted before
the other; you’ll need to determine what is the correct order. */

INSERT INTO dv_address
VALUES(700, 'Koshland Way', NULL, NULL, 654, 95064, NULL);

INSERT INTO mg_customers
VALUES(default, 'John', 'Smith', NULL, 700, NULL);

/* 3.List the title of each film whose length exceeds the average length of all films */

SELECT title
FROM dv_film
WHERE length > (SELECT AVG(length)
				FROM dv_film);

/* 4.What is the maximum, minimum and average length of the films in each rating category? */

SELECT rating, MAX(length), MIN(length), AVG(length)
FROM dv_film
GROUP BY rating;

/* 5.Write a statement that will delete all the books written by Nevil Shute */

DELETE FROM cb_books cb_b 
WHERE cb_b.author_id = ANY(SELECT cb_a.author_id
							FROM cb_authors cb_a
							WHERE cb_a.first_name = 'Nevil' AND cb_a.last_name = 'Shute');
