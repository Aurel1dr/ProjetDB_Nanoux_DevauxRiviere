CREATE TABLE Tournoi(
   id_tournoi INT,
   nom_tournoi VARCHAR(50),
   ville VARCHAR(50),
   pays VARCHAR(50),
   surface VARCHAR(20),
   PRIMARY KEY(id_tournoi)
);

CREATE TABLE Edition(
   id_tournoi INT,
   id_edition INT,
   annee INT,
   date_debut DATE,
   date_fin DATE,
   PRIMARY KEY(id_tournoi, id_edition),
   FOREIGN KEY(id_tournoi) REFERENCES Tournoi(id_tournoi)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE Joueur(
   id_joueur INT,
   nom_joueur VARCHAR(50),
   prenom_joueur VARCHAR(50),
   nationalite_joueur VARCHAR(30),
   date_naissance DATE,
   classement INT,
   nombre_titres INT,
   victoires INT,
   PRIMARY KEY(id_joueur)
);

CREATE TABLE Match_(
   id_match INT,
   tour VARCHAR(30),
   duree INT,
   score_global VARCHAR(20),
   nombre_sets INT,
   id_tournoi INT NOT NULL,
   id_edition INT NOT NULL,
   PRIMARY KEY(id_match),
   FOREIGN KEY(id_tournoi, id_edition) REFERENCES Edition(id_tournoi, id_edition)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE Set_(
   id_set INT,
   id_match INT NOT NULL,
   numero_set INT,
   jeux_j1 INT,
   jeux_j2 INT,
   PRIMARY KEY(id_set),
   FOREIGN KEY(id_match) REFERENCES Match_(id_match)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE Arbitre(
   id_arbitre INT,
   nom_arbitre VARCHAR(50),
   prenom_arbitre VARCHAR(50),
   nationalite_arbitre VARCHAR(30),
   niveau_certification VARCHAR(20),
   PRIMARY KEY(id_arbitre)
);

CREATE TABLE Poste(
   id_poste INT,
   libelle VARCHAR(50),
   PRIMARY KEY(id_poste)
);

CREATE TABLE Disputer(
   id_joueur INT,
   id_match INT,
   role VARCHAR(10),
   resultat VARCHAR(10),
   PRIMARY KEY(id_joueur, id_match),
   FOREIGN KEY(id_joueur) REFERENCES Joueur(id_joueur)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   FOREIGN KEY(id_match) REFERENCES Match_(id_match)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE Affronter(
   id_joueur INT,
   id_joueur_1 INT,
   PRIMARY KEY(id_joueur, id_joueur_1),
   FOREIGN KEY(id_joueur) REFERENCES Joueur(id_joueur)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   FOREIGN KEY(id_joueur_1) REFERENCES Joueur(id_joueur)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

CREATE TABLE Arbitrer(
   id_match INT,
   id_arbitre INT,
   id_poste INT,
   PRIMARY KEY(id_match, id_arbitre, id_poste),
   FOREIGN KEY(id_match) REFERENCES Match_(id_match)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   FOREIGN KEY(id_arbitre) REFERENCES Arbitre(id_arbitre)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   FOREIGN KEY(id_poste) REFERENCES Poste(id_poste)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);