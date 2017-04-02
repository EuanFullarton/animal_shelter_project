DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  animals_owned VARCHAR(255),
  bio VARCHAR(255),
  capacity_for_animals INT2,
  looking_for VARCHAR(255),
  profile_picture VARCHAR(255)
);

CREATE TABLE animals
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  bio VARCHAR(255),
  ready_for_adoption VARCHAR(255),
  adopted VARCHAR(255),
  adoption_date VARCHAR(255),
  admission_date DATE,
  profile_picture VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL4 PRIMARY KEY,
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE
);