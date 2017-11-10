DROP TABLE IF EXISTS compte CASCADE;
DROP TABLE IF EXISTS mission CASCADE;
DROP TABLE IF EXISTS photo CASCADE;

-- Table compte
CREATE TABLE compte(
	id_compte			SERIAL PRIMARY KEY ,
	name_compte			Varchar(35) ,
	identifier_compte	Varchar(60) ,
	points_compte		Int ,
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

-- Alter Table
ALTER TABLE participer ADD CONSTRAINT FK_participer_id_compte FOREIGN KEY (id_compte) REFERENCES compte(id_compte);
ALTER TABLE participer ADD CONSTRAINT FK_participer_id_mission FOREIGN KEY (id_mission) REFERENCES mission(id_mission);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_photo FOREIGN KEY (id_photo) REFERENCES photo(id_photo);
ALTER TABLE avoir ADD CONSTRAINT FK_avoir_id_mission FOREIGN KEY (id_mission) REFERENCES mission(id_mission);


