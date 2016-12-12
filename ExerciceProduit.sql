CREATE TABLE categorie(
	id INT IDENTITY(1,1) PRIMARY KEY,
	libelle VARCHAR(50)
);

CREATE TABLE produits(
	id INT IDENTITY(1,1) PRIMARY KEY,
	code CHAR(5) UNIQUE,
	nomt VARCHAR(50),
	id_categorie INT,
	CONSTRAINT id_produit_categorie_fk
		FOREIGN KEY (id_categorie)
		REFERENCES categorie (id)
);