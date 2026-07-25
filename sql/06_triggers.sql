CREATE TRIGGER trg_audit_cout
ON RendezVous_Act
AFTER UPDATE
AS
BEGIN
-- VERIFIER SI LE COUT REEL EST MODIFIE
IF UPDATE(cout_reel)
BEGIN
INSERT INTO Historique_Cout (
id_rendez_vous,
id_act,
ancien_cout,
nouveau_cout,
date_modification
)
SELECT
d.id_rendez_vous,
d.id_act,
d.cout_reel AS ancien_cout,
i.cout_reel AS nouveau_cout,
GETDATE() AS date_modification
FROM deleted AS d
INNER JOIN inserted AS i
ON d.id_rendez_vous = i.id_rendez_vous
AND d.id_act = i.id_act
WHERE d.cout_reel <> i.cout_reel;
END
END;
GO