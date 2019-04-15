DROP DATABASE biblejeupwphpbib;
CREATE DATABASE biblejeupwphpbib;
CONNECT biblejeupwphpbib;


CREATE TABLE Constantes_conference
(
CstID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Valeur int NOT NULL,
PRIMARY KEY (CstID)
)
;

INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('ARRONDI_TARIF_ENT', 500);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('Coeff_base_prix_ent', 5);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('TARIF_TITRE_INIT', 500);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('VALO_UI_PCT', 40);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('PROCASH', 0);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('DELTA_TITRE_EMIS', 5);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('VOLATILITE_TITRES_PCT', 10);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('TAUX_MIN_DIVIDENDES', 0);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('TAUX_MAX_DIVIDENDES', 30);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('TAUX_MIN_IMPOTS', 10);
INSERT INTO Constantes_conference (Nom, Valeur) VALUES ('TAUX_MAX_IMPOTS', 50);


CREATE TABLE Secteurs_conference
(
SectID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
/*Couleur varchar(255) NOT NULL DEFAULT '#FFFFFF',*/
PRIMARY KEY (SectID)
)
;

INSERT INTO Secteurs_conference (Nom) VALUES ('Justicier');
INSERT INTO Secteurs_conference (Nom) VALUES ('Criminel');
INSERT INTO Secteurs_conference (Nom) VALUES ('Pollueur');
INSERT INTO Secteurs_conference (Nom) VALUES ('Ecologiste');
INSERT INTO Secteurs_conference (Nom) VALUES ('Epicurien');
INSERT INTO Secteurs_conference (Nom) VALUES ('Ascete');
INSERT INTO Secteurs_conference (Nom) VALUES ('Mitterrandiste');
INSERT INTO Secteurs_conference (Nom) VALUES ('Giscardien');
INSERT INTO Secteurs_conference (Nom) VALUES ('Esthete');
INSERT INTO Secteurs_conference (Nom) VALUES ('Philistin');


CREATE TABLE Entreprises_conference
(
EntID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
SectID int NOT NULL,
Parti_politique varchar(255) NOT NULL,
Tarif int DEFAULT 0,
UI int DEFAULT 0,
PRIMARY KEY (EntID),
FOREIGN KEY (SectID) REFERENCES Secteurs_conference(SectID)
)
;

INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Michel Poniatowski', 1, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Commissaire Broussard', 1, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Juge Michel', 1, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Licio Gelli', 2, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Garth Knight', 2, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Meyer Lansky', 2, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Armand Hammer', 3, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Aristote Onassis', 3, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Jock Ewing', 3, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Bob Hunter', 4, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Rene Dumont', 4, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Chef Roani', 4, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Zino Davidoff', 5, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Princess Margaret', 5, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Fabrice Emear', 5, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Dr Martinot', 6, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Joel de Rosnay', 6, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Reinhold Messner', 6, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Yvette Roudy', 7, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Louis Mexandeau', 7, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Pierre Beregovoy', 7, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Michel Guy', 8, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Alice Saunier-Seite', 8, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Raffarin Jeune', 8, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Alexis de Rede', 9, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Joe Colombo', 9, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Claude Pompidou', 9, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Guy Lux', 10, 'Droite');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Paul-Loup Sulitzer', 10, 'Gauche');
INSERT INTO Entreprises_conference (Nom, SectID, Parti_politique) VALUES ('Mike Brant', 10, 'Droite');


CREATE TABLE Gentlemen_conference
(
GenID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Nb_Fraudes int NOT NULL DEFAULT 0,
Taux_imposition int NOT NULL DEFAULT 0,
Taux_dividendes int NOT NULL DEFAULT 0,
PRIMARY KEY (GenID)
);

INSERT INTO Gentlemen_conference (Nom) VALUES ('Jean-Jack');
INSERT INTO Gentlemen_conference (Nom) VALUES ('Fol');
INSERT INTO Gentlemen_conference (Nom) VALUES ('Gunard');
INSERT INTO Gentlemen_conference (Nom) VALUES ('Invite Mystere');


CREATE TABLE Titres_conference
(
TitID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Tarif int DEFAULT 0,
Actionnaire_MAJ int DEFAULT 0,
PRIMARY KEY (TitID)
);

INSERT INTO Titres_conference (Nom) VALUES ('Carte Richelieu');
INSERT INTO Titres_conference (Nom) VALUES ('Allo Coke');
INSERT INTO Titres_conference (Nom) VALUES ('Burac');
INSERT INTO Titres_conference (Nom) VALUES ('Contenerge');
INSERT INTO Titres_conference (Nom) VALUES ('Cadeaugadget');
INSERT INTO Titres_conference (Nom) VALUES ('Vector Editeur');
INSERT INTO Titres_conference (Nom) VALUES ('Detectives Richard');
INSERT INTO Titres_conference (Nom) VALUES ('Telepicerie');
INSERT INTO Titres_conference (Nom) VALUES ('Croquenroute');
INSERT INTO Titres_conference (Nom) VALUES ('Terre Mondiale');
INSERT INTO Titres_conference (Nom) VALUES ('Casinos Vegas');
INSERT INTO Titres_conference (Nom) VALUES ('Top Cassage');
INSERT INTO Titres_conference (Nom) VALUES ('Coupe MerMarron');
INSERT INTO Titres_conference (Nom) VALUES ('Filonor');


CREATE TABLE Portfolio_conference
(
GenID int NOT NULL,
TitID int NOT NULL,
Nb int NOT NULL DEFAULT 0,
FOREIGN KEY (GenID) REFERENCES Gentlemen_conference(GenID),
FOREIGN KEY (TitID) REFERENCES Titres_conference(TitID)
);

CREATE TABLE Politique_conference
(
PolID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Caisse_Noire int NOT NULL DEFAULT 0,
Actif BOOLEAN NOT NULL,
PRIMARY KEY (PolID)
);

INSERT INTO Politique_conference (Nom, Actif) VALUES ('Droite', false);
INSERT INTO Politique_conference (Nom, Actif) VALUES ('Gauche', true);


CREATE TABLE InfluenceBourse_conference
(
EntID int NOT NULL,
TitID int NOT NULL,
Coef int NOT NULL DEFAULT 0,
FOREIGN KEY (EntID) REFERENCES Entreprises_conference(EntID),
FOREIGN KEY (TitID) REFERENCES Titres_conference(TitID)
);

DELETE FROM InfluenceBourse_conference;
INSERT INTO InfluenceBourse_conference VALUES (1, 5, 15);
INSERT INTO InfluenceBourse_conference VALUES (1, 6, -30);
INSERT INTO InfluenceBourse_conference VALUES (1, 8, 15);
INSERT INTO InfluenceBourse_conference VALUES (1, 10, -10);
INSERT INTO InfluenceBourse_conference VALUES (1, 13, 60);
INSERT INTO InfluenceBourse_conference VALUES (1, 14, 50);
INSERT INTO InfluenceBourse_conference VALUES (2, 4, 20);
INSERT INTO InfluenceBourse_conference VALUES (2, 6, -30);
INSERT INTO InfluenceBourse_conference VALUES (2, 9, 20);
INSERT INTO InfluenceBourse_conference VALUES (2, 12, 20);
INSERT INTO InfluenceBourse_conference VALUES (2, 13, 70);
INSERT INTO InfluenceBourse_conference VALUES (3, 1, 30);
INSERT INTO InfluenceBourse_conference VALUES (3, 2, 30);
INSERT INTO InfluenceBourse_conference VALUES (3, 5, 20);
INSERT INTO InfluenceBourse_conference VALUES (3, 9, -30);
INSERT INTO InfluenceBourse_conference VALUES (3, 11, -30);
INSERT INTO InfluenceBourse_conference VALUES (3, 13, 50);
INSERT INTO InfluenceBourse_conference VALUES (3, 14, 30);
INSERT INTO InfluenceBourse_conference VALUES (4, 1, 20);
INSERT INTO InfluenceBourse_conference VALUES (4, 2, 70);
INSERT INTO InfluenceBourse_conference VALUES (4, 7, -40);
INSERT INTO InfluenceBourse_conference VALUES (4, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (4, 11, 70);
INSERT INTO InfluenceBourse_conference VALUES (5, 1, 50);
INSERT INTO InfluenceBourse_conference VALUES (5, 2, 50);
INSERT INTO InfluenceBourse_conference VALUES (5, 6, -20);
INSERT INTO InfluenceBourse_conference VALUES (5, 7, -10);
INSERT INTO InfluenceBourse_conference VALUES (5, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (5, 11, 50);
INSERT INTO InfluenceBourse_conference VALUES (6, 2, 50);
INSERT INTO InfluenceBourse_conference VALUES (6, 3, 20);
INSERT INTO InfluenceBourse_conference VALUES (6, 4, 30);
INSERT INTO InfluenceBourse_conference VALUES (6, 7, 20);
INSERT INTO InfluenceBourse_conference VALUES (6, 10, -30);
INSERT INTO InfluenceBourse_conference VALUES (6, 11, 50);
INSERT INTO InfluenceBourse_conference VALUES (6, 13, -40);
INSERT INTO InfluenceBourse_conference VALUES (7, 3, -20);
INSERT INTO InfluenceBourse_conference VALUES (7, 4, 30);
INSERT INTO InfluenceBourse_conference VALUES (7, 5, 20);
INSERT INTO InfluenceBourse_conference VALUES (7, 9, 60);
INSERT INTO InfluenceBourse_conference VALUES (7, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (7, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (8, 1, 50);
INSERT INTO InfluenceBourse_conference VALUES (8, 2, 30);
INSERT INTO InfluenceBourse_conference VALUES (8, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (8, 7, -20);
INSERT INTO InfluenceBourse_conference VALUES (8, 10, -40);
INSERT INTO InfluenceBourse_conference VALUES (8, 11, 50);
INSERT INTO InfluenceBourse_conference VALUES (9, 4, 20);
INSERT INTO InfluenceBourse_conference VALUES (9, 9, 60);
INSERT INTO InfluenceBourse_conference VALUES (9, 11, -20);
INSERT INTO InfluenceBourse_conference VALUES (9, 12, -20);
INSERT INTO InfluenceBourse_conference VALUES (9, 13, 30);
INSERT INTO InfluenceBourse_conference VALUES (9, 14, 30);
INSERT INTO InfluenceBourse_conference VALUES (10, 1, -20);
INSERT INTO InfluenceBourse_conference VALUES (10, 4, 60);
INSERT INTO InfluenceBourse_conference VALUES (10, 9, 40);
INSERT INTO InfluenceBourse_conference VALUES (10, 10, 20);
INSERT INTO InfluenceBourse_conference VALUES (11, 1, 30);
INSERT INTO InfluenceBourse_conference VALUES (11, 4, 40);
INSERT INTO InfluenceBourse_conference VALUES (11, 5, 20);
INSERT INTO InfluenceBourse_conference VALUES (11, 9, 30);
INSERT INTO InfluenceBourse_conference VALUES (11, 10, -40);
INSERT INTO InfluenceBourse_conference VALUES (11, 13, 20);
INSERT INTO InfluenceBourse_conference VALUES (12, 4, 50);
INSERT INTO InfluenceBourse_conference VALUES (12, 9, 40);
INSERT INTO InfluenceBourse_conference VALUES (12, 10, 30);
INSERT INTO InfluenceBourse_conference VALUES (12, 11, -20);
INSERT INTO InfluenceBourse_conference VALUES (13, 1, 20);
INSERT INTO InfluenceBourse_conference VALUES (13, 2, -20);
INSERT INTO InfluenceBourse_conference VALUES (13, 3, 20);
INSERT INTO InfluenceBourse_conference VALUES (13, 5, 20);
INSERT INTO InfluenceBourse_conference VALUES (13, 6, 50);
INSERT INTO InfluenceBourse_conference VALUES (13, 8, 30);
INSERT INTO InfluenceBourse_conference VALUES (13, 12, -20);
INSERT INTO InfluenceBourse_conference VALUES (14, 2, 30);
INSERT INTO InfluenceBourse_conference VALUES (14, 3, -30);
INSERT INTO InfluenceBourse_conference VALUES (14, 4, 30);
INSERT INTO InfluenceBourse_conference VALUES (14, 5, 30);
INSERT INTO InfluenceBourse_conference VALUES (14, 6, 40);
INSERT INTO InfluenceBourse_conference VALUES (14, 7, -10);
INSERT INTO InfluenceBourse_conference VALUES (14, 8, -5);
INSERT INTO InfluenceBourse_conference VALUES (14, 9, 20);
INSERT INTO InfluenceBourse_conference VALUES (14, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (14, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (14, 12, -10);
INSERT INTO InfluenceBourse_conference VALUES (14, 13, -5);
INSERT INTO InfluenceBourse_conference VALUES (15, 1, -30);
INSERT INTO InfluenceBourse_conference VALUES (15, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (15, 6, 20);
INSERT INTO InfluenceBourse_conference VALUES (15, 8, 20);
INSERT INTO InfluenceBourse_conference VALUES (15, 10, 30);
INSERT INTO InfluenceBourse_conference VALUES (15, 12, -20);
INSERT INTO InfluenceBourse_conference VALUES (15, 13, 30);
INSERT INTO InfluenceBourse_conference VALUES (15, 14, 20);
INSERT INTO InfluenceBourse_conference VALUES (16, 1, 20);
INSERT INTO InfluenceBourse_conference VALUES (16, 3, 20);
INSERT INTO InfluenceBourse_conference VALUES (16, 4, -10);
INSERT INTO InfluenceBourse_conference VALUES (16, 6, 20);
INSERT INTO InfluenceBourse_conference VALUES (16, 7, 40);
INSERT INTO InfluenceBourse_conference VALUES (16, 8, 40);
INSERT INTO InfluenceBourse_conference VALUES (16, 12, -10);
INSERT INTO InfluenceBourse_conference VALUES (16, 14, -20);
INSERT INTO InfluenceBourse_conference VALUES (17, 2, 20);
INSERT INTO InfluenceBourse_conference VALUES (17, 5, -20);
INSERT INTO InfluenceBourse_conference VALUES (17, 6, -30);
INSERT INTO InfluenceBourse_conference VALUES (17, 7, 50);
INSERT INTO InfluenceBourse_conference VALUES (17, 9, -20);
INSERT INTO InfluenceBourse_conference VALUES (17, 10, 40);
INSERT INTO InfluenceBourse_conference VALUES (17, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (17, 12, 20);
INSERT INTO InfluenceBourse_conference VALUES (17, 14, 10);
INSERT INTO InfluenceBourse_conference VALUES (18, 2, 40);
INSERT INTO InfluenceBourse_conference VALUES (18, 4, -20);
INSERT INTO InfluenceBourse_conference VALUES (18, 5, 60);
INSERT INTO InfluenceBourse_conference VALUES (18, 8, 30);
INSERT INTO InfluenceBourse_conference VALUES (18, 12, -20);
INSERT INTO InfluenceBourse_conference VALUES (18, 13, 20);
INSERT INTO InfluenceBourse_conference VALUES (18, 14, -10);
INSERT INTO InfluenceBourse_conference VALUES (19, 1, 40);
INSERT INTO InfluenceBourse_conference VALUES (19, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (19, 5, 20);
INSERT INTO InfluenceBourse_conference VALUES (19, 7, -20);
INSERT INTO InfluenceBourse_conference VALUES (19, 8, 60);
INSERT INTO InfluenceBourse_conference VALUES (19, 11, -30);
INSERT INTO InfluenceBourse_conference VALUES (20, 1, 60);
INSERT INTO InfluenceBourse_conference VALUES (20, 7, 20);
INSERT INTO InfluenceBourse_conference VALUES (20, 8, 20);
INSERT INTO InfluenceBourse_conference VALUES (20, 10, -30);
INSERT INTO InfluenceBourse_conference VALUES (20, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (21, 1, 65);
INSERT INTO InfluenceBourse_conference VALUES (21, 3, 25);
INSERT INTO InfluenceBourse_conference VALUES (21, 4, 5);
INSERT INTO InfluenceBourse_conference VALUES (21, 8, -5);
INSERT INTO InfluenceBourse_conference VALUES (21, 10, -40);
INSERT INTO InfluenceBourse_conference VALUES (21, 11, 40);
INSERT INTO InfluenceBourse_conference VALUES (21, 12, 5);
INSERT INTO InfluenceBourse_conference VALUES (21, 14, 5);
INSERT INTO InfluenceBourse_conference VALUES (22, 2, 20);
INSERT INTO InfluenceBourse_conference VALUES (22, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (22, 6, -30);
INSERT INTO InfluenceBourse_conference VALUES (22, 7, 30);
INSERT INTO InfluenceBourse_conference VALUES (22, 8, 50);
INSERT INTO InfluenceBourse_conference VALUES (22, 12, -10);
INSERT INTO InfluenceBourse_conference VALUES (22, 13, 20);
INSERT INTO InfluenceBourse_conference VALUES (22, 14, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 2, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (23, 4, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 5, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 6, 30);
INSERT INTO InfluenceBourse_conference VALUES (23, 8, 20);
INSERT INTO InfluenceBourse_conference VALUES (23, 9, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 10, 20);
INSERT INTO InfluenceBourse_conference VALUES (23, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (23, 12, -10);
INSERT INTO InfluenceBourse_conference VALUES (23, 14, 20);
INSERT INTO InfluenceBourse_conference VALUES (24, 1, 40);
INSERT INTO InfluenceBourse_conference VALUES (24, 3, 40);
INSERT INTO InfluenceBourse_conference VALUES (24, 6, -30);
INSERT INTO InfluenceBourse_conference VALUES (24, 7, 30);
INSERT INTO InfluenceBourse_conference VALUES (24, 8, 40);
INSERT INTO InfluenceBourse_conference VALUES (24, 12, -10);
INSERT INTO InfluenceBourse_conference VALUES (24, 14, -10);
INSERT INTO InfluenceBourse_conference VALUES (25, 1, 30);
INSERT INTO InfluenceBourse_conference VALUES (25, 2, -40);
INSERT INTO InfluenceBourse_conference VALUES (25, 7, 70);
INSERT INTO InfluenceBourse_conference VALUES (25, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (25, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (25, 14, 30);
INSERT INTO InfluenceBourse_conference VALUES (26, 1, -10);
INSERT INTO InfluenceBourse_conference VALUES (26, 2, -60);
INSERT INTO InfluenceBourse_conference VALUES (26, 4, 10);
INSERT INTO InfluenceBourse_conference VALUES (26, 6, 50);
INSERT INTO InfluenceBourse_conference VALUES (26, 7, 20);
INSERT INTO InfluenceBourse_conference VALUES (26, 9, 10);
INSERT INTO InfluenceBourse_conference VALUES (26, 10, 80);
INSERT INTO InfluenceBourse_conference VALUES (26, 11, -40);
INSERT INTO InfluenceBourse_conference VALUES (26, 12, 10);
INSERT INTO InfluenceBourse_conference VALUES (26, 14, 30);
INSERT INTO InfluenceBourse_conference VALUES (27, 3, 30);
INSERT INTO InfluenceBourse_conference VALUES (27, 4, 40);
INSERT INTO InfluenceBourse_conference VALUES (27, 7, 20);
INSERT INTO InfluenceBourse_conference VALUES (27, 10, -40);
INSERT INTO InfluenceBourse_conference VALUES (27, 12, 50);
INSERT INTO InfluenceBourse_conference VALUES (28, 1, 20);
INSERT INTO InfluenceBourse_conference VALUES (28, 2, 10);
INSERT INTO InfluenceBourse_conference VALUES (28, 3, 20);
INSERT INTO InfluenceBourse_conference VALUES (28, 10, -30);
INSERT INTO InfluenceBourse_conference VALUES (28, 12, 60);
INSERT INTO InfluenceBourse_conference VALUES (28, 14, 20);
INSERT INTO InfluenceBourse_conference VALUES (29, 3, 50);
INSERT INTO InfluenceBourse_conference VALUES (29, 4, 10);
INSERT INTO InfluenceBourse_conference VALUES (29, 9, -20);
INSERT INTO InfluenceBourse_conference VALUES (29, 10, -20);
INSERT INTO InfluenceBourse_conference VALUES (29, 11, 30);
INSERT INTO InfluenceBourse_conference VALUES (29, 12, 10);
INSERT INTO InfluenceBourse_conference VALUES (29, 13, -10);
INSERT INTO InfluenceBourse_conference VALUES (29, 14, 50);
INSERT INTO InfluenceBourse_conference VALUES (30, 1, -10);
INSERT INTO InfluenceBourse_conference VALUES (30, 2, 10);
INSERT INTO InfluenceBourse_conference VALUES (30, 4, 60);
INSERT INTO InfluenceBourse_conference VALUES (30, 10, -30);
INSERT INTO InfluenceBourse_conference VALUES (30, 12, 70);
INSERT INTO InfluenceBourse_conference VALUES (30, 13, 10);
INSERT INTO InfluenceBourse_conference VALUES (30, 14, -10);

CREATE TABLE Taux_dividendes_titres_conference
(
TitID int NOT NULL,
Taux_dividendes int NOT NULL DEFAULT 0,
FOREIGN KEY (TitID) REFERENCES Titres_conference(TitID)
);

CREATE VIEW RECAP_PORTFOLIO_TEMP_conference AS select Gentlemen_conference.genID, Gentlemen_conference.nom as Gentleman, Titres_conference.nom as Titre, Titres_conference.titID, Portfolio_conference.Nb, Portfolio_conference.Nb*Titres_conference.tarif AS Montant from Gentlemen_conference, Titres_conference, Portfolio_conference where Gentlemen_conference.genID=Portfolio_conference.GenID and Titres_conference.titID=Portfolio_conference.titID and Portfolio_conference.nb<>0 ;
CREATE VIEW RECAP_PORTFOLIO_conference AS select RECAP_PORTFOLIO_TEMP_conference.*, RECAP_PORTFOLIO_TEMP_conference.genID=Titres_conference.Actionnaire_MAJ as is_majoritaire from RECAP_PORTFOLIO_TEMP_conference LEFT JOIN Titres_conference ON RECAP_PORTFOLIO_TEMP_conference.titID=Titres_conference.titID ORDER BY RECAP_PORTFOLIO_TEMP_conference.Titre ASC;
CREATE VIEW RECAP_TITRES_TEMP_conference AS select Titres_conference.titID, Titres_conference.nom as Titre, Titres_conference.tarif, sum(Portfolio_conference.nb) as total_possedes, Titres_conference.Actionnaire_MAJ from Titres_conference, Portfolio_conference where Titres_conference.titID=Portfolio_conference.titID group by Titres_conference.TitID;
CREATE VIEW RECAP_TITRES_conference AS select TitID, Titre, RECAP_TITRES_TEMP_conference.tarif, RECAP_TITRES_TEMP_conference.total_possedes, Gentlemen_conference.Nom as Gentleman_majoritaire, RECAP_TITRES_TEMP_conference.Actionnaire_MAJ as MajID from RECAP_TITRES_TEMP_conference LEFT JOIN Gentlemen_conference ON RECAP_TITRES_TEMP_conference.Actionnaire_MAJ=Gentlemen_conference.GenID;
CREATE VIEW RECAP_DERRICKS_conference AS select MajID, COUNT(*) as Nb_Derricks from RECAP_TITRES_conference group by MajID;
CREATE VIEW RECAP_GENTLEMEN_conference AS select Gentlemen_conference.*, Nb_Derricks from Gentlemen_conference LEFT JOIN RECAP_DERRICKS_conference on Gentlemen_conference.GenID=RECAP_DERRICKS_conference.MajID;
CREATE VIEW TARIFS_FROM_BOURSE_conference AS select InfluenceBourse_conference.EntID, SUM(InfluenceBourse_conference.Coef*Titres_conference.tarif/100) as TarifFromBourse from InfluenceBourse_conference LEFT JOIN Titres_conference ON InfluenceBourse_conference.TitID=Titres_conference.TitID GROUP BY EntID;
CREATE VIEW RECAP_IMPOTS_TEMP1_conference AS select RECAP_PORTFOLIO_conference.*, valeur as Arrondi from RECAP_PORTFOLIO_conference left join Constantes_conference on Constantes_conference.nom="ARRONDI_TARIF_ENT";
CREATE VIEW RECAP_IMPOTS_TEMP_conference AS select genID, SUM(Montant) as Capital, arrondi from RECAP_IMPOTS_TEMP1_conference group by genID;
CREATE VIEW RECAP_IMPOTS_conference AS select Gentlemen_conference.genID, Gentlemen_conference.Nom, Gentlemen_conference.Taux_imposition, Capital, 500*CEILING(((RECAP_IMPOTS_TEMP_conference.Capital*Gentlemen_conference.Taux_imposition)/100)/500) as Impots from RECAP_IMPOTS_TEMP_conference LEFT JOIN  Gentlemen_conference ON Gentlemen_conference.genID=RECAP_IMPOTS_TEMP_conference.genID;
CREATE VIEW RECAP_DIVIDENDES_conference AS select Gentlemen_conference.genID, Gentlemen_conference.Nom, Gentlemen_conference.Taux_dividendes, Capital, 500*CEILING(((RECAP_IMPOTS_TEMP_conference.Capital*Gentlemen_conference.Taux_dividendes)/100)/500) as Dividendes from RECAP_IMPOTS_TEMP_conference LEFT JOIN  Gentlemen_conference ON Gentlemen_conference.genID=RECAP_IMPOTS_TEMP_conference.genID;


DELIMITER |
CREATE PROCEDURE init_portfolio_conference()
	BEGIN
	DECLARE nb_gentlemen INT DEFAULT 0;
	DECLARE nb_titres INT DEFAULT 0;
	select count(*) into nb_gentlemen from Gentlemen_conference;
	WHILE nb_gentlemen > 0 DO
		select count(*) into nb_titres from Titres_conference;
		WHILE nb_titres > 0 DO
			INSERT INTO Portfolio_conference (GenID, TitID) VALUES(nb_gentlemen, nb_titres);
			SET nb_titres = nb_titres - 1;
		END WHILE;
		SET nb_gentlemen = nb_gentlemen - 1;
	END WHILE;
	END	|

CREATE PROCEDURE compute_actionnaire_maj_titres_conference(IN TitreID INT)
	BEGIN
	DECLARE nb_total_possedes INT DEFAULT 0;
	DECLARE nb_max_possedes INT DEFAULT 0;
	DECLARE id_act_maj INT DEFAULT 0;
	select sum(Nb) into nb_total_possedes from Portfolio_conference where TitID=TitreID;
	select max(Nb) into nb_max_possedes from Portfolio_conference where TitID=TitreID;
	IF (nb_total_possedes>49 AND nb_max_possedes>nb_total_possedes/2) THEN
		select genID into id_act_maj from Portfolio_conference where TitID=TitreID AND nb=nb_max_possedes;
	END IF ;
	UPDATE Titres_conference SET Actionnaire_MAJ=id_act_maj where TitID=TitreID;
	END |


CREATE PROCEDURE compute_tarif_titre_conference(IN TitreID INT)
	BEGIN
	DECLARE tarif_titre_init INT DEFAULT 0;
	DECLARE nb_titres_emis INT DEFAULT 0;
	DECLARE delta_emis INT DEFAULT 0;
	DECLARE volatilite INT DEFAULT 0;
	select valeur into tarif_titre_init from Constantes_conference where nom ='TARIF_TITRE_INIT';
	select sum(nb) into nb_titres_emis from Portfolio_conference where TitID=TitreID;
	select valeur into delta_emis from Constantes_conference where nom='DELTA_TITRE_EMIS';
	select valeur into volatilite from Constantes_conference where nom='VOLATILITE_TITRES_PCT';
	UPDATE Titres_conference SET tarif=ROUND((tarif_titre_init+delta_emis*nb_titres_emis)*(1+(RAND()*2-1)*(volatilite/100))) where TitID=TitreID;
	END |


CREATE PROCEDURE compute_titres_conference()
	BEGIN
	DECLARE nb_titres INT DEFAULT 0;
	select count(*) into nb_titres from Titres_conference;
	WHILE nb_titres > 0 DO
		CALL compute_tarif_titre_conference(nb_titres);
		CALL compute_actionnaire_maj_titres_conference(nb_titres);
		SET nb_titres = nb_titres - 1;
	END WHILE;
	END |


CREATE PROCEDURE compute_tarif_entreprise_conference(IN EntrepriseID INT)
	BEGIN
	DECLARE tarif_entreprise_from_bourse INT DEFAULT 0;
	DECLARE montant_ui INT DEFAULT 0;
	DECLARE valo_ui INT DEFAULT 0;
	DECLARE arrondi INT DEFAULT 0;
	DECLARE influence_politique INT DEFAULT 10;
	select TarifFromBourse into tarif_entreprise_from_bourse from TARIFS_FROM_BOURSE_conference where EntID=EntrepriseID;
	select valeur into valo_ui from Constantes_conference where nom ='VALO_UI_PCT';
	select valeur into arrondi from Constantes_conference where nom ='ARRONDI_TARIF_ENT';
	select (ui*valo_ui/100) into montant_ui from Entreprises_conference where EntID=EntrepriseID;
	UPDATE Entreprises_conference SET tarif=arrondi*CEILING((tarif_entreprise_from_bourse*influence_politique+montant_ui)/arrondi) where EntID=EntrepriseID;
	END |

CREATE PROCEDURE update_taux_imposition_conference()
		BEGIN
		DECLARE taux_max INT DEFAULT 0;
		DECLARE taux_min INT DEFAULT 0;
		select valeur into taux_max from Constantes_conference where nom ='TAUX_MAX_IMPOTS';
		select valeur into taux_min from Constantes_conference where nom ='TAUX_MIN_IMPOTS';
		UPDATE Gentlemen_conference SET taux_imposition=(RAND()*(taux_max-taux_min)+taux_min);
		END |

CREATE PROCEDURE update_taux_dividendes_conference()
		BEGIN
		DECLARE taux_max INT DEFAULT 0;
		DECLARE taux_min INT DEFAULT 0;
		select valeur into taux_max from Constantes_conference where nom ='TAUX_MAX_DIVIDENDES';
		select valeur into taux_min from Constantes_conference where nom ='TAUX_MIN_DIVIDENDES';
		UPDATE Gentlemen_conference SET taux_dividendes=(RAND()*(taux_max-taux_min)+taux_min);
		END |

CREATE PROCEDURE compute_procash_conference()
	BEGIN
	DECLARE new_procash INT DEFAULT 0;
	DECLARE arrondi INT DEFAULT 0;
	select valeur into arrondi from Constantes_conference where nom ='ARRONDI_TARIF_ENT';
	select arrondi*CEILING(avg(tarif)/arrondi) into new_procash from Entreprises_conference;
	UPDATE Constantes_conference SET valeur=new_procash where nom='PROCASH';
	END |


CREATE PROCEDURE compute_entreprises_conference()
	BEGIN
	DECLARE nb_entreprises INT DEFAULT 0;
	select count(*) into nb_entreprises from Entreprises_conference;
	WHILE nb_entreprises > 0 DO
		CALL compute_tarif_entreprise_conference(nb_entreprises);
		SET nb_entreprises = nb_entreprises - 1;
	END WHILE;
	CALL compute_procash_conference();
	END |


CREATE PROCEDURE set_ui_conference(IN EntrepriseID INT, IN montantUI INT)
	BEGIN
	UPDATE Entreprises_conference SET UI=montantUI where EntID=EntrepriseID;
	END |


CREATE PROCEDURE set_fraudes_conference(IN GentlemanID INT, IN quantiteFRAUDES INT)
	BEGIN
	UPDATE Gentlemen_conference SET Nb_Fraudes=quantiteFRAUDES where GenID=GentlemanID;
	END |


CREATE PROCEDURE add_ui_conference (IN EntrepriseID INT, IN montantUI INT)
	BEGIN
	DECLARE new_montantUI INT DEFAULT 0;
	SELECT UI+montantUI into new_montantUI from Entreprises_conference where EntID=EntrepriseID;
	CALL set_ui_conference(EntrepriseID, new_montantUI);
	CALL compute_entreprises_conference();
	END |


CREATE PROCEDURE add_fraudes_conference (IN GentlemanID INT, IN quantiteFRAUDES INT)
	BEGIN
	DECLARE new_quantiteFRAUDES INT DEFAULT 0;
	SELECT Nb_Fraudes+quantiteFRAUDES into new_quantiteFRAUDES from Gentlemen_conference where GenID=GentlemanID;
	CALL set_fraudes_conference(GentlemanID, new_quantiteFRAUDES);
	END |


CREATE PROCEDURE init_bib_conference()
	BEGIN
	DECLARE nb_gentlemen INT DEFAULT 0;
	-- remise des UI a 0
	DECLARE nb_entreprises INT DEFAULT 0;
	select count(*) into nb_entreprises from Entreprises_conference;
	WHILE nb_entreprises > 0 DO
		CALL set_ui_conference(nb_entreprises,0);
		SET nb_entreprises = nb_entreprises - 1;
	END WHILE;
	select count(*) into nb_gentlemen from Gentlemen_conference;
	WHILE nb_gentlemen > 0 DO
		CALL set_fraudes_conference(nb_gentlemen,0);
		SET nb_gentlemen = nb_gentlemen - 1;
	END WHILE;
	-- remise a 0 du Portfolio_conference
	DELETE FROM Portfolio_conference;
	CALL init_portfolio_conference();
	CALL compute_titres_conference();
	CALL compute_entreprises_conference();
	END |

CREATE PROCEDURE achat_titres_conference(IN GentlemanID INT, IN TitreID INT, IN NbAchetes INT)
	BEGIN
	DECLARE nb_possedes INT DEFAULT 0;
	select NbAchetes+Nb into nb_possedes from Portfolio_conference where GenID=GentlemanID AND TitID=TitreID;
	UPDATE Portfolio_conference SET Nb=nb_possedes where GenID=GentlemanID AND TitID=TitreID;
	CALL compute_actionnaire_maj_titres_conference(TitreID);
	CALL compute_titres_conference();
	CALL compute_entreprises_conference();
	END |

CREATE PROCEDURE declenche_elections_conference()
	BEGIN
	DECLARE cn_droite INT DEFAULT 0;
	DECLARE cn_gauche INT DEFAULT 0;
	DECLARE gagnant INT DEFAULT 0;
	UPDATE Politique_conference SET Actif=0 where Actif=1;
	select Caisse_Noire into cn_droite from Politique_conference where Nom LIKE 'Droite';
	select Caisse_Noire into cn_gauche from Politique_conference where Nom LIKE 'Gauche';
	IF ((cn_droite+cn_gauche)=0) THEN SET gagnant = FLOOR(2*RAND())+1;
		ELSEIF (cn_droite=0) THEN SET gagnant = 2;
		ELSEIF (cn_gauche=0) THEN SET gagnant = 1;
		ELSE SET gagnant = ((cn_droite+cn_gauche)*RAND()>cn_droite)+1;
	END IF;
	UPDATE Politique_conference SET Actif=1 where PolID=gagnant;
	UPDATE Politique_conference SET Caisse_Noire=0;
	CALL compute_entreprises_conference();
	END |


CREATE PROCEDURE add_caisse_noire_conference (IN PolitiqueID INT, IN montant INT)
	BEGIN
	DECLARE new_montant INT DEFAULT 0;
	SELECT Caisse_Noire+montant into new_montant from Politique_conference where PolID=PolitiqueID;
	UPDATE Politique_conference SET Caisse_Noire=new_montant where PolID=PolitiqueID;
	END |


DELIMITER ;


CALL init_bib_conference();

COMMIT;
