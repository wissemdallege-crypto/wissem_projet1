# 🐾 Base de Données — Clinique Vétérinaire Multi-Sites

![SQL Server](https://img.shields.io/badge/SGBD-SQL%20Server-blue)
![T-SQL](https://img.shields.io/badge/Langage-T--SQL-orange)
![Status](https://img.shields.io/badge/Statut-Complété-brightgreen)

## 📌 À propos du projet
Projet d'intégration réalisé dans le cadre de l'AEC en **Gestion de bases de données et infonuagique** (Cégep Marie-Victorin). 

L'objectif principal était de transformer un système de gestion fondé sur un fichier Excel non normalisé et instable en une **base de données relationnelle robuste, normalisée (3FN) et sécurisée** sous Microsoft SQL Server.

---

## 📐 Architecture et Normalisation

* **Normalisation :** Passage d'un fichier plat (1FN violée) à un schéma relationnel en **3FN** pour éliminer les redondances et les anomalies de mise à jour.
* **Modélisation :** Conception du schéma Entité-Relation (Chen) gérant 7 entités et leurs relations (1:1, 1:N, N:M).
* **Intégrité des données :** Application stricte des clés primaires, clés étrangères, contraintes `CHECK`, `UNIQUE` et règles d'effacement (`CASCADE` / `NO ACTION`).

---

## 🛠️ Fonctionnalités SQL Avancées

1. **Triggers d'audit (`AFTER UPDATE`) :** Historisation automatique des modifications de tarifs dans une table dédiée (`Historique_Prix_Acte`) grâce aux tables virtuelles `inserted` et `deleted`.
2. **Procédures stockées (`Stored Procedures`) :**
   * `sp_CreerRendezVous` : Validation logique de la disponibilité du vétérinaire en temps réel avant insertion.
   * `sp_TotalFacture` : Calcul automatique du montant total facturé pour un rendez-vous.
3. **Vues analytiques (`Views`) :**
   * Consolidation de l'historique médical complet par animal.
   * Agrégation du chiffre d'affaires généré par succursale.

---

## 📁 Structure du dépôt

```text
.
├── README.md               # Documentation du projet
├── docs/
│   └── Diagramme_ER.pdf    # Diagramme Entité-Relation
└── sql/
    ├── 01_schema_ddl.sql   # Création des tables et contraintes
    ├── 02_data_dml.sql     # Insertion des jeux de données
    ├── 03_queries.sql      # Requêtes de consultation et rapport
    ├── 04_views.sql        # Vues analytiques
    ├── 05_procedures.sql    # Procédures stockées
    └── 06_triggers.sql     # Trigger d'audit et table d'historique