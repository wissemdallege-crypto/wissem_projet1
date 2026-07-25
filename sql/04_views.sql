--1. La réceptionniste consulte constamment l'historique complet d'un animal (ses rendez-vous passés, les actes effectués, les coûts et les vétérinaires
--impliqués) pour répondre aux clients au téléphone. Créez une vue qui lui évite de reconstruire cette requête à chaque fois.

CREATE VIEW vw_Historique_Animal AS
SELECT 
    a.id_animal,
    a.nom AS nom_animal,
    a.espece,
    c.nom AS nom_client,
    rv.id_rendez_vous,
    rv.date_heure,
    rv.motif,
    rv.statut,
    v.nom AS nom_veterinaire,
    am.nom_act,
    ra.cout_reel
FROM Animal AS a 
INNER JOIN RendezVous AS rv ON rv.id_animal = a.id_animal
INNER JOIN RendezVous_Act AS ra ON ra.id_rendez_vous = rv.id_rendez_vous
INNER JOIN Acte_medical AS am ON am.id_act = ra.id_act
INNER JOIN Veterinaire AS v ON v.id_Veterinaire = rv.id_veterinaire
INNER JOIN Client AS c ON c.id_client = a.id_client;


SELECT * FROM vw_Historique_Animal
--2. La direction veut pouvoir consulter en un coup d'oeil le revenu total généré par chaque clinique, sans avoir à relancer une requête d'agrégation à
--chaque fois. Créez une vue à cet effet.

CREATE VIEW vw_revenu_total_par_clinique AS

SELECT c.nom AS Clinique , SUM(ra.cout_reel) AS Revenu_total
FROM Clinique AS c 
LEFT JOIN Veterinaire AS v ON c.id_clinique=v.id_clinique
LEFT JOIN RendezVous AS rv ON rv.id_veterinaire=v.id_Veterinaire
LEFT JOIN RendezVous_Act AS ra ON ra.id_rendez_vous=rv.id_rendez_vous
GROUP BY c.nom,c.id_clinique;