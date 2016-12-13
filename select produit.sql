Select p.nom AS 'Nom du produit', 
	c.libelle 'Catégorie du produit', 
	l.quantiteProduit AS 'Quantité commandée', 
	co.id as 'Numéro de commande', 
	CONCAT(co.rue,' ',co.cp,' ', co.ville) as 'Adresse de livraison', 
	CONCAT(cl.nom,' ',cl.prenom,' ',cl.email) as 'Informations Client' 
FROM categorie c 
	INNER JOIN produit p ON p.id_categorie = c.id 
	INNER JOIN ligne_commande l ON p.id = l.id_produit 
	INNER JOIN commande co ON l.id_commande = co.id 
	INNER JOIN client cl ON cl.id = co.id_client 
ORDER BY co.id

SELECT co.id as 'Numéro de commande',
	CONCAT(co.rue,' ',co.cp,' ', co.ville) as 'Adresse de livraison', 
	CONCAT(cl.nom,' ',cl.prenom,' ',cl.email) as 'Informations Client'
FROM commande co
	INNER JOIN client cl ON cl.id = co.id_client
	INNER JOIN ligne_commande l ON l.id_commande = co.id
GROUP BY co.id, CONCAT(co.rue,' ',co.cp,' ', co.ville), CONCAT(cl.nom,' ',cl.prenom,' ',cl.email)
HAVING SUM(l.quantiteProduit) BETWEEN 10 AND 15
