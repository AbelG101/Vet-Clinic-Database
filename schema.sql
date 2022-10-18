create table animals (
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered bit,
    weight_kg float
)
ALTER TABLE animals ADD species VARCHAR(100);