-- -------------------------------------------------------------------------------------------------------------------
-- table : USERS 
-- -------------------------------------------------------------------------------------------------------------------
SELECT * FROM users;
SELECT `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name` FROM users ORDER BY id ASC;
-- ==========================================================
-- CREATE user
-- INSERT INTO `users` (`id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (2, 'pseudo_user', 'email_user@boite-email.com', 0, 0,'password_masqué', 1);
-- le champ 'can_change_name' = 0 (false) par défaut pour une création de compte désirée, sinon = 1 (true) si création de compte par invitation d'un autre utilisateur
-- ..........................................................
-- Create user  => 'can_change_name' = 0 (false)
-- ..........................................................
INSERT INTO `users` (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES ('pseudo_user', 'email_user@boite-email.com', 0, 0,'password_masqué', 0);
-- ..........................................................
-- Create user sur invitation => 'can_change_name' = 1 (true)
-- ..........................................................
INSERT INTO `users` (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES ('pseudo_user', 'email_user@boite-email.com', 0, 0,'no_password_est_adresse_email', 1);
-- ..........................................................
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (admin', 'admin@boite-email.com', 0, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (jonas', 'smth@pouet.com', 0, 0', '7ed8eda08e2d4a11a5459cc3453f54171591c0a39a113eaacc1f421deb5a9792', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (kristoph', 'email_user@boite-email.com', 0, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (patrick', 'email_user@boite-email.com', 0, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (marc', 'marc@boite-email.com', 100, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (emmanuelle', 'emmanuelle@boite-email.com', 50, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (morgan', 'email_user@boite-email.com', 980, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (nicolas', 'morgan@boite-email.com', 45, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (wafa', 'wafa@boite-email.com', 20, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (valerie', 'valerie@boite-email.com', 772, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (jb', 'jb@boite-email.com', 1025, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (romain', 'romain@boite-email.com', 315, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (maxime', 'maxime@boite-email.com', 330, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (sylvie', 'sylvie@boite-email.com', 15, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (mohamed', 'mohamed@boite-email.com', 146, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (nicolas2', 'nicolas2@boite-email.com', 774, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (christophe', 'christophe@boite-email.com', 12, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (pierre', 'pierre@boite-email.com', 3200, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (paul', 'paul@boite-email.com', 3, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (jacques', 'jacques@boite-email.com', 9, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (ploufplouf', 'poufpouf@boite-email.com', 1963, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (tagada', 'tagada@boite-email.com', 54, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (pifpiaf', 'pifpiaf@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (pinson', 'pinson@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (joris', 'joris@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (dieu', 'dieu@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (devil', 'devil@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (sainte', 'sainte@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (nitouch', 'nitouch@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (poil', 'poil@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (ooo', 'ooo@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (nez', 'nez@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (un', 'un@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (poussin', 'poussin@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (egale', 'egale@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (deux', 'deux@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (colloc', 'colloc@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (cool', 'cool@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (coquille', 'coquille@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (popo', 'popo@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (calimero', 'calimero@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (sans', 'sans@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (chemisse', 'chemisse@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (bi', 'bi@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (gleux', 'gleux@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (moutarde', '@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (deux', 'deux@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (maux', 'maux@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (see', 'see@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (you', 'you@boite-email.com', 39, 0', '', 0);
INSERT INTO users (`u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (play', 'play@boite-email.com', 39, 0', '', 0);

-- ==========================================================
-- MODIFY users
-- ..........................................................
-- Modification de u_name (pseudo) => 'can_change_name' = 1 (true)
-- ..........................................................
UPDATE users SET 
u_name = 'nouveau_nom', /* nouveau nom ou pseudo */
can_change_name = 0 
WHERE can_change_name = 1 
AND id = 2; /* idenifiant de l'utilisateur */
-- ..........................................................
-- Sans autorisation (champ 'can_change_name' = false ou = 1)
-- ..........................................................
UPDATE users SET 
email = 'nouvel_email', 
experience = 000, 
active = 0, 
pwd = 'nouveau_password_hashé_masqué'
WHERE id = 2; /* idenifiant de l'utilisateur */
-- ..........................................................
-- Activation de compte (champ 'active' = false => true)
-- ..........................................................
UPDATE users SET active = 1 WHERE id = 0; /* identifiant utilisateur */
-- ..........................................................
-- DESActivation de compte (champ 'active' = true => false)
UPDATE users SET active = 0 WHERE id = 0; /* identifiant utilisateur */
-- ==========================================================
-- DELETE users
-- ..........................................................
DELETE FROM users WHERE id=0;
-- ==========================================================
-- RECHERCHES sur table users
-- ..........................................................
-- Recherche si compte email déjà existant
-- ..........................................................
SELECT * FROM users WHERE email = 'adresse_a_verifier@domaine.com';
SELECT id, u_name, email, experience, active, pwd, can_change_name FROM users WHERE email = 'adresse_a_verifier@domaine.com';
-- ..........................................................
-- Recherche des données de l'utiisateur
-- ..........................................................
SELECT id, u_name, email, experience, active, pwd, can_change_name FROM users WHERE id = 0; /* mettre identifiant utilisateur */  
-- ..........................................................
-- Recherche Expérience de l'utilisateur
-- ..........................................................
SELECT experience FROM users WHERE id = 0; /* mettre identifiant utilisateur */  
-- ..........................................................
-- Recherche nom (pseudo) utilisateur
-- ..........................................................
SELECT u_name FROM users WHERE id = 0; /* mettre identifiant utilisateur */  
-- ..........................................................
















