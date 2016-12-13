------------------------------------------------------------------------------------------------
   -- #  # --
------------------------------------------------------------------------------------------------

Select p.nom AS 'Nom du produit', 
	c.libelle 'Cat�gorie du produit', 
	l.quantiteProduit AS 'Quantit� command�e', 
	co.id as 'Num�ro de commande', 
	CONCAT(co.rue,' ',co.cp,' ', co.ville) as 'Adresse de livraison', 
	CONCAT(cl.nom,' ',cl.prenom,' ',cl.email) as 'Informations Client' 
FROM categorie c 
	INNER JOIN produit p ON p.id_categorie = c.id 
	INNER JOIN ligne_commande l ON p.id = l.id_produit 
	INNER JOIN commande co ON l.id_commande = co.id 
	INNER JOIN client cl ON cl.id = co.id_client 
ORDER BY co.id

------------------------------------------------------------------------------------------------
   -- #  # --
------------------------------------------------------------------------------------------------

SELECT co.id as 'Num�ro de commande',
	CONCAT(co.rue,' ',co.cp,' ', co.ville) as 'Adresse de livraison', 
	CONCAT(cl.nom,' ',cl.prenom,' ',cl.email) as 'Informations Client',
	SUM(l.quantiteProduit) as 'Quantit� de produits'
FROM commande co
	INNER JOIN client cl ON cl.id = co.id_client
	INNER JOIN ligne_commande l ON l.id_commande = co.id
GROUP BY co.id, CONCAT(co.rue,' ',co.cp,' ', co.ville), CONCAT(cl.nom,' ',cl.prenom,' ',cl.email)
HAVING SUM(l.quantiteProduit) BETWEEN 15 AND 40

------------------------------------------------------------------------------------------------
           -- # AFFICHAGE PRODUIT QUAND ILS ONT ETE COMMANDE PLUS DE 10 FOIS # --
------------------------------------------------------------------------------------------------

SELECT p.* FROM produit p INNER JOIN ligne_commande l ON p.id = l.id_produit WHERE l.quantiteProduit > 10

------------------------------------------------------------------------------------------------
   -- # AFFICHAGE INFO CLIENT QUAND ILS ONT COMMANDE PLUS DE 10 FOIS LE MEME PRODUITS # --
------------------------------------------------------------------------------------------------

SELECT DISTINCT cl.nom ,cl.prenom ,cl.email
FROM commande co
	INNER JOIN client cl ON cl.id = co.id_client
	INNER JOIN ligne_commande l ON l.id_commande = co.id
WHERE l.quantiteProduit > 10