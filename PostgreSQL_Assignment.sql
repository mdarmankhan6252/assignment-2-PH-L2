-- Active: 1747416681890@@127.0.0.1@5432@assignment2db
CREATE DATABASE assignment2db;

CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(200)
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50) CHECK (
        conservation_status IN ('Endangered', 'Vulnerable', 'Historic' )
    )
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    species_id INTEGER REFERENCES species (species_id) ON DELETE CASCADE,
    sighting_time TIMESTAMP,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);

DROP TABLE rangers;



INSERT INTO rangers ( name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);




SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;



--problem - 1: 

INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');


--problem - 2: 

SELECT COUNT(DISTINCT  species_id) AS unique_species_count FROM sightings;

--problem - 3:

SELECT * FROM sightings WHERE location ILIKE '%Pass%';


--problem - 4:

SELECT name, COUNT(sighting_id) AS total_sightings  
FROM rangers AS r
LEFT JOIN sightings AS s ON r.ranger_id = s.ranger_id GROUP BY r.name;



--problem - 5:

SELECT common_name 
FROM species
WHERE species_id NOT IN(
    SELECT DISTINCT species_id FROM sightings
);

--problem - 6:

SELECT common_name, sighting_time, name
FROM sightings 
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;


--problem - 7:

UPDATE species SET conservation_status = 'Historic' 
WHERE EXTRACT(YEAR FROM discovery_date) < 1800 ;


--problem - 8:

SELECT sighting_id, CASE
WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS time_of_day
FROM sightings;



--problem - 9:

-- DELETE FROM rangers
-- WHERE NOT EXISTS (
--     SELECT 1 FROM sightings WHERE sightings.ranger_id = rangers.ranger_id
-- );




