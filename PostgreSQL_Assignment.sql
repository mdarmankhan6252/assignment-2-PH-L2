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
        conservation_status IN ('Endangered', 'Vulnerable')
    )
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers (ranger_id) ON DELETE CASCADE,
    species_id INTEGER REFERENCES species (species_id) ON DELETE CASCADE,
    sighting_time DATE,
    location VARCHAR(150) NOT NULL,
    notes TEXT
);


---rangers data

INSERT INTO rangers (name, region) VALUES
('Meera Sen', 'Northern Highlands'),
('Rajiv Balan', 'Eastern Grasslands'),
('Aisha Khan', 'Mangrove Coastline'),
('Kiran Das', 'Western Savannah'),
('Neha Sharma', 'Mountain Ridge Forest'),
('Anil Kapoor', 'Delta Wetlands'),
('Priya Mehta', 'Southern Rainforest'),
('Ravi Joshi', 'Eastern Plateau'),
('Farhan Ali', 'Arid Rocklands'),
('Divya Nair', 'Central Bamboo Forest'),
('Suresh Reddy', 'Pine Valley'),
('Lakshmi Iyer', 'Riverbend Sanctuary'),
('Manoj Pillai', 'Foggy Hills National Park'),
('Sneha Roy', 'Coral Reef Reserve'),
('Tarun Verma', 'Windy Desert Edge'),
('Pooja Sinha', 'Western Wetlands'),
('Aditya Rao', 'Lakeview Range'),
('Nisha Kapoor', 'Orchid Valley'),
('Varun Jain', 'Sunset Savannah'),
('Alisha Thomas', 'Cloud Forest Perimeter');

-- species data

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Shadow Leopard', 'Panthera pardus noctis', '1894-06-15', 'Endangered'),
('Golden Langur', 'Trachypithecus geei', '1953-03-02', 'Vulnerable'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-05-08', 'Endangered'),
('Indian Pangolin', 'Manis crassicaudata', '1822-09-14', 'Vulnerable'),
('Red Panda', 'Ailurus fulgens', '1825-12-01', 'Endangered'),
('Snow Leopard', 'Panthera uncia', '1775-07-22', 'Endangered'),
('Asiatic Lion', 'Panthera leo persica', '1826-10-10', 'Endangered'),
('Sloth Bear', 'Melursus ursinus', '1791-11-17', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-03-29', 'Endangered'),
('Indian Star Tortoise', 'Geochelone elegans', '1831-01-26', 'Vulnerable'),
('Great Indian Bustard', 'Ardeotis nigriceps', '1861-04-03', 'Endangered'),
('Indian Wolf', 'Canis lupus pallipes', '1832-07-13', 'Endangered'),
('Himalayan Monal', 'Lophophorus impejanus', '1790-08-04', 'Vulnerable'),
('Malabar Civet', 'Viverra civettina', '1862-05-21', 'Endangered'),
('Blackbuck', 'Antilope cervicapra', '1758-02-17', 'Vulnerable'),
('Nicobar Megapode', 'Megapodius nicobariensis', '1840-06-30', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '1827-10-22', 'Vulnerable'),
('Rusty-spotted Cat', 'Prionailurus rubiginosus', '1831-12-12', 'Vulnerable'),
('Nilgiri Tahr', 'Nilgiritragus hylocrius', '1841-09-19', 'Endangered'),
('Indian Cobra', 'Naja naja', '1758-03-10', 'Vulnerable');


-- sightings data

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 3, '2024-12-02', 'Northern Highlands - Sector A', 'Tracks found near waterhole'),
(2, 1, '2024-11-28', 'Eastern Grasslands - Trail 5', 'Seen resting under shade'),
(3, 5, '2025-01-05', 'Mangrove Coastline - Estuary', 'Swimming near the banks'),
(4, 2, '2024-10-21', 'Western Savannah - Ridge Area', 'Group of three spotted'),
(5, 7, '2025-02-10', 'Mountain Ridge Forest - West Slope', 'Roaring heard, no visual'),
(6, 4, '2025-03-14', 'Delta Wetlands - Island Patch', 'Footprints and broken shrubs'),
(7, 6, '2024-09-12', 'Southern Rainforest - South Loop', 'Seen from observation tower'),
(8, 3, '2024-12-25', 'Eastern Plateau - Watchpoint 2', 'Brief visual confirmation'),
(9, 9, '2025-04-03', 'Arid Rocklands - Cave Entrance', 'Sheltering from heat'),
(10, 8, '2025-03-30', 'Central Bamboo Forest - East Path', 'Eaten foliage spotted'),
(11, 5, '2025-05-02', 'Pine Valley - Northern Trail', 'Quick movement through trees'),
(12, 10, '2025-01-22', 'Riverbend Sanctuary - Marsh Edge', 'Calls heard, possibly mating'),
(13, 2, '2025-02-18', 'Foggy Hills - High Ridge', 'Spotted briefly in mist'),
(14, 1, '2025-03-05', 'Coral Reef Reserve - Lagoon Area', 'Seen swimming gracefully'),
(15, 4, '2025-03-28', 'Windy Desert Edge - Rock Cluster', 'Seen near burrow'),
(16, 6, '2024-12-11', 'Western Wetlands - Observation Deck', 'Noticed resting on log'),
(17, 7, '2025-04-08', 'Lakeview Range - Cliffside Trail', 'Observed with binoculars'),
(18, 10, '2025-05-11', 'Orchid Valley - Lower Grove', 'Nocturnal movement recorded'),
(19, 8, '2025-02-14', 'Sunset Savannah - South Boundary', 'Pair seen hunting'),
(20, 9, '2025-01-17', 'Cloud Forest Perimeter - Fogline', 'Camera trap capture confirmed');


SELECT * FROM rangers;







