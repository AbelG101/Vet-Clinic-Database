create table animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered bit,
    weight_kg float
)
ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	full_name varchar(100),
	age int
);

CREATE TABLE species (
	id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name varchar(100)
);

ALTER TABLE animals ADD PRIMARY KEY(id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id int;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) 
REFERENCES species(id)
ON DELETE CASCADE;


ALTER TABLE animals 
ADD COLUMN owners_id int;

ALTER TABLE animals
ADD FOREIGN KEY (owners_id) 
REFERENCES owners(id)
ON DELETE CASCADE;