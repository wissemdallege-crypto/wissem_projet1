--1. La réceptionniste veut une liste de tous les clients, triée par nom de famille.

SELECT * FROM Client
ORDER BY nom ASC;
--2. Elle veut aussi la liste des vétérinaires qui travaillent à la clinique Rive-Nord.

SELECT v.*,i.nom AS Nom_clinique
FROM Veterinaire AS v
INNER JOIN Clinique AS i ON i.id_clinique=v.id_clinique
WHERE I.nom='Rive-Nord';
--3. Un client rappelle pour savoir tous les rendez-vous prévus après le 1er avril 2026.

SELECT *
FROM RendezVous
WHERE date_heure >= '2026-04-02 00:00:00.000'
--4. Un client rappelle pour savoir tous les rendez-vous prévus après le 1er avril 2026.

SELECT *
FROM Acte_medical
WHERE cout_standard>200;

--5. Pour la tournée du lendemain, on veut une liste de tous les rendez-vous à venir montrant le nom de l'animal, son espèce, le nom du vétérinaire
--assigné et la date du rendez-vous.

SELECT rv.*,a.nom AS nom_animal,a.espece,v.nom AS nom_veterinaire
FROM RendezVous AS rv
INNER JOIN Animal AS a ON a.id_animal= rv.id_animal
INNER JOIN Veterinaire AS v ON v.id_Veterinaire=rv.id_veterinaire
WHERE rv.statut = 'Planifié';

--6. La direction veut la liste de tous les clients avec le nom de leurs animaux — y compris les clients qui n'ont encore aucun animal enregistré, pour
--identifier les dossiers incomplets.

SELECT c.* , a.nom AS Nom_animal
FROM Client AS c
LEFT JOIN Animal AS a ON a.id_client=c.id_client

--7. Pour un rapport de formation, on veut la liste de chaque vétérinaire avec le nom de toutes ses spécialités.

SELECT v.*,s.nom_specialite AS Nom_specialite
FROM Veterinaire AS v
LEFT JOIN veterinaire_specialite AS vs ON vs.id_Veterinaire=v.id_Veterinaire
LEFT JOIN Specialite AS s ON s.id_Specialite=vs.id_specialite
ORDER BY v.nom;

--8. Pour la facturation d'un rendez-vous donné, on veut voir la liste des actes réalisés lors de ce rendez-vous avec leur coût réel.
-- j ai propose deux solution 
-- la premiere est de donner toute la liste des rendez vouz avec leurs cout reelle

SELECT rv.id_rendez_vous,am.*,ra.cout_reel
FROM RendezVous AS rv
INNER JOIN RendezVous_Act AS ra ON ra.id_rendez_vous=rv.id_rendez_vous
INNER JOIN Acte_medical AS am ON am.id_act=ra.id_act;

-- deuxieme :Si on veux chercher par rendez vous precis on ajoute l instruction WHERE ra.id_rendez_vous = 1
-- ici on donne le cout reel pour chaque rendez vous souhaiter l avoir 

SELECT rv.id_rendez_vous,am.*,ra.cout_reel
FROM RendezVous AS rv
INNER JOIN RendezVous_Act AS ra ON ra.id_rendez_vous=rv.id_rendez_vous
INNER JOIN Acte_medical AS am ON am.id_act=ra.id_act
WHERE ra.id_rendez_vous = 2;

--9. La direction cherche à identifier les vétérinaires qui n'ont jamais eu de rendez-vous annulé à leur dossier.

SELECT * 
FROM Veterinaire
WHERE id_veterinaire NOT IN (
    SELECT id_veterinaire 
    FROM RendezVous 
    WHERE statut = 'Annulé'
);

--10. Combien de rendez-vous chaque vétérinaire a-t-il pris en charge, du plus occupé au moins occupé ?

SELECT v.nom,COUNT(rv.id_Veterinaire) AS Nombre_rendez_vouz
FROM Veterinaire AS v
LEFT JOIN RendezVous AS rv ON v.id_Veterinaire= rv.id_veterinaire
GROUP BY v.nom,v.id_Veterinaire
ORDER BY  Nombre_rendez_vouz DESC;

--11. Quel est le revenu total généré par chaque type d'acte médical, uniquement pour les actes ayant généré plus de 500 $ au total ?

SELECT am.nom_act, SUM(rv.cout_reel) AS Revenu_total_par_Act
FROM Acte_medical AS am
INNER JOIN RendezVous_Act AS rv ON am.id_act=rv.id_act
GROUP BY am.nom_act
HAVING SUM(rv.cout_reel)> 500.00
ORDER BY Revenu_total_par_Act DESC ;

--12. Quels vétérinaires ont réalisé plus de 3 actes au total ?


SELECT 
    v.id_veterinaire,
    v.nom AS nom_veterinaire,
    COUNT(ra.id_act) AS Total_act
FROM Veterinaire v
INNER JOIN RendezVous rv ON v.id_veterinaire = rv.id_veterinaire
INNER JOIN RendezVous_Act ra ON rv.id_rendez_vous = ra.id_rendez_vous
GROUP BY v.id_veterinaire, v.nom
HAVING COUNT(ra.id_act) > 3;

--13. Quels clients ont dépensé, au total, plus que la moyenne de tous les clients ?
WITH DepensesParClient AS (
    SELECT 
        c.id_client,
        c.nom,
        ISNULL(SUM(ra.cout_reel), 0) AS total_depense
    FROM Client c
    LEFT JOIN Animal a ON c.id_client = a.id_client
    LEFT JOIN RendezVous r ON a.id_animal = r.id_animal
    LEFT JOIN RendezVous_Act ra ON r.id_rendez_vous = ra.id_rendez_vous
    GROUP BY c.id_client, c.nom
)
SELECT id_client, nom, total_depense
FROM DepensesParClient
WHERE total_depense > (SELECT AVG(total_depense) FROM DepensesParClient);

--14. Quels animaux ont déjà subi un acte de type « Chirurgie » ?

SELECT DISTINCT 
    a.id_animal,
    a.nom AS nom_animal,
    a.espece,
    am.nom_act
FROM Animal a
INNER JOIN RendezVous r ON a.id_animal = r.id_animal
INNER JOIN RendezVous_Act ra ON r.id_rendez_vous = ra.id_rendez_vous
INNER JOIN Acte_medical am ON ra.id_act = am.id_act
WHERE am.nom_act LIKE '%Chirurgie%';