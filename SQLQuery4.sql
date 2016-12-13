CREATE TABLE categorie(
	id INT IDENTITY PRIMARY KEY,
	libelle VARCHAR(50)
);

CREATE TABLE produit(
	id INT IDENTITY PRIMARY KEY,
	nom VARCHAR(50),
	code CHAR(5) UNIQUE,
	id_categorie INT,
	CONSTRAINT id_categorie_fk
		FOREIGN KEY (id_categorie)
		REFERENCES categorie (id)
);

INSERT INTO categorie VALUES
	('Adultes'),
	('Enfants'),
	('Jouets');

INSERT INTO produit VALUES
	('Vibromasseur portatif','00001' ,1),
	('Peluche Mickey' ,'00002' ,1),
	('Canard Vibrant','00003' ,2),
	('Peluche Minnie','00004' ,2),
	('Voiture Cars','00005' ,3),
	('Pate à modeler','00006' ,3);
	