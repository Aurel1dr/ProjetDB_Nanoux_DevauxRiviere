ALTER TABLE Tournoi
   ADD CONSTRAINT chk_surface 
   CHECK (surface IN ('Gazon', 'Terre battue', 'Dur'));

ALTER TABLE Tournoi
   ADD CONSTRAINT chk_pays 
   CHECK (pays <> '');

ALTER TABLE Edition
   ADD CONSTRAINT chk_annee 
   CHECK (annee >= 1877 AND annee <= 2100);

ALTER TABLE Edition
   ADD CONSTRAINT chk_dates_edition 
   CHECK (date_fin > date_debut);

ALTER TABLE Match_
   ADD CONSTRAINT chk_tour 
   CHECK (tour IN ('1er tour', '2ème tour', '3ème tour', '4ème tour', 'Quarts de finale', 'Demi-finale', 'Finale'));

ALTER TABLE Match_
   ADD CONSTRAINT chk_duree 
   CHECK (duree > 0);

ALTER TABLE Match_
   ADD CONSTRAINT chk_nombre_sets 
   CHECK (nombre_sets BETWEEN 1 AND 5);

ALTER TABLE Set_
   ADD CONSTRAINT chk_numero_set 
   CHECK (numero_set BETWEEN 1 AND 5);

ALTER TABLE Set_
   ADD CONSTRAINT chk_jeux_j1 
   CHECK (jeux_j1 >= 0);

ALTER TABLE Set_
   ADD CONSTRAINT chk_jeux_j2 
   CHECK (jeux_j2 >= 0);

ALTER TABLE Joueur
   ADD CONSTRAINT chk_classement 
   CHECK (classement > 0);

ALTER TABLE Joueur
   ADD CONSTRAINT chk_nombre_titres 
   CHECK (nombre_titres >= 0);

ALTER TABLE Joueur
   ADD CONSTRAINT chk_victoires 
   CHECK (victoires >= 0);

ALTER TABLE Joueur
   ADD CONSTRAINT chk_date_naissance 
   CHECK (date_naissance >= '1900-01-01');

ALTER TABLE Disputer
   ADD CONSTRAINT chk_role 
   CHECK (role IN ('joueur1', 'joueur2'));

ALTER TABLE Disputer
   ADD CONSTRAINT chk_resultat 
   CHECK (resultat IN ('victoire', 'defaite'));

ALTER TABLE Arbitre
   ADD CONSTRAINT chk_certification 
   CHECK (niveau_certification IN ('Bronze', 'Argent', 'Or', 'Platine'));