# ProjetDB_Nanoux_DevauxRiviere
Mini projet Base de données

## Prompt Chatgpt :

Tu travailles dans le domaine des bases de données +.

Ton organisation sportive internationale a comme activité de gérer et analyser les informations relatives aux tournois du Grand Chelemn de tennis.

C’est une organisation comme la Fédération Internationale de Tennis (ITF), l’ATP ou la WTA.

Les données ont été collectées sur les joueurs, les tournois, les éditions annuelles, les matchs et les résultats sportifs.

Inspire-toi des sites web officiels et bases statistiques sportives suivants :

- https://www.itftennis.com
- https://www.atptour.com
- https://www.wtatennis.com
- https://www.rolandgarros.com
- https://www.wimbledon.com

Ton organisation veut appliquer MERISE pour concevoir un système d'information.

Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise.

Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.

D’abord, établis les règles de gestions des données de ton organisation sous la forme d'une liste à puce.

Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau :

- signification de la donnée
- type
- taille en nombre de caractères ou de chiffres

Il doit y avoir entre 25 et 35 données.

Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

Fournis donc les règles de gestion et le dictionnaire de données.

---

## Réponse de L'IAG

Grand maître Augustin 👑, voici le résultat attendu de l’IAG.

### Règles de gestion des données

- Un tournoi du Grand Chelem est identifié par un nom, un lieu et une surface.
- Un tournoi possède plusieurs éditions (une par année).
- Une édition appartient à un seul tournoi.
- Une édition contient plusieurs matchs.
- Un match appartient à une seule édition.
- Un match oppose exactement deux joueurs.
- Un match produit un vainqueur et un perdant.
- Un match possède un score et une durée.
- Un joueur est identifié par un numéro unique.
- Un joueur possède un nom, prénom, nationalité et date de naissance.
- Un joueur peut participer à plusieurs éditions.
- Un joueur peut disputer plusieurs matchs.
- Un score peut être détaillé par sets.
- Un match appartient à un tour (1er tour, quart, demi-finale, finale…).
- Une édition possède une date de début et une date de fin.
- Le classement d’un joueur évolue dans le temps.
- Un joueur peut gagner plusieurs titres.
- Une édition désigne un vainqueur final.

### Dictionnaire de données brutes

| Signification de la donnée | Type | Taille |
|----------------------------|------|--------|
| Identifiant tournoi | Entier | 10 chiffres |
| Nom tournoi | Texte | 50 caractères |
| Ville tournoi | Texte | 50 caractères |
| Pays tournoi | Texte | 50 caractères |
| Surface | Texte | 20 caractères |
| Identifiant édition | Entier | 10 chiffres |
| Année | Entier | 4 chiffres |
| Date début édition | Date | — |
| Date fin édition | Date | — |
| Identifiant match | Entier | 10 chiffres |
| Tour du match | Texte | 30 caractères |
| Durée match (minutes) | Entier | 4 chiffres |
| Score global | Texte | 20 caractères |
| Identifiant joueur | Entier | 10 chiffres |
| Nom joueur | Texte | 50 caractères |
| Prénom joueur | Texte | 50 caractères |
| Nationalité joueur | Texte | 30 caractères |
| Date naissance joueur | Date | — |
| Classement joueur | Entier | 4 chiffres |
| Résultat match | Texte | 10 caractères |
| Rôle joueur match | Texte | 10 caractères |
| Nombre sets | Entier | 2 chiffres |
| Jeux joueur 1 | Entier | 2 chiffres |
| Jeux joueur 2 | Entier | 2 chiffres |
| Identifiant set | Entier | 10 chiffres |
| Numéro set | Entier | 1 chiffre |
| Vainqueur match | Entier | 10 chiffres |
| Perdant match | Entier | 10 chiffres |
| Nombre titres joueur | Entier | 3 chiffres |
| Victoires joueur | Entier | 4 chiffres |

# Photo de notre MCD

<img width="1427" height="821" alt="image" src="https://github.com/user-attachments/assets/38c3a6ca-99cc-4eb1-a33b-ed4a148a9b46" />

# MCD Textuel

```text
Tournoi = (id_tournoi VARCHAR(50), nom_tournoi VARCHAR(50), ville VARCHAR(50), pays VARCHAR(50), surface VARCHAR(50));
Edition = (#id_tournoi, id_edition VARCHAR(50), année VARCHAR(50), date_début VARCHAR(50), date_fin VARCHAR(50));
Joueur = (id_joueur VARCHAR(50), classement VARCHAR(50), nom_joueur VARCHAR(50), prenom_joueur VARCHAR(50), date_naissance VARCHAR(50), nationalite_joueur VARCHAR(50));
Match_ = (id_match VARCHAR(50), tour VARCHAR(50), durée VARCHAR(50), #(#id_tournoi, id_edition));
Set_ = (id_set VARCHAR(50), numero_set VARCHAR(50), jeux_j1 VARCHAR(50), jeux_J2 VARCHAR(50), #id_match);
Arbitre = (id_arbitre VARCHAR(50), niveau_certification VARCHAR(50), nom_arbitre VARCHAR(50), prénom_arbitre VARCHAR(50), nationalité_arbitre VARCHAR(50));
Poste = (id_poste VARCHAR(50), libellé VARCHAR(50));
Disputer = (#id_joueur, #id_match, role VARCHAR(50), résultat VARCHAR(50));
Affronter = (#id_joueur, #id_joueur_1);
Arbitrer = (#id_match, #id_arbitre, #id_poste);
