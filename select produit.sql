Select p.nom AS 'Nom du produit', 
	c.libelle 'Catégorie du produit', 
	l.quantiteProduit AS 'Quantité commandée', 
	co.id as 'Numéro de commande', 
	concat(co.rue,' ',co.cp,' ', co.ville) , 
	CONCAT(cl.nom,' ',cl.prenom,' ',cl.email) as 'Informations Client' 
FROM categorie c 
	INNER JOIN produit p ON p.id_categorie = c.id 
	INNER JOIN ligne_commande l ON p.id = l.id_produit 
	INNER JOIN commande co ON l.id_commande = co.id 
	INNER JOIN client cl ON cl.id = co.id_client 
ORDER BY co.id