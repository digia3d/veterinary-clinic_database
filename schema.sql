CREATE TABLE animals
(
    ID int,
    Name varchar(100),
    Date_of_birth date,
    Escape_attempts int,
    Neutered boolean,
    Weight_kg decimal,
    PRIMARY KEY (ID),
);

ALTER TABLE animals ADD Species varchar(100);

ALTER TABLE animals DROP COLUMN ID;
ALTER TABLE animals ADD ID SERIAL PRIMARY KEY;

CREATE TABLE owners
(
    ID int,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY (ID)
);

CREATE TABLE species
(
    ID int,
    full_name VARCHAR(100),
    PRIMARY KEY (ID)
);

ALTER TABLE animals DROP COLUMN species;
SELECT *
FROM animals;

ALTER TABLE animals ADD species_id INT;
SELECT *
FROM animals;

ALTER TABLE animals ADD owner_id INT;
SELECT *
FROM animals;

ALTER TABLE animals ADD CONSTRAINT FK_species_table FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT FK_owners_table FOREIGN KEY(owner_id) REFERENCES owners(id);

