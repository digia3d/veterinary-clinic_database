SELECT * FROM animals WHERE Name like '%mon';

SELECT * FROM animals WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';

SELECT * FROM animals WHERE Escape_attempts < 3 AND Neutered = 'true';

SELECT * FROM animals WHERE Name = 'Agumon' OR Name = 'Pikachu';

SELECT Name, Escape_attempts FROM animals where weight_kg > 10.5;

SELECT * FROM animals WHERE Neutered = 'true';

SELECT * FROM animals WHERE Name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

UPDATE animals SET Species = 'Unspecified';

UPDATE animals SET Species = 'digimon' WHERE Name like '%mon';

UPDATE animals SET Species = 'pokemon' WHERE Species = 'Unspecified';

BEGIN TRANSACTION;

SAVEPOINT save_point;

DELETE FROM animals WHERE Date_of_birth > '2022-01-01';

ROLLBACK;

BEGIN TRANSACTION;

SAVEPOINT save_point;

UPDATE animals SET Weight_kg = Weight_kg * -1;

ROLLBACK;

BEGIN TRANSACTION;

UPDATE animals SET Weight_kg = Weight_kg * -1 WHERE Weight_kg < 0;

COMMIT TRANSACTION;

SELECT COUNT(*) AS Total_number_of_animals FROM animals;

SELECT COUNT( Escape_attempts ) AS Nice_animals FROM animals WHERE Escape_attempts = 0;

SELECT AVG(Weight_kg) AS Awerage_weight FROM animals;

SELECT Name, weight_kg FROM animals WHERE weight_kg = ( SELECT MAX(weight_kg) FROM animals ) OR weight_kg = ( SELECT MIN(weight_kg) FROM animals );

SELECT AVG(Escape_attempts) AS Awerage_escape_attempts FROM animals WHERE Date_of_birth >= '1990-01-01' AND Date_of_birth <= '2000-01-01';