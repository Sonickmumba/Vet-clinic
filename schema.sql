/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id integer PRIMARY KEY Not Null,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

/* Add a column species of type string to your animals table. Modify your schema.sql file. */
ALTER TABLE animals ADD species varchar(100);

/* day 3 */

/* Create a table named owners with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
full_name: string
age: integer */

CREATE TABLE owners (
    id serial PRIMARY KEY NOT NULL,
    full_name varchar(100) NOT NULL,
    age integer NOT NULL
);

/* Create a table named species with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string */

CREATE TABLE species (
    id serial PRIMARY KEY NOT NULL,
    name varchar(400)
);

/* ----------------------------------------------------------------------- */
/* Modify animals table:
Make sure that id is set as autoincremented PRIMARY KEY
Remove column species
Add column species_id which is a foreign key referencing species table
Add column owner_id which is a foreign key referencing the owners table */

ALTER TABLE animals UPDATE id serial PRIMARY KEY NOT NULL;
SELECT id FROM animals;
ALTER TABLE animals DROP COLUMN species;
SELECT * FROM animals;
ALTER TABLE animals ADD COLUMN species_id integer REFERENCES species(id);
SELECT * FROM animals;
ALTER TABLE animals ADD COLUMN owner_id integer REFERENCES owners(id);
SELECT * FROM animals;
/* ----------------------------------------------------------------------- */
