SELECT nom_joueur, prenom_joueur, nationalite_joueur, classement
FROM Joueur
ORDER BY classement ASC;

SELECT nom_joueur, prenom_joueur, classement
FROM Joueur
WHERE classement BETWEEN 1 AND 10
ORDER BY classement ASC;

SELECT nom_joueur, prenom_joueur, nationalite_joueur
FROM Joueur
WHERE nationalite_joueur IN ('Espagne', 'Italie')
ORDER BY nationalite_joueur;

SELECT nom_joueur, prenom_joueur, nationalite_joueur
FROM Joueur
WHERE nom_joueur LIKE 'D%';

SELECT DISTINCT nationalite_joueur
FROM Joueur
ORDER BY nationalite_joueur;

SELECT id_match, tour, duree, score_global
FROM Match_
WHERE tour IN ('Finale', 'Demi-finale')
ORDER BY duree DESC;

SELECT id_tournoi, id_edition, annee, date_debut, date_fin
FROM Edition
WHERE annee = 2024
ORDER BY date_debut;

SELECT tour, COUNT(*) AS nombre_matchs
FROM Match_
GROUP BY tour
ORDER BY nombre_matchs DESC;

SELECT t.nom_tournoi, ROUND(AVG(m.duree), 2) AS duree_moyenne
FROM Match_ m
JOIN Edition e ON m.id_tournoi = e.id_tournoi AND m.id_edition = e.id_edition
JOIN Tournoi t ON e.id_tournoi = t.id_tournoi
GROUP BY t.nom_tournoi
ORDER BY duree_moyenne DESC;

SELECT j.nom_joueur, j.prenom_joueur, COUNT(*) AS nb_victoires
FROM Disputer d
JOIN Joueur j ON d.id_joueur = j.id_joueur
WHERE d.resultat = 'victoire'
GROUP BY j.id_joueur, j.nom_joueur, j.prenom_joueur
HAVING COUNT(*) >= 2
ORDER BY nb_victoires DESC;

SELECT t.nom_tournoi, e.annee, COUNT(m.id_match) AS nb_matchs
FROM Edition e
JOIN Tournoi t ON e.id_tournoi = t.id_tournoi
LEFT JOIN Match_ m ON e.id_tournoi = m.id_tournoi AND e.id_edition = m.id_edition
GROUP BY t.nom_tournoi, e.annee
ORDER BY t.nom_tournoi, e.annee;

SELECT t.nom_tournoi, ROUND(AVG(m.nombre_sets), 2) AS moy_sets
FROM Match_ m
JOIN Edition e ON m.id_tournoi = e.id_tournoi AND m.id_edition = e.id_edition
JOIN Tournoi t ON e.id_tournoi = t.id_tournoi
GROUP BY t.nom_tournoi
HAVING AVG(m.nombre_sets) > 3;

SELECT a.nom_arbitre, a.prenom_arbitre, COUNT(*) AS nb_matchs_arbitres
FROM Arbitrer ar
JOIN Arbitre a ON ar.id_arbitre = a.id_arbitre
GROUP BY a.id_arbitre, a.nom_arbitre, a.prenom_arbitre
ORDER BY nb_matchs_arbitres DESC;

SELECT j.nom_joueur, j.prenom_joueur, m.tour, m.score_global, d.resultat
FROM Joueur j
JOIN Disputer d ON j.id_joueur = d.id_joueur
JOIN Match_ m ON d.id_match = m.id_match
ORDER BY j.nom_joueur;

SELECT t.nom_tournoi, e.annee, m.tour, m.duree, m.score_global
FROM Match_ m
JOIN Edition e ON m.id_tournoi = e.id_tournoi AND m.id_edition = e.id_edition
JOIN Tournoi t ON e.id_tournoi = t.id_tournoi
ORDER BY t.nom_tournoi, e.annee;

SELECT j.nom_joueur, j.prenom_joueur, COUNT(d.id_match) AS nb_matchs
FROM Joueur j
LEFT JOIN Disputer d ON j.id_joueur = d.id_joueur
GROUP BY j.id_joueur, j.nom_joueur, j.prenom_joueur
ORDER BY nb_matchs DESC;

SELECT a.nom_arbitre, a.prenom_arbitre, p.libelle AS poste, m.tour, m.score_global
FROM Arbitrer ar
JOIN Arbitre a ON ar.id_arbitre = a.id_arbitre
JOIN Poste p ON ar.id_poste = p.id_poste
JOIN Match_ m ON ar.id_match = m.id_match
ORDER BY a.nom_arbitre;

SELECT t.nom_tournoi, t.surface, e.annee
FROM Tournoi t
LEFT JOIN Edition e ON t.id_tournoi = e.id_tournoi AND e.annee = 2024
ORDER BY t.nom_tournoi;

SELECT j1.nom_joueur AS joueur1, j2.nom_joueur AS joueur2
FROM Affronter a
JOIN Joueur j1 ON a.id_joueur = j1.id_joueur
JOIN Joueur j2 ON a.id_joueur_1 = j2.id_joueur
ORDER BY j1.nom_joueur;

SELECT nom_joueur, prenom_joueur
FROM Joueur
WHERE id_joueur IN (
    SELECT d.id_joueur
    FROM Disputer d
    JOIN Match_ m ON d.id_match = m.id_match
    WHERE m.tour = 'Finale'
);

SELECT nom_joueur, prenom_joueur
FROM Joueur
WHERE id_joueur NOT IN (
    SELECT id_joueur
    FROM Disputer
    WHERE resultat = 'defaite'
);

SELECT id_match, tour, duree, score_global
FROM Match_
WHERE duree > ANY (
    SELECT AVG(duree)
    FROM Match_
);

SELECT nom_joueur, prenom_joueur, classement
FROM Joueur
WHERE classement < ALL (
    SELECT classement
    FROM Joueur
    WHERE nationalite_joueur = 'Italie'
);

SELECT t.nom_tournoi, t.surface
FROM Tournoi t
WHERE EXISTS (
    SELECT 1
    FROM Edition e
    JOIN Match_ m ON e.id_tournoi = m.id_tournoi AND e.id_edition = m.id_edition
    WHERE e.id_tournoi = t.id_tournoi
    AND m.tour = 'Finale'
);

SELECT j.nom_joueur, j.prenom_joueur
FROM Joueur j
WHERE NOT EXISTS (
    SELECT 1
    FROM Disputer d
    JOIN Match_ m ON d.id_match = m.id_match
    JOIN Edition e ON m.id_tournoi = e.id_tournoi AND m.id_edition = e.id_edition
    WHERE d.id_joueur = j.id_joueur
    AND e.id_tournoi = 1
);