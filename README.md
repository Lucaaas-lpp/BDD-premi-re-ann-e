# Gestion Immobilière - Base de Données SQL

Ce projet a été réalisé dans le cadre de ma première année de BUT Informatique (SAE). Il s'agit de la conception et de l'implémentation d'une base de données relationnelle pour gérer les biens, les propriétaires et la hiérarchie des espaces d'une agence immobilière.

## Contexte du projet

L'objectif était de modéliser un système capable de gérer des biens immobiliers complexes. Contrairement à une modélisation simple, ce projet intègre une **gestion récursive des espaces** (ex: une "Salle de bain" est rattachée à une "Chambre", qui est rattachée à une "Maison").

**Technologies utilisées :**
* **Langage :** SQL (Dialecte Oracle)
* **Outils :** SQLDeveloper, Oracle Database

## Fonctionnalités clés

Le projet met en œuvre plusieurs concepts avancés de bases de données :

### 1. Modélisation et Contraintes
* Utilisation de clés primaires et étrangères pour lier `PROPRIO`, `BIEN` et `ESPACE`.
* Mise en place de contraintes `CHECK` strictes pour garantir l'intégrité des données (ex: cohérence des superficies, listes de valeurs autorisées pour les types de pièces).

### 2. Requêtes Hiérarchiques (Arborescence)
La table `ESPACE` utilise une relation réflexive (`IdERattach`) permettant de définir des espaces imbriqués.
* *Exemple :* Calculer la surface totale d'une suite parentale en additionnant la chambre et la salle de bain rattachée.
* Utilisation des commandes Oracle `START WITH ... CONNECT BY PRIOR`.

### 3. Analyse de données
Le fichier de requêtes inclut :
* Des **Vues (Views)** pour simplifier l'accès aux prix minimums.
* Des **Sous-requêtes corrélées** (EXISTS, NOT EXISTS) pour filtrer les propriétaires selon des critères complexes.
* Des **Agrégations** (GROUP BY, HAVING) pour les statistiques par ville.

## Structure du dépôt

* `init_db.sql` : Script complet de création des tables (DDL) et d'insertion des données de test (DML).
* `queries.sql` : Ensemble de requêtes analytiques répondant à des problématiques métier (calcul d'écarts de prix, recherche de biens spécifiques).

## Comment l'utiliser

Si vous disposez d'une instance Oracle Database :

1.  Exécutez le script `init_db.sql` pour créer le schéma et peupler les tables.
2.  Lancez les requêtes présentes dans `queries.sql` pour tester les fonctionnalités.

## Auteurs

Projet réalisé en équipe dans le cadre du cursus BUT Informatique.
* Lucas Lepape - Développement SQL & Conception
* Projet de groupe
