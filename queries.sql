/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT * FROM animals WHERE neutered = True AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = True;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/* transaction one */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

/* transaction two */
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species FROM animals;
COMMIT;
SELECT species FROM animals;

/* transaction three */

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM ANIMALS;

/* transaction four */

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
savepoint savepoint1;
update animals set weight_kg = weight_kg * -1;
rollback to savepoint savepoint1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;


/* Queries */

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/* ----------------------------------------------------------------------------------------------- */
/* day 3 */

-- Write queries (using JOIN) to answer the following questions:

-- What animals belong to Melody Pond?
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals LEFT JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals JOIN owners on animals.owner_id = owners.id join species on animals.species_id = species.id where full_name = 'Jennifer Orwell' and species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals JOIN owners on animals.owner_id = owners.id where full_name = 'Dean Winchester' and escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, count(*) FROM animals JOIN owners on animals.owner_id = owners.id group by full_name order by count(*) desc limit 1;

/* ----------------------------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------------------------- */
/* day 4 */

-- Join Tables queries
-- Last animal seen by William Tatcher
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit AS last_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='William Tatcher' ORDER BY  date_of_visit DESC LIMIT 1 ; 

-- Different animals seen by Stephanie Mendez
SELECT vets.name AS vet_name , COUNT(visits.date_of_visit) AS number_of_visits FROM visits INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;

-- All Vets and specialities including doctors with no specialities
SELECT specializations.species_id, specializations.vet_id, vets.name AS vet_name, species.name AS species_name FROM specializations FULL OUTER JOIN species ON species.id = specializations.species_id FULL OUTER JOIN vets ON vets.id = specializations.vet_id;

-- Animals visited Stephanie Mendez between april 1stand August 30th 2020
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit as visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' AND  date_of_visit BETWEEN '2020-04-01' And '2020-08-30'; 

-- Animal with the most visit to the vet
SELECT animals.name AS animal_name, COUNT(visits.date_of_visit) AS number_of_visits from visits INNER JOIN animals ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(visits.date_of_visit) DESC LIMIT 1 ;

-- Maisy SmithFirst visit
SELECT vets.name AS vet_name, animals.name as animal_name, visits.date_of_visit AS first_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Maisy Smith' ORDER BY  date_of_visit ASC limit 1;   

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.id AS animal_id, animals.name AS animal_name, animals.date_of_birth, vets.id AS vet_id,  vets.name AS vet_name, vets.age AS vet_age, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id;

-- Visits with a vet and did not specialize in animal species
SELECT vets.name AS vet_name, COUNT(*) FROM visits INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN specializations ON specializations.vet_id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name;

-- speciality maisy smith consider getting
SELECT vets.name AS vet_name, species.name AS species_name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;


/* ----------------------------------------------------------------------------------------------- */