CREATE TABLE categorie(
	id INT NOT NULL PRIMARY KEY,
	libelle VARCHAR(50)
);

CREATE TABLE produits(
	id INT NOT NULL PRIMARY KEY,
	code CHAR(5) UNIQUE,
	nom VARCHAR(50),
	id_categorie INT,
	CONSTRAINT id_produit_categorie_fk
		FOREIGN KEY (id_categorie)
		REFERENCES categorie (id)
);