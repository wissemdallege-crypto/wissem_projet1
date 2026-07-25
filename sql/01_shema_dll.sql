CREATE DATABASE Clinique_Vet
USE Clinique_Vet

-- 1. CLINIQUE
-- ----------------------------------------------------------
CREATE TABLE Clinique (
    id_clinique INT IDENTITY(1,1) PRIMARY KEY,
    nom VARCHAR (50) NOT NULL,
    adresse VARCHAR(100) NOT NULL ,
    telephone VARCHAR (14) NOT NULL ,
  
    
);

-- 2. CLIENT
-- ----------------------------------------------------------
CREATE TABLE Client (
    id_client INT IDENTITY(1,1),
    nom VARCHAR (50) NOT NULL,
    telephone VARCHAR (14) NOT NULL ,
    courriel VARCHAR(100),
    CONSTRAINT pk_client       PRIMARY KEY (id_client)
    
);

-- 2. ANIMAL
-- ----------------------------------------------------------
CREATE TABLE Animal (
    id_animal INT IDENTITY(1,1) ,
    nom VARCHAR (50) NOT NULL,
    espece VARCHAR (30) NOT NULL ,
    race_animal VARCHAR(50),
    date_naissance DATE NOT NULL ,
    id_client INT NOT NULL,
    CONSTRAINT pk_animal       PRIMARY KEY (id_animal),
    CONSTRAINT fk_animal_client FOREIGN KEY (id_client) REFERENCES Client(id_client) 
    ON DELETE CASCADE 
    
);

-- 2. VETERINAIRE
-- ----------------------------------------------------------
CREATE TABLE Veterinaire (
    id_Veterinaire INT IDENTITY(1,1),
    nom VARCHAR (50) NOT NULL,
    num_permis VARCHAR (20) NOT NULL ,
    date_embauche DATE NOT NULL ,
    id_clinique INT NOT NULL,
    CONSTRAINT pk_veterinaire       PRIMARY KEY (id_Veterinaire),
    CONSTRAINT fk_veterinaire_clinique FOREIGN KEY (id_clinique) REFERENCES Clinique(id_clinique) 
 
    
);

-- 2. SPECIALITE
-- ----------------------------------------------------------
CREATE TABLE Specialite (
id_Specialite INT IDENTITY(1,1),
nom_specialite VARCHAR (50) UNIQUE ,
CONSTRAINT pk_Specialite      PRIMARY KEY (id_Specialite)

);
-- 2. TABLE ASSOCIATIVE VETERINAIRE SPECIALITE
-- ----------------------------------------------------------

CREATE TABLE veterinaire_specialite (
id_Veterinaire  INT NOT NULL,
id_specialite   INT NOT NULL ,      
 PRIMARY KEY (id_Veterinaire, id_specialite ),
 CONSTRAINT fk_vet_specialite FOREIGN KEY (id_specialite) REFERENCES specialite(id_specialite)
 ON DELETE CASCADE,
 CONSTRAINT fk_spec_veterinair FOREIGN KEY (id_Veterinaire) REFERENCES Veterinaire(id_Veterinaire)
 ON DELETE CASCADE
 );

 -- 2. RENDEZ VOUS
-- ----------------------------------------------------------
CREATE TABLE RendezVous (
    id_rendez_vous INT IDENTITY(1,1) PRIMARY KEY,
    date DATETIME NOT NULL,
    motif VARCHAR(250) NOT NULL,
    statut VARCHAR(15) NOT NULL CHECK (statut IN ('Planifié', 'Complété', 'Annulé')),
    id_animal INT NOT NULL,
    id_veterinaire INT NOT NULL,
   
    CONSTRAINT FK_r_Animal FOREIGN KEY (id_animal) 
        REFERENCES Animal(id_animal) ON DELETE NO ACTION,
    CONSTRAINT FK_r_Veterinaire FOREIGN KEY (id_veterinaire) 
        REFERENCES Veterinaire(id_veterinaire) ON DELETE NO ACTION
);

 -- 2. RENDEZ VOUS
-- ----------------------------------------------------------

CREATE TABLE Acte_medical(
id_act INT IDENTITY(1,1) PRIMARY KEY ,
nom_act VARCHAR(50) NOT NULL UNIQUE,
cout_standard DECIMAL(6,2) NOT NULL,
duree_standard INT NOT NULL 
);


 -- 2. TABLE ASSOCIATIVE RENDEZ VOUS ACTE
-- ----------------------------------------------------------
CREATE TABLE RendezVous_Act (
    id_act INT NOT NULL,
    id_rendez_vous INT NOT NULL,
    cout_reel DECIMAL(6,2) NOT NULL,
    duree_reelle INT NULL,
    PRIMARY KEY (id_rendez_vous, id_act),
    CONSTRAINT fk_ra_rdv FOREIGN KEY (id_rendez_vous) 
        REFERENCES RendezVous(id_rendez_vous) ON DELETE CASCADE,
    CONSTRAINT fk_ra_acte FOREIGN KEY (id_act) 
        REFERENCES Acte_medical(id_act) ON DELETE NO ACTION
);

CREATE TABLE Historique_Cout (
id_historique INT IDENTITY(1,1) PRIMARY KEY,
id_rendez_vous INT NOT NULL,
id_act INT NOT NULL,
ancien_cout DECIMAL(6,2) NOT NULL,
nouveau_cout DECIMAL(6,2) NOT NULL,
date_modification DATETIME DEFAULT GETDATE()
);