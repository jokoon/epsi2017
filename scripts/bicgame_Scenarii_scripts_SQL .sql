-- #############################################################################################################################
/*
    ==========================
	SCENARII des requêtes SQL 
    ==========================
    ``
*/


-- #############################################################################################################################
/*
    ==========================
    Table : CHALLENGES
    ==========================
    
    INSERT : Création d'un défi d'un joueur à une autre pour un et un seul jeu
            
	UPDATE : NON
            
	DELETE : NON/
        
*/
-- -----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM challenges;
SELECT id_user1, id_user2, seed FROM challenges;
-- -----------------------------------------------------------------------------------------------------------------------------
INSERT INTO `challenges` (`id_user1`, `id_user2`, `seed`) VALUES ('id_user1', 'id_user2', 'seed');

-- #############################################################################################################################
/*
    ==========================
    Table : GAMES
    ==========================
    
    INSERT : Création d'un jeu pour ajouter un jeu à la plateforme web 
        
	UPDATE : Modification des données informatives concernant le jeu.
        
	DELETE : NON
                
*/
-- -----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM games;
SELECT `name`, `description`, `version`, `dat_version` FROM games;
-- -----------------------------------------------------------------------------------------------------------------------------
INSERT INTO `games` (`name`, `description`, `version`, `dat_version`) VALUES ('nom', 'description', 'version', 'date_version');
-- -----------------------------------------------------------------------------------------------------------------------------
UPDATE games SET 
`name` = 'nouveau_nom', 
`description` = 'nouvelle_description',
`version` = 'nouvelle_version',
`dat_version` = now() /* 'AAAA-MM-DD HH:MM:SS' */
WHERE id = 'identifiant_numérique_jeu';

-- #############################################################################################################################
/*
    ==========================
    Table : HIGH_SCORES
    ==========================
    
    INSERT : Création d'un high score pour un couple Joueur/Jeu (un joueur aura 1 et 1 high score par jeu)
            
	UPDATE : Mise à jour du high score d'un joueur pour un jeu donné
        
	DELETE : NON
        
*/
-- -----------------------------------------------------------------------------------------------------------------------------


-- #############################################################################################################################
/*
    ==========================
    Table : SCORES
    ==========================
    
    INSERT : Création d'un score à l'issue de chaque partie d'un jeu
            
	UPDATE : NON
            
	DELETE : NON
    
*/
-- -----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM scores;
SELECT `id_game`, `id_user`, `dat_score`, `score` FROM scores;
-- -----------------------------------------------------------------------------------------------------------------------------
INSERT INTO scores (id_game, id_user, dat_score, score) VALUES (0, 0, now(), 0);

-- #############################################################################################################################
/*
    ==========================
    Table : TOKENS 
    ==========================
    
    INSERT : Création d'un token à chaque inscription en ligne ou invitation à un défi
            
	UPDATE : NON
            
	DELETE : Suppression du token lorsque l'utilisateur clique sur le lien du token pour valider son inscription
        
*/


-- #############################################################################################################################
/*
    ==========================
    Table : USERS
    ==========================
    
    INSERT : 
		- Cas 'Invitation à un défi' : Création de l'utilisateur avec possibilité de modifier le pseudonyme de l'utilisateur (le champ 'can_change_name' = true)
        - Cas normal : Création de l'utilisateur sans possibilité de modifier le pseudonyme (le champ 'can_change_name' = false)
        
	UPDATE : 
		- Cas 'Invitation à un défi' : l'utilisateur peut s'il le désire modifier son pseudonyme si cela n'a jamais été réalisé auparavant, ensuite le champ de vérification prendra la valeur false
        - Cas normal : Toutes les valeurs des champs de la table sont modifiées exception pour le champ du pseudonyme (u_name)
        - Mise à jour de l'expérience
        
	DELETE : NON
    
    DÉSACTIVATION de compte utilisateur : NON
    
*/
-- -----------------------------------------------------------------------------------------------------------------------------
SELECT * FROM users;
SELECT `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name` FROM users ORDER BY id ASC;
SELECT `id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name` FROM users WHERE u_name = 'nom_user' AND email = 'email_user';
SELECT `id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name` FROM users WHERE u_name = 'nom_user' AND email = 'email_user';
-- -----------------------------------------------------------------------------------------------------------------------------
-- Create user  => 'can_change_name' = 0 (false) CHANGEMENT de PSEUDO non autorisé
INSERT INTO `users` (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES ('pseudo_user', 'email_user@boite-email.com', 0, 0,'password_haché', 0);
-- Create user sur invitation => 'can_change_name' = 1 (true) CHANGEMENT de PSEUDO autorisé
INSERT INTO `users` (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES ('pseudo_user', 'email_user@boite-email.com', 0, 0,'password_est_adresse_email', 1);
-- -----------------------------------------------------------------------------------------------------------------------------
-- Update user profil	=> 'can_change_name' = 0 (false) CHANGEMENT de PSEUDO non autorisé
UPDATE users SET 
`email` = 'nouvel_email', 
`experience` = 'Nouvelle_expérience', 
`pwd` = 'nouveau_MdP' 
WHERE id = 'identifiant_utilisateur'
AND active = 1; /* 0 - compte inactif (false) ... 1 - compte actif (true)*/
-- -----------------------------------------------------------------------------------------------------------------------------
-- Update user profil	=> 'can_change_name' = 1 (true) CHANGEMENT de PSEUDO autorisé
UPDATE users SET 
`u_name` = 'nouveau_pseudo', 
`email` = 'nouvel_email', 
`pwd` = 'nouveau_MdP', 
`can_change_name` = 0 
WHERE id = 'identifiant_utilisateur'
AND active = 1 /* 0 - compte inactif (false) ... 1 - compte actif (true)*/
AND can_change_name = 1; 
-- -----------------------------------------------------------------------------------------------------------------------------
-- Update user expérience
UPDATE users SET 
`experience` = 'Nouvelle_expérience' 
WHERE id = 'identifiant_utilisateur'
AND active = 1 /* 0 - compte inactif (false) ... 1 - compte actif (true)*/ 
-- -----------------------------------------------------------------------------------------------------------------------------

