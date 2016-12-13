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