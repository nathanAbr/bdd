--INSERT INTO client (nom, prenom, email) VALUES
--	('ABRAHAM', 'Nathan', 'lol@lol.lol'),
--	('JUNG', 'Jean-François', 'jfjung@pourquoi.qui'),
--	('TANCHETTE', 'Vecteur', 'math.vecteur@cosinus.sup');

INSERT INTO commande (rue, cp, ville, id_client) VALUES
	('22 RUE DU BIGNON', '44 840', 'Les sorinière', 3);

INSERT INTO ligne_commande VALUES
	(4, 3, 12),
	(6, 3, 10),
	(7, 3, 13);