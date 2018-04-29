/* Dailon Dolojan */
/* CMPS 182 */
/* 8/1/2017 */
/* HMWK 14 */

/* Exercise 8.1.1 */
/* A. A view RichExec giving the name, address, certificate number and net worth of all executives with a net worth of at least $10,000,000. */

CREATE VIEW RichExec AS
	SELECT name, address, cert#, netWorth
	FROM MovieExec
	WHERE networth >= 10000000;

/* B. A view StudioPres giving the name, address, and certificate number of all executives who are studio presidents. */

CREATE VIEW StudioPres AS
	SELECT me.name, me.address, me.cert
	FROM MovieExec me, Studio st
	WHERE st.name = me.name AND st.address = me.address;

/* C. A view ExecutiveStar giving the name, address, gender, birth date, certificate number, and net worth of all individuals who are both executives and stars. */

CREATE VIEW ExecutiveStar AS
	SELECT ms.name, ms.address, ms.gender, ms.birthdate, me.cert#, me.netWorth
	FROM MovieExec me, MovieStar ms
	WHERE me.name = ms.name AND me.address = ms.address;


/* Exercise 8.3.1 */
/* Declare indexes on the following attributes or combination of attributes */
/* A. studioName */

CREATE INDEX studioNAME on Studio(name);

/* B. address of MovieExec */

CREATE INDEX MovieExecAddress on MovieExec(address);

/* C. genre and length */

CREATE INDEX MovieGenre_Length on Movies(genre,length);