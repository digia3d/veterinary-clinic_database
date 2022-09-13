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
