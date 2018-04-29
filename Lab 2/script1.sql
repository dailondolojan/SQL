/* Dailon Dolojan */
/* CMPS 182 */
/* Lab 2 */
/* script1.sql */
/* Problem 3.1 */

/* Downtown Video DB */
CREATE TABLE dv_customer (
	customer_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address_id INT,
	active BOOLEAN
	);

CREATE TABLE dv_address (
	address_id INT,
	address VARCHAR(50),
	address2 VARCHAR(50),
	district VARCHAR(50),
	city_id INT,
	postal_code VARCHAR(50),
	phone VARCHAR(50)
	);

CREATE TYPE mpaa_rating AS ENUM (
	'G',
	'PG',
	'PG-13',
	'R',
	'NC-17'
);

CREATE TABLE dv_film (
	film_id INT,
	title VARCHAR(50),
	description VARCHAR(500),
	length int,
	rating mpaa_rating
	);

/* CityBooksDB */

CREATE TABLE cb_customers (
	last_name VARCHAR(50),
	first_name VARCHAR(50)
	);

CREATE TABLE cb_books (
	title VARCHAR(50),
	author_id INT
	);

CREATE TABLE cb_authors (
	author_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
	);

/* Merged Tables */

CREATE TABLE mg_customers (
	customer_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address_id INT,
	active BOOLEAN
	);