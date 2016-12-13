CREATE TABLE categorie(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	libelle VARCHAR(50)
);

CREATE TABLE produit(
	id INT NOT NULL IDENTITY PRIMARY KEY,
	code CHAR(5) UNIQUE,
	nom VARCHAR(50),
	id_categorie INT,
	CONSTRAINT id_produit_categorie_fk
		FOREIGN KEY (id_categorie)
		REFERENCES categorie (id)
);

CREATE TABLE client(
	nom VARCHAR (20),
	prenom VARCHAR (20),
	email VARCHAR (100),
	id INT IDENTITY PRIMARY KEY NOT NULL
);

CREATE TABLE commande(
	id INT IDENTITY PRIMARY KEY NOT NULL,
	rue VARCHAR (150),
	cp VARCHAR (6),
	ville VARCHAR (50),
	id_client INT NOT NULL,
	CONSTRAINT id_client_fk
		FOREIGN KEY (id_client)
		REFERENCES client (id)
);

CREATE TABLE ligne_commande(
	id_produit INT NOT NULL,
	id_commande INT NOT NULL,
	quantiteProduit INT NOT NULL,
	CONSTRAINT id_produit_commande_pk
		PRIMARY KEY (id_produit, id_commande),
	CONSTRAINT id_produit_fk
		FOREIGN KEY (id_produit)
		REFERENCES produit (id),
	CONSTRAINT id_commande_fk
		FOREIGN KEY (id_commande)
		REFERENCES commande (id)
);
