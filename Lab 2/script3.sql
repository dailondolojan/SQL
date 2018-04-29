/* Dailon Dolojan */
/* CMPS 182 */
/* Lab 2 */
/* script3.sql */


/* Problem 3.3.1 Copy Data */
/* Populating merged tables with data from CB & DB */

INSERT INTO mg_customers (customer_id, first_name, last_name, email, address_id, active)
SELECT dv_c.customer_id, dv_c.first_name, dv_c.last_name, dv_c.email, dv_c.address_id, dv_c.active 
FROM dv_customer dv_c;

/*
CREATE TABLE dv_customer (
	customer_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address_id INT,
	active BOOLEAN,
	);

CREATE TABLE cb_customers (
	last_name VARCHAR(50),
	first_name VARCHAR(50),
	);
	*/

/* 3.3.2 Create Sequences */
CREATE SEQUENCE
mg_customers_seq START
600;

/* 3.3.3 Associate Sequence with Attributes*/
ALTER TABLE mg_customers ALTER
COLUMN customer_id
SET DEFAULT NEXTVAL('mg_customers_seq');

/* 3.3.4 Copy Additional Data*/
INSERT INTO mg_customers (first_name,last_name)
SELECT cb_c.first_name, cb_c.last_name 
FROM cb_customers cb_c
EXCEPT SELECT dv_c.first_name, dv_c.last_name FROM dv_customer dv_c; 