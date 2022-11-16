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

/* day 4 */
-- vets Table
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

-- "join table" called specializations Table to handle relationship between species and vet
CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY,
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- "join table" called visits to handle relationship between animals ans vets
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY,
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- database Performance audit project

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
