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
