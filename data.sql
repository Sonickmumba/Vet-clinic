/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, True, 10.23);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, True, 8);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-17', 1, False, 15.04);
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, True, 11);


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5,'Charmander', '2020-02-08', 0, false, -11.0),
(6,'Plantmon', '2021-11-15', 2, true, -5.7),
(7,'Squirtle', '1993-04-02', 3, false, -12.13),
(8,'Angemon', '2005-06-12', 1, true, -45.0),
(9,'Boarmon', '2005-06-07', 7, true, 20.4),
(10,'Blossom', '1998-10-13', 3, true, 17.0),
(11,'Ditto', '2022-05-14', 4, true, 22.0);

/* --------------------------------------------------- */
/* day 3 */

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon'),

-- Modify your inserted animals so it includes the species_id value
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon%';


-- Modify your inserted animals to include owner information (owner_id): Sam Smith owns Agumon.

UPDATE animals set owner_id = 1 WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals set owner_id = 2 WHERE name in ('Gabumon','Pikachu');

-- Bob owns Devimon and Plantmon.
UPDATE animals set owner_id = 3 WHERE name in ('Devimon','Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals set owner_id = 4 WHERE name in ('Charmander','Squirtle','Blossom');

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals set owner_id = 5 WHERE name in ('Angemon','Boarmon');

/* day 4 */

-- Insert data in the vets table
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23'), 
('Maisy Smith', 26, date '2019-01-17'), 
('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');

-- Insert data in the specializations table
INSERT INTO specializations(species_id, vet_id) VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'William Tatcher'));
INSERT INTO specializations(species_id, vet_id) VALUES((SELECT id FROM species WHERE name = 'Pokemon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez')), ((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'));
INSERT INTO specializations(species_id, vet_id) VALUES((SELECT id FROM species WHERE name = 'Digimon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'));


-- Insert data in the visits table
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), date '2020-05-24'), ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),  date '2020-07-22');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2021-02-02');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2020-01-05'), ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2020-03-08'), ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2020-05-14');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2021-05-04');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2021-02-24');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2019-12-21'), ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'),  date '2020-08-10'), ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2021-04-07');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2019-09-29');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), date '2020-10-03'), ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'),  date '2020-11-04');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), date '2019-01-24'), ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2019-05-15'), ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2020-02-27'), ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'),  date '2020-08-03');
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), date '2020-05-24'), ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'),  date '2021-01-11');

-- database Performance audit project

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, age, email) select 'Owner ' || generate_series(1,2500000), generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
