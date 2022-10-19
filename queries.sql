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