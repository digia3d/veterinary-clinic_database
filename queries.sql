SELECT *
FROM animals
WHERE Name like '%mon';
SELECT *
FROM animals
WHERE Date_of_birth >= '2016-01-01' AND Date_of_birth <= '2019-12-31';
SELECT *
FROM animals
WHERE Escape_attempts < 3 AND Neutered = 'true';
SELECT *
FROM animals
WHERE Name = 'Agumon' OR Name = 'Pikachu';
SELECT Name, Escape_attempts
FROM animals
where weight_kg > 10.5;
SELECT *
FROM animals
WHERE Neutered = 'true';
SELECT *
FROM animals
WHERE Name != 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


UPDATE animals SET Species = 'unspecified';
UPDATE animals SET Species = 'digimon' WHERE Name like '%mon';
UPDATE animals SET Species = 'pokemon' WHERE Species = 'unspecified';


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


SELECT COUNT(*) AS Total_number_of_animals
FROM animals;
SELECT COUNT( Escape_attempts ) AS Nice_animals
FROM animals
WHERE Escape_attempts = 0;
SELECT AVG(Weight_kg) AS Awerage_weight
FROM animals;
SELECT Name, weight_kg
FROM animals
WHERE weight_kg = ( SELECT MAX(weight_kg)
  FROM animals ) OR weight_kg = ( SELECT MIN(weight_kg)
  FROM animals );
SELECT AVG(Escape_attempts) AS Awerage_escape_attempts
FROM animals
WHERE Date_of_birth >= '1990-01-01' AND Date_of_birth <= '2000-01-01';

BEGIN TRANSACTION;
SAVEPOINT save_point;
UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
COMMIT TRANSACTION;

/* Questions from Multiple tables */

/* What animals belong to Melody Pond? */

SELECT name, full_name
FROM animals INNER JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */

SELECT animals.name, species.name
FROM animals INNER JOIN species ON species.id = animals.species_id AND species.name = 'Pokemon';


/* List all owners and their animals, remember to include those that don't own any animal. */

SELECT name AS Animals, full_name AS Owners
FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;

/* How many animals are there per species? */

SELECT COUNT(animals.name) AS Animals_count, species.name AS Specie
FROM animals JOIN species ON animals.species_id = species.id
GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */

SELECT animals.name, species.name
FROM animals INNER JOIN owners ON owners.id = animals.owner_id INNER JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

/* List all animals owned by Dean Winchester that haven't tried to escape. */

SELECT animals.name, animals.escape_attempts
FROM animals INNER JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/* Who owns the most animals? */

SELECT owners.full_name, COUNT(animals.owner_id)
FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.id;


