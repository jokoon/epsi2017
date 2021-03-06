-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2017 at 12:11 PM
-- Server version: 5.7.17
-- PHP Version: 5.6.30

/*
----------------------------------------------------------------------------------------------------------------------------------
Pour résumer sur le choix entre InnoDB et MyISAM :
--------------------------------------------------------
MyISAM : à privilégier lorsqu’il est surtout nécessaire d’effectuer des requêtes pour lire ou insérer des données. 
Pour des sites web, c’est souvent la solution recommandée.
MyISAM restera quant à lui le meilleur choix dans le cas où l'on fait principalement des requêtes de lecture ou d'insertion.

InnoDB : à privilégier pour les systèmes qui ne doivent pas comporter d’erreurs et qui nécessite des clés étrangères. 
Pour une application gérant des données importantes, tel une application bancaire, 
cela peut se révéler le moteur de stcokage recommandé.
Pour conclure, on optera pour InnoDB principalement lorsque l'on utilisera un système d'information 
qui n'admet pas les erreurs ou qui doit utiliser des clés étrangères ou des intégrités référentielles.
----------------------------------------------------------------------------------------------------------------------------------
*/


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- --------------------------------------------------------
--
-- Database: `bicgame`
--
-- --------------------------------------------------------

DROP DATABASE IF EXISTS `bicgame`;
CREATE DATABASE IF NOT EXISTS `bicgame`;
USE `bicgame`;


-- --------------------------------------------------------
-- DROP TABLE IF EXISTS `challenges`;
-- --------------------------------------------------------


-- --------------------------------------------------------
--
-- Table structure for table `challenges`
--
-- --------------------------------------------------------

CREATE TABLE `challenges` (
  `id` int(11) NOT NULL,
  `id_user1` int(11) NOT NULL,
  `id_user2` int(11) NOT NULL,
  `seed` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tables des défis';

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `name_game` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tables des jeux';

--
-- Dumping data for table `users`
--

INSERT INTO games (id, name_game) VALUES (1, 'THE ISLAND ');
INSERT INTO games (id, name_game) VALUES (2, 'BLOCKED');
INSERT INTO games (id, name_game) VALUES (3, 'CHAIN REACTION');

-- --------------------------------------------------------

--
-- Table structure for table `high_scores`
--

CREATE TABLE `high_scores` (
  `id_score` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Tables des meilleurs scores';

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dat_score` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1, 1, 1, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 2, 2, 2, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 3, 2, 3, '2017-12-22 11:01:02', 1);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 4, 1, 4, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 5, 2, 5, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 6, 3, 6, '2017-12-22 11:01:02', 55);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 7, 1, 7, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 8, 2, 8, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 9, 2, 9, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 10, 3, 10, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 11, 3, 11, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 12, 2, 12, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 13, 1, 13, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 14, 1, 14, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 15, 1, 15, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 16, 2, 16, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 17, 1, 17, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 18, 3, 18, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 19, 1, 19, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 20, 1, 20, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 21, 1, 21, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 22, 2, 22, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 23, 2, 23, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 24, 1, 24, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 25, 2, 25, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 26, 3, 26, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 27, 1, 27, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 28, 2, 28, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 29, 3, 29, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 30, 1, 30, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 31, 1, 31, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 32, 2, 32, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 33, 2, 33, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 34, 1, 34, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 35, 2, 35, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 36, 3, 36, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 37, 1, 37, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 38, 2, 38, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 39, 2, 39, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 40, 3, 40, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 41, 3, 41, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 42, 2, 42, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 43, 1, 43, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 44, 1, 44, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 45, 1, 45, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 46, 2, 46, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 47, 1, 47, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 48, 3, 48, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 49, 1, 49, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 50, 1, 1, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 51, 1, 2, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 52, 2, 3, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 53, 2, 4, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 54, 1, 5, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 55, 2, 6, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 56, 3, 7, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 57, 1, 8, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 58, 2, 9, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 59, 3, 10, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 60, 1, 11, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 61, 1, 12, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 62, 2, 13, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 63, 2, 14, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 64, 1, 15, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 65, 2, 16, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 66, 3, 17, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 67, 1, 18, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 68, 2, 19, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 69, 2, 20, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 70, 3, 21, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 71, 3, 22, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 72, 2, 23, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 73, 1, 24, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 74, 1, 25, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 75, 1, 26, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 76, 2, 27, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 77, 1, 28, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 78, 3, 30, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 79, 1, 31, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 80, 1, 32, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 81, 1, 33, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 82, 2, 34, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 83, 2, 35, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 84, 1, 36, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 85, 2, 37, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 86, 3, 38, '2017-12-22 11:01:02', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 87, 1, 39, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 88, 2, 40, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 89, 3, 41, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 90, 1, 42, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 91, 1, 43, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 92, 2, 44, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 93, 2, 45, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 94, 1, 46, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 95, 2, 47, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 96, 3, 48, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 97, 1, 49, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 98, 2, 1, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 99, 2, 2, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 100, 3, 3, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 101, 3, 4, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 102, 2, 5, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 103, 1, 6, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 104, 1, 7, '2017-12-22 11:01:02', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 105, 1, 8, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 106, 2, 9, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 107, 1, 10, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 108, 3, 11, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 109, 1, 12, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 110, 1, 13, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 111, 1, 14, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 112, 2, 15, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 113, 2, 16, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 114, 1, 17, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 115, 2, 18, '2017-12-22 11:01:02', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 116, 3, 19, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 117, 1, 20, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 118, 2, 21, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 119, 3, 22, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 120, 1, 23, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 121, 1, 24, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 122, 2, 25, '2017-12-22 11:01:02', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 123, 2, 26, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 124, 1, 27, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 125, 2, 28, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 126, 3, 29, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 127, 1, 30, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 128, 2, 31, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 129, 2, 32, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 130, 3, 33, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 131, 3, 34, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 132, 2, 35, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 133, 1, 36, '2017-12-22 11:01:02', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 134, 1, 37, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 135, 1, 38, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 136, 2, 39, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 137, 1, 40, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 138, 3, 41, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 139, 1, 42, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 140, 1, 43, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 141, 1, 44, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 142, 2, 45, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 143, 2, 46, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 144, 1, 47, '2017-12-22 11:01:02', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 145, 2, 48, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 146, 3, 49, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 147, 1, 1, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 148, 2, 2, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 149, 3, 3, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 150, 1, 4, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 151, 1, 5, '2017-12-22 11:01:02', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 152, 2, 6, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 153, 2, 7, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 154, 1, 8, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 155, 2, 9, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 156, 3, 10, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 157, 1, 11, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 158, 2, 12, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 159, 2, 13, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 160, 3, 14, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 161, 3, 15, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 162, 2, 16, '2017-12-22 11:01:02', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 163, 1, 17, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 164, 1, 18, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 165, 1, 19, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 166, 2, 20, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 167, 1, 21, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 168, 3, 22, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 169, 1, 23, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 170, 1, 24, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 171, 1, 25, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 172, 2, 26, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 173, 2, 27, '2017-12-22 11:01:02', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 174, 1, 28, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 175, 2, 30, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 176, 3, 31, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 177, 1, 32, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 178, 2, 33, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 179, 3, 34, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 180, 1, 35, '2017-12-22 11:01:02', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 181, 1, 36, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 182, 2, 37, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 183, 2, 38, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 184, 1, 39, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 185, 2, 40, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 186, 3, 41, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 187, 1, 42, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 188, 2, 43, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 189, 2, 44, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 190, 3, 45, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 191, 3, 46, '2017-12-22 11:01:02', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 192, 2, 47, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 193, 1, 48, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 194, 1, 49, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 195, 1, 1, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 196, 2, 2, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 197, 1, 3, '2017-12-22 11:01:02', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 198, 3, 4, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 199, 1, 5, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 200, 1, 6, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 201, 1, 7, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 202, 2, 8, '2017-12-22 11:01:02', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 203, 2, 9, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 204, 1, 10, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 205, 2, 11, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 206, 3, 12, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 207, 1, 13, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 208, 2, 14, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 209, 3, 15, '2017-12-22 11:01:02', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 210, 1, 16, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 211, 1, 17, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 212, 2, 18, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 213, 2, 19, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 214, 1, 20, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 215, 2, 21, '2017-12-22 11:01:02', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 216, 3, 22, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 217, 1, 23, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 218, 2, 24, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 219, 2, 25, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 220, 3, 26, '2017-12-22 11:01:02', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 221, 3, 27, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 222, 2, 28, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 223, 1, 29, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 224, 1, 30, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 225, 1, 31, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 226, 2, 32, '2017-12-22 11:01:02', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 227, 1, 33, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 228, 3, 34, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 229, 1, 35, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 230, 1, 36, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 231, 1, 37, '2017-12-22 11:01:02', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 232, 2, 38, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 233, 2, 39, '2017-12-22 11:01:02', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 234, 1, 40, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 235, 2, 41, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 236, 3, 42, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 237, 1, 43, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 238, 2, 44, '2017-12-22 11:01:02', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 239, 3, 45, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 240, 1, 46, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 241, 2, 47, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 242, 2, 48, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 243, 3, 49, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 244, 2, 1, '2017-12-22 11:01:02', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 245, 1, 2, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 246, 2, 3, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 247, 3, 4, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 248, 1, 5, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 249, 2, 6, '2017-12-22 11:01:02', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 250, 3, 7, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 251, 1, 8, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 252, 2, 9, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 253, 2, 10, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 254, 1, 11, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 255, 2, 12, '2017-12-22 11:01:02', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 256, 3, 13, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 257, 1, 14, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 258, 2, 15, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 259, 2, 16, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 260, 3, 17, '2017-12-22 11:01:02', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 261, 3, 18, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 262, 2, 19, '2017-12-22 11:01:02', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 263, 1, 20, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 264, 1, 21, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 265, 1, 22, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 266, 2, 23, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 267, 1, 24, '2017-12-22 11:01:02', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 268, 3, 25, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 269, 1, 26, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 270, 1, 27, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 271, 1, 28, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 272, 2, 30, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 273, 2, 31, '2017-12-22 11:01:02', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 274, 1, 32, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 275, 2, 33, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 276, 3, 34, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 277, 1, 35, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 278, 2, 36, '2017-12-22 11:01:02', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 279, 3, 37, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 280, 1, 38, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 281, 1, 39, '2017-12-22 11:01:02', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 282, 2, 40, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 283, 2, 41, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 284, 1, 42, '2017-12-22 11:01:02', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 285, 2, 43, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 286, 3, 44, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 287, 1, 45, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 288, 2, 46, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 289, 2, 47, '2017-12-22 11:01:02', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 290, 3, 48, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 291, 3, 49, '2017-12-22 11:01:02', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 292, 2, 1, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 293, 1, 2, '2017-12-22 11:01:02', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 294, 1, 3, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 295, 1, 4, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 296, 2, 5, '2017-12-22 11:01:02', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 297, 1, 6, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 298, 3, 7, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 299, 1, 8, '2017-12-22 11:01:02', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 300, 1, 9, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 301, 1, 10, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 302, 2, 11, '2017-12-22 11:01:02', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 303, 2, 12, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 304, 1, 13, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 305, 2, 14, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 306, 3, 15, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 307, 1, 16, '2017-12-22 11:01:02', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 308, 2, 17, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 309, 3, 18, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 310, 1, 19, '2017-12-22 11:01:02', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 311, 1, 20, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 312, 2, 21, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 313, 2, 22, '2017-12-22 11:01:02', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 314, 1, 23, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 315, 2, 24, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 316, 3, 25, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 317, 1, 26, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 318, 2, 27, '2017-12-22 11:01:02', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 319, 2, 28, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 320, 3, 29, '2017-12-22 11:01:02', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 321, 3, 30, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 322, 2, 31, '2017-12-22 11:01:02', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 323, 1, 32, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 324, 1, 33, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 325, 1, 34, '2017-12-22 11:01:02', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 326, 2, 35, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 327, 1, 36, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 328, 3, 37, '2017-12-22 11:01:02', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 329, 1, 38, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 330, 1, 39, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 331, 1, 40, '2017-12-22 11:01:02', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 332, 2, 41, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 333, 2, 42, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 334, 1, 43, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 335, 2, 44, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 336, 3, 45, '2017-12-22 11:01:02', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 337, 1, 46, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 338, 2, 47, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 339, 3, 48, '2017-12-22 11:01:02', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 340, 1, 49, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 341, 1, 1, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 342, 2, 2, '2017-12-22 11:01:02', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 343, 2, 3, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 344, 1, 4, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 345, 2, 5, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 346, 3, 6, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 347, 1, 7, '2017-12-22 11:01:02', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 348, 2, 8, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 349, 2, 9, '2017-12-22 11:01:02', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 350, 3, 10, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 351, 3, 11, '2017-12-22 11:01:02', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 352, 2, 12, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 353, 1, 13, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 354, 1, 14, '2017-12-22 11:01:02', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 355, 1, 15, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 356, 2, 16, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 357, 1, 17, '2017-12-22 11:01:02', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 358, 3, 18, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 359, 1, 19, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 360, 1, 20, '2017-12-22 11:01:02', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 361, 1, 21, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 362, 2, 22, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 363, 2, 23, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 364, 1, 24, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 365, 2, 25, '2017-12-22 11:01:02', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 366, 3, 26, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 367, 1, 27, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 368, 2, 28, '2017-12-22 11:01:02', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 369, 3, 30, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 370, 1, 31, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 371, 1, 32, '2017-12-22 11:01:02', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 372, 2, 33, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 373, 2, 34, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 374, 1, 35, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 375, 2, 36, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 376, 3, 37, '2017-12-22 11:01:02', 69);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 377, 1, 38, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 378, 2, 39, '2017-12-22 11:01:02', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 379, 2, 40, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 380, 3, 41, '2017-12-22 11:01:02', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 381, 3, 42, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 382, 2, 43, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 383, 1, 44, '2017-12-22 11:01:02', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 384, 1, 45, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 385, 1, 46, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 386, 2, 47, '2017-12-22 11:01:02', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 387, 1, 48, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 388, 3, 49, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 389, 1, 1, '2017-12-22 11:01:02', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 390, 1, 2, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 391, 1, 3, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 392, 2, 4, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 393, 2, 5, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 394, 1, 6, '2017-12-22 11:01:02', 69);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 395, 2, 7, '2017-12-22 11:01:02', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 396, 3, 8, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 397, 1, 9, '2017-12-22 11:01:02', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 398, 2, 10, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 399, 3, 11, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 400, 1, 12, '2017-12-22 11:01:02', 38);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 401, 1, 13, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 402, 2, 14, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 403, 2, 15, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 404, 1, 16, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 405, 2, 17, '2017-12-22 11:01:02', 70);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 406, 3, 18, '2017-12-22 11:01:02', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 407, 1, 19, '2017-12-22 11:01:02', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 408, 2, 20, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 409, 2, 21, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 410, 3, 22, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 411, 3, 23, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 412, 2, 24, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 413, 1, 25, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 414, 1, 26, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 415, 1, 27, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 416, 2, 28, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 417, 1, 29, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 418, 3, 30, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 419, 1, 31, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 420, 1, 32, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 421, 1, 33, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 422, 2, 34, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 423, 2, 35, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 424, 1, 36, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 425, 2, 37, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 426, 3, 38, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 427, 1, 39, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 428, 2, 40, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 429, 3, 41, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 430, 1, 42, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 431, 1, 43, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 432, 2, 44, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 433, 2, 45, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 434, 1, 46, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 435, 2, 47, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 436, 3, 48, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 437, 1, 49, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 438, 2, 1, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 439, 2, 2, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 440, 3, 3, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 441, 3, 4, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 442, 2, 5, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 443, 1, 6, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 444, 1, 7, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 445, 1, 8, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 446, 2, 9, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 447, 1, 10, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 448, 3, 11, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 449, 1, 12, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 450, 1, 13, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 451, 1, 14, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 452, 2, 15, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 453, 2, 16, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 454, 1, 17, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 455, 2, 18, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 456, 3, 19, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 457, 1, 20, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 458, 2, 21, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 459, 3, 22, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 460, 1, 23, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 461, 1, 24, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 462, 2, 25, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 463, 2, 26, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 464, 1, 27, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 465, 2, 28, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 466, 3, 30, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 467, 1, 31, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 468, 2, 32, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 469, 2, 33, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 470, 3, 34, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 471, 3, 35, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 472, 2, 36, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 473, 1, 37, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 474, 1, 38, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 475, 1, 39, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 476, 2, 40, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 477, 1, 41, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 478, 3, 42, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 479, 1, 43, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 480, 1, 44, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 481, 1, 45, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 482, 2, 46, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 483, 2, 47, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 484, 1, 48, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 485, 2, 49, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 486, 3, 1, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 487, 1, 2, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 488, 2, 4, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 489, 3, 7, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 490, 1, 5, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 491, 2, 15, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 492, 2, 34, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 493, 3, 40, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 494, 2, 22, '2017-12-22 11:01:02', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 495, 1, 3, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 496, 2, 9, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 497, 3, 18, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 498, 1, 5, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 499, 2, 4, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 500, 3, 49, '2017-12-22 11:01:02', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 501, 1, 1, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 502, 2, 2, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 503, 2, 3, '2017-12-22 11:01:02', 1);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 504, 1, 4, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 505, 2, 5, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 506, 3, 6, '2017-12-22 11:01:02', 55);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 507, 1, 7, '2017-12-22 11:01:02', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 508, 2, 8, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 509, 2, 9, '2017-12-22 11:01:02', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 510, 3, 10, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 511, 3, 11, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 512, 2, 12, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 513, 1, 13, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 514, 1, 14, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 515, 1, 15, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 516, 2, 16, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 517, 1, 17, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 518, 3, 18, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 519, 1, 19, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 520, 1, 20, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 521, 1, 21, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 522, 2, 22, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 523, 2, 23, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 524, 1, 24, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 525, 2, 25, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 526, 3, 26, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 527, 1, 27, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 528, 2, 28, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 529, 3, 29, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 530, 1, 30, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 531, 1, 31, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 532, 2, 32, '2017-12-22 11:01:02', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 533, 2, 33, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 534, 1, 34, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 535, 2, 35, '2017-12-22 11:01:02', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 536, 3, 36, '2017-12-22 11:01:02', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 537, 1, 37, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 538, 2, 38, '2017-12-22 11:01:02', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 539, 2, 39, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 540, 3, 40, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 541, 3, 41, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 542, 2, 42, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 543, 1, 43, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 544, 1, 44, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 545, 1, 45, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 546, 2, 46, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 547, 1, 47, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 548, 3, 48, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 549, 1, 49, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 550, 1, 1, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 551, 1, 2, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 552, 2, 3, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 553, 2, 4, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 554, 1, 5, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 555, 2, 6, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 556, 3, 7, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 557, 1, 8, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 558, 2, 9, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 559, 3, 10, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 560, 1, 11, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 561, 1, 12, '2017-12-22 11:01:02', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 562, 2, 13, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 563, 2, 14, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 564, 1, 15, '2017-12-22 11:01:02', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 565, 2, 16, '2017-12-22 11:01:02', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 566, 3, 17, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 567, 1, 18, '2017-12-22 11:01:02', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 568, 2, 19, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 569, 2, 20, '2017-12-22 11:01:02', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 570, 3, 21, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 571, 3, 22, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 572, 2, 23, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 573, 1, 24, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 574, 1, 25, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 575, 1, 26, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 576, 2, 27, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 577, 1, 28, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 578, 3, 30, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 579, 1, 31, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 580, 1, 32, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 581, 1, 33, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 582, 2, 34, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 583, 2, 35, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 584, 1, 36, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 585, 2, 37, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 586, 3, 38, '2017-12-22 11:01:02', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 587, 1, 39, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 588, 2, 40, '2017-12-22 11:01:02', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 589, 3, 41, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 590, 1, 42, '2017-12-22 11:01:02', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 591, 1, 43, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 592, 2, 44, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 593, 2, 45, '2017-12-22 11:01:02', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 594, 1, 46, '2017-12-22 11:01:02', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 595, 2, 47, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 596, 3, 48, '2017-12-22 11:01:02', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 597, 1, 49, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 598, 2, 1, '2017-12-22 11:01:02', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 599, 2, 2, '2017-12-22 11:01:02', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 600, 3, 3, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 601, 3, 4, '2017-12-22 11:01:02', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 602, 2, 5, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 603, 1, 6, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 604, 1, 7, '2017-12-22 11:01:02', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 605, 1, 8, '2017-12-22 11:01:02', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 606, 2, 9, '2017-12-22 11:01:02', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 607, 1, 10, '2017-12-22 11:01:02', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 608, 3, 11, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 609, 1, 12, '2017-12-22 11:01:02', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 610, 1, 13, '2017-12-22 11:01:02', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 611, 1, 14, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 612, 2, 15, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 613, 2, 16, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 614, 1, 17, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 615, 2, 18, '2017-12-22 11:01:03', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 616, 3, 19, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 617, 1, 20, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 618, 2, 21, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 619, 3, 22, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 620, 1, 23, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 621, 1, 24, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 622, 2, 25, '2017-12-22 11:01:03', 59);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 623, 2, 26, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 624, 1, 27, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 625, 2, 28, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 626, 3, 29, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 627, 1, 30, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 628, 2, 31, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 629, 2, 32, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 630, 3, 33, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 631, 3, 34, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 632, 2, 35, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 633, 1, 36, '2017-12-22 11:01:03', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 634, 1, 37, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 635, 1, 38, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 636, 2, 39, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 637, 1, 40, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 638, 3, 41, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 639, 1, 42, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 640, 1, 43, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 641, 1, 44, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 642, 2, 45, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 643, 2, 46, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 644, 1, 47, '2017-12-22 11:01:03', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 645, 2, 48, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 646, 3, 49, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 647, 1, 1, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 648, 2, 2, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 649, 3, 3, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 650, 1, 4, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 651, 1, 5, '2017-12-22 11:01:03', 60);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 652, 2, 6, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 653, 2, 7, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 654, 1, 8, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 655, 2, 9, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 656, 3, 10, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 657, 1, 11, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 658, 2, 12, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 659, 2, 13, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 660, 3, 14, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 661, 3, 15, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 662, 2, 16, '2017-12-22 11:01:03', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 663, 1, 17, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 664, 1, 18, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 665, 1, 19, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 666, 2, 20, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 667, 1, 21, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 668, 3, 22, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 669, 1, 23, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 670, 1, 24, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 671, 1, 25, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 672, 2, 26, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 673, 2, 27, '2017-12-22 11:01:03', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 674, 1, 28, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 675, 2, 30, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 676, 3, 31, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 677, 1, 32, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 678, 2, 33, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 679, 3, 34, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 680, 1, 35, '2017-12-22 11:01:03', 61);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 681, 1, 36, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 682, 2, 37, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 683, 2, 38, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 684, 1, 39, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 685, 2, 40, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 686, 3, 41, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 687, 1, 42, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 688, 2, 43, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 689, 2, 44, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 690, 3, 45, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 691, 3, 46, '2017-12-22 11:01:03', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 692, 2, 47, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 693, 1, 48, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 694, 1, 49, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 695, 1, 1, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 696, 2, 2, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 697, 1, 3, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 698, 3, 4, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 699, 1, 5, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 700, 1, 6, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 701, 1, 7, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 702, 2, 8, '2017-12-22 11:01:03', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 703, 2, 9, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 704, 1, 10, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 705, 2, 11, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 706, 3, 12, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 707, 1, 13, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 708, 2, 14, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 709, 3, 15, '2017-12-22 11:01:03', 62);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 710, 1, 16, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 711, 1, 17, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 712, 2, 18, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 713, 2, 19, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 714, 1, 20, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 715, 2, 21, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 716, 3, 22, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 717, 1, 23, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 718, 2, 24, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 719, 2, 25, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 720, 3, 26, '2017-12-22 11:01:03', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 721, 3, 27, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 722, 2, 28, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 723, 1, 29, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 724, 1, 30, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 725, 1, 31, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 726, 2, 32, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 727, 1, 33, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 728, 3, 34, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 729, 1, 35, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 730, 1, 36, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 731, 1, 37, '2017-12-22 11:01:03', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 732, 2, 38, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 733, 2, 39, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 734, 1, 40, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 735, 2, 41, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 736, 3, 42, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 737, 1, 43, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 738, 2, 44, '2017-12-22 11:01:03', 63);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 739, 3, 45, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 740, 1, 46, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 741, 2, 47, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 742, 2, 48, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 743, 3, 49, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 744, 2, 1, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 745, 1, 2, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 746, 2, 3, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 747, 3, 4, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 748, 1, 5, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 749, 2, 6, '2017-12-22 11:01:03', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 750, 3, 7, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 751, 1, 8, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 752, 2, 9, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 753, 2, 10, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 754, 1, 11, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 755, 2, 12, '2017-12-22 11:01:03', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 756, 3, 13, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 757, 1, 14, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 758, 2, 15, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 759, 2, 16, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 760, 3, 17, '2017-12-22 11:01:03', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 761, 3, 18, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 762, 2, 19, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 763, 1, 20, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 764, 1, 21, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 765, 1, 22, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 766, 2, 23, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 767, 1, 24, '2017-12-22 11:01:03', 64);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 768, 3, 25, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 769, 1, 26, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 770, 1, 27, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 771, 1, 28, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 772, 2, 30, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 773, 2, 31, '2017-12-22 11:01:03', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 774, 1, 32, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 775, 2, 33, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 776, 3, 34, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 777, 1, 35, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 778, 2, 36, '2017-12-22 11:01:03', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 779, 3, 37, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 780, 1, 38, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 781, 1, 39, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 782, 2, 40, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 783, 2, 41, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 784, 1, 42, '2017-12-22 11:01:03', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 785, 2, 43, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 786, 3, 44, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 787, 1, 45, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 788, 2, 46, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 789, 2, 47, '2017-12-22 11:01:03', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 790, 3, 48, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 791, 3, 49, '2017-12-22 11:01:03', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 792, 2, 1, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 793, 1, 2, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 794, 1, 3, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 795, 1, 4, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 796, 2, 5, '2017-12-22 11:01:03', 65);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 797, 1, 6, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 798, 3, 7, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 799, 1, 8, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 800, 1, 9, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 801, 1, 10, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 802, 2, 11, '2017-12-22 11:01:03', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 803, 2, 12, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 804, 1, 13, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 805, 2, 14, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 806, 3, 15, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 807, 1, 16, '2017-12-22 11:01:03', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 808, 2, 17, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 809, 3, 18, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 810, 1, 19, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 811, 1, 20, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 812, 2, 21, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 813, 2, 22, '2017-12-22 11:01:03', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 814, 1, 23, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 815, 2, 24, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 816, 3, 25, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 817, 1, 26, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 818, 2, 27, '2017-12-22 11:01:03', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 819, 2, 28, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 820, 3, 29, '2017-12-22 11:01:03', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 821, 3, 30, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 822, 2, 31, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 823, 1, 32, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 824, 1, 33, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 825, 1, 34, '2017-12-22 11:01:03', 66);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 826, 2, 35, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 827, 1, 36, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 828, 3, 37, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 829, 1, 38, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 830, 1, 39, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 831, 1, 40, '2017-12-22 11:01:03', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 832, 2, 41, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 833, 2, 42, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 834, 1, 43, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 835, 2, 44, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 836, 3, 45, '2017-12-22 11:01:03', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 837, 1, 46, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 838, 2, 47, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 839, 3, 48, '2017-12-22 11:01:03', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 840, 1, 49, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 841, 1, 1, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 842, 2, 2, '2017-12-22 11:01:03', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 843, 2, 3, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 844, 1, 4, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 845, 2, 5, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 846, 3, 6, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 847, 1, 7, '2017-12-22 11:01:03', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 848, 2, 8, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 849, 2, 9, '2017-12-22 11:01:03', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 850, 3, 10, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 851, 3, 11, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 852, 2, 12, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 853, 1, 13, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 854, 1, 14, '2017-12-22 11:01:03', 67);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 855, 1, 15, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 856, 2, 16, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 857, 1, 17, '2017-12-22 11:01:03', 33);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 858, 3, 18, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 859, 1, 19, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 860, 1, 20, '2017-12-22 11:01:03', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 861, 1, 21, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 862, 2, 22, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 863, 2, 23, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 864, 1, 24, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 865, 2, 25, '2017-12-22 11:01:03', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 866, 3, 26, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 867, 1, 27, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 868, 2, 28, '2017-12-22 11:01:03', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 869, 3, 30, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 870, 1, 31, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 871, 1, 32, '2017-12-22 11:01:03', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 872, 2, 33, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 873, 2, 34, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 874, 1, 35, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 875, 2, 36, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 876, 3, 37, '2017-12-22 11:01:03', 69);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 877, 1, 38, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 878, 2, 39, '2017-12-22 11:01:03', 36);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 879, 2, 40, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 880, 3, 41, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 881, 3, 42, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 882, 2, 43, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 883, 1, 44, '2017-12-22 11:01:03', 68);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 884, 1, 45, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 885, 1, 46, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 886, 2, 47, '2017-12-22 11:01:03', 34);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 887, 1, 48, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 888, 3, 49, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 889, 1, 1, '2017-12-22 11:01:03', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 890, 1, 2, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 891, 1, 3, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 892, 2, 4, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 893, 2, 5, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 894, 1, 6, '2017-12-22 11:01:03', 69);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 895, 2, 7, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 896, 3, 8, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 897, 1, 9, '2017-12-22 11:01:03', 35);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 898, 2, 10, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 899, 3, 11, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 900, 1, 12, '2017-12-22 11:01:03', 38);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 901, 1, 13, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 902, 2, 14, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 903, 2, 15, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 904, 1, 16, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 905, 2, 17, '2017-12-22 11:01:03', 70);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 906, 3, 18, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 907, 1, 19, '2017-12-22 11:01:03', 37);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 908, 2, 20, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 909, 2, 21, '2017-12-22 11:01:03', 15);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 910, 3, 22, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 911, 3, 23, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 912, 2, 24, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 913, 1, 25, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 914, 1, 26, '2017-12-22 11:01:03', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 915, 1, 27, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 916, 2, 28, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 917, 1, 29, '2017-12-22 11:01:03', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 918, 3, 30, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 919, 1, 31, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 920, 1, 32, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 921, 1, 33, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 922, 2, 34, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 923, 2, 35, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 924, 1, 36, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 925, 2, 37, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 926, 3, 38, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 927, 1, 39, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 928, 2, 40, '2017-12-22 11:01:03', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 929, 3, 41, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 930, 1, 42, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 931, 1, 43, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 932, 2, 44, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 933, 2, 45, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 934, 1, 46, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 935, 2, 47, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 936, 3, 48, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 937, 1, 49, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 938, 2, 1, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 939, 2, 2, '2017-12-22 11:01:03', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 940, 3, 3, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 941, 3, 4, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 942, 2, 5, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 943, 1, 6, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 944, 1, 7, '2017-12-22 11:01:03', 2);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 945, 1, 8, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 946, 2, 9, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 947, 1, 10, '2017-12-22 11:01:03', 56);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 948, 3, 11, '2017-12-22 11:01:03', 16);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 949, 1, 12, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 950, 1, 13, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 951, 1, 14, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 952, 2, 15, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 953, 2, 16, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 954, 1, 17, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 955, 2, 18, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 956, 3, 19, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 957, 1, 20, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 958, 2, 21, '2017-12-22 11:01:03', 57);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 959, 3, 22, '2017-12-22 11:01:03', 17);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 960, 1, 23, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 961, 1, 24, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 962, 2, 25, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 963, 2, 26, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 964, 1, 27, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 965, 2, 28, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 966, 3, 30, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 967, 1, 31, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 968, 2, 32, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 969, 2, 33, '2017-12-22 11:01:03', 58);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 970, 3, 34, '2017-12-22 11:01:03', 18);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 971, 3, 35, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 972, 2, 36, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 973, 1, 37, '2017-12-22 11:01:03', 3);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 974, 1, 38, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 975, 1, 39, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 976, 2, 40, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 977, 1, 41, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 978, 3, 42, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 979, 1, 43, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 980, 1, 44, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 981, 1, 45, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 982, 2, 46, '2017-12-22 11:01:03', 19);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 983, 2, 47, '2017-12-22 11:01:03', 26);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 984, 1, 48, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 985, 2, 49, '2017-12-22 11:01:03', 4);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 986, 3, 1, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 987, 1, 2, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 988, 2, 4, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 989, 3, 7, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 990, 1, 5, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 991, 2, 15, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 992, 2, 34, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 993, 3, 40, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 994, 2, 22, '2017-12-22 11:01:03', 20);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 995, 1, 3, '2017-12-22 11:01:03', 27);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 996, 2, 9, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 997, 3, 18, '2017-12-22 11:01:03', 5);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 998, 1, 5, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 999, 2, 4, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1000, 3, 49, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1001, 1, 1, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1002, 1, 2, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1003, 2, 3, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1004, 2, 4, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1005, 1, 5, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1006, 2, 6, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1007, 3, 7, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1008, 1, 8, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1009, 2, 9, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1010, 3, 10, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1011, 1, 11, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1012, 2, 12, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1013, 2, 13, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1014, 3, 14, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1015, 2, 15, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1016, 1, 16, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1017, 2, 17, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1018, 3, 18, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1019, 1, 19, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1020, 2, 20, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1021, 3, 21, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1022, 1, 22, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1023, 1, 23, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1024, 2, 24, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1025, 2, 25, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1026, 1, 26, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1027, 2, 27, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1028, 3, 28, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1029, 1, 29, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1030, 2, 30, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1031, 3, 31, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1032, 1, 32, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1033, 2, 33, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1034, 2, 34, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1035, 3, 35, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1036, 2, 36, '2017-12-22 11:01:03', 14);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1037, 1, 37, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1038, 2, 38, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1039, 3, 39, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1040, 1, 40, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1041, 2, 41, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1042, 3, 42, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1043, 1, 43, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1044, 1, 44, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1045, 2, 45, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1046, 2, 46, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1047, 1, 47, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1048, 2, 48, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1049, 3, 49, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1050, 1, 1, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1051, 2, 2, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1052, 3, 3, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1053, 1, 4, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1054, 2, 5, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1055, 2, 6, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1056, 3, 7, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1057, 2, 8, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1058, 1, 9, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1059, 2, 10, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1060, 3, 11, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1061, 1, 12, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1062, 2, 13, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1063, 3, 14, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1064, 1, 15, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1065, 1, 16, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1066, 2, 17, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1067, 2, 18, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1068, 1, 19, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1069, 2, 20, '2017-12-22 11:01:03', 9);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1070, 3, 21, '2017-12-22 11:01:03', 23);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1071, 1, 22, '2017-12-22 11:01:03', 30);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1072, 2, 23, '2017-12-22 11:01:03', 12);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1073, 3, 24, '2017-12-22 11:01:03', 8);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1074, 1, 25, '2017-12-22 11:01:03', 24);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1075, 2, 26, '2017-12-22 11:01:03', 31);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1076, 2, 27, '2017-12-22 11:01:03', 13);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1077, 3, 28, '2017-12-22 11:01:03', 25);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1078, 2, 30, '2017-12-22 11:01:03', 32);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1079, 1, 31, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1080, 2, 32, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1081, 3, 33, '2017-12-22 11:01:03', 11);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1082, 1, 34, '2017-12-22 11:01:03', 7);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1083, 2, 35, '2017-12-22 11:01:03', 21);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1084, 3, 36, '2017-12-22 11:01:03', 28);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1085, 2, 37, '2017-12-22 11:01:03', 10);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1086, 1, 38, '2017-12-22 11:01:03', 6);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1087, 1, 39, '2017-12-22 11:01:03', 22);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1088, 2, 40, '2017-12-22 11:01:03', 29);
INSERT INTO scores (id, id_game, id_user, dat_score, score) VALUES ( 1089, 3, 41, '2017-12-22 11:01:03', 11);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `token` varchar(256) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table des tokens';

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `u_name` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `experience` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pwd` varchar(256) NOT NULL,
  `can_change_name` tinyint(1) NOT NULL DEFAULT '0' 
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Table des joueurs';

--
-- Dumping data for table `users`
--
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (1, 'admin', 'admin@boite-email.com', 0, 1, '', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (2, 'jonas', 'smth@pouet.com', 1500, 1, '7ed8eda08e2d4a11a5459cc3453f54171591c0a39a113eaacc1f421deb5a9792', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (3, 'kristoph', 'kristoph@boite-email.com', 52, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (4, 'patrick', 'patrick@boite-email.com', 9532, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (5, 'marc', 'marc@boite-email.com', 100, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (6, 'emmanuelle', 'emmanuelle@boite-email.com', 50, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (7, 'morgan', 'email_user@boite-email.com', 980, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (8, 'nicolas', 'morgan@boite-email.com', 45, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (9, 'wafa', 'wafa@boite-email.com', 20, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (10, 'valerie', 'valerie@boite-email.com', 772, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (11, 'jb', 'jb@boite-email.com', 1025, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (12, 'romain', 'romain@boite-email.com', 315, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (13, 'maxime', 'maxime@boite-email.com', 330, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (14, 'sylvie', 'sylvie@boite-email.com', 15, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (15, 'mohamed', 'mohamed@boite-email.com', 146, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (16, 'nicolas2', 'nicolas2@boite-email.com', 774, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (17, 'christophe', 'christophe@boite-email.com', 12, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (18, 'pierre', 'pierre@boite-email.com', 3200, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (19, 'paul', 'paul@boite-email.com', 3, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (20, 'jacques', 'jacques@boite-email.com', 9, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (21, 'ploufplouf', 'poufpouf@boite-email.com', 1963, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (22, 'tagada', 'tagada@boite-email.com', 54, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (23, 'pifpaf', 'pifpaf@boite-email.com', 39, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (24, 'pinson', 'pinson@boite-email.com', 123, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (25, 'joris', 'joris@boite-email.com', 456, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (26, 'dieu', 'dieu@boite-email.com', 789, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (27, 'devil', 'devil@boite-email.com', 147, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (28, 'sainte', 'sainte@boite-email.com', 258, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (29, 'nitouch', 'nitouch@boite-email.com', 369, 0,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (30, 'poil', 'poil@boite-email.com', 753, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (31, 'ooo', 'ooo@boite-email.com', 951, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (32, 'nez', 'nez@boite-email.com', 357, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (33, 'un', 'un@boite-email.com', 159, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (34, 'poussin', 'poussin@boite-email.com', 751, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (35, 'egale', 'egale@boite-email.com', 359, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (36, 'deux', 'deux@boite-email.com', 759, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (37, 'colloc', 'colloc@boite-email.com', 351, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (38, 'cool', 'cool@boite-email.com', 349, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (39, 'coquille', 'coquille@boite-email.com', 183, 1,'', 0);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (40, 'calimero', 'calimero@boite-email.com', 167, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (41, 'sans', 'sans@boite-email.com', 1, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (42, 'chemisse', 'chemisse@boite-email.com', 2, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (43, 'bi', 'bi@boite-email.com', 3, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (44, 'gleux', 'gleux@boite-email.com', 4, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (45, 'moutarde', 'moutarde@boite-email.com', 5, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (46, 'deux', 'deux@boite-email.com', 6, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (47, 'maux', 'maux@boite-email.com', 7, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (48, 'see', 'see@boite-email.com', 8, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (49, 'you', 'you@boite-email.com', 9, 1,'', 1);
INSERT INTO users (id, u_name, email, experience, active, pwd, can_change_name) VALUES (50, 'play', 'play@boite-email.com', 0, 0,'',1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens` ADD PRIMARY KEY (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users` ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
