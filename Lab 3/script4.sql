/* Unit Test for Foreign Key Constraint 1 */

/* Delete Command violating Foreign Key */

DELETE FROM dv_address
WHERE address_id = 32;

/*-----------------------------------------------------------------------------------------------------------------*/

/* Unit Test for Foreign Key Constraint 2 */

DELETE FROM cb_authors
WHERE author_id = 1;

/*-----------------------------------------------------------------------------------------------------------------*/

/* Unit Test for General Constraint 1 */

/* Insert Command Meets Constraint */
INSERT INTO dv_film
VALUES(13031, 'UP by Disney/Pixar', 'A movie about adventure', 135, 'G');

/* Insert Command does NOT Meets Constraint */
INSERT INTO dv_film
VALUES(13032, 'DOWN by Disney/Pixar', 'A movie not about adventure', -135, 'G');

/*-----------------------------------------------------------------------------------------------------------------*/

/* Unit Test for General Constraint 2 */

/* Insert Command Meets Constraint */
INSERT INTO mg_customers
VALUES(12346, 'Dailon', 'Dolojan', 'ddolojan@ucsc.edu', 1, true);

/* Insert Command does NOT Meets Constraint */
INSERT INTO mg_customers
VALUES(12345, 'Dilon', 'Dlojan', 'ddlojan@ucsc.edu', NULL, NULL);

/*-----------------------------------------------------------------------------------------------------------------*/

/* Unit Test for General Constraint 3 */

/* Insert Command Meets Constraint */
INSERT INTO dv_address
VALUES(12345, '359 Plover Place', NULL, 'Contra Costa County', 88888, 94565, 9255509379);

/* Insert Command does NOT Meets Constraint */
INSERT INTO dv_address
VALUES(123456, NULL, NULL, 'Contra Costa County', 88888, 94565, 9255509379);
