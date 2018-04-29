/* Explain and Analzye without index */

EXPLAIN ANALYZE SELECT *
				FROM mg_customers
				WHERE first_name = 'John';


/*Bitmap Heap Scan & Time required is 0.020 ms */

/*Creates Index on First and Last Name */

CREATE INDEX firstlast ON mg_customers(first_name,last_name);

EXPLAIN ANALYZE SELECT first_name,last_name
				FROM mg_customers
				WHERE first_name = 'John';

/*Scan used Bitmap Index Scan & Time required is 0.011ms */