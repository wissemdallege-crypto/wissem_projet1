--Insertion des Cliniques
INSERT INTO Clinique (nom, adresse, telephone) VALUES
('Rive-Nord', '123 boul. des Laurentides, Laval', '450-555-1000'),
('Centre-Ville', '456 rue Sainte-Catherine, Montréal', '514-555-2000'),
('Rive-Sud', '789 boul. Taschereau, Longueuil', '450-555-3000');

--Insertion des Spécialités
INSERT INTO Specialite (nom_specialite) VALUES
('Chirurgie'),
('Dermatologie'),
('Cardiologie'),
('Médecine interne'),
('Dentisterie');

--Insertion des Vétérinaires
INSERT INTO Veterinaire (nom, num_permis, date_embauche, id_clinique) VALUES
('Dr. Marc Gagnon', 'V-10234', '2015-03-10', 1),    
('Dr. Nathalie Bélanger', 'V-11023', '2016-01-20', 1),
('Dr. Julien Fortin', 'V-11689', '2014-11-05', 1),   
('Dr. Caroline Lavoie', 'V-12256', '2018-12-01', 1),  
('Dr. Isabelle Lefebvre', 'V-10456', '2017-06-01', 2),
('Dr. Éric Tremblay', 'V-11245', '2019-04-11', 2),   
('Dr. Sophie Gagné', 'V-11890', '2021-02-14', 2),    
('Dr. Simon Pelletier', 'V-12478', '2022-08-19', 2), 
('Dr. Simon Roy', 'V-10789', '2018-09-15', 3),       
('Dr. Mélanie Côté', 'V-11467', '2020-07-23', 3),    
('Dr. Patrick Morin', 'V-12034', '2013-05-30', 3),   
('Dr. Anne Bouchard', 'V-12690', '2026-06-01', 3);   

--Insertion de la table associative Veterinaire_Specialite
INSERT INTO veterinaire_specialite (id_veterinaire, id_specialite) VALUES
-- Marc Gagnon (Chirurgie = 1, Cardiologie = 3)
(1, 1), (1, 3),
-- Nathalie Bélanger (Médecine interne = 4, Dentisterie = 5)
(2, 4), (2, 5),
-- Julien Fortin (Chirurgie = 1)
(3, 1),
-- Caroline Lavoie (Cardiologie = 3, Dermatologie = 2)
(4, 3), (4, 2),
-- Isabelle Lefebvre (Dermatologie = 2)
(5, 2),
-- Éric Tremblay (Cardiologie = 3)
(6, 3),
-- Sophie Gagné (Médecine interne = 4)
(7, 4),
-- Simon Pelletier (Chirurgie = 1)
(8, 1),
-- Simon Roy (Chirurgie = 1)
(9, 1),
-- Mélanie Côté (Dermatologie = 2)
(10, 2),
-- Patrick Morin (Dentisterie = 5)
(11, 5),
-- Anne Bouchard (Médecine interne = 4)
(12, 4);

-- Insertion des Clients
INSERT INTO Client (nom, telephone, courriel) VALUES
('Julie Tremblay', '514-555-2231', 'julie.tremblay@email.com'), 
('Marc Bouchard', '438-555-8890', 'marc.bouchard@email.com'),  
('Sophie Roy', '450-555-4471', 'sophie.roy@email.com'),        
('Pierre Gagnon', '514-555-6623', 'pierre.gagnon@email.com'),   
('Marie Lefebvre', '450-555-7734', 'marie.lefebvre@email.com'), 
('Alexandre Côté', '514-555-9912', 'alexandre.cote@email.com'),  
('Isabelle Morin', '438-555-3345', 'isabelle.morin@email.com'),
('Jean Fortin', '450-555-5567', 'jean.fortin@email.com'),       
('Nathalie Lavoie', '514-555-8890', 'nathalie.lavoie@email.com'),
('Karine Pelletier', '438-555-1123', 'karine.pelletier@email.com');

--Insertion des Animaux
INSERT INTO Animal (nom, espece, race_animal, date_naissance, id_client) VALUES
('Rex', 'Chien', 'Berger Allemand', '2021-06-14', 1), 
('Kimo', 'Chat', 'Siamois', '2022-02-10', 1),        
('Minou', 'Chat', 'Persan', '2019-11-02', 2),       
('Charlie', 'Chat', 'Européen', '2022-01-30', 2),    
('Bella', 'Chien', 'Labrador', '2020-08-19', 3),    
('Nala', 'Chien', 'Husky', '2021-11-30', 3),         
('Max', 'Chien', 'Beagle', '2023-05-01', 4),          
('Filou', 'Chien', 'Bouledogue', '2020-10-05', 4),   
('Luna', 'Chat', 'Maine Coon', '2021-09-12', 5),     
('Buddy', 'Chien', 'Golden Retriever', '2018-12-25', 6), 
('Oscar', 'Chat', 'Sphynx', '2022-06-19', 6),        
('Milo', 'Chat', 'Bengal', '2020-03-18', 7),         
('Coco', 'Lapin', 'Lapin nain', '2022-07-07', 8),     
('Duchesse', 'Chien', 'Caniche', '2019-04-22', 9),   
('Simba', 'Chat', 'Roux', '2023-01-15', 9);

--Actes Médicaux
INSERT INTO Acte_medical (nom_act, cout_standard, duree_standard) VALUES
('Consultation générale', 60.00, 20),      
('Vaccination', 45.00, 15),                 
('Détartrage', 180.00, 45),                 
('Prise de sang', 55.00, 15),               
('Radiographie', 150.00, 30),               
('Chirurgie mineure', 450.00, 60),         
('Chirurgie majeure', 850.00, 120),         
('Consultation dermatologique', 90.00, 25);

--Insertion des Rendez-vous
INSERT INTO RendezVous (date_heure, motif, statut, id_animal, id_veterinaire) VALUES
('2026-03-12 09:00:00', 'Vaccin annuel', 'Complété', 1, 1),       -- (Rex, Dr. Gagnon)
('2026-04-02 10:00:00', 'Détartrage', 'Complété', 1, 1),          -- (Rex, Dr. Gagnon)
('2026-03-15 11:00:00', 'Consultation', 'Complété', 3, 5),        -- (Minou, Dr. Lefebvre)
('2026-03-20 14:00:00', 'Vaccination', 'Complété', 4, 5),         -- (Charlie, Dr. Lefebvre)
('2026-04-10 08:30:00', 'Chirurgie', 'Complété', 5, 1),           -- (Bella, Dr. Gagnon)
('2026-04-15 13:00:00', 'Consultation', 'Complété', 7, 6),        -- (Max, Dr. Tremblay)
('2026-04-18 15:00:00', 'Suivi cardiologique', 'Complété', 9, 4), -- (Luna, Dr. Lavoie)
('2026-05-02 10:00:00', 'Chirurgie', 'Planifié', 10, 3),          -- (Buddy, Dr. Fortin)
('2026-05-05 11:30:00', 'Dermatologie', 'Planifié', 12, 10),      -- (Milo, Dr. Côté)
('2026-05-08 09:00:00', 'Stérilisation', 'Planifié', 2, 9),       -- (Kimo, Dr. Roy)
('2026-05-10 14:00:00', 'Consultation', 'Annulé', 13, 7),         -- (Coco, Dr. Gagné)
('2026-05-12 10:30:00', 'Détartrage', 'Planifié', 14, 4),         -- (Duchesse, Dr. Lavoie)
('2026-05-15 13:30:00', 'Dentisterie', 'Planifié', 15, 11),       -- (Simba, Dr. Morin)
('2026-05-18 09:30:00', 'Radiographie', 'Planifié', 6, 1),        -- (Nala, Dr. Gagnon)
('2026-05-20 15:30:00', 'Consultation', 'Planifié', 11, 8);

--table associative RendezVous_Act
INSERT INTO RendezVous_Act (id_rendez_vous, id_act, cout_reel, duree_reelle) VALUES
-- RDV 1 : Vaccination (45$), Consultation générale (60$)
(1, 2, 45.00, 15),
(1, 1, 60.00, 20),

-- RDV 2 : Détartrage (220$)
(2, 3, 220.00, 45),

-- RDV 3 : Consultation générale (60$), Prise de sang (55$), Radiographie (195$)
(3, 1, 60.00, 20),
(3, 4, 55.00, 15),
(3, 5, 195.00, 30),

-- RDV 4 : Vaccination (65$)
(4, 2, 65.00, 15),

-- RDV 5 : Chirurgie majeure (830$), Consultation générale (60$)
(5, 7, 830.00, 120),
(5, 1, 60.00, 20),

-- RDV 6 : Consultation générale (65$), Prise de sang (55$)
(6, 1, 65.00, 20),
(6, 4, 55.00, 15),

-- RDV 7 : Consultation générale (70$)
(7, 1, 70.00, 20),

-- RDV 8 : Chirurgie mineure (450$)
(8, 6, 450.00, 60),

-- RDV 9 : Consultation dermatologique (95$), Vaccination (65$)
(9, 8, 95.00, 25),
(9, 2, 65.00, 15),

-- RDV 10 : Chirurgie mineure (420$)
(10, 6, 420.00, 60),

-- RDV 11 : Aucun acte (Annulé)

-- RDV 12 : Détartrage (190$)
(12, 3, 190.00, 45),

-- RDV 13 : Détartrage (175$)
(13, 3, 175.00, 45),

-- RDV 14 : Radiographie (160$)
(14, 5, 160.00, 30),

-- RDV 15 : Consultation générale (60$)
(15, 1, 60.00, 20);
