-- V3.0.0

PROMPT "Création de la base de données IMMO";

-- **************************************************************************** Initialisation

PROMPT "Suppression des tables (à enlever si première création)";

DROP TABLE PROPRIO CASCADE CONSTRAINTS;
DROP TABLE ESPACE CASCADE CONSTRAINTS;
DROP TABLE BIEN CASCADE CONSTRAINTS;

-- **************************************************************************** Création des tables

PROMPT "Création de la table PROPRIO";

CREATE TABLE PROPRIO (
   IdP NUMBER(6, 0),
   Nom VARCHAR2(30),
   Prenom VARCHAR2(30),
   CONSTRAINT PK_PROPRIO PRIMARY KEY (IdP),
   CONSTRAINT NN_PROPRIO_NOM CHECK (Nom IS NOT NULL),
   CONSTRAINT NN_PROPRIO_PRENOM CHECK (Prenom IS NOT NULL),
   CONSTRAINT UQ_PROPRIO_NOM_PRENOM UNIQUE (Nom, Prenom)
);

PROMPT "Création de la table ESPACE";

CREATE TABLE ESPACE (
   IdE NUMBER(6, 0),
   Designation VARCHAR2(50),
   Superficie NUMBER(6,2),
   IdERattach NUMBER(6, 0),
   CONSTRAINT PK_ESPACE PRIMARY KEY (IdE),
   CONSTRAINT NN_ESPACE_DESIGNATION CHECK (Designation IS NOT NULL),
   CONSTRAINT CHK_ESPACE_SUPERFICIE CHECK ((IDERATTACH IS NULL AND Superficie > 8) OR (IDERATTACH IS NOT NULL)),
   CONSTRAINT CHK_ESPACE_SUPERFICIE_ENTIERE CHECK (Superficie = TRUNC(Superficie)),
   CONSTRAINT CHK_ESPACE_DESIGNATION CHECK (UPPER(Designation) IN ('APPARTEMENT', 'MAISON DE VILLE', 'MAISON DE CAMPAGNE', 'VILLA', 'CHALET MONTAGNE', 'MAISON BORD DE MER', 'SALON', 'CHAMBRE', 'SALLE DE BAIN', 'CUISINE', 'GARAGE', 'BUREAU', 'SALLE DE SPORT', 'TERRASSE', 'VÉRANDA', 'SALLE POLYVALENTE', 'JARDIN', 'SALLE À MANGER', 'BIBLIOTHÈQUE')),
   CONSTRAINT FK_ESPACE_RATTACHE FOREIGN KEY (IdERattach)
       REFERENCES ESPACE(IdE)
);

PROMPT "Création de la table BIEN";

CREATE TABLE BIEN (
   IdEBien NUMBER(6, 0),
   Categorie VARCHAR2(30),
   Type VARCHAR2(10),
   IdP NUMBER(6, 0),
   Ville VARCHAR2(30),
   Prix NUMBER(10,2),
   CONSTRAINT PK_BIEN PRIMARY KEY (IdEBien),
   CONSTRAINT NN_BIEN_CATEGORIE CHECK (Categorie IS NOT NULL),
   CONSTRAINT NN_BIEN_TYPE CHECK (Type IS NOT NULL),
   CONSTRAINT NN_BIEN_VILLE CHECK (Ville IS NOT NULL),
   CONSTRAINT CHK_BIEN_PRIX CHECK (Prix >= 0),
   CONSTRAINT FK_BIEN_PROPRIO FOREIGN KEY (IdP)
       REFERENCES PROPRIO(IdP),
   CONSTRAINT FK_BIEN_ESPACE FOREIGN KEY (IdEBien)
       REFERENCES ESPACE(IdE),
   CONSTRAINT CHK_BIEN_CATEGORIE CHECK (UPPER(Categorie) IN ('APPARTEMENT', 'MAISON DE VILLE', 'MAISON DE CAMPAGNE', 'VILLA', 'CHALET MONTAGNE', 'MAISON BORD DE MER')),
   CONSTRAINT CHK_BIEN_TYPE CHECK (UPPER(Type) IN ('STUDIO', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7+'))
);

--  **************************************************************************** Insertions des données

PROMPT "Insertions des données de la table proprio";

INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (1, 'Aroussi Bentata', 'Adam');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (2, 'Azoug', 'Kylian');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (3, 'Barberis', 'Alexis');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (4, 'Ben Gadha', 'Imen');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (5, 'Benahmed', 'Younes');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (6, 'Bougherara', 'Adam');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (7, 'Clot-Godard', 'Kenji');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (8, 'Helali', 'Amin');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (9, 'Koliai', 'Hamza');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (10, 'Lauriol-Torcq', 'Mathis');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (11, 'Lepape', 'Lucas');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (12, 'Marcus', 'Wiliam');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (13, 'Mejean', 'Oriane');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (14, 'Mekidiche', 'Idris');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (15, 'Ribbe', 'Jules');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (16, 'Rinaldi', 'Antoine');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (17, 'Rombi', 'Matis');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (18, 'Stafanovitch', 'Ilann');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (19, 'Torchin', 'Maxence');
INSERT INTO PROPRIO (IdP, Nom, Prenom) VALUES (105, 'Watripont', 'Jeremy');

PROMPT "Insertions des données de la table espace";

-- Première maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (1, 'Maison de Ville', 139, NULL);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (2, 'Salon', 30, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (3, 'Cuisine', 15, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (4, 'Chambre', 20, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)   
VALUES (5, 'Salle de Bain', 8, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (6, 'Chambre', 18, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (7, 'Terrasse', 10, 2);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (8, 'Salle Polyvalente', 5, 4);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (9, 'Salle de sport', 6, 2);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (10, 'Bureau', 12, 1);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (11, 'Terrasse', 15, 10);

--Deuxième maison

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (12, 'Maison de Ville', 288, NULL);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (13, 'Salon', 40, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (14, 'Cuisine', 20, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (15, 'Chambre', 25, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (16, 'Salle de Bain', 10, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (17, 'Chambre', 18, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (18, 'Salle de Bain', 8, 17);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (19, 'Garage', 30, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (20, 'Jardin', 100, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (21, 'Bureau', 15, 12);
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (22, 'Salle à Manger', 22, 13);

--Troisième maison

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (23, 'Appartement', 180, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (24, 'Salon', 30, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (25, 'Cuisine', 15, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (26, 'Chambre', 20, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (27, 'Salle de Bain', 8, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (28, 'Chambre', 12, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (29, 'Salle de Bain', 6, 28);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (30, 'Terrasse', 25, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (31, 'Bureau', 10, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (32, 'Salle polyvalente', 7, 23);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (33, 'Salle à Manger', 17, 24);

-- Quatrième maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (34, 'Maison Bord de Mer', 250, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (35, 'Salon', 60, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (36, 'Cuisine', 20, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (37, 'Chambre', 25, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (38, 'Salle de Bain', 12, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (39, 'Chambre', 18, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (40, 'Salle de Bain', 8, 39);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (41, 'Salle Polyvalente', 30, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (42, 'Terrasse', 40, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (43, 'Bureau', 15, 34);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (44, 'Salle à Manger', 20, 35);

--Cinquième maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (45, 'Villa', 300, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (46, 'Salon', 70, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (47, 'Cuisine', 25, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (48, 'Chambre', 30, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (49, 'Salle de Bain', 15, 48);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (50, 'Chambre', 20, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (51, 'Salle de Bain', 10, 50);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (52, 'Salle Polyvalente', 35, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (53, 'Jardin', 50, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (54, 'Salle de Sport', 20, 45);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (55, 'Salle Polyvalente', 25, 45);

--sixième maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (56, 'Chalet Montagne', 280, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (57, 'Salon', 80, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (58, 'Cuisine', 30, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (59, 'Chambre', 35, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (60, 'Salle de Bain', 18, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (61, 'Chambre', 22, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (62, 'Salle de Bain', 12, 61);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (63, 'Salle Polyvalente', 40, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (64, 'Véranda', 35, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (65, 'Bibliothèque', 20, 56);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (66, 'Salle Polyvalente', 25, 57);

--septième maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (67, 'Maison de Ville', 320, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (68, 'Salon', 90, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (69, 'Cuisine', 28, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (70, 'Chambre', 32, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (71, 'Salle de Bain', 16, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (72, 'Chambre', 24, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (73, 'Salle de Bain', 10, 72);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (74, 'Salle Polyvalente', 45, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (75, 'Terrasse', 40, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (76, 'Bureau', 22, 67);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (77, 'Salle de Sport', 30, 67);

--huitième maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (78, 'Maison de Ville', 250, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (79, 'Salon', 70, 78);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (80, 'Cuisine', 25, 78);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (81, 'Chambre', 30, 78);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (82, 'Salle de Bain', 15, 78);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (83, 'Bureau', 20, 78);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (84, 'Terrasse', 35, 78);

-- 9e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (85, 'Appartement', 180, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (86, 'Salon', 50, 85);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (87, 'Cuisine', 20, 85);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (88, 'Chambre', 25, 85);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (89, 'Salle de Bain', 12, 85);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (90, 'Bureau', 15, 85);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (91, 'Terrasse', 10, 85);

-- 10e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (92, 'Maison de Ville', 220, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (93, 'Salon', 100, 92);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (94, 'Cuisine', 25, 92);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (95, 'Chambre', 30, 92);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (96, 'Salle de Bain', 15, 92);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (97, 'Salle Polyvalente', 35, 92);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (98, 'Terrasse', 15, 92);

-- 11e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (99, 'Maison Bord de Mer', 200, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (100, 'Salon', 60, 99);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (101, 'Cuisine', 20, 99);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (102, 'Chambre', 25, 99);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (103, 'Salle de Bain', 12, 99);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (104, 'Bureau', 15, 99);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (105, 'Terrasse', 20, 99);

-- 12e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (106, 'Maison de Campagne', 240, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (107, 'Salon', 65, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (108, 'Cuisine', 22, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (109, 'Chambre', 28, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (110, 'Salle de Bain', 14, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (111, 'Chambre', 20, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (112, 'Chambre', 20, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (113, 'Salle Polyvalente', 30, 106);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (114, 'Jardin', 40, 106);

-- 13e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (115, 'Villa', 260, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (116, 'Salon', 70, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (117, 'Cuisine', 25, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (118, 'Chambre', 30, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (119, 'Salle de Bain', 15, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (120, 'Chambre', 22, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (121, 'Salle de Sport', 30, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (122, 'Bureau', 18, 115);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (123, 'Terrasse', 25, 115);

-- 14e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (124, 'Maison de Campagne', 230, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (125, 'Salon', 60, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (126, 'Cuisine', 20, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (127, 'Chambre', 25, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (128, 'Salle de Bain', 12, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (129, 'Chambre', 18, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (130, 'Salle Polyvalente', 20, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (131, 'Bureau', 15, 124);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (132, 'Jardin', 30, 124);

-- 15e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (133, 'Maison de Ville', 280, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (134, 'Salon', 65, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (135, 'Cuisine', 22, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (136, 'Chambre', 28, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (137, 'Salle de Bain', 14, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (138, 'Chambre', 20, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (139, 'Bibliothèque', 18, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (140, 'Bureau', 15, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (141, 'Véranda', 25, 133);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (142, 'Garage', 30, 133);

-- 16e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (143, 'Maison de Campagne', 270, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (144, 'Salon', 60, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (145, 'Cuisine', 20, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (146, 'Chambre', 25, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (147, 'Salle de Bain', 12, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (148, 'Chambre', 18, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (149, 'Bureau', 15, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (150, 'Salle Polyvalente', 22, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (151, 'Véranda', 25, 143);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (152, 'Garage', 30, 143);

-- 17e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (153, 'Maison de Ville', 250, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (154, 'Salon', 80, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (155, 'Cuisine', 20, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (156, 'Chambre', 30, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (157, 'Salle de Bain', 15, 156);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (158, 'Chambre', 20, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (159, 'Bureau', 15, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (160, 'Salle de Sport', 25, 153);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (161, 'Terrasse', 30, 153);

-- 18e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (162, 'Maison de Ville', 250, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (163, 'Salon', 80, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (164, 'Cuisine', 20, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (165, 'Chambre', 30, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (166, 'Salle de Bain', 15, 165);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (167, 'Chambre', 20, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (168, 'Bureau', 15, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (169, 'Salle de Sport', 25, 162);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (170, 'Terrasse', 30, 162);

-- 19e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (172, 'Maison de Ville', 260, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (173, 'Salon', 70, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (174, 'Cuisine', 25, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (175, 'Chambre', 30, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (176, 'Salle de Bain', 15, 175);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (177, 'Chambre', 20, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (178, 'Salle Polyvalente', 25, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (179, 'Bureau', 18, 172);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (180, 'Terrasse', 30, 172);

--20eme maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (181, 'Maison de Ville', 280, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (182, 'Salon', 70, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (183, 'Cuisine', 25, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (184, 'Chambre', 30, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (185, 'Salle de Bain', 15, 184);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (186, 'Chambre', 20, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (187, 'Salle Polyvalente', 25, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (188, 'Bureau', 18, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (189, 'Terrasse', 30, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (190, 'Salle de Sport', 22, 181);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (191, 'Chambre', 10, 181);

-- 21e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (192, 'Villa', 300, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (193, 'Salon', 75, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (194, 'Cuisine', 30, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (195, 'Chambre', 35, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (196, 'Salle de Bain', 18, 195);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (197, 'Chambre', 25, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (198, 'Salle de Sport', 22, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (199, 'Bureau', 20, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (200, 'Terrasse', 35, 192);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (201, 'Salle Polyvalente', 25, 192);

--22e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (202, 'Maison de Ville', 260, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (203, 'Salon', 75, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (204, 'Cuisine', 30, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (205, 'Chambre', 35, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (206, 'Salle de Bain', 18, 205);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (207, 'Chambre', 25, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (208, 'Salle de Sport', 22, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (209, 'Bureau', 20, 202);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (210, 'Terrasse', 35, 202);

--23e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (211, 'Maison de Ville', 265, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (212, 'Salon', 75, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (213, 'Cuisine', 30, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (214, 'Chambre', 35, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (215, 'Salle de Bain', 18, 214);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (216, 'Chambre', 25, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (217, 'Salle de Sport', 22, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (218, 'Terrasse', 35, 211);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (219, 'Salle Polyvalente', 25, 211);

--24e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (220, 'Maison de Campagne', 235, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (221, 'Salon', 70, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (222, 'Cuisine', 25, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (223, 'Chambre', 30, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (224, 'Salle de Bain', 15, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (225, 'Chambre', 22, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (226, 'Salle de Sport', 30, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (227, 'Bureau', 18, 220);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (228, 'Terrasse', 25, 220);

--25e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (229, 'Maison de Campagne', 210, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (230, 'Salon', 70, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (231, 'Cuisine', 25, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (232, 'Chambre', 30, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (233, 'Salle de Bain', 15, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (234, 'Chambre', 22, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (235, 'Salle de Sport', 30, 229);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (236, 'Bureau', 18, 229);

--26e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (237, 'Maison de Campagne', 187, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (238, 'Salon', 70, 237);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (239, 'Cuisine', 25, 237);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (240, 'Chambre', 30, 237);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (241, 'Salle de Bain', 15, 237);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (242, 'Chambre', 22, 237);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (243, 'Terrasse', 25, 237);

--27e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (244, 'Maison de Campagne', 217, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (245, 'Salon', 70, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (246, 'Cuisine', 25, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (247, 'Chambre', 30, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (248, 'Salle de Bain', 15, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (249, 'Chambre', 22, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (250, 'Salle de Sport', 30, 244);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (251, 'Terrasse', 25, 244);

--28e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (252, 'Maison de Campagne', 213, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (253, 'Salon', 70, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (254, 'Cuisine', 25, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (255, 'Chambre', 30, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (256, 'Salle de Bain', 15, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (257, 'Salle de Sport', 30, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (258, 'Bureau', 18, 252);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (259, 'Terrasse', 25, 252);

--29e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (260, 'Maison de Campagne', 205, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (261, 'Salon', 70, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (262, 'Cuisine', 25, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (263, 'Chambre', 30, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (264, 'Salle de Bain', 15, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (265, 'Chambre', 22, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (266, 'Bureau', 18, 260);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (267, 'Terrasse', 25, 260);

--30e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (268, 'Maison de Campagne', 235, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (269, 'Salon', 70, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (270, 'Cuisine', 25, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (271, 'Chambre', 30, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (272, 'Salle de Bain', 15, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (273, 'Chambre', 22, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (274, 'Salle de Sport', 30, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (275, 'Bureau', 18, 268);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (276, 'Terrasse', 25, 268);

--31e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (945, 'Maison de Ville', 235, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (946, 'Salon', 70, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (947, 'Cuisine', 25, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (948, 'Chambre', 30, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (949, 'Salle de Bain', 15, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (950, 'Chambre', 22, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (951, 'Salle de Sport', 30, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (952, 'Bureau', 18, 945);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (953, 'Terrasse', 25, 945);

--32e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (277, 'Appartement', 25, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (278, 'Cuisine', 7, 277);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (279, 'Chambre', 10, 277);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (280, 'Salle de Bain', 5, 277);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (281, 'Terrasse', 3, 277);

--33e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (282, 'Appartement', 24, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (283, 'Cuisine', 6, 282);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (284, 'Chambre', 10, 282);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (285, 'Salle de Bain', 5, 282);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (286, 'Terrasse', 3, 282);

--34e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (287, 'Appartement', 20, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (288, 'Cuisine', 6, 287);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (289, 'Chambre', 9, 287);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (290, 'Salle de Bain', 5, 287);

--35e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (291, 'Appartement', 23, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (292, 'Cuisine', 7, 291);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (293, 'Chambre', 10, 291);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (294, 'Salle de Bain', 6, 291);

--36e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (295, 'Maison de Ville', 110, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (296, 'Salon', 40, 295);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (297, 'Cuisine', 20, 295);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (298, 'Chambre', 20, 295);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (299, 'Salle de Bain', 15, 295);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (300, 'Chambre', 15, 295);


--37e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (301, 'Maison de Ville', 82, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (302, 'Salon', 40, 301);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (303, 'Cuisine', 20, 301);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (304, 'Terrasse', 3, 301);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (305, 'Chambre', 12, 301);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (306, 'Salle de Bain', 7, 301);

--38e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (307, 'Maison de Ville', 80, NULL); 

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (308, 'Salon', 30, 307);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (309, 'Cuisine', 15, 307);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (310, 'Chambre', 20, 307);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (311, 'Salle de Bain', 15, 307);

--39e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (312, 'Maison de Ville', 85, NULL); 

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (313, 'Salon', 35, 312);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (314, 'Cuisine', 18, 312);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (315, 'Chambre', 20, 312);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (316, 'Salle de Bain', 12, 312);

--40e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (317, 'Maison de Ville', 100, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (318, 'Salon', 40, 317);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (319, 'Cuisine', 20, 317);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (320, 'Chambre', 25, 317);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (321, 'Salle de Bain', 15, 317);

--41e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (322, 'Maison de Ville', 110, NULL); 

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (323, 'Salon', 45, 322);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (324, 'Cuisine', 25, 322);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (325, 'Chambre', 25, 322);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (326, 'Salle de Bain', 15, 322);

--42e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (327, 'Maison de Ville', 105, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (328, 'Salon', 45, 327);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (329, 'Cuisine', 25, 327);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (330, 'Chambre', 25, 327);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (331, 'Salle de Bain', 20, 327);

--43e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (332, 'Maison de Ville', 120, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (333, 'Salon', 50, 332);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (334, 'Cuisine', 30, 332);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (335, 'Chambre', 30, 332);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (336, 'Salle de Bain', 20, 332);

--44e maison
INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (337, 'Maison de Ville', 105, NULL);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (338, 'Salon', 45, 337);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (339, 'Cuisine', 25, 337);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (340, 'Chambre', 25, 337);

INSERT INTO ESPACE (IdE, Designation, Superficie, IdERattach)
VALUES (341, 'Salle de Bain', 15, 337);

PROMPT "Insertions des données de la table espace";

--1
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (1, 'Maison de Ville', 'T5', 1, 'Paris', 3600000);

--2
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (12, 'Maison de Ville', 'T4', 2, 'Paris', 500000);

--3
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (23, 'Appartement', 'T5', 1, 'Marseille', 550000);

--4
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (34, 'Maison Bord de Mer', 'T5', 1, 'Nice', 750000);

--5
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (45, 'Villa', 'T6', 5, 'Cassis', 3000000);

--6
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (56, 'Chalet Montagne', 'T5', 1, 'Serre Chevalier', 1500000);

--7
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (67, 'Maison de Ville', 'T5', 7, 'Marseille', 800000);

--8
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (78, 'Maison de Ville', 'T5', 8, 'Marseille', 800000);

--9
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (85, 'Appartement', 'T5', 9, 'Marseille', 700000);

--10
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (92, 'Maison de Ville', 'T3', 10, 'Paris', 1500000);

--11
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (99, 'Maison Bord de Mer', 'T3', 11, 'Marseille', 520000);

--12
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (106, 'Maison de Campagne', 'T5', 12, 'Marseille', 900000);

--13
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (115, 'Villa', 'T5', 13, 'Marseille', 800000);

--14
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (124, 'Maison de Campagne', 'T4', 14, 'Marseille', 660000);

--15
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (133, 'Maison de Ville', 'T4', 15, 'Marseille', 680000);

--16
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (143, 'Maison de Campagne', 'T5', 16, 'Marseille', 790000);

--17
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (153, 'Maison de Ville', 'T5', 17, 'Marseille', 770000);

--18
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (162, 'Maison de Ville', 'T5', 18, 'Marseille', 810000);

--19
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (172, 'Maison de Ville', 'T5', 19, 'Marseille', 815000);

--20
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (181, 'Maison de Ville', 'T7+', 105, 'Marseille', 1000000);

--21
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (192, 'Villa', 'T6', 1, 'Marseille', 930000);

--22
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (202, 'Maison de Ville', 'T5', 2, 'Marseille', 820000);

--23
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (211, 'Maison de Ville', 'T5', 3, 'Marseille', 810000);

--24
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (220, 'Maison de Campagne', 'T5', 7, 'Marseille', 805000);

--25
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (229, 'Maison de Campagne', 'T5', 1, 'Paris',4000000);

--26
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (237, 'Maison de Campagne', 'T3', 6, 'Paris', 1000000);

--27
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (244, 'Maison de Campagne', 'T4', 1, 'Paris', 2500000);

--28
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (252, 'Maison de Campagne', 'T4', 9, 'Paris', 2300000);

--29
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (260, 'Maison de Campagne', 'T4', 3, 'Paris', 2400000);

--30
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (268, 'Maison de Campagne', 'T5', 1, 'Paris', 3600000);

--31
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (945, 'Maison de Ville', 'T5', 6, 'Paris', 3800000);

--32
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (277, 'Appartement', 'Studio', 8, 'Aix-en-Provence', 120000);

--33
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (282, 'Appartement', 'Studio', 8, 'Aix-en-Provence', 118000);

--34
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (287, 'Appartement', 'Studio', 105, 'Aubagne', 123000);

--35
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (291, 'Appartement', 'Studio', 105, 'Avignon', 123000);

--36
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (295, 'Maison de Ville', 'T5', 15, 'Marseille', 660000);

--37
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (301, 'Maison de Ville', 'T4', 105, 'Marseille', 650000);

--38
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (307, 'Maison de Ville', 'T4', 105, 'Paris', 800000); 

--39
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (312, 'Maison de Ville', 'T4', 1, 'Paris', 850000); 

--40
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (317, 'Maison de Ville', 'T5', 1, 'Paris', 1200000);

--41
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (322, 'Maison de Ville', 'T5', 6, 'Paris', 1320000);

--42
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (327, 'Maison de Ville', 'T5', 15, 'Paris', 1260000);

--43
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (332, 'Maison de Ville', 'T6', 17, 'Paris', 1680000);

--44
INSERT INTO BIEN (IdEBien, Categorie, Type, IdP, Ville, Prix)
VALUES (337, 'Maison de Ville', 'T5', 105, 'Paris', 1260000);