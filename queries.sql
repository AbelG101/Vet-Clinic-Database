SELECT *
FROM animals
WHERE name like '%mon';

SELECT NAME
FROM animals
WHERE date_of_birth >= '2016-01-01'
  AND date_of_birth <= '2019-12-31';

SELECT name
FROM animals
WHERE neutered = '1'
  AND escape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE name like 'Agumon'
  OR name like 'Pikachu';

SELECT name,
  escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = '1';

SELECT *
FROM animals
WHERE name NOT like 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

-----
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

-----
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species is null;
COMMIT;

-----
BEGIN;
DELETE FROM animals;
ROLLBACK;

-----
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
ROLLBACK;

-----
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

-----
SELECT COUNT(name)
from animals;

SELECT COUNT(name)
from animals
where escape_attempts = 0;

SELECT AVG(weight_kg)
from animals;

SELECT neutered, escape_attempts
from animals
WHERE escape_attempts = (
    SELECT MAX(escape_attempts)
    from animals
  );

SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals group by species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth >= '1990-01-01' and date_of_birth <= '2000-12-31'
GROUP BY species;

SELECT animals.name FROM animals 
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals 
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon'; 

SELECT animals.name, owners.full_name
FROM animals 
RIGHT JOIN owners ON animals.owners_id = owners.id;


SELECT species.name, COUNT(animals.name) AS number_of_animals
FROM animals 
JOIN species ON animals.species_id = species.id 
GROUP BY species.name;

SELECT animals.name
FROM animals 
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owners_id = owners.id 
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name
FROM animals 
JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) AS number_of_animals 
FROM animals 
JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name 
ORDER BY COUNT(animals.name) DESC LIMIT 1;

-- Thursday

SELECT animals.name, visit_date
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visit_date DESC LIMIT 1


SELECT COUNT(DISTINCT animals_id)
FROM visits
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT DISTINCT vets.name
FROM specializations
RIGHT JOIN vets ON specializations.vets_id = vets.id;

SELECT animals.name, visit_date
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND
visits.visit_date BETWEEN '2020-04-01' and '2020-08-30'


SELECT count(animals_id) as amount_of_visits, animals.name
FROM visits
JOIN animals
ON animals.id = visits.animals_id
GROUP BY animals_id, animals.name
ORDER BY COUNT(animals_id) DESC LIMIT 1;

SELECT animals.name, visit_date
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visit_date LIMIT 1;

SELECT animals.id as animal_id,
animals.name as animal_name,
vets.id as vet_id,
vets.name as vet_name, visit_date
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON visits.vets_id = vets.id
ORDER BY visit_date LIMIT 1;

SELECT count(animals.name)
FROM visits
JOIN animals 
ON animals.id = visits.animals_id
JOIN specializations
ON specializations.vets_id = visits.vets_id
where animals.species_id <> specializations.species_id

SELECT species.name 
FROM visits 
JOIN vets 
ON visits.vets_id = vets.id
join animals on animals.id = visits.animals_id
join species on species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals_id, species.name
ORDER BY COUNT(animals_id) DESC LIMIT 1