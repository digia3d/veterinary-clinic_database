SELECT * FROM animals WHERE Name like '%mon';

SELECT * FROM animals WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';

SELECT * FROM animals WHERE Escape_attempts < 3 AND Neutered = 'true';

SELECT * FROM animals WHERE Name = 'Agumon' OR Name = 'Pikachu';

SELECT Name, Escape_attempts FROM animals where weight_kg > 10.5;

SELECT * FROM animals WHERE Neutered = 'true';

SELECT * FROM animals WHERE Name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
