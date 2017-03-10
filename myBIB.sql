DROP DATABASE biblejeuhcphpbib;
CREATE DATABASE biblejeuhcphpbib;
CONNECT biblejeuhcphpbib;


CREATE TABLE Constantes
(
CstID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Valeur int NOT NULL,
PRIMARY KEY (CstID)
)
;

INSERT INTO Constantes (Nom, Valeur) VALUES ('ARRONDI_TARIF_ENT', 500);
INSERT INTO Constantes (Nom, Valeur) VALUES ('Coeff_base_prix_ent', 5);
INSERT INTO Constantes (Nom, Valeur) VALUES ('TARIF_TITRE_INIT', 500);
INSERT INTO Constantes (Nom, Valeur) VALUES ('VALO_UI_PCT', 40);
INSERT INTO Constantes (Nom, Valeur) VALUES ('PROCASH', 0);
INSERT INTO Constantes (Nom, Valeur) VALUES ('DELTA_TITRE_EMIS', 5);
INSERT INTO Constantes (Nom, Valeur) VALUES ('VOLATILITE_TITRES_PCT', 10);
INSERT INTO Constantes (Nom, Valeur) VALUES ('TAUX_MIN_DIVIDENDES', 0);
INSERT INTO Constantes (Nom, Valeur) VALUES ('TAUX_MAX_DIVIDENDES', 30);
INSERT INTO Constantes (Nom, Valeur) VALUES ('TAUX_MIN_IMPOTS', 10);
INSERT INTO Constantes (Nom, Valeur) VALUES ('TAUX_MAX_IMPOTS', 50);


CREATE TABLE Secteurs
(
SectID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
/*Couleur varchar(255) NOT NULL DEFAULT '#FFFFFF',*/
PRIMARY KEY (SectID)
)
;

INSERT INTO Secteurs (Nom) VALUES ('Sport');
INSERT INTO Secteurs (Nom) VALUES ('Luxe');
INSERT INTO Secteurs (Nom) VALUES ('Tourisme');
INSERT INTO Secteurs (Nom) VALUES ('Transports');
INSERT INTO Secteurs (Nom) VALUES ('Medias');
INSERT INTO Secteurs (Nom) VALUES ('Communication');
INSERT INTO Secteurs (Nom) VALUES ('Banque');
INSERT INTO Secteurs (Nom) VALUES ('Informatique');
INSERT INTO Secteurs (Nom) VALUES ('Securite');
INSERT INTO Secteurs (Nom) VALUES ('Immobilier');


CREATE TABLE Entreprises
(
EntID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
SectID int NOT NULL,
Parti_politique varchar(255) NOT NULL,
Tarif int DEFAULT 0,
UI int DEFAULT 0,
PRIMARY KEY (EntID),
FOREIGN KEY (SectID) REFERENCES Secteurs(SectID)
)
;

INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('L\'Aurochs Sportif', 1, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Le Gradome Olympique', 1, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Interforme', 1, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Une Femme, Un Soir', 2, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Le Douglas', 2, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('La Seiclope', 2, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('La CRAM Tours', 3, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Les Hotels Preston', 3, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Campaparc', 3, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('France Rapide', 4, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Aeroserge', 4, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Transprolo', 4, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('L\'Antenne Mercatique', 5, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Filmamax', 5, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Telefunnf', 5, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('L\'Ipimop', 6, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Les Mission. du Jug.', 6, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Promocreart', 6, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Credit Confinance', 7, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Benefa Fonds', 7, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('La Bancaire de Banque', 7, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Commutel', 8, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Kunkai', 8, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Solutisoft', 8, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Securisur', 9, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Groupe Ecoute & Gere', 9, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Neutropov', 9, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Impec\'Immo', 10, 'Droite');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Tapisol', 10, 'Gauche');
INSERT INTO Entreprises (Nom, SectID, Parti_politique) VALUES ('Betonbloc', 10, 'Droite');


CREATE TABLE Gentlemen
(
GenID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Nb_Fraudes int NOT NULL DEFAULT 0,
Taux_imposition int NOT NULL DEFAULT 0,
Taux_dividendes int NOT NULL DEFAULT 0,
PRIMARY KEY (GenID)
);

INSERT INTO Gentlemen (Nom) VALUES ('Jean-Jack');
INSERT INTO Gentlemen (Nom) VALUES ('Fol');
INSERT INTO Gentlemen (Nom) VALUES ('Gunard');
INSERT INTO Gentlemen (Nom) VALUES ('Invite Mystere');


CREATE TABLE Titres
(
TitID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Tarif int DEFAULT 0,
Actionnaire_MAJ int DEFAULT 0,
PRIMARY KEY (TitID)
);

INSERT INTO Titres (Nom) VALUES ('Carte Richelieu');
INSERT INTO Titres (Nom) VALUES ('Allo Coke');
INSERT INTO Titres (Nom) VALUES ('Burac');
INSERT INTO Titres (Nom) VALUES ('Contenerge');
INSERT INTO Titres (Nom) VALUES ('Cadeaugadget');
INSERT INTO Titres (Nom) VALUES ('Vector Editeur');
INSERT INTO Titres (Nom) VALUES ('Detectives Richard');
INSERT INTO Titres (Nom) VALUES ('Telepicerie');
INSERT INTO Titres (Nom) VALUES ('Croquenroute');
INSERT INTO Titres (Nom) VALUES ('Terre Mondiale');
INSERT INTO Titres (Nom) VALUES ('Casinos Vegas');
INSERT INTO Titres (Nom) VALUES ('Top Cassage');
INSERT INTO Titres (Nom) VALUES ('Coupe MerMarron');
INSERT INTO Titres (Nom) VALUES ('Filonor');


CREATE TABLE Portfolio
(
GenID int NOT NULL,
TitID int NOT NULL,
Nb int NOT NULL DEFAULT 0,
FOREIGN KEY (GenID) REFERENCES Gentlemen(GenID),
FOREIGN KEY (TitID) REFERENCES Titres(TitID)
);

CREATE TABLE Politique
(
PolID int NOT NULL AUTO_INCREMENT,
Nom varchar(255) NOT NULL,
Caisse_Noire int NOT NULL DEFAULT 0,
Actif BOOLEAN NOT NULL,
PRIMARY KEY (PolID)
);

INSERT INTO Politique (Nom, Actif) VALUES ('Droite', false);
INSERT INTO Politique (Nom, Actif) VALUES ('Gauche', true);


CREATE TABLE InfluenceBourse
(
EntID int NOT NULL,
TitID int NOT NULL,
Coef int NOT NULL DEFAULT 0,
FOREIGN KEY (EntID) REFERENCES Entreprises(EntID),
FOREIGN KEY (TitID) REFERENCES Titres(TitID)
);

DELETE FROM InfluenceBourse;
INSERT INTO InfluenceBourse VALUES (1, 5, 15);
INSERT INTO InfluenceBourse VALUES (1, 6, -30);
INSERT INTO InfluenceBourse VALUES (1, 8, 15);
INSERT INTO InfluenceBourse VALUES (1, 10, -10);
INSERT INTO InfluenceBourse VALUES (1, 13, 60);
INSERT INTO InfluenceBourse VALUES (1, 14, 50);
INSERT INTO InfluenceBourse VALUES (2, 4, 20);
INSERT INTO InfluenceBourse VALUES (2, 6, -30);
INSERT INTO InfluenceBourse VALUES (2, 9, 20);
INSERT INTO InfluenceBourse VALUES (2, 12, 20);
INSERT INTO InfluenceBourse VALUES (2, 13, 70);
INSERT INTO InfluenceBourse VALUES (3, 1, 30);
INSERT INTO InfluenceBourse VALUES (3, 2, 30);
INSERT INTO InfluenceBourse VALUES (3, 5, 20);
INSERT INTO InfluenceBourse VALUES (3, 9, -30);
INSERT INTO InfluenceBourse VALUES (3, 11, -30);
INSERT INTO InfluenceBourse VALUES (3, 13, 50);
INSERT INTO InfluenceBourse VALUES (3, 14, 30);
INSERT INTO InfluenceBourse VALUES (4, 1, 20);
INSERT INTO InfluenceBourse VALUES (4, 2, 70);
INSERT INTO InfluenceBourse VALUES (4, 7, -40);
INSERT INTO InfluenceBourse VALUES (4, 10, -20);
INSERT INTO InfluenceBourse VALUES (4, 11, 70);
INSERT INTO InfluenceBourse VALUES (5, 1, 50);
INSERT INTO InfluenceBourse VALUES (5, 2, 50);
INSERT INTO InfluenceBourse VALUES (5, 6, -20);
INSERT INTO InfluenceBourse VALUES (5, 7, -10);
INSERT INTO InfluenceBourse VALUES (5, 10, -20);
INSERT INTO InfluenceBourse VALUES (5, 11, 50);
INSERT INTO InfluenceBourse VALUES (6, 2, 50);
INSERT INTO InfluenceBourse VALUES (6, 3, 20);
INSERT INTO InfluenceBourse VALUES (6, 4, 30);
INSERT INTO InfluenceBourse VALUES (6, 7, 20);
INSERT INTO InfluenceBourse VALUES (6, 10, -30);
INSERT INTO InfluenceBourse VALUES (6, 11, 50);
INSERT INTO InfluenceBourse VALUES (6, 13, -40);
INSERT INTO InfluenceBourse VALUES (7, 3, -20);
INSERT INTO InfluenceBourse VALUES (7, 4, 30);
INSERT INTO InfluenceBourse VALUES (7, 5, 20);
INSERT INTO InfluenceBourse VALUES (7, 9, 60);
INSERT INTO InfluenceBourse VALUES (7, 10, -20);
INSERT INTO InfluenceBourse VALUES (7, 11, 30);
INSERT INTO InfluenceBourse VALUES (8, 1, 50);
INSERT INTO InfluenceBourse VALUES (8, 2, 30);
INSERT INTO InfluenceBourse VALUES (8, 3, 30);
INSERT INTO InfluenceBourse VALUES (8, 7, -20);
INSERT INTO InfluenceBourse VALUES (8, 10, -40);
INSERT INTO InfluenceBourse VALUES (8, 11, 50);
INSERT INTO InfluenceBourse VALUES (9, 4, 20);
INSERT INTO InfluenceBourse VALUES (9, 9, 60);
INSERT INTO InfluenceBourse VALUES (9, 11, -20);
INSERT INTO InfluenceBourse VALUES (9, 12, -20);
INSERT INTO InfluenceBourse VALUES (9, 13, 30);
INSERT INTO InfluenceBourse VALUES (9, 14, 30);
INSERT INTO InfluenceBourse VALUES (10, 1, -20);
INSERT INTO InfluenceBourse VALUES (10, 4, 60);
INSERT INTO InfluenceBourse VALUES (10, 9, 40);
INSERT INTO InfluenceBourse VALUES (10, 10, 20);
INSERT INTO InfluenceBourse VALUES (11, 1, 30);
INSERT INTO InfluenceBourse VALUES (11, 4, 40);
INSERT INTO InfluenceBourse VALUES (11, 5, 20);
INSERT INTO InfluenceBourse VALUES (11, 9, 30);
INSERT INTO InfluenceBourse VALUES (11, 10, -40);
INSERT INTO InfluenceBourse VALUES (11, 13, 20);
INSERT INTO InfluenceBourse VALUES (12, 4, 50);
INSERT INTO InfluenceBourse VALUES (12, 9, 40);
INSERT INTO InfluenceBourse VALUES (12, 10, 30);
INSERT INTO InfluenceBourse VALUES (12, 11, -20);
INSERT INTO InfluenceBourse VALUES (13, 1, 20);
INSERT INTO InfluenceBourse VALUES (13, 2, -20);
INSERT INTO InfluenceBourse VALUES (13, 3, 20);
INSERT INTO InfluenceBourse VALUES (13, 5, 20);
INSERT INTO InfluenceBourse VALUES (13, 6, 50);
INSERT INTO InfluenceBourse VALUES (13, 8, 30);
INSERT INTO InfluenceBourse VALUES (13, 12, -20);
INSERT INTO InfluenceBourse VALUES (14, 2, 30);
INSERT INTO InfluenceBourse VALUES (14, 3, -30);
INSERT INTO InfluenceBourse VALUES (14, 4, 30);
INSERT INTO InfluenceBourse VALUES (14, 5, 30);
INSERT INTO InfluenceBourse VALUES (14, 6, 40);
INSERT INTO InfluenceBourse VALUES (14, 7, -10);
INSERT INTO InfluenceBourse VALUES (14, 8, -5);
INSERT INTO InfluenceBourse VALUES (14, 9, 20);
INSERT INTO InfluenceBourse VALUES (14, 10, -20);
INSERT INTO InfluenceBourse VALUES (14, 11, 30);
INSERT INTO InfluenceBourse VALUES (14, 12, -10);
INSERT INTO InfluenceBourse VALUES (14, 13, -5);
INSERT INTO InfluenceBourse VALUES (15, 1, -30);
INSERT INTO InfluenceBourse VALUES (15, 3, 30);
INSERT INTO InfluenceBourse VALUES (15, 6, 20);
INSERT INTO InfluenceBourse VALUES (15, 8, 20);
INSERT INTO InfluenceBourse VALUES (15, 10, 30);
INSERT INTO InfluenceBourse VALUES (15, 12, -20);
INSERT INTO InfluenceBourse VALUES (15, 13, 30);
INSERT INTO InfluenceBourse VALUES (15, 14, 20);
INSERT INTO InfluenceBourse VALUES (16, 1, 20);
INSERT INTO InfluenceBourse VALUES (16, 3, 20);
INSERT INTO InfluenceBourse VALUES (16, 4, -10);
INSERT INTO InfluenceBourse VALUES (16, 6, 20);
INSERT INTO InfluenceBourse VALUES (16, 7, 40);
INSERT INTO InfluenceBourse VALUES (16, 8, 40);
INSERT INTO InfluenceBourse VALUES (16, 12, -10);
INSERT INTO InfluenceBourse VALUES (16, 14, -20);
INSERT INTO InfluenceBourse VALUES (17, 2, 20);
INSERT INTO InfluenceBourse VALUES (17, 5, -20);
INSERT INTO InfluenceBourse VALUES (17, 6, -30);
INSERT INTO InfluenceBourse VALUES (17, 7, 50);
INSERT INTO InfluenceBourse VALUES (17, 9, -20);
INSERT INTO InfluenceBourse VALUES (17, 10, 40);
INSERT INTO InfluenceBourse VALUES (17, 11, 30);
INSERT INTO InfluenceBourse VALUES (17, 12, 20);
INSERT INTO InfluenceBourse VALUES (17, 14, 10);
INSERT INTO InfluenceBourse VALUES (18, 2, 40);
INSERT INTO InfluenceBourse VALUES (18, 4, -20);
INSERT INTO InfluenceBourse VALUES (18, 5, 60);
INSERT INTO InfluenceBourse VALUES (18, 8, 30);
INSERT INTO InfluenceBourse VALUES (18, 12, -20);
INSERT INTO InfluenceBourse VALUES (18, 13, 20);
INSERT INTO InfluenceBourse VALUES (18, 14, -10);
INSERT INTO InfluenceBourse VALUES (19, 1, 40);
INSERT INTO InfluenceBourse VALUES (19, 3, 30);
INSERT INTO InfluenceBourse VALUES (19, 5, 20);
INSERT INTO InfluenceBourse VALUES (19, 7, -20);
INSERT INTO InfluenceBourse VALUES (19, 8, 60);
INSERT INTO InfluenceBourse VALUES (19, 11, -30);
INSERT INTO InfluenceBourse VALUES (20, 1, 60);
INSERT INTO InfluenceBourse VALUES (20, 7, 20);
INSERT INTO InfluenceBourse VALUES (20, 8, 20);
INSERT INTO InfluenceBourse VALUES (20, 10, -30);
INSERT INTO InfluenceBourse VALUES (20, 11, 30);
INSERT INTO InfluenceBourse VALUES (21, 1, 65);
INSERT INTO InfluenceBourse VALUES (21, 3, 25);
INSERT INTO InfluenceBourse VALUES (21, 4, 5);
INSERT INTO InfluenceBourse VALUES (21, 8, -5);
INSERT INTO InfluenceBourse VALUES (21, 10, -40);
INSERT INTO InfluenceBourse VALUES (21, 11, 40);
INSERT INTO InfluenceBourse VALUES (21, 12, 5);
INSERT INTO InfluenceBourse VALUES (21, 14, 5);
INSERT INTO InfluenceBourse VALUES (22, 2, 20);
INSERT INTO InfluenceBourse VALUES (22, 3, 30);
INSERT INTO InfluenceBourse VALUES (22, 6, -30);
INSERT INTO InfluenceBourse VALUES (22, 7, 30);
INSERT INTO InfluenceBourse VALUES (22, 8, 50);
INSERT INTO InfluenceBourse VALUES (22, 12, -10);
INSERT INTO InfluenceBourse VALUES (22, 13, 20);
INSERT INTO InfluenceBourse VALUES (22, 14, -10);
INSERT INTO InfluenceBourse VALUES (23, 2, -10);
INSERT INTO InfluenceBourse VALUES (23, 3, 30);
INSERT INTO InfluenceBourse VALUES (23, 4, -10);
INSERT INTO InfluenceBourse VALUES (23, 5, -10);
INSERT INTO InfluenceBourse VALUES (23, 6, 30);
INSERT INTO InfluenceBourse VALUES (23, 8, 20);
INSERT INTO InfluenceBourse VALUES (23, 9, -10);
INSERT INTO InfluenceBourse VALUES (23, 10, 20);
INSERT INTO InfluenceBourse VALUES (23, 11, 30);
INSERT INTO InfluenceBourse VALUES (23, 12, -10);
INSERT INTO InfluenceBourse VALUES (23, 14, 20);
INSERT INTO InfluenceBourse VALUES (24, 1, 40);
INSERT INTO InfluenceBourse VALUES (24, 3, 40);
INSERT INTO InfluenceBourse VALUES (24, 6, -30);
INSERT INTO InfluenceBourse VALUES (24, 7, 30);
INSERT INTO InfluenceBourse VALUES (24, 8, 40);
INSERT INTO InfluenceBourse VALUES (24, 12, -10);
INSERT INTO InfluenceBourse VALUES (24, 14, -10);
INSERT INTO InfluenceBourse VALUES (25, 1, 30);
INSERT INTO InfluenceBourse VALUES (25, 2, -40);
INSERT INTO InfluenceBourse VALUES (25, 7, 70);
INSERT INTO InfluenceBourse VALUES (25, 10, -20);
INSERT INTO InfluenceBourse VALUES (25, 11, 30);
INSERT INTO InfluenceBourse VALUES (25, 14, 30);
INSERT INTO InfluenceBourse VALUES (26, 1, -10);
INSERT INTO InfluenceBourse VALUES (26, 2, -60);
INSERT INTO InfluenceBourse VALUES (26, 4, 10);
INSERT INTO InfluenceBourse VALUES (26, 6, 50);
INSERT INTO InfluenceBourse VALUES (26, 7, 20);
INSERT INTO InfluenceBourse VALUES (26, 9, 10);
INSERT INTO InfluenceBourse VALUES (26, 10, 80);
INSERT INTO InfluenceBourse VALUES (26, 11, -40);
INSERT INTO InfluenceBourse VALUES (26, 12, 10);
INSERT INTO InfluenceBourse VALUES (26, 14, 30);
INSERT INTO InfluenceBourse VALUES (27, 3, 30);
INSERT INTO InfluenceBourse VALUES (27, 4, 40);
INSERT INTO InfluenceBourse VALUES (27, 7, 20);
INSERT INTO InfluenceBourse VALUES (27, 10, -40);
INSERT INTO InfluenceBourse VALUES (27, 12, 50);
INSERT INTO InfluenceBourse VALUES (28, 1, 20);
INSERT INTO InfluenceBourse VALUES (28, 2, 10);
INSERT INTO InfluenceBourse VALUES (28, 3, 20);
INSERT INTO InfluenceBourse VALUES (28, 10, -30);
INSERT INTO InfluenceBourse VALUES (28, 12, 60);
INSERT INTO InfluenceBourse VALUES (28, 14, 20);
INSERT INTO InfluenceBourse VALUES (29, 3, 50);
INSERT INTO InfluenceBourse VALUES (29, 4, 10);
INSERT INTO InfluenceBourse VALUES (29, 9, -20);
INSERT INTO InfluenceBourse VALUES (29, 10, -20);
INSERT INTO InfluenceBourse VALUES (29, 11, 30);
INSERT INTO InfluenceBourse VALUES (29, 12, 10);
INSERT INTO InfluenceBourse VALUES (29, 13, -10);
INSERT INTO InfluenceBourse VALUES (29, 14, 50);
INSERT INTO InfluenceBourse VALUES (30, 1, -10);
INSERT INTO InfluenceBourse VALUES (30, 2, 10);
INSERT INTO InfluenceBourse VALUES (30, 4, 60);
INSERT INTO InfluenceBourse VALUES (30, 10, -30);
INSERT INTO InfluenceBourse VALUES (30, 12, 70);
INSERT INTO InfluenceBourse VALUES (30, 13, 10);
INSERT INTO InfluenceBourse VALUES (30, 14, -10);

CREATE TABLE Taux_dividendes_titres
(
TitID int NOT NULL,
Taux_dividendes int NOT NULL DEFAULT 0,
FOREIGN KEY (TitID) REFERENCES Titres(TitID)
);

CREATE VIEW RECAP_PORTFOLIO_TEMP AS select Gentlemen.genID, Gentlemen.nom as Gentleman, Titres.nom as Titre, Titres.titID, Portfolio.Nb, Portfolio.Nb*Titres.tarif AS Montant from Gentlemen, Titres, Portfolio where Gentlemen.genID=Portfolio.GenID and Titres.titID=Portfolio.titID and Portfolio.nb<>0 ;
CREATE VIEW RECAP_PORTFOLIO AS select RECAP_PORTFOLIO_TEMP.*, RECAP_PORTFOLIO_TEMP.genID=Titres.Actionnaire_MAJ as is_majoritaire from RECAP_PORTFOLIO_TEMP LEFT JOIN Titres ON RECAP_PORTFOLIO_TEMP.titID=Titres.titID ORDER BY RECAP_PORTFOLIO_TEMP.Titre ASC;
CREATE VIEW RECAP_TITRES_TEMP AS select Titres.titID, Titres.nom as Titre, Titres.tarif, sum(Portfolio.nb) as total_possedes, Titres.Actionnaire_MAJ from Titres, Portfolio where Titres.titID=Portfolio.titID group by Titres.TitID;
CREATE VIEW RECAP_TITRES AS select TitID, Titre, RECAP_TITRES_TEMP.tarif, RECAP_TITRES_TEMP.total_possedes, Gentlemen.Nom as Gentleman_majoritaire, RECAP_TITRES_TEMP.Actionnaire_MAJ as MajID from RECAP_TITRES_TEMP LEFT JOIN Gentlemen ON RECAP_TITRES_TEMP.Actionnaire_MAJ=Gentlemen.GenID;
CREATE VIEW RECAP_DERRICKS AS select MajID, COUNT(*) as Nb_Derricks from RECAP_TITRES group by MajID;
CREATE VIEW RECAP_GENTLEMEN AS select Gentlemen.*, Nb_Derricks from Gentlemen LEFT JOIN RECAP_DERRICKS on Gentlemen.GenID=RECAP_DERRICKS.MajID;
CREATE VIEW TARIFS_FROM_BOURSE AS select InfluenceBourse.EntID, SUM(InfluenceBourse.Coef*Titres.tarif/100) as TarifFromBourse from InfluenceBourse LEFT JOIN Titres ON InfluenceBourse.TitID=Titres.TitID GROUP BY EntID;
CREATE VIEW RECAP_IMPOTS_TEMP1 AS select RECAP_PORTFOLIO.*, valeur as Arrondi from RECAP_PORTFOLIO left join Constantes on Constantes.nom="ARRONDI_TARIF_ENT";
CREATE VIEW RECAP_IMPOTS_TEMP AS select genID, SUM(Montant) as Capital, arrondi from RECAP_IMPOTS_TEMP1 group by genID;
CREATE VIEW RECAP_IMPOTS AS select Gentlemen.genID, Gentlemen.Nom, Gentlemen.Taux_imposition, Capital, 500*CEILING(((RECAP_IMPOTS_TEMP.Capital*Gentlemen.Taux_imposition)/100)/500) as Impots from RECAP_IMPOTS_TEMP LEFT JOIN  Gentlemen ON Gentlemen.genID=RECAP_IMPOTS_TEMP.genID;
CREATE VIEW RECAP_DIVIDENDES AS select Gentlemen.genID, Gentlemen.Nom, Gentlemen.Taux_dividendes, Capital, 500*CEILING(((RECAP_IMPOTS_TEMP.Capital*Gentlemen.Taux_dividendes)/100)/500) as Dividendes from RECAP_IMPOTS_TEMP LEFT JOIN  Gentlemen ON Gentlemen.genID=RECAP_IMPOTS_TEMP.genID;


DELIMITER |
CREATE PROCEDURE init_portfolio()
	BEGIN
	DECLARE nb_gentlemen INT DEFAULT 0;
	DECLARE nb_titres INT DEFAULT 0;
	select count(*) into nb_gentlemen from Gentlemen;
	WHILE nb_gentlemen > 0 DO
		select count(*) into nb_titres from Titres;
		WHILE nb_titres > 0 DO
			INSERT INTO Portfolio (GenID, TitID) VALUES(nb_gentlemen, nb_titres);
			SET nb_titres = nb_titres - 1;
		END WHILE;
		SET nb_gentlemen = nb_gentlemen - 1;
	END WHILE;
	END	|

CREATE PROCEDURE compute_actionnaire_maj_titres(IN TitreID INT)
	BEGIN
	DECLARE nb_total_possedes INT DEFAULT 0;
	DECLARE nb_max_possedes INT DEFAULT 0;
	DECLARE id_act_maj INT DEFAULT 0;
	select sum(Nb) into nb_total_possedes from Portfolio where TitID=TitreID;
	select max(Nb) into nb_max_possedes from Portfolio where TitID=TitreID;
	IF (nb_total_possedes>49 AND nb_max_possedes>nb_total_possedes/2) THEN
		select genID into id_act_maj from Portfolio where TitID=TitreID AND nb=nb_max_possedes;
	END IF ;
	UPDATE Titres SET Actionnaire_MAJ=id_act_maj where TitID=TitreID;
	END |


CREATE PROCEDURE compute_tarif_titre(IN TitreID INT)
	BEGIN
	DECLARE tarif_titre_init INT DEFAULT 0;
	DECLARE nb_titres_emis INT DEFAULT 0;
	DECLARE delta_emis INT DEFAULT 0;
	DECLARE volatilite INT DEFAULT 0;
	select valeur into tarif_titre_init from Constantes where nom ='TARIF_TITRE_INIT';
	select sum(nb) into nb_titres_emis from Portfolio where TitID=TitreID;
	select valeur into delta_emis from Constantes where nom='DELTA_TITRE_EMIS';
	select valeur into volatilite from Constantes where nom='VOLATILITE_TITRES_PCT';
	UPDATE Titres SET tarif=ROUND((tarif_titre_init+delta_emis*nb_titres_emis)*(1+(RAND()*2-1)*(volatilite/100))) where TitID=TitreID;
	END |


CREATE PROCEDURE compute_titres()
	BEGIN
	DECLARE nb_titres INT DEFAULT 0;
	select count(*) into nb_titres from Titres;
	WHILE nb_titres > 0 DO
		CALL compute_tarif_titre(nb_titres);
		CALL compute_actionnaire_maj_titres(nb_titres);
		SET nb_titres = nb_titres - 1;
	END WHILE;
	END |


CREATE PROCEDURE compute_tarif_entreprise(IN EntrepriseID INT)
	BEGIN
	DECLARE tarif_entreprise_from_bourse INT DEFAULT 0;
	DECLARE montant_ui INT DEFAULT 0;
	DECLARE valo_ui INT DEFAULT 0;
	DECLARE arrondi INT DEFAULT 0;
	DECLARE influence_politique INT DEFAULT 10;
	select TarifFromBourse into tarif_entreprise_from_bourse from TARIFS_FROM_BOURSE where EntID=EntrepriseID;
	select valeur into valo_ui from Constantes where nom ='VALO_UI_PCT';
	select valeur into arrondi from Constantes where nom ='ARRONDI_TARIF_ENT';
	select (ui*valo_ui/100) into montant_ui from Entreprises where EntID=EntrepriseID;
	UPDATE Entreprises SET tarif=arrondi*CEILING((tarif_entreprise_from_bourse*influence_politique+montant_ui)/arrondi) where EntID=EntrepriseID;
	END |

CREATE PROCEDURE update_taux_imposition()
		BEGIN
		DECLARE taux_max INT DEFAULT 0;
		DECLARE taux_min INT DEFAULT 0;
		select valeur into taux_max from Constantes where nom ='TAUX_MAX_IMPOTS';
		select valeur into taux_min from Constantes where nom ='TAUX_MIN_IMPOTS';
		UPDATE Gentlemen SET taux_imposition=(RAND()*(taux_max-taux_min)+taux_min);
		END |

CREATE PROCEDURE update_taux_dividendes()
		BEGIN
		DECLARE taux_max INT DEFAULT 0;
		DECLARE taux_min INT DEFAULT 0;
		select valeur into taux_max from Constantes where nom ='TAUX_MAX_DIVIDENDES';
		select valeur into taux_min from Constantes where nom ='TAUX_MIN_DIVIDENDES';
		UPDATE Gentlemen SET taux_dividendes=(RAND()*(taux_max-taux_min)+taux_min);
		END |

CREATE PROCEDURE compute_procash()
	BEGIN
	DECLARE new_procash INT DEFAULT 0;
	DECLARE arrondi INT DEFAULT 0;
	select valeur into arrondi from Constantes where nom ='ARRONDI_TARIF_ENT';
	select arrondi*CEILING(avg(tarif)/arrondi) into new_procash from Entreprises;
	UPDATE Constantes SET valeur=new_procash where nom='PROCASH';
	END |


CREATE PROCEDURE compute_entreprises()
	BEGIN
	DECLARE nb_entreprises INT DEFAULT 0;
	select count(*) into nb_entreprises from Entreprises;
	WHILE nb_entreprises > 0 DO
		CALL compute_tarif_entreprise(nb_entreprises);
		SET nb_entreprises = nb_entreprises - 1;
	END WHILE;
	CALL compute_procash();
	END |


CREATE PROCEDURE set_ui(IN EntrepriseID INT, IN montantUI INT)
	BEGIN
	UPDATE Entreprises SET UI=montantUI where EntID=EntrepriseID;
	END |


CREATE PROCEDURE set_fraudes(IN GentlemanID INT, IN quantiteFRAUDES INT)
	BEGIN
	UPDATE Gentlemen SET Nb_Fraudes=quantiteFRAUDES where GenID=GentlemanID;
	END |


CREATE PROCEDURE add_ui (IN EntrepriseID INT, IN montantUI INT)
	BEGIN
	DECLARE new_montantUI INT DEFAULT 0;
	SELECT UI+montantUI into new_montantUI from Entreprises where EntID=EntrepriseID;
	CALL set_ui(EntrepriseID, new_montantUI);
	CALL compute_entreprises();
	END |


CREATE PROCEDURE add_fraudes (IN GentlemanID INT, IN quantiteFRAUDES INT)
	BEGIN
	DECLARE new_quantiteFRAUDES INT DEFAULT 0;
	SELECT Nb_Fraudes+quantiteFRAUDES into new_quantiteFRAUDES from Gentlemen where GenID=GentlemanID;
	CALL set_fraudes(GentlemanID, new_quantiteFRAUDES);
	END |


CREATE PROCEDURE init_bib()
	BEGIN
	DECLARE nb_gentlemen INT DEFAULT 0;
	-- remise des UI a 0
	DECLARE nb_entreprises INT DEFAULT 0;
	select count(*) into nb_entreprises from Entreprises;
	WHILE nb_entreprises > 0 DO
		CALL set_ui(nb_entreprises,0);
		SET nb_entreprises = nb_entreprises - 1;
	END WHILE;
	select count(*) into nb_gentlemen from Gentlemen;
	WHILE nb_gentlemen > 0 DO
		CALL set_fraudes(nb_gentlemen,0);
		SET nb_gentlemen = nb_gentlemen - 1;
	END WHILE;
	-- remise a 0 du portfolio
	DELETE FROM Portfolio;
	CALL init_portfolio();
	CALL compute_titres();
	CALL compute_entreprises();
	END |

CREATE PROCEDURE achat_titres(IN GentlemanID INT, IN TitreID INT, IN NbAchetes INT)
	BEGIN
	DECLARE nb_possedes INT DEFAULT 0;
	select NbAchetes+Nb into nb_possedes from Portfolio where GenID=GentlemanID AND TitID=TitreID;
	UPDATE Portfolio SET Nb=nb_possedes where GenID=GentlemanID AND TitID=TitreID;
	CALL compute_actionnaire_maj_titres(TitreID);
	CALL compute_titres();
	CALL compute_entreprises();
	END |

CREATE PROCEDURE declenche_elections()
	BEGIN
	DECLARE cn_droite INT DEFAULT 0;
	DECLARE cn_gauche INT DEFAULT 0;
	DECLARE gagnant INT DEFAULT 0;
	UPDATE Politique SET Actif=0 where Actif=1;
	select Caisse_Noire into cn_droite from Politique where Nom LIKE 'Droite';
	select Caisse_Noire into cn_gauche from Politique where Nom LIKE 'Gauche';
	IF ((cn_droite+cn_gauche)=0) THEN SET gagnant = FLOOR(2*RAND())+1;
		ELSEIF (cn_droite=0) THEN SET gagnant = 2;
		ELSEIF (cn_gauche=0) THEN SET gagnant = 1;
		ELSE SET gagnant = ((cn_droite+cn_gauche)*RAND()>cn_droite)+1;
	END IF;
	UPDATE Politique SET Actif=1 where PolID=gagnant;
	UPDATE Politique SET Caisse_Noire=0;
	CALL compute_entreprises();
	END |


CREATE PROCEDURE add_caisse_noire (IN PolitiqueID INT, IN montant INT)
	BEGIN
	DECLARE new_montant INT DEFAULT 0;
	SELECT Caisse_Noire+montant into new_montant from Politique where PolID=PolitiqueID;
	UPDATE Politique SET Caisse_Noire=new_montant where PolID=PolitiqueID;
	END |


DELIMITER ;


CALL init_bib();

COMMIT;
