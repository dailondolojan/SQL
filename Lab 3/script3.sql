
/* General Constraints*/
/* 1. The length of a film must be a positive integer. */
ALTER TABLE dv_film
ADD CONSTRAINT positive_length
CHECK (length > 0);

/*-----------------------------------------------------------------------------------------------------------------*/

/* 2. An mg_customers tuple must not have anempty foreignkey to the address table i.e. the
address_id field cannot be NULL. */

/* Update that changes Null to random integer between 0-605 */

UPDATE mg_customers
SET address_id = 605
WHERE address_id IS NULL;

/* Constraint that address_id cannot be null */
ALTER TABLE mg_customers
ALTER COLUMN address_id SET NOT NULL;

/*-----------------------------------------------------------------------------------------------------------------*/

/* 3. Any dv_address table tuple must not have an empty address attribute i.e. the address
attribute in the dv_address table cannot be NULL. */

/* Constraint that address_id cannot be null */
ALTER TABLE dv_address
ALTER COLUMN address SET NOT NULL;