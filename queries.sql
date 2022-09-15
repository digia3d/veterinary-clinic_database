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

/* Join tables for visits questions */

/* Who was the last animal seen by William Tatcher? */
SELECT animals.name, visits.date_of_visit AS last_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
GROUP BY animals.name, visits.date_of_visit
ORDER BY last_visit DESC LIMIT 1;

/*How many different animals did Stephanie Mendez see? */
SELECT COUNT(DISTINCT visits.animals_id) FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties. */
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN species ON species.id = specializations.species_id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */
SELECT animals.name, visits.date_of_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN 'Apr 1, 2020' AND 'Aug 30, 2020';

/* What animal has the most visits to vets? */
SELECT animals.name, COUNT(visits.animals_id) AS visit_count FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name, visits.animals_id;

/* Who was Maisy Smith's first visit? */
SELECT animals.name, visits.date_of_visit AS first_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name, visits.date_of_visit
ORDER BY first_visit LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */
SELECT * FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(visits.animals_id) FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN specializations ON specializations.vets_id = vets.id
WHERE specializations.species_id <> animals.species_id;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
SELECT species.name, COUNT(visits.animals_id) AS species_count FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY species_count DESC LIMIT 1;

