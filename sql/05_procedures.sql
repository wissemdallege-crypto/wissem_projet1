-- PROCEDURE
--1
CREATE PROCEDURE sp_CreerRendezVous
    @id_animal INT,
    @id_veterinaire INT,
    @date_heure DATETIME,
    @motif VARCHAR(250)
AS
BEGIN
    -- Vérification si le vétérinaire a déjà un RDV à cette date/heure
    IF EXISTS (
        SELECT 1 
        FROM RendezVous 
        WHERE id_veterinaire = @id_veterinaire 
          AND date_heure = @date_heure
    )
    BEGIN
        PRINT 'Erreur : Le vétérinaire n''est pas disponible à cette date et heure.';
    END
    ELSE
    BEGIN
        -- Insertion du rendez-vous si le vétérinaire est libre
        INSERT INTO RendezVous (date_heure, motif, statut, id_animal, id_veterinaire)
        VALUES (@date_heure, @motif, 'Planifié', @id_animal, @id_veterinaire);
        
        PRINT 'Rendez-vous créé avec succès.';
    END
END;
GO
--2

CREATE PROCEDURE sp_TotalFacture
@id_rendez_vous INT 
AS 
BEGIN
SELECT rv.id_rendez_vous,SUM(ra.cout_reel)AS Total_facture
FROM RendezVous AS rv
LEFT JOIN RendezVous_Act AS ra ON ra.id_rendez_vous=rv.id_rendez_vous
WHERE rv.id_rendez_vous = @id_rendez_vous
GROUP BY rv.id_rendez_vous;


END;
