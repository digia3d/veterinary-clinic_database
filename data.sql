INSERT INTO animals
  (ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg )
VALUES
  (1 , 'Agumon', '2020-02-03', 0, 'true', '10.23'),
  ( 2, 'Gabumon', '2018-11-15', 2, 'true', '8' ),
  ( 3, 'Pikachu', '2021-01-7', 1, 'true', '15.04' ),
  ( 4, 'Devimon', '2017-05-12', 5, 'true', '1' ),
  ( 5, 'Charmander', '2020-02-8', 0, 'false', '-11' ),
  ( 6, 'Plantmon', '2021-11-15', 2, 'true', '-5.7' ),
  ( 7, 'Squirtle', '1993-04-2', 3, 'true', '-12.13' ),
  ( 8, 'Angemon', '2005-06-12', 1, 'true', '-45' ),
  ( 9, 'Boarmon', '2005-06-7', 7, 'true', '20.4' ),
  ( 10, 'Blossom', '1998-10-13', 3, 'true', '17' ),
  ( 11, 'Ditto', '2022-05-14', 4, 'true', '22' );

/* After adding column Species */
UPDATE animals SET species = 'unspecified';

INSERT INTO animals
  (ID, Name, Date_of_birth, Escape_attempts, Neutered, Weight_kg , Species )
VALUES
  (1 , 'Agumon', '2020-02-03', 0, 'true', '10.23', 'unspecified' ),
  ( 2, 'Gabumon', '2018-11-15', 2, 'true', '8', 'unspecified'  ),
  ( 3, 'Pikachu', '2021-01-7', 1, 'true', '15.04' , 'unspecified' ),
  ( 4, 'Devimon', '2017-05-12', 5, 'true', '1', 'unspecified'  ),
  ( 5, 'Charmander', '2020-02-8', 0, 'false', '-11', 'unspecified'  ),
  ( 6, 'Plantmon', '2021-11-15', 2, 'true', '-5.7', 'unspecified'  ),
  ( 7, 'Squirtle', '1993-04-2', 3, 'true', '-12.13', 'unspecified'  ),
  ( 8, 'Angemon', '2005-06-12', 1, 'true', '-45', 'unspecified'  ),
  ( 9, 'Boarmon', '2005-06-7', 7, 'true', '20.4', 'unspecified'  ),
  ( 10, 'Blossom', '1998-10-13', 3, 'true', '17', 'unspecified'  ),
  ( 11, 'Ditto', '2022-05-14', 4, 'true', '22', 'unspecified' );

UPDATE animals SET Species = 'digimon' WHERE Name like '%mon';

UPDATE animals SET Species = 'pokemon' WHERE Species = 'unspecified';

INSERT INTO owners
  (id,full_name, age)
VALUES
  (1,'Sam Smith ', 34),
  (2,'Jennifer Orwell', 19 ),
  (3,'Bob', 45 ),
  (4,'Melody Pond', 77 ),
  (5,'Dean Winchester', 14 ),
  (6,'Jodie Whittaker', 38 );
  
INSERT INTO species
  (id,name)
VALUES
  (1,'Pokemon'),
  (2,'Digimon');

UPDATE animals SET species_id = (SELECT id
FROM species
WHERE name = 'Digimon') WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id
FROM species
WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';


UPDATE animals SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = (SELECT id
FROM owners
WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets 
( name, age, date_of_graduation )
VALUES 
( 'Vet William Tatcher', 45, 'Apr 23, 2000' ),
( 'Vet Maisy Smith', 26, 'Jan 17, 2019' ),
( 'Vet Stephanie Mendez', 64, 'May 4, 1981' ),
( 'Vet Jack Harkness', 38, 'Jun 8, 2008' );

BEGIN TRANSACTION;
INSERT INTO specializations (vets_id, species_id) VALUES (1, 1),(3, 1),(3, 2),(4, 2);
COMMIT TRANSACTION;