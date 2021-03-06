DROP TABLE IF EXISTS compte CASCADE;
DROP TABLE IF EXISTS mission CASCADE;
DROP TABLE IF EXISTS photo CASCADE;
DROP TABLE IF EXISTS participer CASCADE;
DROP TABLE IF EXISTS avoir CASCADE; 
DROP TABLE IF EXISTS missionEnded CASCADE;
DROP TABLE IF EXISTS validatePhoto CASCADE;
DROP TABLE IF EXISTS photoPath CASCADE;
DROP TABLE IF EXISTS iBeacons CASCADE;

-- Table compte
CREATE TABLE compte(
	id_compte			SERIAL PRIMARY KEY ,
	name_compte			Varchar(35) ,
	identifier_compte	Varchar(60) ,
	points_compte		Int ,
	url_compte			Varchar(100) ,
	UNIQUE (identifier_compte )
);

-- Table mission
CREATE TABLE mission(
	id_mission			SERIAL PRIMARY KEY ,
	name_mission		Varchar(35)
);

-- Table photo
CREATE TABLE photo(
	id_photo			SERIAL PRIMARY KEY ,
	name_photo			Varchar(35) ,
	description_photo	Varchar(35) ,
	points_photos		Int
);

-- Table de relation participer
CREATE TABLE participer(
	id_compte 			Int NOT NULL ,
	id_mission 			Int NOT NULL ,
	PRIMARY KEY (id_compte ,id_mission )
);

-- Table de relation avoir
CREATE TABLE avoir(
	id_photo			Int NOT NULL ,
	id_mission			Int NOT NULL ,
	PRIMARY KEY (id_photo ,id_mission )
);

-- Table finished mission
CREATE TABLE missionEnded(
	id_missionEnded		SERIAL PRIMARY KEY,
	id_compte 			Int ,
	id_mission 			Int ,
	date_missionEnded	Varchar(50)
);

-- Table photo validées (remplie quand une photo est validée)
CREATE TABLE validatePhoto(
	id_validatePhoto	SERIAL PRIMARY KEY ,
	id_compte 			Int ,
	id_mission 			Int ,
	id_photo 			Int ,
	date_validatePhoto	Varchar(50)

);

-- Table de relation entre le compte et une photo enregistrée
CREATE TABLE photoPath(
	id_path			SERIAL PRIMARY KEY ,
	id_compte 		Int ,
	id_mission 		Int ,
	name_photo 		Varchar(35) ,
	path_photo 		Varchar(100) ,
	latitude_photo	double precision ,
	longitude_photo double precision  
);

-- Table iBeacons
CREATE TABLE ibeacons(
	id_ibeacons 	SERIAL PRIMARY KEY ,
	name 		 	Varchar(35) ,
	uuid_ibeacons	Varchar(35) ,
	minor			Int ,
	major			Int
);

-- Alter Table
ALTER TABLE participer ADD CONSTRAINT FK_participer_id_compte FOREIGN KEY (id_compte) REFERENCES compte(id_compte);
ALTER TABLE participer ADD CONSTRAINT FK_participer_id_mission FOREIGN KEY (id_mission) REFERENCES mission(id_mission);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_photo FOREIGN KEY (id_photo) REFERENCES photo(id_photo);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_mission FOREIGN KEY (id_mission) REFERENCES mission(id_mission);

-- Ajout de données pour test
INSERT INTO compte(name_compte, identifier_compte, points_compte) VALUES
('babar', 'UID1', 0);

INSERT INTO mission(name_mission) VALUES('mission1');

INSERT INTO photo(name_photo, description_photo, points_photos) VALUES 
('dog', 'photo de chien', 10),
('cat', 'photo de chat', 10),
('elephant', 'un jolie elephant', 30);

INSERT INTO participer (id_compte, id_mission) VALUES 
 (1,1);

INSERT INTO avoir (id_photo, id_mission) VALUES 
(1, 1),
(2, 1),
(3, 1);