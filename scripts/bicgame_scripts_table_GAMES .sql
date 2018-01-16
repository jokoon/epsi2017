-- -------------------------------------------------------------------------------------------------------------------
-- table : GAMES 
-- -------------------------------------------------------------------------------------------------------------------
SELECT * FROM games;
SELECT `name`, `description`, `version`, `dat_version` FROM games;
-- ==========================================================
-- CREATE games
-- ..........................................................
	/*
	INSERT INTO games (id, name_game) VALUES (0, '');

	INSERT INTO games (id, name_game) VALUES (1, 'THE ISLAND ');
	INSERT INTO games (id, name_game) VALUES (2, 'BLOCKED');
	INSERT INTO games (id, name_game) VALUES (3, 'CHAIN REACTION');
	*/
-- ..........................................................
INSERT INTO `games` (`name`, `description`, `version`, `dat_version`) VALUES ('', '', '', '');
-- ..........................................................
INSERT INTO `games` (`name`, `description`, `version`, `dat_version`) VALUES ('THE ISLAND', '', '1.0', '2017-12-22 11:01:02');
INSERT INTO `games` (`name`, `description`, `version`, `dat_version`) VALUES ('BLOCKED', '', '1.0', '2017-12-22 11:01:02');
INSERT INTO `games` (`name`, `description`, `version`, `dat_version`) VALUES ('CHAIN REACTION', '', '1.0', '2017-12-22 11:01:02');
-- ==========================================================
-- UPDATE games
-- ..........................................................
UPDATE games SET 
`name` = 'nouveau_nom', 
`description` = 'nouvelle_description',
`version` = 'nouvelle_version',
`dat_version` = now() 
WHERE id = 'identifiant_numérique_jeu';
-- ..........................................................
UPDATE games SET 
`name` = 'THE ISLAND', 'tata tut toto',
`version` = '1.1',
`dat_version` = '2018-01-10 16:56:44'
WHERE id = 1;
-- ..........................................................
