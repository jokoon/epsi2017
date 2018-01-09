-- -------------------------------------------------------------------------------------------------------------------
-- table : USERS 
-- -------------------------------------------------------------------------------------------------------------------
select * from users;
-- ==========================================================
-- CREATE user
-- INSERT INTO `users` (`id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (2, 'pseudo_user', 'email_user@boite-email.com', 0, 0,'password_masqué', 1);
-- le champ 'can_change_name' = 0 (false) par défaut pour une création de compte désirée, sinon = 1 (true) si création de compte par invitation d'un autre utilisateur
-- ..........................................................
-- Create user  => 'can_change_name' = 0 (false)
-- ..........................................................
INSERT INTO `users` (`id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (0, 'pseudo_user', 'email_user@boite-email.com', 0, 0,'password_masqué', 0);
-- ..........................................................
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (0, 'admin', 'admin@boite-email.com', 1500, 0, '', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (1, 'jonas', 'smth@pouet.com', 1500, 0, '', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (2, 'kristoph', 'kristoph@boite-email.com', 52, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (3, 'patrick', 'patrick@boite-email.com', 9532, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (4, 'marc', 'marc@boite-email.com', 100, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (5, 'emmanuelle', 'emmanuelle@boite-email.com', 50, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (6, 'morgan', 'email_user@boite-email.com', 980, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (7, 'nicolas', 'morgan@boite-email.com', 45, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (8, 'wafa', 'wafa@boite-email.com', 20, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (9, 'valerie', 'valerie@boite-email.com', 772, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (10, 'jb', 'jb@boite-email.com', 1025, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (11, 'romain', 'romain@boite-email.com', 315, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (12, 'maxime', 'maxime@boite-email.com', 330, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (13, 'sylvie', 'sylvie@boite-email.com', 15, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (14, 'mohamed', 'mohamed@boite-email.com', 146, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (15, 'nicolas2', 'nicolas2@boite-email.com', 774, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (16, 'christophe', 'christophe@boite-email.com', 12, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (17, 'pierre', 'pierre@boite-email.com', 3200, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (18, 'paul', 'paul@boite-email.com', 3, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (19, 'jacques', 'jacques@boite-email.com', 9, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (20, 'ploufplouf', 'poufpouf@boite-email.com', 1963, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (21, 'tagada', 'tagada@boite-email.com', 54, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (22, 'pifpaf', 'pifpaf@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (23, 'pinson', 'pinson@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (24, 'joris', 'joris@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (25, 'dieu', 'dieu@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (26, 'devil', 'devil@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (27, 'sainte', 'sainte@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (28, 'nitouch', 'nitouch@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (29, 'poil', 'poil@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (30, 'ooo', 'ooo@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (31, 'nez', 'nez@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (32, 'un', 'un@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (33, 'poussin', 'poussin@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (34, 'egale', 'egale@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (35, 'deux', 'deux@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (36, 'colloc', 'colloc@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (37, 'cool', 'cool@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (38, 'coquille', 'coquille@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (39, 'popo', 'popo@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (40, 'calimero', 'calimero@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (41, 'sans', 'sans@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (42, 'chemisse', 'chemisse@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (43, 'bi', 'bi@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (44, 'gleux', 'gleux@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (45, 'moutarde', '@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (46, 'deux', 'deux@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (47, 'maux', 'maux@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (48, 'see', 'see@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (49, 'you', 'you@boite-email.com', 39, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (50, 'play', 'play@boite-email.com', 39, 0,'', 0);
-- ..........................................................
-- Create user sur invitation => 'can_change_name' = 1 (true)
-- ..........................................................
INSERT INTO `users` (`id`, `u_name`, `email`, `experience`, `active`, `pwd`, `can_change_name`) VALUES (0, 'pseudo_user', 'email_user@boite-email.com', 0, 0,'no_password_est_adresse_email', 1);
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
















