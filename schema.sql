CREATE TABLE animals (
    ID int,
    Name varchar(100),
    Date_of_birth date,
    Escape_attempts int,
    Neutered boolean,
    Weight_kg decimal,
    PRIMARY KEY (ID)
);


ALTER TABLE animals
ADD Species varchar(100);
ALTER TABLE animals DROP COLUMN ID;
ALTER TABLE animals
ADD ID SERIAL PRIMARY KEY;


CREATE TABLE owners (
    ID int,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY (ID)
);
CREATE TABLE species (
    ID int,
    name VARCHAR(100),
    PRIMARY KEY (ID)
);


ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT FK_species_table FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals
ADD CONSTRAINT FK_owners_table FOREIGN KEY(owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);
CREATE TABLE specializations (
    species_id INT,
    vets_id INT,
    FOREIGN kEY (species_id) REFERENCES species(id),
    FOREIGN kEY (vets_id) REFERENCES vets(id),
    PRIMARY kEY (species_id, vets_id)
);



ALTER TABLE owners ADD COLUMN email VARCHAR(120);

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

CREATE INDEX animals_animals_id_desc ON visits(animals_id DESC);
CREATE INDEX vets_id_asc ON visits(vets_id ASC);
CREATE INDEX email_desc ON owners(email DESC);
