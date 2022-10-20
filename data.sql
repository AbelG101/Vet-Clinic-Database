INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values ('Agumon','2020-02-03', 0, '1', 10.23),
	     ('Gabumon','2018-11-15', 2, '1', 8),
	     ('Pikachu','2021-01-7', 1, '0', 15.04),
	     ('Devimon','2017-05-12', 5, '1', 11);

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) 
values ('Charmander','2020-02-08', 0, '1', -11),
	     ('Plantmon','2021-11-15', 2, '1', -5.7),
	     ('Squirtle','1993-04-02', 3, '0', -12.13),
	     ('Angemon','2005-06-12', 1, '1', -45),
			 ('Boarmon','2005-06-07', 7, '1', 20.4),
			 ('Blossom','1998-10-13', 3, '1', 17),
			 ('Ditto','2022-05-14', 4, '1', 22);


INSERT INTO owners (full_name, age) 
VALUES ('sam smith', 34),
	   ('Jennifer Orwell', 19),
	   ('Bob', 45),
	   ('Melody Pond ', 77),
	   ('Dean Winchester ', 14),
	   ('Jodie Whittaker ', 38);

INSERT INTO species (name) 
values ('Pokemon'),
	   ('Digimon');

UPDATE animals SET species_id = 1 WHERE species_id IS null;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';


UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name = 'Pikachu' OR name = 'Gabumon';
UPDATE animals SET owners_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owners_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owners_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '2022-04-23'),
	('Maisy Smith', 26, '2019-01-17'),
	('Stephanie Mendez', 64, '1981-05-04'),
	('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations 
VALUES( 1, 1),
	  ( 1, 3),
	  ( 2, 3),
	  ( 2, 4);

INSERT INTO visits 
VALUES (24, 1, '2020-05-24'),
		(24, 3, '2020-07-22'),
		(25, 4, '2021-02-02'),
		(26, 2, '2020-01-05'),
		(26, 2, '2020-03-08'),
		(26, 2, '2020-05-14'),
		(27, 3, '2021-05-04'),
		(28, 4, '2021-02-24'),
		(29, 2, '2019-12-21'),
		(29, 1, '2020-08-10'),
		(29, 2, '2021-04-07'),
		(30, 3, '2019-09-29'),
		(31, 4, '2020-10-03'),
		(31, 4, '2020-11-04'),
		(32, 2, '2019-01-24'),
		(32, 2, '2019-05-15'),
		(32, 2, '2020-02-27'),
		(32, 2, '2020-08-03'),
		(33, 3, '2020-05-24'),
		(33, 1, '2021-01-11');