SELECT p.*, cat.libelle as 'Ma cat�gorie' FROM produit p INNER JOIN categorie cat ON p.id_categorie = cat.id
--SELECT count(p.id) as 'Nombre de produit', cat.libelle as 'Ma cat�gorie' FROM produit p, categorie cat WHERE p.id_categorie = cat.id GROUP BY cat.libelle
--SELECT * FROM produit WHERE id_categorie IN (SELECT id FROM categorie WHERE libelle = 'Adultes')
--SELECT * FROM produit ORDER BY nom