CREATE TABLE client(
	nom VARCHAR (20),
	prenom VARCHAR (20),
	email VARCHAR (100),
	id INT IDENTITY PRIMARY KEY
);

CREATE TABLE commande(
	id INT IDENTITY PRIMARY KEY,
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
	nbProduit INT DEFAULT 1,
	CONSTRAINT id_produit_commande_pk
		PRIMARY KEY (id_produit, id_commande),
	CONSTRAINT id_produit_fk
		FOREIGN KEY (id_produit)
		REFERENCES produit (id),
	CONSTRAINT id_commande_fk
		FOREIGN KEY (id_commande)
		REFERENCES commande (id)
);

INSERT INTO client (nom, prenom, email) VALUES
	('ABRAHAM', 'Nathan', 'lol@lol.lol'),
	('JUNG', 'Jean-François', 'jfjung@pourquoi.qui'),
	('TANCHETTE', 'Vecteur', 'math.vecteur@cosinus.sup');

INSERT INTO commande (rue, cp, ville, id_client) VALUES
	('RUE DE LA GAUDINIERE', '44 300', 'Nantes', 1);

INSERT INTO ligne_commande VALUES
	(1, 1, 10),
	(4, 1, 3),
	(2, 1, 1);